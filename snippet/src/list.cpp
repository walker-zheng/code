/* -*- C++ -*- */

// Time-stamp: <2012-08-07 22:35:36 Tuesday by root>

/**
 * @file list.cpp
 * @author ahei
 */

#include <stdlib.h>
#include <getopt.h>
#include <iostream>
#include "list.h"
#include "util.h"


using namespace std;

static void usage(int code = 1);

int main(int argc, char * argv[])
{
    int opt = 0;
    int longindex = 0;
    const char optstring[] = ":h";
    const option longopts[] =
        {{"help", no_argument, NULL, 'h'},
         {NULL  , no_argument, NULL, 0}};

    std::string arg;

    while ((opt = getopt_long_only(argc, argv, optstring, longopts, &longindex)) != -1)
    {
        switch(opt)
        {
        case 'h':
            usage(0);
            break;

        case ':':
            arg = argv[optind-1];
            std::cerr << "Option `" << arg << "' need argument.\n";
            usage();
            break;

        case '?':
            std::cerr << "Invalid option `" << argv[optind-1] << "'.\n";
            usage();
            break;
        }
    }

    // other non-option arguments
    for (int i = optind; i < argc; i++)
    {
        std::cout << argv[i] << std::endl;
    }

    return 0;
}

void usage(int code /* = 1 */)
{
    std::ostream * os = NULL;

    if (code != 0)
    {
        os = &std::cerr;
    }
    else
    {
        os = &std::cout;
    }

    *os << "usage: "
        << "list test" << " [OPTIONS]\n" << std::endl;

    *os << "This program .\n" << std::endl;

    *os << "Options:" << std::endl;
    *os << "\t-h, --help" << std::endl;
    *os << "\t\tOutput this help." << std::endl;
    *os << std::endl;

    *os << "Last Make: " << __DATE__ << " " << __TIME__ << "." << std::endl;

    exit(code);
}
