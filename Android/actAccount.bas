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
	Public ChoosenTab As String
	Private tmrOpenMenu As Timer
End Sub

Sub Globals
	Private tab1 As TabHost
	Dim sv1,svReturns As ScrollView
	Private btnsave As Button
	Private Label11 As Label
	Private Label2 As Label
	Private Label3 As Label
	Private Label5 As Label
	Private Label7 As Label
	Private Label9 As Label
	Private lbldate As Label
	Private lblemail As Label
	Private lblfamily As Label
	Private lblfax As Label
	Private lblip As Label
	Private lblname As Label
	Private lblpassword As Label
	Private lblphone As Label
	Private txtemail As EditText
	Private txtfamily As EditText
	Private txtfax As EditText
	Private txtname As EditText
	Private txtpassword As EditText
	Private txtphone As EditText
	Private Panel1 As Panel
	Private btnpassword As Button
	Private lblcountry As Label
	Private txtcountry As Spinner
	Private lblcity As Label
	Private txtcity As Spinner
	Private lbladdress As Label
	Private btnadd As Button
	Private listCity,listCountries As List
	Private txtaddress As EditText
	Private lvAddress,listCountry As ListView
	Dim svOrder As ScrollView
	Private lblid As Label
	Private lblstate2 As Label
	Private btndetails As Button
	Private pnlorder As Panel
	Private btnadd_address As Button
	Private pnlnew_address As Panel
	Private btncancel_new_address As Button
	Private lblpostal_enter As Label
	Private txtpostal_enter As EditText
	Private listAddressCache As Map
	Private ChoosenAddress4Edit As Int
	Private lbldefault As Label
	Private listAddressID As List
	Private choosenCity As String
	Private pnlmenu As Panel
	Private toast As MyToastMessageShow
	Private pnlloading As Panel
	Private lblpb As Label
	Private pnlmain As Panel
	Private SubscribeState As String
	Private lblreturn_title As Label
	Private lblreturn_state As Label
	Private btnreturn_details As Button
	Private lblprofile As Label
	Private lblorders As Label
	Private lblnewaddress1 As Label
	Private lblnewsletter As Label
	Private lblreturns As Label
	Private btnprofile As Button
	Private btnpasswords As Button
	Private btnorders As Button
	Private btnaddress As Button
	Private btnscribe As Button
	Private btnreturns As Button
	Private lblnewaddress As Label
	Private lblpasswords As Label
	Private lbladdress1 As Label
	Private lblnewsletteroption As Label
	Private rbyes As RadioButton
	Private rbno As RadioButton
	Private btnapply_newsletter As Button
	Private pnlaction As Panel
	Private lbldefault_address As Label
	Private lbledit_address As Label
	Private lbldelete_address As Label
	Private ChoosenAddressID,ChoosenAddressValue As String
	Private btnback_menu As Button
	Private lblback_menu As Label
	Private lblpassword_title As Label
	Private txtpassword2 As EditText
	Private lblpassword2 As Label
	Private lbldivider_return As Label
	Private pnldetails_return As Panel
	Private sv_return_details As ScrollView
	Private btncancel_return As Button
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmaccounts")
	pnlmenu.Color = Library.Theme_Header
	Activity.Color = Library.Theme_Header
	
	Library.setLocalApp(Library.currLang)
	
	Library.ChangeStatusColor
	
	toast.Initialize(Activity)
	tmrOpenMenu.Initialize("tmrOpenMenu",250)
	
	lblpb.Text = Library.GetStringResourse("loading")
	btncancel_return.Background = Library.GetButtonState
	btncancel_return.Text = Library.GetStringResourse("cancel")
	pnlloading.Visible = True
	
	#Region Details
	sv1.Initialize(0)
	tab1.AddTab2(Library.GetStringResourse("details_user"),sv1)
	sv1.Panel.LoadLayout("frmaccount_details")
	sv1.Panel.Height = btnsave.Top + btnsave.Height + 480
	sv1.Height = tab1.Height
	sv1.Width = pnlmain.Width
	sv1.Panel.Width = tab1.Width-24dip
	#End Region
	
	#Region Orders
	Dim porder As Panel
	porder.Initialize("")
	svOrder.Initialize2(0,"")
	tab1.AddTab2(Library.GetStringResourse("order_title"),porder)
	porder.AddView(svOrder,0,0,Activity.Width-pnlmenu.Width,tab1.Height)
	svOrder.Panel.Color = Colors.RGB(247, 244, 244)
	svOrder.Color = Colors.White
	porder.Color = Colors.RGB(247, 244, 244)
	#End Region
	
	#Region Add Address
	pnlnew_address.LoadLayout("frmaccount_add_address")
	txtcountry.DropdownBackgroundColor = Colors.White
	txtcity.DropdownBackgroundColor = Colors.White
	txtaddress.Color = Colors.RGB(250,250,250)
	txtpostal_enter.Color = Colors.RGB(250,250,250)
	txtaddress.InputType = txtaddress.INPUT_TYPE_TEXT
	lblcountry.Text = Library.GetStringResourse("country")
	lblcity.Text =  Library.GetStringResourse("city")
	lbladdress.Text =  Library.GetStringResourse("address1")
	btnadd.Text = Library.GetStringResourse("new_address")
	btncancel_new_address.Text = Library.GetStringResourse("cancel")
	lblpostal_enter.Text = Library.GetStringResourse("postal")
	#End Region
	
	#Region List Address
	Dim sv3 As ScrollView
	sv3.Initialize(0)
	tab1.AddTab(Library.GetStringResourse("my_address"),"frmaccount_address")
	lvAddress.SingleLineLayout.Label.Left = 0
	lvAddress.SingleLineLayout.Label.Width = 68%x
	lvAddress.SingleLineLayout.Label.TextColor = Colors.Black
	lvAddress.SingleLineLayout.Label.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER)
	lvAddress.SingleLineLayout.Label.TextSize = 14
	lvAddress.SingleLineLayout.Label.Typeface = Library.GetFont
	lvAddress.SingleLineLayout.ItemHeight = 100
	Library.SetDivider(lvAddress,Library.Theme_Header,1)
	lvAddress.Color = Colors.Transparent
	Library.GetParent(lvAddress).Color = Colors.Transparent
	lbldefault.Text = Library.GetStringResourse("choose_address")
	lbldefault.Gravity = Library.GetStringResourse("direction")
	#End Region
	
	#Region Change password
	Dim svpassword As Panel
	svpassword.Initialize("")
	tab1.AddTab(Library.GetStringResourse("lblpassword"),"frmaccount_password")
	lblpassword.Gravity = Library.GetStringResourse("direction")
	lblpassword2.Gravity = Library.GetStringResourse("direction")
	lblpassword_title.Gravity = Library.GetStringResourse("direction")
	lblpassword.Text = Library.GetStringResourse("lblpassword")
	lblpassword2.Text = Library.GetStringResourse("lblpassword2")
	lblpassword_title.Text = Library.GetStringResourse("password_title")
	btnpassword.Text = Library.GetStringResourse("save_password")
	btnpassword.Background = Library.GetButtonState
	txtpassword.Gravity = Gravity.LEFT
	txtpassword.PasswordMode = True
	txtpassword.Color = Colors.RGB(250,250,250)
	txtpassword2.Color = Colors.RGB(250,250,250)
	Library.LabelSpace(lblpassword_title,1.3)
	#End Region
	
	#Region returns
	Dim preturns As Panel
	preturns.Initialize("")
	svReturns.Initialize2(0,"")
	tab1.AddTab2(Library.GetStringResourse("order_title"),preturns)
	preturns.AddView(svReturns,0,0,Activity.Width-pnlmenu.Width,tab1.Height)
	svReturns.Panel.Color = Colors.RGB(247, 244, 244)
	preturns.Color = Colors.RGB(247, 244, 244)
	svReturns.Color = Colors.White
	#End Region
	
	#Region Newsletter
	Dim svNewsletter As Panel
	svNewsletter.Initialize("")
	tab1.AddTab(Library.GetStringResourse("lblpassword"),"frmaccount_newsletter")
	lblnewsletteroption.Gravity = Library.GetStringResourse("direction")
	lblnewsletteroption.Typeface = Library.GetFont
	rbno.Typeface = Library.GetFont
	rbyes.Typeface = Library.GetFont
	btnapply_newsletter.Text = Library.GetStringResourse("scribe_change_state")
	btnapply_newsletter.Background = Library.GetButtonState
	rbyes.Text = Library.GetStringResourse("subscribe")
	rbno.Text = Library.GetStringResourse("unsubscribe")
	#End Region
	
	lblname.Text = Library.GetStringResourse("lblname")
	lblfamily.Text = Library.GetStringResourse("lblfamily")
	lblemail.Text = Library.GetStringResourse("lblemail")
	lblfax.Text = Library.GetStringResourse("lblfax")
	lblphone.Text = Library.GetStringResourse("lblphone")
	btnsave.Text = Library.GetStringResourse("save_details")
	btnsave.Background = Library.GetButtonState
	lblcountry.Gravity = Library.GetStringResourse("direction")
	lblcity.Gravity = Library.GetStringResourse("direction")
	lbladdress.Gravity = Library.GetStringResourse("direction")
	lblpostal_enter.Gravity = Library.GetStringResourse("direction")
	
	lblprofile.Text = Library.GetStringResourse("return_menu_profile")
	lblpasswords.Text = Library.GetStringResourse("return_menu_pass")
	lblorders.Text = Library.GetStringResourse("return_menu_orders")
	lbladdress1.Text = Library.GetStringResourse("return_menu_address")
	lblnewaddress1.Text = Library.GetStringResourse("return_menu_new_address")
	lblnewsletter.Text = Library.GetStringResourse("return_menu_news")
	lblreturns.Text = Library.GetStringResourse("return_menu_returns")
	lbldelete_address.Text = Library.GetStringResourse("delete_address")
	lbldefault_address.Text = Library.GetStringResourse("default_address")
	lbledit_address.Text = Library.GetStringResourse("edit")
	lblback_menu.Text = Library.GetStringResourse("back")
	
	For Each v1 As View In sv1.Panel.GetAllViewsRecursive
		
		If v1 Is Button Then Continue
		
		If v1 Is EditText Then
			Dim t1 As EditText
			t1 = v1
			t1.Color = Library.ConvertHex2Int(Library.GetStringResourse("textbox_color"))
			t1.Gravity = Library.GetStringResourse("direction")
		End If
		
		If v1 Is Label Then
			Dim l1 As Label
			l1 = v1
			l1.Gravity = Library.GetStringResourse("direction")
		End If
		
	Next
	
	pnlloading.Visible = True
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.UserDetails(Me,"getDetails_receive")

	Dim opCountry As OpenCart
	opCountry.Initialize
	opCountry.GetCountry(Me,"country_receive")
	
	If Library.IsPersian Then
		pnlmain.Left = 0
		pnlmenu.Left = Activity.Width + pnlmain.Width
		pnlnew_address.Left = 0
		tab1.Left = 0
	End If
	
