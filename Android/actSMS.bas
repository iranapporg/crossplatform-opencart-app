Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle:False
#End Region

Sub Process_Globals
	Public Basket As String
End Sub

Sub Globals
	Private txtname As EditText
	Private btnsend As Button
	Private lblphone As Label
	Private lbltitle As Label
	Private MyToastMessageShow1 As MyToastMessageShow
	Private txtcomment As EditText
	Private lblcomment As Label
	Private btnproduts As Button
	Private pnlheader As Panel
End Sub

Sub Activity_Create(FirstTime As Boolean)

	Activity.LoadLayout("frmsms")
	MyToastMessageShow1.Initialize(Activity)
	lbltitle.Text = Library.GetStringResourse("send_sms")
	txtname.Hint = Library.GetStringResourse("sms_name")
	txtcomment.Hint = Library.GetStringResourse("sms_order_comment")
	
	Library.ChangeStatusColor

	pnlheader.Color = Library.Theme_Header
	
	btnsend.Text = Library.GetStringResourse("send_request")
	btnproduts.Text = Library.GetStringResourse("my_product")
	txtname.Gravity = Library.GetStringResourse("direction")
	txtcomment.Gravity = Library.GetStringResourse("direction")
	lblphone.Text = Library.GetStringResourse("sms_contact") & " " & Library.GetStringResourse("shop_phone")
	lblcomment.Text = Library.GetStringResourse("sms_help")
	
	Library.EditTextIcon(txtname,"ic_menu_edit")
	Library.EditTextIcon(txtcomment,"ic_menu_edit")
	
	Dim cd As ColorDrawable
	cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),0,0,Colors.Gray)
	btnsend.Background = cd

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
	
End Sub

Sub btnsend_Click
	
	If txtname.Text.Length = 0 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_name"),1.6,False)
		Return
	End If
	
	Basket = Basket & CRLF & txtname.Text
	SendSms(Basket,True)
	
End Sub

#Region Send Sms and handle it
Sub SendSms(Text As String,Intent As Boolean)
	
	If Intent = True Then
		Dim In As Intent
    	In.Initialize(In.ACTION_VIEW, "sms:" & Library.GetStringResourse("shop_sms"))
    	In.PutExtra("sms_body", Text)
    	StartActivity(In)
	Else
		Dim ps As PhoneSms
		Dim pv As PhoneEvents
		pv.Initialize("phoneevents")
		ps.Send2(Library.GetStringResourse("shop_sms"),Text,True,True)
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("send_order"),1.7,True)
		txtcomment.Text = ""
		txtname.Text = ""
	End If
	
End Sub

Sub phoneevents_SmsSentStatus (Success As Boolean, ErrorMessage As String, PhoneNumber As String, Intent As Intent)
	If Success Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("send_order"),2,True)
	End If
End Sub

Sub phoneevents_SmsDelivered (PhoneNumber As String, Intent As Intent)
	MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("deliver_sms").Replace("\n",CRLF),2,True)
End Sub
#End Region

Sub btnproduts_Click
	StartActivity(actBasket)
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		Activity.Finish
		Return True
	End If
End Sub