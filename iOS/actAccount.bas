Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Public ChoosenTab As String
	Private tmrOpenMenu As Timer
	Public ChoosenTab As String
	Dim svReturns As ScrollView
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
	Private txtemail As TextField
	Private txtfamily As TextField
	Private txtfax As TextField
	Private txtname As TextField
	Private txtpassword As TextField
	Private txtphone As TextField
 
	Private btnpassword As Button
	Private lblcountry As Label
	Private txtcountry As Picker
	Private lblcity As Label
	Private txtcity As Picker
	Private lbladdress As Label
	Private btnadd As Button
	Private listCity,listCountries As List
	Private txtaddress As TextField
	Private lvAddress,listCountry As Picker
	Private lblid As Label
	Private lblstate2 As Label
	Private btndetails As Button
	Private pnlorder As Panel
	Private btnadd_address As Button
	Private btncancel_new_address As Button
	Private lblpostal_enter As Label
	Private txtpostal_enter As TextField
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
	Private rbyes As Switch
	Private btnapply_newsletter As Button
	Private pnlaction As Panel
	Private lbldefault_address As Label
	Private lbledit_address As Label
	Private lbldelete_address As Label
	Private ChoosenAddressID,ChoosenAddressValue As String
	Private btnback_menu As Button
	Private lblback_menu As Label
	Private lblpassword_title As Label
	Private txtpassword2 As TextField
	Private lblpassword2 As Label
	Private pnldetails_return As Panel
	Private sv_return_details As ScrollView
	Private btncancel_return As Button
	Private svParent As ScrollView
	Private svNewsletter As ScrollView
	Private lblno As Label
	Private lblyes As Label
	Private svPassword As ScrollView
	Private svOrders As ScrollView
	Private svAddress As ScrollView
	Private lbladdress_1 As Label
	Private pnlaction_address As Panel
	Private svadd_address As ScrollView
	Private lbldivider As Label
	Private btnopen As Button
	Private lbldivider_return As Label
End Sub

Sub StartActivity
	
	Library.AccountPage.Initialize("pageAccount")
	Library.AccountPage.RootPanel.LoadLayout("frmaccounts")
	Library.NavControl.ShowPage(Library.AccountPage)
	
	pnlmenu.Color = Library.Theme_Header
	Library.AccountPage.RootPanel.Color = Library.Theme_Header
	
	toast.Initialize(Library.AccountPage.RootPanel)
	tmrOpenMenu.Initialize("tmrOpenMenu",250)
		
	lblpb.Text = Library.GetStringResourse("loading")
	Library.GetButtonState(btncancel_return)
	btncancel_return.Text = Library.GetStringResourse("cancel")
	pnlloading.Visible = True
	
	svParent.Panel.LoadLayout("frmaccount_details")
	svParent.ContentWidth = Library.GetWidth - pnlmenu.Width-30dip
	svParent.ContentHeight = btnsave.Top + btnsave.Height + 30dip
	
	lblname.Text = Library.GetStringResourse("lblname")
	lblfamily.Text = Library.GetStringResourse("lblfamily")
	lblemail.Text = Library.GetStringResourse("lblemail")
	lblfax.Text = Library.GetStringResourse("lblfax")
	lblphone.Text = Library.GetStringResourse("lblphone")
	btnsave.Text = Library.GetStringResourse("save_details")
	Library.GetButtonState(btnsave)
	
	svadd_address.Panel.LoadLayout("frmaccount_add_address")
	txtaddress.Color = Colors.RGB(250,250,250)
	txtpostal_enter.Color = Colors.RGB(250,250,250)
	lblcountry.Text = Library.GetStringResourse("country")
	lblcity.Text =  Library.GetStringResourse("city")
	lbladdress.Text =  Library.GetStringResourse("address1")
	btnadd.Text = Library.GetStringResourse("new_address")
	btncancel_new_address.Text = Library.GetStringResourse("cancel")
	lblpostal_enter.Text = Library.GetStringResourse("postal")
	svadd_address.ContentWidth = Library.GetWidth - pnlmenu.Width-30dip
	svadd_address.ContentHeight = 600
	
	svOrders.Panel.Color = Colors.RGB(247, 244, 244)
	
	#Region Newsletter
	svNewsletter.panel.LoadLayout("frmaccount_newsletter")
	lblnewsletteroption.TextAlignment = Library.GetStringResourse("direction_ios")
	lblnewsletteroption.Font = Library.GetFont(14)
	btnapply_newsletter.Text = Library.GetStringResourse("scribe_change_state")
	Library.GetButtonState(btnapply_newsletter)
	lblyes.Text = Library.GetStringResourse("subscribe")
	lblno.Text = Library.GetStringResourse("unsubscribe")
	svNewsletter.ContentWidth = Library.GetWidth - pnlmenu.Width-30dip
	svNewsletter.ContentHeight = 300
	btnapply_newsletter.CustomLabel.Font = Library.GetFont(14)
	#End Region
	
	#Region Change password
	svPassword.Panel.LoadLayout("frmaccount_password")
	lblpassword.TextAlignment = Library.GetStringResourse("direction_ios")
	lblpassword2.TextAlignment = Library.GetStringResourse("direction_ios")
	lblpassword_title.TextAlignment = Library.GetStringResourse("direction_ios")
	lblpassword.Text = Library.GetStringResourse("lblpassword")
	lblpassword2.Text = Library.GetStringResourse("lblpassword2")
	lblpassword_title.Text = Library.GetStringResourse("password_title")
	btnpassword.Text = Library.GetStringResourse("save_password")
	Library.GetButtonState(btnpassword)
	txtpassword.TextAlignment = txtpassword.ALIGNMENT_LEFT
	txtpassword.PasswordMode = True
	txtpassword.Color = Colors.RGB(250,250,250)
	txtpassword2.Color = Colors.RGB(250,250,250)
	Library.LabelSpace(lblpassword_title,1.3)
	svPassword.ContentWidth = Library.GetWidth - pnlmenu.Width-30dip
	svPassword.ContentHeight = 300
	#End Region
	
	lblcountry.TextAlignment = Library.GetStringResourse("direction")
	lblcity.TextAlignment = Library.GetStringResourse("direction")
	lbladdress.TextAlignment = Library.GetStringResourse("direction")
	lblpostal_enter.TextAlignment = Library.GetStringResourse("direction")
