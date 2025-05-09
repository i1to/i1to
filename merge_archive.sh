#!/bin/bash

# 脚本用于将Archive仓库的内容合并到当前仓库
# 使用方法: ./merge_archive.sh [Archive仓库路径]

# 检查参数
if [ $# -ne 1 ]; then
    echo "使用方法: $0 [Archive仓库路径]"
    echo "例如: $0 ~/Archive"
    exit 1
fi

ARCHIVE_REPO=$1

# 检查Archive仓库是否存在
if [ ! -d "$ARCHIVE_REPO" ]; then
    echo "错误: Archive仓库路径 '$ARCHIVE_REPO' 不存在"
    exit 1
fi

# 检查当前目录是否有BOOKS和MUSIC文件夹
if [ ! -d "BOOKS" ]; then
    mkdir -p BOOKS
    echo "创建BOOKS文件夹"
fi

if [ ! -d "MUSIC" ]; then
    mkdir -p MUSIC
    echo "创建MUSIC文件夹"
fi

# 复制书籍文件
echo "正在复制书籍文件..."
if [ -d "$ARCHIVE_REPO/books" ]; then
    cp -r "$ARCHIVE_REPO/books/"* BOOKS/ 2>/dev/null
elif [ -d "$ARCHIVE_REPO/BOOKS" ]; then
    cp -r "$ARCHIVE_REPO/BOOKS/"* BOOKS/ 2>/dev/null
elif [ -d "$ARCHIVE_REPO/Books" ]; then
    cp -r "$ARCHIVE_REPO/Books/"* BOOKS/ 2>/dev/null
else
    echo "警告: 在Archive仓库中未找到books/BOOKS/Books文件夹"
fi

# 复制音乐文件
echo "正在复制音乐文件..."
if [ -d "$ARCHIVE_REPO/music" ]; then
    cp -r "$ARCHIVE_REPO/music/"* MUSIC/ 2>/dev/null
elif [ -d "$ARCHIVE_REPO/MUSIC" ]; then
    cp -r "$ARCHIVE_REPO/MUSIC/"* MUSIC/ 2>/dev/null
elif [ -d "$ARCHIVE_REPO/Music" ]; then
    cp -r "$ARCHIVE_REPO/Music/"* MUSIC/ 2>/dev/null
else
    echo "警告: 在Archive仓库中未找到music/MUSIC/Music文件夹"
fi

# 检查是否有其他重要文件夹需要合并
echo "检查其他可能的文件夹..."
for dir in "$ARCHIVE_REPO"/*; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        # 排除已处理的文件夹和隐藏文件夹
        if [[ "$dirname" != "books" && "$dirname" != "BOOKS" && "$dirname" != "Books" && 
              "$dirname" != "music" && "$dirname" != "MUSIC" && "$dirname" != "Music" && 
              "$dirname" != .* ]]; then
            echo "发现其他文件夹: $dirname"
            echo "是否要合并此文件夹? (y/n)"
            read answer
            if [ "$answer" = "y" ]; then
                if [ ! -d "$dirname" ]; then
                    mkdir -p "$dirname"
                    echo "创建 $dirname 文件夹"
                fi
                cp -r "$dir/"* "$dirname/" 2>/dev/null
                echo "已复制 $dirname 文件夹内容"
            fi
        fi
    fi
done

echo "合并完成!"
echo "请检查BOOKS和MUSIC文件夹中的内容是否正确。"
echo "如果需要，您可以使用git命令将更改提交到仓库。"
