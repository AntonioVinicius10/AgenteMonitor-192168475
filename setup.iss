[Setup]
AppName=Agente de Telemetria Helpdesk
AppVersion=1.0
DefaultDirName={autopf}\HelpdeskMonitor
DefaultGroupName=Helpdesk Monitor
UninstallDisplayIcon={app}\php\php.exe
Compression=lzma2
SolidCompression=yes
OutputDir=Output
OutputBaseFilename=Instalador_Monitor_Helpdesk
PrivilegesRequired=admin

[Files]
; Copia os arquivos essenciais para a pasta de instalação
Source: "monitor.php"; DestDir: "{app}"; Flags: ignoreversion
Source: "runner.vbs"; DestDir: "{app}"; Flags: ignoreversion

; Copia a pasta do PHP e todo o seu conteúdo
Source: "php\*"; DestDir: "{app}\php"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; Cria o atalho na pasta Inicializar (Startup) de todos os usuários
Name: "{commonstartup}\HelpdeskMonitorAgent"; Filename: "wscript.exe"; Parameters: """{app}\runner.vbs"""

; Se preferir criar na pasta Inicializar do usuário atual (C:\Users\<usuario>\AppData\Roaming\...\Startup):
; Name: "{userstartup}\HelpdeskMonitorAgent"; Filename: "wscript.exe"; Parameters: """{app}\runner.vbs"""

[Run]
; Inicia o agente automaticamente logo após finalizar a instalação
Filename: "wscript.exe"; Parameters: """{app}\runner.vbs"""; Flags: runhidden postinstall; Description: "Iniciar o Monitor agora"

[UninstallRun]
; Encerra o PHP antes de desinstalar para evitar arquivo bloqueado
Filename: "taskkill.exe"; Parameters: "/F /IM php.exe"; Flags: runhidden waituntilterminated