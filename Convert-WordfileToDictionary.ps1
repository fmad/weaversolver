$dict = 5
Set-Location -LiteralPath $PSScriptRoot
$in = Get-Content ('english-{0}letters.txt' -f $dict)
$count = $in.Count
$pos = @{}
$out = New-Object string[] $count
for ($i = 0; $i -lt $count; $i++) {
    $pos[$in[$i]] = $i
}
for ( $l = 0; $l -lt $count; $l++ ) {
    Write-Progress -Activity 'Finding neighbours' -PercentComplete (100*$l/$count)
    $neighbours = @()
    $word = $in[$l]
    for ( $i = 0; $i -lt $dict; $i++ ) {
        $temp = $word.Substring(0,$i)+'?'+$word.Substring($i+1,$dict-1-$i)
        [string[]]$possible = $in.Where{ $_ -like $temp -and $_ -ne $word }
        foreach($p in $possible) {
            $neighbours += $pos[$p]
        }
    }
    $out[$l] = $neighbours -join ','
#    if ( $l%100 -eq 0 ) { Write-Host -NoNewline '.' }
}
Write-Progress -Activity 'Finding neighbours' -Completed
$out | ConvertTo-Json | Out-File ('neighbours{0}.json' -f $dict)