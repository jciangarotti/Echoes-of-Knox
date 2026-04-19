# Generate textures for Echoes of Knox.
# - Item_DogTag_SubjectNN.png (32x32) for the 7 dog tags (NN=01..07)
# - Item_CompassWatch.png     (32x32) for the compass watch
# - poster.png (256x256) and icon.png (64x64) for the mod itself
#
# Run:  powershell -ExecutionPolicy Bypass -File tools/make_textures.ps1

Add-Type -AssemblyName System.Drawing

$modRoot = Split-Path -Parent $PSScriptRoot
$texDir  = Join-Path $modRoot "42/media/textures"

# --- helpers ------------------------------------------------------------

function New-DogTag {
    param(
        [int]$Size,
        [int]$Index,
        [string]$OutPath
    )

    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    # Tag body: vertical rounded rect (dog-tag shape), silver metal.
    $tagW = [int]($Size * 0.56)
    $tagH = [int]($Size * 0.82)
    $tagX = [int](($Size - $tagW) / 2)
    $tagY = [int](($Size - $tagH) / 2)
    $radius = [Math]::Max(2, [int]($Size * 0.08))

    # Build rounded rect path.
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddArc($tagX, $tagY, $radius * 2, $radius * 2, 180, 90)
    $path.AddArc($tagX + $tagW - $radius * 2, $tagY, $radius * 2, $radius * 2, 270, 90)
    $path.AddArc($tagX + $tagW - $radius * 2, $tagY + $tagH - $radius * 2, $radius * 2, $radius * 2, 0, 90)
    $path.AddArc($tagX, $tagY + $tagH - $radius * 2, $radius * 2, $radius * 2, 90, 90)
    $path.CloseFigure()

    # Silver gradient fill.
    $rect = New-Object System.Drawing.Rectangle($tagX, $tagY, $tagW, $tagH)
    $bgBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        $rect,
        [System.Drawing.Color]::FromArgb(255, 210, 210, 215),
        [System.Drawing.Color]::FromArgb(255, 130, 130, 135),
        45)
    $g.FillPath($bgBrush, $path)
    $bgBrush.Dispose()

    # Outline.
    $pen = New-Object System.Drawing.Pen(
        [System.Drawing.Color]::FromArgb(255, 60, 60, 65),
        [Math]::Max(1, [int]($Size / 32)))
    $g.DrawPath($pen, $path)
    $pen.Dispose()
    $path.Dispose()

    # Chain hole at the top.
    $holeSize = [Math]::Max(2, [int]($Size * 0.1))
    $holeX = $tagX + ($tagW - $holeSize) / 2
    $holeY = $tagY + [int]($Size * 0.05)
    $holeBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 30, 30, 35))
    $g.FillEllipse($holeBrush, $holeX, $holeY, $holeSize, $holeSize)
    $holeBrush.Dispose()

    # Engraved number (centered).
    $label = ("{0:D2}" -f $Index)
    $fontSize = [int]($Size * 0.32)
    $font = New-Object System.Drawing.Font("Consolas", $fontSize, [System.Drawing.FontStyle]::Bold)
    $tsz = $g.MeasureString($label, $font)
    $tx = $tagX + ($tagW - $tsz.Width) / 2
    $ty = $tagY + ($tagH - $tsz.Height) / 2 + [int]($Size * 0.04)
    $engraveBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 30, 30, 35))
    $g.DrawString($label, $font, $engraveBrush, $tx, $ty)
    $font.Dispose()
    $engraveBrush.Dispose()

    # Small "SUBJECT" tag line above the number (tiny).
    if ($Size -ge 32) {
        $subFontSize = [Math]::Max(4, [int]($Size * 0.12))
        $subFont = New-Object System.Drawing.Font("Consolas", $subFontSize, [System.Drawing.FontStyle]::Bold)
        $subLabel = "SUBJ"
        $ssz = $g.MeasureString($subLabel, $subFont)
        $sx = $tagX + ($tagW - $ssz.Width) / 2
        $sy = $tagY + [int]($Size * 0.24)
        $subBrush = New-Object System.Drawing.SolidBrush(
            [System.Drawing.Color]::FromArgb(200, 30, 30, 35))
        $g.DrawString($subLabel, $subFont, $subBrush, $sx, $sy)
        $subFont.Dispose()
        $subBrush.Dispose()
    }

    $g.Dispose()
    $bmp.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "Generated $OutPath"
}

