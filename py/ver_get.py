#!/usr/bin/python
# -*- coding: utf-8 -*-


import sys,getopt,urllib2,time
def down(num=0, wait=0):
    """
    每wait分下载一个，共num个
    """
    opener = urllib2.build_opener()
    opener.addheaders = [('User-agent', 'Mozilla/5.0')]
    for i in range(num):
        # url = 'http://www.ruanko.com/validateImage.jsp'
        url = 'https://bluessh.com/static/img/no-cache/passwd.png'
        # 'http://blog.onlybird.com/onlybird.php'
        # 'http://ssh2012.unssh.com/onlybird.php'
        # url = 'http://sso.chinaunix.net/imageCode.php?f=13&amp;amp;0.2560774655567494%22'
        print "download", i
        file("./code/%04d.jpg" % (wait*10 + i), "wb").write(opener.open(url).read())
        time.sleep(wait*60)

def usage():
    """Usage: ver_get [OPTION...] [files...]

Print shared library dependencies

  -h, --help              print this help and exit
  -V, --version           print version information and exit
  -n, --num n             total download n pics
  -w, --wait m            wait m min while download one
  -d, --debug             print debug information
  -v, --verbose           print all information"""
    print usage.__doc__


def main(argv):
    try:
        opts, args = getopt.getopt(argv, "hn:w:dvV",
            ["help", "num=", "wait=", "debug", "verbose", "version"])
    except getopt.GetoptError:
        usage()
        sys.exit(2)

    num  = 0
    wait = 0
    for opt,arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit()
        elif opt in ("-d", "--debug"):
            global _debug
            _debug = 1
        elif opt in ("-n", "--num"):
            num = int(arg)
        elif opt in ("-w", "--wait"):
            wait = int(arg)
    source = "".join(args)
    if num == 0:
        usage()
    down(num, wait)


if __name__ == "__main__":
    main(sys.argv[1:])