'	
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
	Library.SetFont(lblnewaddress,"icomoon",14)
	
	For Each v2 As View In pnlmenu.GetAllViewsRecursive
		If v2 Is Button Then
			Dim b As Button
			b = v2
			Library.SetFont(b,"icomoon",b.CustomLabel.Font.Size)
		End If
	Next
	
	ChangeViewSetting
	pnlloading.Visible = True
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.UserDetails(Me,"getDetails_receive")

	Dim opCountry As OpenCart
	opCountry.Initialize
	opCountry.GetCountry(Me,"country_receive")
	
	If Library.IsPersian Then
		pnlmain.Left = 0
		pnlmenu.Left = Library.GetWidth + pnlmain.Width
	End If
	
End Sub

Sub pageAccount_Appear
	
End Sub

Sub pageAccount_Disappear
	
End Sub

Sub ChangeViewSetting

	For Each v1 As View In svadd_address.Panel.GetAllViewsRecursive
		
		If v1 Is TextField Then
			Dim t1 As TextField
			t1 = v1
			t1.TextAlignment = Library.GetStringResourse("direction_ios")
		End If
		
		If v1 Is Label Then
			Dim l1 As Label
			l1 = v1
			l1.Font = Library.GetFont(l1.Font.Size)
			l1.TextAlignment = Library.GetStringResourse("direction_ios")
		End If
		
	Next
	
	For Each v1 As View In svParent.Panel.GetAllViewsRecursive
		
		If v1 Is Button Then Continue
		
		If v1 Is TextField Then
			Dim t1 As TextField
			t1 = v1
			t1.Color = Library.ConvertHex2Int(Library.GetStringResourse("textbox_color"))
			t1.TextAlignment = Library.GetStringResourse("direction_ios")
		End If
		
		If v1 Is Label Then
			Dim l1 As Label
			l1 = v1
			l1.Font = Library.GetFont(l1.Font.Size)
			l1.TextAlignment = Library.GetStringResourse("direction_ios")
		End If
		
	Next
	
	For Each v2 As View In svPassword.Panel.GetAllViewsRecursive
		
		If v2 Is Button Then
			Dim t2 As Button
			t2 = v2
			t2.CustomLabel.Font = Library.GetFont(14)
		End If
		
		If v2 Is Label Then
			Dim l1 As Label
			l1 = v2
			l1.Font = Library.GetFont(l1.Font.Size)
		End If
		
	Next
	
	For Each v2 As View In pnlaction_address.GetAllViewsRecursive
		
		If v2 Is Button Then
			Dim t2 As Button
			t2 = v2
			Library.SetFont(t2.CustomLabel,"icomoon",t2.CustomLabel.Font.Size)
		End If
		
		If v2 Is Label Then
			Dim l1 As Label
			l1 = v2
			l1.Font = Library.GetFont(l1.Font.Size)
		End If
		
	Next
	
	For Each v2 As View In svadd_address.Panel.GetAllViewsRecursive
		
		If v2 Is Label Then
			Dim l1 As Label
			l1 = v2
			l1.Font = Library.GetFont(l1.Font.Size)
		End If
		
	Next
	
