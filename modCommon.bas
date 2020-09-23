Attribute VB_Name = "modCommon"
Option Explicit

Global sEntry$, nPasses%, nAutoSave&, crFont&, nRecent&, nOut As Byte
Global bSubSys As Boolean, bRC As Boolean, bTASM As Boolean
Global sFind$, bWords As Boolean, bMatch As Boolean

Global Const HKEY_LOCAL_MACHINE = &H80000002

Global Const WM_CUT = &H300
Global Const WM_COPY = &H301
Global Const WM_PASTE = &H302
Global Const WM_CLEAR = &H303
Global Const WM_UNDO = &H304
Global Const WM_SETREDRAW = &HB

Enum EditControlMessages
    EM_GETSEL = &HB0
    EM_SETSEL = &HB1
    EM_GETRECT = &HB2
    EM_SETRECT = &HB3
    EM_SETRECTNP = &HB4
    EM_SCROLL = &HB5
    EM_LINESCROLL = &HB6
    EM_SCROLLCARET = &HB7
    EM_GETMODIFY = &HB8
    EM_SETMODIFY = &HB9
    EM_GETLINECOUNT = &HBA
    EM_LINEINDEX = &HBB
    EM_SETHANDLE = &HBC
    EM_GETHANDLE = &HBD
    EM_GETTHUMB = &HBE
    EM_LINELENGTH = &HC1
    EM_REPLACESEL = &HC2
    EM_GETLINE = &HC4
    EM_LIMITTEXT = &HC5
    EM_CANUNDO = &HC6
    EM_UNDO = &HC7
    EM_FMTLINES = &HC8
    EM_LINEFROMCHAR = &HC9
    EM_SETTABSTOPS = &HCB
    EM_SETPASSWORDCHAR = &HCC
    EM_EMPTYUNDOBUFFER = &HCD
    EM_GETFIRSTVISIBLELINE = &HCE
    EM_SETREADONLY = &HCF
    EM_SETWORDBREAKPROC = &HD0
    EM_GETWORDBREAKPROC = &HD1
    EM_GETPASSWORDCHAR = &HD2
End Enum

Enum ChooseFontFlags
    CF_SCREENFONTS = &H1
    CF_PRINTERFONTS = &H2
    CF_BOTH = CF_SCREENFONTS Or CF_PRINTERFONTS
    CF_SHOWHELP = &H4&
    CF_ENABLEHOOK = &H8&
    CF_ENABLETEMPLATE = &H10&
    CF_ENABLETEMPLATEHANDLE = &H20&
    CF_INITTOLOGFONTSTRUCT = &H40&
    CF_USESTYLE = &H80&
    CF_EFFECTS = &H100&
    CF_APPLY = &H200&
    CF_ANSIONLY = &H400&
    CF_SCRIPTSONLY = CF_ANSIONLY
    CF_NOVECTORFONTS = &H800&
    CF_NOOEMFONTS = CF_NOVECTORFONTS
    CF_NOSIMULATIONS = &H1000&
    CF_LIMITSIZE = &H2000&
    CF_FIXEDPITCHONLY = &H4000&
    CF_WYSIWYG = &H8000
    CF_FORCEFONTEXIST = &H10000
    CF_SCALABLEONLY = &H20000
    CF_TTONLY = &H40000
    CF_NOFACESEL = &H80000
    CF_NOSTYLESEL = &H100000
    CF_NOSIZESEL = &H200000
    CF_SELECTSCRIPT = &H400000
    CF_NOSCRIPTSEL = &H800000
    CF_NOVERTFONTS = &H1000000
End Enum

Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Type RGBQUAD
    rgbRed As Byte
    rgbGreen As Byte
    rgbBlue As Byte
    rgbReserved As Byte
End Type

