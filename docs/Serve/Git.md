# Git

## 基本配置

```
# 用户配置
git config --global user.name "用户名"
git config --global user.email "邮箱"
git config --global init.defaultBranch main

# 查看配置
git config --list
git config user.name
git config user.email

# 别名配置
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
```

## 仓库初始化

```
# 创建新仓库
git init
git init project-name

# 克隆仓库
git clone <url>
git clone <url> <directory>
git clone -b <branch> <url>

# 添加远程仓库
git remote add origin <url>
git remote -v
git remote set-url origin <new-url>
```

## 基本操作

```
# 查看状态
git status
git status -s

# 添加文件
git add file.txt
git add .
git add -A
git add *.js

# 提交
git commit -m "提交信息"
git commit -am "提交信息"
git commit --amend

# 查看历史
git log
git log --oneline
git log --graph
git log -p
git log --stat
git log -5
```

## 分支操作

```
# 查看分支
git branch
git branch -r
git branch -a

# 创建分支
git branch <branch-name>
git checkout -b <branch-name>
git switch -c <branch-name>

# 切换分支
git checkout <branch-name>
git switch <branch-name>

# 删除分支
git branch -d <branch-name>
git branch -D <branch-name>
git push origin --delete <branch-name>

# 重命名分支
git branch -m <old-name> <new-name>
```

## 合并操作

```
# 合并分支
git merge <branch-name>
git merge --no-ff <branch-name>

# 变基操作
git rebase <branch-name>
git rebase -i HEAD~3

# 解决冲突
git status
# 编辑冲突文件
git add <resolved-file>
git commit

# 取消合并
git merge --abort
git rebase --abort
```

## 远程操作

```
# 拉取更新
git fetch
git fetch origin
git pull
git pull origin main

# 推送
git push
git push origin main
git push -u origin main
git push --force

# 远程分支
git push origin <branch-name>
git push origin --delete <branch-name>
git fetch -p
```

## 撤销操作

```
# 撤销工作区修改
git restore <file>
git checkout -- <file>

# 撤销暂存区
git restore --staged <file>
git reset HEAD <file>

# 撤销提交
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1

# 反向提交
git revert <commit-hash>
git revert HEAD
```

## 标签操作

```
# 创建标签
git tag v1.0.0
git tag -a v1.0.0 -m "版本1.0.0"
git tag -a v1.0.0 <commit-hash>

# 查看标签
git tag
git tag -l "v1.*"
git show v1.0.0

# 推送标签
git push origin v1.0.0
git push origin --tags

# 删除标签
git tag -d v1.0.0
git push origin --delete v1.0.0
```

## 储藏操作

```
# 储藏工作
git stash
git stash save "储藏信息"

# 查看储藏
git stash list
git stash show
git stash show -p

# 应用储藏
git stash apply
git stash apply stash@{0}
git stash pop

# 删除储藏
git stash drop
git stash clear
```

## 差异查看

```
# 查看差异
git diff
git diff HEAD
git diff --staged
git diff <commit1> <commit2>
git diff <branch1> <branch2>

# 查看文件差异
git diff <file>
git diff HEAD -- <file>
git diff <commit> -- <file>

# 统计差异
git diff --stat
git diff --shortstat
```

## 搜索和过滤

```
# 搜索代码
git grep "搜索内容"
git grep -n "搜索内容"
git grep --count "搜索内容"

# 搜索提交
git log --grep="关键词"
git log --author="作者名"
git log --since="2023-01-01"
git log --until="2023-12-31"

# 查看文件历史
git log --follow <file>
git blame <file>
```

## 子模块操作

```
# 添加子模块
git submodule add <url> <path>

# 初始化子模块
git submodule init
git submodule update

# 克隆带子模块的仓库
git clone --recursive <url>

# 更新子模块
git submodule update --remote
git submodule foreach git pull origin main

# 删除子模块
git submodule deinit <path>
git rm <path>
```

## 高级技巧

```
# 交互式添加
git add -i
git add -p

# 挑选提交
git cherry-pick <commit-hash>
git cherry-pick <commit1>..<commit2>

# 二分查找bug
git bisect start
git bisect bad
git bisect good <commit>

# 清理仓库
git clean -f
git clean -fd
git gc
git prune

# 查看引用日志
git reflog
git reflog show HEAD
```

## 配置文件

```
# .gitignore 常用规则
*.log
node_modules/
.env
dist/
build/
*.tmp
.DS_Store

# .gitconfig 常用配置
[user]
    name = Your Name
    email = your.email@example.com
[core]
    editor = vim
    autocrlf = input
[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
```

## 工作流程

```
# 功能分支工作流
git checkout -b feature/new-feature
# 开发代码
git add .
git commit -m "添加新功能"
git push origin feature/new-feature
# 创建Pull Request

# Git Flow工作流
git flow init
git flow feature start new-feature
git flow feature finish new-feature
git flow release start 1.0.0
git flow release finish 1.0.0

# GitHub Flow工作流
git checkout -b feature-branch
# 提交代码
git push origin feature-branch
# 创建Pull Request
# 合并后删除分支
```