End Sub

Sub HideMainpanelSV
	
	svReturns.Visible = False
	svAddress.Visible = False
	svadd_address.Visible = False
	svOrders.Visible = False
	svParent.Visible = False
	svPassword.Visible = False
	svNewsletter.Visible = False
	
End Sub

Sub Orders_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		
		If res.Get("success") = True Then
			Dim m1 As Map
			m1.Initialize
			m1 = res.Get("data")
			
			Dim l1 As List
			l1 = m1.Get("orders")
			
			Dim top As Int
			top = 0
			svOrders.Panel.Color = Colors.White
			svOrders.Color = Colors.White
			
			For i = 0 To l1.Size - 1
				
				Dim temp As Map
				temp = l1.Get(i)
				
				Dim p1 As Panel
				p1.Initialize("")
				
				svOrders.Panel.AddView(p1,-10,top,svOrders.Width,0)
				
				If Library.IsPersian Then
					p1.LoadLayout("frmtemplate_order")
					lbldate.Text = Library.GetDate(temp.Get("date_added"))
				Else
					p1.LoadLayout("frmtemplate_order_en")
					lbldate.Text = temp.Get("date_added")
				End If
				
				
				p1.Color = Colors.White
				pnlorder.Color = Colors.White
				p1.Height = pnlorder.Height
				
				lbldate.Font = Library.GetFont(lbldate.Font.Size)
				lblid.Text = Library.GetStringResourse("order_id").Replace("0",temp.Get("order_id")).Replace("1","")
				lblid.Font = Library.GetFont(lblid.Font.Size)
				lblstate2.Text = temp.Get("status")
				lblstate2.Font = Library.GetFont(lblstate2.Font.Size)
				btndetails.Text = Library.GetStringResourse("order_details")
				btndetails.CustomLabel.Font = Library.GetFont(14)
				btndetails.Tag = temp.Get("order_id")
				
				top = top + p1.Height
				
			Next
			
			svOrders.Panel.Height = top + 150dip
			svOrders.ContentHeight = top
			svOrders.ContentWidth = Library.GetWidth - pnlmenu.Width-30dip
			
			svOrders.Color = Colors.White
			svOrders.Panel.Color = Colors.White
	
			If ChoosenTab = "order" Then
			
			End If
			
			pnlloading.Visible = False
			
			Return
			
		End If
	End If
	
	pnlloading.Visible = False
	
End Sub

Sub ListAddress_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim d1 As Map
			d1 = res.Get("data")
			d1 = d1.Get("addresses")
			
			listAddressCache = d1
 
			listAddressID.Initialize
			
			Dim ls As List
			ls.Initialize
		
			Dim top,i As Int
			
			svAddress.Panel.RemoveAllViews
			svAddress.Color = Colors.White
			
			For Each key As String In d1.Keys
				
				Dim temp As Map
				temp = d1.Get(key)

				Dim p As Panel
				p.Initialize("")
				p.LoadLayout("frmaddress_item")
				lbladdress_1.Text = $"${temp.Get("country")} ${temp.Get("city")} ${temp.Get("address_1")}"$
				lbladdress_1.Font = Library.GetFont(14)
				lbladdress_1.TextAlignment = Library.GetStringResourse("direction_ios")
				svAddress.panel.AddView(p,0,top,svAddress.Width,60dip)
				top = top + 70dip
				
				lbladdress_1.Tag = CreateMap("index":i,"value":lbladdress_1.Text)
				ls.Add(temp.Get("address_id"))
				
				i = i + 1
				
				svAddress.Panel.Height = svAddress.Panel.Height + 70dip
				listAddressID.Add(temp.Get("address_id"))
				
			Next
			
			svAddress.ContentWidth = svAddress.Width
			svAddress.ContentHeight = top
			
			If ChoosenTab = "address" Then
				ChoosenTab = ""
			End If
			
			Return
			
		End If
	End If
	
