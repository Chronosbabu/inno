[Setup]
AppName=Sacrément De Mariages
AppVersion=1.0
DefaultDirName={pf}\Sacrément De Mariages
DefaultGroupName=Sacrément De Mariages
OutputDir=.
OutputBaseFilename=Sacrement_De_Mariages_Setup
SetupIconFile=babu.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{commondesktop}\Sacrément De Mariages"; Filename: "{app}\mariage.exe"; IconFilename: "{app}\babu.ico"
Name: "{group}\Sacrément De Mariages"; Filename: "{app}\mariage.exe"

[Run]
Filename: "{app}\mariage.exe"; Description: "Lancer Sacrément De Mariages"; Flags: nowait postinstall skipifsilent

