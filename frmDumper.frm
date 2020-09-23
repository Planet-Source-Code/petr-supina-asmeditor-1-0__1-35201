VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmDumper 
   Caption         =   "COFF/PE Dumper"
   ClientHeight    =   6270
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7815
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   238
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmDumper.frx":0000
   LockControls    =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   418
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   521
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame fraActions 
      Height          =   1095
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7815
      Begin VB.CheckBox chkMatch 
         Appearance      =   0  'Flat
         Caption         =   "&Match Case"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5280
         TabIndex        =   8
         Top             =   735
         Width           =   1215
      End
      Begin VB.CheckBox chkWhole 
         Appearance      =   0  'Flat
         Caption         =   "&Whole Word"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   3960
         TabIndex        =   7
         Top             =   735
         Width           =   1215
      End
      Begin VB.CommandButton cmdFind 
         Caption         =   "&Find Next"
         Height          =   285
         Left            =   3000
         TabIndex        =   6
         Top             =   720
         Width           =   855
      End
      Begin VB.TextBox txtFind 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   120
         TabIndex        =   5
         Top             =   720
         Width           =   2880
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "&Save Dump..."
         Height          =   375
         Left            =   2040
         TabIndex        =   2
         Top             =   240
         Width           =   1815
      End
      Begin VB.CommandButton cmdClose 
         Cancel          =   -1  'True
         Caption         =   "&Close"
         Height          =   375
         Left            =   5880
         TabIndex        =   4
         Top             =   240
         Width           =   1815
      End
      Begin VB.CommandButton cmdInclude 
         Caption         =   "Create &INC File..."
         Height          =   375
         Left            =   3960
         TabIndex        =   3
         Top             =   240
         Width           =   1815
      End
      Begin VB.CommandButton cmdOpen 
         Caption         =   "&Open COFF/PE File..."
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1815
      End
   End
   Begin RichTextLib.RichTextBox rtbRep 
      Height          =   2655
      Left            =   0
      TabIndex        =   9
      Top             =   1110
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   4683
      _Version        =   393217
      BackColor       =   14737632
      BorderStyle     =   0
      HideSelection   =   0   'False
      ReadOnly        =   -1  'True
      ScrollBars      =   3
      RightMargin     =   1,00000e5
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"frmDumper.frx":000C
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
End
Attribute VB_Name = "frmDumper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim CurrentDir$, SName$

Private Sub cmdClose_Click()
Unload Me
End Sub

Private Sub cmdFind_Click()
If rtbRep.Find(txtFind, rtbRep.SelStart + rtbRep.SelLength, , (rtfWholeWord And -chkWhole.Value) Or (rtfMatchCase And -chkMatch.Value)) = -1 Then MsgBox "'" & txtFind & "' not found", vbInformation
End Sub

Private Sub cmdInclude_Click()
Dim OFN As OPENFILENAME, I&, J&, L&, S$, S1$, S2$, A$()
I = rtbRep.Find(" Exports" & vbCrLf & vbCrLf, 0, , rtfMatchCase Or rtfNoHighlight)
If I = -1 Then GoTo KO
J = rtbRep.Find("name", I + 12, , rtfMatchCase Or rtfNoHighlight)
If J = -1 Then GoTo KO
L = J - I - 11
I = rtbRep.Find(vbCr, I + 12, , rtfMatchCase Or rtfNoHighlight)
If I = -1 Then GoTo KO
I = I + 4
J = rtbRep.Find(vbCrLf & vbCrLf, I, , rtfMatchCase Or rtfNoHighlight)
If J = -1 Then GoTo KO
With OFN
.lpstrFile = SName & String$(260 - Len(SName), 0)
.nMaxFile = Len(.lpstrFile)
.lpstrFilter = "Include Files (*.inc)" & vbNullChar & "*.inc" & vbNullChar & vbNullChar
.lpstrDefExt = "inc"
.hwndOwner = hWnd
.hInstance = App.hInstance
.flags = 6
.lStructSize = Len(OFN)
If GetSaveFileName(OFN) = 0 Then Exit Sub
.lpstrFile = Left$(.lpstrFile, InStr(1, .lpstrFile, vbNullChar) - 1)
End With
Refresh
MousePointer = vbHourglass
S = Mid$(rtbRep.Text, I + 1, J - I)
A = Split(S, vbCrLf)
S = "; " & SName & " PROTOTYPES" & vbCrLf
S = S & "; " & String$(Len(S) - 4, "~") & vbCrLf & vbCrLf
For I = 0 To UBound(A)
S1 = Mid$(A(I), L)
J = InStr(1, S1, " ")
If J Then S1 = Left$(S1, J - 1)
A(I) = S1
S = S & "[extern " & S1 & "]" & vbCrLf
J = InStrRev(S1, "@")
If J > 1 Then
If Asc(Mid$(S1, J - 1, 1)) = vbKeyA Then
S2 = Left$(S1, J - 2) & Mid$(S1, J)
If I > 0 Then J = S2 <> A(I - 1)
If J Then S = S & S2 & " equ " & S1 & vbCrLf
End If
End If
Next
On Error Resume Next
Kill OFN.lpstrFile
I = FreeFile
Open OFN.lpstrFile For Binary Access Write As I
Put I, , S
Close I
MousePointer = vbDefault
Exit Sub
KO: MsgBox "Exports section not found", vbInformation
End Sub

