Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.Screen]::PrimaryScreen
$screenWidth = $screen.Bounds.Width
$screenHeight = $screen.Bounds.Height

$effects = @("invert","plasma", "rainbow", "waves", "noise", "random")
$fits = @("contain", "cover", "stretch", "none", "center")
$romUrl = "https://wiki.xxiivv.com/etc/catclock.tal.txt"
$count = 10  # Number of windows to launch

$uxntalExe = "uxntal.exe"

for ($i = 0; $i -lt $count; $i++) {
    $w = Get-Random -Minimum 200 -Maximum 640
    $h = Get-Random -Minimum 200 -Maximum 480
    $x = Get-Random -Minimum 0 -Maximum ($screenWidth - $w)
    $y = Get-Random -Minimum 0 -Maximum ($screenHeight - $h)
    $t = Get-Random -Minimum 3 -Maximum 10
    $scale = Get-Random -Minimum 1 -Maximum 3
    $efx = $effects | Get-Random
    $fit = $fits | Get-Random

    $args = @(
        "uxntal",
        "widget",
        "x^^$x",
        "y^^$y",
        "w^^$w",
        "h^^$h",
        "t^^$t",
        "efx^^$efx",
        "fit^^$fit",
        "scale^^$scale",
        "//$romUrl"
    )
    $argsString = $args -join ":"
    Write-Host "$uxntalExe $argsString"
    Start-Process -FilePath $uxntalExe -ArgumentList $argsString
}
