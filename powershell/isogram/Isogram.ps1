function Invoke-Isogram()
{
  param(
    [string]$Phrase
  )
  $Phrase.ToUpper() -split '' |
    Where-Object { $_ -match '[a-z]' } |
    Group-Object |
    ForEach-Object -Begin { $onlyOnes = $true} -Process { if($_.Count -ne 1) {$onlyOnes = $false } } -End {$onlyOnes}
}
