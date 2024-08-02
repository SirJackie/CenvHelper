@echo off

cls
chcp 65001

set /p env_name=请输入要销毁的虚拟环境名字：
conda remove -n %env_name% --all