Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Public Guest As Boolean
	Private sv1 As ScrollView
	Private btnregister As Button
	Private btnlogin As Button
	Private lbltitle As Label
	Private pnlloading As Panel
	Private lblpb As Label
	Private top As Object = 0
	Private op1 As OpenCart
	Private pnlheader As Panel
	Private listCountry,listCity As List
	Private opCountry,opCity As OpenCart
	Private spCity As Picker
	Private successRegister As Boolean
	Private MyToastMessageShow1 As MyToastMessageShow
	Private chknewsletter As Switch
	Private pg As Page
	Private btnclose As Button
	Private lblnewsletter As Label
	Private username,password As String
End Sub

Sub StartActivity
	
	pg.Initialize("pageRegister")
	
	pg.RootPanel.LoadLayout("frmregister")
	MyToastMessageShow1.Initialize(pg.RootPanel)
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	lblnewsletter.Font = Library.GetFont(lbltitle.Font.Size)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	Library.NavControl.ShowPage(pg)
	
	If Guest = False Then
		lbltitle.Text = Library.GetStringResourse("register")
		btnregister.Text = Library.GetStringResourse("register")
	Else
		lbltitle.Text = Library.GetStringResourse("reuquest_guest")
		btnregister.Text = Library.GetStringResourse("continues")
	End If
	
	lblpb.Text = Library.GetStringResourse("loading")
	btnlogin.Text = Library.GetStringResourse("login")
	lblnewsletter.Text = Library.GetStringResourse("register_newsletter")
	pnlheader.Color = Library.Theme_Header
	
	btnregister.Top = btnregister.Top-20dip
	btnregister.CustomLabel.Font = Library.GetFont(btnregister.CustomLabel.Font.Size)
	
	Library.GetButtonState(btnlogin)
	Library.GetButtonState(btnregister)
	
	top = 14
	op1.Initialize
	listCity.Initialize
	
	opCountry.Initialize
	opCity.Initialize
	
	pnlloading.Visible = True
	
	If listCountry.IsInitialized = False Then
		opCountry.GetCountry(Me,"country_receive")
	Else
		country_receive(listCountry,"")
	End If
	
	btnregister.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.LastPage)	
End Sub

Sub country_receive(ls As List,cat As String)
	
	pnlloading.Visible = False
	
	listCountry = ls
	
	Dim City As List
	City.Initialize
	
	Dim lsCountryname,lsCityname As List
	lsCountryname.Initialize
	lsCityname.Initialize
	
	For i = 0 To ls.Size - 1
	
		Dim te As Map
		te = ls.Get(i)
		
		Dim name As String
		name = te.Get("name")
		lsCountryname.Add(name)
		
	Next
	
	top = AddItem(Library.GetStringResourse("tname"),"text","firstname","",True).top
	top = AddItem(Library.GetStringResourse("lastname"),"text","lastname","",True).top
	top = AddItem(Library.GetStringResourse("email"),"text","email","",True).top
	If Guest = False Then top = AddItem(Library.GetStringResourse("password"),"text","password","",True).top
	top = AddItem(Library.GetStringResourse("country"),"spinner","country",lsCountryname,False).top
	
	top = top + 50dip
	Dim response As ResponseAddItem
	response = AddItem(Library.GetStringResourse("state"),"spinner","state",lsCityname,False)
	spCity = response.View1
	top = response.top
	
	top = top + 120dip
	
	top = AddItem(Library.GetStringResourse("city"),"text","city","",True).top
	
	top = AddItem(Library.GetStringResourse("address1"),"text","address_1","",True).top

	top = AddItem(Library.GetStringResourse("postal"),"text","postcode","",True).top
	top = AddItem(Library.GetStringResourse("phone"),"text","telephone","",True).top
	top = AddItem(Library.GetStringResourse("fax"),"text","fax","",True).top
	
	If Library.IsPersian Then
		opCity.GetCity(Me,"city_receive","101")
	End If
	
	sv1.Panel.Height = sv1.Panel.Height + 190dip
	sv1.ContentHeight = sv1.Panel.Height
	sv1.ContentWidth = sv1.Width
				
End Sub

