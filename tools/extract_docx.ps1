# Extract text from docx document.xml, preserving paragraph breaks.
$xmlPath = "C:\Users\ciang\AppData\Local\Temp\docx_extract\word\document.xml"
$outPath = "C:\Users\ciang\AppData\Local\Temp\docx_extract\content.txt"

[xml]$xml = Get-Content -Path $xmlPath -Encoding UTF8
$body = $xml.document.body
$out = New-Object System.Text.StringBuilder

foreach ($p in $body.ChildNodes) {
    if ($p.LocalName -eq 'p') {
        $text = ''
        foreach ($r in $p.ChildNodes) {
            if ($r.LocalName -eq 'r') {
                foreach ($t in $r.ChildNodes) {
                    if ($t.LocalName -eq 't') {
                        $text += $t.InnerText
                    } elseif ($t.LocalName -eq 'br') {
                        $text += [Environment]::NewLine
                    }
                }
            }
        }
        [void]$out.AppendLine($text)
    }
}

$out.ToString() | Out-File -FilePath $outPath -Encoding UTF8
Write-Host "Extracted: $outPath"
Get-Item $outPath | Select-Object Length
