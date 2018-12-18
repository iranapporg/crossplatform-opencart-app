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

End Sub

Sub Globals
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
	Dim MyToastMessageShow As MyToastMessageShow
	Private btnreturn As Button
	Private timerScroll As Timer
	Private lbladdr As Label
	Private lsaddr As ListView
	Private pnladdr As Panel
	Private txtcomment As EditText
	Private lblcomment As Label
	Private btnnewaddress As Button
	Private CurrentAddressChooser As String
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	
	Activity.LoadLayout("frmdoorder")
	MyToastMessageShow.Initialize(Activity)
	
	Library.ChangeStatusColor
	
	lbltitle.Text = Library.GetStringResourse("payment")
	btnnewaddress.Text = Library.GetStringResourse("new_address")
	lblpb.Text = Library.GetStringResourse("loading")
	lblcomment.Text = Library.GetStringResourse("order_comment")
	lblcomment.Gravity = Library.GetStringResourse("direction")
	txtcomment.Gravity = Library.GetStringResourse("direction")
	txtcomment.Color = Colors.RGB(242, 242, 242)
	lbladdr.Gravity = Library.GetStringResourse("direction")
	pnlheader.Color = Library.Theme_Header
	
	btnpayment.Text = Library.GetStringResourse("preview_finish")
	btnpayment.Background = Library.GetButtonState
	
	If Library.loginDetails.IsInitialized Then
		If Library.loginDetails.Get("login") = True Then
			btnnewaddress.Visible = True
		End If
	End If
	
	lsaddr.SingleLineLayout.Label.TextColor = Colors.Black
	lsaddr.SingleLineLayout.Label.TextSize = 12
	lsaddr.SingleLineLayout.Label.Typeface = Library.GetFont
	lsaddr.SingleLineLayout.Label.Gravity = Library.GetStringResourse("direction")
	
	btncontinue.Text = Library.GetStringResourse("continues_order")
	lbladdr.Text	 = Library.GetStringResourse("choose_address")
	
	btncontinue.Background = Library.GetButtonState
	
	#Region Add Payment Label
	lblpayment.Initialize("")
	lblpayment.TextSize = 14
	lblpayment.Typeface =Library.GetFont
	lblpayment.Gravity = Library.GetStringResourse("direction")
	lblpayment.Color = Library.Theme_Footer
	lblpayment.TextColor = Colors.White
	lblpayment.Text = " " & Library.GetStringResourse("payment_title") & " :"
	sv1.Panel.AddView(lblpayment,0,topSv,sv1.Width,40dip)
	topSv = topSv + 40dip
	#End Region
	
	#Region Add Ship Label
	lblship.Initialize("")
	lblship.TextSize = 14
	lblship.Typeface = Library.GetFont
	lblship.Gravity = Library.GetStringResourse("direction")
	lblship.Color = Library.Theme_Footer
	lblship.TextColor = Colors.White
	lblship.Text = " " & Library.GetStringResourse("ship_title") & " :"
	sv1.Panel.AddView(lblship,0,topSv,sv1.Width,40dip)
	topSv = topSv + 40dip
	#End Region

	If Library.loginDetails.IsInitialized = False And Library.GuestLogin.IsInitialized Then
		LoadData
		Return
	End If
	
	If Library.loginDetails.Get("login") = True Then
		
		pnlloading.SetVisibleAnimated(500,True)
		
		Dim address_id As Int
		address_id = Library.loginDetails.Get("address_id")
		
		If Library.ChoosenAddress > 0 Then
			address_id = Library.ChoosenAddress
		End If
		
		Dim opAddress As OpenCart
		opAddress.Initialize
		opAddress.GetPaymentAddress(Me,"ListPaymentgAddress_receive")
		
	Else
		If Library.GuestLogin.Get("login") = True Then
			LoadData
		Else
			ToastMessageShow(Library.GetStringResourse("login_force"),False)
			Activity.Finish
			StartActivity(actLogin)
		End If
	End If
	
	#IF com_apps_skharid
	btnnewaddress.Visible = False
	#End If
	
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		
		If pnlpreview.Visible = True Then
			pnlpreview.SetVisibleAnimated(500,False)
			Return True
		End If
		
		Activity.Finish
		
		Return True
		
	End If
	
End Sub

Sub LoadData
	
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim payments As OpenCart
	payments.Initialize
	payments.GetPaymentMethods(Me,"Getways_receive")
			
End Sub

Sub ListAddressShip_receive(res As Map,cat As String)

