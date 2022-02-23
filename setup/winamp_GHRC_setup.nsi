!define VERZIO "v0.9 beta"

;--------------------------------
;Include Modern UI

  !include "MUI.nsh"
  !include "Sections.nsh"

;--------------------------------

  Name $(CIM)
  OutFile "winamp_ghrc_setup.exe"
  BrandingText "Copyright Muráti Ákos, 2007 - http://www.murati.hu"

  ;Default installation folder
  InstallDir "$SMPROGRAMS\$(RCIM)\"
  
  InstallDirRegKey HKCU "Software\$(RCIM)" ""
;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages


  ;!insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "..\LICENSE"   
  !insertmacro MUI_PAGE_COMPONENTS
  ;!insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  ;!insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English" ;first language is the default language
  !insertmacro MUI_LANGUAGE "Hungarian"
;--------------------------------
;Reserve Files
  
  ;If you are using solid compression, files that are required before
  ;the actual installation should be stored first in the data block,
  ;because this will make your installer start faster.
  
  !insertmacro MUI_RESERVEFILE_LANGDLL


;--------------------------------
;Installer Sections
SectionGroup "$(TAVIRANYITO)"
Section /o $(SEC_A) SecPA
		SetOutPath "$INSTDIR\"
        setoverwrite on
        file "..\src\hid\A\Winamp GHRC.hid"
        file "..\LICENSE"
        file "..\README.md"
        WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section $(SEC_B) SecPB
		SetOutPath "$INSTDIR\"
        setoverwrite on
		file "..\src\hid\B\Winamp GHRC.hid"
        file "..\LICENSE"
        file "..\README.md"
		;file "..\dist\OlvassEl.htm"
		
        WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section /o $(SEC_C) SecPC
		SetOutPath "$INSTDIR\"
        setoverwrite on
		file "..\src\hid\C\Winamp GHRC.hid"
        file "..\LICENSE"
        file "..\README.md"
		;file "..\dist\OlvassEl.htm"
		
        WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd
SectionGroupEnd

SectionGroup "$(TELEPITES)"
Section $(SEC_NONE) SecPNONE
SectionEnd

Section /o $(SEC_BTS) SecPBTS
		MessageBox MB_OK|MB_ICONEXCLAMATION "$(WARN)$(SEC_BTS)!"
		execwait 'fsquirt.exe "$INSTDIR\Winamp GHRC.hid"'
SectionEnd

Section /o $(SEC_IRS) SecPIRS
		MessageBox MB_OK|MB_ICONEXCLAMATION "$(WARN)$(SEC_IRS)!"
		execwait 'irftp.exe "$INSTDIR\Winamp GHRC.hid"'
SectionEnd
SectionGroupEnd

