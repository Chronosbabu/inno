[Setup]
AppName=C-School
AppVersion=1.0
DefaultDirName={pf}\C-School
DefaultGroupName=C-School
OutputDir=.
OutputBaseFilename=C-School_Setup
SetupIconFile=babu.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{commondesktop}\C-School"; Filename: "{app}\C-School.exe"; IconFilename: "{app}\babu.ico"
Name: "{group}\C-School"; Filename: "{app}\C-School.exe"

[Run]
Filename: "{app}\C-School.exe"; Description: "Lancer C-School"; Flags: nowait postinstall skipifsilent

