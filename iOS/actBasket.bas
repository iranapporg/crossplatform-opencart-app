Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private pnlheader As Panel
	Private lbltitle As Label
	Private lblpb As Label
	Private pnlloading As Panel
	Private btnpayment As Button
	Private btnclear As Button
	Private lbltotal As Label
	Private lblsabadtitle As Label
	Private op1 As OpenCart
	Private txtcartcount As TextField
	Private lblcprice As Label
	Private lblctitle As Label
	Private imgicon As ImageView
	Private pnlitemcart As Panel
	Private sv1 As ScrollView
	Private Top As Int = 0
	Private lblcount As Label
	Private btncoupon As Button
	Private lblremove_product As Label
	Private txtcoupon_id As TextField
	Private txtvoucher_id As TextField
	Private btnvoucher As Button
	Private BiggerSV,DoAnimateSV As Boolean
	Private DefaultTopSV,DefaultHeightSV As Int
	Private MyToastMessageShow1 As MyToastMessageShow
	Private timerAnimation As Timer

	Private btnclose As Button
	Private txtcount_pk As Picker
	Private pnlcount As Panel
	
	Private currentKey As String
	
	Private btnclose_me As Button
End Sub

Sub StartActivity
	
	Library.pageBasket.Initialize("pageBasket")
	
	Library.pageBasket.RootPanel.LoadLayout("frmbasket")
	Library.NavControl.ShowPage(Library.pageBasket)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	Library.SetFont(btnclose_me,"icomoon",btnclose_me.CustomLabel.Font.Size)
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	
	Dim lsitem As List
	lsitem.Initialize
	
	For P = 1 To 100
		lsitem.Add(P)
	Next
	
	txtcount_pk.SetItems(0,lsitem)
	txtcount_pk.SelectRow(0,6,True)
	
	btnpayment.Top = Library.GetHeight-btnpayment.Height - 20dip
	
	btnclear.CustomLabel.Font = Library.GetFont(btnclear.CustomLabel.Font.Size)
	btncoupon.CustomLabel.Font = Library.GetFont(btncoupon.CustomLabel.Font.Size)
	btnvoucher.CustomLabel.Font = Library.GetFont(btnvoucher.CustomLabel.Font.Size)
	btnpayment.CustomLabel.Font = Library.GetFont(btnpayment.CustomLabel.Font.Size)
	
	MyToastMessageShow1.Initialize(Library.pageBasket.RootPanel)
	
	lbltitle.Text = Library.GetStringResourse("basket_title")
	lblpb.Text = Library.GetStringResourse("loading")
	btnclear.Text = Library.GetStringResourse("btnclear")
	btnpayment.Text = Library.GetStringResourse("btnpayment")
	lblsabadtitle.Text = Library.GetStringResourse("basket_total")
	lbltotal.Text = "0"
	
	btncoupon.Text = Library.GetStringResourse("new_coupon")
	txtcoupon_id.HintText = Library.GetStringResourse("enter_coupon")
	txtvoucher_id.HintText = Library.GetStringResourse("enter_voucher")
	btnvoucher.Text = Library.GetStringResourse("new_voucher")
	
	'btnpayment.Background = Library.GetButtonState

	btnpayment.Color =Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	btnclear.Color = Colors.Transparent
	
	pnlheader.Color = Library.Theme_Header
	op1.Initialize
	
	sv1.Color = Colors.RGB(247, 244, 244)
	sv1.Panel.Color = Colors.RGB(247, 244, 244)

	DefaultHeightSV = sv1.Height
	DefaultTopSV = sv1.Top
	
	timerAnimation.Initialize("tmrAnimation",1000)
	
	If Library.IsEnglish Then
		lbltotal.Font = Library.GetFont(lbltotal.Font.Size)
		lblsabadtitle.Left = lbltotal.Left
		lbltotal.Left = lblsabadtitle.Left + lblsabadtitle.Width
		lbltotal.TextAlignment = lbltotal.ALIGNMENT_LEFT
		lblsabadtitle.TextAlignment = lbltotal.ALIGNMENT_LEFT
	End If
	
	GetCart
	
End Sub

Sub btnclose_Click
	
	If Library.pageBasket = Library.LastPage Then Library.LastPage = Library.MenuPage
	Library.NavControl.ShowPage(Library.LastPage)
	
End Sub

Sub btnpayment_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	If Library.loginDetails.IsInitialized Then
		If Library.loginDetails.Get("login") = True Then
			If DateTime.Now - Library.loginDetails.Get("expire")  > 1010020 Then
				Library.LastPage = Library.pageBasket
				actLogin.StartActivity
				Return
			End If
			Library.LastPage = Library.pageBasket
			actDoOrder.StartActivity
			Return
		End If
	End If
	
	If Library.GuestLogin.IsInitialized Then
		If Library.GuestLogin.Get("login") = True Then
			Library.LastPage = Library.pageBasket
			actDoOrder.StartActivity
			Return
		End If
	End If
	
	Library.LastPage = Library.pageBasket
	actLogin.StartActivity
	