function New-Journal {
    param(
        [int]$Size,
        [int]$SubjectID,
        [string]$OutPath
    )

    # Palette per subject: distinct cover colors so players can visually group
    # the 10 journals of each character in their inventory.
    # Subject 01 Doctor: clinical off-white with blue spine
    # Subject 02 Nurse: soft pink
    # Subject 03 Clerk: tan/cardboard
    # Subject 04 Priest: black with gold trim
    # Subject 05 Mechanic: olive green
    # Subject 06 PE Teacher: athletic orange
    # Subject 07 Biologist: dark forest green
    $palettes = @{
        1 = @{ Cover = @(230, 230, 235); Spine = @(60, 95, 140); Accent = @(100, 130, 170) }
        2 = @{ Cover = @(235, 175, 195); Spine = @(190, 110, 140); Accent = @(230, 150, 175) }
        3 = @{ Cover = @(190, 155, 110); Spine = @(130, 90,  50); Accent = @(160, 120, 80) }
        4 = @{ Cover = @(30,  30,  35);  Spine = @(170, 140, 70); Accent = @(190, 160, 90) }
        5 = @{ Cover = @(110, 120, 70);  Spine = @(70,  80,  40); Accent = @(90,  100, 55) }
        6 = @{ Cover = @(210, 115, 50);  Spine = @(150, 70,  30); Accent = @(180, 90,  40) }
        7 = @{ Cover = @(50,  80,  55);  Spine = @(30,  55,  35); Accent = @(40,  70,  45) }
    }
    $p = $palettes[$SubjectID]
    if ($null -eq $p) { $p = $palettes[1] }
    $coverColor  = [System.Drawing.Color]::FromArgb(255, $p.Cover[0],  $p.Cover[1],  $p.Cover[2])
    $spineColor  = [System.Drawing.Color]::FromArgb(255, $p.Spine[0],  $p.Spine[1],  $p.Spine[2])
    $accentColor = [System.Drawing.Color]::FromArgb(255, $p.Accent[0], $p.Accent[1], $p.Accent[2])

    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

    # Book body (vertical rectangle, slightly angled for depth).
    $bookW = [int]($Size * 0.62)
    $bookH = [int]($Size * 0.82)
    $bookX = [int](($Size - $bookW) / 2)
    $bookY = [int](($Size - $bookH) / 2)

    # Shadow behind the book.
    $shadowBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(100, 0, 0, 0))
    $g.FillRectangle($shadowBrush, $bookX + 2, $bookY + 2, $bookW, $bookH)
    $shadowBrush.Dispose()

    # Cover fill.
    $coverBrush = New-Object System.Drawing.SolidBrush($coverColor)
    $g.FillRectangle($coverBrush, $bookX, $bookY, $bookW, $bookH)
    $coverBrush.Dispose()

    # Spine (left edge strip).
    $spineW = [Math]::Max(2, [int]($bookW * 0.18))
    $spineBrush = New-Object System.Drawing.SolidBrush($spineColor)
    $g.FillRectangle($spineBrush, $bookX, $bookY, $spineW, $bookH)
    $spineBrush.Dispose()

    # Spine rings (spiral binding dots).
    $ringBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 30, 30, 35))
    $ringSize = [Math]::Max(1, [int]($Size * 0.04))
    $ringGap = [int]($bookH / 5.0)
    for ($i = 0; $i -lt 4; $i++) {
        $ry = $bookY + [int]($ringGap * 0.5) + $i * $ringGap
        $rx = $bookX + [int]($spineW / 2) - [int]($ringSize / 2)
        $g.FillEllipse($ringBrush, $rx, $ry, $ringSize, $ringSize)
    }
    $ringBrush.Dispose()

    # Cover label (horizontal band in accent color, simulates a title strip).
    $labelPad = [int]($bookW * 0.05)
    $labelX = $bookX + $spineW + $labelPad
    $labelY = $bookY + [int]($bookH * 0.28)
    $labelW = $bookW - $spineW - $labelPad * 2
    $labelH = [int]($bookH * 0.18)
    $labelBrush = New-Object System.Drawing.SolidBrush($accentColor)
    $g.FillRectangle($labelBrush, $labelX, $labelY, $labelW, $labelH)
    $labelBrush.Dispose()

    # Subject number centered on the label.
    $numText = ("{0:D2}" -f $SubjectID)
    $numFontSize = [int]($Size * 0.28)
    $numFont = New-Object System.Drawing.Font("Consolas", $numFontSize, [System.Drawing.FontStyle]::Bold)
    $nsz = $g.MeasureString($numText, $numFont)
    $nx = $labelX + ($labelW - $nsz.Width) / 2
    $ny = $labelY + ($labelH - $nsz.Height) / 2
    # Choose a text color that contrasts with the cover.
    $avgCover = ($p.Cover[0] + $p.Cover[1] + $p.Cover[2]) / 3
    $numColor = if ($avgCover -lt 130) {
        [System.Drawing.Color]::FromArgb(255, 245, 245, 240)
    } else {
        [System.Drawing.Color]::FromArgb(255, 30, 30, 35)
    }
    $numBrush = New-Object System.Drawing.SolidBrush($numColor)
    $g.DrawString($numText, $numFont, $numBrush, $nx, $ny)
    $numFont.Dispose()
    $numBrush.Dispose()

    # Outline around the whole book.
    $outlinePen = New-Object System.Drawing.Pen(
        [System.Drawing.Color]::FromArgb(255, 25, 25, 28),
        [Math]::Max(1, [int]($Size / 40)))
    $g.DrawRectangle($outlinePen, $bookX, $bookY, $bookW - 1, $bookH - 1)
    $outlinePen.Dispose()

    $g.Dispose()
    $bmp.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "Generated $OutPath"
}

