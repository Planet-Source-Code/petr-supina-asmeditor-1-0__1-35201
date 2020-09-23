VERSION 5.00
Begin VB.Form frmFind 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Find/Replace"
   ClientHeight    =   2010
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5655
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   238
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmFind.frx":0000
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2010
   ScaleWidth      =   5655
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame fraFind 
      Height          =   1935
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4215
      Begin VB.CheckBox chkMatch 
         Caption         =   "&Match Case"
         Height          =   255
         Left            =   1200
         TabIndex        =   6
         Top             =   1560
         Width           =   1935
      End
      Begin VB.CheckBox chkWords 
         Caption         =   "Find &Whole Word Only"
         Height          =   255
         Left            =   1200
         TabIndex        =   5
         Top             =   1200
         Width           =   1935
      End
      Begin VB.ComboBox txtReplace 
         Height          =   315
         Left            =   1200
         TabIndex        =   4
         Top             =   720
         Width           =   2895
      End
      Begin VB.ComboBox txtFind 
         Height          =   315
         Left            =   1200
         TabIndex        =   2
         Top             =   240
         Width           =   2895
      End
      Begin VB.Label lblReplace 
         Caption         =   "Replace With:"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   780
         Width           =   1095
      End
      Begin VB.Label lblFind 
         Caption         =   "Find What:"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   300
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   4440
      TabIndex        =   10
      Top             =   1545
      Width           =   1095
   End
   Begin VB.CommandButton cmdReplaceAll 
      Caption         =   "Replace &All"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4440
      TabIndex        =   9
      Top             =   1065
      Width           =   1095
   End
   Begin VB.CommandButton cmdReplace 
      Caption         =   "&Replace"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4440
      TabIndex        =   8
      Top             =   585
      Width           =   1095
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "&Find Next"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   4440
      TabIndex        =   7
      Top             =   105
      Width           =   1095
   End
End
Attribute VB_Name = "frmFind"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim bNotFound As Boolean, bNotReplaced As Boolean

Private Sub FindIt()
If frmMain.RTB.Find(txtFind, frmMain.RTB.SelStart + frmMain.RTB.SelLength, , (rtfWholeWord And bWords) Or (rtfMatchCase And bMatch)) = -1 Then
bNotFound = True
MsgBox "'" & txtFind & "' not found", vbInformation
Else
bNotFound = False
End If
End Sub

Private Sub ReplaceIt()
If Len(frmMain.RTB.SelText) Then
frmMain.RTB.SelText = txtReplace
bNotReplaced = False
Else
bNotReplaced = True
End If
FindIt
End Sub

Private Sub AddText(txtObject As ComboBox)
Dim I&
For I = 0 To txtObject.ListCount
If txtObject.List(I) = txtObject Then I = -1: Exit For
Next
If I <> -1 Then txtObject.AddItem txtObject, 0
End Sub

Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub cmdFind_Click()
AddText txtFind
FindIt
End Sub

Private Sub cmdReplace_Click()
AddText txtFind
AddText txtReplace
ReplaceIt
End Sub

Private Sub cmdReplaceAll_Click()
Dim I&
MousePointer = vbArrowHourglass
cmdReplace_Click
If bNotReplaced = False Then I = 1
Do Until bNotFound
ReplaceIt
I = I + 1
Loop
MousePointer = vbDefault
SendMessage frmMain.RTB.hWnd, EM_EMPTYUNDOBUFFER, 0, ByVal 0&
MsgBox "Replaced " & I & " times", vbInformation
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
If UnloadMode <= 1 Then Cancel = True: Hide
End Sub

Private Sub chkMatch_Click()
bMatch = chkMatch
End Sub

Private Sub chkWords_Click()
bWords = chkWords
End Sub

Private Sub txtFind_Click()
txtFind_Change
End Sub

Private Sub txtFind_Change()
sFind = txtFind
cmdFind.Enabled = Len(txtFind)
cmdReplace.Enabled = cmdFind.Enabled
cmdReplaceAll.Enabled = cmdFind.Enabled
End Sub
