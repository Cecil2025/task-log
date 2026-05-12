Add-Type -AssemblyName System.Drawing

$sizes = @(72, 96, 128, 144, 152, 192, 384, 512)
$outputPath = "e:\Task follow"

foreach ($size in $sizes) {
    $bitmap = New-Object System.Drawing.Bitmap($size, $size)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Point(0, 0)),
        (New-Object System.Drawing.Point($size, $size)),
        [System.Drawing.Color]::FromArgb(91, 141, 239),
        [System.Drawing.Color]::FromArgb(74, 123, 217)
    )

    $cornerRadius = [int]($size * 0.18)
    $rect = New-Object System.Drawing.Rectangle(0, 0, $size, $size)
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath()
    $path.AddArc($rect.X, $rect.Y, $cornerRadius, $cornerRadius, 180, 90)
    $path.AddArc($rect.Right - $cornerRadius, $rect.Y, $cornerRadius, $cornerRadius, 270, 90)
    $path.AddArc($rect.Right - $cornerRadius, $rect.Bottom - $cornerRadius, $cornerRadius, $cornerRadius, 0, 90)
    $path.AddArc($rect.X, $rect.Bottom - $cornerRadius, $cornerRadius, $cornerRadius, 90, 90)
    $path.CloseFigure()
    $graphics.FillPath($brush, $path)

    $whiteBrush = [System.Drawing.Brushes]::White
    $padding = [int]($size * 0.2)
    $iconSize = $size - ($padding * 2)

    $font = New-Object System.Drawing.Font("Segoe UI Emoji", [int]($iconSize * 0.4), [System.Drawing.FontStyle]::Bold)

    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center

    $textRect = New-Object System.Drawing.RectangleF(0, 0, $size, $size)
    $graphics.DrawString("📋", $font, $whiteBrush, $textRect, $format)

    $filename = Join-Path $outputPath "icon-$size.png"
    $bitmap.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)

    $graphics.Dispose()
    $bitmap.Dispose()
    $brush.Dispose()
    $font.Dispose()

    Write-Host "Created: icon-$size.png"
}

$bitmap512 = New-Object System.Drawing.Bitmap(512, 512)
$graphics512 = [System.Drawing.Graphics]::FromImage($bitmap512)
$graphics512.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics512.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

$brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
    (New-Object System.Drawing.Point(0, 0)),
    (New-Object System.Drawing.Point(512, 512)),
    [System.Drawing.Color]::FromArgb(91, 141, 239),
    [System.Drawing.Color]::FromArgb(74, 123, 217)
)

$cornerRadius = 92
$rect = New-Object System.Drawing.Rectangle(0, 0, 512, 512)
$path = New-Object System.Drawing.Drawing2D.GraphicsPath()
$path.AddArc($rect.X, $rect.Y, $cornerRadius, $cornerRadius, 180, 90)
$path.AddArc($rect.Right - $cornerRadius, $rect.Y, $cornerRadius, $cornerRadius, 270, 90)
$path.AddArc($rect.Right - $cornerRadius, $rect.Bottom - $cornerRadius, $cornerRadius, $cornerRadius, 0, 90)
$path.AddArc($rect.X, $rect.Bottom - $cornerRadius, $cornerRadius, $cornerRadius, 90, 90)
$path.CloseFigure()
$graphics512.FillPath($brush, $path)

$whiteBrush = [System.Drawing.Brushes]::White
$font = New-Object System.Drawing.Font("Segoe UI Emoji", 200, [System.Drawing.FontStyle]::Bold)

$format = New-Object System.Drawing.StringFormat
$format.Alignment = [System.Drawing.StringAlignment]::Center
$format.LineAlignment = [System.Drawing.StringAlignment]::Center

$textRect = New-Object System.Drawing.RectangleF(0, 0, 512, 512)
$graphics512.DrawString("📋", $font, $whiteBrush, $textRect, $format)

$filename512 = Join-Path $outputPath "icon-512.png"
$bitmap512.Save($filename512, [System.Drawing.Imaging.ImageFormat]::Png)

$graphics512.Dispose()
$bitmap512.Dispose()
$brush.Dispose()
$font.Dispose()

Write-Host "Created: icon-512.png"
Write-Host "All icons generated successfully!"
