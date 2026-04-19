# Generate ES/ItemName.json with Spanish translations for all items.
# Writes without BOM (important — PZ's JSON parser rejects BOM).

$modRoot = Split-Path -Parent $PSScriptRoot
$outPath = Join-Path $modRoot "42/media/lua/shared/Translate/ES/ItemName.json"

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("{")

# Main items (10).
$mainEntries = @(
    @{ key = "MysteriousNote"; val = "Nota Misteriosa" },
    @{ key = "DogTag_Subject01"; val = "Placa - Sujeto 01" },
    @{ key = "DogTag_Subject02"; val = "Placa - Sujeto 02" },
    @{ key = "DogTag_Subject03"; val = "Placa - Sujeto 03" },
    @{ key = "DogTag_Subject04"; val = "Placa - Sujeto 04" },
    @{ key = "DogTag_Subject05"; val = "Placa - Sujeto 05" },
    @{ key = "DogTag_Subject06"; val = "Placa - Sujeto 06" },
    @{ key = "DogTag_Subject07"; val = "Placa - Sujeto 07" },
    @{ key = "CompassWatch_Right"; val = "Reloj Brújula" },
    @{ key = "CompassWatch_Left"; val = "Reloj Brújula" }
)

$first = $true
foreach ($entry in $mainEntries) {
    if ($first) { $first = $false } else { [void]$sb.AppendLine(",") }
    [void]$sb.Append("  `"ItemName_EchoesOfKnox.$($entry.key)`": `"$($entry.val)`"")
}

# Journals (70).
for ($s = 1; $s -le 7; $s++) {
    for ($e = 1; $e -le 10; $e++) {
        $key = "Journal_Subject{0:D2}_{1:D2}" -f $s, $e
        $val = "Diario Sujeto {0:D2} - Entrada {1}" -f $s, $e
        [void]$sb.AppendLine(",")
        [void]$sb.Append("  `"ItemName_EchoesOfKnox.$key`": `"$val`"")
    }
}

[void]$sb.AppendLine("")
[void]$sb.AppendLine("}")

# Write WITHOUT BOM (utf-8 encoding, empty BOM).
$noBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($outPath, $sb.ToString(), $noBom)
Write-Host "Wrote $outPath (80 entries, no BOM)"
