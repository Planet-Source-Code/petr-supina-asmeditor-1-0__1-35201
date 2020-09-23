VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options"
   ClientHeight    =   6735
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5775
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   238
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmOptions.frx":0000
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6735
   ScaleWidth      =   5775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame fraRecent 
      Caption         =   "Recent Files"
      Height          =   615
      Left            =   2040
      TabIndex        =   15
      Top             =   2280
      Width           =   3735
      Begin VB.VScrollBar vscRecent 
         Height          =   285
         LargeChange     =   5
         Left            =   2775
         Max             =   0
         Min             =   -20
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   230
         Width           =   255
      End
      Begin VB.TextBox txtRecent 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2400
         MaxLength       =   2
         TabIndex        =   17
         ToolTipText     =   "Max 20"
         Top             =   230
         Width           =   375
      End
      Begin VB.Label lblRecent 
         Caption         =   "Limit number of recent files to:"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   270
         Width           =   2295
      End
   End
   Begin VB.CheckBox chkTASM 
      Appearance      =   0  'Flat
      Caption         =   "T&ASM Compatibility Mode"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   2520
      TabIndex        =   9
      ToolTipText     =   "Limited compatibility with Borland's TASM (see Help)"
      Top             =   1920
      Width           =   2175
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "&Help"
      Height          =   375
      Left            =   4560
      TabIndex        =   33
      Top             =   6240
      Width           =   1095
   End
   Begin VB.CommandButton cmdStorno 
      Cancel          =   -1  'True
      Caption         =   "&Storno"
      Height          =   375
      Left            =   3360
      TabIndex        =   32
      Top             =   6240
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   2160
      TabIndex        =   31
      Top             =   6240
      Width           =   1095
   End
   Begin VB.Frame fraColors 
      Caption         =   "Font && Background"
      Height          =   2415
      Left            =   0
      TabIndex        =   24
      Top             =   3720
      Width           =   5775
      Begin VB.CommandButton cmdLogBk 
         Caption         =   "Log Bac&kground Color..."
         Height          =   345
         Left            =   2940
         TabIndex        =   28
         Top             =   670
         Width           =   2715
      End
      Begin VB.PictureBox picFont 
         Height          =   915
         Left            =   120
         ScaleHeight     =   57
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   365
         TabIndex        =   29
         TabStop         =   0   'False
         ToolTipText     =   "Edit Window Preview"
         Top             =   1110
         Width           =   5535
      End
      Begin VB.CommandButton cmdBColor 
         Caption         =   "Main &Background Color..."
         Height          =   345
         Left            =   120
         TabIndex        =   27
         Top             =   670
         Width           =   2715
      End
      Begin VB.CommandButton cmdFColor 
         Caption         =   "Font &Color..."
         Height          =   345
         Left            =   2940
         TabIndex        =   26
         Top             =   240
         Width           =   2715
      End
      Begin VB.CommandButton cmdFont 
         Caption         =   "&Font && Style..."
         Height          =   345
         Left            =   120
         TabIndex        =   25
         Top             =   240
         Width           =   2715
      End
      Begin VB.Label lblLog 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " > Log"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   238
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   120
         TabIndex        =   30
         ToolTipText     =   "Log Window Preview"
         Top             =   2040
         Width           =   5535
      End
   End
   Begin VB.Frame fraAutoSave 
      Caption         =   "Auto Save"
      Height          =   615
      Left            =   2040
      TabIndex        =   19
      Top             =   3000
      Width           =   3735
      Begin VB.VScrollBar vscSave 
         Height          =   285
         LargeChange     =   5
         Left            =   1820
         Max             =   0
         Min             =   -60
         TabIndex        =   22
         TabStop         =   0   'False
         Top             =   230
         Width           =   255
      End
      Begin VB.TextBox txtSave 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1440
         MaxLength       =   2
         OLEDropMode     =   2  'Automatic
         TabIndex        =   21
         ToolTipText     =   "Enter 0 to disable; max 60"
         Top             =   230
         Width           =   375
      End
      Begin VB.Label lblSave2 
         Caption         =   "minutes"
         Height          =   255
         Left            =   2160
         TabIndex        =   23
         Top             =   270
         Width           =   615
      End
      Begin VB.Label lblSave 
         Caption         =   "Auto save after:"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   270
         Width           =   1215
      End
   End
   Begin VB.CheckBox chkRC 
      Appearance      =   0  'Flat
      Caption         =   "Include &RC File"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   2520
      TabIndex        =   8
      ToolTipText     =   "Include resource script (*.rc) if available"
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Frame fraOut 
      Caption         =   "Optional Output"
      Height          =   1335
      Left            =   0
      TabIndex        =   10
      Top             =   2280
      Width           =   1935
      Begin VB.CheckBox chkObject 
         Appearance      =   0  'Flat
         Caption         =   "Obj&ect (*.exp)"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   14
         ToolTipText     =   "DLL only"
         Top             =   960
         Width           =   1455
      End
      Begin VB.CheckBox chkMap 
         Appearance      =   0  'Flat
         Caption         =   "&Map (*.map)"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   13
         ToolTipText     =   "DLL & EXE only"
         Top             =   720
         Width           =   1455
      End
      Begin VB.CheckBox chkList 
         Appearance      =   0  'Flat
         Caption         =   "Lis&t (*.lst)"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   12
         ToolTipText     =   "BIN, DLL & EXE"
         Top             =   480
         Width           =   1455
      End
      Begin VB.CheckBox chkLib 
         Appearance      =   0  'Flat
         Caption         =   "&Library (*.lib)"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   11
         ToolTipText     =   "DLL only"
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.Frame fraPasses 
      Caption         =   "Multi-pass Optimization"
      Height          =   735
      Left            =   0
      TabIndex        =   3
      Top             =   720
      Width           =   5775
      Begin VB.ComboBox cboPasses 
         Height          =   315
         ItemData        =   "frmOptions.frx":000C
         Left            =   120
         List            =   "frmOptions.frx":001C
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "For more informations see Help"
         Top             =   270
         Width           =   5535
      End
   End
   Begin VB.Frame fraSubSys 
      Caption         =   "EXE Subsystem"
      Height          =   615
      Left            =   0
      TabIndex        =   5
      Top             =   1560
      Width           =   2295
      Begin VB.OptionButton optConsole 
         Appearance      =   0  'Flat
         Caption         =   "Co&nsole"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1200
         TabIndex        =   7
         Top             =   240
         Width           =   975
      End
      Begin VB.OptionButton optGUI 
         Appearance      =   0  'Flat
         Caption         =   "&GUI"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame fraEntry 
      Caption         =   "Entry Point"
      Height          =   615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5775
      Begin VB.TextBox txtEntry 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   120
         OLEDropMode     =   2  'Automatic
         TabIndex        =   1
         ToolTipText     =   "Case sensitive"
         Top             =   240
         Width           =   2415
      End
      Begin VB.Label lblEntry 
         Height          =   255
         Left            =   2640
         TabIndex        =   2
         Top             =   270
         Width           =   3015
      End
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim bEntry As Boolean

