$port = 8080
$prefix = "http://localhost:$port/"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
    Write-Host "Server running at $prefix"
} catch {
    Write-Host "Failed to start listener: $_"
    exit 1
}

$rootDir = Get-Location

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $path = $request.Url.LocalPath
        if ($path -eq "/") { $path = "/index.html" }

        $localPath = [System.IO.Path]::Combine($rootDir, $path.TrimStart('/').Replace('/', '\'))

        # Fallback to public folder if file is inside public/
        if (-not (Test-Path -LiteralPath $localPath -PathType Leaf)) {
            $fallbackPath = [System.IO.Path]::Combine($rootDir, "public", $path.TrimStart('/').Replace('/', '\'))
            if (Test-Path -LiteralPath $fallbackPath -PathType Leaf) {
                $localPath = $fallbackPath
            }
        }

        if (Test-Path -LiteralPath $localPath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($localPath)
            
            # Content Types
            if ($localPath.EndsWith(".html")) { $response.ContentType = "text/html; charset=utf-8" }
            elseif ($localPath.EndsWith(".css")) { $response.ContentType = "text/css" }
            elseif ($localPath.EndsWith(".js")) { $response.ContentType = "application/javascript" }
            elseif ($localPath.EndsWith(".jpg") -or $localPath.EndsWith(".jpeg")) { $response.ContentType = "image/jpeg" }
            elseif ($localPath.EndsWith(".png")) { $response.ContentType = "image/png" }
            elseif ($localPath.EndsWith(".svg")) { $response.ContentType = "image/svg+xml" }

            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $buf = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.OutputStream.Write($buf, 0, $buf.Length)
        }
        $response.Close()
    } catch {
        # Continue loop
    }
}
