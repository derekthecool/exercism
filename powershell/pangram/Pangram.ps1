function Invoke-Panagram() {
    param([string]$Sentence)
    ([regex]::Matches($Sentence.ToLower(), '[a-z]') | Sort-Object -Unique).Length -eq 26
}
