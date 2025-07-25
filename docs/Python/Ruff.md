# Ruff

## check

```shell
ruff check .                        # 检查当前目录（以及任何子目录）中的所有文件
ruff check path/to/code/            # 对 `/[path]()/[to]()/[code]()`（及任何子目录）中的所有文件进行检查
ruff check path/to/code/*.py        # 检查 `/[path]()/[to]()/[code]()` 中的所有 `.[py]()` 文件
ruff check path/to/code/to/file.py  # 检查 `[file]().[py]()`
ruff check @arguments.txt           # 使用输入文件 Lint，将其内容视为以新行分隔的命令行参数。

ruff check --fix test.py 
>> Found 1 error (1 fixed, 0 remaining).

ruff check --watch		#实时check当前workspace

```


## format
```shell
ruff format .                        # 格式化当前目录（及任何子目录）中的所有文件
ruff format path/to/code/            # 格式化 `/path/to/code`（及任何子目录）中的所有文件
ruff format path/to/code/*.py        # 格式化 `/[path]()/[to]()/[code]()` 中的所有 `.[py]()` 文件
ruff format path/to/code/to/file.py  # 格式化 `file.py`.
ruff format @arguments.txt           # 使用输入文件格式，将其内容视为以新行分隔的命令行参数。
```


##  config

### vscode config
```
"[python]": {                                        // 仅对 python 文件生效
    "editor.defaultFormatter": "charliermarsh.ruff", // 默认使用 Ruff 格式化
    "editor.formatOnSave": true,                     // 保存时自动格式化
    "editor.codeActionsOnSave": {
        "source.fixAll.ruff": "explicit",            // 保存时自动修复可修复的 lint 错误
        "source.organizeImports.ruff": "explicit",   // 保存时自动排序 import 语句
    }
},
"notebook.formatOnSave.enabled": true,               // notebook 保存时自动格式化
"notebook.codeActionsOnSave": {
    "source.fixAll": true,                           // notebook 保存时自动修复可修复的 lint 错误
    "source.organizeImports": true                   // notebook 保存时自动排序 import 语句
}
```

### toml config
Ruff 的配置也很简单，支持在 pyproject.toml 或 ruff.toml 中配置，这里以 PEP518 推荐的 pyproject.toml 为例

``` toml
[tool.ruff]
line-length = 120  # 代码最大行宽
select = [         # 选择的规则
    "F",
    "E",
    "W",
    "UP",
]
ignore = ["F401"]  # 忽略的规则
```