Type OPENFILENAME
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustomFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As String
    lpstrFileTitle As String
    nMaxFileTitle As String
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Type CHOOSECOLOR
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    rgbResult As Long
    lpCustColors As String
    flags As Long
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Type LOGFONT
    lfHeight As Long
    lfWidth As Long
    lfEscapement As Long
    lfOrientation As Long
    lfWeight As Long
    lfItalic As Byte
    lfUnderline As Byte
    lfStrikeOut As Byte
    lfCharSet As Byte
    lfOutPrecision As Byte
    lfClipPrecision As Byte
    lfQuality As Byte
    lfPitchAndFamily As Byte
    lfFaceName As String * 31
End Type

Type CHOOSEFONT
    lStructSize As Long
    hwndOwner As Long
    hDC As Long
    lpLogFont As Long
    iPointSize As Long
    flags As ChooseFontFlags
    rgbColors As Long
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
    hInstance As Long
    lpszStyle As String
    nFontType As Integer
    MISSING_ALIGNMENT As Integer
    nSizeMin As Long
    nSizeMax As Long
End Type

Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
End Type

Type PROCESS_INFORMATION
    hProcess As Long
    hThread As Long
    dwProcessId As Long
    dwThreadId As Long
End Type

Type STARTUPINFO
    cb As Long
    lpReserved As Long
    lpDesktop As Long
    lpTitle As Long
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Byte
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type

Declare Function GetOpenFileName Lib "comdlg32" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Declare Function GetSaveFileName Lib "comdlg32" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
Declare Function ChooseFontA Lib "comdlg32" (pChoosefont As CHOOSEFONT) As Long
Declare Function ChooseColorA Lib "comdlg32" (pChoosecolor As CHOOSECOLOR) As Long

Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy&)
Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags&, ByVal dwBytes&) As Long
Declare Function GlobalFree Lib "kernel32" (ByVal hMem&) As Long
Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle&, ByVal dwMilliseconds&) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject&) As Long
Declare Function CreatePipe Lib "kernel32" (phReadPipe&, phWritePipe&, lpPipeAttributes As SECURITY_ATTRIBUTES, ByVal nSize&) As Long
Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpApplicationName$, ByVal lpCommandLine$, lpProcessAttributes As Any, lpThreadAttributes As Any, ByVal bInheritHandles&, ByVal dwCreationFlags&, lpEnvironment As Any, ByVal lpCurrentDriectory$, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Declare Function ReadFile Lib "kernel32" (ByVal hFile&, lpBuffer As Any, ByVal nNumberOfBytesToRead&, lpNumberOfBytesRead&, lpOverlapped As Any) As Long
Declare Function DuplicateHandle Lib "kernel32" (ByVal hSourceProcessHandle&, ByVal hSourceHandle&, ByVal hTargetProcessHandle&, lpTargetHandle&, ByVal dwDesiredAccess&, ByVal bInheritHandle&, ByVal dwOptions&) As Long
Declare Function GetCurrentProcess Lib "kernel32" () As Long

Declare Function SetTimer Lib "user32" (ByVal hWnd&, ByVal nIDEvent&, ByVal uElapse&, ByVal lpTimerFunc&) As Long
Declare Function KillTimer Lib "user32" (ByVal hWnd&, ByVal nIDEvent&) As Long
Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey&) As Integer
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd&, ByVal wMsg&, ByVal wParam&, lParam As Any) As Long
Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ptrMC As Any, P1 As Any, P2 As Any, P3 As Any, P4 As Any) As Long
Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hDC&, ByVal lpStr$, ByVal nCount&, lpRect As RECT, ByVal wFormat&) As Long

Declare Function ShellExecute Lib "shell32" Alias "ShellExecuteA" (ByVal hWnd&, ByVal lpOperation$, ByVal lpFile$, ByVal lpParameters$, ByVal lpDirectory$, ByVal nShowCmd&) As Long

Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey&, ByVal lpSubKey$, ByVal ulOptions&, ByVal samDesired&, phkResult&) As Long
Declare Function RegCloseKey Lib "advapi32" (ByVal hKey&) As Long
Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey&, ByVal lpValueName$, ByVal lpReserved&, lpType&, lpData As Any, lpcbData&) As Long

