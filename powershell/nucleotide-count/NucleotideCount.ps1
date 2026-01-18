function Get-NucleotideCount()
{
  param(
    [ValidatePattern('^[GACT]*$', ErrorMessage = "Invalid nucleotide in strand")]
    [string]$Strand
  )

  function count
  {
    param([ValueFromPipeline]$Pattern) [regex]::Matches($Strand, $Pattern).Count
  }

  @{
    G = 'G'|count
    A = [regex]::Matches($Strand, 'A').Count
    C = [regex]::Matches($Strand, 'C').Count
    T = [regex]::Matches($Strand, 'T').Count
  }
}
