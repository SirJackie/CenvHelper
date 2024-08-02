@echo off

cls
chcp 65001

echo "----------------------------------------"
echo "请确保：当前处于activate状态（会备份当前被actiavte的虚拟环境）"
echo "----------------------------------------"

set /p backup_name=请输入备份导出文件的名字：
conda list --explicit > %backup_name%.txt

echo "----------------------------------------"
echo "完成！现在你可以使用IDM等下载器，批量下载导出的备份文件中的链接（是一个链接列表）"
echo "下载完后，把所有包文件，放到统一的文件夹（例如03_cenv_cudatoolkit）"
echo "之后要还原，只需要启动CENV_RESTORE.bat，输入文件夹名字，即可还原！"
echo "----------------------------------------"

pause