End Sub

Sub Orders_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		
		If res.Get("success") = True Then
			Dim m1 As Map
			m1.Initialize
			m1 = res.Get("data")
			
			Dim l1 As List
			l1 = m1.Get("orders")
			
			Dim top As Int
			top = 0
			svOrder.Panel.Color = Colors.White
			
			For i = 0 To l1.Size - 1
				
				Dim temp As Map
				temp = l1.Get(i)
				
				Dim p1 As Panel
				p1.Initialize("")
				
				svOrder.Panel.AddView(p1,-10,top,svOrder.Width,0)
				
				If Library.IsPersian Then
					p1.LoadLayout("frmtemplate_order")
					lbldate.Text = Library.GetDate(temp.Get("date_added"))
				Else
					p1.LoadLayout("frmtemplate_order_en")
					lbldate.Text = temp.Get("date_added")
				End If
				
				btndetails.Background = Library.GetButtonStateOnTheme(7)
				p1.Color = Colors.White
				pnlorder.Color = Colors.White
				p1.Height = pnlorder.Height + 10
				
				lblid.Text = Library.GetStringResourse("order_id").Replace("0",temp.Get("order_id")).Replace("1","")
				lblstate2.Text = temp.Get("status")
				btndetails.Text = Library.GetStringResourse("order_details")
				btndetails.Tag = temp.Get("order_id")
				
				top = top + p1.Height + 10
				
			Next
			
			svOrder.Panel.Height = top + 150dip
			
			If ChoosenTab = "order" Then
				tab1.CurrentTab = 1
			End If
			
			Return
			
		End If
	End If
	
