#pragma once
#include <iostream>

#include "type.h"
#include "receiver.h"
#include "dispatcher.h"
class interface_machine {
    messaging::receiver incoming;
    std::mutex iom;
public:
    void done()
    {
        get_sender().send(messaging::close_queue());
    }
    void run()
    {
        try
        {
            for (;;)
            {
                incoming.wait()
                .handle<issue_money>(
                    [&](issue_money const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout << "Issuing "
                                  << msg.amount;
                    }
                }
                )
                .handle<display_insufficient_funds>(
                    [&](display_insufficient_funds const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout << "Insufficient funds";
                    }
                }
                )
                .handle<display_enter_pin>(
                    [&](display_enter_pin const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout
                                << "Please enter your PIN (0-9)"
                               ;
                    }
                }
                )
                .handle<display_enter_card>(
                    [&](display_enter_card const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout << "Please enter your card (I)"
                                 ;
                    }
                }
                )
                .handle<display_balance>(
                    [&](display_balance const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout
                                << "The balance of your account is "
                                << msg.amount;
                    }
                }
                )
                .handle<display_withdrawal_options>(
                    [&](display_withdrawal_options const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout << "Withdraw 50? (w)";
                        std::cout << "Display Balance? (b)"
                                 ;
                        std::cout << "Cancel? (c)";
                    }
                }
                )
                .handle<display_withdrawal_cancelled>(
                    [&](display_withdrawal_cancelled const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout << "Withdrawal cancelled"
                                 ;
                    }
                }
                )
                .handle<display_pin_incorrect_message>(
                    [&](display_pin_incorrect_message const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout << "PIN incorrect";
                    }
                }
                )
                .handle<eject_card>(
                    [&](eject_card const & msg)
                {
                    {
                        std::lock_guard<std::mutex> lk(iom);
                        std::cout << "Ejecting card";
                    }
                }
                );
            }
        }
        catch (messaging::close_queue &)
        {
        }
    }
    messaging::sender get_sender()
    {
        return incoming;
    }
};