Sub TimerSave(ByVal hWnd&, ByVal nIDEvent&, ByVal uElapse&, ByVal lpTimerFunc&)
frmMain.AutoSave
End Sub

Function RegQueryString(ByVal hRoot&, sKey$, sValue$) As String
Dim hKey&, I&
If RegOpenKeyEx(hRoot, sKey, 0, 1, hKey) Then Exit Function
RegQueryValueEx hKey, sValue, 0, 1, ByVal 0, I
If I = 0 Then GoTo Out
RegQueryString = String$(I - 1, 0)
RegQueryValueEx hKey, sValue, 0, 1, ByVal RegQueryString, I
Out:
RegCloseKey hKey
End Function

Function GetLibs(szPath$) As String
Dim S$, B As Boolean
S = Dir(szPath & "\*.lib")
Start:
Do While Len(S)
GetLibs = GetLibs & " /defaultlib:" & S
S = Dir
Loop
If B Then Exit Function
S = Dir("*.lib")
B = True
GoTo Start
End Function

Function GetResource(szRCName$) As String
Dim S$
If bRC = False Then Exit Function
If Len(Dir(szRCName & ".rc")) = 0 Then Exit Function
If RunHiddenAndWait("rc.exe " & szRCName & ".rc", S) = False Then Exit Function
If Len(Dir(szRCName & ".res")) = 0 Then
If Len(S) <= 2 Then Exit Function
Do While InStr(1, S, vbCrLf & vbCrLf)
S = Replace(S, vbCrLf & vbCrLf, vbCrLf)
Loop
If Left$(S, 2) = vbCrLf Then S = Mid$(S, 3)
frmMain.UpdateLog "Resource errors (continuing without resources):" & vbCrLf & S, vbRed
Exit Function
End If
GetResource = szRCName & ".res "
End Function

Function RunNormal(sFile$, Optional cmdLine$, Optional sPath$) As Boolean
If ShellExecute(Screen.ActiveForm.hWnd, vbNullString, sFile, cmdLine, sPath, vbNormalFocus) <= 32 Then
frmMain.UpdateLog "Cannot execute:" & vbCrLf & sFile & " " & cmdLine, vbRed
Else
RunNormal = True
End If
End Function

Function RunHiddenAndWait(cmdLine$, Optional strOut$) As Boolean
Dim SA As SECURITY_ATTRIBUTES, PI As PROCESS_INFORMATION, SI As STARTUPINFO
Dim hOutputReadTmp&, hOutputRead&, hOutputWrite&
Dim hInputWriteTmp&, hInputRead&, hInputWrite&
Dim hErrorWrite&, S$, I&, Failed As Boolean
strOut = vbNullString
I = GetCurrentProcess
SA.nLength = Len(SA)
SA.bInheritHandle = True
CreatePipe hOutputReadTmp, hOutputWrite, SA, 0
DuplicateHandle I, hOutputWrite, I, hErrorWrite, 0, True, 2
CreatePipe hInputRead, hInputWriteTmp, SA, 0
DuplicateHandle I, hOutputReadTmp, I, hOutputRead, 0, False, 2
DuplicateHandle I, hInputWriteTmp, I, hInputWrite, 0, False, 2
CloseHandle hOutputReadTmp
CloseHandle hInputWriteTmp
SI.cb = Len(SI)
SI.dwFlags = &H101
SI.hStdOutput = hOutputWrite
SI.hStdInput = hInputRead
SI.hStdError = hErrorWrite
SI.wShowWindow = vbHide
Failed = CreateProcess(vbNullString, cmdLine, ByVal 0, ByVal 0, True, &H10, ByVal 0, vbNullString, SI, PI) = 0
CloseHandle hOutputWrite
CloseHandle hInputRead
CloseHandle hErrorWrite
If Failed Then GoTo Term
CloseHandle PI.hThread
WaitForSingleObject PI.hProcess, -1
Do
S = String$(1024, 0)
If ReadFile(hOutputRead, ByVal S, Len(S), I, ByVal 0&) = 0 Then Exit Do
strOut = strOut & Left$(S, I)
Loop
Term:
CloseHandle hOutputRead
CloseHandle hInputWrite
If Failed Then GoTo Out
CloseHandle PI.hProcess
RunHiddenAndWait = True
Exit Function
Out:
frmMain.UpdateLog "Cannot execute:" & vbCrLf & cmdLine, vbRed
End Function

