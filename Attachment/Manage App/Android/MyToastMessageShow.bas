Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
'Class module
Private Sub Class_Globals
	Private p1 As Panel
	Private timerDelay As Timer
	Private lbl As Label
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(Panel1 As Panel)

	p1.Initialize("")
	Panel1.AddView(p1,0,-54dip,Panel1.Width,54dip)
	p1.Color = Colors.White
		
	lbl.Initialize("lblstop")
	lbl.TextColor = Colors.White
	lbl.Typeface = Typeface.LoadFromAssets("iran sans.ttf")
	lbl.TextSize = 11
	lbl.Gravity = Library.GetStringResourse("direction")
	p1.Color = Colors.Red
	p1.AddView(lbl,40,0,p1.Width-40,p1.Height)
	
End Sub

'Enter second for delay
Public Sub ShowToastMessageShow(Message As String,Delay As Long,IsSuccess As Boolean)
	
	lbl.Text = "  " & Message
	
	If IsSuccess Then
		p1.Color =Colors.RGB(0, 207, 187)
	Else
		p1.Color = Colors.RGB(184, 62, 31)
	End If
	
	p1.Top = -p1.Height
	p1.SetLayoutAnimated(600,0,0,p1.Width,p1.Height)
	DoEvents
	
	timerDelay.Initialize("timerdelay",1900)
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