End Sub

Sub btnclear_Click
	op1.ClearCart(Me,"ClearCart_receive")
End Sub

Sub ClearCart_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		
		Dim r1 As String
		r1 = res.Get("success")
		
		If r1.ToLowerCase = 1 Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("cleared"),False)
			Library.NavControl.ShowPage(Library.LastPage)
			Return
		Else
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		End If
	
	End If
	
End Sub

Sub GetCart
	pnlloading.Visible = True
	sv1.Panel.RemoveAllViews
	sv1.Panel.Height = 0
	Top = 0
	op1.GetCarts(Me,"Carts_receive")
End Sub

Sub Carts_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res = Null Then
		Library.HUD.ToastMessageShow(Library.GetStringResourse("no_cart"),False)
		Library.NavControl.ShowPage(Library.LastPage)
		Return
	End If
	
	If res.IsInitialized = False Then
		Library.HUD.ToastMessageShow(Library.GetStringResourse("no_cart"),False)
		Library.NavControl.ShowPage(Library.LastPage)
		Return
	End If

	Library.CartDetails = res
	lbltitle.Text = Library.GetStringResourse("basket_title") & " [0]".Replace("0",op1.GetCartCount)
	
	Dim total As Map
	total = op1.GetCartTotal(res.Get("totals"))
	lbltotal.Text = total.Get("total")
	
	Dim images As Map
	images.Initialize
	
	If res.ContainsKey("products") Then
		
		Dim l1 As List
		l1.Initialize
		l1 = res.Get("products")
		
		Dim images As Map
		images.Initialize
		
		Dim html1 As Html
		
		sv1.ContentWidth = Library.GetWidth
		
		For i = 0 To l1.Size - 1
			
			Dim temp As Map
			temp = l1.Get(i)

			Dim p1 As Panel
			p1.Initialize("")
			sv1.Panel.AddView(p1,0,Top,sv1.Width,0)
			
			If Library.IsPersian Then
				p1.LoadLayout("frmtemplate_car")
			Else
				p1.LoadLayout("frmtemplate_car_en")
			End If
			
			lblcprice.Font = Library.GetFont(lblcprice.Font.Size)
			Library.SetFont(lblremove_product,"icomoon",lblremove_product.Font.Size)
			
			p1.Height = pnlitemcart.Height + 10dip
			
			lblcount.Text = Library.GetStringResourse("cart_product_count")
			
			Dim qu As Int
			qu = temp.Get("quantity")
			
			Dim ls As List
			ls.Initialize
			
			For j = 1 To 80
				ls.Add(j)
			Next
			
'			txtcartcount.SetItems(0,ls)
			
			txtcartcount.Tag = temp.Get("key")
			txtcartcount.Text = qu
			lblremove_product.Tag = temp.Get("key")
			
			lblctitle.Text = " " & temp.Get("name") & " "
			lblctitle.Text = lblctitle.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
			lblctitle.TextAlignment = Library.GetStringResourse("direction_ios")
			lblcprice.TextAlignment = Library.GetStringResourse("direction_ios")
			lblcprice.Text = temp.Get("price")

			images.Put(imgicon,temp.Get("thumb"))
			
			Dim options As List
			options = temp.Get("option")
			
			Dim topOption As Int
			topOption = pnlitemcart.Height
			
			If options.IsInitialized Then
				For k = 0 To options.Size - 1
					Dim te As Map
					te = options.Get(k)
					Dim lblKey As Label
					lblKey.Initialize("")
					lblKey.Color = Colors.White
					lblKey.Font = Library.GetFont(14)
					lblKey.TextColor = Colors.Black
					Library.UnderLine(te.Get("name") & " : " & te.Get("value"),lblKey)
					lblKey.TextAlignment = Library.GetStringResourse("direction_ios")
					Library.PaddingLabel(lblKey,10,0,10,0)
					pnlitemcart.AddView(lblKey,18,topOption,pnlitemcart.Width-20,40dip)
					pnlitemcart.Height = pnlitemcart.Height + 42dip
					topOption = topOption + 35dip
					p1.Height = pnlitemcart.Height
					
				Next
				topOption = pnlitemcart.Height
			End If
			
			Top = Top + p1.Height + 1dip
			
		Next
		
		Dim down As ImageDownloader
		down.Initialize
		down.Download(images)
		
		sv1.Panel.Height = Top
		sv1.ContentHeight = Top + 60dip
		
		If l1.Size < 4 Then
			sv1.ContentHeight = Top + 360dip
		End If
		
	End If
	
End Sub

