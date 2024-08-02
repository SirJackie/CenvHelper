@echo off

chcp 65001
cls

echo "---------- RESTORE ----------"
echo "确保你已经activate到conda虚拟环境中"
echo "确保你有：requirements.txt清单 + wheels文件夹"
echo "请把这两个东西放在PENV_RESTORE.bat同一个目录下"
echo "准备好了，按任意键开始重建..."
pause > nul

echo "---------- RESTORE ----------"
echo "正在重建中..."

pip install --no-index --find-links=./wheels -r requirements.txt

echo "---------- FINISHED ----------"
echo "重建完成"
echo "按任意键退出程序..."
pause > nul
