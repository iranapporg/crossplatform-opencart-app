Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
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
	Panel1.AddView(p1,0,-76dip,Library.GetWidth,56dip)
	p1.Color = Colors.White
		
	lbl.Initialize("lblstop")
	bullet.Initialize("")
	bullet.TextColor = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_textcolor"))
	lbl.TextColor = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_textcolor"))
	Library.SetFont(bullet,"icomoon",12)
	bullet.Text = ""
	lbl.Font = Library.GetFont(14)
	lbl.AdjustFontSizeToFit = True
	
	p1.Color = Library.ConvertHex2Int(Library.GetStringResourse("toastshow_color"))
	
	lbl.TextAlignment = Library.GetStringResourse("direction_ios")
	bullet.TextAlignment = Library.GetStringResourse("direction_ios")
	
	p1.AddView(bullet,20,0,30,p1.Height)
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
	
	Library.SetFont(bullet,"icomoon",12)
	
	p1.Top = -p1.Height
	p1.SetLayoutAnimated(600,0.3,0,0,p1.Width,p1.Height)
	
	timerDelay.Initialize("timerdelay",Library.GetStringResourse("toastshow_delay") * 1000)
	timerDelay.Enabled = True
	
End Sub

Private Sub timerdelay_Tick
	p1.SetLayoutAnimated(600,0.3,0,-76dip,p1.Width,p1.Height)
	timerDelay.Enabled = False
End Sub

Private Sub lblstop_Click
	timerdelay_Tick
End Sub