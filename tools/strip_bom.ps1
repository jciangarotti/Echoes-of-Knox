# Rewrite given files as UTF-8 without BOM. PowerShell 5's -Encoding UTF8
# defaults to BOM, which PZ's JSON parser rejects.

$paths = @(
    "C:\Users\ciang\Zomboid\mods\EchoesOfKnox\42\media\lua\shared\Translate\EN\ItemName.json",
    "C:\Users\ciang\Zomboid\mods\EchoesOfKnox\42\media\lua\shared\Translate\EN\UI.json",
    "C:\Users\ciang\Zomboid\mods\EchoesOfKnox\42\media\scripts\EchoesOfKnox\items_echoesofknox.txt",
    "C:\Users\ciang\Zomboid\mods\EchoesOfKnox\42\media\scripts\EchoesOfKnox\sounds.txt"
)

$noBom = New-Object System.Text.UTF8Encoding($false)

foreach ($path in $paths) {
    if (-not (Test-Path $path)) { continue }
    $bytes = [System.IO.File]::ReadAllBytes($path)
    $hadBom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    [System.IO.File]::WriteAllText($path, $content, $noBom)
    if ($hadBom) {
        Write-Host "Stripped BOM: $path"
    } else {
        Write-Host "No BOM (re-saved clean): $path"
    }
}
