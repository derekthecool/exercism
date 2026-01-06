function Invoke-MicroBlog()
{
    ([Globalization.StringInfo]::GetTextElementEnumerator($args) |
        Select-Object -First 5) -join ''
}

