function Get-Acronym()
{
    ([regex]::Matches($args[1].ToUpper(), "[_' ]*([A-Z])[^- ]*") | ForEach-Object { $_.Groups[1].Value }) -join ''
}
