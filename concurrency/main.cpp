#pragma once

#include "atm.h"
#include "bank_machine.h"
#include "dispatcher.h"
#include "interface_machine.h"
#include "queue.h"
#include "receiver.h"
#include "sender.h"
#include "TemplateDispatcher.h"
#include "type.h"

//int main()
//{
//    std::cout << "code ? shit !";
//    std::thread worker(
//        [&]()
//    {
//        std::vector<int> vec;
//
//        for (int i = 0; i < 10; i++)
//        {
//            vec.push_back(i);
//        }
//
//        for (auto i : vec)
//        {
//            std::cout << i << " ";
//        }
//    }
//    );
//    worker.join();
//    return 0;
//}
//void main_t()
void main()
{
    bank_machine bank;
    interface_machine interface_hardware;
    atm machine(bank.get_sender(), interface_hardware.get_sender());
    std::thread bank_thread(&bank_machine::run, &bank);
    std::thread if_thread(&interface_machine::run, &interface_hardware);
    std::thread atm_thread(&atm::run, &machine);
    messaging::sender atmqueue(machine.get_sender());
    bool quit_pressed = false;

    while (!quit_pressed)
    {
        char c = getchar();

        switch (c)
        {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            atmqueue.send(digit_pressed(c));
            break;

        case 'b':
            atmqueue.send(balance_pressed());
            break;

        case 'w':
            atmqueue.send(withdraw_pressed(50));
            break;

        case 'c':
            atmqueue.send(cancel_pressed());
            break;

        case 'q':
            quit_pressed = true;
            break;

        case 'i':
            atmqueue.send(card_inserted("acc1234"));
            break;
        }
    }

    bank.done();
    machine.done();
    interface_hardware.done();
    atm_thread.join();
    bank_thread.join();
    if_thread.join();
}