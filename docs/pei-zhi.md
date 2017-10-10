# windows必备

1. vs/cmake /msys2/cygwin/notepad++/stardict/Everything/BeyondCompare/strokeit
2. sumatraPDF/KMSpico/MPC/7-zip/IrfanView/LICEcap/Evernote/WinCDEmu
3. firefox/Chrome/迅雷/搜狗/QQ/网易云音乐/Office/Project/Visio
4. XAMPP/redmine/gogs/gitweb/RedisDesktopManager/Github/setupFactory/AdvancedInstaller
5. depends/procmon/procexp/vmmap/SpaceSniffer/PdgCntEditor/TinyPDF
6. EASEUS

# firefox插件

1. adblock plus
2. all-in-one sidebar
3. DownThemAll
4. Roomy Bookmarks Toolbar
5. Tree Style Tab
6. Video DownloaderHelper
7. epubreader/markdownViewer/saveasPDF/evernote

# chrome插件

1. 广告终结者
2. Video Downloader professional
3. evernote

# vs安装库

1. vcpkg  folly/boost

# vs插件

1. Advanced Installer 打包工具
2. Astyle 格式化
3. Github & Bitbucket 代码管理
4. Indent Guides 括号对齐
5. Visual Assist X
6. Productivity Power Tools
7. add exsiting projects批量添加项目
8. Visual Leak Detector/dr.memory
9. clangfomart/pvs-studio
10. cppcheck/cppclean/cinclude2dot
11. ForceUTF8 with bom
12. review assistant

# notepad++插件

1. JSTool
2. Location Navigate
3. Nppexport 彩色格式输出rtf
4. Function list
5. Session

# msys2

1. git/git-flow/gitbook/mercurial
2. openssh/wget/curl/pacman/rsync:q
3. autoconf/automake
4. vim/gcc/sed/awk/bash-completion
5. sshd

# cygwin sshd

1. ssh-host-config 配置 添加 用户 cyg\_server和sshd
2. ssh-keygen 生成 rsa key
3. /etc/sshd\_config 中打开key验证
4. cygrunsrv: Error starting a service: QueryServiceStatus: Win32 error 1062: 解决办法

   ```
   mkpasswd -l > /etc/passwd
   mkgroup -l > /etc/group
   cygrunsrv -R sshd
   ssh-host-config -y
   cygrunsrv -S sshd
   ```

# gogs GIT服务器web

1. 下载windows版zip包
2. 安装mysql，登录并建DB：mysql -u root; create database gogs;
3. 安装openssh： cygwin中，ssh-host-config安装sshd服务，cygrunsrv -S sshd启动
4. 安装gogs服务：
   * `sc create gogs start= auto binPath= ""C:\gogs\gogs.exe" web --config "C:\gogs\conf\app.ini""`
5. 启动服务： net start gogs
6. localhost:3000配置web服务

# markdown+gitbook 文档写作

* sublime text/notepad++中，编写markdown文档，浏览器中预览：

* firefox安装markdown here插件，导出为html；

* firefox安装save as PDF插件，打印html为PDF；

* chrome虚拟打印机打印为PDF

* DocBlockr生成模板，编写文档;

* gitbook-cli编译生成markdown

  * calibre\(for ebook-convert\)，并添加到PATH中；
  * nodejs
  * gitbook

```
npm install gitbook-cli -g
gitbook init && gitbook build && gitbook pdf
gitbook install # 安装所需插件
gitbook serve
```

# doxygen+global+graphviz+htmlhelp+easy chm 注释文档化

* gtags生成交叉引用；

  `find . -name "*.[ch]" > gtags.files && gtags`

* global浏览查找 `global -u`

* doxygen格式，生成文档 `doxygen -g && doxygen`

```
EXTRACT_ALL = YES
RECURSIVE = YES
SOURCE_BROWSER = YES
USE_HTAGS = YES
DOXYFILE_ENCODING=GBK
OUTPUT_LANGUAGE=chinese 
INPUT_ENCODING=GBK
HAVE_DOT
UML_LOOK
CALL_GRAPH
CALLER_GRAPH
```

* graphviz生成流程图；

* Easy chm 编译成chm文档，或者配置doxyfile打开chm生成选项

# C++库：

1. poco 
2. boost 
3. catch 测试
4. timing wheel \(poco中有类似实现\)
5. event queue \(poco中有类似实现\)
6. concurrentqueue
7. cpp\_redis
8. single\_file\_libs
9. cpp-netlib

# C++ samples：

1. poco-examples
2. modern-cpp-features
3. awesome-modern-cpp

# boost （在mingw64编译）

* `./bootstrap.sh`           // 编译 bjam x64，不行就用 x64 vs cmd编译

*  修改 tools/build/v2/user-config.jam：

        `using gcc : : x86_64-w64-mingw32-g++.exe ;`

* 编译boost

`./bjam target-os=windows architecture=x86 address-model=64 toolset=gcc    `

`./b2 --toolset=gcc target-os=windows --build-dir=/cygdrive/c/whatever/boost_build variant=debug,release link=static runtime-link=static architecture=x86 address-model=64 threadapi=win32 --layout=tagged --without-mpi --stagedir=lib/win64gcc -j4 stage`



