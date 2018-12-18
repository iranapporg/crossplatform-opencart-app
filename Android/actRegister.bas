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
	Public Guest As Boolean
End Sub

Sub Globals
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
	Private spCity As Spinner
	Private successRegister As Boolean
	Private MyToastMessageShow As MyToastMessageShow
	Private chknewsletter As CheckBox
	Private sUsername,sPassword As String
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	
	Activity.LoadLayout("frmregister")
	MyToastMessageShow.Initialize(Activity)
	
	Library.ChangeStatusColor
	
	If Guest = False Then
		lbltitle.Text = Library.GetStringResourse("register")
		btnregister.Text = Library.GetStringResourse("register")
	Else
		lbltitle.Text = Library.GetStringResourse("reuquest_guest")
		btnregister.Text = Library.GetStringResourse("continues")
	End If
	
	lblpb.Text = Library.GetStringResourse("loading")
	btnlogin.Text = Library.GetStringResourse("login")
	chknewsletter.Text = Library.GetStringResourse("register_newsletter")
	chknewsletter.Gravity = Library.GetStringResourse("direction")
	pnlheader.Color = Library.Theme_Header
	btnlogin.Background = Library.GetButtonState
	btnregister.Background = Library.GetButtonState
	
	top = 14
	op1.Initialize
	listCity.Initialize
	
	opCountry.Initialize
	opCity.Initialize
	
	pnlloading.SetVisibleAnimated(500,True)
	
	If listCountry.IsInitialized = False Then
		opCountry.GetCountry(Me,"country_receive")
	Else
		country_receive(listCountry,"")
	End If
	
	Dim cd As ColorDrawable
	cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),0,0,Colors.Gray)
	btnregister.Background = cd
	
End Sub

