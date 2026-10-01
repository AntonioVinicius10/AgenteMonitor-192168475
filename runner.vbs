Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Obtem a pasta atual onde o runner.vbs esta localizado
scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)

WshShell.CurrentDirectory = scriptPath

' Executa o PHP de forma oculta usando o caminho relativo correto
WshShell.Run "cmd.exe /c cd /d """ & scriptPath & """ && .\php\php.exe monitor.php", 0, False

Set WshShell = Nothing
Set fso = Nothing