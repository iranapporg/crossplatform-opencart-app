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
	Public username,password As String
End Sub

Sub Globals
	Private lblpb As Label
	Private lbltitle As Label
	Private btnlogin As Button
	Private pnlheader As Panel
	Private pnlloading As Panel
	Private op1 As OpenCart
	Private lblforgot As Label
	Private MyToastMessageShow As MyToastMessageShow
	Private txtusername As EditText
	Private txtpassword As EditText
	Private lblregister As Label
	Private btnguest As Button
	Private btnsms As Button
	Private Basket As String
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmlogin")
	MyToastMessageShow.Initialize(Activity)
	Library.setLocalApp(Library.currLang)
	
	Library.ChangeStatusColor

	lbltitle.Text = Library.GetStringResourse("login")
	lblpb.Text = Library.GetStringResourse("loading")
	lblforgot.Text = Library.GetStringResourse("forgot")
	btnlogin.Text = Library.GetStringResourse("request_login")
	btnsms.Text = Library.GetStringResourse("send_sms")
	btnsms.Background = Library.GetButtonState
	lblregister.Text = Library.GetStringResourse("request_register") & " " & Library.GetStringResourse("app_title")
	btnguest.Text  = Library.GetStringResourse("reuquest_guest")
	pnlheader.Color = Library.Theme_Header
	btnlogin.Background = Library.GetButtonState
	txtusername.Hint = Library.GetStringResourse("lblemail").Replace(":","")
	txtpassword.Hint = Library.GetStringResourse("lblpassword").Replace(":","")

	Library.EditTextIcon(txtusername,"ic_menu_cc")
	Library.EditTextIcon(txtpassword,"ic_menu_login")
	Library.UnderLineString(lblregister)
	
	txtusername.InputType = 33
	
	If username.Length > 0 Then
		txtusername.Text = username
		txtpassword.Text = password
	Else
		txtusername.Text = Library.manager.GetString("username")
		txtpassword.Text = Library.manager.GetString("password")
	End If
	
	op1.Initialize
	
	Dim cd As ColorDrawable
	cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),0,0,Colors.Gray)
	btnlogin.Background = cd
	
	btnsms.Visible = False
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.Logout(Me,"Logout_receive")

	If Library.Config.Get("show_gurest_register") = False Then
		btnguest.Visible = False
		lblregister.Top = btnguest.Top - btnguest.Height / 2
	End If
	
End Sub

Sub Logout_receive(res As Map,cat As String)
	
	btnsms.BringToFront
	btnsms.Visible = True
	
	If res = Null Then Return
	If res.IsInitialized = False Then Return
	
	If res.ContainsKey("success") Then
	
		If res.Get("success") = True Then
			If Library.loginDetails.IsInitialized Then
				Library.loginDetails.Put("login",False)
			End If
		Else
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		End If
		
	End If
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish	
End Sub

Sub btnlogin_Click

	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	Dim data As Map
	data.Initialize
	
	If txtpassword.Text.Length < 5 Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_password"),1.5,False)
		Return
	End If
	
	data.Put("password",txtpassword.Text)
	
	If Library.ValidEmail(txtusername.Text) = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_email"),1.5,False)
		Return

	End If
	
	data.Put("email",txtusername.Text)
	
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim ime As IME
	ime.Initialize("")
	ime.HideKeyboard
	
	op1.Login(Me,"login_receive",data.Get("email"),data.Get("password"))
	
End Sub