function New-Note {
    param([int]$Size, [string]$OutPath)

    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

    # Folded paper note: slightly tilted off-white rectangle with a crease.
    $paperW = [int]($Size * 0.72)
    $paperH = [int]($Size * 0.86)
    $paperX = [int](($Size - $paperW) / 2)
    $paperY = [int](($Size - $paperH) / 2)

    $state = $g.Save()
    $g.TranslateTransform([float]($paperX + $paperW / 2), [float]($paperY + $paperH / 2))
    $g.RotateTransform(-6.0)
    $g.TranslateTransform([float](-$paperW / 2), [float](-$paperH / 2))

    # Drop shadow.
    $shadowBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(120, 0, 0, 0))
    $g.FillRectangle($shadowBrush, 2, 2, $paperW, $paperH)
    $shadowBrush.Dispose()

    # Paper body, off-white gradient.
    $paperRect = New-Object System.Drawing.Rectangle(0, 0, $paperW, $paperH)
    $paperBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        $paperRect,
        [System.Drawing.Color]::FromArgb(255, 245, 235, 210),
        [System.Drawing.Color]::FromArgb(255, 210, 195, 160),
        90)
    $g.FillRectangle($paperBrush, 0, 0, $paperW, $paperH)
    $paperBrush.Dispose()

    # Crease (horizontal fold line).
    $creasePen = New-Object System.Drawing.Pen(
        [System.Drawing.Color]::FromArgb(180, 130, 100, 60),
        [Math]::Max(1, [int]($Size / 64)))
    $g.DrawLine($creasePen, 0, $paperH / 2, $paperW, $paperH / 2)
    $creasePen.Dispose()

    # Text lines (handwriting-ish, just dashes).
    $textPen = New-Object System.Drawing.Pen(
        [System.Drawing.Color]::FromArgb(230, 30, 30, 30),
        [Math]::Max(1, [int]($Size / 64)))
    $lineMargin = [int]($paperW * 0.15)
    $lineStep = [int]($paperH * 0.11)
    $lineStartY = [int]($paperH * 0.16)
    for ($i = 0; $i -lt 6; $i++) {
        $ly = $lineStartY + $i * $lineStep
        if ($ly -gt $paperH * 0.45 -and $ly -lt $paperH * 0.55) { continue }
        $lineLen = $paperW - $lineMargin * 2
        if (($i % 3) -eq 2) { $lineLen = $lineLen * 0.65 }
        $g.DrawLine($textPen, $lineMargin, $ly, $lineMargin + $lineLen, $ly)
    }
    $textPen.Dispose()

    # Border.
    $borderPen = New-Object System.Drawing.Pen(
        [System.Drawing.Color]::FromArgb(255, 100, 80, 50),
        [Math]::Max(1, [int]($Size / 48)))
    $g.DrawRectangle($borderPen, 0, 0, $paperW - 1, $paperH - 1)
    $borderPen.Dispose()

    $g.Restore($state)
    $g.Dispose()
    $bmp.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "Generated $OutPath"
}