Sub lblremove_product_Click
	
	Dim p1 As Label
	p1 = Sender
	
	Dim product As String
	product = p1.Tag
	
	'If Msgbox2(Library.GetStringResourse("question_delete_cart"),Library.GetStringResourse("alert"),Library.GetStringResourse("yes"),Library.GetStringResourse("no"),"",Null) = DialogResponse.POSITIVE Then
		pnlloading.Visible = True
		op1.UpdateProductCart(Me,"UpdateProduct_receive",product,"0")
	'End If
	
End Sub

Sub DeleteItem_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		Dim re As String
		re = res.Get("success")
		
		If re.ToLowerCase = "false" Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Else
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("deleted_item"),1.5,True)
		End If
		
	End If
	
End Sub

Sub txtcartcount_ItemSelected (Column As Int, Row As Int)
	
	Dim sp As Picker
	sp = Sender
	
	Dim id As String
	id = sp.Tag
	
	pnlloading.Visible = True
	op1.UpdateProductCart(Me,"UpdateProduct_receive",id,txtcartcount.Text)
	
End Sub

Sub UpdateProduct_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		Dim re As String
		re = res.Get("success")
		
		If re.ToLowerCase = "false" Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Else
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("update_count_item"),1.5,True)
			GetCart
			sv1.ScrollTo(0,0,True)
		End If
		
	End If
	
End Sub

Sub btncoupon_Click
	
	If IsNumber(txtcoupon_id.Text) Then
		Dim coupon As OpenCart
		coupon.Initialize
		lblpb.Text = Library.GetStringResourse("apply")
		pnlloading.Visible = True
		coupon.AddCoupon(Me,"addcoupon_receive",txtcoupon_id.Text)
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("enter_coupon"),1.5,False)
	End If
	
End Sub

Sub addcoupon_receive(state As Boolean)
	
	pnlloading.Visible = False
	
	txtcoupon_id.Text = ""
	
	If state = True Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("add_coupon"),1.5,True)
		GetCart
		Return
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_coupon"),1.5,False)
	End If
	
End Sub

Sub btnvoucher_Click

	If IsNumber(txtvoucher_id.Text) Then
		Dim coupon As OpenCart
		coupon.Initialize
		lblpb.Text = Library.GetStringResourse("apply")
		pnlloading.Visible = True
		coupon.AddVoucher(Me,"addvoucher_receive",txtvoucher_id.Text)
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("enter_voucher"),1.5,False)
	End If
	
End Sub

Sub addvoucher_receive(state As Boolean)
	
	pnlloading.Visible = False
	
	txtvoucher_id.Text = ""
	
	If state = True Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("add_voucher"),1.5,True)
		GetCart
		Return
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_voucher"),1.5,False)
	End If
	
End Sub

Sub sv1_ScrollChanged(OffsetX As Int, OffsetY As Int)
	
	If timerAnimation.Enabled = True Then Return
	
 	If OffsetY < 1 And DoAnimateSV = True Then
		DoAnimateSV = False
		Return
	End If
	
	If OffsetY > 0 And BiggerSV = False Then
		sv1.SetLayoutAnimated(400,1,0,lbltotal.Top + lbltotal.Height+ lbltotal.Height + 19dip,sv1.Width,Library.GetHeight - lbltotal.Height - pnlheader.Height - btnclear.Height- btnclear.Height)
		timerAnimation.Enabled = True
		DoAnimateSV = True
		BiggerSV = True
		sv1.ScrollTo(0,0,True)
		
	Else If OffsetY < 1 Then
		
		If BiggerSV = True Then
			sv1.SetLayoutAnimated(400,1,0,DefaultTopSV,sv1.Width,DefaultHeightSV)
			timerAnimation.Enabled = True
		End If
		
		BiggerSV = False

	End If
	
End Sub

Sub tmrAnimation_Tick
		timerAnimation.Enabled = False
End Sub

Sub txtcartcount_BeginEdit

	Dim sp As TextField
	sp = Sender
	
	Library.pageBasket.ResignFocus
	pnlcount.SetLayoutAnimated(600,1,0,Library.GetHeight-pnlcount.Height,pnlcount.Width,pnlcount.Height)
	currentKey = sp.Tag
	
End Sub

Sub pageBasket_KeyboardStateChanged (Height As Float)
	
'	If Height > 0 Then
'   		sv1.ScrollTo(0, sv1.ScrollOffsetY + Height, True)
'	End If

End Sub

Sub txtcount_pk_ItemSelected (Column As Int, Row As Int)
	
	pnlloading.Visible = True
	op1.UpdateProductCart(Me,"UpdateProduct_receive",currentKey,txtcount_pk.GetSelectedItem(0))
	pnlcount.SetLayoutAnimated(600,1,0,Library.GetHeight+pnlcount.Height,pnlcount.Width,pnlcount.Height)
	
End Sub

Sub btnclose_me_Click
	pnlcount.SetLayoutAnimated(600,1,0,Library.GetHeight+pnlcount.Height,pnlcount.Width,pnlcount.Height)
	sv1.ScrollTo(0,0,True)
End Sub