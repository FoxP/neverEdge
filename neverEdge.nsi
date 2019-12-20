# define installer name
OutFile "neverEdge.exe"

# set %AppData% as install directory
InstallDir $APPDATA\neverEdge\

# default section start
Section

# define output path
SetOutPath $INSTDIR

# add registry keys and values
SetRegView 64
WriteRegDWORD HKLM "SOFTWARE\Microsoft\EdgeUpdate" "DoNotUpdateToEdgeWithChromium" 0x00000001
SetRegView 32
WriteRegDWORD HKLM "SOFTWARE\Microsoft\EdgeUpdate" "DoNotUpdateToEdgeWithChromium" 0x00000001
# add uninstall information to Add/Remove Programs
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge" "DisplayName" "neverEdge"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge" "Publisher" "Paul RENARD"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge" "DisplayVersion" "1.0.0"
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge" "VersionMajor" 1
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge" "VersionMinor" 0
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge" "EstimatedSize" 40
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge" "UninstallString" "$\"$INSTDIR\neverEdge_uninstaller.exe$\""

# define uninstaller name
WriteUninstaller $INSTDIR\neverEdge_uninstaller.exe

CreateDirectory $SMPROGRAMS\neverEdge
# create a shortcut named "Uninstall" in the start menu programs directory
# point the new shortcut at the uninstaller neverEdge_uninstaller.exe
CreateShortCut "$SMPROGRAMS\neverEdge\Uninstall.lnk" "$INSTDIR\neverEdge_uninstaller.exe"

# default section end
SectionEnd

# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"

# always delete uninstaller first
Delete $INSTDIR\neverEdge_uninstaller.exe

# remove registry keys and values
SetRegView 64
DeleteRegKey HKLM "SOFTWARE\Microsoft\EdgeUpdate"
SetRegView 32
DeleteRegKey HKLM "SOFTWARE\Microsoft\EdgeUpdate"
# remove uninstall information from Add/Remove Programs
DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\neverEdge"

# delete install directory
RMDir $INSTDIR
# now delete shortcuts
Delete $SMPROGRAMS\neverEdge\Uninstall.lnk
RMDir $SMPROGRAMS\neverEdge

SectionEnd