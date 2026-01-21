[Setup]
AppName=C-Finance
AppVersion=1.0
DefaultDirName={pf}\C-School
DefaultGroupName=C-Finance
OutputDir=.
OutputBaseFilename=C-Finace_Setup
SetupIconFile=babu.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "x64\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{commondesktop}\C-Finance"; Filename: "{app}\C-Finance.exe"; IconFilename: "{app}\babu.ico"
Name: "{group}\C-Finance"; Filename: "{app}\C-Finance.exe"

[Run]
Filename: "{app}\C-Finance.exe"; Description: "Lancer C-Finance"; Flags: nowait postinstall skipifsilent

