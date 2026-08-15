$dir = "C:\Users\A.J Computer's\.gemini\antigravity\brain\9a720774-5310-4165-a925-21d5d24c05bf\.user_uploaded"
$dest = "C:\Users\A.J Computer's\.gemini\antigravity\scratch\gloom_landscaping_website\public\images"

$latest = Get-ChildItem -Path $dir | Sort-Object LastWriteTime -Descending | Select-Object -First 1

Copy-Item -LiteralPath $latest.FullName -Destination "$dest\user_before_after_official.jpg" -Force

Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("$dest\user_before_after_official.jpg")

Write-Host "Copied image dimensions: Width =" $img.Width "Height =" $img.Height
$img.Dispose()
