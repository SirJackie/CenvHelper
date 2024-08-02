@echo off

cls
chcp 65001

echo "----------------------------------------"
echo "请确保：当前处于activate状态（会备份当前被actiavte的虚拟环境）"
echo "----------------------------------------"

set /p target_directory=请输入Conda安装包目录名称（例如01_cenv_python_39）： 
for /R %target_directory% %%f in (*) do (
    echo Installing "%%f"
    conda install "%%f"
)

pause
