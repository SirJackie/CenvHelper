@echo off

cls
chcp 65001

set /p env_name=请输入要创建的虚拟环境名字：
conda create -n %env_name% --offline