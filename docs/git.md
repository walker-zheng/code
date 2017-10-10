## Git & gitflow 命令

# git子树合并和拆分

1. 引入外部版本库

   ```bash
   # 准备库
   git --git-dir=/path/to/util.git init --bare
   git --git-dir=/path/to/main.git init --bare
   # 本地检出
   git clone /path/to/util.git
   git clone /path/to/main.git
   # 注册远程版本库，&fetch
   git remote add util /path/to/util.git
   git remote -v
   git fetch util
   # 检出为分支
   git checkout -b util-branch util/master
   ```

2. 子目录方式合并外部版本库

   ```
   # 合并为子目录
   git cat-file -p util-branch
   git checkout master
   # 更新index，检出到子目录(工作区)，保存index(暂存区)
   git read-tree --prefix=lib util-branch
   git checkout -- lib
   git write-tree      # 2153518409d218609af40babededec6e8ef51616 (tree-id)
   git cat-file -p 2153518409d218609af40babededec6e8ef51616 #
   # 以revid为parents，对树 2153518409d218609af40babededec6e8ef51616 执行提交
   git rev-parse HEAD  # 911b1af2e0c95a2fc1306b8dea707064d5386c2e
   git rev-parse util-branch   # 12408a149bfa78a4c2d4011f884aa2adb04f0934
   echo "subtree merge" | \
   git commit-tree 2153518409d218609af40babededec6e8ef51616 \
   -p 911b1af2e0c95a2fc1306b8dea707064d5386c2e \
   -p 12408a149bfa78a4c2d4011f884aa2adb04f0934
   # 62ae6cc3f9280418bdb0fcf6c1e678905b1fe690 (commitid)
   git reset 62ae6cc3f9280418bdb0fcf6c1e678905b1fe690 # 重置为master
   git cat-file -p HEAD        # 显示parent tree
   ```

3. 利用子树合并跟踪上游改动

   ```
   # 获取远程版本库改动
   git checkout util-branch
   git pull
   git checkout master
   # 使用subtree合并策略
   git merge -s subtree util-branch
   git merge -Xsubtree=lib util-branch     # git 1.7+
   git log --graph --pretty=oneline
   ```

4. 子树拆分

   * 反向过程异常复杂,子树拆分的大致过程是：
     1. 找到要导出的目录的提交历史，并反向排序。
     2. 依次对每个提交执行下面的操作：
     3. 找出提交中导出目录对应的 tree id。
     4. 对该 tree id 执行 git commit-tree 。
     5. 执行 git commit-tree 要保持提交信息还要重新设置提交的 parents。

# subtree目录拆分

```
# 1. Prepare the old repo
pushd <big-repo>
git subtree split -P <name-of-folder> -b <name-of-new-branch>
popd
#Note: <name-of-folder> must NOT contain leading or trailing characters btoa != ./btoa/
# 2. Create the new repo
mkdir <new-repo>
pushd <new-repo>
git init
git pull </path/to/big-repo> <name-of-new-branch>
# 3. Link the new repo to Github or wherever
git remote add origin <git@github.com:my-user/new-repo.git>
git push origin -u master
# 4. Cleanup, if desired
popd # get out of <new-repo>
pushd <big-repo>
git rm -rf <name-of-folder>
```

# patch 补丁

## diff标准补丁

```
git diff master > patch
git apply patch
git apply --check       #查看补丁是否能够干净顺利地应用到当前分支中
```

## git补丁

```
#   不仅有diff的信息，还有提交者，时间等等，直接可以发送的E-mail文件
skull@walker:boost_test(master) $ git format-patch -M fbb71ef
0001-add-boost_test-split-log-to-wiki-repo.patch
0002-clean-mod-for-apue.2e-repo.patch
#   -M选项表示这个patch要和那个分支比对，每次提交生成一个patch。
git am 0001-Fix1.patch      #git am会给出提示，git am -3进行三方合并
```



