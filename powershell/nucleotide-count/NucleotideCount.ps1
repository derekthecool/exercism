function Get-NucleotideCount()
{
  param(
    [ValidatePattern('^[GACT]*$', ErrorMessage = "Invalid nucleotide in strand")]
    [string]$Strand
  )

  @{
    G = [regex]::Matches($Strand, 'G').Count
    A = [regex]::Matches($Strand, 'A').Count
    C = [regex]::Matches($Strand, 'C').Count
    T = [regex]::Matches($Strand, 'T').Count
  }
}
