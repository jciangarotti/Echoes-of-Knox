# Temporary: create 1x1 transparent PNG placeholders so the mod loads.
# Replaced by make_textures.ps1 output once the final art is generated.

Add-Type -AssemblyName System.Drawing

$modRoot = Split-Path -Parent $PSScriptRoot
$texDir  = Join-Path $modRoot "42/media/textures"

$texNames = @(
    "Item_DogTag_Subject01", "Item_DogTag_Subject02", "Item_DogTag_Subject03",
    "Item_DogTag_Subject04", "Item_DogTag_Subject05", "Item_DogTag_Subject06",
    "Item_DogTag_Subject07", "Item_CompassWatch"
)

$bmp = New-Object System.Drawing.Bitmap(1, 1)
$bmp.SetPixel(0, 0, [System.Drawing.Color]::FromArgb(0, 0, 0, 0))

foreach ($n in $texNames) {
    $p = Join-Path $texDir ($n + ".png")
    $bmp.Save($p, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Host "Placeholder: $p"
}

foreach ($p in @(
    (Join-Path $modRoot "icon.png"),
    (Join-Path $modRoot "42/icon.png"),
    (Join-Path $modRoot "poster.png"),
    (Join-Path $modRoot "42/poster.png")
)) {
    $bmp.Save($p, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Host "Placeholder: $p"
}

$bmp.Dispose()
Write-Host "`nAll placeholders created."
