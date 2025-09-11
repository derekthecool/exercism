function Add-Gigasecond() {
    param([DateTime]$Time)
    $Time.AddSeconds(1e9)
}
