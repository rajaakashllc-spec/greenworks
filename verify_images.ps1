$projDir = "C:\Users\A.J Computer's\.gemini\antigravity\scratch\gloom_landscaping_website"
$imgDir = "$projDir\public\images"

Write-Host "=== COMPREHENSIVE PROJECT IMAGE VERIFICATION ==="

$allFiles = Get-ChildItem -Path "$projDir\src" -Recurse -Include *.jsx,*.js
$allFiles += Get-Item "$projDir\index.html"
$allFiles += Get-Item "$projDir\index_standalone.html"

$missingCount = 0
$checkedPaths = @{}

foreach ($file in $allFiles) {
    $content = Get-Content $file.FullName -Raw
    $matches = [regex]::Matches($content, '["'']([^"'']*\.(?:jpg|jpeg|png|svg|webp))["'']')
    
    foreach ($m in $matches) {
        $path = $m.Groups[1].Value
        if ($path.StartsWith("http://") -or $path.StartsWith("https://") -or $path.StartsWith("data:")) {
            continue
        }
        if ($checkedPaths.ContainsKey($path)) { continue }
        $checkedPaths[$path] = $true

        $fileName = [System.IO.Path]::GetFileName($path)
        $targetPath = Join-Path $imgDir $fileName

        if (Test-Path -LiteralPath $targetPath -PathType Leaf) {
            Write-Host " [OK] Ref '$path' in $($file.Name) -> public\images\$fileName (EXISTS)"
        } else {
            Write-Host " [MISSING] Ref '$path' in $($file.Name) -> NOT FOUND in public\images\"
            $missingCount++
        }
    }
}

Write-Host "`n----------------------------------------"
if ($missingCount -eq 0) {
    Write-Host "RESULT: 100% VERIFIED. All image files exist inside public\images\ and are ready for GitHub/Vercel deployment."
} else {
    Write-Host "RESULT: $missingCount missing image files detected."
}