function New-CompassWatch {
    param([int]$Size, [string]$OutPath)

    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

    # Watch body: rounded rect, dark metallic.
    $bodyPad = [int]($Size * 0.18)
    $bodyW = $Size - $bodyPad * 2
    $bodyH = [int]($Size * 0.55)
    $bodyY = ($Size - $bodyH) / 2
    $bodyBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 35, 40, 50))
    $g.FillRectangle($bodyBrush, $bodyPad, $bodyY, $bodyW, $bodyH)
    $bodyBrush.Dispose()

    # Compass face: round dial (white/cream).
    $dialPad = [Math]::Max(2, [int]($Size * 0.06))
    $dialX = $bodyPad + $dialPad
    $dialY = $bodyY + $dialPad
    $dialW = $bodyW - $dialPad * 2
    $dialH = $bodyH - $dialPad * 2
    $dialSize = [Math]::Min($dialW, $dialH)
    $dialCx = $dialX + $dialW / 2
    $dialCy = $dialY + $dialH / 2

    $dialBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 240, 238, 228))
    $g.FillEllipse($dialBrush, $dialCx - $dialSize / 2, $dialCy - $dialSize / 2, $dialSize, $dialSize)
    $dialBrush.Dispose()

    # Dial ring.
    $ringPen = New-Object System.Drawing.Pen(
        [System.Drawing.Color]::FromArgb(255, 70, 70, 80),
        [Math]::Max(1, [int]($Size / 64)))
    $g.DrawEllipse($ringPen, $dialCx - $dialSize / 2, $dialCy - $dialSize / 2, $dialSize - 1, $dialSize - 1)
    $ringPen.Dispose()

    # Cardinal marks (N at top).
    $markBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 30, 30, 35))
    $markSize = [Math]::Max(1, [int]($Size * 0.04))
    $markR = $dialSize / 2 - $markSize
    for ($i = 0; $i -lt 4; $i++) {
        $angle = ($i / 4.0) * 2 * [Math]::PI - [Math]::PI / 2
        $mx = $dialCx + [Math]::Cos($angle) * $markR
        $my = $dialCy + [Math]::Sin($angle) * $markR
        $g.FillEllipse($markBrush, $mx - $markSize / 2, $my - $markSize / 2, $markSize, $markSize)
    }
    $markBrush.Dispose()

    # Compass needle: red (N) + gray (S).
    [float]$needleLen = $dialSize * 0.36
    [float]$needleWidth = [Math]::Max(2, [int]($Size * 0.06))
    [float]$cxF = $dialCx
    [float]$cyF = $dialCy
    [float]$halfW = $needleWidth / 2.0

    # N (red, pointing up).
    $p1 = New-Object System.Drawing.PointF($cxF, ($cyF - $needleLen))
    $p2 = New-Object System.Drawing.PointF(($cxF - $halfW), $cyF)
    $p3 = New-Object System.Drawing.PointF(($cxF + $halfW), $cyF)
    [System.Drawing.PointF[]]$nPoints = @($p1, $p2, $p3)
    $nBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 200, 40, 40))
    $g.FillPolygon($nBrush, $nPoints)
    $nBrush.Dispose()

    # S (gray, pointing down).
    $q1 = New-Object System.Drawing.PointF($cxF, ($cyF + $needleLen))
    $q2 = New-Object System.Drawing.PointF(($cxF - $halfW), $cyF)
    $q3 = New-Object System.Drawing.PointF(($cxF + $halfW), $cyF)
    [System.Drawing.PointF[]]$sPoints = @($q1, $q2, $q3)
    $sBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 100, 100, 110))
    $g.FillPolygon($sBrush, $sPoints)
    $sBrush.Dispose()

    # Center pivot.
    $pivotBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 40, 40, 45))
    $pivotSize = [Math]::Max(2, [int]($Size * 0.06))
    $g.FillEllipse($pivotBrush, $dialCx - $pivotSize / 2, $dialCy - $pivotSize / 2, $pivotSize, $pivotSize)
    $pivotBrush.Dispose()

    # Strap (top + bottom, olive drab).
    $strapBrush = New-Object System.Drawing.SolidBrush(
        [System.Drawing.Color]::FromArgb(255, 65, 70, 45))
    $strapH = [int]($Size * 0.2)
    $g.FillRectangle($strapBrush, $bodyPad + 2, 0, $bodyW - 4, $strapH)
    $g.FillRectangle($strapBrush, $bodyPad + 2, $Size - $strapH, $bodyW - 4, $strapH)
    $strapBrush.Dispose()

    $g.Dispose()
    $bmp.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "Generated $OutPath"
}

