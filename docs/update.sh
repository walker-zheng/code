#! /usr/bin/bash

#gitbook install && gitbook init        # 第一次执行时候


(echo '# SUMMARY';echo '* [简介](README.md)';echo '* [目录](SUMMARY.md)';ls *.md|sed 's,\(.*\)\.md,* [\1](\1.md),') |grep -vE 'README|SUMMARY' > SUMMARY.md
git add . && git commit -m 'update master' 
rm -rf {_book/,}*.html && gitbook build && cp _book/*.html . && cp -R _book/gitbook . && git add . && git commit -m 'update docs' && git push --all
