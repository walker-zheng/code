#include <Poco/Net/TCPServer.h>
#include <Poco/String.h>
#include <Poco/StringTokenizer.h>
#include <Poco/HashMap.h>
#include <Poco/Util/ServerApplication.h>
#include <Poco/Util/Option.h>
#include <Poco/Util/OptionSet.h>
#include <Poco/Util/HelpFormatter.h>
#include <Poco/NumberParser.h>
#include <Poco/Format.h>
#include <Poco/ActiveMethod.h>
#include <Poco/ActiveDispatcher.h>

#include "ScopedLogMessage.h"

#include <iostream>

const int kNumRecieveBufferBytes = 2048;

class CommandProcessor
{
public:
    CommandProcessor(ScopedLogMessage & msg) :
        m_msg(msg)
    {
    }
    virtual ~CommandProcessor() {}
    virtual std::string Process(Poco::StringTokenizer & token, std::pair<int, int> & cursorPos)
    {
        return Poco::format("cursorPos={%d, %d}\n", cursorPos.first, cursorPos.second);
    }

protected:
    inline void Message(const std::string & msg) const
    {
        m_msg.Message(msg);
    }

private:
    CommandProcessor();
    CommandProcessor(const CommandProcessor &);
    CommandProcessor & operator = (const CommandProcessor &);

    ScopedLogMessage  & m_msg;
};

class SetProcessor : public CommandProcessor
{
public:
    SetProcessor(ScopedLogMessage & msg) :
        CommandProcessor(msg)
    {
    }
    virtual ~SetProcessor() {}
    virtual std::string Process(Poco::StringTokenizer & token, std::pair<int, int> & cursorPos)
    {
        Message("     SetProcessor::Process called.");
        std::string rtn;

        if (3 != token.count())
        {
            rtn = "ERROR: set command requires two arguments.\n";
        }
        else
        {
            int x, y;

            if (Poco::NumberParser::tryParse(token[1], x) && Poco::NumberParser::tryParse(token[2], y))
            {
                cursorPos.first = x;
                cursorPos.second = y;
                rtn = CommandProcessor::Process(token, cursorPos);
            }
            else
            {
                rtn = "ERROR: set command requires two integer arguments.\n";
            }
        }

        return rtn;
    }

private:
    SetProcessor();
    SetProcessor(const SetProcessor &);
    SetProcessor & operator = (const SetProcessor &);
};

class GetProcessor : public CommandProcessor
{
public:
    GetProcessor(ScopedLogMessage & msg) :
        CommandProcessor(msg)
    {
    }
    virtual ~GetProcessor() {}
    virtual std::string Process(Poco::StringTokenizer & token, std::pair<int, int> & cursorPos)
    {
        Message("     GetProcessor::Process called.");
        std::string rtn;

        if (1 != token.count())
        {
            rtn = "WARNING: get command does not need argument(s).\n";
        }

        rtn += CommandProcessor::Process(token, cursorPos);
        return rtn;
    }

private:
    GetProcessor();
    GetProcessor(const GetProcessor &);
    GetProcessor & operator = (const GetProcessor &);
};

class MoveProcessor : public CommandProcessor
{
public:
    MoveProcessor(ScopedLogMessage & msg) :
        CommandProcessor(msg)
    {
    }
    virtual ~MoveProcessor() {}
    virtual std::string Process(Poco::StringTokenizer & token, std::pair<int, int> & cursorPos)
    {
        Message("     MoveProcessor::Process called.");
        std::string rtn;

        if (3 != token.count())
        {
            rtn = "ERROR: move command requires two arguments.\n";
        }
        else
        {
            int x, y;

            if (Poco::NumberParser::tryParse(token[1], x) && Poco::NumberParser::tryParse(token[2], y))
            {
                cursorPos.first += x;
                cursorPos.second += y;
                rtn = CommandProcessor::Process(token, cursorPos);
            }
            else
            {
                rtn = "ERROR: move command requires two integer arguments.\n";
            }
        }

        return rtn;
    }

private:
    MoveProcessor();
    MoveProcessor(const MoveProcessor &);
    MoveProcessor & operator = (const MoveProcessor &);
};

class std::queue<int> : public Poco::ActiveDispatcher
{
public:
    std::queue<int>(ScopedLogMessage & msg) :
        process(this, &std::queue<int>::processImpl)
        , m_msg(msg)
    {
        m_msg.Message(" CommandDispatcher start");
        m_CursorPos.first = 0;
        m_CursorPos.second = 0;
        m_processorMap["set"] = new SetProcessor(msg);
        m_processorMap["get"] = new GetProcessor(msg);
        m_processorMap["move"] = new MoveProcessor(msg);
    }

    struct second_deleter
    {
        template <typename T>
        void operator()(const T & m) const
        {
            delete m.second;
        }
    };

    ~std::queue<int>()
    {
        for_each(m_processorMap.begin(), m_processorMap.end(), second_deleter());
        m_msg.Message(" CommandDispatcher end");
    }

