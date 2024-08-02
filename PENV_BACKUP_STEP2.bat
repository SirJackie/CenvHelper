@echo off

chcp 65001
cls

echo "---------- BACKUP ----------"
echo "确保你已经activate到conda虚拟环境中"
echo "准备好了，按任意键开始提取..."
pause > nul

echo "---------- BACKUP ----------"
echo "正在提取中..."

pip download -r requirements.txt -d ./wheels

echo "---------- FINISHED ----------"
echo "提取产物：wheels文件夹"
echo "请把这两个东西保存好，可以用来重建pip environment"
echo "按任意键退出程序..."
pause > nul
