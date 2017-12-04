#requires -Version 2

function Show-Process($Process, [Switch]$Maximize)
{
	  $sig = '
	    [DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
	    [DllImport("user32.dll")] public static extern int SetForegroundWindow(IntPtr hwnd);
	  '
	  
	  if ($Maximize) { $Mode = 3 } else { $Mode = 4 }
	  $type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru
	  $hwnd = $process.MainWindowHandle
	  $null = $type::ShowWindowAsync($hwnd, $Mode)
	  $null = $type::SetForegroundWindow($hwnd) 
}

function hide-process($name){
	$sig = '
	    [DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
	    [DllImport("user32.dll")] public static extern int SetBackgroundgroundWindow(IntPtr hwnd);
	  '
    Do {
        If (!(Get-Process -Name $name -ErrorAction SilentlyContinue)) {
               Start-Sleep -Seconds 1
        }Else {
            $Process = ps -Name $name             
            $MainWindowHandle = (Get-Process –Name $name).MainWindowHandle

            $Status = 'Done'
        }
    }Until ($Status)  

	$type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru
	$hwnd = $process.MainWindowHandle
	$Mode = '0'
	$null = $type::ShowWindowAsync($hwnd, $Mode)
}

function kill-window($name){	

	Do {
	    If (!(Get-Process -Name $name -ErrorAction SilentlyContinue)) {
	           Start-Sleep -Seconds 1
	    }Else {
	    	$Process = ps -Name $name	          
			Show-Process -Process $Process
			Add-Type -AssemblyName System.Windows.Forms
			[System.Windows.Forms.SendKeys]::SendWait('%{F4}');
			$Status = 'Done'
	    }
	}Until ($Status)
}