End Sub

Sub country_receive(ls As List,cat As String)
	
	pnlloading.Visible = False
	
	listCountries.Initialize
	listCountries = ls
	
	Dim City,ls1 As List
	City.Initialize
	ls1.Initialize
	
	Dim index As Int : index = -1
	
	For i = 0 To ls.Size - 1
	
		Dim te As Map
		te = ls.Get(i)
		ls1.Add(te.Get("name"))
		
'		If Library.IsPersian Then
'			If te.Get("country_id") = "101" Then index = i
'		End If
		
	Next
	
	txtcountry.SetItems(0,ls1)
	
	If index <> -1 Then
		txtcountry.SelectRow(0,index,True)
	Else
		txtcountry.SelectRow(0,0,True)
	End If
	
	
'	If Library.IsPersian Then
'		Dim opCity As OpenCart
'		opCity.Initialize
'		opCity.GetCity(Me,"city_receive","101")
'	End If

		Dim opCity As OpenCart
		opCity.Initialize
		Dim tem As Map
		tem = listCountries.Get(0)
		opCity.GetCity(Me,"city_receive",tem.Get("country_id"))
	
End Sub

Sub city_receive(res As List,cat As String)
	
	pnlloading.Visible = False
	
	listCity = res
	
	If res = Null Then Return
	
	Dim ls As List
	ls.Initialize
	
	For i = 0 To res.Size - 1
		
		Dim m1 As Map
		m1 = res.Get(i)
		
		ls.Add(m1.Get("name"))	
		If m1.Get("name") = choosenCity Then txtcity.SelectRow(0,i,True)
		
	Next
	
	txtcity.SetItems(0,ls)
	txtcity.SelectRow(0,0,True)
	
End Sub

Sub txtcountry_ItemSelected (Column As Int, Row As Int)
	
	pnlloading.Visible = True
	
	For i = 0 To listCountries.Size - 1
		
		Dim m1 As Map
		m1 = listCountries.Get(i)
		
		If m1.Get("name") = txtcountry.GetSelectedItem(0) Then
			pnlloading.Visible = True
			Dim opCity As OpenCart
			opCity.Initialize
			opCity.GetCity(Me,"city_receive",m1.Get("country_id"))
			Return
		End If
		
	Next
	
	pnlloading.Visible = False
	
End Sub

Sub getDetails_receive(res As Map,cat As String)
	
	If Library.IsPersian Then
		pnlmain.Left = 0
	End If
	
	Library.HUD.ProgressDialogHide
	pnlloading.Visible = False
	
	If res.ContainsKey("error") Then
		If res.Get("error") = "User is not logged in" Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("login_force"),False)
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
				rbyes.Value = False
				lblyes.Visible = False
				lblno.Visible = True
				lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_1")
			Else
				lblyes.Visible = True
				rbyes.Value = True
				lblno.Visible = False
				rbyes.Visible = True
				lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_0")
			End If
			
		Else
			Library.NavControl.ShowPage(Library.MenuPage)
		End If
		
	Else
		Library.NavControl.ShowPage(Library.MenuPage)
	End If
	
End Sub

Sub tmrOpenMenu_Tick
	
	tmrOpenMenu.Enabled = False

	If Library.IsPersian Then
		pnlmenu.Left = Library.GetWidth
		pnlmenu.SetLayoutAnimated(800,1,pnlmain.Width,pnlmenu.Top,pnlmenu.Width,pnlmenu.Height)
	Else
		pnlmenu.SetLayoutAnimated(800,1,0,pnlmenu.Top,pnlmenu.Width,pnlmenu.Height)
	End If
	
End Sub

Sub btnclose_Click
	
	If pnldetails_return.Visible = True Then
		pnldetails_return.Visible = False
		Return
	End If
	
	Library.NavControl.ShowPage(Library.MenuPage)
	
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
	pnlloading.Visible = True
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.UpdateUserDetails(Me,"updatedetails_receive",data)
	
End Sub

