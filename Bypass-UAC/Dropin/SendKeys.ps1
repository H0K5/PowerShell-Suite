function Show-Process($Process, [Switch]$Maximize)
{
	  $sig = '
	    [DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
	    [DllImport("user32.dll")] public static extern int SetForegroundWindow(IntPtr hwnd);
	    [DllImport("user32.dll")] public static extern IntPtr PostMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
	  '
	  
	  if ($Maximize) { $Mode = 3 } else { $Mode = 4 }
	  $type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru
	  $hwnd = $process.MainWindowHandle
	  $null = $type::ShowWindowAsync($hwnd, $Mode)
	  $null = $type::SetForegroundWindow($hwnd) 
}

function kill-window($name){	
	$Process = ps -Name $name
	Show-Process -Process $Process
	Add-Type -AssemblyName System.Windows.Forms
	[System.Windows.Forms.SendKeys]::SendWait('%{F4}');
}

function Show-Proc($Process, $Mode)
{
	  $sig = '
	    [DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
	    [DllImport("user32.dll")] public static extern int SetForegroundWindow(IntPtr hwnd);
	    [DllImport("user32.dll")] public static extern IntPtr PostMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
	  '	  
	  $type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru
	  $hwnd = $process.MainWindowHandle
	  $null = $type::ShowWindowAsync($hwnd, $Mode)
	  $null = $type::SetForegroundWindow($hwnd) 
}

### Mode 
# Hide 0
# Minimiz 6
# Show 5
# Show normal 1
# Show maximizd 3
