VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMain 
   ClientHeight    =   7635
   ClientLeft      =   165
   ClientTop       =   705
   ClientWidth     =   9420
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   238
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LockControls    =   -1  'True
   ScaleHeight     =   7635
   ScaleWidth      =   9420
   StartUpPosition =   3  'Windows Default
   Begin RichTextLib.RichTextBox rtbLog 
      Height          =   1695
      Left            =   0
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   1440
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   2990
      _Version        =   393217
      BackColor       =   14737632
      BorderStyle     =   0
      Enabled         =   -1  'True
      HideSelection   =   0   'False
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"frmMain.frx":0E42
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   238
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin RichTextLib.RichTextBox RTB 
      Height          =   1215
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   2143
      _Version        =   393217
      BackColor       =   16777215
      BorderStyle     =   0
      HideSelection   =   0   'False
      ScrollBars      =   3
      RightMargin     =   1e6
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"frmMain.frx":0F4F
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Image imgResize 
      Height          =   45
      Left            =   0
      MousePointer    =   7  'Size N S
      Top             =   1320
      Width           =   1335
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuNew 
         Caption         =   "&New"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "&Open..."
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuSave 
         Caption         =   "&Save"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuSaveAs 
         Caption         =   "Save &As..."
      End
      Begin VB.Menu mnuSepF1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPrint 
         Caption         =   "&Print"
         Shortcut        =   ^P
      End
      Begin VB.Menu mnuSepF2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   0
      End
      Begin VB.Menu mnuSepF3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit	Alt+F4"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuUndo 
         Caption         =   "&Undo	Ctrl+Z"
      End
      Begin VB.Menu mnuSepE1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCut 
         Caption         =   "Cu&t	Ctrl+X"
      End
      Begin VB.Menu mnuCopy 
         Caption         =   "&Copy	Ctrl+C"
      End
      Begin VB.Menu mnuPaste 
         Caption         =   "&Paste	Ctrl+V"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "&Delete	Del"
      End
      Begin VB.Menu mnuSepE2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFind 
         Caption         =   "Fi&nd/Replace..."
         Shortcut        =   ^F
      End
      Begin VB.Menu mnuFindNext 
         Caption         =   "Find Ne&xt"
         Shortcut        =   {F3}
      End
      Begin VB.Menu mnuSepE3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSelAll 
         Caption         =   "Select &All	Ctrl+A"
      End
      Begin VB.Menu mnuGotoLine 
         Caption         =   "&Goto Line..."
         Shortcut        =   ^J
      End
      Begin VB.Menu mnuSepE4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuStrip 
         Caption         =   "&Strip Code"
      End
      Begin VB.Menu mnuSepE5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAppend 
         Caption         =   "Append"
         Begin VB.Menu mnuAEntry 
            Caption         =   "&Entry Point"
            Shortcut        =   ^{F1}
         End
         Begin VB.Menu mnuInfoLinker 
            Caption         =   "&Linker Info Section"
            Shortcut        =   ^{F2}
         End
         Begin VB.Menu mnuProcedure 
            Caption         =   "&Procedure..."
            Shortcut        =   ^{F3}
         End
      End
   End
   Begin VB.Menu mnuBuild 
      Caption         =   "&Build"
      Begin VB.Menu mnuBuildBin 
         Caption         =   "Build BI&N"
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuBuildDll 
         Caption         =   "Build &DLL"
         Shortcut        =   {F6}
      End
      Begin VB.Menu mnuBuildExe 
         Caption         =   "Build E&XE"
         Shortcut        =   {F7}
      End
      Begin VB.Menu mnuSepB1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuTest 
         Caption         =   "&Test Speed (BIN)"
         Shortcut        =   {F8}
      End
   End
   Begin VB.Menu mnuTools 
      Caption         =   "&Tools"
      Begin VB.Menu mnuOptions 
         Caption         =   "&Options..."
      End
      Begin VB.Menu mnuSepT1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuInclude 
         Caption         =   "COFF/PE &Dumper..."
      End
      Begin VB.Menu mnuConverter 
         Caption         =   "&Numeric Converter..."
      End
      Begin VB.Menu mnuCalc 
         Caption         =   "C&alculator..."
      End
      Begin VB.Menu mnuSepT2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClsLog 
         Caption         =   "&Clear Log"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuContents 
         Caption         =   "&Contents..."
      End
      Begin VB.Menu mnuReadme 
         Caption         =   "&Readme..."
      End
      Begin VB.Menu mnuHelpInstr 
         Caption         =   "&Under Cursor..."
         Shortcut        =   {F1}
      End
      Begin VB.Menu mnuSepH1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHome 
         Caption         =   "Ho&me Page..."
      End
      Begin VB.Menu mnuMail 
         Caption         =   "Mail Autho&r..."
      End
      Begin VB.Menu mnuSepH2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "&About..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim szOpened$, mY&, bSave As Boolean, bASave As Boolean, bSel As Boolean

Friend Sub UpdateLog(szText$, Optional ByVal crColor& = vbBlue)
With rtbLog
.SelStart = Len(.Text)
.SelColor = &H800000
.SelText = Time$ & " > "
.SelColor = crColor
.SelText = szText & IIf(Right$(szText, 2) = vbCrLf, vbNullString, vbCrLf)
.Refresh
End With
End Sub

