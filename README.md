# FFMPEG-Auto-Update-for-Windows
PS1 script to check the current version on gyan.dev and autoupdate to the latest version

The script checks ffmpeg version, which is available in PATH, and then checks version at https://www.gyan.dev/ffmpeg/builds/git-version.

If they are the same - nothing happens.

If they are different - the script downloads the archive with the new build into the `TEMP` folder (the address is defined in the windows variable, if you have disabled this folder through a variable or it does not exist, use the absolute path to the one you need), unzips it, then copies files from the unzipped folder to `C:\ffmpeg` replacing the same files, then it deletes the unzipped folder and the archive itself (you can specify your paths for convenience).

Pre-installed in the system:
```
- 7-zip amd ffmpeg added to PATH
- You may need elevated rights for PS if you do not initially have a folder in `C:\ffmpeg` (I have) and you're too lazy to create it yourself once
```

`ffmpeg-auto-update.vbs` is needed in case you like me decide to use Task Scheduler and you don't want to see the PS window pop up every time you start it. Inside you need to specify the path to your `ffmpeg-auto-update.ps1`. example: `$path_to_script` -> `C:\scripts\ffmpeg-auto-update.ps1`
