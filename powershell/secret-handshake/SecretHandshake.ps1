Function Invoke-SecretHandshake() {
    <#
    .SYNOPSIS
    Convert a number between 1 and 31 to a sequence of actions in the secret handshake.

    .DESCRIPTION
    The sequence of actions is chosen by looking at the rightmost five digits of the number once it's been converted to binary.
    Start at the right-most digit and move left.

    The actions for each number place are:
    00001 = wink
    00010 = double blink
    00100 = close your eyes
    01000 = jump
    10000 = Reverse the order of the operations in the secret handshake.
     #>
    param(
        [int]$Number
    )
    $actions = [ordered]@{
        <#1 = 'wink'
        2 = 'double blink'
        4 = 'close your eyes'
        #>
        8 = 'jump'
        4 = 'close your eyes'
        2 = 'double blink'
        1 = 'wink'
    }
    $result = $actions.Keys | ?{$Number -band $_} | %{$actions[$_]}
    <#
    if(($Number -band 16))
    {
        [array]::Reverse($result)
    }
    #>
    $result
}