Sub updatedetails_receive(res As Map,cat As String)
	
	Library.HUD.ProgressDialogHide
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
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
	pnlloading.Visible = True
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.UpdatePasswordUser(Me,"changepassword_receive",txtpassword.Text)
	
End Sub

Sub changepassword_receive(res As Map,cat As String)
	
	Library.HUD.ProgressDialogHide
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
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
	
	If txtcity.GetSelectedRow(0) < 0 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_city"),2,False)
		Return
	End If
	
	data.Put("city",txtcity.GetSelectedItem(0))

	For k = 0 To listCity.Size - 1
		
		Dim m2 As Map
		m2 = listCity.Get(k)
		
		If m2.Get("name") = txtcity.GetSelectedItem(0) Then
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
	pnlloading.Visible = True
	
	Dim op1 As OpenCart
	op1.Initialize
	
	If btnadd.Text = Library.GetStringResourse("edit") Then
		op1.EditAddressUser(Me,"editAddress_receive",data,ChoosenAddress4Edit)
	Else
		op1.AddAddressUser(Me,"addAddress_receive",data)
	End If
	
End Sub

Sub editAddress_receive(res As  Map,cat As String)
	
	Library.HUD.ProgressDialogHide
	
	If res = Null Then Return
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
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
	
	Library.HUD.ProgressDialogHide
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
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
	
	HideMainpanelSV
	svadd_address.Visible = True
	DefaultButtonMenuColor
	
	btnadd_address.CustomLabel.TextColor = Colors.RGB(244,255,0)
	lblnewaddress.TextColor = Colors.RGB(244,255,0)
	
	btnadd.Text = Library.GetStringResourse("new_address")
	Library.GetButtonState(btnadd)
	Library.GetButtonState(btncancel_new_address)
	btnback_menu_Click
	
End Sub

Sub btncancel_new_address_Click
	ChoosenAddress4Edit = 0
	btnprofile_Click
End Sub

Sub btndetails_Click

	Dim b1 As Button
	b1 = Sender
	
	Dim id1 As String
	id1 = b1.Tag
	
	pnlloading.Visible = True
	
	Dim opDetails As OpenCart
	opDetails.Initialize
	opDetails.GetOrders(Me,"DetailsOrder_receive",id1)
	
End Sub

Sub DetailsOrder_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
			Dim data As Map
			data = res.Get("data")
			Library.LastPage = Library.AccountPage
			actOrderDetails.details = data
			actOrderDetails.user_details = CreateMap("firstname":txtname.Text,"lastname":txtfamily.Text,"email":txtemail.Text,"telephone":txtphone.Text,"order_id":data.Get("order_id"),"date_ordered":data.Get("date_added"))
			actOrderDetails.StartActivity
		End If
	End If
	
End Sub

Sub lbladdress_1_Click
	
	Dim lb As Label
	lb = Sender
	
	Dim p As Map
	p = lb.Tag
	
	ChoosenAddressID = listAddressID.Get(p.Get("index"))
	ChoosenAddressValue = p.Get("value")
	pnlaction.SetLayoutAnimated(600,1,0,Library.GetHeight - pnlaction.Height-20dip,pnlaction.Width,pnlaction.Height)
	
End Sub

Sub DeleteAddress_receive(res As Map,cat As String)
	
	pnlloading.Visible = False

	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
			
			listAddressID.Clear
			
			toast.ShowToastMessageShow(Library.GetStringResourse("deleted_address"),2,True)
			
			Dim opAddress As OpenCart
			opAddress.Initialize
			opAddress.ListAddressUser(Me,"ListAddress_receive")
			
		End If
	End If
	
End Sub

Sub btnprofile_Click
	HideMainpanelSV
	svParent.Visible = True
	DefaultButtonMenuColor
	btnprofile.CustomLabel.TextColor = Colors.RGB(244,255,0)
	btnback_menu_Click
End Sub

Sub btnpasswords_Click
	HideMainpanelSV
	svPassword.Visible = True
	DefaultButtonMenuColor
	btnpasswords.CustomLabel.TextColor = Colors.RGB(244,255,0)
	btnback_menu_Click
End Sub

Sub btnorders_Click
	
	HideMainpanelSV
	svOrders.Visible = True
	
	If svOrders.Panel.NumberOfViews = 0 Then
		pnlloading.Visible = True
		Dim opOrder As OpenCart
		opOrder.Initialize
		opOrder.GetOrders(Me,"Orders_receive","")
	End If
	
	DefaultButtonMenuColor
	btnorders.CustomLabel.TextColor = Colors.RGB(244,255,0)
	
	btnback_menu_Click
	
