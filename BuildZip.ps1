function GetOptions($releaseType) {
    $version = (Get-Date -Format "yyyyMMdd")
    $destination = "Releases\ColorPickerPlus-v" + $version + "-" + $releaseType + ".zip"

    if ([string]::IsNullOrEmpty($releaseType))
    {
        $destination = "Releases\ColorPickerPlus-v" + $version + ".zip"
    }

    return @{
        Path = "ColorPickerPlus"
        CompressionLevel = "Fastest"
        Update = $true
        DestinationPath = $destination
    }
}

function BuildRelease($release) {
    $compress = (GetOptions($release))
    Compress-Archive @compress
}

BuildRelease ""
BuildRelease "Classic"
BuildRelease "BCC"
BuildRelease "WOTLKC"

