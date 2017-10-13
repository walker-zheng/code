#! /usr/bin/bash

function usage()
{
    echo
}
function usage()
{
    cat <<EOF
Usage:
    publish [op]
Op:
    [none]  更新gitbook
    init    -i, 初始化，安装插件
    help    -h, 使用说明
EOF
}
function gen_summary()
{
    (echo '# SUMMARY';echo '* [简介](README.md)';echo '* [目录](SUMMARY.md)';find . -maxdepth 2 -type f -name '*\.md'|sed 's,^./,,'|grep -vE 'SUMMARY|README'|sed 's,\(.*\)\.md,* [\1](\1.md),') > SUMMARY.md
}
function init()
{
    git init
    cat > book.json <<EOF
{
    "title": "个人日志",
    "description": "日常记录",
    "author": "walker.zheng<mykulou@gmail.com>",
    "plugins": [
        "-search",
        "-sharing",
        "-highlight",
        "search-plus",
        "fontsettings",
        "tbfed-pagefooter",
        "splitter",
        "advanced-emoji",
        "emphasize",
        "anchor-navigation-ex",
        "favicon",
        "todo"
    ]
}
EOF
    git add .
    git commit -m 'init git repo'
    (echo '_book'; echo 'node_modules'; ) > .gitignore
    git add .gitignore
    git commit -m 'init gitbook ignore'
    gitbook install > /dev/null
    gen_summary
    gitbook init
    gitbook build > /dev/null
    git add .
    git commit -m 'init gitbook repo'
}
function publish()
{
    git checkout master
    gen_summary
    rm _book/*.html
    git add . && git commit -m 'update master'
    gitbook build > /dev/null
    git checkout gh-pages
    git pull origin gh-pages --rebase
    rm *.html
    cp _book/*.html .
    git add . && git commit -m 'update pages'  && git push
    git checkout master && git push
}

[ $# == 0 ] && publish
VERSION='1.0.0 by walker.zheng'
until [ -z "$1" ]
do
    [ "$1" == "init" ] && init
    [ "$1" == "summary" ] && gen_summary
    [ "$1" == "help" ] &&  usage
    [ "$1" == "version" ] && (echo -e 'publish ' $VERSION | GREP_COLOR='01;36' grep --color=always .)
    [ "$1" == "-i" ] && init
    [ "$1" == "-h" ] && usage
    [ "$1" == "-v" ] && (echo -e 'publish ' $VERSION | GREP_COLOR='01;36' grep --color=always .)
    shift
done
