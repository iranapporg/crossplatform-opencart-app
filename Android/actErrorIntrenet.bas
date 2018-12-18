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
	Public module As Object
	Public NoShop As String
End Sub

Sub Globals

	Private lbltitle As Label
	Private lbldetails As Label
	Private btnsetting As Button
	Private btnretry As Button
	Private pnlheader As Panel
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmerronet")
	
	Library.setLocalApp(Library.currLang)
	
	Library.ChangeStatusColor
	
	lbltitle.Text	= Library.GetStringResourse("error_net_title")
	
	If NoShop.Length = 0 Then
		lbldetails.Text = Library.GetStringResourse("error_net_details")
	Else
		lbldetails.Text = NoShop
	End If
	
	btnretry.Text	= Library.GetStringResourse("btnretry")
	btnsetting.Text = Library.GetStringResourse("btnsetting")
	pnlheader.Color = Library.Theme_Header
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	
	NoShop = ""
	
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		Activity.Finish
	End If
	
End Sub

Sub btnsetting_Click
	Dim se As Settings
	StartActivity(se.OpenSettinsUI)
End Sub

Sub btnretry_Click

	If Library.InternetState = False Then
		ToastMessageShow(Library.GetStringResourse("error_again_net"),False)
	Else
		Activity.Finish
		StartActivity(Main)
	End If
	
End Sub