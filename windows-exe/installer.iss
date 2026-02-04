[Setup]
AppName=C-SchoolApp
AppVersion=1.0
DefaultDirName={commonpf}\C-SchoolApp
DefaultGroupName=C-SchoolApp
OutputDir=.
OutputBaseFilename=C-SchoolApp-Setup
SetupIconFile=babu.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

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
Name: "{commondesktop}\C-SchoolApp"; Filename: "{app}\c_schollapp.exe"; IconFilename: "{app}\babu.ico"
Name: "{group}\C-SchoolApp"; Filename: "{app}\c_schollapp.exe"

[Run]
Filename: "{app}\c_schollapp.exe"; Description: "Lancer C-SchoolApp"; Flags: nowait postinstall skipifsilent