End Sub

Sub btnaddress_Click
	
	HideMainpanelSV
	svAddress.Visible = True
 
	If svAddress.Panel.NumberOfViews = 0  Then
		pnlloading.Visible = True
		Dim opAddress As OpenCart
		opAddress.Initialize
		opAddress.ListAddressUser(Me,"ListAddress_receive")
	End If
	
	DefaultButtonMenuColor
	btnaddress.CustomLabel.TextColor = Colors.RGB(244,255,0)
	
	btnback_menu_Click
	
End Sub

Sub btnscribe_Click

	HideMainpanelSV
	
	svParent.Visible = False
	svNewsletter.Visible = True
	DefaultButtonMenuColor
	btnscribe.CustomLabel.TextColor = Colors.RGB(244,255,0)
	
	btnback_menu_Click
	
End Sub

Sub subsribe_receive(res As Map,cat As String)
	
	Library.HUD.ProgressDialogHide
	pnlloading.Visible = False
	
	If res.IsInitialized Then
		If res.ContainsKey("success") Then
			If res.Get("success") = 1 Then
				
				If SubscribeState = "1" Then
					rbyes.Value = False
					lblyes.Visible = False
					lblno.Visible = True
					lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_1")
				Else
					lblyes.Visible = True
					rbyes.Value = True
					lblno.Visible = False
					rbyes.Visible = True
					lblnewsletteroption.Text = Library.GetStringResourse("scribe_state_0")
				End If
				
			End If
		End If
	End If
			
End Sub

Sub btnreturns_Click

	HideMainpanelSV
	svReturns.Visible = True
	
	DefaultButtonMenuColor
	btnreturns.CustomLabel.TextColor = Colors.RGB(244,255,0)
	
	If svReturns.Panel.NumberOfViews = 0 Then
		lblpb.Text = Library.GetStringResourse("loading")
		pnlloading.Visible = True
		
		Dim op As OpenCart
		op.Initialize
		op.GetReturns(Me,"returns_receive","")
	End If
	
	btnback_menu_Click
	
End Sub

Sub returns_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
			Dim m1 As Map
			m1.Initialize
			m1 = res.Get("data")
			
			Dim l1 As List
			l1 = m1.Get("returns")
			
			Dim top As Int
			top = 0
			svReturns.Panel.Color = Colors.White
			svReturns.Color = Colors.White
			
			For i = 0 To l1.Size - 1
				
				Dim temp As Map
				temp = l1.Get(i)
				
				Dim p1 As Panel
				p1.Initialize("")
				
				svReturns.Panel.AddView(p1,-10,top,svReturns.Width,0)
				
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
				
				lblreturn_title.Font = Library.GetFont(lblreturn_title.Font.Size)
				lblreturn_state.Font = Library.GetFont(lblreturn_state.Font.Size)
				Library.SetFont(btnreturn_details.CustomLabel,"icomoon",18)
				lblreturn_title.TextAlignment = Library.GetStringResourse("direction_ios")
				lblreturn_state.TextAlignment = Library.GetStringResourse("direction_ios")

				top = top + p1.Height
				
			Next
			
			svReturns.Panel.Height = top + 140dip
			svReturns.ContentWidth = Library.GetWidth - pnlmenu.Width-30dip
			svReturns.ContentHeight = top + 100dip
			
			Return
			
		End If
	End If
	
End Sub

