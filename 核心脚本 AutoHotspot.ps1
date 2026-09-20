# AutoHotspot-min.ps1
while ($true) {
    $eth = Get-NetAdapter -ErrorAction SilentlyContinue |
           Where-Object { $_.Status -eq 'Up' -and $_.MediaType -eq '802.3' }

    $ni = [Windows.Networking.Connectivity.NetworkInformation,Windows.Networking.Connectivity,ContentType=WindowsRuntime]
    $profile = $ni::GetInternetConnectionProfile()

    if ($profile) {
        $tm = [Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager,Windows.Networking.NetworkOperators,ContentType=WindowsRuntime]
        $mgr = $tm::CreateFromConnectionProfile($profile)
        $state = $mgr.TetheringOperationalState.ToString()

        if ($eth -and $state -ne 'On') {
            $null = $mgr.StartTetheringAsync()
        }
        elseif (-not $eth -and $state -eq 'On') {
            $null = $mgr.StopTetheringAsync()
        }
    }
    Start-Sleep -Seconds 5
}
