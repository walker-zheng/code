#! /usr/bin/bash

#gitbook install && gitbook init        # 第一次执行时候


(echo '# SUMMARY';echo '* [简介](README.md)';echo '* [目录](SUMMARY.md)';find wiki -name '*.md'|sed 's,\(.*\)\.md,* [\2](\2.md),') >SUMMARY.md
git add . && git commit -m 'update master' 
gitbook build && git checkout gh-pages && rm *.html && cp _book/*.html . && cp -R _book/gitbook . && git add . && git commit -m 'update pages' && git checkout master && git push --all
