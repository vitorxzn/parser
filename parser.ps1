$paths = Get-Content -Path .\*.txt | ForEach-Object {
    $parts = $_ -split "`t"
    if ($parts.Count -ge 2) {
        $parts[1]
    }
}

# Remove linhas vazias e duplicatas
$filteredPaths = $paths | Where-Object { $_ -ne "" } | Select-Object -Unique

# Cria o arquivo de saída
$filteredPaths | Out-File -FilePath .\filtered_paths.txt -Encoding UTF8

Write-Host "$((Get-Item .).FullName)\pathszinho.txt"
