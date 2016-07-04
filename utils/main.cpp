// NotificationServer.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <redisclient\redisclient.h>
#include <boost/asio/io_service.hpp>
#include <boost/asio/ip/address.hpp>
#include <redisclient/redissyncclient.h>
#include "AppConfig.h"
#include "version.h"
#include "SessionManager.h"
#include "ServerLogic.h"
#include <Poco/Util/ServerApplication.h>
#include <Poco/Util/OptionSet.h>
#include <Poco/Util/HelpFormatter.h>
#include <thread>
#include <Windows.h>
#include <Dbghelp.h>
using namespace Poco::Util;
void make_minidump(EXCEPTION_POINTERS * e)
{
    auto hDbgHelp = LoadLibraryA("dbghelp");

    if (hDbgHelp == nullptr)
    {
        return;
    }

    auto pMiniDumpWriteDump = (decltype(&MiniDumpWriteDump))GetProcAddress(hDbgHelp, "MiniDumpWriteDump");

    if (pMiniDumpWriteDump == nullptr)
    {
        return;
    }

    char name[MAX_PATH];
    {
        auto nameEnd = name + GetModuleFileNameA(GetModuleHandleA(0), name, MAX_PATH);
        SYSTEMTIME t;
        GetSystemTime(&t);
        wsprintfA(nameEnd - strlen(".exe"),
            "_%4d%02d%02d_%02d%02d%02d.dmp",
            t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond);
    }
    auto hFile = CreateFileA(name, GENERIC_WRITE, FILE_SHARE_READ, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

    if (hFile == INVALID_HANDLE_VALUE)
    {
        return;
    }

    MINIDUMP_EXCEPTION_INFORMATION exceptionInfo;
    exceptionInfo.ThreadId = GetCurrentThreadId();
    exceptionInfo.ExceptionPointers = e;
    exceptionInfo.ClientPointers = FALSE;
    auto dumped = pMiniDumpWriteDump(
        GetCurrentProcess(),
        GetCurrentProcessId(),
        hFile,
        MINIDUMP_TYPE(MiniDumpWithIndirectlyReferencedMemory | MiniDumpScanMemory),
        e ? &exceptionInfo : nullptr,
        nullptr,
        nullptr);
    CloseHandle(hFile);
    return;
}

LONG CALLBACK unhandled_handler(EXCEPTION_POINTERS * e)
{
    make_minidump(e);
    return EXCEPTION_CONTINUE_SEARCH;
}

class AnalyseServer : public Poco::Util::ServerApplication
    /// The main application class.
    ///
    /// This class handles command-line arguments and
    /// configuration files.
    /// Start the AnalyseServer executable with the help
    /// option (/help on Windows, --help on Unix) for
    /// the available command line options.
    ///
    /// To use the sample configuration file (AnalyseServer.properties),
    /// copy the file to the directory where the AnalyseServer executable
    /// resides. If you start the debug version of the AnalyseServer
    /// (AnalyseServerd[.exe]), you must also create a copy of the configuration
    /// file named AnalyseServerd.properties. In the configuration file, you
    /// can specify the port on which the server is listening (default
    /// 9977) and the format of the date/time string sent back to the client.
    ///
    /// To test the AnalyseServer you can use any telnet client (telnet localhost 9977).
{
public:
    AnalyseServer() : _helpRequested(false)
    {
    }
    ~AnalyseServer()
    {
    }
protected:
    void initialize(Application & self)
    {
        loadConfiguration(); // load default configuration files, if present
        ServerApplication::initialize(self);
    }
    void uninitialize()
    {
        ServerApplication::uninitialize();
    }
    void defineOptions(OptionSet & options)
    {
        ServerApplication::defineOptions(options);
        options.addOption(
            Option("help", "h", "display help information on command line arguments")
            .required(false)
            .repeatable(false));
    }
    void handleOption(const std::string & name, const std::string & value)
    {
        ServerApplication::handleOption(name, value);

        if (name == "help")
        {
            _helpRequested = true;
        }
    }
    void displayHelp()
    {
        HelpFormatter helpFormatter(options());
        helpFormatter.setCommand(commandName());
        helpFormatter.setUsage("OPTIONS");
        helpFormatter.setHeader("An echo server implemented using the Reactor and Acceptor patterns.");
        helpFormatter.format(std::cout);
    }
    int main(const std::vector<std::string> & args)
    {
        if (_helpRequested)
        {
            displayHelp();
        }
        else
        {
            AppConfig::instance().load();
            AppConfig::instance().setLogger(Application::instance().logger(), AppConfig::ELog_FILE, (Poco::Message::Priority)config().getInt("logPrio", 6));
            LogStream logStream(Application::instance().logger());
            logStream.information() << getVersion() << std::endl;

            if (config().getBool("application.runAsService", false) || config().getBool("application.runAsDaemon", false))
            {
                // config().setString("application.configDir", config().getString("application.dir"));
            }

            ServerLogic serverLogic;
            SessionManager sessionManager(&serverLogic);
            serverLogic.setSessionManager(&sessionManager);
            sessionManager.init();
            serverLogic.init();
            std::thread serverLogicThread(&ServerLogic::run, &serverLogic);
            std::thread thread([&sessionManager]()
            {
                sessionManager.keepSessionsAlive();
            });
            // Thread thread;
            //  thread.start(RGServiceMgr::getInstance()->loadConfig());
            // wait for CTRL-C or kill
            waitForTerminationRequest();
            sessionManager.stop();
            serverLogic.done();
            // Stop the SocketReactor
            //  RGServiceMgr::getInstance()->stop();
            //  RGServiceMgr::destoryInstance();
            thread.join();
            serverLogicThread.join();
        }

        return Application::EXIT_OK;
    }
private:
    bool _helpRequested;
};

int redix_test()
{
    boost::asio::ip::address address = boost::asio::ip::address::from_string("127.0.0.1");
    const unsigned short port = 6379;
    boost::asio::io_service ioService;
    RedisSyncClient redis(ioService);
    std::string errmsg;

    if (!redis.connect(address, port, errmsg))
    {
        std::cerr << "Can't connect to redis: " << errmsg << std::endl;
        return EXIT_FAILURE;
    }

    RedisValue result;
    result = redis.command("SET", "key", "value");

    if (result.isError())
    {
        std::cerr << "SET error: " << result.toString() << "\n";
        return EXIT_FAILURE;
    }

    result = redis.command("GET", "key");

    if (result.isOk())
    {
        std::cout << "GET: " << result.toString() << "\n";
        return EXIT_SUCCESS;
    }
    else
    {
        std::cerr << "GET error: " << result.toString() << "\n";
        return EXIT_FAILURE;
    }
}

int main(int argc, char ** argv)
{
    SetUnhandledExceptionFilter(unhandled_handler);
    AnalyseServer app;
    return app.run(argc, argv);
}