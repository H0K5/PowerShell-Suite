#requires -Version 2
  $sig = '
    [DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
    [DllImport("user32.dll")] public static extern int SetForegroundWindow(IntPtr hwnd);
  ';
  $type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru
  
function handl(){
   param(      
      $name
   )    	

	Do {
		If (!(Get-Process -Name $name -ErrorAction SilentlyContinue)) {
			Start-Sleep -Seconds 1;
		}Else {            
			$Status = 'Done';
		}
	}Until ($Status)
	$p = ps -Name $name;
	return $p 
}

function Show-Process($name, [Switch]$Maximize)
{	  
	  if ($Maximize) { $Mode = 3 } else { $Mode = 4 }
	  $type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru
	  $process = handl -name $name
	  $hwnd = $process.MainWindowHandle
	  $null = $type::ShowWindowAsync($hwnd, $Mode)
	  $null = $type::SetForegroundWindow($hwnd) 
}

function hide-process(){
   param(      
      $name
   )    
	$process = handl -name $name
	$MainWindowHandle = (Get-Process –Name $name).MainWindowHandle

	$hwnd = $process.MainWindowHandle
	$Mode = '0'
	$null = $type::ShowWindowAsync($hwnd, $Mode)
}


function kill-window(){	
   param(      
      $name
   )             
	Show-Process -Process $name
	Add-Type -AssemblyName System.Windows.Forms
	[System.Windows.Forms.SendKeys]::SendWait('%{F4}');
	$Status = 'Done'
}

function send-keys(){	
   param(      
      $name, $cmd
   )            
	Show-Process -Process $name
	Add-Type -AssemblyName System.Windows.Forms
	[System.Windows.Forms.SendKeys]::SendWait($cmd);
	$Status = 'Done'
}

