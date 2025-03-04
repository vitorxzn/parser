$caminho = Get-Content -Path (Get-ChildItem -Path . -Filter *.txt).FullName | ForEach-Object {
    $parts = $_ -split "`t"
    if ($parts.Count -ge 2) {
        $parts[1]
    }
}

$filteredPaths = $caminho | Where-Object { $_ -ne "" } | Select-Object -Unique
$filteredPaths | Out-File -FilePath .\paths.txt -Encoding UTF8

Get-ChildItem -Path . -Filter *.txt | Where-Object { $_.Name -ne 'paths.txt' } | Remove-Item -Force

Write-Host "feito"
