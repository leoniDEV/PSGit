# TODO: This is just a stub to make the first test pass
function Get-Status {
    [CmdletBinding()]
    param(
        [Parameter()]
        [String]$Path
    )
    end {
        "The path is not in a git repository!"
    }
}

function Get-Info {
    [CmdletBinding()]
    param(
        [Parameter()]
        $Path
    )
    process {
        "The path is not in a git repository!"
    }
}