function Get-NucleotideCount()
{
  param(
    [ValidatePattern('^[GACT]*$', ErrorMessage = "Invalid nucleotide in strand")]
    [string]$Strand
  )

  function count
  {
    param([Parameter(ValueFromPipeline)]$Pattern) [regex]::Matches($Strand, $Pattern).Count
  }

  $counts = @{}
  'G', 'A', 'C', 'T' | ForEach-Object {
    $counts[$_] = $_ | count
  }
  $counts
}