End Sub

Sub ListPaymentgAddress_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			
			Dim d1 As Map
			Dim addr As List
			d1 = res.Get("data")
			addr = d1.Get("addresses")
			
			For i = 0 To addr.Size - 1
				
				Dim temp As Map
				temp = addr.Get(i)
				
				lsaddr.AddSingleLine2($"  ${temp.Get("country")} ${temp.Get("city")} ${temp.Get("address_1")}  "$,temp.Get("address_id"))
				
			Next
			
			pnladdr.BringToFront
			pnladdr.SetVisibleAnimated(700,True)
			
			Return
			
		End If
	End If
		
End Sub

Sub ListShippingAddress_receive(res As Map,cat As String)
	
	Dim opAddressShipping As OpenCart
	opAddressShipping.Initialize
	opAddressShipping.AddAddress(Me,"AddAddressShipping_receive",CreateMap("shipping_address":"existing","address_id":CurrentAddressChooser),False)
			
End Sub

Sub AddAddressShipping_receive(res As Map,cat As String)
	LoadData
End Sub

Sub AddPaymentAddress_receive(res As Map,cat As String)
			
	If res.ContainsKey("success") Then
		
		If res.Get("success") = True Then
		
			Dim opAddress As OpenCart
			opAddress.Initialize
			opAddress.GetShipAddress(Me,"ListShippingAddress_receive")
			
		Else
			If res.ContainsKey("error") Then
				If res.Get("error") = "User is not logged in" Then
					Activity.Finish
					StartActivity(actLogin)
					
				Else If res.Get("error") Is Map Then
					Library.ShowErrors(res.Get("error"))
					
				Else If res.Get("error") = "Validate cart has products and has stock failed" Then
					ToastMessageShow(Library.GetStringResourse("no_valid_cart"),True)
					Activity.Finish
					Return
				
				Else If res.Get("error") = "Your cart is empty or a product is out of stock" Then
					Msgbox(Library.GetStringResourse("no_stock_cart"),Library.GetStringResourse("alert"))
					Activity.Finish
					Return
					
				Else
					Msgbox(res.Get("error"),Library.GetStringResourse("alert"))
				End If
				
				Activity.Finish
				
			Else
				MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
			End If
			
		End If
	
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	End If
	
End Sub

Sub lsaddr_ItemClick (Position As Int, Value As Object)
	
'	If txtcomment.Text.Length = 0 Then
'		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("order_comment"),2,False)
'		Return	
'	End If
	
	pnlloading.BringToFront
	pnladdr.SetVisibleAnimated(500,False)
	pnlloading.SetVisibleAnimated(1,True)
	
	txtcomment.Text = txtcomment.Text & CRLF & Library.GetStringResourse("inapp_buy")
	
	CurrentAddressChooser = Value
	
	Dim opAddressPayment As OpenCart
	opAddressPayment.Initialize
	opAddressPayment.AddAddress(Me,"AddPaymentAddress_receive",CreateMap("payment_address":"existing","address_id":CurrentAddressChooser),True)
	
End Sub

#Region Add Items radio button

Sub Getways_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			
			Dim methods As Map
			methods = res.Get("data")
			methods = methods.Get("payment_methods")
			
			topSv = lblpayment.Height
			
			Dim pnlD As Panel
			pnlD.Initialize("")
			
			sv1.Panel.AddView(pnlD,0,topSv,sv1.Width,methods.Size * 40dip)
			
			Dim t As Int
	 		For i = 0 To methods.Size - 1
				Dim temp As Map
				temp = methods.Get(methods.GetKeyAt(i))
				Dim lblKey As RadioButton
				lblKey.Initialize("rbpayment")
				lblKey.Tag = temp.Get("code")
				lblKey.Text = "   " & temp.Get("title")
				pnlD.AddView(lblKey,sv1.Left+10dip,t,sv1.Width,40dip)
				ChangeRBStyle(lblKey)
				t = t + 40dip
				
			Next
			
			sv1.Panel.Height = sv1.Panel.Height + pnlD.Height
			
			topSv = pnlD.Height + pnlD.Top + 40dip
			
			lblship.Top = topSv - lblpayment.Height
			
			lblpb.Text = Library.GetStringResourse("apply")
			
			Dim payments As OpenCart
			payments.Initialize
			payments.GetShipMethods(Me,"ship_receive")
			
		End If
	End If
	
	pnlloading.SetVisibleAnimated(500,False)
	
End Sub

