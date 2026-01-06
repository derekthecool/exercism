function Get-PhoneNumber()
{
    param(
        [string]$Number,
        [switch]$Pretty
    )
    $numbers = $Number -replace '\D', ''
    switch -Regex ($numbers)
    {
        "^1?(\d{3})([10])\d{2}(\d{4})" { throw "Exchange code can't start with $($Matches[2])" }
        "([10])\d{2}(\d{3})(\d{4})" { throw "Area code can't start with $($Matches[1])" }
        "^1?(\d{3})(\d{3})(\d{4})" { $Pretty ? "($($Matches[1]))-$($Matches[2])-$($Matches[3])" : $Matches[1..3] -join '' }
        "^\d { 9 }$" { throw "Number can't be fewer than 10 digits" }
        "^[^1]\d{10}" { throw "11 digits must start with 1" }
        "\d{12,}" { throw "Number can't be more than 11 digits" }
        default { throw "Letters not permitted" }
    }
}