Function CreateDefFromAsm(ByVal szAsmText$, szAsmPath$, szDefName$) As String
Dim H&, I&, J&, S1$, S2$, S3$
szAsmText = Replace(szAsmText, "GLOBAL", "GLOBAL", , , vbTextCompare)
S1 = "EXPORTS" & vbCrLf
H = 1
Do
Nxt:
H = InStr(H, szAsmText, "GLOBAL")
If H = 0 Then Exit Do
J = InStr(H + 6, szAsmText, vbCr)
If J = 0 Then Exit Do
I = InStrRev(szAsmText, vbLf, H)
I = I + 1: H = J + 2
S2 = StripLine(Mid$(szAsmText, I, J - I + 2))
If Len(S2) = 0 Then GoTo Nxt
S2 = Left$(S2, Len(S2) - 2)
If StrComp(Left$(S2, 7), "GLOBAL ") Then GoTo Nxt
S2 = Mid$(S2, 8)
If Right$(S2, 1) <> "," Then S2 = S2 & ","
Do
I = InStr(1, S2, ",")
If I = 0 Then Exit Do
S3 = Trim$(Left$(S2, I - 1)): S2 = Mid$(S2, I + 1)
If Asc(S3) = 95 Then S3 = Mid$(S3, 2)
I = InStrRev(S3, "@")
If I Then S3 = Left$(S3, I - 1)
If S3 <> sEntry Then S1 = S1 & S3 & vbCrLf
Loop
Loop
S2 = szDefName & ".def"
H = FreeFile
On Error Resume Next
Kill S2
Open S2 For Binary Access Write As H
Put H, , S1
Close H
CreateDefFromAsm = S2
End Function

Function CheckSymbol(szSymbol$) As Boolean
Dim A() As Byte, I&, B As Byte
If Len(szSymbol) = 0 Then Exit Function
A = StrConv(szSymbol, vbFromUnicode)
For I = LBound(A) To UBound(A)
B = A(I)
If B < 35 Or B > 36 And B < 46 Or B = 47 Or B > 57 And B < 63 Or B > 90 And B < 95 Or B = 96 Or B > 122 And B < 126 Or B > 126 Then Exit Function
Next
CheckSymbol = True
End Function

Function GetWholeWord(szText$, ByVal nPosition&) As String
Dim I&, J&, A%
I = nPosition: J = nPosition
Do
I = I - 1
If I < 1 Then Exit Do
A = Asc(LCase$(Mid$(szText, I, 1)))
If ((A < 48) Or (A > 57 And A < 97) Or (A > 122)) And A <> 37 And A <> 95 Then Exit Do
Loop
Do
If J > Len(szText) Then Exit Do
A = Asc(LCase$(Mid$(szText, J, 1)))
If ((A < 48) Or (A > 57 And A < 97) Or (A > 122)) And A <> 37 And A <> 95 Then Exit Do
J = J + 1
Loop
GetWholeWord = Mid$(szText, I + 1, J - I - 1)
End Function

Function StripLine(szLine$) As String
Dim I&
StripLine = Left$(szLine, Len(szLine) - 2)
I = InStr(1, StripLine, ";")
If I Then StripLine = Left$(StripLine, I - 1)
StripLine = Replace(StripLine, vbTab, " ")
StripLine = Trim$(StripLine)
Do While InStr(1, StripLine, "  ")
StripLine = Replace(StripLine, "  ", " ")
Loop
If StripLine <> vbNullString Then StripLine = StripLine & vbCrLf
End Function