;Descriptions
 ;Language strings
  LangString RCIM ${LANG_ENGLISH} "Winamp Bluetooth Remote Control"
  LangString CIM ${LANG_ENGLISH} "$(RCIM) for Sony-Ericsson Mobiles ${VERZIO}"
  LangString TAVIRANYITO ${LANG_ENGLISH} "Remote Control"
  LangString TELEPITES ${LANG_ENGLISH} "Install to Mobile"
  
  LangString SEC_A ${LANG_ENGLISH} "For 128x160 screen"
  LangString SEC_B ${LANG_ENGLISH} "For 176x220 screen"
  LangString SEC_C ${LANG_ENGLISH} "For 240x320 screen"
  
   LangString SEC_NONE ${LANG_ENGLISH} "None - Manual install"
  LangString SEC_BTS ${LANG_ENGLISH} "via Bluetooth"
  LangString SEC_IRS ${LANG_ENGLISH} "via Irda"
  
  LangString DESC_SecPA ${LANG_ENGLISH} "Installs Remote Control for Sony-Ericsson W300, K510, Z530, Z520, Z525."
  LangString DESC_SecPB ${LANG_ENGLISH} "Installs Remote Control for Sony-Ericsson Z550, K600, W600, K610, Z610, K618, K700, W700, K750, D750, W810."
  LangString DESC_SecPC ${LANG_ENGLISH} "Installs Remote Control for Sony-Ericsson S700, K790, K800, W850, W900."
  
  LangString DESC_SecPNONE ${LANG_ENGLISH} "Setup won't install the files to the mobile. Manual installation required."
  LangString DESC_SecPBTS ${LANG_ENGLISH} "Try to send directly the selected files to the Mobile via Bluetooth."
  LangString DESC_SecPIRS ${LANG_ENGLISH} "Try to send directly the selected files to the Mobile via IrDa."
  
  LangString WARN ${LANG_ENGLISH} "Please make sure, that your Mobile and PC have been connected! I will try to install the program "
  
  
  
  LangString RCIM ${LANG_HUNGARIAN} "Winamp Bluetooth Távirányító"
  LangString CIM ${LANG_HUNGARIAN} "$(RCIM) Sony-Ericsson Mobilokhoz ${VERZIO}"
  LangString TAVIRANYITO ${LANG_HUNGARIAN} "Távirányító"
  LangString TELEPITES ${LANG_HUNGARIAN} "Telepítés a telefonra"
  
  LangString SEC_A ${LANG_HUNGARIAN} "128x160-as kijelz?höz"
  LangString SEC_B ${LANG_HUNGARIAN} "176x220-as kijelz?höz"
  LangString SEC_C ${LANG_HUNGARIAN} "240x320-as kijelz?höz"
  
  LangString SEC_NONE ${LANG_HUNGARIAN} "Nincs telepítés - Kézi telepítés"
  LangString SEC_BTS ${LANG_HUNGARIAN} "Bluetoothon keresztül"
  LangString SEC_IRS ${LANG_HUNGARIAN} "Infra-porton keresztül"
  
  LangString DESC_SecPA ${LANG_HUNGARIAN} "Távirányító telepítése Sony-Ericsson W300, K510, Z530, Z520, Z525 mobilokhoz"
  LangString DESC_SecPB ${LANG_HUNGARIAN} "Távirányító telepítése Sony-Ericsson Z550, K600, W600, K610, Z610, K618, K700, W700, K750, D750, W810 mobilokhoz"
  LangString DESC_SecPC ${LANG_HUNGARIAN} "Távirányító telepítése Sony-Ericsson S700, K790, K800, W850, W900 mobilokhoz"
  
  LangString DESC_SecPNONE ${LANG_HUNGARIAN} "A telepít? nem fogja feltelepíteni a fájlokat, manuálisan kell telepíteni azokat."
  LangString DESC_SecPBTS ${LANG_HUNGARIAN} "Megpróbálja a fájlokat Bluetooth kapcsolaton keresztül átküldeni a mobilnak."
  LangString DESC_SecPIRS ${LANG_HUNGARIAN} "Megpróbálja a fájlokat Infra kapcsolaton keresztül átküldeni a mobilnak."
  
  LangString WARN ${LANG_HUNGARIAN} "Kérem gy?z?djön meg róla, hogy számítógépe és mobiltelefonja kapcsolódott egymáshoz. Most megpróbálom telepíteni a fájlokat "

 
  ;Assign descriptions to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecPA} $(DESC_SecPA)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecPB} $(DESC_SecPB)
	!insertmacro MUI_DESCRIPTION_TEXT ${SecPC} $(DESC_SecPC)
	
	!insertmacro MUI_DESCRIPTION_TEXT ${SecPNONE} $(DESC_SecPNONE)
	!insertmacro MUI_DESCRIPTION_TEXT ${SecPBTS} $(DESC_SecPBTS)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecPIRS} $(DESC_SecPIRS)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

Function .onInit

  !insertmacro MUI_LANGDLL_DISPLAY
  StrCpy $1 ${SecPB} ;
  StrCpy $2 ${SecPNONE} ;
FunctionEnd

Function .onSelChange

  !insertmacro StartRadioButtons $1
    !insertmacro RadioButton ${SecPA}
    !insertmacro RadioButton ${SecPB}
	!insertmacro RadioButton ${SecPC}
  !insertmacro EndRadioButtons
	
  !insertmacro StartRadioButtons $2
    !insertmacro RadioButton ${SecPNONE}
	!insertmacro RadioButton ${SecPBTS}
    !insertmacro RadioButton ${SecPIRS}
  !insertmacro EndRadioButtons
	
FunctionEnd

Section "Uninstall"
        rmdir /r "$INSTDIR"
SectionEnd
