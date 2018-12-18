Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

private Sub Class_Globals
	Private pnl As Panel
	Private lblmessage As Label
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(Module As Activity)
	
	pnl.Initialize("")
	Module.AddView(pnl,0,0,100%x,100%y)
	pnl.LoadLayout("frmloading")
	pnl.Visible = False
	
End Sub

Sub ShowProgress(Message As String)
	lblmessage.Text = Message
	pnl.Visible = True
End Sub

Sub HideProgress
	pnl.Visible = False
End Sub