Private Sub cmdBColor_Click()
Dim CC As CHOOSECOLOR, CustColor(63) As Byte, I&
For I = 0 To 63
CustColor(I) = Rnd * 255
Next
With CC
.lStructSize = Len(CC)
.hwndOwner = hWnd
.hInstance = App.hInstance
.flags = 3
.rgbResult = picFont.BackColor
.lpCustColors = StrConv(CustColor, vbUnicode)
If ChooseColorA(CC) = 0 Then Exit Sub
picFont.BackColor = .rgbResult And &HFFFFFF
End With
picFont_Paint
End Sub

Private Sub cmdFColor_Click()
Dim CC As CHOOSECOLOR, CustColor(63) As Byte, I&
For I = 0 To 63
CustColor(I) = Rnd * 255
Next
With CC
.lStructSize = Len(CC)
.hwndOwner = hWnd
.hInstance = App.hInstance
.flags = 3
.rgbResult = picFont.ForeColor
.lpCustColors = StrConv(CustColor, vbUnicode)
If ChooseColorA(CC) = 0 Then Exit Sub
picFont.ForeColor = .rgbResult And &HFFFFFF
End With
picFont_Paint
End Sub

Private Sub cmdFont_Click()
Dim CF As CHOOSEFONT, LF As LOGFONT, pMem&
With LF
.lfHeight = ScaleY(picFont.Font.Size, vbPoints, vbPixels)
.lfItalic = -picFont.Font.Italic
.lfStrikeOut = -picFont.Font.Strikethrough
.lfUnderline = -picFont.Font.Underline
.lfWeight = picFont.Font.Weight
.lfCharSet = picFont.Font.Charset
.lfFaceName = picFont.Font.Name & vbNullChar
End With
pMem = GlobalAlloc(&H40, Len(LF))
CopyMemory ByVal pMem, LF, Len(LF)
CF.lStructSize = Len(CF)
CF.hwndOwner = hWnd
CF.lpLogFont = pMem
CF.flags = CF_BOTH Or CF_EFFECTS Or CF_FORCEFONTEXIST Or CF_INITTOLOGFONTSTRUCT
If ChooseFontA(CF) Then
CopyMemory LF, ByVal pMem, Len(LF)
With picFont.Font
.Name = Left$(LF.lfFaceName, InStr(LF.lfFaceName, vbNullChar) - 1)
.Weight = LF.lfWeight
.Italic = LF.lfItalic
.Strikethrough = LF.lfStrikeOut
.Underline = LF.lfUnderline
.Charset = LF.lfCharSet
.Size = ScaleY(-LF.lfHeight, vbPixels, vbPoints)
End With
End If
GlobalFree pMem
picFont_Paint
End Sub

