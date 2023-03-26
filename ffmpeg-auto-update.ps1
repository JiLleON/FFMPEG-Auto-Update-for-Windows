$match = ffmpeg -version | Select-String -Pattern "ffmpeg version (.*(?=-full_build))"
$match1 = New-Object Net.WebClient
$ff_actual = (Out-String -InputObject $match1.DownloadString("https://www.gyan.dev/ffmpeg/builds/git-version")).Trim()
if ($match.matches.groups[1].value -ne $ff_actual){
    Invoke-WebRequest -Uri https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z -OutFile "$env:TEMP\ffmpeg-gyan-dev-auto.7z"
    7z x "$env:TEMP\ffmpeg-gyan-dev-auto.7z" -o"$env:TEMP"
    $ff_folder = Get-ChildItem -Path "$env:TEMP" | Where-Object { $_.Name -match "$ff_actual" }
    Copy-Item -Path "$env:TEMP\$ff_folder\*" "C:\ffmpeg" -Recurse -Force
    rm -r -fo "$env:TEMP\$ff_folder", "$env:TEMP\ffmpeg-gyan-dev-auto.7z"
    }
    else{
}
