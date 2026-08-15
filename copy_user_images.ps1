$userUploadsDir = "C:\Users\A.J Computer's\.gemini\antigravity\brain\9a720774-5310-4165-a925-21d5d24c05bf\.user_uploaded"
$publicDir = "C:\Users\A.J Computer's\.gemini\antigravity\scratch\gloom_landscaping_website\public\images"

$files = Get-ChildItem -Path $userUploadsDir
$index = 1

foreach ($f in $files) {
    $dest = Join-Path -Path $publicDir -ChildPath "user_project_$index.jpg"
    Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
    Write-Host "Copied $($f.Name) to user_project_$index.jpg"
    $index++
}
