Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	
End Sub

Sub Globals
	Private lbldesc As Label
	Private lblheader As Label
	Private btnok As Button
	Private pnlmain As Panel
	Private pnlheader As Panel
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmdisactiveshop")
	pnlheader.Color = Library.Theme_Header
	
	Library.setLocalApp(Library.currLang)
	
	lblheader.Text	= Library.GetStringResourse("alert")
	lbldesc.Text	= Library.GetStringResourse("shop_disactive")
	Library.LabelSpace(lbldesc,2)
	btnok.Background = Library.GetButtonState
	btnok.Text		= Library.GetStringResourse("ok")
	
	Library.ChangeStatusColor
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Activity.Finish
End Sub

Sub btnok_Click
	Activity.Finish
End Sub