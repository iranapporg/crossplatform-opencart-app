Type=Class
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
'Class module
Private Sub Class_Globals
	Private p1 As Panel
	Private timerDelay As Timer
	Private lbl,bullet As Label
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(Panel1 As Panel)

	p1.Initialize("")
	Panel1.AddView(p1,0,-54dip,Panel1.Width,54dip)
	p1.Color = Colors.White
		
	lbl.Initialize("lblstop")
	bullet.Initialize("")
	bullet.TextColor = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_textcolor"))
	lbl.TextColor = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_textcolor"))
	bullet.Typeface = Typeface.LoadFromAssets("icomoon.ttf")
	bullet.Text = ""
	lbl.Typeface = Library.GetFont
	lbl.TextSize = 12
	bullet.TextSize = 14
	
	p1.Color = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_color"))
	
	If Library.IsPersian Then
		lbl.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
		bullet.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
	Else
		lbl.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
		bullet.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
	End If
	
	p1.AddView(bullet,10dip,0,30dip,p1.Height)
	p1.AddView(lbl,40,0,p1.Width-40,p1.Height)
	
End Sub

'Enter second for delay
Public Sub ShowToastMessageShow(Message As String,Delay As Long,IsSuccess As Boolean)
	
	lbl.Text = "  " & Message
	
	If IsSuccess Then
		p1.Color = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_success"))
		bullet.Text = ""
	Else
		p1.Color = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_color"))
		bullet.Text = ""
	End If
	
	p1.Top = -p1.Height
	p1.SetLayoutAnimated(600,0,0,p1.Width,p1.Height)
	DoEvents
	
	timerDelay.Initialize("timerdelay",Library.GetStringResourse("toastshow_delay") * 1000)
	timerDelay.Enabled = True
	
End Sub

Private Sub timerdelay_Tick
	p1.SetLayoutAnimated(600,0,-p1.Height,p1.Width,p1.Height)
	timerDelay.Enabled = False
	DoEvents
End Sub

Private Sub lblstop_Click
	timerdelay_Tick
End Sub