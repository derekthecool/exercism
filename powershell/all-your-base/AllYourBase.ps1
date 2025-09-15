function Invoke-Rebase() {
    param(
        [int[]]$Digits,
        [int]$InputBase,
        [int]$OutputBase
    )

    if ($InputBase -le 1) {
        throw 'input base must be >= 2'
    }
    if ($OutputBase -le 1) {
        throw 'output base must be >= 2'
    }
    foreach ($number in $Digits) {
        if ($number -ge $InputBase -or $number -lt 0) {
            throw 'all digits must satisfy 0 <= digit < input base'
        }
    }

    Write-Verbose "Digits: $Digits, InputBase: $InputBase, OutputBase: $OutputBase"

    $recoveredInput = 0
    $equationString = ""
    $DigitCount = $Digits.Length
    for ($DigitIndex = 0; $DigitIndex -lt $DigitCount; $DigitIndex++) {
        $power = $DigitCount - 1 - $DigitIndex
        $currentDigit = $Digits[$DigitIndex]
        $recoveredInput += $currentDigit * [Math]::Pow($InputBase, $power)
        $equationEnding = $power -ne 0 ? ' + ' : ''
        $equationString += "($currentDigit x $InputBase ^ $power)$equationEnding"
    }

    Write-Verbose "$equationString = $recoveredInput"

    $OutputResult = @()
    do {
        $Calculation = [Math]::DivRem($recoveredInput, $OutputBase)
        $recoveredInput = $Calculation.Item1
        $OutputResult += $Calculation.Item2
        Write-Verbose "[Math]::DivRem result where first item is dividend and second item is remainder: $Calculation"
    } while ($Calculation.Item1 -gt 0)

    # Reverse the output and return it
    [Array]::Reverse($OutputResult)
    $OutputResult
}
