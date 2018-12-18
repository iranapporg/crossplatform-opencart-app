Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	'Dim txtcomment As TextField
	Private lsShips,lsPayment,lsAddressIDs As List
	Private lblship As Label
	Private lblpayment As Label
	Private btnpayment As Button
	Private pnlheader As Panel
	Private pnlloading As Panel
	Private lblpb As Label
	Private lbltitle As Label
	Private currentPaymentCode As String
	Private sv1 As ScrollView
	Private topSv As Int = 0
	Private svpreview As ScrollView
	Private btncontinue As Button
	Private pnlpreview As Panel
	Private lblname_product As Label
	Private lblprice_quantity As Label
	Private pnl_item_product As Panel
	Private order_id As String
	Dim MyToastMessageShow1 As MyToastMessageShow
	Private btnreturn As Button
	Private timerScroll As Timer
	Private btnclose As Button
	Dim pickerGetway As Picker
	Dim pickerShip As Picker
	Private lbladdr As Label
	Private lsaddr As CustomListView
	Private pnladdr As Panel
	Private lblcomment As Label
	Private txtcomment As TextField
	Private pnlinaddress As Panel
End Sub

Sub StartActivity
	
	Library.DoOrderPage.Initialize("")
	Library.DoOrderPage.RootPanel.LoadLayout("frmdoorder")
	MyToastMessageShow1.Initialize(Library.DoOrderPage.RootPanel)
	
	sv1.ContentWidth = Library.GetWidth
	
	lsaddr.Initialize(Me,"lsaddr",Library.GetWidth)
	pnlinaddress.AddView(lsaddr.AsView,0,0,pnlinaddress.Width,pnlinaddress.Height)
	
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	lbladdr.Font = Library.GetFont(12)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	
	lblcomment.Font = Library.getfont(12)
	lblcomment.Text = Library.GetStringResourse("order_comment")
	lblcomment.TextColor = Colors.Black
	Library.NavControl.ShowPage(Library.DoOrderPage)
	
	lbladdr.TextAlignment = lbladdr.ALIGNMENT_CENTER
	
	lbltitle.Text = Library.GetStringResourse("payment")
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	
	btncontinue.Text = Library.GetStringResourse("continues")
	btncontinue.CustomLabel.Font = Library.GetFont(btncontinue.CustomLabel.Font.Size)
	Library.GetButtonState(btncontinue)
	btncontinue.CustomLabel.TextColor = Colors.White
	lbladdr.Text	 = "  " & Library.GetStringResourse("choose_address") & "  "
	
	topSv = 0
	
	#Region Add Ship Label
	lblship.Initialize("")
	lblship.Font = Library.GetFont(14)
	lblship.TextAlignment = Library.GetStringResourse("direction_ios")
	lblship.Color = Library.Theme_Footer
	lblship.TextColor = Colors.White
	lblship.Text = " " & Library.GetStringResourse("ship_title") & " :"
	sv1.Panel.AddView(lblship,0,topSv,Library.GetWidth,40dip)
	topSv = topSv + 40dip
	
	pickerShip.Initialize("ship")
	sv1.Panel.AddView(pickerShip,10dip,60dip,Library.GetWidth-30dip,60dip)
	topSv = topSv + 60dip
	#End Region
	
	#Region Add Payment Label
	lblpayment.Initialize("")
	lblpayment.Font = Library.GetFont(14)
	lblpayment.TextAlignment = Library.GetStringResourse("direction_ios")
	lblpayment.Color = Library.Theme_Footer
	lblpayment.TextColor = Colors.White
	lblpayment.Text = " " & Library.GetStringResourse("payment_title") & " :"
	sv1.Panel.AddView(lblpayment,0,pickerShip.Height + pickerShip.Top,Library.GetWidth,40dip)
	topSv = topSv + 40dip
	
	pickerGetway.Initialize("payment")
	sv1.Panel.AddView(pickerGetway,10dip,topSv,Library.GetWidth-30dip,90dip)
	topSv = topSv + 90dip
	#End Region
	
	If Library.loginDetails.IsInitialized = False And Library.GuestLogin.IsInitialized Then
		LoadData
		Return
	End If
	
	If Library.loginDetails.Get("login") = True Then
		
		pnlloading.Visible = True
		
		Dim address_id As Int
		address_id = Library.loginDetails.Get("address_id")
		
		If Library.ChoosenAddress > 0 Then
			address_id = Library.ChoosenAddress
		End If
		
		Dim opAddress As OpenCart
		opAddress.Initialize
		opAddress.ListAddressUser(Me,"ListAddress_receive")
		
	Else
		If Library.GuestLogin.Get("login") = True Then
			LoadData
		Else
			Library.HUD.ToastMessageShow(Library.GetStringResourse("login_force"),False)
			Library.LastPage = Library.DoOrderPage
			actLogin.StartActivity
		End If
	End If
	
