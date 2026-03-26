@echo off
rem Windows批处理脚本，用于快速构建和安装当前Ruby gem到本机测试
chcp 65001 >nul 2>&1

setlocal enabledelayedexpansion


rem 获取当前脚本目录
set "CURRENT_DIR=%~dp0"
set "CURRENT_DIR=%CURRENT_DIR:~0,-1%"
echo [LOG] Step 1: Get current directory
echo 当前目录: %CURRENT_DIR%

rem 自动检测当前项目名称
echo [LOG] Step 2: Detect project name
set "PROJECT_NAME="
for %%i in ("%CURRENT_DIR%\*.gemspec") do (
    if exist "%%i" (
        set "GEMSPEC_FILE=%%i"
        for /f %%j in ("%%i") do set "PROJECT_NAME=%%~nj"
        goto :found_gemspec
    )
)

echo [LOG] 错误: 未找到gemspec文件!
exit /b 1

:found_gemspec
echo [LOG] Step 3: Found project
echo 检测到项目: %PROJECT_NAME%

rem 清理旧的gem文件
echo [LOG] Step 4: Clean old gem files
if exist "%CURRENT_DIR%\%PROJECT_NAME%-*.gem" (
    echo 清理旧的gem文件...
    del /q "%CURRENT_DIR%\%PROJECT_NAME%-*.gem"
)

rem 自动检测版本文件
echo [LOG] Step 5: Detect version file
set "VERSION_FILE="
for /r "%CURRENT_DIR%\lib" %%i in (version.rb) do (
    if exist "%%i" (
        set "VERSION_FILE=%%i"
        goto :found_version
    )
)

echo [LOG] 错误: 未找到version.rb文件!
exit /b 1

:found_version
echo [LOG] Step 6: Found version file
echo 检测到版本文件: %VERSION_FILE%

rem 从version.rb文件提取版本号
echo [LOG] Step 7: Extract version number
set "VERSION_TAG_NAME="
for /f "tokens=*" %%i in ('findstr /r "VERSION.*=" "%VERSION_FILE%"') do (
    set "line=%%i"
    rem 提取引号中的版本号
    for /f "tokens=2 delims='" %%j in ("!line!") do set "VERSION_TAG_NAME=%%j"
    if "!VERSION_TAG_NAME!"=="" (
        for /f "tokens=2 delims=""" %%j in ("!line!") do set "VERSION_TAG_NAME=%%j"
    )
)

if "%VERSION_TAG_NAME%"=="" (
    echo [LOG] 错误: 无法从版本文件中解析版本号
    echo 版本文件内容:
    type "%VERSION_FILE%"
    exit /b 1
)

echo [LOG] Step 8: Version number parsed successfully
echo 检测到版本: %VERSION_TAG_NAME%

rem 验证版本号格式 (基本检查是否包含点号)
echo %VERSION_TAG_NAME% | findstr "." >nul
if errorlevel 1 (
    echo 警告: 版本号格式可能不正确: %VERSION_TAG_NAME%
)

rem 构建gem
echo [LOG] Step 9: Start building gem
echo 构建 %PROJECT_NAME% gem...
cd /d "%CURRENT_DIR%"

rem 构建gem，忽略警告的退出码
echo [LOG] Step 10: Execute gem build command
gem build "%GEMSPEC_FILE%"
rem 重置错误级别，防止警告阻止脚本继续
cd .
echo [LOG] Step 11: gem build command completed, checking result
echo [DEBUG] Looking for file: %PROJECT_NAME%-%VERSION_TAG_NAME%.gem

rem 检查是否生成了gem文件来判断构建是否成功
if not exist "%PROJECT_NAME%-%VERSION_TAG_NAME%.gem" (
    echo [LOG] 错误: gem构建失败，未找到生成的gem文件!
    echo [DEBUG] 当前目录文件列表:
    dir *.gem
    exit /b 1
) else (
    echo [LOG] Step 12: gem build success confirmed
    echo ✓ gem构建成功
    echo.
    echo ==========================================
    echo 构建完成！现在可以安装到本地：
    echo.
    echo 安装命令：
    echo   gem install --local --force %PROJECT_NAME%-%VERSION_TAG_NAME%.gem
    echo.
    echo 安装后验证：
    echo   %PROJECT_NAME% --version
    echo   %PROJECT_NAME% --help
    echo ==========================================
    echo.
)

rem 查找生成的gem文件
echo [LOG] Step 13: Search for generated gem file
set "GEM_FILE="
if exist "%PROJECT_NAME%-%VERSION_TAG_NAME%.gem" (
    set "GEM_FILE=%PROJECT_NAME%-%VERSION_TAG_NAME%.gem"
) else (
    rem 尝试查找任何版本的gem文件
    for %%i in ("%PROJECT_NAME%-*.gem") do (
        set "GEM_FILE=%%i"
        goto :found_gem
    )
)

:found_gem
if "%GEM_FILE%"=="" (
    echo [LOG] 错误: 未找到生成的gem文件!
    exit /b 1
)

echo [LOG] Step 14: Found gem file
echo 找到gem文件: %GEM_FILE%
echo [LOG] Step 15: Start installing gem
echo 安装 %GEM_FILE%...

rem 安装gem（使用force参数忽略依赖检查）
echo [LOG] Step 16: Execute gem install command
gem install --local --force "%GEM_FILE%"
echo [LOG] Step 17: gem install command completed

if errorlevel 1 (
    echo [LOG] 错误: gem安装失败!
    echo 尝试手动安装: gem install --local --force "%GEM_FILE%"
    exit /b 1
) else (
    echo [LOG] Step 18: gem installation successful
    echo ✓ %PROJECT_NAME% 安装成功!
    echo [LOG] Step 19: Verify installed version
    echo 当前版本:
    %PROJECT_NAME% --version
    echo.
    echo 可以使用以下命令测试:
    echo   %PROJECT_NAME% --help
    echo   %PROJECT_NAME% --version
    echo [LOG] Step 20: Script execution completed
)

pause