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
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

	Private lbltitle As Label
	Private lblname As Label
	Private txtname As EditText
	Private lblemail As Label
	Private txtemail As EditText
	Private lbltext As Label
	Private txttext As EditText
	Private btnsend As Button
	Private pnlloading As Panel
	Private lblpb As Label
	Private pnlheader As Panel
	Dim MyToastMessageShow As MyToastMessageShow
	Private pbloading As ProgressBar
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmcontact")
	MyToastMessageShow.Initialize(Activity)
	Library.setLocalApp(Library.currLang)
	
	Library.ChangeStatusColor
	
	lbltitle.Text = Library.GetStringResourse("contact")
	lblpb.Text = Library.GetStringResourse("apply")
	pnlheader.Color = Library.Theme_Header
	
	lblname.Text = Library.GetStringResourse("tname")
	lblemail.Text = Library.GetStringResourse("email")
	lbltext.Text = Library.GetStringResourse("ttext")
	btnsend.Text = Library.GetStringResourse("send")
	btnsend.Background = Library.GetButtonState
	
	txtname.Color = Colors.RGB(250,250,250)
	txtemail.Color = Colors.RGB(250,250,250)
	txttext.Color = Colors.RGB(250,250,250)
	
	lblname.Gravity		= Library.GetStringResourse("direction")
	lblemail.Gravity	= Library.GetStringResourse("direction")
	lbltext.Gravity	= Library.GetStringResourse("direction")
	
	Library.EditTextIcon(txtemail,"ic_menu_cc")
	Library.EditTextIcon(txtname,"ic_menu_edit")
	Library.EditTextIcon(txttext,"ic_menu_edit")
	
	txtemail.InputType = 33
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Activity.Finish
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub btnsend_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),2,False)
		Return
	End If
	
	If txtname.Text.Length < 2 Or txttext.Text.Length < 25 Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_data").Replace("\n",CRLF),2,False)
		Return
	End If
	
	Dim op As OpenCart
	op.Initialize
	pnlloading.SetVisibleAnimated(500,True)
	op.ContactUs(Me,"SendReview_receive",txtemail.Text,txtname.Text,txttext.Text)
	
End Sub

Sub SendReview_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(600,False)
	
	Dim res1 As String
	res1 = res.Get("success")
	
	If res1.ToLowerCase = "true" Then
		txtemail.Text = ""
		txtname.Text = ""
		txttext.Text = ""
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("success_send"),2,True)
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_data").Replace("\n",CRLF),2,False)
	End If
	
End Sub
