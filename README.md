# CenvHelper

An Anaconda Environment Management Tool.

`Cenv` stands for `Conda ENVironment` .

## 1. 功能

- `CENV_BACKUP.bat`：备份 Conda Environment 环境
- `CENV_CREATE.bat`：创建 Conda Environment 环境
- `CENV_DESTROY.bat`：销毁 Conda Environment 环境
- `CENV_LIST_EXISTINGS.bat`：列出已经存在的 Conda Environment 环境
- `CENV_RESTORE.bat`：恢复 Conda Environment 环境
- `PENV_BACKUP_STEP1.bat`：备份 Pip Environment 环境（第一步）
- `PENV_BACKUP_STEP2.bat`：备份 Pip Environment 环境（第二步）
- `PENV_RESTORE.bat`：还原 Pip Environment 环境

## 2. 还原

### 第一步：创建虚拟环境

**首先，以管理员模式，运行cmd.exe或wt.exe。**

**接着，切换到 `CenvHelper` 所在路径：**

```
cd /d 你的路径\CenvHelper
```

首先，查看现有的虚拟环境（等下要避开现有的名字）：

```
CENV_LIST_EXISTINGS.bat
```

接着，创建虚拟环境：

```
CENV_CREATE.bat
```

接着，输入虚拟环境名字（要避开现有的名字），这里以test为例：

```
请输入要创建的虚拟环境名字：test
```

等待创建完成后，使用这个命令，激活我们的虚拟环境：

```
conda activate test
```

看见这个前缀 `(test)` ，说明激活成功：

```
(test) C:\Users\Windows To Go\Desktop\CenvHelper>
```

### 第二步：还原Conda Environment

运行Conda Environment还原程序：

```
CENV_RESTORE.bat
```

进入后，让我们输入还原文件夹的名字：

```
请输入Conda安装包目录名称（例如01_cenv_python_39）：
```

我们这时候多次运行还原程序，分别把这些文件夹输入进去，实现逐步还原：

```
01_cenv_python_39
02_cenv_ruamel_yaml
03_cenv_cudatoolkit
```

### 第三步：还原Pip Environment

运行Pip Environment还原程序：

```
PENV_RESTORE.bat
```

这个程序是全自动的，按回车后，很快就能还原成功。

## 3. 备份

### 第一步：进入虚拟环境

**首先，以管理员模式，运行cmd.exe或wt.exe。**

**接着，切换到 `CenvHelper` 所在路径：**

```
cd /d 你的路径\CenvHelper
```

使用这个命令，激活我们的虚拟环境：

```
conda activate test
```

看见这个前缀 `(test)` ，说明激活成功：

```
(test) C:\Users\Windows To Go\Desktop\CenvHelper>
```

### 第二步：备份Conda Environment

运行链接导出程序：

```
CENV_BACKUP.bat
```

输入备份文件名，会得到一个txt备份文件。打开文件，是一个链接列表：

```
# This file may be used to create an environment using:
# $ conda create --name <env> --file <this file>
# platform: win-64
@EXPLICIT
http://...
http://...
http://...
http://...
http://...
```

使用IDM等下载工具的”批量下载功能“，把这么多行地址粘贴进去，就能批量下载了。

批量下载完，得到一堆 `.conda` `.tar.bz` 的包，把它们放在一个文件夹里，起好名字（例如 `03_cenv_cudatoolkit`），之后使用上文的还原方法，即可恢复！

### 第三步：备份Pip Environment

首先，运行：

```
PENV_BACKUP_STEP1.bat
```

这可以导出一个 `requirements.txt`，大概如下：

```
anaconda-navigator==2.1.1
llvmlite==0.43.0
numba==0.60.0
numpy==1.22.4
opencv-python
pillow==10.4.0
ruamel-yaml-conda @ file:///C:/b/abs_6ejaexx82s/croot/ruamel_yaml_1667489767827/work
ruamel.yaml.clib @ file:///C:/b/abs_aarblxbilo/croot/ruamel.yaml.clib_1666302270884/work
scipy==1.13.1
torch
torchaudio
torchvision
typing_extensions==4.12.2
```

**现在，再 `requirements.txt` 中，手动删除下面这三行，然后保存（因为这三行是Conda管理的，Pip中并不支持，会引发错误）：**

```
anaconda-navigator==2.1.1
ruamel-yaml-conda @ file:///C:/b/abs_6ejaexx82s/croot/ruamel_yaml_1667489767827/work
ruamel.yaml.clib @ file:///C:/b/abs_aarblxbilo/croot/ruamel.yaml.clib_1666302270884/work
```

接着运行：

```
PENV_BACKUP_STEP2.bat
```

这可以导出一个wheels文件夹，包含实际安装包数据。`wheels + requirements.txt` 共同配合，可以用来恢复 `Pip Environment` 。

