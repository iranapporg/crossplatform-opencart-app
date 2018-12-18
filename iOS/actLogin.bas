Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private lblpb As Label
	Private lbltitle As Label
	Private btnlogin As Button
	Private pnlheader As Panel
	Private pnlloading As Panel
	Private op1 As OpenCart
	Private lblforgot As Label
	Private MyToastMessageShow1 As MyToastMessageShow
	Private txtusername As TextField
	Private txtpassword As TextField
	Private lblregister As Label
	Private btnguest As Button
	Private btnsms As Button
	Private Basket As String
	Private btnclose As Button
	Private pg As Page
	Public RegisteredUsername,RegisteredPassword As String
End Sub

Sub StartActivity
	
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmlogin")
	Library.NavControl.ShowPage(pg)
	
	Library.ChangeFont(pg.RootPanel)
	
	MyToastMessageShow1.Initialize(pg.RootPanel)

	lbltitle.Text = Library.GetStringResourse("login")
	lblpb.Text = Library.GetStringResourse("loading")
	lblforgot.Text = Library.GetStringResourse("forgot")
	btnlogin.Text = Library.GetStringResourse("request_login")
	btnsms.Text = Library.GetStringResourse("send_sms")
	lblregister.Text = Library.GetStringResourse("request_register") & " " & Library.GetStringResourse("app_title")
	btnguest.Text  = Library.GetStringResourse("reuquest_guest")
	pnlheader.Color = Library.Theme_Header
	Library.GetButtonState(btnlogin)
	txtusername.HintText = Library.GetStringResourse("lblemail").Replace(":","")
	txtpassword.HintText = Library.GetStringResourse("lblpassword").Replace(":","")

	'Library.UnderLineString(lblregister)
	
	txtusername.Text = RegisteredUsername
	txtpassword.Text = RegisteredPassword
	txtusername.KeyboardType = txtusername.TYPE_EMAIL_ADDRESS
'	txtusername.Text = "info@opencart.ir"
'	txtpassword.Text = "12345"
	
	op1.Initialize
	
	Library.GetButtonState(btnsms)
	btnsms.Top = Library.GetHeight-btnsms.Height-20dip
	
	btnlogin.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.Logout(Me,"Logout_receive")
	
End Sub

Sub Logout_receive(res As Map,cat As String)
	
	If res = Null Then Return
	If res.IsInitialized = False Then Return
	
	If res.ContainsKey("success") Then
	
		If res.Get("success") = True Then
			If Library.loginDetails.IsInitialized Then
				Library.loginDetails.Put("login",False)
			End If
		Else
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		End If
		
	End If
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.MenuPage)	
End Sub

Sub btnlogin_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	Dim data As Map
	data.Initialize
	
	If txtpassword.Text.Length < 5 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_password"),1.5,False)
		Return
	End If
	
	data.Put("password",txtpassword.Text)
	
	If Library.ValidEmail(txtusername.Text) = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_email"),1.5,False)
		Return

	End If
	
	data.Put("email",txtusername.Text)
	
	pnlloading.Visible = True
	
	op1.Login(Me,"login_receive",data.Get("email"),data.Get("password"))
	
End Sub

Sub login_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res = Null Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Return
	End If
	
	If res.IsInitialized = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Return
	End If
	
	If res.ContainsKey("error") Then
		
		If res.Get("error") = "User already is logged" Then
			
			Return	
		End If
		
		Dim rs As Map
		rs = res.Get("error")
		
		Dim err As String
		
		For Each vs As String In rs.Values
			err = err & vs & CRLF
		Next
		
		Msgbox(err,Library.GetStringResourse("alert"))
	
	Else
		Dim data As Map
		data = res.Get("data")
		
		If res.ContainsKey("data") = False Then
				Library.loginDetails.Initialize
				Library.loginDetails.Put("address_id","1")
				Library.loginDetails.Put("login",True)
				'Library.loginDetails.put("session",DateTime.Now)
				Library.loginDetails.put("expire",DateTime.Now)
				
				If Library.GuestLogin.IsInitialized Then
					Library.GuestLogin.Put("login",False)
				End If
			
				Library.hud.ToastMessageShow(Library.GetStringResourse("login_success"),False)
				CallSubDelayed(actMenu,"UpdateUI")
				Library.NavControl.ShowPage(Library.LastPage)
				Return
		End If
		
		If Library.loginDetails.IsInitialized = False Then Library.loginDetails.Initialize
		
		Try
			Dim t As Map
			t.Initialize
			t.Put("address_id",data.Get("address_id"))
			t.Put("login",True)
			t.put("session",data.Get("session"))
			t.put("expire",DateTime.Now)
			
			For Each vs As String In data.Keys
				t.Put(vs,data.Get(vs))
			Next
			
			Library.loginDetails = t
			
		Catch
		
		End Try
		
		Library.ChoosenAddress = 0
		
		If Library.GuestLogin.IsInitialized Then
			Library.GuestLogin.Put("login",False)
		End If
		
		Library.hud.ToastMessageShow(Library.GetStringResourse("login_success"),False)
		CallSubDelayed(actMenu,"UpdateUI")
		Library.NavControl.ShowPage(Library.LastPage)
		
	End If
	