Private Sub cmdHelp_Click()
Dim S1$, S$
S = App.Path
If Right$(S, 1) <> "\" Then S = S & "\"
S1 = RegQueryString(HKEY_LOCAL_MACHINE, "Software\Microsoft\IE Setup\Setup", "Path")
If Right$(S1, 1) <> "\" Then S1 = S1 & "\"
RunNormal S1 & "iexplore.exe", "file:///" & S & "doc\Readme.htm#Options", App.Path
End Sub

Private Sub cmdLogBk_Click()
Dim CC As CHOOSECOLOR, CustColor(63) As Byte, I&
For I = 0 To 63
CustColor(I) = Rnd * 255
Next
With CC
.lStructSize = Len(CC)
.hwndOwner = hWnd
.hInstance = App.hInstance
.flags = 3
.rgbResult = lblLog.BackColor
.lpCustColors = StrConv(CustColor, vbUnicode)
If ChooseColorA(CC) = 0 Then Exit Sub
lblLog.BackColor = .rgbResult And &HFFFFFF
End With
End Sub

Private Sub cmdOK_Click()
Dim I&
If bEntry Then
Beep
txtEntry.SetFocus
txtEntry.SelStart = 0
txtEntry.SelLength = Len(txtEntry)
Exit Sub
Else
sEntry = Trim$(txtEntry)
End If
bSubSys = optConsole.Value
bRC = chkRC.Value
bTASM = chkTASM.Value
nPasses = cboPasses.ListIndex
nAutoSave = txtSave
KillTimer frmMain.hWnd, 1
If nAutoSave Then SetTimer frmMain.hWnd, 1, nAutoSave * 60000, AddressOf TimerSave
nRecent = txtRecent
I = frmMain.mnuRecent.Count
For I = I - 1 To nRecent Step -1
If I = 0 Then frmMain.mnuRecent(0).Visible = False: Exit For
Unload frmMain.mnuRecent(I)
Next
nOut = chkLib.Value Or (chkList.Value * 2) Or (chkMap.Value * 4) Or (chkObject.Value * 8)
frmMain.rtbLog.BackColor = lblLog.BackColor
frmMain.RTB.BackColor = picFont.BackColor
crFont = picFont.ForeColor
With frmMain.RTB.Font
.Bold = picFont.Font.Bold
.Charset = picFont.Font.Charset
.Italic = picFont.Font.Italic
.Name = picFont.Font.Name
.Size = picFont.Font.Size
.Strikethrough = picFont.Font.Strikethrough
.Underline = picFont.Font.Underline
.Weight = picFont.Font.Weight
End With
frmMain.SwitchForeColor
Unload Me
End Sub

Private Sub cmdStorno_Click()
Unload Me
End Sub

Private Sub Form_Load()
txtEntry = sEntry
txtEntry.SelStart = 0
txtEntry.SelLength = Len(txtEntry)
optGUI.Value = Not bSubSys
optConsole.Value = bSubSys
chkRC.Value = -bRC
chkTASM.Value = -bTASM
cboPasses.ListIndex = nPasses
txtSave = nAutoSave
txtRecent = nRecent
chkLib.Value = -((nOut And 1) <> 0)
chkList.Value = -((nOut And 2) <> 0)
chkMap.Value = -((nOut And 4) <> 0)
chkObject.Value = -((nOut And 8) <> 0)
lblLog.BackColor = frmMain.rtbLog.BackColor
picFont.BackColor = frmMain.RTB.BackColor
picFont.ForeColor = crFont
With frmMain.RTB.Font
picFont.Font.Bold = .Bold
picFont.Font.Charset = .Charset
picFont.Font.Italic = .Italic
picFont.Font.Name = .Name
picFont.Font.Size = .Size
picFont.Font.Strikethrough = .Strikethrough
picFont.Font.Underline = .Underline
picFont.Font.Weight = .Weight
End With
End Sub

Private Sub picFont_Paint()
Dim RCT As RECT
picFont.Cls
RCT.Right = picFont.ScaleWidth
RCT.Bottom = picFont.ScaleHeight
DrawText picFont.hDC, picFont.Font.Name, -1, RCT, &H25
End Sub

Private Sub txtEntry_Change()
Dim S$
S = Trim$(txtEntry)
If CheckSymbol(S) Then
lblEntry.ForeColor = vbButtonText
lblEntry.Caption = "Preview: _" & S & "@12"
bEntry = False
Exit Sub
End If
lblEntry.ForeColor = vbRed
lblEntry.Caption = "Invalid format!"
bEntry = True
End Sub

Private Sub txtRecent_Change()
If IsNumeric(txtRecent) = False Then txtRecent = 0
If txtRecent < 0 Then txtRecent = 0
If txtRecent > 20 Then txtRecent = 20
vscRecent.Value = -txtRecent
End Sub

Private Sub txtSave_Change()
If IsNumeric(txtSave) = False Then txtSave = 0
If txtSave < 0 Then txtSave = 0
If txtSave > 60 Then txtSave = 60
vscSave.Value = -txtSave
End Sub

Private Sub vscRecent_Change()
txtRecent = -vscRecent.Value
End Sub

Private Sub vscSave_Change()
txtSave = -vscSave.Value
End Sub
