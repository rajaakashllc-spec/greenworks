$dir = "C:\Users\A.J Computer's\.gemini\antigravity\brain\9a720774-5310-4165-a925-21d5d24c05bf\.user_uploaded"
$dest = "C:\Users\A.J Computer's\.gemini\antigravity\scratch\gloom_landscaping_website\public\images"

$files = Get-ChildItem -Path $dir | Sort-Object LastWriteTime -Descending | Select-Object -First 5

# Index 0 is image 5 (waterfall fountain), index 1 is image 4 (decking), index 2 is image 3 (before after), index 3 is image 2 (side yard), index 4 is image 1 (corridor)

# Reverse array so 0 is first uploaded
[array]::Reverse($files)

Copy-Item -LiteralPath $files[0].FullName -Destination "$dest\user_gallery_1.jpg" -Force
Copy-Item -LiteralPath $files[1].FullName -Destination "$dest\user_gallery_2.jpg" -Force
Copy-Item -LiteralPath $files[2].FullName -Destination "$dest\user_before_after_1.jpg" -Force
Copy-Item -LiteralPath $files[3].FullName -Destination "$dest\user_gallery_3.jpg" -Force
Copy-Item -LiteralPath $files[4].FullName -Destination "$dest\user_gallery_4.jpg" -Force

Write-Host "Successfully copied 5 new user uploaded project images!"