Sub country_receive(ls As List,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
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
	
	top = Library.AddItem(Library.GetStringResourse("tname"),"text","firstname","",top,sv1,True).top
	top = Library.AddItem(Library.GetStringResourse("lastname"),"text","lastname","",top,sv1,True).top
	top = Library.AddItem(Library.GetStringResourse("email"),"text","email","",top,sv1,True).top
	If Guest = False Then top = Library.AddItem(Library.GetStringResourse("password"),"text","password","",top,sv1,True).top
	top = Library.AddItem(Library.GetStringResourse("country"),"spinner","country",lsCountryname,top,sv1,False).top
	
	Dim response As ResponseAddItem
	response = Library.AddItem(Library.GetStringResourse("state"),"spinner","state",lsCityname,top,sv1,False)
	spCity = response.View1
	top = response.top
	
	top = Library.AddItem(Library.GetStringResourse("city"),"text","city","",top,sv1,True).top
	top = Library.AddItem(Library.GetStringResourse("address1"),"text","address_1","",top,sv1,True).top
	top = top + 60dip
	top = Library.AddItem(Library.GetStringResourse("postal"),"text","postcode","",top,sv1,True).top
	top = Library.AddItem(Library.GetStringResourse("phone"),"text","telephone","",top,sv1,True).top
	top = Library.AddItem(Library.GetStringResourse("fax"),"text","fax","",top,sv1,True).top
	
	If Library.IsPersian Then
		opCity.GetCity(Me,"city_receive","101")
	End If
	
	sv1.Panel.Height = sv1.Panel.Height + 190dip
				
End Sub

Sub country_ItemClick (Position As Int, Value As Object)
	
	For i = 0 To listCountry.Size - 1
		
		Dim m1 As Map
		m1 = listCountry.Get(i)
		
		If m1.Get("name") = Value Then
			pnlloading.SetVisibleAnimated(500,True)	
			opCity.GetCity(Me,"city_receive",m1.Get("country_id"))
			Return
		End If
		
	Next
	
End Sub

Sub city_receive(res As List,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	listCity = res
	
	spCity.Clear
	
	For i = 0 To res.Size - 1
		Dim m1 As Map
		m1 = res.Get(i)
		spCity.Add(m1.Get("name"))
		If spCity.GetItem(i).IndexOf("تهران") > -1 Or spCity.GetItem(i).ToLowerCase.IndexOf("tehran") > -1 Then
			spCity.SelectedIndex = i
		End If
	Next
	
End Sub

Sub spcity_ItemClick (Position As Int, Value As Object)
		
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	
	If Guest = True And successRegister = True Then
		StartActivity(actDoOrder)
	End If
	
	Guest = False
	successRegister = False
		
	Library.AnimationFromLeft2Right
	
End Sub

Sub btnregister_Click
	
	Dim ime1 As IME
	ime1.Initialize("")
	ime1.HideKeyboard
	
	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	Dim su As StringUtils
	Dim data As Map
	
	data.Initialize
	
	For Each v1 As View In sv1.Panel.GetAllViewsRecursive
		
		If v1 Is EditText Then
			
			Dim ed As EditText
			ed = v1
			
			If ed.Tag = "password" And ed.Text.Length < 5 Then
				MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
			
			Else If ed.Tag = "firstname" And ed.Text.Length < 2 Then
				MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
			
			Else If ed.Tag = "email" And Library.ValidEmail(ed.Text) = False Then
				MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
				
			Else If ed.Tag = "address_1" And ed.Text.Length < 5 Then
				MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
				
			Else If ed.Tag = "postcode" And Library.ValidPostalCode(ed.Text) = False Then
				MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
			
			Else If ed.Tag = "telephone" And Library.ValidPhoneNumber(ed.Text) = False Then
				MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_" & ed.Tag),1.5,False)
				Return
		
			End If
			
			data.Put(ed.Tag,ed.Text)
			
		End If
		
	Next
	
	data.Put("email",su.DecodeUrl(data.Get("email"),"UTF8"))
	
	If spCity.SelectedIndex = -1 Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_city"),1.5,False)
		Return
	End If
	
	sUsername = data.Get("email")
	sPassword = data.Get("password")
	
	For k = 0 To listCity.Size - 1
		
		Dim m2 As Map
		m2 = listCity.Get(k)
		
		If m2.Get("name") = spCity.SelectedItem Then
			data.Put("zone_id",m2.Get("zone_id"))
			data.Put("country_id",m2.Get("country_id"))
			Exit
		End If
		
	Next
	
	Library.GuestLogin.Initialize
	
	If Guest = True Then
		Library.GuestLogin = data
	End If
	
	pnlloading.SetVisibleAnimated(500,True)
	
	data.Put("newsletter","0")
	If chknewsletter.Checked Then data.Put("newsletter","1")
	
	Dim fax As String
	fax = data.Get("fax")
	data.Put("fax",data.Get("telephone"))
	data.Put("telephone",fax)
	
	op1.register(Me,"register_receive",data,Guest)
	
End Sub

Sub register_receive(res As Map,cat As String)
	
	If res = Null Then Return
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.IsInitialized = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Return
	End If
	
	If res.ContainsKey("error") Then
		If res.Get("error") = "User already is logged" Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("already_login"),1.5,False)
			Return
			
		Else
			
			Dim rs1 As Map
			rs1 = res.Get("error")
			
			Dim err As String
			
			For i = 0 To rs1.Size - 1
				err = err & rs1.GetValueAt(i) & CRLF
			Next
			
			MyToastMessageShow.ShowToastMessageShow(err,2,True)
			
		End If
	
	Else If res.ContainsKey("success") Then
		
		Dim rs As String
		rs = res.Get("success")
		
		If rs = "true" Then
			
			ToastMessageShow(Library.GetStringResourse("register_success"),False)
			successRegister = True
			
			If Guest = False Then
				Guest = False
				actLogin.username = sUsername
				actLogin.password = sPassword
				Activity.Finish
				StartActivity(actLogin)
			Else
				Guest = False
				pnlloading.SetVisibleAnimated(500,True)
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
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Guest = False
			Library.GuestLogin.Put("login",True)
			Activity.Finish
			StartActivity(actDoOrder)
			Return
		End If
	End If
	
End Sub

Sub btnlogin_Click
	StartActivity(actLogin)
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		Activity.Finish
		Return True
	End If
	
End Sub

Sub txtdata_FocusChanged (HasFocus As Boolean)
	
	Dim ed As EditText
	ed = Sender
	sv1.ScrollPosition = ed.Top-67dip
	
End Sub