#!/bin/bash

# 更新 _sidebar.md 的脚本
echo "开始更新 _sidebar.md..."

# 进入 docs 目录
cd docs

# 生成新的 sidebar 内容
cat > _sidebar.md << 'EOF'
EOF

# 遍历目录并添加到 sidebar
for dir in */; do
    if [[ "$dir" != "_"* && "$dir" != "assets/" ]]; then
        dir_name=${dir%/}
        echo "" >> _sidebar.md
        echo "* **$dir_name**" >> _sidebar.md
        
        # 查找该目录下的 .md 文件
        for file in "$dir"*.md; do
            if [[ -f "$file" ]]; then
                filename=$(basename "$file" .md)
                echo "  * [$filename]($file)" >> _sidebar.md
            fi
        done
    fi
done

echo "" >> _sidebar.md

cd ..

echo "✓ _sidebar.md 已更新"
echo "新内容："
cat docs/_sidebar.md