Sub login_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res = Null Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Return
	End If
	
	If res.IsInitialized = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Return
	End If
	
	If res.ContainsKey("error") Then
		
		If res.Get("error") = "User already is logged" Then
			
			Return	
		End If
		
		Dim rs As Map
		rs = res.Get("error")
		
		Dim err As String
		
		For i = 0 To rs.Size - 1
			err = err & rs.GetValueAt(i) & CRLF
		Next
		
		Msgbox(err,Library.GetStringResourse("alert"))
	
	Else
		
		Dim data As Map
		data = res.Get("data")
		
		Dim need_to_login_site As String
		need_to_login_site = Library.GetStringResourse("need_to_login_site").ToLowerCase
		
		Library.manager.SetString("username",txtusername.Text)
		Library.manager.SetString("password",txtpassword.Text)
		
		If res.ContainsKey("data") = False Then
			
				Library.loginDetails.Initialize
				Library.loginDetails.Put("address_id","1")
				Library.loginDetails.Put("login",True)
				'Library.loginDetails.put("session",DateTime.Now)
				Library.loginDetails.put("expire",DateTime.Now)
				
				If Library.GuestLogin.IsInitialized Then
					Library.GuestLogin.Put("login",False)
				End If
			
				ToastMessageShow(Library.GetStringResourse("login_success"),False)
				
				Activity.Finish
				
				If need_to_login_site = "1" Or need_to_login_site = "on" Then
					Library.CacheSystem.ClearCache
					StartActivity(Main)
				End If
				
				Return
		End If
		
		If Library.loginDetails.IsInitialized = False Then Library.loginDetails.Initialize
		
		Try
			Library.loginDetails = data
			Library.loginDetails.Put("address_id",data.Get("address_id"))
			Library.loginDetails.Put("login",True)
			Library.loginDetails.put("session",data.Get("session"))
			Library.loginDetails.put("expire",DateTime.Now)
		Catch
		
		End Try
		
		Library.ChoosenAddress = 0
		
		If Library.GuestLogin.IsInitialized Then
			Library.GuestLogin.Put("login",False)
		End If
		
		ToastMessageShow(Library.GetStringResourse("login_success"),False)
		
		Activity.Finish
		
		If need_to_login_site = "1" Or need_to_login_site = "on" Then
			Library.CacheSystem.ClearCache
			CallSubDelayed(actMenu,"RefreshData")
		End If
		
	End If
	
End Sub

Sub lblforgot_Click
	
	Dim in1 As InputDialog
	Dim res As Int
	res = in1.Show(Library.GetStringResourse("error_email"),Library.GetStringResourse("alert"),Library.GetStringResourse("send_pass"),Library.GetStringResourse("cancel"),"",Null)
	
	If res = DialogResponse.POSITIVE Then
		If in1.Input.IndexOf("@") = -1 Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_email"),1.5,False)
			Return
		Else	
			Dim op2 As OpenCart
			op2.Initialize
			pnlloading.SetVisibleAnimated(500,True)
			op2.ForgotPassword(Me,"forgot_receive",in1.Input)
		End If
	End If
	
End Sub

Sub forgot_receive(res As Map,cat As String)
		
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("send_forgot"),1.5,True)
			Return
		End If
	End If
	
	If res.ContainsKey("error") Then
	
		Dim rs As List
		rs = res.Get("error")
		
		Dim err As String
		
		For i = 0 To rs.Size - 1
			err = err & rs.Get(i) & CRLF
		Next
		
		Msgbox(err,Library.GetStringResourse("alert"))
	
	End If
	
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		Activity.Finish
		Return True
	End If
	
End Sub

Sub lblregister_Click
	StartActivity(actRegister)
End Sub

Sub btnguest_Click
	actRegister.Guest = True
	StartActivity(actRegister)
End Sub

Sub btnsms_Click
	pnlloading.SetVisibleAnimated(500,True)
	Dim op As OpenCart
	op.Initialize
	op.GetCarts(Me,"Carts_receive")
End Sub

Sub Carts_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(600,False)
	
	If res.IsInitialized = False Then
		ToastMessageShow(Library.GetStringResourse("no_cart"),False)
		Activity.Finish
		Return
	End If
	
	If res.ContainsKey("products") Then
		
		Dim l1 As List
		l1.Initialize
		l1 = res.Get("products")
		
		Dim images As Map
		images.Initialize
		
		Dim rs As String
		rs = Library.GetStringResourse("order_title").Replace("ها","").Replace("s","") & CRLF
		
		For i = 0 To l1.Size - 1
			
			Dim temp As Map
			temp = l1.Get(i)
			
			Dim qu As Int
			qu = temp.Get("quantity")
			
			rs = rs & temp.Get("name") & " ( " & qu & " " & Library.GetStringResourse("adad") & " )" & CRLF
			
		Next
		
		'Basket = Library.GetStringResourse("sure_send_sms") & CRLF & rs
		Basket = rs
		
		'If Msgbox2(Library.GetStringResourse("sure_send_sms") & CRLF & rs,Library.GetStringResourse("alert"),Library.GetStringResourse("yes"),Library.GetStringResourse("no"),"",Null) = DialogResponse.POSITIVE Then
		actSMS.Basket = Basket
		StartActivity(actSMS)
		'End If
		
	End If
	
End Sub