End Sub

Sub lblforgot_Click
	
	InputDialog("",Library.GetStringResourse("alert"),Library.GetStringResourse("error_email"),Library.GetStringResourse("send_pass"),Library.GetStringResourse("cancel"),7)
	
End Sub

Sub Forgot_Input(Email As String)
	
		If Library.ValidEmail(Email) Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_email"),1.5,False)
			Return
		Else	
			Dim op2 As OpenCart
			op2.Initialize
			pnlloading.Visible = True
			op2.ForgotPassword(Me,"forgot_receive",Email)
		End If
	
End Sub

Sub forgot_receive(res As Map,cat As String)
		
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("send_forgot"),1.5,True)
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

Sub lblregister_Click
	actRegister.StartActivity
End Sub

Sub btnguest_Click
	actRegister.Guest = True
	actRegister.StartActivity
End Sub

Sub btnsms_Click

	pnlloading.Visible = True
	
	Dim op As OpenCart
	op.Initialize
	op.GetCarts(Me,"Carts_receive")
	
End Sub

Sub Carts_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.IsInitialized = False Then
		Library.hud.ToastMessageShow(Library.GetStringResourse("no_cart"),False)
		Library.NavControl.ShowPage(Library.LastPage)
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
		Library.LastPage = pg
		actSMS.Basket = Basket
		actSMS.StartActivity
		'End If
		
	End If
	
End Sub

#Region Input-Dialog with Objective C code
#If OBJC
- (void)ShowInputDialog:(NSString*)Input :(NSString*)Title :(NSString*)Message :(NSString*)OK :(NSString*)Cancel :(int)KeybardType
{
  UIAlertView * alert = [[UIAlertView alloc] initWithTitle:Title
    message:Message delegate:self cancelButtonTitle:Cancel otherButtonTitles:OK, nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;

    UITextField * alertTextField = [alert textFieldAtIndex:0];
    alertTextField.keyboardType = KeybardType;
   
    alertTextField.text = Input;
    alert.delegate = self;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self.bi raiseEvent:nil event:@"inputdialog_result:" params:@[[[alertView textFieldAtIndex:0] text]]];
    }
}
#End If

' InputType:
' 0 = UIKeyboardTypeDefault
' 1 = UIKeyboardTypeASCIICapable
' 2 = UIKeyboardTypeNumbersAndPunctuation
' 3 = UIKeyboardTypeURL
' 4 = UIKeyboardTypeNumberPad
' 5 = UIKeyboardTypePhonePad
' 6 = UIKeyboardTypeNamePhonePad
' 7 = UIKeyboardTypeEmailAddress
' 8 = UIKeyboardTypeDecimalPad
' 9 = UIKeyboardTypeTwitter
'10 = UIKeyboardTypeWebSearch
'11 = UIKeyboardTypeAlphabet
'12 = UIKeyboardTypeASCIICapable
Sub InputDialog(Input As String, Title As String, Message As String, POSITIVE As String, CANCEL As String, InputType As Int)
    Dim no As NativeObject = Me
    no.RunMethod("ShowInputDialog::::::", Array(Input, Title, Message, POSITIVE, CANCEL, InputType))
End Sub

Sub InputDialog_Result(Text As String)
	Forgot_Input(Text)
End Sub

#End Region