Private Sub cmdOpen_Click()
Dim OFN As OPENFILENAME, S$, I&
With OFN
.hwndOwner = hWnd
.hInstance = App.hInstance
.lpstrFilter = "COFF/PE Files (*.lib;*.exe;*.dll;*.obj)" & vbNullChar & "*.lib;*.exe;*.dll;*.obj" & vbNullChar & "All Files (*.*)" & vbNullChar & "*" & vbNullChar & vbNullChar
.flags = &H1804
.lpstrFile = String$(260, 0)
.nMaxFile = Len(.lpstrFile)
.lStructSize = Len(OFN)
If GetOpenFileName(OFN) = 0 Then Exit Sub
S = Left$(.lpstrFile, InStr(1, .lpstrFile, vbNullChar) - 1)
S = Mid$(S, InStrRev(S, "\") + 1)
Caption = "COFF/PE Dumper - " & S
MousePointer = vbHourglass
Refresh
rtbRep.Text = "Loading..." & vbCrLf
rtbRep.Font.Bold = True
Refresh
RunHiddenAndWait "link.exe -dump /out:~list.tmp /all """ & S & """"
End With
MousePointer = vbDefault
If Len(Dir("~list.tmp")) = 0 Then
rtbRep.SelStart = Len(rtbRep.Text)
rtbRep.SelColor = vbRed
rtbRep.SelText = "Error!"
Exit Sub
End If
I = InStrRev(S, ".")
If I Then S = Left$(S, I - 1)
SName = S
rtbRep.Font.Bold = False
rtbRep.LoadFile "~list.tmp"
On Error Resume Next
Kill "~list.tmp"
End Sub

Private Sub cmdSave_Click()
Dim OFN As OPENFILENAME
With OFN
.lpstrFile = SName & String$(260 - Len(SName), 0)
.nMaxFile = Len(.lpstrFile)
.lpstrFilter = "Text Files (*.txt)" & vbNullChar & "*.txt" & vbNullChar & vbNullChar
.lpstrDefExt = "txt"
.hwndOwner = hWnd
.hInstance = App.hInstance
.flags = 6
.lStructSize = Len(OFN)
If GetSaveFileName(OFN) = 0 Then Exit Sub
Refresh
rtbRep.SaveFile Left$(.lpstrFile, InStr(1, .lpstrFile, vbNullChar) - 1), rtfText
End With
End Sub

Private Sub Form_Activate()
cmdOpen_Click
End Sub

Private Sub Form_Load()
Dim S$
SName = vbNullString
CurrentDir = CurDir$
S = App.Path
If Right$(S, 1) <> "\" Then S = S & "\"
On Error Resume Next
ChDrive S
ChDir S & "lib"
End Sub

Private Sub Form_Resize()
On Error Resume Next
fraActions.Width = ScaleWidth
rtbRep.Height = ScaleHeight - fraActions.Height - 1
rtbRep.Width = ScaleWidth
End Sub

Private Sub Form_Unload(Cancel As Integer)
ChDrive CurrentDir
ChDir CurrentDir
End Sub

Private Sub txtFind_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn Then cmdFind_Click: KeyAscii = 0
End Sub
