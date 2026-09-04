# Script de Renovação do Windows Server Evaluation
$LogPath = "C:\Windows\Logs\AutoRearm.log"
$TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Executa o rearm de forma silenciosa via cscript
$Output = cscript.exe //nologo C:\Windows\System32\slmgr.vbs /rearm 2>&1

# Registra a execução no log
"[$TimeStamp] Executando slmgr /rearm:" | Out-File -FilePath $LogPath -Append
$Output | Out-File -FilePath $LogPath -Append
"----------------------------------------" | Out-File -FilePath $LogPath -Append