End Sub

Sub LoadData
	
	pnlloading.Visible = True
	
	Dim o As OpenCart
	o.Initialize
	o.GetShipMethods(Me,"ship_receive")
			
End Sub

Sub ListAddress_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			
			Dim d1 As Map
			d1 = res.Get("data")
			d1 = d1.Get("addresses")
			
			Dim lsAddressExist As List
			lsAddressExist.Initialize
			lsAddressIDs.Initialize
			
			For Each temp As Map In d1.Values
				lsAddressExist.Add($"${temp.Get("country")} ${temp.Get("city")} ${temp.Get("address_1")}"$)
				lsAddressIDs.Add(temp.Get("address_id"))
				lsaddr.AddTextItem($"${temp.Get("country")} ${temp.Get("city")} ${temp.Get("address_1")}"$,temp.Get("address_id"))
			Next
			
				'lsaddr.SetItems(0,lsAddressExist)
			
			pnladdr.BringToFront
			pnladdr.Visible = True
			
			Return
			
		End If
	End If
		
End Sub

Sub AddAddressShip_receive(res As Map,cat As String)
	 
End Sub

Sub AddAddress_receive(res As Map,cat As String)
			
	If res.ContainsKey("success") Then
		
		If res.Get("success") = 1 Then
		
			pnlloading.Visible = True
			LoadData
			
		Else
		
			If res.ContainsKey("error") Then
				
				If res.Get("error") = "User is not logged in" Then
					Library.LastPage = Library.DoOrderPage
					actLogin.StartActivity
					Return			
				Else If res.Get("error") Is Map Then
					Library.ShowErrors(res.Get("error"))
				Else If res.Get("error") = "Validate cart has products and has stock failed" Then
					Library.HUD.ToastMessageShow(Library.GetStringResourse("no_valid_cart"),True)
					Library.NavControl.ShowPage(Library.LastPage)
					Return
				End If
				
				Library.NavControl.ShowPage(Library.LastPage)
				
			Else
				MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
			End If
			
		End If
	
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	End If
	
End Sub

#Region Add Items radio button

Sub Getways_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			
			Dim methods As Map
			methods = res.Get("data")
			methods = methods.Get("payment_methods")
			lsPayment.Initialize
			
			Dim ls As List
			ls.Initialize
			
			ls.Add(Library.GetStringResourse("choose_one"))
			
			For Each vs As String In methods.Keys
				Dim temp As Map
				temp = methods.Get(vs)
				ls.Add(temp.Get("title"))
				lsPayment.Add(temp.Get("code"))
			Next
			
			pickerGetway.SetItems(0,ls)
			pickerGetway.SelectRow(0,0,True)
			
			btnpayment.InitializeCustom("btnpayment",Colors.White,Colors.Gray)
			btnpayment.Text = Library.GetStringResourse("preview_finish")
			btnpayment.CustomLabel.Font = Library.GetFont(14)
			
			btnpayment.Color = btncontinue.Color
			btnpayment.SetBorder(1,Colors.Gray,6)
			
			pickerGetway.Top = lblpayment.Top + lblpayment.Height
			sv1.Panel.AddView(btnpayment,btncontinue.Left,topSv,btncontinue.Width,40dip)
			
			btnpayment.Top = pickerGetway.Top + pickerGetway.Height + 40dip
			
			topSv = topSv + pickerGetway.Top
			sv1.ContentHeight = topSv
			
			lblpb.Text = Library.GetStringResourse("apply")
			
			Return
			
		End If
	End If
	
End Sub

Sub ship_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		
		If res.Get("success") = 1 Then
			
			Dim ref As Map
			Dim ships As Map
			
			ref = res.Get("data")
			ships = ref.Get("shipping_methods")
	 
			Dim l1 As List
			l1.Initialize
			
			lsShips.Initialize
			
			l1.Add(Library.GetStringResourse("choose_one"))
			
			For Each vs As String In ships.Keys
				Dim temp,temp1 As Map
				temp = ships.Get(vs)
				temp1 = temp.Get("quote")
				
				For Each p As String In temp1.Keys
					Dim pt As Map
					pt = temp1.Get(p)
					lsShips.Add(pt.Get("code"))
					l1.Add(pt.Get("title") & " " & pt.Get("text"))
				Next
				
			Next
			
			pickerShip.SetItems(0,l1)
			
			lblpayment.Top = topSv
			topSv = topSv + lblpayment.Height + 100dip
			
			pnlloading.Visible = True
			
			sv1.ContentHeight = topSv

			Dim payments As OpenCart
			payments.Initialize
			payments.GetPaymentMethods(Me,"Getways_receive")
	
		Else
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		End If
	
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	End If
	
