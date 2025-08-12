# UV



## 安装卸载更新



### 安装

``` shell
# install
curl -LsSf https://astral.sh/uv/install.sh | sh

# shell
echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc
source $HOME/.local/bin/env
source ~/.zshrc
```



### 更新

``` shell
# .zshrc最前面加两行
autoload -Uz compinit
compinit


# add github token
echo 'export UV_GITHUB_TOKEN=token' >> ~/.zshrc
source ~/.zshrc

# uv self update

```

### 卸载

```shell
uv cache clean
rm -r "$(uv python dir)"
rm -r "$(uv tool dir)"

rm ~/.local/bin/uv ~/.local/bin/uvx
```

### 换源

```shell
mkdir ~/.config/uv && vim ~/.config/uv/uv.toml

# 写入以下配置项
[[index]]
url = "https://mirrors.aliyun.com/pypi/simple/"
default = true

```


## 项目管理

``` shell
uv init myproj		#初始化项目

uv python pin 3.11

uv venv --python 3.11

uv add pandas		#添加依赖， 只能在虚拟环境中uv add

uv remove pandas		#移除依赖

uv sync		#同步依赖

uv lock		#锁定 
uv lock --upgrade		#解锁

uv tree		#查看依赖树
```



## 临时运行

```shell
# 临时运行命令行工具
uvx pycowsay 'hello'
uvx ruff check .


# 为临时的脚本绑定依赖
uv add --script hello.py request
uv run hello.py
```



## 工具永久全局可用

```shell
uv tool install ruff		#只适用于cli 包

# 全局依赖包缺失依赖
uv pip install --python /home/$USER/.local/share/uv/tools/$TOOL/bin/python $PACKAGE
## $USER 当前系统用户
## $TOOL 全局工具名
## $PACKAGE 缺失依赖包名

```



## 版本管理

``` shell
uv python install 3.11		#下载安装指定版本的Python

uv python list		#查看可用的Python版本

uv python pin 3.11		#讲项目锁定到某个Python版本

uv venv --python 3.12.0		#创建虚拟环境并指定Python版本

uv run --python 3.12 main.py		#自动下载并使用Python

source .venv/bin/activate		#激活虚拟环境

deactivate 		#退出虚拟环境
```

