' AntivirusOffToast.vbs
Set objShell = CreateObject("WScript.Shell")

' Show the toast notification
objShell.Run "powershell -Command ""[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; $Template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02); $TextNodes = $Template.GetElementsByTagName('text'); $TextNodes.Item(0).AppendChild($Template.CreateTextNode('Warning')) > $null; $TextNodes.Item(1).AppendChild($Template.CreateTextNode('Turn on virus protection Virus protection is turned off. Tap or click to turn on, Microsoft Defender Antivirus.')) > $null; $Toast = [Windows.UI.Notifications.ToastNotification]::new($Template); [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Windows security').Show($Toast)"""

' Delete itself after showing the notification
strFile = WScript.ScriptFullName
objShell.Run "cmd /c ping 127.0.0.1 -n 2 > nul & del """ & strFile & """", 0, False