End Sub

#End Region

Sub btnclose_Click

	If pnlpreview.Visible = True Then
		pnlpreview.Visible = False
		Return
	End If
		
	Library.NavControl.ShowPage(Library.LastPage)
	
End Sub

#Region Set Method

Sub setshipmethod_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("setting_saved"),1.5,True)
			Return
		End If
	End If
	
	MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	
End Sub

Sub setPaymentMethod_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("setting_saved"),1.5,True)
			Return
		End If
	End If
	
	MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	
End Sub

#End Region

Sub ship_ItemSelected (Column As Int, Row As Int)
	
	If Row = 0 Then Return
	
	pnlloading.Visible = True
	
	Dim opMethod As OpenCart
	opMethod.Initialize
	opMethod.SetShipMethods(Me,"setShipMethod_receive",lsShips.Get(Row-1),Library.GetStringResourse("inapp_buy") & CRLF & txtcomment.Text)
	
End Sub

Sub payment_ItemSelected (Column As Int, Row As Int)
	
	If Row = 0 Then Return
	
	pnlloading.Visible = True
	
	currentPaymentCode = lsPayment.Get(Row-1)
	
	Dim opShip As OpenCart
	opShip.Initialize
	opShip.SetPaymentMethods(Me,"setPaymentMethod_receive",lsPayment.Get(Row-1),Library.GetStringResourse("inapp_buy") & CRLF & txtcomment.Text)
	
End Sub

Sub btnpayment_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	pnlloading.Visible = True

	Dim opConfirm As OpenCart
	opConfirm.Initialize
	opConfirm.SaveOrder(Me,"ConfirmOrder_receive",False)
	
End Sub

Sub ConfirmOrder_receive(res As Map,cat As String)
	
	pnlloading.Visible = False

	If res.ContainsKey("error") Then
	
		Dim err As String
		err = res.Get("error")
		err = err.ToLowerCase
		
		If err.StartsWith("empty payment method") Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_payment_select"),1.5,False)
		Else If err.StartsWith("validate if shipping method has been set failed") Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_ships_select"),1.5,False)
		End If
		
		Return
		
	End If
	
	#Region Show Order preview
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			pnlpreview.Visible = True
			
			Dim l1 As List
			Dim temp As Map
			Dim top As Int
			
			l1.Initialize
			
			timerScroll.Initialize("tmrScroll",1300)
			
			svpreview.Panel.Height = 0
			svpreview.ScrollOffsetY = 0
			svpreview.Panel.RemoveAllViews
			
			temp = res.Get("data")
			order_id = temp.Get("order_id")
			
			top = 0
			l1 = temp.Get("products")
			
			For i = 0 To l1.Size - 1
				
				Dim temp1 As Map
				temp1 = l1.Get(i)

				Dim p1 As Panel
				p1.Initialize("")
				svpreview.Panel.AddView(p1,0,top,svpreview.Width,0)
				
				p1.LoadLayout("frmsimple_product")
				btnreturn.Enabled = False
				btnreturn.Text = ""
				Library.SetFont(btnreturn.CustomLabel,"icomoon",btnreturn.CustomLabel.Font.Size)
				btnreturn.CustomLabel.TextColor = Colors.Green
				p1.Height = pnl_item_product.Height
				
				top = top + p1.Height + 5dip
				
				lblname_product.Text = temp1.Get("name")
				lblname_product.Text = lblname_product.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
				lblprice_quantity.Text = temp1.Get("price") & " " & Library.GetStringResourse("cart_product_count") & " " & temp1.Get("quantity")
				lblname_product.TextAlignment = Library.GetStringResourse("direction_ios")
				lblprice_quantity.TextAlignment = Library.GetStringResourse("direction_ios")
				lblprice_quantity.Font = Library.GetFont(lblprice_quantity.Font.Size)
				lblprice_quantity.Font = Library.GetFont(lblprice_quantity.Font.Size)
				lblname_product.Font = Library.GetFont(lblprice_quantity.Font.Size)
				
				svpreview.Panel.Height = svpreview.Panel.Height + p1.Height
				
			Next
			
			top = top + 5dip
			