End Sub

Sub ListAddress_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim d1 As Map
			d1 = res.Get("data")
			d1 = d1.Get("addresses")
			
			listAddressCache = d1
			
			lvAddress.Clear
			listAddressID.Initialize
			
			For i = 0 To d1.Size - 1
				
				Dim temp As Map
				temp = d1.Get(d1.GetKeyAt(i))
				
				lvAddress.AddSingleLine($"${temp.Get("country")} ${temp.Get("city")} ${temp.Get("address_1")}"$)
				listAddressID.Add(temp.Get("address_id"))
				
			Next
			
			If ChoosenTab = "address" Then
				tab1.CurrentTab = 2
				ChoosenTab = ""
			End If
			
			Return
			
		End If
	End If
	
End Sub

Sub country_receive(ls As List,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	listCountries.Initialize
	listCountries = ls
	
	Dim City As List
	City.Initialize
	
	For i = 0 To ls.Size - 1
		Dim te As Map
		te = ls.Get(i)
		txtcountry.Add(te.Get("name"))
		
		If Library.IsPersian Then
			If te.Get("country_id") = "101" Then txtcountry.SelectedIndex = i
		End If
		
	Next
	
	If Library.IsPersian Then
		Dim opCity As OpenCart
		opCity.Initialize
		opCity.GetCity(Me,"city_receive","101")
	End If
	
End Sub

Sub city_receive(res As List,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	listCity = res
	
	txtcity.Clear
	
	For i = 0 To res.Size - 1
		
		Dim m1 As Map
		m1 = res.Get(i)
		txtcity.Add(m1.Get("name"))
		
		If m1.Get("name") = choosenCity Then txtcity.SelectedIndex = i
		
	Next
	
End Sub

Sub txtcountry_ItemClick (Position As Int, Value As Object)
	
	pnlloading.SetVisibleAnimated(500,True)
	
	For i = 0 To listCountries.Size - 1
		
		Dim m1 As Map
		m1 = listCountries.Get(i)
		
		If m1.Get("name") = Value Then
			pnlloading.SetVisibleAnimated(500,True)
			Dim opCity As OpenCart
			opCity.Initialize
			opCity.GetCity(Me,"city_receive",m1.Get("country_id"))
			Return
		End If
		
	Next
	
End Sub

Sub getDetails_receive(res As Map,cat As String)
	
	ProgressDialogHide
	pnlloading.SetVisibleAnimated(0,False)
	
	If res.ContainsKey("error") Then
		If res.Get("error") = "User is not logged in" Then
			ToastMessageShow(Library.GetStringResourse("login_force"),False)
			CallSubDelayed(actMenu,"Logout")
			Return
		End If
	End If
	
	If res.Get("success") Then
		If res.Get("success") = True Then
			
			Dim ma As Map
			ma = res.Get("data")
			txtname.Text = ma.Get("firstname")
			txtfamily.Text = ma.Get("lastname")
			txtemail.Text = ma.Get("email")
			txtphone.Text = ma.Get("telephone")
			txtfax.Text = ma.Get("fax")
			
			Dim date As String
			date = ma.Get("date_added")
			
			If Library.IsPersian Then
				lbldate.Text = Library.GetStringResourse("lbldate").Replace("0",Library.GetDate(date))
			Else
				lbldate.Text = Library.GetStringResourse("lbldate").Replace("0",date)
			End If
			
			lblip.Text = Library.GetStringResourse("lblip").Replace("0",ma.Get("ip"))
			
			tmrOpenMenu.Enabled = True
			
			btnprofile_Click
			
			If ma.Get("newsletter") = "1" Then
				rbno.Checked = True
				rbyes.Visible = False
				rbno.Visible = True
				lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_1")
			Else
				rbyes.Checked = True
				rbno.Visible = False
				rbyes.Visible = True
				lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_0")
			End If
			
		Else
			Activity.Finish
		End If
		
	Else
		Activity.Finish
	End If
	
End Sub

Sub tmrOpenMenu_Tick
	
	tmrOpenMenu.Enabled = False

	If Library.IsPersian Then
	
		pnlmenu.SetLayoutAnimated(800,Activity.Width - pnlmenu.Width,pnlmenu.Top,pnlmenu.Width,pnlmenu.Height)
		DoEvents
		
	Else
		pnlmenu.SetLayoutAnimated(800,0,pnlmenu.Top,pnlmenu.Width,pnlmenu.Height)
		DoEvents
		
	End If
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	
	Library.AnimationFromLeft2Right
	
	If UserClosed = True Then
		Activity.Finish
	End If
	
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		If pnldetails_return.Visible = True Then
			pnldetails_return.SetVisibleAnimated(500,False)
			Return True
		End If			
	End If
	
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub btnsave_Click
	
	If txtname.Text.Length < 2 Or txtfamily.Text.Length < 3 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_name"),2,False)
		Return
	End If
	
	If txtphone.Text.Length <> 11 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_phone"),2,False)
		
		Return
	End If
	
	Dim data As Map
	data.Initialize
	data.Put("email",txtemail.Text)
	data.Put("firstname",txtname.Text)
	data.Put("lastname",txtfamily.Text)
	data.Put("telephone",txtphone.Text)
	data.Put("fax",txtfax.Text)
	
	lblpb.Text = Library.GetStringResourse("apply")
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.UpdateUserDetails(Me,"updatedetails_receive",data)
	
End Sub

Sub updatedetails_receive(res As Map,cat As String)
	
	ProgressDialogHide
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			toast.ShowToastMessageShow(Library.GetStringResourse("success_save_details"),2,True)
			Return
		End If
	End If
	
End Sub

Sub btnpassword_Click
	
	If txtpassword.Text.Length < 5 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_password"),2,False)
		Return
	End If
	
	If txtpassword.Text <> txtpassword2.Text Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_password2"),2,False)
		Return
	End If
	
	lblpb.Text = Library.GetStringResourse("apply")
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.UpdatePasswordUser(Me,"changepassword_receive",txtpassword.Text)
	
End Sub

Sub changepassword_receive(res As Map,cat As String)
	
	ProgressDialogHide
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			toast.ShowToastMessageShow(Library.GetStringResourse("success_save_details"),2,True)
			txtpassword.Text = ""
			txtpassword2.Text = ""
			Return
		End If
	End If
	
End Sub

Sub btnadd_Click
		
	If txtaddress.Text.Length < 3 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_address_1"),2,False)
		Return
	End If
	
	If Library.ValidPostalCode(txtpostal_enter.Text) = False Then
		toast.ShowToastMessageShow(Library.GetStringResourse("postal").Replace(":",""),2,False)
		Return
	End If
	
	Dim data As Map
	data.Initialize
	
	If txtcity.SelectedIndex = -1 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_city"),2,False)
		Return
	End If
	
	data.Put("city",txtcity.SelectedItem)

	For k = 0 To listCity.Size - 1
		
		Dim m2 As Map
		m2 = listCity.Get(k)
		
		If m2.Get("name") = txtcity.SelectedItem Then
			data.Put("zone_id",m2.Get("zone_id"))
			data.Put("country_id",m2.Get("country_id"))
			Exit
		End If
		
	Next
	
	data.Put("firstname",txtname.Text)
	data.Put("lastname",txtfamily.Text)
	data.Put("address_1",txtaddress.Text)
	data.Put("postcode",txtpostal_enter.Text)
	
	lblpb.Text = Library.GetStringResourse("apply")
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim op1 As OpenCart
	op1.Initialize
	
	If btnadd.Text = Library.GetStringResourse("edit") Then
		op1.EditAddressUser(Me,"editAddress_receive",data,ChoosenAddress4Edit)
	Else
		op1.AddAddressUser(Me,"addAddress_receive",data)
	End If
	
End Sub

Sub editAddress_receive(res As  Map,cat As String)
	
	ProgressDialogHide
	
	If res = Null Then Return
	
	pnlloading.SetVisibleAnimated(500,False)
	pnlnew_address.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			ChoosenAddress4Edit = 0
			txtaddress.Text = ""
			toast.ShowToastMessageShow(Library.GetStringResourse("success_save_details"),2,True)
			Dim opAddress As OpenCart
			opAddress.Initialize
			opAddress.ListAddressUser(Me,"ListAddress_receive")
			Return
		End If
	End If
	
End Sub

Sub addAddress_receive(res As  Map,cat As String)
	
	ProgressDialogHide
	
	pnlloading.SetVisibleAnimated(500,False)
	pnlnew_address.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			txtaddress.Text = ""
			toast.ShowToastMessageShow(Library.GetStringResourse("success_add_address"),2,True)
			Dim opAddress As OpenCart
			opAddress.Initialize
			opAddress.ListAddressUser(Me,"ListAddress_receive")
			Return
		End If
	End If
	
End Sub

Sub btnadd_address_Click
	
	DefaultButtonMenuColor
	btnadd_address.TextColor = Colors.RGB(244,255,0)
	lblnewaddress.TextColor = Colors.RGB(244,255,0)
	
	btnadd.Text = Library.GetStringResourse("new_address")
	btnadd.Background = Library.GetButtonState
	btncancel_new_address.Background = Library.GetButtonState
	pnlnew_address.SetVisibleAnimated(500,True)
	btnback_menu_Click
	
End Sub

Sub btncancel_new_address_Click
	ChoosenAddress4Edit = 0
	pnlnew_address.SetVisibleAnimated(500,False)
End Sub

Sub btndetails_Click

	Dim b1 As Button
	b1 = Sender
	
	Dim id1 As String
	id1 = b1.Tag
	
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim opDetails As OpenCart
	opDetails.Initialize
	opDetails.GetOrders(Me,"DetailsOrder_receive",id1)
	
End Sub

Sub DetailsOrder_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim data As Map
			data = res.Get("data")
			actOrderDetails.details = data
			actOrderDetails.user_details = CreateMap("firstname":txtname.Text,"lastname":txtfamily.Text,"email":txtemail.Text,"telephone":txtphone.Text,"order_id":data.Get("order_id"),"date_ordered":data.Get("date_added"))
			StartActivity(actOrderDetails)
		End If
	End If
	
End Sub

Sub lvAddress_ItemClick (Position As Int, Value As Object)
	
	ChoosenAddressID = listAddressID.Get(Position)
	ChoosenAddressValue = Value
	pnlaction.SetLayoutAnimated(600,0,Activity.Height - pnlaction.Height,pnlaction.Width,pnlaction.Height)
	
End Sub

Sub DeleteAddress_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)

	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			
			lvAddress.Clear
			listAddressID.Clear
			
			toast.ShowToastMessageShow(Library.GetStringResourse("deleted_address"),2,True)
			
			Dim opAddress As OpenCart
			opAddress.Initialize
			opAddress.ListAddressUser(Me,"ListAddress_receive")
			
		End If
	End If
	
End Sub

Sub btnprofile_Click
	pnlnew_address.SetVisibleAnimated(500,False)
	DefaultButtonMenuColor
	btnprofile.TextColor = Colors.RGB(244,255,0)
	tab1.CurrentTab = 0
	btnback_menu_Click
End Sub

Sub btnpasswords_Click
	pnlnew_address.SetVisibleAnimated(500,False)
	DefaultButtonMenuColor
	btnpasswords.TextColor = Colors.RGB(244,255,0)
	tab1.CurrentTab = 3
	btnback_menu_Click
End Sub

Sub btnorders_Click
	
	If svOrder.Panel.NumberOfViews = 0 Then
		pnlloading.SetVisibleAnimated(500,True)
		Dim opOrder As OpenCart
		opOrder.Initialize
		opOrder.GetOrders(Me,"Orders_receive","")
	End If
	
	pnlnew_address.SetVisibleAnimated(500,False)
	DefaultButtonMenuColor
	btnorders.TextColor = Colors.RGB(244,255,0)
	tab1.CurrentTab = 1
	
	btnback_menu_Click
	
End Sub

Sub btnaddress_Click
	
	If lvAddress.Size = 0 Then
		pnlloading.SetVisibleAnimated(500,True)
		Dim opAddress As OpenCart
		opAddress.Initialize
		opAddress.ListAddressUser(Me,"ListAddress_receive")
	End If
	
	pnlnew_address.SetVisibleAnimated(500,False)
	DefaultButtonMenuColor
	btnaddress.TextColor = Colors.RGB(244,255,0)
	tab1.CurrentTab = 2
	
	btnback_menu_Click
	
End Sub

Sub btnscribe_Click
	
	pnlnew_address.SetVisibleAnimated(500,False)
	DefaultButtonMenuColor
	btnscribe.TextColor = Colors.RGB(244,255,0)
	tab1.CurrentTab = 5
	
	btnback_menu_Click
	
End Sub

Sub subsribe_receive(res As Map,cat As String)
	
	ProgressDialogHide
	pnlloading.SetVisibleAnimated(500,False	)
	
	If res.IsInitialized Then
		If res.ContainsKey("success") Then
			If res.Get("success") = True Then
				
				If SubscribeState = "1" Then
					toast.ShowToastMessageShow(Library.GetStringResourse("subscribe_success"),2,True)
					rbno.Checked = True
					rbyes.Visible = False
					rbno.Visible = True
					lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_1")
				Else
					toast.ShowToastMessageShow(Library.GetStringResourse("unsubscribe_success"),2,True)
					rbyes.Checked = True
					rbno.Visible = False
					rbyes.Visible = True
					lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_0")
				End If
				
			End If
		End If
	End If
			
End Sub

Sub btnreturns_Click
	
	DefaultButtonMenuColor
	btnreturns.TextColor = Colors.RGB(244,255,0)
	
	If svReturns.Panel.NumberOfViews = 0 Then
		lblpb.Text = Library.GetStringResourse("loading")
		pnlloading.SetVisibleAnimated(500,True)
		
		Dim op As OpenCart
		op.Initialize
		op.GetReturns(Me,"returns_receive","")
	Else
		pnlnew_address.Visible = False
		tab1.CurrentTab = 4
	End If
	
	btnback_menu_Click
	
End Sub

Sub returns_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	pnlnew_address.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim m1 As Map
			m1.Initialize
			m1 = res.Get("data")
			
			Dim l1 As List
			l1 = m1.Get("returns")
			
			Dim top As Int
			top = 0
			svReturns.Panel.Color = Colors.White
			
			For i = 0 To l1.Size - 1
				
				Dim temp As Map
				temp = l1.Get(i)
				
				Dim p1 As Panel
				p1.Initialize("")
				
				svReturns.Panel.AddView(p1,-10,top,svOrder.Width,0)
				
				If Library.IsPersian Then
					p1.LoadLayout("frmtemplate_returns")
					temp.Put("date_added",Library.GetDate(temp.Get("date_added")))
				Else
					p1.LoadLayout("frmtemplate_returns_en")
				End If
				
				btnreturn_details.Tag = temp.Get("return_id")
				
				p1.Color = Colors.White
				p1.Height = lbldivider_return.Top + 4dip
				
				lblreturn_title.Text = Library.GetStringResourse("return_from").Replace("1",temp.Get("name")).Replace("0",temp.Get("date_added"))
				lblreturn_state.Text = Library.GetStringResourse("return_state").Replace("1",temp.Get("status")).Replace("0",temp.Get("order_id"))
				
				lblreturn_title.Gravity = Library.GetStringResourse("direction")
				lblreturn_state.Gravity = Library.GetStringResourse("direction")

				top = top + p1.Height
				
			Next
			
			svReturns.Panel.Height = top + 140dip
			tab1.CurrentTab = 4
			
			Return
			
		End If
	End If
	
End Sub

Sub btnreturn_details_Click
	
	Dim bu As Button
	bu = Sender
	
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.GetReturns(Me,"returndetails_receive",bu.Tag)
	
End Sub

Sub ToMixCase(Entry As String) As String

    Dim sb As StringBuilder
    Dim m As Matcher
    Dim I As Int
            
    Entry = Entry.ToLowerCase

    sb.Initialize
    
    m = Regex.Matcher("(^\w)|(\s\w)", Entry)
    
    Do While m.Find
            
       If m.Match.Length > 1 Then    
    
          sb.Append(Entry.SubString2(I, m.GetStart(0) + 1))
          sb.Append(m.Match.SubString(1).ToUpperCase)
                              
       Else
      
          sb.Append(Entry.SubString2(I, m.GetStart(0)))
          sb.Append(m.Match.ToUpperCase)
                              
       End If
                     
       I = m.GetEnd(0)
                     
    Loop
            
    If I < Entry.Length Then
            
       sb.Append(Entry.SubString(I))
                     
    End If
            
    Return sb.ToString

End Sub

Sub returndetails_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	sv_return_details.Panel.RemoveAllViews
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim data As Map
			data = res.Get("data")
				
				Dim top As Int
				sv_return_details.Color = Colors.White
				sv_return_details.Panel.Color = Colors.White
				
				For i = 0 To data.Size - 1
					
					If data.GetValueAt(i) Is List Then Continue
					
					Dim lblKey As Label
					lblKey.Initialize("")
					lblKey.Color = Colors.RGB(234,234,234)
					
					lblKey.TextSize = 14
					lblKey.TextColor = Colors.Black
					
					lblKey.Typeface = Library.GetFont
					lblKey.Text = Library.GetStringResourse("return_item_" & data.GetKeyAt(i))
					
					If lblKey.Text = "null" Then lblKey.Text = "-"
					
					lblKey.Gravity = Library.GetStringResourse("direction")
					Library.PaddingLabel(lblKey,10,0,10,0)
					
					sv_return_details.Panel.AddView(lblKey,0,top,sv_return_details.Width,40dip)
					top = top + 40dip
					
					Dim lblVal As Label
					lblVal.Initialize("")
					lblVal.Color = Colors.Rgb(222,223,223)
					
					lblVal.TextSize = 12
					lblVal.TextColor = Colors.Black
					lblVal.Text = data.GetValueAt(i)
					
					lblVal.Typeface = Library.GetFont
					
					If lblVal.Text = "null" Then lblVal.Text = "-"
					
					lblVal.Gravity = Library.GetStringResourse("direction")
					Library.PaddingLabel(lblVal,10,0,10,0)
					
					sv_return_details.Panel.AddView(lblVal,0,top,sv_return_details.Width,40dip)
					top = top + 47dip
					
					Dim divider As Label
					divider.Initialize("")
					sv_return_details.Panel.AddView(divider,7,top,sv_return_details.Width-10,1dip)
					divider.Color = Colors.RGB(242,242,242)
					top = top + 7dip
					
				Next
				
				sv_return_details.Panel.Height = top
				
				pnldetails_return.SetVisibleAnimated(500,True)
				
		End If
	End If
	
End Sub

Sub DefaultButtonMenuColor
	
	For Each v1 As View In pnlmenu.GetAllViewsRecursive
		If v1 Is Button Then
			Dim b1 As Button
			b1 = v1
			b1.TextColor = Colors.White	
		End If
	Next
	
	lblnewaddress.TextColor = Colors.White
	
End Sub

Sub btnapply_newsletter_Click
	
	lblpb.Text = Library.GetStringResourse("apply")
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim op1 As OpenCart
	op1.Initialize
	
	If rbyes.Checked Then
		SubscribeState = "1"
		op1.SubScribe(Me,"subsribe_receive",True)
	Else
		SubscribeState = "0"
		op1.SubScribe(Me,"subsribe_receive",False)
	End If
	
End Sub

Sub btndelete_address_Click
	
	pnlloading.SetVisibleAnimated(500,True)
	btnback_menu_Click
	
	Dim opDeleteAddr As OpenCart
	opDeleteAddr.Initialize
	opDeleteAddr.DeleteAddressUser(Me,"DeleteAddress_receive",ChoosenAddressID)
		
End Sub

Sub btnedit_address_Click
	
	btnback_menu_Click
	
	For i = 0 To listAddressCache.Size - 1
					
			Dim temp As Map
			temp = listAddressCache.Get(listAddressCache.GetKeyAt(i))
			
			If ChoosenAddressValue = $"${temp.Get("country")} ${temp.Get("city")} ${temp.Get("address_1")}"$ Then
				
				txtaddress.Text = temp.Get("address_1")
				txtpostal_enter.Text = temp.Get("postcode")
				choosenCity = temp.Get("city")
				btnadd.Text = Library.GetStringResourse("edit")
				
				For k = 0 To txtcountry.Size - 1
				
					If txtcountry.GetItem(k) = temp.Get("country") Then
						
						ChoosenAddress4Edit = listAddressCache.GetKeyAt(i)
						
						txtcountry.SelectedIndex = k
						
						Dim opCity As OpenCart
						opCity.Initialize
						opCity.GetCity(Me,"city_receive",temp.Get("country_id"))
						
						Exit
						
					End If
					
				Next
				
				btnadd.Background = Library.GetButtonState
				btncancel_new_address.Background = Library.GetButtonState
				pnlnew_address.SetVisibleAnimated(500,True)
				
				Return
				
			End If
			
		Next
	
End Sub

Sub btndefault_address_Click
	
	btnback_menu_Click
	Library.ChoosenAddress = ChoosenAddressID
	toast.ShowToastMessageShow(Library.GetStringResourse("choosen_address"),2,True)
	
End Sub

Sub btnback_menu_Click
	pnlaction.SetLayoutAnimated(600,0,Activity.Height + pnlaction.Height,pnlaction.Width,pnlaction.Height)
End Sub

Sub txtphone_FocusChanged (HasFocus As Boolean)
	sv1.ScrollPosition = txtphone.Top-lblphone.Height
End Sub

Sub txtfax_FocusChanged (HasFocus As Boolean)
	sv1.ScrollPosition = txtfax.Top-lblfax.Height
End Sub

Sub btncancel_return_Click
	sv_return_details.Panel.RemoveAllViews
	pnldetails_return.SetVisibleAnimated(500,False)
End Sub