VERSION 5.00
Begin VB.Form frmConverter 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Numeric Converter (32-bit)"
   ClientHeight    =   2265
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4695
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   238
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   151
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   313
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtFloat 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2400
      TabIndex        =   9
      Top             =   1560
      Width           =   2175
   End
   Begin VB.TextBox txtHex 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1560
      MaxLength       =   8
      OLEDropMode     =   2  'Automatic
      TabIndex        =   8
      Top             =   1200
      Width           =   3015
   End
   Begin VB.TextBox txtDec 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1560
      MaxLength       =   11
      OLEDropMode     =   2  'Automatic
      TabIndex        =   7
      Top             =   840
      Width           =   3015
   End
   Begin VB.TextBox txtOct 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1560
      MaxLength       =   11
      OLEDropMode     =   2  'Automatic
      TabIndex        =   6
      Top             =   480
      Width           =   3015
   End
   Begin VB.TextBox txtBin 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1560
      MaxLength       =   32
      OLEDropMode     =   2  'Automatic
      TabIndex        =   5
      Top             =   120
      Width           =   3015
   End
   Begin VB.Label lblFloat 
      Alignment       =   1  'Right Justify
      Caption         =   "Single-precision floating-point:"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1590
      Width           =   2175
   End
   Begin VB.Label lblAttribs 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   1950
      Width           =   4455
   End
   Begin VB.Label lblHex 
      Alignment       =   1  'Right Justify
      Caption         =   "Hexadecimal (16):"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1230
      Width           =   1335
   End
   Begin VB.Label lblDec 
      Alignment       =   1  'Right Justify
      Caption         =   "± Decimal (10):"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   870
      Width           =   1335
   End
   Begin VB.Label lblOct 
      Alignment       =   1  'Right Justify
      Caption         =   "Octan (8):"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   510
      Width           =   1335
   End
   Begin VB.Label lblBin 
      Alignment       =   1  'Right Justify
      Caption         =   "Binary (2):"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   150
      Width           =   1335
   End
End
Attribute VB_Name = "frmConverter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim bChange As Boolean

Private Sub NumAttribs()
Dim I As Byte, J As Byte, K As Byte
For I = 1 To Len(txtBin)
K = K Xor Mid$(txtBin, I, 1)
Next
K = -(K = 0)
I = (Len(txtHex) + 1) \ 2
If I = 3 Then I = 4
If Len(txtBin) = 32 And Asc(txtBin) = 49 Then J = 1
lblAttribs = "Align: " & I & " byte(s); Sign Bit: " & J & "; Even Parity: " & K
End Sub

Private Function Float(ByVal nVal&) As Single
On Error GoTo Out
CopyMemory Float, nVal, 4
Float = CSng(Float)
Exit Function
Out:
CopyMemory Float, -1&, 4
End Function

Private Function FInteger(ByVal nVal!) As Long
CopyMemory FInteger, nVal, 4
End Function

Private Function Bin(ByVal nVal&) As String
Dim MC() As Byte, I&
MC = LoadResData(102, "BIN")
Bin = String$(32, 0)
CallWindowProc MC(0), ByVal 0, nVal, ByVal Bin, ByVal 0
I = InStr(1, Bin, "1")
If I Then Bin = Mid$(Bin, I) Else Bin = "0"
End Function

Private Function BinR(ByVal sVal$) As Long
Dim MC() As Byte
If Len(sVal) = 0 Then Error 13
MC = LoadResData(102, "BIN")
sVal = String$(32 - Len(sVal), "0") & sVal
If CallWindowProc(MC(0), ByVal 1, BinR, ByVal sVal, ByVal 0) = 0 Then Error 13
End Function

Private Sub Form_Load()
txtDec = 0
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
If UnloadMode <= 1 Then Cancel = True: Hide
End Sub

Private Sub txtBin_Change()
If bChange Then Exit Sub
Dim I&
bChange = True
On Error GoTo Out
I = BinR(txtBin)
On Error GoTo 0
txtOct = Oct$(I)
txtDec = I
txtHex = Hex$(I)
txtFloat = Float(I)
NumAttribs
bChange = False
Exit Sub
Out:
txtBin = Bin(txtDec)
Resume
End Sub

Private Sub txtDec_Change()
If bChange Then Exit Sub
Dim I&
bChange = True
On Error GoTo Out
I = txtDec
On Error GoTo 0
txtBin = Bin(I)
txtOct = Oct$(I)
txtHex = Hex$(I)
txtFloat = Float(I)
NumAttribs
bChange = False
Exit Sub
Out:
txtDec = CLng("&H" & txtHex)
Resume
End Sub

Private Sub txtFloat_Change()
If bChange Then Exit Sub
Dim I&, S!
bChange = True
On Error GoTo Out
S = txtFloat
On Error GoTo 0
I = FInteger(S)
txtBin = Bin(I)
txtOct = Oct$(I)
txtDec = I
txtHex = Hex$(I)
NumAttribs
bChange = False
Exit Sub
Out:
txtFloat = Float(txtDec)
If InStr(1, txtFloat, "#") Then bChange = False: Exit Sub
Resume
End Sub

Private Sub txtHex_Change()
If bChange Then Exit Sub
Dim I&
bChange = True
On Error GoTo Out
I = "&H" & txtHex
On Error GoTo 0
txtBin = Bin(I)
txtOct = Oct$(I)
txtDec = I
txtFloat = Float(I)
NumAttribs
bChange = False
Exit Sub
Out:
txtHex = Hex$(txtDec)
Resume
End Sub

Private Sub txtOct_Change()
If bChange Then Exit Sub
Dim I&
bChange = True
On Error GoTo Out
I = "&O" & txtOct
On Error GoTo 0
txtBin = Bin(I)
txtDec = I
txtHex = Hex$(I)
txtFloat = Float(I)
NumAttribs
bChange = False
Exit Sub
Out:
txtOct = Oct$(txtDec)
Resume
End Sub
