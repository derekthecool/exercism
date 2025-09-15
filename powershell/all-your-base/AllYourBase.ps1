function Invoke-Rebase() {
    <#
    .SYNOPSIS
    Convert a number, represented as a sequence of digits in one base, to any other base.

    .DESCRIPTION
    Implement general base conversion of a number.
    Given an array of digits represent a number in base "a", convert it and return an array of digits represent the same number in base "b".

    .PARAMETER Digits
    Array of digits represent the number to be converted.

    .PARAMETER InputBase
    The original base of the number.

    .PARAMETER OutputBase
    The base to be converted to.

    .EXAMPLE
    Invoke-Rebase -Digits @(1, 0, 1 , 0 ,1 ) -InputBase 2 -OutputBase 10
    return : @(2, 1)
    #>
    [CmdletBinding()]
    Param(
        [int[]]$Digits,
        [int]$InputBase,
        [int]$OutputBase
    )

  if($InputBase -le 1)
  {
      throw 'input base must be >= 2'
  }
  if($OutputBase -le 1)
  {
      throw 'output base must be >= 2'
  }
  foreach($number in $Digits)
  {
     if($number -ge $InputBase -or $number -lt 0)
     {
       throw 'all digits must satisfy 0 <= digit < input base'
     }
  }
  
  

    Write-Verbose "Digits: $Digits, InputBase: $InputBase, OutputBase: $OutputBase"

    $recoveredInput = 0
    for($DigitIndex = $Digits.Length - 1; $DigitIndex -ge 0; $DigitIndex--){
        $currentNumberAsBase10 = $Digits[$DigitIndex]
        $currentInputBaseSegment = $currentNumberAsBase10 * [Math]::Pow($InputBase,$DigitIndex)
        $recoveredInput += $currentInputBaseSegment
        # Write-Verbose "currentNumberAsBase10 = $currentNumberAsBase10"
        # Write-Verbose "currentInputBaseSegment = $currentInputBaseSegment"
        # Write-Verbose "recoveredInput = $recoveredInput"

        # PWSH 7 ternary operator to determine the equationEnding text
        $equationEnding = $DigitIndex -ne 0 ? ' + ' : ''
        
        $equationString += "($currentNumberAsBase10 x $InputBase ^ $DigitIndex)$equationEnding"
    }

    Write-Verbose "$equationString = $recoveredInput"

    # $recoveredInputAsString = "$recoveredInput"
    # for($OutputDigitIndex = 0; $OutputDigitIndex -lt $recoveredInputAsString.Length; $OutputDigitIndex++){
    #     $currentNumberForOutputBaseAsBase10 = [int]$recoveredInputAsString[$OutputDigitIndex]
    #     Write-Verbose "currentNumberForOutputBaseAsBase10 = $currentNumberForOutputBaseAsBase10"
    # }
  #
  $OutputResult = @()
   do {
    $Calculation = [Math]::DivRem($recoveredInput, $OutputBase)
    $recoveredInput = $Calculation.Item1
    $OutputResult += $Calculation.Item2
    Write-Verbose "[Math]::DivRem result where first item is dividend and second item is remainder: $Calculation"
   } while ($Calculation.Item1 -gt 0)

  $OutputResult
}