Sub AddRecent(strFile$)
If nRecent = 0 Then Exit Sub
Dim I&
If Len(mnuRecent(0).Caption) Then
For I = 1 To mnuRecent.Count
If StrComp(mnuRecent(I - 1).Tag, strFile, vbTextCompare) = 0 Then I = -I: Exit For
Next
If I >= 0 Then
If mnuRecent.Count < nRecent Then Load mnuRecent(mnuRecent.Count)
I = mnuRecent.Count - 1
Else
I = -I - 1
End If
For I = I To 1 Step -1
mnuRecent(I).Tag = mnuRecent(I - 1).Tag
mnuRecent(I).Caption = mnuRecent(I - 1).Caption
Next
End If
mnuRecent(0).Tag = strFile
mnuRecent(0).Caption = Mid$(strFile, InStrRev(strFile, "\") + 1)
mnuRecent(0).Visible = True
End Sub

Friend Sub AutoSave()
If bSave = False Or bASave = False Then Exit Sub
On Error GoTo Out
RTB.SaveFile szOpened & "~", rtfText
UpdateLog "File auto saved:  " & szOpened & "~ (" & FormatNumber(Len(RTB.Text) / 1024, 1) & " kB - " & SendMessage(RTB.hWnd, EM_GETLINECOUNT, 0, ByVal 0&) & " lines)"
bASave = False
Exit Sub
Out:
UpdateLog "File cannot be auto saved because:  " & Err.Description, vbRed
End Sub

Private Sub CleanAutoSave()
If nAutoSave Then SetTimer hWnd, 1, nAutoSave * 60000, AddressOf TimerSave
On Error Resume Next
Kill szOpened & "~"
End Sub

Friend Sub SwitchForeColor()
Dim SS&, SL&, FL&, BC As Boolean
SS = RTB.SelStart: SL = RTB.SelLength: BC = bSave
FL = SendMessage(RTB.hWnd, EM_GETFIRSTVISIBLELINE, 0, ByVal 0&)
SendMessage RTB.hWnd, WM_SETREDRAW, 0, ByVal 0&
RTB.SelStart = 0: RTB.SelLength = Len(RTB.Text)
RTB.SelColor = crFont
RTB.SelStart = SendMessage(RTB.hWnd, EM_LINEINDEX, FL, ByVal 0&)
RTB.SelStart = SS: RTB.SelLength = SL
SendMessage RTB.hWnd, WM_SETREDRAW, 1, ByVal 0&
SendMessage RTB.hWnd, EM_EMPTYUNDOBUFFER, 0, ByVal 0&
RTB.Refresh: bSave = BC
End Sub

Private Sub LoadFile(szFileName$)
szOpened = szFileName
Dim S$
If Len(Dir(szOpened & "~")) Then
If MsgBox("Would you like to load auto saved file instead of this one?", vbQuestion + vbYesNo) = vbNo Then GoTo No
S = szOpened & "~"
Else
No: S = szOpened
End If
If Len(Dir(S)) Then
Open S For Binary Access Read As 1
S = String$(LOF(1), 0)
Get 1, , S
Close 1
RTB.Text = S
End If
bSave = False
Caption = "Assembler Editor - [" & szOpened & "]"
UpdateLog "File loaded:  " & szOpened & " (" & FormatNumber(Len(S) / 1024, 1) & " kB - " & SendMessage(RTB.hWnd, EM_GETLINECOUNT, 0, ByVal 0&) & " lines)"
AddRecent szOpened
S = Left$(szOpened, InStrRev(szOpened, "\"))
On Error Resume Next
ChDir S
ChDrive S
End Sub

Private Sub Form_Load()
Dim S$, I&, J&
Randomize
mY = -1
mnuNew_Click
Left = GetSetting("ASMEditor", vbNullChar, "Left", Left)
Top = GetSetting("ASMEditor", vbNullChar, "Top", Top)
Width = GetSetting("ASMEditor", vbNullChar, "Width", Width)
Height = GetSetting("ASMEditor", vbNullChar, "Height", Height)
WindowState = GetSetting("ASMEditor", vbNullChar, "WindowState", WindowState)
rtbLog.Height = GetSetting("ASMEditor", vbNullChar, "LogHeight", rtbLog.Height)
RTB.BackColor = GetSetting("ASMEditor", vbNullChar, "BackColor", RTB.BackColor)
rtbLog.BackColor = GetSetting("ASMEditor", vbNullChar, "LogColor", rtbLog.BackColor)
crFont = GetSetting("ASMEditor", vbNullChar, "FontColor", vbBlack)
With RTB.Font
.Name = GetSetting("ASMEditor", vbNullChar, "Font", .Name)
.Weight = GetSetting("ASMEditor", vbNullChar, "FontWeight", .Weight)
.Italic = GetSetting("ASMEditor", vbNullChar, "FontItalic", .Italic)
.Strikethrough = GetSetting("ASMEditor", vbNullChar, "FontStrike", .Strikethrough)
.Underline = GetSetting("ASMEditor", vbNullChar, "FontUnderline", .Underline)
.Charset = GetSetting("ASMEditor", vbNullChar, "FontCharset", .Charset)
.Size = GetSetting("ASMEditor", vbNullChar, "FontSize", .Size)
End With
SwitchForeColor
Form_Resize
Show
Refresh
sEntry = GetSetting("ASMEditor", vbNullChar, "Entry", "StdCall")
nPasses = GetSetting("ASMEditor", vbNullChar, "OptOffsets", 1)
nAutoSave = GetSetting("ASMEditor", vbNullChar, "AutoSave", 5)
bRC = GetSetting("ASMEditor", vbNullChar, "IncludeRC", -1)
bTASM = GetSetting("ASMEditor", vbNullChar, "TASM", 0)
nOut = -(GetSetting("ASMEditor", vbNullChar, "OutLib", 0) <> 0) _
Or (-(GetSetting("ASMEditor", vbNullChar, "OutList", 0) <> 0) * 2) _
Or (-(GetSetting("ASMEditor", vbNullChar, "OutMap", 0) <> 0) * 4) _
Or (-(GetSetting("ASMEditor", vbNullChar, "OutObj", 0) <> 0) * 8)
bSubSys = GetSetting("ASMEditor", vbNullChar, "Subsystem", 0)
nRecent = GetSetting("ASMEditor", "Recent", "Count", 4)
For I = 1 To nRecent
S = GetSetting("ASMEditor", "Recent", I)
If Len(S) Then
If Len(Dir(S)) Then
mnuRecent(mnuRecent.Count - 1).Tag = S
S = Mid$(S, InStrRev(S, "\") + 1)
mnuRecent(mnuRecent.Count - 1).Caption = S
Load mnuRecent(mnuRecent.Count)
End If
End If
Next
If Len(mnuRecent(0).Caption) Then Unload mnuRecent(mnuRecent.Count - 1) Else mnuRecent(0).Visible = False
If nAutoSave Then SetTimer hWnd, 1, nAutoSave * 60000, AddressOf TimerSave
UpdateLog "Program version " & App.Major & "." & App.Minor & " started"
S = Command$
If Len(S) = 0 Then Exit Sub
On Error GoTo Out
I = InStr(1, S, """")
If I Then
J = InStr(I + 1, S, """")
If J = 0 Then Exit Sub
S = Trim$(Mid$(S, I + 1, J - I - 1))
Else
S = Trim$(S)
I = InStr(1, S, " ")
If I Then S = Left$(S, I - 1)
End If
LoadFile S
Exit Sub
Out:
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
Dim I&
If bSave Then
I = MsgBox("Do you want to save changes?", vbQuestion + vbYesNoCancel)
If I = vbCancel Then Cancel = True
If I = vbYes Then mnuSave_Click
End If
If Cancel Then Exit Sub
KillTimer hWnd, 1
CleanAutoSave
SaveSetting "ASMEditor", vbNullChar, "Entry", sEntry
SaveSetting "ASMEditor", vbNullChar, "LogHeight", rtbLog.Height
SaveSetting "ASMEditor", vbNullChar, "OptOffsets", nPasses
SaveSetting "ASMEditor", vbNullChar, "Subsystem", -bSubSys
SaveSetting "ASMEditor", vbNullChar, "BackColor", RTB.BackColor
SaveSetting "ASMEditor", vbNullChar, "LogColor", rtbLog.BackColor
SaveSetting "ASMEditor", vbNullChar, "FontColor", crFont
SaveSetting "ASMEditor", vbNullChar, "AutoSave", nAutoSave
SaveSetting "ASMEditor", vbNullChar, "IncludeRC", -bRC
SaveSetting "ASMEditor", vbNullChar, "TASM", -bTASM
SaveSetting "ASMEditor", vbNullChar, "OutLib", -((nOut And 1) <> 0)
SaveSetting "ASMEditor", vbNullChar, "OutList", -((nOut And 2) <> 0)
SaveSetting "ASMEditor", vbNullChar, "OutMap", -((nOut And 4) <> 0)
SaveSetting "ASMEditor", vbNullChar, "OutObj", -((nOut And 8) <> 0)
With RTB.Font
SaveSetting "ASMEditor", vbNullChar, "Font", .Name
SaveSetting "ASMEditor", vbNullChar, "FontWeight", .Weight
SaveSetting "ASMEditor", vbNullChar, "FontItalic", -.Italic
SaveSetting "ASMEditor", vbNullChar, "FontStrike", -.Strikethrough
SaveSetting "ASMEditor", vbNullChar, "FontUnderline", -.Underline
SaveSetting "ASMEditor", vbNullChar, "FontCharset", .Charset
SaveSetting "ASMEditor", vbNullChar, "FontSize", .Size
End With
SaveSetting "ASMEditor", "Recent", "Count", nRecent
If Len(mnuRecent(0).Caption) Then
For I = 1 To mnuRecent.Count
SaveSetting "ASMEditor", "Recent", I, mnuRecent(I - 1).Tag
Next
End If
If WindowState <> vbMinimized Then SaveSetting "ASMEditor", vbNullChar, "WindowState", WindowState
If WindowState <> vbNormal Then Exit Sub
SaveSetting "ASMEditor", vbNullChar, "Left", Left
SaveSetting "ASMEditor", vbNullChar, "Top", Top
SaveSetting "ASMEditor", vbNullChar, "Width", Width
SaveSetting "ASMEditor", vbNullChar, "Height", Height
End Sub

Private Sub Form_Resize()
On Error Resume Next
RTB.Move 0, 0, ScaleWidth, ScaleHeight - rtbLog.Height - imgResize.Height
rtbLog.Move 0, RTB.Height + imgResize.Height, ScaleWidth
imgResize.Move 0, RTB.Height, ScaleWidth
End Sub

Private Sub imgResize_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
mY = Y
End Sub

Private Sub imgResize_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button <> 0 And mY <> -1 Then
If imgResize.Top + Y - mY >= 500 And imgResize.Top + Y - mY < ScaleHeight - 500 Then
RTB.Height = RTB.Height + Y - mY
rtbLog.Move 0, rtbLog.Top + Y - mY, ScaleWidth, rtbLog.Height - Y + mY
imgResize.Top = imgResize.Top + Y - mY
End If
End If
End Sub

Private Sub imgResize_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
mY = -1
End Sub

Private Sub mnuAbout_Click()
Dim MC() As Byte, R(11) As Byte, S$, I&
MC = LoadResData(101, "BIN")
If CallWindowProc(MC(0), ByVal 1, R(0), ByVal 0, ByVal 0) Then
S = "CPU Features:" & vbTab
CopyMemory I, R(4), 4
If I And &H1& Then S = S & "FPU"
If I And &H40000 Then S = S & ", Serial"
If I And &H800000 Then S = S & ", MMX"
If I And &H2000000 Then S = S & ", SSE"
If I And &H4000000 Then S = S & ", SSE2"
If I And &H40000000 Then S = S & ", IA-64"
If I And &H80000000 Then S = S & ", 3DNow!"
CallWindowProc MC(0), ByVal 0, R(0), ByVal 0, ByVal 0
S = "CPUID:" & vbTab & vbTab & StrConv(R, vbUnicode) & vbCrLf & S
Else
S = "CPUID is not supported on this processor." & vbCrLf _
& "You will be unable to test instructions speed."
End If
MsgBox "Assembler Editor " & App.Major & "." & App.Minor & " (for Netwide Assembler)" & vbCrLf _
& "Copyright © Peter Scale 2002" & vbCrLf & vbCrLf _
& "NASM version supported:" & vbTab & "0.98.34" & vbCrLf & vbCrLf _
& S, vbInformation
End Sub

Private Sub mnuAEntry_Click()
RTB.SelStart = Len(RTB.Text)
RTB.SelText = vbCrLf & vbCrLf _
& "[SECTION .text]" & vbCrLf & vbCrLf _
& "GLOBAL _" & sEntry & "@12" & vbCrLf _
& "_" & sEntry & "@12:" & vbCrLf _
& vbTab & "mov eax,1" & vbCrLf _
& vbTab & "ret 12" & vbCrLf
End Sub

Private Sub mnuBuildBin_Click()
Dim H&, S$, S1$
MousePointer = vbHourglass
UpdateLog "Compiling to binary file (" & Choose(nPasses + 1, "2-pass", "2-pass+", "10-pass++", "15-pass++") & ") ...", vbMagenta
H = InStrRev(szOpened, ".")
If H <= InStrRev(szOpened, "\") Then
S = szOpened & ".bin"
Else
S = Left$(szOpened, H - 1) & ".bin"
End If
RTB.SaveFile "Line", rtfText
S1 = Mid$(szOpened, InStrRev(szOpened, "\") + 1)
H = InStrRev(S1, ".")
If H Then S1 = Left$(S1, H - 1)
On Error Resume Next
If RunHiddenAndWait("nasmw.exe -f bin" & IIf(bTASM, " -t", vbNullString) & " -O" & nPasses & " -E errors.log" & IIf((nOut And 2) <> 0, " -l " & S1 & ".lst", vbNullString) & " -o """ & S & """ Line") = False Then GoTo Out
Open "errors.log" For Binary Access Read As 1
S1 = String$(LOF(1), 0)
Get 1, , S1
Close 1
If Len(S1) Then
Kill S
H = Len(rtbLog.Text)
UpdateLog "Compile errors:" & vbCrLf & S1, vbRed
rtbLog.SelStart = H
rtbLog.SelStart = H + 32
rtbLog_DblClick
rtbLog_SelChange
Else
UpdateLog "File built:  " & S & " (" & FormatNumber(FileLen(S), 0) & " Bytes)"
End If
Out:
Kill "errors.log"
Kill "Line"
MousePointer = vbDefault
End Sub

Private Sub mnuBuildDll_Click()
If RTB.Find(".text", 0, , rtfWholeWord Or rtfMatchCase Or rtfNoHighlight) = -1 Then
MsgBox "Section .text not found (see Readme)", vbExclamation
Exit Sub
End If
If RTB.Find("_" & sEntry & "@12", 0, , rtfWholeWord Or rtfMatchCase Or rtfNoHighlight) = -1 Then
MsgBox "Entry point not found: _" & sEntry & "@12 (see Readme)", vbExclamation
Exit Sub
End If
Dim H&, S$, S1$, S2$
MousePointer = vbHourglass
UpdateLog "Compiling to dynamic-link library (" & Choose(nPasses + 1, "2-pass", "2-pass+", "10-pass++", "15-pass++") & ") ...", vbMagenta
H = InStrRev(szOpened, ".")
If H <= InStrRev(szOpened, "\") Then
S = szOpened & ".dll"
Else
S = Left$(szOpened, H - 1) & ".dll"
End If
RTB.SaveFile "Line", rtfText
S1 = Mid$(szOpened, InStrRev(szOpened, "\") + 1)
H = InStrRev(S1, ".")
If H Then S1 = Left$(S1, H - 1)
If RunHiddenAndWait("nasmw.exe -f win32 -dll" & IIf(bTASM, " -t", vbNullString) & " -O" & nPasses & " -E errors.log" & IIf((nOut And 2) <> 0, " -l " & S1 & ".lst", vbNullString) & " Line") = False Then GoTo Out
Open "errors.log" For Binary Access Read As 1
S2 = String$(LOF(1), 0)
Get 1, , S2
Close 1
If Len(S2) Then
H = Len(rtbLog.Text)
UpdateLog "Compile errors:" & vbCrLf & S2, vbRed
rtbLog.SelStart = H
rtbLog.SelStart = H + 32
rtbLog_DblClick
rtbLog_SelChange
GoTo Out
End If
UpdateLog "Linking to dynamic-link library ...", vbMagenta
S2 = App.Path
If Right$(S2, 1) <> "\" Then S2 = S2 & "\"
S2 = S2 & "lib"
If RunHiddenAndWait("link.exe /dll /entry:" & sEntry & "@12 /out:""" & S1 & ".dll"" /def:""" & CreateDefFromAsm(RTB.Text, "Line", S1) & """" & IIf((nOut And 4) <> 0, " /map:" & S1 & ".map", vbNullString) & " Line.obj " & GetResource(S1) & "/libpath:""" & S2 & """" & GetLibs(S2), S2) = False Then GoTo Out
H = InStr(1, S2, vbCr)
H = InStr(H + 2, S2, vbCr)
H = InStr(H + 2, S2, vbCr)
If H Then S2 = Mid$(S2, H + 2) Else S2 = vbNullString
If Len(Dir(S)) Then
UpdateLog "File built:  " & S & " (" & FormatNumber(FileLen(S) / 1024, 1) & " kB)" & vbCrLf & S2
Else
H = Len(rtbLog.Text)
UpdateLog "Linker errors:" & vbCrLf & S2, vbRed
rtbLog.SelStart = H
End If
Out:
On Error Resume Next
Kill "Line"
Kill "Line.obj"
Kill "errors.log"
Kill S1 & ".def"
Kill S1 & ".res"
If (nOut And 1) = 0 Then Kill S1 & ".lib"
If (nOut And 8) = 0 Then Kill S1 & ".exp"
MousePointer = vbDefault
End Sub

Private Sub mnuBuildExe_Click()
If RTB.Find(".text", 0, , rtfWholeWord Or rtfMatchCase Or rtfNoHighlight) = -1 Then
MsgBox "Section .text not found (see Readme)", vbExclamation
Exit Sub
End If
If RTB.Find("_" & sEntry & "@12", 0, , rtfWholeWord Or rtfMatchCase Or rtfNoHighlight) = -1 Then
MsgBox "Entry point not found: _" & sEntry & "@12 (see Readme)", vbExclamation
Exit Sub
End If
Dim H&, S$, S1$, S2$
MousePointer = vbHourglass
UpdateLog "Compiling to executable file (" & Choose(nPasses + 1, "2-pass", "2-pass+", "10-pass++", "15-pass++") & ") ...", vbMagenta
H = InStrRev(szOpened, ".")
If H <= InStrRev(szOpened, "\") Then
S = szOpened & ".exe"
Else
S = Left$(szOpened, H - 1) & ".exe"
End If
RTB.SaveFile "Line", rtfText
S1 = Mid$(szOpened, InStrRev(szOpened, "\") + 1)
H = InStrRev(S1, ".")
If H Then S1 = Left$(S1, H - 1)
If RunHiddenAndWait("nasmw.exe -f win32" & IIf(bTASM, " -t", vbNullString) & " -O" & nPasses & " -E errors.log" & IIf((nOut And 2) <> 0, " -l " & S1 & ".lst", vbNullString) & " Line") = False Then GoTo Out
Open "errors.log" For Binary Access Read As 1
S2 = String$(LOF(1), 0)
Get 1, , S2
Close 1
If Len(S2) Then
H = Len(rtbLog.Text)
UpdateLog "Compile errors:" & vbCrLf & S2, vbRed
rtbLog.SelStart = H
rtbLog.SelStart = H + 32
rtbLog_DblClick
rtbLog_SelChange
GoTo Out
End If
UpdateLog "Linking to executable file (" & IIf(bSubSys, "Console", "GUI") & ") ...", vbMagenta
S2 = App.Path
If Right$(S2, 1) <> "\" Then S2 = S2 & "\"
S2 = S2 & "lib"
If RunHiddenAndWait("link.exe /entry:" & sEntry & "@12 /out:""" & S1 & ".exe""" & IIf((nOut And 4) <> 0, " /map:" & S1 & ".map", vbNullString) & " Line.obj " & GetResource(S1) & "/subsystem:" & IIf(bSubSys, "console", "windows") & " /libpath:""" & S2 & """" & GetLibs(S2), S2) = False Then GoTo Out
H = InStr(1, S2, vbCr)
H = InStr(H + 2, S2, vbCr)
H = InStr(H + 2, S2, vbCr)
If H Then S2 = Mid$(S2, H + 2) Else S2 = vbNullString
If Len(Dir(S)) Then
UpdateLog "File built:  " & S & " (" & FormatNumber(FileLen(S) / 1024, 1) & " kB)" & vbCrLf & S2
Else
H = Len(rtbLog.Text)
UpdateLog "Linker errors:" & vbCrLf & S2, vbRed
rtbLog.SelStart = H
End If
Out:
On Error Resume Next
Kill "Line"
Kill "Line.obj"
Kill "errors.log"
Kill S1 & ".res"
MousePointer = vbDefault
End Sub

Private Sub mnuCalc_Click()
RunNormal "calc.exe"
End Sub

Private Sub mnuClsLog_Click()
rtbLog.Text = vbNullString
End Sub

Private Sub mnuContents_Click()
RunNormal "doc\nasmdoc0.html", , App.Path
End Sub

Private Sub mnuConverter_Click()
frmConverter.Show vbModeless, Me
End Sub

Private Sub mnuCopy_Click()
SendMessage RTB.hWnd, WM_COPY, 0, ByVal 0&
End Sub

Private Sub mnuCut_Click()
SendMessage RTB.hWnd, WM_CUT, 0, ByVal 0&
End Sub

Private Sub mnuDelete_Click()
SendMessage RTB.hWnd, WM_CLEAR, 0, ByVal 0&
End Sub

Private Sub mnuExit_Click()
Unload Me
End Sub

Private Sub mnuFind_Click()
If Len(RTB.SelText) > 0 Then
frmFind.txtFind = RTB.SelText
Else
frmFind.txtFind = GetWholeWord(RTB.Text, RTB.SelStart + 1)
End If
frmFind.txtFind.SelLength = Len(frmFind.txtFind)
frmFind.Show vbModeless, Me
frmFind.txtFind.SetFocus
End Sub

Private Sub mnuFindNext_Click()
If Len(sFind) = 0 Then mnuFind_Click: Exit Sub
If frmMain.RTB.Find(sFind, RTB.SelStart + RTB.SelLength, , (rtfWholeWord And bWords) Or (rtfMatchCase And bMatch)) = -1 Then
MsgBox "'" & sFind & "' not found", vbExclamation
End If
End Sub

Private Sub mnuGotoLine_Click()
Dim S$, I&
I = SendMessage(RTB.hWnd, EM_GETLINECOUNT, 0, ByVal 0&)
Again:
S = InputBox("Goto line number:" & vbCrLf & "1 to " & I, , RTB.GetLineFromChar(RTB.SelStart) + 1)
If StrPtr(S) = 0 Then Exit Sub
If IsNumeric(S) = False Then GoTo Again
If S < 1 Or S > I Then GoTo Again
RTB.SelStart = SendMessage(RTB.hWnd, EM_LINEINDEX, S - 1, ByVal 0&)
RTB.SelLength = SendMessage(RTB.hWnd, EM_LINELENGTH, RTB.SelStart, ByVal 0&) + 2
End Sub

Private Sub mnuHelpInstr_Click()
Dim S$, S1$, C$, I&, J&
If Len(RTB.SelText) Then
C = RTB.SelText
Else
C = GetWholeWord(RTB.Text, RTB.SelStart + 1)
End If
If Len(C) = 0 Then MsgBox "Nothing under cursor", vbExclamation: Exit Sub
Debug.Print C
S = StrConv(LoadResData(101, "HELP"), vbUnicode)
I = InStr(1, S, "|" & LCase$(C) & "|")
If I = 0 Then MsgBox "Not recognized: " & C, vbExclamation: Exit Sub
J = InStrRev(S, "[", I)
C = Mid$(S, J + 1, InStr(J, S, "]") - J - 1)
J = InStrRev(S, vbLf, I)
S1 = App.Path
If Right$(S1, 1) <> "\" Then S1 = S1 & "\"
S = S1 & "doc/nasmdoc" & LCase$(Left$(C, 1)) & ".html#section-" & C & "." & Mid$(S, J + 1, InStr(J, S, "|") - J - 1)
S = "file:///" & Replace(S, " ", "%20")
S1 = RegQueryString(HKEY_LOCAL_MACHINE, "Software\Microsoft\IE Setup\Setup", "Path")
If Right$(S1, 1) <> "\" Then S1 = S1 & "\"
RunNormal S1 & "iexplore.exe", S, App.Path
End Sub

Private Sub mnuHome_Click()
RunNormal "http://flashlight.webpark.cz"
End Sub

Private Sub mnuInclude_Click()
frmDumper.Show vbModal, Me
End Sub

Private Sub mnuInfoLinker_Click()
RTB.SelStart = Len(RTB.Text)
RTB.SelText = vbCrLf & vbCrLf _
& "[SECTION .drectve info]" & vbCrLf _
& "db '' ; pass command line parameters for linker between ''" & vbCrLf
End Sub

Private Sub mnuMail_Click()
RunNormal "mailto:bishopx@quick.cz?subject=ASMEditor"
End Sub

Private Sub mnuNew_Click()
If bSave Then
Dim I As VbMsgBoxResult
I = MsgBox("Do you want to save changes?", vbQuestion + vbYesNoCancel)
If I = vbCancel Then Exit Sub
If I = vbYes Then mnuSave_Click
End If
CleanAutoSave
szOpened = CurDir$ & IIf(Right$(CurDir$, 1) = "\", vbNullString, "\") & "Untitled.asm"
Caption = "Assembler Editor - [" & szOpened & "]"
RTB.Text = vbNullString
bSave = False
End Sub

Private Sub mnuOpen_Click()
Dim OFN As OPENFILENAME
With OFN
.hwndOwner = hWnd
.hInstance = App.hInstance
.lpstrFilter = "Assembler Files (*.asm)" & vbNullChar & "*.asm" & vbNullChar & "All Files (*.*)" & vbNullChar & "*" & vbNullChar & vbNullChar
.flags = &H1804
.lpstrFile = String$(260, 0)
.nMaxFile = Len(.lpstrFile)
.lStructSize = Len(OFN)
If GetOpenFileName(OFN) = 0 Then Exit Sub
mnuNew_Click
If bSave = False Then LoadFile Left$(.lpstrFile, InStr(1, .lpstrFile, vbNullChar) - 1)
End With
End Sub

Private Sub mnuOptions_Click()
frmOptions.Show vbModal, Me
End Sub

Private Sub mnuPaste_Click()
SendMessage RTB.hWnd, WM_PASTE, 0, ByVal 0&
End Sub

Private Sub mnuPrint_Click()
RTB.SelLength = 0
RTB.SelPrint Printer.hDC
Printer.EndDoc
End Sub

Private Sub mnuProcedure_Click()
Dim S$, S1$
Again:
S = InputBox("Procedure name:")
If StrPtr(S) = 0 Then Exit Sub
S = Trim$(S)
If CheckSymbol(S) = False Then GoTo Again
Again1:
S1 = InputBox("Number of 32-bit arguments:" & vbCrLf & "(the value will be multiplied by 4 for usage)", , 0)
If StrPtr(S1) = 0 Then Exit Sub
If IsNumeric(S1) = False Then GoTo Again1
If S1 < 0 Or S1 > 16383 Then GoTo Again1
S1 = Int(S1) * 4
RTB.SelStart = Len(RTB.Text)
RTB.SelText = vbCrLf & vbCrLf _
& "GLOBAL _" & S & "@" & S1 & vbCrLf _
& "_" & S & "@" & S1 & ":" & vbCrLf _
& vbTab & "enter 0,0" & vbCrLf _
& vbTab & "push ebx" & vbCrLf _
& vbTab & "push esi" & vbCrLf _
& vbTab & "push edi" & vbCrLf & vbCrLf _
& vbTab & "; your code" & vbCrLf & vbCrLf _
& vbTab & "pop edi" & vbCrLf _
& vbTab & "pop esi" & vbCrLf _
& vbTab & "pop ebx" & vbCrLf _
& vbTab & "leave" & vbCrLf _
& vbTab & "ret" & IIf(S1 = 0, vbNullString, " " & S1) & vbCrLf
End Sub

Private Sub mnuReadme_Click()
RunNormal "doc\Readme.htm", , App.Path
End Sub

Private Sub mnuRecent_Click(Index As Integer)
mnuNew_Click
If bSave = False Then LoadFile mnuRecent(Index).Tag
End Sub

Private Sub mnuSave_Click()
On Error GoTo Out
RTB.SaveFile szOpened, rtfText
UpdateLog "File saved:  " & szOpened & " (" & FormatNumber(Len(RTB.Text) / 1024, 1) & " kB - " & SendMessage(RTB.hWnd, EM_GETLINECOUNT, 0, ByVal 0&) & " lines)"
bSave = False
CleanAutoSave
Exit Sub
Out:
If MsgBox(Err.Description, vbExclamation + vbRetryCancel) = vbRetry Then Resume
End Sub

Private Sub mnuSaveAs_Click()
Dim OFN As OPENFILENAME
With OFN
.lpstrFile = szOpened & String$(260 - Len(szOpened), 0)
.nMaxFile = Len(.lpstrFile)
.lpstrFilter = "Assembler Files (*.asm)" & vbNullChar & "*.asm" & vbNullChar & vbNullChar
.lpstrDefExt = "asm"
.hwndOwner = hWnd
.hInstance = App.hInstance
.flags = 6
.lStructSize = Len(OFN)
If GetSaveFileName(OFN) = 0 Then Exit Sub
szOpened = Left$(.lpstrFile, InStr(1, .lpstrFile, vbNullChar) - 1)
End With
Caption = "Assembler Editor - [" & szOpened & "]"
mnuSave_Click
AddRecent szOpened
End Sub

Private Sub mnuSelAll_Click()
RTB.SelStart = 0
RTB.SelLength = Len(RTB.Text) + 2
End Sub

Private Sub mnuStrip_Click()
If MsgBox("Do you wish to remove all unnecessary characters (comments etc.) for compilation?" & vbCrLf & "(Press 'Escape' key to stop during stripping.)", vbYesNo + vbQuestion) = vbNo Then Exit Sub
RTB.SelStart = 0
Do Until RTB.SelStart >= Len(RTB.Text) - 1
RTB.SelLength = SendMessage(RTB.hWnd, EM_LINELENGTH, RTB.SelStart, ByVal 0&) + 2
RTB.SelText = StripLine(RTB.SelText)
RTB.SelStart = RTB.SelStart + RTB.SelLength
If (GetAsyncKeyState(vbKeyEscape) And &HF000) <> 0 Then Exit Do
Loop
SendMessage RTB.hWnd, EM_EMPTYUNDOBUFFER, 0, ByVal 0&
End Sub

Private Sub mnuTest_Click()
Dim S$, MC() As Byte, I&, J&
MC = LoadResData(101, "BIN")
S = String$(6, 0)
If CallWindowProc(MC(0), ByVal 0, ByVal StrPtr(S), ByVal 0, ByVal 0) = 0 Then
MsgBox "Processor must be Pentium class or higher.", vbExclamation
Exit Sub
End If
MousePointer = vbHourglass
UpdateLog "Compiling to test file (" & Choose(nPasses + 1, "2-pass", "2-pass+", "10-pass++", "15-pass++") & ") ...", vbMagenta
S = StrConv(LoadResData(101, "ASM"), vbUnicode)
S = Replace(S, "custom:", RTB.Text)
On Error Resume Next
Kill "~test.asm"
Open "~test.asm" For Binary Access Write As 1
Put 1, , S
Close 1
If RunHiddenAndWait("nasmw.exe -f bin" & IIf(bTASM, " -t", vbNullString) & " -O" & nPasses & " -E errors.log ~test.asm") = False Then GoTo Out
If FileLen("errors.log") Then mnuBuildBin_Click: GoTo Out
UpdateLog "Testing 10 times ...", vbMagenta
Open "~test" For Binary Access Read As 1
ReDim MC(LOF(1) - 1)
Get 1, , MC
Close 1
Kill "errors.log"
Kill "~test.asm"
Kill "~test"
MousePointer = vbDefault
On Error GoTo RErr
CallWindowProc MC(0), ByVal 1, ByVal 0, ByVal 0, ByVal 0
I = CallWindowProc(MC(0), ByVal 10, ByVal 0, ByVal 0, ByVal 0)
J = CLng(I / 10)
UpdateLog "Test results:" & vbCrLf _
& "Average clock cycles taken:" & vbTab & J & vbCrLf _
& "Stability of average value:" & vbTab & FormatPercent(1 - IIf(J = 0, 0, Abs(J * 10 - I) / J))
Exit Sub
Out:
Kill "errors.log"
Kill "~test.asm"
Kill "~test"
MousePointer = vbDefault
Exit Sub
RErr:
UpdateLog "Runtime error " & Err.Number & ": " & Err.Description, vbRed
End Sub

Private Sub mnuUndo_Click()
SendMessage RTB.hWnd, WM_UNDO, 0, ByVal 0&
End Sub

Private Sub RTB_Change()
bSave = True
bASave = True
End Sub

Private Sub rtbLog_DblClick()
Dim I&, J&
I = SendMessage(rtbLog.hWnd, EM_LINEINDEX, rtbLog.GetLineFromChar(rtbLog.SelStart), ByVal 0&)
If Mid$(rtbLog.Text, I + 1, 5) = "Line:" Then
J = InStr(I + 6, rtbLog.Text, ":")
If J Then
On Error GoTo Out
J = Mid$(rtbLog.Text, I + 6, J - I - 6)
RTB.SelStart = SendMessage(RTB.hWnd, EM_LINEINDEX, J - 1, ByVal 0&)
RTB.SelLength = SendMessage(RTB.hWnd, EM_LINELENGTH, RTB.SelStart, ByVal 0&) + 2
bSel = True
End If
End If
Out:
End Sub

Private Sub rtbLog_SelChange()
If bSel Then
bSel = False
rtbLog.SelStart = SendMessage(rtbLog.hWnd, EM_LINEINDEX, rtbLog.GetLineFromChar(rtbLog.SelStart), ByVal 0&)
rtbLog.SelLength = SendMessage(rtbLog.hWnd, EM_LINELENGTH, rtbLog.SelStart, ByVal 0&) + 2
End If
End Sub