    Poco::ActiveMethod<std::string, std::string,
        std::queue<int>, Poco::ActiveStarter<Poco::ActiveDispatcher>> process;

private:
    // Single Threaded Execution pattern
    std::string processImpl(const std::string & str)
    {
        std::string rtn;
        Poco::StringTokenizer token(str, " ");

        if (token.count())
        {
            Poco::HashMap<std::string, CommandProcessor *>::Iterator itr = m_processorMap.find(token[0]);

            if (m_processorMap.end() != itr)
            {
                rtn = itr->second->Process(token, m_CursorPos);
            }
            else
            {
                rtn = "ERROR: unknown command!\n";
            }
        }

        return rtn;
    }

    std::pair<int, int>     m_CursorPos;
    ScopedLogMessage    &   m_msg;
    Poco::HashMap<std::string, CommandProcessor *>   m_processorMap;
};

class TCPConnection : public Poco::Net::TCPServerConnection
{
public:
    TCPConnection(const Poco::Net::StreamSocket & s, ScopedLogMessage & msg, std::queue<int> & dispatcher) :
        Poco::Net::TCPServerConnection(s)
        , m_msg(msg)
        , m_dispatcher(dispatcher)
    {
        m_msg.Message(Poco::format("   TCPConnection start (%s)", socket().peerAddress().toString()));
    }

    ~TCPConnection()
    {
        m_msg.Message(Poco::format("   TCPConnection end   (%s)", socket().peerAddress().toString()));
    }

    void run(void)
    {
        const std::string prompt("TCPServer> ");
        char buffer[kNumRecieveBufferBytes + 1] = { 0 };
        int numRead = 1;

        for (; numRead;)
        {
            try
            {
                socket().sendBytes(prompt.data(), static_cast<int>(prompt.length()));
                numRead = socket().receiveBytes(buffer, kNumRecieveBufferBytes);

                if (numRead)
                {
                    buffer[numRead] = 0;
                    std::string str(buffer);
                    Poco::replaceInPlace(str, "\r", "");
                    Poco::replaceInPlace(str, "\n", "");
                    Poco::toLowerInPlace(str);
                    m_msg.Message(Poco::format("    TCPConnection::run received: %s", str));
                    Poco::ActiveResult<std::string> result = m_dispatcher.process(str);
                    result.wait();

                    if (result.data().length())
                    {
                        socket().sendBytes(result.data().c_str(), static_cast<int>(result.data().length()));
                    }
                }
            }
            catch (Poco::Exception &)
            {
            }
        }
    }

private:
    ScopedLogMessage  & m_msg;
    std::queue<int>  &  m_dispatcher;
};

class VAConnectionFactory : public Poco::Net::TCPServerConnectionFactory
{
public:
    VAConnectionFactory(ScopedLogMessage & msg, std::queue<int> & dispatcher) :
        m_log(msg)
        , m_queue(dispatcher)
    {
        m_log.Message("  TCPConnectionFactory start");
    }

    ~VAConnectionFactory()
    {
        m_log.Message("  TCPConnectionFactory end");
    }

    Poco::Net::TCPServerConnection * createConnection(const Poco::Net::StreamSocket & socket)
    {
        m_log.Message("  TCPConnectionFactory createConnection");
        return new TCPConnection(socket, m_log, m_queue);
    }

private:
    ScopedLogMessage  & m_log;
    std::queue<int>  &  m_queue;
};

//----------------------------------------
//  MyTCPServer
//      To test the MyTCPServer you can use any terminal wuth "telnet localhost 9923".
//----------------------------------------
class MyTCPServer : public Poco::Util::ServerApplication
{
public:
    MyTCPServer() :
        m_helpRequested(false)
    {
    }

    ~MyTCPServer()
    {
    }

protected:
    void initialize(Poco::Util::Application & self)
    {
        loadConfiguration(); // load default configuration files, if present
        Poco::Util::ServerApplication::initialize(self);
    }

    void uninitialize()
    {
        Poco::Util::ServerApplication::uninitialize();
    }

    void defineOptions(Poco::Util::OptionSet & options)
    {
        Poco::Util::ServerApplication::defineOptions(options);
        options.addOption(
            Poco::Util::Option("help", "h", "display help information on command line arguments")
            .required(false)
            .repeatable(false));
    }

    void handleOption(const std::string & name, const std::string & value)
    {
        Poco::Util::ServerApplication::handleOption(name, value);

        if (name == "help")
        {
            m_helpRequested = true;
        }
    }

    void displayHelp()
    {
        Poco::Util::HelpFormatter helpFormatter(options());
        helpFormatter.setCommand(commandName());
        helpFormatter.setUsage("OPTIONS");
        helpFormatter.setHeader("TCP server sample application.");
        helpFormatter.format(std::cout);
    }

    int main(const std::vector<std::string> & args)
    {
        ScopedLogMessage msg(" main() ", "start", "end");

        if (m_helpRequested)
        {
            displayHelp();
        }
        else
        {
            std::queue<int> commandDispatcher(msg);
            unsigned short port = (unsigned short)config().getInt("MyTCPServer.port", 9923);
            Poco::Net::ServerSocket svs(port);
            Poco::Net::TCPServer srv(new VAConnectionFactory(msg, commandDispatcher),
                svs, new Poco::Net::TCPServerParams);
            srv.start();
            // wait for CTRL-C or kill
            waitForTerminationRequest();
            srv.stop();
        }

        return Poco::Util::Application::EXIT_OK;
    }

private:
    bool    m_helpRequested;
};

//----------------------------------------
//  main
//----------------------------------------
POCO_SERVER_MAIN(MyTCPServer)