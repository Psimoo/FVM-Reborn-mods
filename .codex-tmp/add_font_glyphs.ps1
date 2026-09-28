Add-Type -AssemblyName System.Drawing
$chars = @('喵','<','煲','炫','飨','羿','豚','沌','黯','漪','槃','肴','黏','鳗','鲨','啰','±','戟','阈','焗','涮','绮')
$fonts = @('font_yuan')
foreach ($name in $fonts) {
  $dir = Join-Path 'fonts' $name
  $yyPath = Join-Path $dir ($name + '.yy')
  $pngPath = Join-Path $dir ($name + '.png')
  $text = [IO.File]::ReadAllText($yyPath)
  $fontSize = [float]([regex]::Match($text,'"size":([0-9.]+)').Groups[1].Value)
  $baseH = [int]([regex]::Match($text,'"([0-9]+)":\{"character":\1,"h":([0-9]+)').Groups[2].Value)
  $baseShift = [int]([regex]::Match($text,'"([0-9]+)":\{"character":\1,"h":[0-9]+,"offset":-?[0-9]+,"shift":([0-9]+)').Groups[2].Value)
  $img = [Drawing.Bitmap]::FromFile($pngPath)
  $oldW,$oldH = $img.Width,$img.Height
  $rows = [Math]::Ceiling($chars.Count / [Math]::Max(1,[Math]::Floor(($oldW-4)/42)))
  $out = [Drawing.Bitmap]::new($oldW, $oldH + $rows*48 + 4, [Drawing.Imaging.PixelFormat]::Format32bppArgb)
  $g = [Drawing.Graphics]::FromImage($out); $g.Clear([Drawing.Color]::Transparent); $g.DrawImageUnscaled($img,0,0)
  $font = New-Object Drawing.Font('Microsoft YaHei UI',$fontSize,[Drawing.FontStyle]::Regular,[Drawing.GraphicsUnit]::Pixel)
  $added = @(); $x = 2; $y = $oldH + 2
  foreach ($ch in $chars) {
    $code = [int][char]$ch
    if ($text -match ('"' + $code + '":\{"character"')) { continue }
    if ($x + 40 -ge $oldW) { $x = 2; $y += 48 }
    $box = New-Object Drawing.RectangleF($x,$y,40,44)
    $g.DrawString($ch,$font,[Drawing.Brushes]::White,$box,[Drawing.StringFormat]::GenericTypographic)
    $minX=40; $minY=44; $maxX=-1; $maxY=-1
    for($py=$y;$py -lt [Math]::Min($y+44,$out.Height);$py++){ for($px=$x;$px -lt $x+40;$px++){ if($out.GetPixel($px,$py).A -gt 0){$minX=[Math]::Min($minX,$px-$x);$minY=[Math]::Min($minY,$py-$y);$maxX=[Math]::Max($maxX,$px-$x);$maxY=[Math]::Max($maxY,$py-$y)}}}
    if($maxX -ge 0){
      $w=$maxX-$minX+1; $h=$maxY-$minY+1; $shift= if($code -lt 256){[Math]::Max(6,[int]($fontSize/2))}else{[Math]::Max($baseShift,[int]$fontSize)}
      $line = "    `"$code`":{`"character`":$code,`"h`":$h,`"offset`":$minX,`"shift`":$shift,`"w`":$w,`"x`":$($x+$minX),`"y`":$($y+$minY),},`r`n"
      $added += @{code=$code; line=$line}
    }
    $x += 42
  }
  $g.Dispose(); $font.Dispose(); $img.Dispose(); $out.Save($pngPath,[Drawing.Imaging.ImageFormat]::Png); $out.Dispose()
  $insert = ($added | ForEach-Object {$_.line}) -join ''
  $text = $text -replace '(  "glyphs":\{\r?\n)', ('$1' + $insert)
  foreach($a in $added){ $text = $text -replace '(  "ranges":\[\r?\n)', ('$1    {"lower":' + $a.code + ',"upper":' + $a.code + ',},`r`n') }
  [IO.File]::WriteAllText($yyPath,$text)
}
