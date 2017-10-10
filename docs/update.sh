#! /usr/bin/bash

#gitbook install && gitbook init        # 第一次执行时候


(echo '# SUMMARY';echo '* [简介](README.md)';echo '* [目录](SUMMARY.md)';find . -name '*.md'|sed 's,\(.*\)\.md,* [\1](\1.md),') >SUMMARY.md
git add . && git commit -m 'update master' 
gitbook build && rm *.html && cp _book/*.html . && cp -R _book/gitbook . && git add . && git commit -m 'update docs' && git push --all