function New-ModPoster {
    param([int]$Size, [string]$OutPath, [bool]$ShowTitle)

    $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    # Dark olive gradient bg (military vibe).
    $rect = New-Object System.Drawing.Rectangle(0, 0, $Size, $Size)
    $bgTop = [System.Drawing.Color]::FromArgb(255, 30, 38, 26)
    $bgBot = [System.Drawing.Color]::FromArgb(255, 12, 16, 10)
    $bgBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $bgTop, $bgBot, 90)
    $g.FillRectangle($bgBrush, $rect)
    $bgBrush.Dispose()

    # Two crossed dog tags.
    $tagW = [int]($Size * 0.36)
    $tagH = [int]($Size * 0.58)
    $cx = $Size / 2
    $cy = $Size / 2 - [int]($Size * 0.05)

    # Draw one tag rotated, then the other the other way.
    $angles = @(-18.0, 18.0)
    $labels = @("SUBJ-07", "SUBJ-01")
    for ($t = 0; $t -lt 2; $t++) {
        $state = $g.Save()
        $g.TranslateTransform($cx, $cy)
        $g.RotateTransform($angles[$t])
        $g.TranslateTransform(-$tagW / 2, -$tagH / 2)

        # Tag body.
        $radius = [Math]::Max(4, [int]($Size * 0.04))
        $path = New-Object System.Drawing.Drawing2D.GraphicsPath
        $path.AddArc(0, 0, $radius * 2, $radius * 2, 180, 90)
        $path.AddArc($tagW - $radius * 2, 0, $radius * 2, $radius * 2, 270, 90)
        $path.AddArc($tagW - $radius * 2, $tagH - $radius * 2, $radius * 2, $radius * 2, 0, 90)
        $path.AddArc(0, $tagH - $radius * 2, $radius * 2, $radius * 2, 90, 90)
        $path.CloseFigure()

        $tagRect = New-Object System.Drawing.Rectangle(0, 0, $tagW, $tagH)
        $tagBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
            $tagRect,
            [System.Drawing.Color]::FromArgb(255, 220, 220, 225),
            [System.Drawing.Color]::FromArgb(255, 120, 120, 125),
            45)
        $g.FillPath($tagBrush, $path)
        $tagBrush.Dispose()

        $pen = New-Object System.Drawing.Pen(
            [System.Drawing.Color]::FromArgb(255, 40, 40, 45),
            [Math]::Max(1, [int]($Size / 96)))
        $g.DrawPath($pen, $path)
        $pen.Dispose()
        $path.Dispose()

        # Chain hole.
        $holeSize = [Math]::Max(3, [int]($Size * 0.025))
        $holeBrush = New-Object System.Drawing.SolidBrush(
            [System.Drawing.Color]::FromArgb(255, 30, 30, 35))
        $g.FillEllipse($holeBrush, ($tagW - $holeSize) / 2, [int]($tagH * 0.08), $holeSize, $holeSize)
        $holeBrush.Dispose()

        # Engraved label.
        $fs = [int]($tagW * 0.18)
        $font = New-Object System.Drawing.Font("Consolas", $fs, [System.Drawing.FontStyle]::Bold)
        $tsz = $g.MeasureString($labels[$t], $font)
        $engraveBrush = New-Object System.Drawing.SolidBrush(
            [System.Drawing.Color]::FromArgb(255, 30, 30, 35))
        $g.DrawString($labels[$t], $font, $engraveBrush, ($tagW - $tsz.Width) / 2, ($tagH - $tsz.Height) / 2)
        $font.Dispose()
        $engraveBrush.Dispose()

        $g.Restore($state)
    }

    # Title.
    if ($ShowTitle -and $Size -ge 128) {
        $text = "ECHOES OF KNOX"
        $fontSize = [int]($Size * 0.11)
        $font = $null
        $tsz = $null
        for ($try = 0; $try -lt 20; $try++) {
            if ($font) { $font.Dispose() }
            $font = New-Object System.Drawing.Font("Impact", $fontSize, [System.Drawing.FontStyle]::Bold)
            $tsz = $g.MeasureString($text, $font)
            if ($tsz.Width -le ($Size - 8)) { break }
            $fontSize = $fontSize - 1
        }
        $titleBrush = New-Object System.Drawing.SolidBrush(
            [System.Drawing.Color]::FromArgb(255, 210, 170, 70))
        $shadowBrush = New-Object System.Drawing.SolidBrush(
            [System.Drawing.Color]::FromArgb(220, 0, 0, 0))
        $tx = ($Size - $tsz.Width) / 2
        $ty = $Size - $tsz.Height - [int]($Size * 0.02)
        $g.DrawString($text, $font, $shadowBrush, $tx + 2, $ty + 2)
        $g.DrawString($text, $font, $titleBrush, $tx, $ty)
        $font.Dispose()
        $titleBrush.Dispose()
        $shadowBrush.Dispose()
    }

    $g.Dispose()
    $bmp.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "Generated $OutPath"
}

# --- run -----------------------------------------------------------------

for ($n = 1; $n -le 7; $n++) {
    New-DogTag -Size 32 -Index $n -OutPath (Join-Path $texDir ("Item_DogTag_Subject{0:D2}.png" -f $n))
}

New-CompassWatch -Size 32 -OutPath (Join-Path $texDir "Item_CompassWatch.png")
New-Note         -Size 32 -OutPath (Join-Path $texDir "Item_MysteriousNote.png")

# 7 journal icons (one per subject; all 10 entries per subject share the icon).
for ($s = 1; $s -le 7; $s++) {
    New-Journal -Size 32 -SubjectID $s -OutPath (Join-Path $texDir ("Item_Journal_Subject{0:D2}.png" -f $s))
}

New-ModPoster -Size 256 -OutPath (Join-Path $modRoot "poster.png")    -ShowTitle $true
New-ModPoster -Size 256 -OutPath (Join-Path $modRoot "42/poster.png") -ShowTitle $true
New-ModPoster -Size 64  -OutPath (Join-Path $modRoot "icon.png")      -ShowTitle $false
New-ModPoster -Size 64  -OutPath (Join-Path $modRoot "42/icon.png")   -ShowTitle $false

Write-Host "`nAll textures generated."