Sub ship_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		
		If res.Get("success") = True Then
		
			Dim ref As Map
			Dim ships As Map
			
			ref = res.Get("data")
			
'			If ref.ContainsKey("error_warning") Then
'				Dim ht As Html
'				Dim s As String
'				s = ref.Get("error_warning")
'				Msgbox(ht.FromHtml(s),Library.GetStringResourse("alert"))
'				Activity.Finish
'				Return
'			End If
			
			ships = ref.Get("shipping_methods")
	 		res = ships.GetValueAt(0)
			ships = res.Get("quote")
			
			Dim l1 As List
			l1.Initialize
			
	 		For i = 0 To ships.Size - 1
			
				Dim temp,temp1 As Map
				temp = ships.Get(ships.GetKeyAt(i))
				temp1 = temp
				
				Dim lblKey As RadioButton
				lblKey.Initialize("rbship")
				lblKey.Tag = temp1.Get("code")
				lblKey.Text = "   " & temp.Get("title")
				
				ChangeRBStyle(lblKey)
				
				sv1.Panel.AddView(lblKey,sv1.Left+10dip,topSv,sv1.Width,40dip)
				
				topSv = topSv + 40dip
				sv1.Panel.Height = sv1.Panel.Height + 40dip
				
			Next
			
			topSv = topSv + lblpayment.Height
			
			topSv = topSv + 40dip
			sv1.Panel.Height = sv1.Panel.Height + btnpayment.Height
	
		Else
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
			pnlloading.SetVisibleAnimated(500,False)
		End If
	
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		pnlloading.SetVisibleAnimated(500,False)
	End If
	
End Sub

Private Sub ChangeRBStyle(lblKey As RadioButton)
	
	lblKey.Gravity = Library.GetStringResourse("direction")
	lblKey.Typeface = Library.GetFont
	lblKey.TextSize = 14
	lblKey.TextColor = Colors.Black
	Library.ChangeRBStyle(lblKey)
	
End Sub

#End Region

Sub Activity_Resume
	
	Library.setLocalApp(Library.currLang)
	
	If Library.PaymentSuccess = True Then
		Library.PaymentSuccess = False
		Activity.Finish
	End If
	
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

#Region Set Method

Sub setShipMethod_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			
			Return
		End If
	End If
	
	MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	
End Sub

Sub setPaymentMethod_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Return
		End If
	End If
	
	MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	
End Sub

#End Region

Sub btnpayment_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	pnlloading.SetVisibleAnimated(500,True)

	Dim opConfirm As OpenCart
	opConfirm.Initialize
	opConfirm.SaveOrder(Me,"ConfirmOrder_receive",False)
	
End Sub

Sub ConfirmOrder_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)

	If res.ContainsKey("error") Then
	
		Dim err As String
		err = res.Get("error")
		err = err.ToLowerCase
		
		If err.StartsWith("empty payment method") Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_payment_select"),1.5,False)
		Else If err.StartsWith("validate if shipping method has been set failed") Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_ships_select"),1.5,False)
		End If
		
		Return
		
	End If
	
	#Region Show Order preview
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			pnlpreview.SetVisibleAnimated(500,True)
			
			Dim l1 As List
			Dim temp As Map
			Dim top As Int
			
			l1.Initialize
			
			timerScroll.Initialize("tmrScroll",1300)
			
			svpreview.Panel.Height = 0
			svpreview.ScrollPosition = 0
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
				btnreturn.TextColor = Colors.Green
				p1.Height = pnl_item_product.Height
				
				top = top + p1.Height + 5dip
				
				lblname_product.Text = temp1.Get("name")
				lblprice_quantity.Text = temp1.Get("price") & " " & Library.GetStringResourse("cart_product_count") & " " & temp1.Get("quantity")
				lblname_product.Gravity = Library.GetStringResourse("direction")
				lblprice_quantity.Gravity = Library.GetStringResourse("direction")
				lblprice_quantity.Typeface = Library.GetFont
				lblprice_quantity.Typeface = Library.GetFont
				
				svpreview.Panel.Height = svpreview.Panel.Height + p1.Height
				
			Next
			
			top = top + 5dip
			
			If temp.ContainsKey("totals") Then
				Dim l2 As List
				l2 = temp.Get("totals")
				
				For j = 0 To l2.Size - 1
					
					Dim tm As Map
					tm = l2.Get(j)
					
					Dim lbl1 As Label
					lbl1.Initialize("")
					lbl1.TextColor = Colors.Black
					lbl1.Typeface = Library.GetFont
					lbl1.TextSize = 14
					lbl1.Gravity = Library.GetStringResourse("direction")
					lbl1.Text = Library.BoldString(tm.Get("title") & " : {c}{b}" & tm.Get("text") & "{b}{c}")

					svpreview.Panel.AddView(lbl1,10dip,top,svpreview.Width - 30dip,50dip)
					svpreview.Panel.Height = svpreview.Panel.Height + lbl1.Height
					
					top = top + lbl1.Height + 5dip
					
				Next
				
			End If
			
			svpreview.Panel.Height = svpreview.Panel.Height + 100
			top = svpreview.Panel.Height

			Dim v As WebView
			Dim html1 As Html
			v.Initialize("")
			v.ZoomEnabled = False
			svpreview.Panel.AddView(v,10dip,top,svpreview.Width - 10dip,630dip)
			
			Dim style As String
			style = $"<body style="background-color:#F7F4F4;line-height:25px;font-family:tahoma;"$
			
			If Library.IsPersian Then
				style = style & $"direction:rtl">"$
			Else
				style = style & $"direction:ltr">"$
			End If
			
			Dim extra As String
			extra = temp.GetValueAt(temp.Size-1)
			
			If extra.StartsWith("[{") Then 
				extra = ""
			End If
			
			extra = extra.Replace("[]","").Replace("{}","")
			extra = extra.Replace("<br/>","{br}")
			extra = extra.Replace("<br />","{br}")
			extra = extra.Replace("<br>","{br}")
			extra = html1.FromHtml(extra)
			extra = extra.Replace("{br}","<br/>")
			
			v.LoadHtml(style & extra)
			
			svpreview.Panel.Height = svpreview.Panel.Height + v.Height

			timerScroll.Enabled = True
			
			Return
			
		End If
	End If
	
	#End Region
	
	MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
	
