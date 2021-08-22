### WARNING: I highly recommend buying Spotify Premium in order to help support Spotify, but in case you're unable to do so, this script exists to help make life a bit easier.
### This script removes all ads played through the Windows Spotify client
### Written by Ted Hong, inspired by Light
### Special thanks to the SpotifyHosts subreddit and the BlockTheSpot project for figuring out custom program files
### This script is licensed under the MIT License [https://mit-license.org/]
### squishycat92/AdlessSpotify [https://github.com/squishycat92/AdlessSpotify]

# Kill Spotify so files can be edited
taskkill.exe /f /t /im spotify.exe

# Fetch updated program files and unzip to a temporary folder
Set-Location ~
Invoke-WebRequest -OutFile temp999.zip -Uri https://github.com/mrpond/BlockTheSpot/releases/download/2021.8.17.39/chrome_elf.zip
Expand-Archive -LiteralPath ~\temp999.zip -DestinationPath ~\temp999

# Wait 5 seconds and delete the zipped folder
Start-Sleep 5
Remove-Item -Force '~\temp999.zip'

# Copy and inject into Spotify, this will only work if you're using the desktop version of Spotify!
Copy-Item '~\temp999\chrome_elf.dll' '~\AppData\Roaming\Spotify\' -Force
Copy-Item '~\temp999\config.ini' '~\AppData\Roaming\Spotify\' -Force

# Wait 10 seconds and delete original files
Start-Sleep 10
Remove-Item -Recurse -Force '~\temp999'

# Restart Spotify
~\AppData\Roaming\Spotify\Spotify.exe
