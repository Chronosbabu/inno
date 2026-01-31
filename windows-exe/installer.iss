[Setup]
AppName=Gestion de Kiosques
AppVersion=1.0
DefaultDirName={commonpf}\Gestion de Kiosques
DefaultGroupName=Gestion de Kiosques
OutputDir=.
OutputBaseFilename=Gestion de Kiosques-Setup
SetupIconFile=babu.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64compatible

[Files]
; EXE principal
Source: "x64\runner\Release\c_schollapp.exe"; DestDir: "{app}"; Flags: ignoreversion

; DLL Flutter
Source: "x64\runner\Release\flutter_windows.dll"; DestDir: "{app}"; Flags: ignoreversion

; Données Flutter
Source: "x64\runner\Release\data\*"; DestDir: "{app}\data"; Flags: recursesubdirs createallsubdirs ignoreversion

; Icône
Source: "babu.ico"; DestDir: "{app}"

[Icons]
Name: "{commondesktop}\Gestion de Kiosques"; Filename: "{app}\c_schollapp.exe"; IconFilename: "{app}\babu.ico"
Name: "{group}\Gestion de Kiosques"; Filename: "{app}\c_schollapp.exe"

[Run]
Filename: "{app}\c_schollapp.exe"; Description: "Lancer Gestion de Kiosques"; Flags: nowait postinstall skipifsilent

