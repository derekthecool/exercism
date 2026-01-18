function Get-NucleotideCount()
{
  param(
    [string]$Strand
  )

  if($Strand -notmatch '^[GACT]*$')
  {
    throw 'Invalid nucleotide in strand'
  }

  @{
    G = [regex]::Matches($Strand, 'G').Count
    A = [regex]::Matches($Strand, 'A').Count
    C = [regex]::Matches($Strand, 'C').Count
    T = [regex]::Matches($Strand, 'T').Count
  }
}