'			txtcomment.Initialize("txtcomment")
'			svpreview.Panel.AddView(txtcomment,7dip,top,svpreview.Width-16dip,100dip)
'			txtcomment.HintText = Library.GetStringResourse("order_comment")
'			txtcomment.TextAlignment = txtcomment.ALIGNMENT_CENTER
'			txtcomment.Font = Library.GetFont(12)
'			svpreview.Panel.Height = svpreview.Panel.Height + txtcomment.Height
			
			top = top + 100dip
			
			If temp.ContainsKey("totals") Then
				Dim l2 As List
				l2 = temp.Get("totals")
				
				For j = 0 To l2.Size - 1
					
					Dim tm As Map
					tm = l2.Get(j)
					
					Dim lbl1 As Label
					lbl1.Initialize("")
					lbl1.TextColor = Colors.Black
					lbl1.Font = Library.GetFont(14)
					lbl1.TextAlignment = Library.GetStringResourse("direction_ios")
					lbl1.Text = tm.Get("title") & " : " & tm.Get("text")

					svpreview.Panel.AddView(lbl1,10dip,top,svpreview.Width - 30dip,40dip)
					svpreview.Panel.Height = svpreview.Panel.Height + lbl1.Height
					
					top = top + lbl1.Height + 5dip
					
				Next
				
			End If
			
			svpreview.Panel.Height = svpreview.Panel.Height + 100
			top = svpreview.Panel.Height

			Dim v As WebView
			Dim html1 As Html
			html1.Initialize
			v.Initialize("")
			svpreview.Panel.AddView(v,10dip,top,svpreview.Width - 10dip,200dip)
			
			Dim style As String
			style = $"<body style="background-color:#F7F4F4;line-height:25px;font-family:tahoma;"$
			
			If Library.IsPersian Then
				style = style & $"direction:rtl">"$
			Else
				style = style & $"direction:ltr">"$
			End If
			
			Dim extra As String
			extra = temp.Get("payment")
			
			extra = extra.Replace("[]","").Replace("{}","")
			
			v.LoadHtml(style & html1.FromHtml(extra))
			
			svpreview.Panel.Height = svpreview.Panel.Height + 310dip

			'timerScroll.Enabled = True
			
			svpreview.ContentHeight = svpreview.Panel.Height
			svpreview.ContentWidth = Library.GetWidth
			
			Return
			
		End If
	End If
	
	#End Region
	
	MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	
End Sub

Sub tmrScroll_Tick
	
	If svpreview.ScrollOffsetY = 0 Then
		svpreview.ScrollTo(0,svpreview.ContentHeight,True)
	Else
		svpreview.ScrollTo(0,0,True)
		timerScroll.Enabled = False
	End If
	
End Sub

Sub SaveOrder_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		
		If res.Get("success") = 1 Then
			Msgbox(Library.GetStringResourse("success_payment"),Library.GetStringResourse("alert"))
			actAccount.ChoosenTab = "order"
			Library.LastPage = Library.MenuPage
			actAccount.StartActivity
			Return
		End If
		
	End If
	
	pnlloading.Visible = False
	Msgbox(Library.GetStringResourse("error_payment"),Library.GetStringResourse("alert"))
	
End Sub

Sub btncontinue_Click

	pnlpreview.Visible = False

	If currentPaymentCode = "cod" Or currentPaymentCode = "cheque" Or currentPaymentCode = "bank_transfer" Then
		Dim opConfirm As OpenCart
		opConfirm.Initialize
		opConfirm.SaveOrder(Me,"SaveOrder_receive",True)
	Else
		actPayment.Data = order_id
		actPayment.StartActivity
		Return
	End If
	
End Sub

Sub lsaddr_ItemSelected (Column As Int, Row As Int)
	
	pnlloading.BringToFront
	pnladdr.Visible = False
	pnlloading.Visible = True
	
	Dim opAddressPayment As OpenCart
	opAddressPayment.Initialize
	opAddressPayment.AddAddress(Me,"AddAddress_receive",CreateMap("payment_address":"existing","address_id":lsAddressIDs.Get(Row)),True)	
	
End Sub

Sub lsaddr_ItemClick (Index As Int, Value As Object)
	
	If txtcomment.Text.Length = 0 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("order_comment"),2,False)
		Return	
	End If
	
	pnlloading.BringToFront
	pnladdr.Visible = False
	pnlloading.Visible = True
	
	Dim opAddressPayment As OpenCart
	opAddressPayment.Initialize
	opAddressPayment.AddAddress(Me,"AddAddress_receive",CreateMap("payment_address":"existing","address_id":Value),True)	
	
End Sub