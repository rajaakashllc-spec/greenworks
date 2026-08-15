$dir = "C:\Users\A.J Computer's\.gemini\antigravity\brain\9a720774-5310-4165-a925-21d5d24c05bf\.user_uploaded"
$dest = "C:\Users\A.J Computer's\.gemini\antigravity\scratch\gloom_landscaping_website\public\images"

$files = Get-ChildItem -Path $dir | Sort-Object LastWriteTime -Descending | Select-Object -First 3

# Reverse so index 0 is first uploaded of the 3
[array]::Reverse($files)

Copy-Item -LiteralPath $files[0].FullName -Destination "$dest\real_before_after_1.jpg" -Force
Copy-Item -LiteralPath $files[1].FullName -Destination "$dest\real_before_after_2.jpg" -Force
Copy-Item -LiteralPath $files[2].FullName -Destination "$dest\real_before_after_3.jpg" -Force

Write-Host "Successfully copied 3 uploaded Before & After images!"
