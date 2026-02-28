$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repo

$file = Join-Path $repo "counter.txt"
if (!(Test-Path $file)) { "0" | Set-Content $file }

$n = [int](Get-Content $file | Select-Object -First 1)
$n++
Set-Content $file $n

git add counter.txt
git commit -m "Counter: $n" | Out-Null
git push