Sub country_ItemSelected (Column As Int, Row As Int)
	
	Dim pick As Picker
	pick = Sender
	
	For i = 0 To listCountry.Size - 1
		
		Dim m1 As Map
		m1 = listCountry.Get(i)
		
		If m1.Get("name") = pick.GetItems(0).Get(Row) Then
			pnlloading.Visible = True
			opCity.GetCity(Me,"city_receive",m1.Get("country_id"))
			Return
		End If
		
	Next
	
End Sub

Sub city_receive(res As List,cat As String)
	
	pnlloading.Visible = False
	
	listCity = res
	
	spCity.GetItems(0).Clear
	
	Dim ls As List
	ls.Initialize
	
	Dim tehran As Int = 0
	
	For i = 0 To res.Size - 1
		Dim m1 As Map
		m1 = res.Get(i)
		ls.Add(m1.Get("name"))
		
		Dim temp As String
		temp = m1.Get("name")
		If temp.IndexOf("تهران") > -1 Then
			tehran = i	
		End If
		
	Next
	
	spCity.SetItems(0,ls)
	
	spCity.SelectRow(0,tehran,True)
	
End Sub

Sub spcity_ItemClick (Position As Int, Value As Object)
		
End Sub

Sub pageRegister_Disappear
	
	Guest = False
	successRegister = False
	
End Sub

Sub btnregister_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	Dim su As StringUtils
	Dim data As Map
	
	data.Initialize
	
	For Each v1 As View In sv1.Panel.GetAllViewsRecursive
		
		If v1 Is TextField Then
			
			Dim ed As TextField
			ed = v1
			
			If ed.Tag = "password" And ed.Text.Length < 5 Then
				MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
			
			Else If ed.Tag = "firstname" And ed.Text.Length < 2 Then
				MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
			
			Else If ed.Tag = "email" And Library.ValidEmail(ed.Text) = False Then
				MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
				
			Else If ed.Tag = "address_1" And ed.Text.Length < 5 Then
				MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
				
			Else If ed.Tag = "postcode" And Library.ValidPostalCode(ed.Text) = False Then
				MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
			
			Else If ed.Tag = "telephone" And Library.ValidPhoneNumber(ed.Text) = False Then
				MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
				
			End If
			
			data.Put(ed.Tag,ed.Text)
			
		End If
		
	Next
	
	data.Put("email",su.DecodeUrl(data.Get("email"),"UTF8"))
	
	If spCity.GetSelectedRow(0) < 0 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_city"),1.5,False)
		Return
	End If
	
	username = data.Get("email")
	password = data.Get("password")
	
	For k = 0 To listCity.Size - 1
		
		Dim m2 As Map
		m2 = listCity.Get(k)
		
		If m2.Get("name") = spCity.GetSelectedItem(0) Then
			data.Put("zone_id",m2.Get("zone_id"))
			data.Put("country_id",m2.Get("country_id"))
			Exit
		End If
		
	Next
	
	Library.GuestLogin.Initialize
	
	If Guest = True Then
		Library.GuestLogin = data
	End If
	
	pnlloading.Visible = True
	
	data.Put("newsletter","0")
	If chknewsletter.Value = True Then data.Put("newsletter","1")
	
	op1.register(Me,"register_receive",data,Guest)
	
End Sub

Sub register_receive(res As Map,cat As String)
	
	If res = Null Then Return
	
	pnlloading.Visible = False
	
	If res.IsInitialized = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Return
	End If
	
	If res.ContainsKey("error") Then
		If res.Get("error") = "User already is logged" Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("already_login"),1.5,False)
			Return
		Else
			Dim rs1 As Map
			rs1 = res.Get("error")
			
			Dim err As String
			
			For Each val As String In rs1.Values
				err = err & val & CRLF
			Next
			
			Msgbox(err,Library.GetStringResourse("alert"))
			
		End If
	
	Else If res.ContainsKey("success") Then
		
		If res.Get("success") = 1 Then
			
			If Guest = False Then	Library.HUD.ToastMessageShow(Library.GetStringResourse("register_success"),False)
			
			successRegister = True
			
			If Guest = False Then
				Guest = False
				Library.LastPage = Library.MenuPage
				actLogin.RegisteredUsername = username
				actLogin.RegisteredPassword = password
				actLogin.StartActivity
			Else
				Guest = False
				pnlloading.Visible = True
				Library.ChoosenAddress = 1
				Dim op1Guest As OpenCart
				op1Guest.Initialize
				op1.SetGuestShipMethods(Me,"setGuestShip_receive",Library.GuestLogin)
			End If
			
			Return
		End If
	End If
	
