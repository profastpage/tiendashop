' Auto-Deploy Watcher - VBScript para ejecutar en background
' Guarda como: watch-deploy.vbs

Set WshShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Obtener ruta del script actual
strScriptPath = WScript.ScriptFullName
strFolder = objFSO.GetParentFolderName(strScriptPath)

' Ejecutar el batch en segundo plano
strBatchPath = strFolder & "\watch-deploy.bat"
WshShell.Run """" & strBatchPath & """", 0, False

' Minimizar ventana
WScript.Sleep 1000
WshShell.SendKeys "^{ESC}"
