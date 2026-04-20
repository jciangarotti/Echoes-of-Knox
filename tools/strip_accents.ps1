# Normalize accented characters to ASCII in a text file, preserving UTF-8
# encoding without BOM. Used for Spanish content that passes through
# ISModalRichText (which uses a font without Latin Extended glyphs).

param(
    [Parameter(Mandatory=$true)]
    [string]$Path
)

$content = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)

# Map of character replacements. Ordered from longest match to shortest for
# any multi-char cases; single-char map is simple lookup.
$map = @{
    [char]0x00E1 = 'a';  # á
    [char]0x00E9 = 'e';  # é
    [char]0x00ED = 'i';  # í
    [char]0x00F3 = 'o';  # ó
    [char]0x00FA = 'u';  # ú
    [char]0x00FC = 'u';  # ü
    [char]0x00F1 = 'n';  # ñ
    [char]0x00C1 = 'A';  # Á
    [char]0x00C9 = 'E';  # É
    [char]0x00CD = 'I';  # Í
    [char]0x00D3 = 'O';  # Ó
    [char]0x00DA = 'U';  # Ú
    [char]0x00DC = 'U';  # Ü
    [char]0x00D1 = 'N';  # Ñ
    [char]0x00BF = '?';  # ¿
    [char]0x00A1 = '!';  # ¡
    [char]0x2014 = '-';  # em dash
    [char]0x2013 = '-';  # en dash
    [char]0x2026 = '...'; # horizontal ellipsis
    [char]0x00AB = '"';  # «
    [char]0x00BB = '"';  # »
    [char]0x201C = '"';  # “
    [char]0x201D = '"';  # ”
    [char]0x2018 = "'";  # ‘
    [char]0x2019 = "'";  # ’
}

$sb = New-Object System.Text.StringBuilder
foreach ($ch in $content.ToCharArray()) {
    if ($map.ContainsKey($ch)) {
        [void]$sb.Append($map[$ch])
    } else {
        [void]$sb.Append($ch)
    }
}

$noBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($Path, $sb.ToString(), $noBom)

Write-Host "Normalized: $Path"
