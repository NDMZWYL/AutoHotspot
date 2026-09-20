# AutoHotspot

一个轻量级的 Windows PowerShell 脚本，用于监控有线网络连接，并自动开启或关闭移动热点。

## 功能特性

- **自动检测**：实时监控以太网连接状态。
- **自动开关**：有线网连上后自动开启热点，网线断开后自动关闭热点。
- **开机自启**：可通过任务计划程序实现开机自动运行。
- **轻量无依赖**：纯 PowerShell 编写，无需安装任何第三方软件。

## 环境要求

- Windows 10 / 11
- PowerShell 5.1 或更高版本
- 支持移动热点功能的无线网卡

## 使用方法

### 1下载脚本
点击页面右上方的绿色 `<> Code` 按钮，选择 `Download ZIP`。解压后，将 `AutoHotspot.ps1` 文件放到电脑的任意目录下（例如 `C:\Scripts\`）。任务计划程序可以更改 自定义

### 2配置热点
在 Windows 设置中，进入 **网络和 Internet > 移动热点**，设置好热点名称和密码，并关闭“未连接设备时自动关闭移动热点”选项。

### 3运行脚本
以管理员身份打开 PowerShell，执行以下命令：
```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force
.\AutoHotspot.ps1
