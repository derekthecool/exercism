function Invoke-SecretHandshake() {
    param(
        [int]$Number
    )

$actions = @{
    '1' = 'wink'
    '2' = 'double blink'
    '4' = 'close your eyes'
    '8' = 'jump'
}

# Get matching actions
$actions.Keys | Sort-Object -Descending:$($Number -band 16) | Where-Object { $_ -band $Number } | ForEach-Object { $actions[$_] }
}