End Sub

Sub setGuestShip_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res = Null Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Return
	End If
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Guest = False
			Dim ms As Map
			Library.loginDetails = ms
			Library.GuestLogin.Put("login",True)
			Library.LastPage = Library.MenuPage
			actDoOrder.StartActivity
			Return
		End If
	End If
	
End Sub

Sub btnlogin_Click
	Library.LastPage = pg
	actDoOrder.StartActivity
End Sub

Sub AddItem(Title As String,sType As String,sName As String,Tag As Object,ShowIcon As Boolean) As ResponseAddItem
	
	Dim v1 As View
	
	#Region Make a Edittext
	If sType = "text" Then
		Dim txt1 As TextField
		txt1.Initialize("txtdata")
		txt1.Color = Colors.White
		txt1.TextColor = Colors.Black
		txt1.Font = Library.GetFont(14)
		txt1.TextAlignment = Library.GetStringResourse("direction_ios")
		txt1.Tag = sName
		v1 = txt1
		
		If sName = "address_1" Then
			txt1.AdjustFontSizeToFit = True
			'txt1.Text = "aaaaaaaaaaaaaaaaaaaaaaaaaa"
		End If
		
		If sName = "telephone" Or sName = "postcode" Or sName = "fax" Then
			txt1.KeyboardType = txt1.TYPE_NUMBERS_AND_PUNCTUATIONS
			txt1.ReturnKey = txt1.RETURN_DONE
			txt1.TextAlignment = txt1.ALIGNMENT_LEFT
			'txt1.Text = "06569138893"
			
			If ShowIcon = True Then
'				EditTextIcon(txt1,"ic_menu_edit")
			End If
			
		Else If sName = "password" Then
			txt1.PasswordMode = True
			txt1.TextAlignment = txt1.ALIGNMENT_LEFT
			If ShowIcon = True Then
'				EditTextIcon(txt1,"ic_menu_login")
			End If
			
		Else If sName = "email" Then
			txt1.TextAlignment = txt1.ALIGNMENT_LEFT
			txt1.KeyboardType = txt1.TYPE_EMAIL_ADDRESS
			If ShowIcon = True Then
'				EditTextIcon(txt1,"ic_menu_cc")
			End If
			'txt1.Text = "omid_student@yahoo.com"
		Else
			If ShowIcon = True Then
'				EditTextIcon(txt1,"ic_menu_edit")
			End If
		End If
		
		If sName <> "password" Then
'			txt1.SingleLine = True
		End If
	
	#End Region
	
	#Region Make a Spinner
	Else If sType = "spinner" Then
		
		Dim sp As Picker
		sp.Initialize(sName)
		
		If Tag <> Null Then
			If Tag Is List Then
				sp.SetItems(0,Tag)
			End If
		End If
		
		sp.Tag = sName
		
		If Library.IsPersian Then
			Dim lss As List
			lss = Tag
			For i=0 To lss.Size - 1
				If lss.Get(i) = "جمهوری اسلامی ایران" Then
					sp.SelectRow(0,i,True)
					Exit				
				End If
			Next
		End If
		
		v1 = sp
	
	#End Region
	
	End If
		
	Dim lbl1 As Label
	lbl1.Initialize("")
	lbl1.TextColor = Colors.Black
	lbl1.Font = Library.GetFont(14)
	lbl1.TextAlignment = Library.GetStringResourse("direction_ios")
	
	sv1.Panel.AddView(lbl1,15,top,sv1.Width - 34,30dip)
	top = top + 34dip
	
	If sType = "spinner" Then
		sv1.Panel.AddView(v1,15,top+20dip,sv1.Width - 34,97dip)
	Else
		sv1.Panel.AddView(v1,15,top,sv1.Width - 34,37dip)	
	End If
	
	top = top + 52dip
	
	lbl1.Text = Title
	
	sv1.Panel.Height = top
	
	Dim st As ResponseAddItem
	st.Initialize
	st.Top = top
	st.View1 = v1
	
	Return st
	
End Sub

Sub txtdata_BeginEdit
	Dim t2 As TextField
	t2 = Sender
	sv1.ScrollTo(0,t2.Top-t2.Height,True)
End Sub