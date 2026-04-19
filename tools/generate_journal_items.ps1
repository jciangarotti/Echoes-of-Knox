# Generate 70 journal item entries for items_echoesofknox.txt + 70 translations
# for EN/ItemName.json. Appends to items .txt and regenerates the JSON block.

$modRoot = Split-Path -Parent $PSScriptRoot
$itemsPath = Join-Path $modRoot "42/media/scripts/EchoesOfKnox/items_echoesofknox.txt"
$jsonPath  = Join-Path $modRoot "42/media/lua/shared/Translate/EN/ItemName.json"

# Build item definitions block (70 items).
$itemsBlock = New-Object System.Text.StringBuilder
[void]$itemsBlock.AppendLine("")
[void]$itemsBlock.AppendLine("    /* --- Journals (70 items: 10 entries x 7 subjects) --- */")

for ($s = 1; $s -le 7; $s++) {
    for ($e = 1; $e -le 10; $e++) {
        $id = "Journal_Subject{0:D2}_{1:D2}" -f $s, $e
        $icon = "Journal_Subject{0:D2}" -f $s
        $displayName = "Subject {0:D2} Journal - Entry {1}" -f $s, $e
        [void]$itemsBlock.AppendLine("")
        [void]$itemsBlock.AppendLine("    item $id")
        [void]$itemsBlock.AppendLine("    {")
        [void]$itemsBlock.AppendLine("        DisplayName = $displayName,")
        [void]$itemsBlock.AppendLine("        DisplayCategory = Literature,")
        [void]$itemsBlock.AppendLine("        ItemType = base:normal,")
        [void]$itemsBlock.AppendLine("        Weight = 0.05,")
        [void]$itemsBlock.AppendLine("        Icon = $icon,")
        [void]$itemsBlock.AppendLine("    }")
    }
}

# Inject the block into items_echoesofknox.txt just before the final closing }.
$currentItems = Get-Content -Path $itemsPath -Raw -Encoding UTF8
# Find the final closing brace (last '}') and insert before it.
$lastBrace = $currentItems.LastIndexOf("}")
if ($lastBrace -lt 0) {
    Write-Error "Could not find closing brace in items file."
    exit 1
}
# Skip re-injection if already present.
if ($currentItems.Contains("item Journal_Subject01_01")) {
    Write-Host "Journals already present in items_echoesofknox.txt - skipping."
} else {
    $newContent = $currentItems.Substring(0, $lastBrace) + $itemsBlock.ToString() + $currentItems.Substring($lastBrace)
    Set-Content -Path $itemsPath -Value $newContent -Encoding UTF8 -NoNewline
    Write-Host "Injected 70 journal items into $itemsPath"
}

# Build JSON entries (70 ItemName_* keys). We'll read current JSON, splice in the
# new entries just before the final "}" so the existing keys stay intact.
$currentJson = Get-Content -Path $jsonPath -Raw -Encoding UTF8
if ($currentJson.Contains("Journal_Subject01_01")) {
    Write-Host "Journal entries already present in ItemName.json - skipping."
} else {
    $jsonEntries = New-Object System.Text.StringBuilder
    for ($s = 1; $s -le 7; $s++) {
        for ($e = 1; $e -le 10; $e++) {
            $key = "ItemName_EchoesOfKnox.Journal_Subject{0:D2}_{1:D2}" -f $s, $e
            $val = "Subject {0:D2} Journal - Entry {1}" -f $s, $e
            [void]$jsonEntries.AppendLine(",")
            [void]$jsonEntries.Append("  `"$key`": `"$val`"")
        }
    }
    # Insert before the final "}" of the JSON.
    $lastJsonBrace = $currentJson.LastIndexOf("}")
    $newJson = $currentJson.Substring(0, $lastJsonBrace).TrimEnd() + $jsonEntries.ToString() + "`n}`n"
    Set-Content -Path $jsonPath -Value $newJson -Encoding UTF8 -NoNewline
    Write-Host "Injected 70 journal translations into $jsonPath"
}

Write-Host "`nDone."
