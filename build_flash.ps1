
$projectPath = $args[0]
$keilPath = "C:/work/Keil5/Keil5/UV4/uVision.com"

Write-Host "start building and burning: $projectPath" -ForegroundColor Cyan

# 执行编译
& $keilPath -b $projectPath
$buildResult = $LASTEXITCODE

# 检查编译结果
if ($buildResult -eq 0) 
{
    Write-Host "build seccess!burning..." -ForegroundColor Green
    
    # 执行烧录
    & $keilPath -flash $projectPath
    $flashResult = $LASTEXITCODE
    
    if ($flashResult -eq 0) 
    {
        Write-Host "burning seccess!" -ForegroundColor Green
        exit 0
    } 
    else 
    {
        Write-Host "fail burning, waring code $flashResult" -ForegroundColor Red
        exit $flashResult
    }
} 
else 
{
    Write-Host "fail build, $buildResult cancle burn" -ForegroundColor Red
    exit $buildResult
}
