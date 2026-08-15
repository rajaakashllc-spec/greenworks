$brainDir = "C:\Users\A.J Computer's\.gemini\antigravity\brain\9a720774-5310-4165-a925-21d5d24c05bf"
$publicDir = "C:\Users\A.J Computer's\.gemini\antigravity\scratch\gloom_landscaping_website\public\images"

$images = @{
    "hero_dubai_villa_1786630844112.jpg" = "hero_dubai_villa.jpg"
    "service_landscape_design_1786630862573.jpg" = "service_landscape_design.jpg"
    "service_garden_maint_1786630886706.jpg" = "service_garden_maintenance.jpg"
    "service_pool_const_1786630917713.jpg" = "service_pool_construction.jpg"
    "service_artif_grass_1786630953114.jpg" = "service_artificial_grass.jpg"
    "service_pergola_1786630994714.jpg" = "service_pergola.jpg"
}

foreach ($key in $images.Keys) {
    $src = Join-Path -Path $brainDir -ChildPath $key
    $dest = Join-Path -Path $publicDir -ChildPath $images[$key]
    if (Test-Path -LiteralPath $src) {
        Copy-Item -LiteralPath $src -Destination $dest -Force
        Write-Host "SUCCESS: Copied $key to $dest"
    } else {
        Write-Host "NOT FOUND: $src"
    }
}