Sub btnreturn_details_Click
	
	Dim bu As Button
	bu = Sender
	
	pnlloading.Visible = True
	
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
	
	pnlloading.Visible = False
	
	sv_return_details.Panel.RemoveAllViews
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
			Dim data As Map
			data = res.Get("data")
				
				Dim top As Int
				sv_return_details.Color = Colors.White
				sv_return_details.Panel.Color = Colors.White
			
				sv_return_details.ContentWidth = sv_return_details.Width
				
				For Each vs As String In data.Keys
					
					If data.Get(vs) Is List Then Continue
					
					Dim lblKey As Label
					lblKey.Initialize("")
					lblKey.Color = Colors.RGB(242, 242, 242)
					
					lblKey.TextColor = Colors.Black
					
					lblKey.Font = Library.GetFont(14)
					lblKey.Text = "  " & Library.GetStringResourse("return_item_" & vs) & "  "
					
					If lblKey.Text = "null" Then lblKey.Text = "-"
					
					lblKey.TextAlignment = Library.GetStringResourse("direction_ios")
					
					sv_return_details.Panel.AddView(lblKey,0,top,sv_return_details.Width,40dip)
					top = top + 40dip
					
					Dim lblVal As Label
					lblVal.Initialize("")
					lblVal.Color = Colors.Rgb(253, 253, 253)
					
					lblVal.TextColor = Colors.Black
					lblVal.Text = "  " & data.Get(vs) & "  "
					
					lblVal.Font = Library.GetFont(12)
					
					If lblVal.Text.ToLowerCase.IndexOf("null") <> -1 Then lblVal.Text = "-"
					
					lblVal.TextAlignment = Library.GetStringResourse("direction_ios")
					
					sv_return_details.Panel.AddView(lblVal,0,top,sv_return_details.Width,40dip)
					top = top + 47dip
					
					Dim divider As Label
					divider.Initialize("")
					sv_return_details.Panel.AddView(divider,7,top,sv_return_details.Width-10,1dip)
					divider.Color = Colors.RGB(242,242,242)
					top = top + 7dip
					
				Next
				
				btncancel_return.CustomLabel.Font = Library.GetFont(14)
				
				sv_return_details.ContentHeight = top	
				pnldetails_return.Visible = True
				pnldetails_return.BringToFront
				
		End If
	End If
	
End Sub

Sub DefaultButtonMenuColor
	
	For Each v1 As View In pnlmenu.GetAllViewsRecursive
		If v1 Is Button Then
			Dim b1 As Button
			b1 = v1
			b1.CustomLabel.TextColor = Colors.White	
		End If
	Next
	
	lblnewaddress.TextColor = Colors.White
	
End Sub

Sub btnapply_newsletter_Click
	
	lblpb.Text = Library.GetStringResourse("apply")
	pnlloading.Visible = True
	
	Dim op1 As OpenCart
	op1.Initialize
	
	If rbyes.Value Then
		SubscribeState = "1"
		op1.SubScribe(Me,"subsribe_receive",True)
	Else
		SubscribeState = "0"
		op1.SubScribe(Me,"subsribe_receive",False)
	End If
	
End Sub

Sub btndelete_address_Click
	
	pnlloading.Visible = True
	btnback_menu_Click
	
	Dim opDeleteAddr As OpenCart
	opDeleteAddr.Initialize
	opDeleteAddr.DeleteAddressUser(Me,"DeleteAddress_receive",ChoosenAddressID)
		
End Sub

Sub btnedit_address_Click
	
	HideMainpanelSV
	btnback_menu_Click
	
	For Each vs As String In listAddressCache.Keys
					
			Dim temp As Map
			temp = listAddressCache.Get(vs)
			
			If ChoosenAddressValue = $"${temp.Get("country")} ${temp.Get("city")} ${temp.Get("address_1")}"$ Then
				
				txtaddress.Text = temp.Get("address_1")
				txtpostal_enter.Text = temp.Get("postcode")
				choosenCity = temp.Get("city")
				btnadd.Text = Library.GetStringResourse("edit")
				
				For k = 0 To txtcountry.GetItems(0).Size - 1
				
					If txtcountry.GetItems(0).Get(k) = temp.Get("country") Then
						
						ChoosenAddress4Edit = vs
						
						txtcountry.SelectRow(0,k,True)
						
						Dim opCity As OpenCart
						opCity.Initialize
						opCity.GetCity(Me,"city_receive",temp.Get("country_id"))
						
						Exit
						
					End If
					
				Next
				
				Library.GetButtonState(btnadd)
				Library.GetButtonState(btncancel_new_address)
				HideMainpanelSV
				svadd_address.Visible = True
				
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
	pnlaction.SetLayoutAnimated(600,1,0,Library.GetHeight + pnlaction.Height,pnlaction.Width,pnlaction.Height)
End Sub

Sub txtphone_FocusChanged (HasFocus As Boolean)
 
End Sub

Sub txtfax_FocusChanged (HasFocus As Boolean)
'	sv1.ScrollTo(0,txtfax.Top-lblfax.Height,True)
End Sub

Sub btncancel_return_Click
	sv_return_details.Panel.RemoveAllViews
	pnldetails_return.Visible = False
End Sub