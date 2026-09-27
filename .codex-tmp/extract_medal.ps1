Add-Type -AssemblyName System.Drawing

$inputPath = 'C:\Users\18203\AppData\Local\Temp\codex-clipboard-48c068d0-b9cb-43de-9e32-ce9519bc6e84.png'
$outputPath = 'D:\gameProject\FVM-Reborn-mod\sprites\spr_cross_server_medal.png'
$src = [Drawing.Bitmap]::new($inputPath)
$dst = [Drawing.Bitmap]::new($src.Width, $src.Height, [Drawing.Imaging.PixelFormat]::Format32bppArgb)
$queue = [Collections.Generic.Queue[object]]::new()
$seen = New-Object 'bool[,]' $src.Width,$src.Height
$backgroundColors = @(
    [Drawing.Color]::FromArgb(237,224,162),
    [Drawing.Color]::FromArgb(35,101,127),
    [Drawing.Color]::FromArgb(105,200,213)
)

for ($x = 0; $x -lt $src.Width; $x++) {
    $queue.Enqueue(@([Drawing.Point]::new($x, 0), 0))
    $queue.Enqueue(@([Drawing.Point]::new($x, $src.Height - 1), 2))
}
for ($y = 1; $y -lt ($src.Height - 1); $y++) {
    $queue.Enqueue(@([Drawing.Point]::new(0, $y), 1))
    $queue.Enqueue(@([Drawing.Point]::new($src.Width - 1, $y), 1))
}

function IsBackground([Drawing.Color]$color, [Drawing.Color]$base) {
    $dr = [int]$color.R - [int]$base.R
    $dg = [int]$color.G - [int]$base.G
    $db = [int]$color.B - [int]$base.B
    return (($dr * $dr) + ($dg * $dg) + ($db * $db)) -le 62 * 62
}

while ($queue.Count -gt 0) {
    $item = $queue.Dequeue()
    $p = $item[0]
    $kind = [int]$item[1]
    if ($p.X -lt 0 -or $p.X -ge $src.Width -or $p.Y -lt 0 -or $p.Y -ge $src.Height) { continue }
    if ($seen[$p.X, $p.Y]) { continue }
    $seen[$p.X, $p.Y] = $true
    $current = $src.GetPixel($p.X, $p.Y)
    if (!(IsBackground $current $backgroundColors[$kind])) { continue }
    $neighbors = @(
        [Drawing.Point]::new($p.X - 1, $p.Y), [Drawing.Point]::new($p.X + 1, $p.Y),
        [Drawing.Point]::new($p.X, $p.Y - 1), [Drawing.Point]::new($p.X, $p.Y + 1)
    )
    foreach ($n in $neighbors) {
        if ($n.X -lt 0 -or $n.X -ge $src.Width -or $n.Y -lt 0 -or $n.Y -ge $src.Height) { continue }
        if ($seen[$n.X, $n.Y]) { continue }
        $next = $src.GetPixel($n.X, $n.Y)
        if (IsBackground $next $backgroundColors[$kind]) { $queue.Enqueue(@($n, $kind)) }
    }
}

for ($y = 0; $y -lt $src.Height; $y++) {
    for ($x = 0; $x -lt $src.Width; $x++) {
        $color = $src.GetPixel($x, $y)
        if ($seen[$x, $y]) {
            $dst.SetPixel($x, $y, [Drawing.Color]::FromArgb(0, $color.R, $color.G, $color.B))
        } else {
            $isBlue = ($color.B -gt ($color.R + 28)) -and ($color.G -gt ($color.R + 38))
            $isTopYellow = ($y -lt 25) -and ($color.R -gt 180) -and ($color.G -gt 180) -and ($color.B -gt 115)
            if ($isBlue -or $isTopYellow) {
                $dst.SetPixel($x, $y, [Drawing.Color]::FromArgb(0, $color.R, $color.G, $color.B))
            } else {
                $dst.SetPixel($x, $y, $color)
            }
        }
    }
}

$cropped = $dst.Clone([Drawing.Rectangle]::new(10, 5, 140, 150), [Drawing.Imaging.PixelFormat]::Format32bppArgb)
for ($y = 0; $y -lt 8; $y++) {
    for ($x = 0; $x -lt $cropped.Width; $x++) {
        if ($x -lt 30 -or $x -gt 112) { $cropped.SetPixel($x, $y, [Drawing.Color]::Transparent) }
    }
}
$cropped.Save($outputPath, [Drawing.Imaging.ImageFormat]::Png)
$preview = [Drawing.Bitmap]::new($src.Width, $src.Height, [Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g = [Drawing.Graphics]::FromImage($preview)
$g.Clear([Drawing.Color]::White)
$g.DrawImageUnscaled($cropped, 0, 0)
$preview.Save('D:\gameProject\FVM-Reborn-mod\.codex-tmp\spr_cross_server_medal_preview.png', [Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$preview.Dispose()
$cropped.Dispose()
$src.Dispose()
$dst.Dispose()
Write-Output $outputPath