End Sub

Sub tmrScroll_Tick
	
'	If svpreview.ScrollPosition = 0 Then
'		svpreview.FullScroll(True)
'	Else
'		svpreview.FullScroll(False)
'		timerScroll.Enabled = False
'	End If
	
End Sub

Sub SaveOrder_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	pnlpreview.SetVisibleAnimated(500,True)
	
	If res = Null Then
		Msgbox(Library.GetStringResourse("error_payment"),Library.GetStringResourse("alert"))
		Return	
	End If
	
	If res.ContainsKey("success") Then
	
		
		If res.Get("success") = True Then
			
			Msgbox(Library.GetStringResourse("success_payment"),Library.GetStringResourse("alert"))
			
			If Library.GuestLogin.IsInitialized Then
				Dim m As Map
				Library.GuestLogin = m
				Activity.Finish
				Return
			End If
			
			Activity.Finish
			
			Return
			
		End If
		
	End If
	
	pnlloading.SetVisibleAnimated(500,False)
	Msgbox(Library.GetStringResourse("error_payment"),Library.GetStringResourse("alert"))
	
End Sub

Sub btncontinue_Click

	pnlpreview.SetVisibleAnimated(500,False)

	If currentPaymentCode = "cod" Or currentPaymentCode = "cheque" Or currentPaymentCode = "bank_transfer" Then
		pnlloading.SetVisibleAnimated(500,True)
		Dim opConfirm As OpenCart
		opConfirm.Initialize
		opConfirm.SaveOrder(Me,"SaveOrder_receive",True)
	Else
		actPayment.Data = order_id
		StartActivity(actPayment)
		Return
	End If
	
End Sub

Sub rbpayment_CheckedChange(Checked As Boolean)
	
	Dim b1 As RadioButton
	b1 = Sender
	
	pnlloading.SetVisibleAnimated(500,True)
	
	currentPaymentCode = b1.Tag
	
	Dim opMethod As OpenCart
	opMethod.Initialize
	opMethod.SetPaymentMethods(Me,"setPaymentMethod_receive",b1.Tag,Library.GetStringResourse("inapp_buy") & CRLF & txtcomment.Text)
	
End Sub

Sub rbship_CheckedChange(Checked As Boolean)
	
	Dim b1 As RadioButton
	b1 = Sender
	
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim opShip As OpenCart
	opShip.Initialize
	opShip.SetShipMethods(Me,"setShipMethod_receive",b1.Tag,Library.GetStringResourse("inapp_buy") & CRLF & txtcomment.Text)
	
End Sub

Sub btnnewaddress_Click
	
	Activity.Finish
	StartActivity(actAccount)
	
End Sub