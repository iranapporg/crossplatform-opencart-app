Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private di As DocumentInteraction
	Private pg As Page
	Public details As Map
	Public user_details As Map
	Private ShopInformation As Map
	Private lbltitle As Label
	Private pnlheader As Panel
	Private sv1 As ScrollView
	Private lblorder_payment_type_title As Label
	Private lblorderaddress1 As Label
	Private lblorderaddress2 As Label
	Private lblordercity1 As Label
	Private lblordercity2 As Label
	Private lblordercountry1 As Label
	Private lblordercountry2 As Label
	Private lblorderpayment_ship_type As Label
	Private lblorderpayment_type As Label
	Private lblorderphone As Label
	Private lblorderphone2 As Label
	Private lblorderpostal1 As Label
	Private lblorderpostal2 As Label
	Private lblorderreceiver_name1 As Label
	Private lblorderreceiver_name2 As Label
	Private lblordership_type As Label
	Private lblordershop_name As Label
	Private imgicon As ImageView
	Private pnl_item_product As Panel
	Private lblprice_quantity As Label
	Private lblname_product As Label
	Private lblproducts As Label
	Private top As Int
	Private btnreturn As Button
	Private pnlreturn As Panel
	Private lblcomment As Label
	Private lblopened As Label
	Private lblreason As Label
	Private rbyes As Switch
	Private spreason As Picker
	Private txtcomment As TextField
	Private btncancel As Button
	Private btncancelreturn As Button
	Private btnreturn_product As Button
	Private toast As MyToastMessageShow
	Private pnlloading As Panel
	Private lblpb As Label
	Private reason_id As List
	Private btnprint As Button
	Private btnclose As Button
End Sub

Sub StartActivity
	
	
	pg.Initialize("")
	
	pg.RootPanel.LoadLayout("frmorder_details_template")
	Library.NavControl.ShowPage(pg)
	sv1.ContentWidth = Library.GetWidth
	
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	Library.SetFont(btnprint,"icomoon",btnclose.CustomLabel.Font.Size)
	
	toast.Initialize(pg.RootPanel)
	reason_id.Initialize

	pnlheader.Color = Library.Theme_Header
	lbltitle.Text = Library.GetStringResourse("details_user")
	
	sv1.Panel.Left = 5
	sv1.Panel.Width = sv1.Panel.Width - 10
	sv1.Panel.Top = 5
	
	If Library.IsPersian = False Then
		sv1.Panel.LoadLayout("frmorder_details_en")
	Else
		sv1.Panel.LoadLayout("frmorder_details")
	End If
	
	GetReturnReason2Spinner
	
	#region localize app
	lblordershop_name.Text = " " & Library.GetStringResourse("lblordershop_name").Replace("0",details.Get("store_name"))
	lblordershop_name.TextAlignment = Library.GetStringResourse("direction_ios")
	lblorderpayment_ship_type.Text = " " & Library.GetStringResourse("lblorder_payment_type_title")
	lblorderreceiver_name1.Text = " " & Library.GetStringResourse("lblorderreceiver_name").Replace("0",details.Get("payment_firstname") & " " & details.Get("payment_lastname"))
	lblordercountry1.Text = " " & Library.GetStringResourse("lblordercountry").Replace("0",details.Get("payment_country"))
	lblordercity1.Text = " " & Library.GetStringResourse("lblordercity").Replace("0",details.Get("payment_city"))
	lblorderaddress1.Text = " " & Library.GetStringResourse("lblorderaddress").Replace("0",details.Get("payment_address_1"))
	lblorderpostal1.Text = " " & Library.GetStringResourse("lblorderpostal").Replace("0",details.Get("payment_postcode"))
	lblorderphone.Text = " " & Library.GetStringResourse("lblorderphone").Replace("0",details.Get("telephone"))
	lblorderpayment_type.Text = " " & details.Get("payment_method")
	
	lblorder_payment_type_title.Text = " " & Library.GetStringResourse("lblordership_type_title")
	lblorderreceiver_name2.Text = " " & Library.GetStringResourse("lblorderreceiver_name").Replace("0",details.Get("shipping_firstname") & " " & details.Get("shipping_lastname"))
	lblordercountry2.Text = " " & Library.GetStringResourse("lblordercountry").Replace("0",details.Get("shipping_country"))
	lblordercity2.Text = " " & Library.GetStringResourse("lblordercity").Replace("0",details.Get("shipping_city"))
	lblorderaddress2.Text = " " & Library.GetStringResourse("lblorderaddress").Replace("0",details.Get("shipping_address_1"))
	lblorderpostal2.Text = " " & Library.GetStringResourse("lblorderpostal").Replace("0",details.Get("shipping_postcode"))
	lblorderphone2.Text = " " & Library.GetStringResourse("lblorderphone").Replace("0",details.Get("telephone"))
	lblordership_type.Text = " " & details.Get("shipping_method")
	
	lblopened.Text =  " " & Library.GetStringResourse("return_opened")
	lblopened.TextAlignment  = Library.GetStringResourse("direction_ios")
	lblcomment.TextAlignment  = Library.GetStringResourse("direction_ios")
	lblreason.TextAlignment  = Library.GetStringResourse("direction_ios")
	txtcomment.TextAlignment  = Library.GetStringResourse("direction_ios")
	txtcomment.TextAlignment  = Library.GetStringResourse("direction_ios")
	txtcomment.Color = Colors.ARGB(60,250,250,250)
	
	lblcomment.Text =  " " & Library.GetStringResourse("return_comment")
	lblreason.Text =  " " & Library.GetStringResourse("return_reason")
'	rbyes.Text = Library.GetStringResourse("return_opened_yes")
'	rbno.Text = Library.GetStringResourse("return_opened_no")
	btnreturn_product.Text =  " " & Library.GetStringResourse("return_button")
	btncancelreturn.Text =  " " & Library.GetStringResourse("cancel")
	Library.GetButtonState(btnreturn_product)
	Library.GetButtonState(btncancelreturn)
	#end region
	
	sv1.Panel.Height = lblproducts.Height + lblproducts.top
	
	For Each v1 As View In sv1.Panel.GetAllViewsRecursive
		If v1 Is Label Then
			Dim lb1 As Label
			lb1 = v1
			Library.PaddingLabel(lb1,10,0,10,0)
		End If
	Next
	
	Dim l1 As List
	
	l1.Initialize
	top = sv1.Panel.Height + 10
	l1 = details.Get("products")
	
	For i = 0 To l1.Size - 1
		
		Dim temp As Map
		temp = l1.Get(i)

		Dim p1 As Panel
		p1.Initialize("")
		sv1.Panel.AddView(p1,0,top,sv1.Width,0)
		
		p1.LoadLayout("frmsimple_product")
		
		p1.Height = pnl_item_product.Height
		
		top = top + p1.Height + 5dip
		
		lblname_product.Text = temp.Get("name")
		Dim price As String
		price = temp.Get("price")
		
		lblname_product.TextAlignment = lblordershop_name.TextAlignment
		lblprice_quantity.TextAlignment = lblordershop_name.TextAlignment
		btnreturn_product.Tag = temp
		Library.SetFont(btnreturn,"icomoon",btnreturn.CustomLabel.Font.Size)
		
		lblname_product.Font = Library.GetFont(lblname_product.Font.Size)
		lblprice_quantity.Font = Library.GetFont(lblprice_quantity.Font.Size)
		
		lblprice_quantity.Text = price & " [" & temp.Get("quantity") & "]"
		
		sv1.Panel.Height = sv1.Panel.Height + p1.Height
		
	Next
	
	sv1.Panel.Height = sv1.Panel.Height + p1.Height
	
	lblproducts.Text = Library.GetStringResourse("basket_total") & " " & details.Get("total")
	
	If details.ContainsKey("histories") Then
		LoadAttribute(details.Get("histories"))
	End If
	
	sv1.ContentHeight = top+30dip
	
End Sub

Sub LoadAttribute(attr As List)
	
	If attr.IsInitialized = False Then Return
	If attr.Size = 0 Then Return
	
	Dim lblHeader As Label
	lblHeader.Initialize("")
	lblHeader.Color = Library.Theme_Background
	lblHeader.Font = Library.GetFont(14)
	lblHeader.TextColor = Colors.Gray
	lblHeader.Text = Library.GetStringResourse("attribute")
	lblHeader.TextAlignment = Library.GetStringResourse("direction_ios")
	Library.PaddingLabel(lblHeader,10,0,10,0)
	sv1.Panel.AddView(lblHeader,sv1.Left,top,sv1.Width,40dip)
	top = top + 40dip
	sv1.Panel.Height = sv1.Panel.Height + 40dip
		
	For i = 0 To attr.Size - 1
		
		Dim temp As Map
		temp = attr.Get(i)
		
		Dim lblKey As Label
		lblKey.Initialize("")
		lblKey.Color = Library.Theme_Header
		lblKey.Font = Library.GetFont(14)
		lblKey.TextColor = Colors.White
		
		Dim date As String
		If Library.IsPersian Then
			date = Library.GetDate(temp.Get("date_added"))
		Else
			date = temp.Get("date_added")
		End If
		
		lblKey.Text = temp.Get("status") & " => " & date
		lblKey.TextAlignment = Library.GetStringResourse("direction_ios")
		Library.PaddingLabel(lblKey,10,0,10,0)
		
		sv1.Panel.AddView(lblKey,0,top,sv1.Width,40dip)
		top = top + 40dip
		sv1.Panel.Height = sv1.Panel.Height + 40dip
		
		Dim lblVal As Label
		lblVal.Initialize("")
		lblVal.Color = Colors.White
		lblVal.Font = Library.GetFont(12)
		lblVal.TextColor = Colors.Black
		lblVal.Text = temp.Get("comment")
		lblVal.TextAlignment = Library.GetStringResourse("direction_ios")
		Library.PaddingLabel(lblVal,10,0,10,0)
		
		sv1.Panel.AddView(lblVal,sv1.Left,top,sv1.Width,90dip)
		top = top + 90dip
		sv1.Panel.Height = sv1.Panel.Height + 90dip
		
	Next
	
End Sub

Sub GetReturnReason2Spinner
	
	Dim ls,ls2 As List
	Dim temp As String
	temp = File.ReadString(CacheData.DirCache,"return_reasons")
	ls = Library.String2List(temp)
	
	ls2.Initialize
	
	If ls.IsInitialized Then
		For i = 0 To ls.Size - 1
			Dim m2 As Map
			m2 = ls.Get(i)
			ls2.Add(m2.Get("name"))
			reason_id.Add(m2.Get("return_reason_id"))
		Next
	End If
	
	spreason.SetItems(0,ls2)
	
End Sub

Sub btnprint_Click
	
	lblpb.Text = Library.GetStringResourse("apply")
	pnlloading.Visible = True
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.GetStore(Me,"StoreDetails_receive","0")
		
End Sub

Sub Print
	
	Dim l As List
	l.Initialize
	
	Dim js As JSONGenerator
	
	Dim products As List
	products = details.Get("products")
	
	For i = 0 To products.Size - 1
		Dim pr As Map
		pr = products.Get(i)
		l.Add(CreateMap("title":pr.Get("name"),"price":pr.Get("price"),"quantity":pr.Get("quantity"),"total":pr.Get("total")))	
	Next
	
	js.Initialize2(l)
	
	Dim data As Map
	data.Initialize
	data.Put("invoice","1")
	data.Put("product",l)
	
	If Library.IsPersian Then
		data.Put("date",Library.GetDate(details.Get("date_added")))
	Else
		data.Put("date",details.Get("date_added"))
	End If
	
	data.Put("id",details.Get("order_id"))
	data.Put("seller",$"${ShopInformation.Get("store_address")} - ${ShopInformation.Get("store_name")} - ${ShopInformation.Get("store_telephone")})"$)
	data.Put("client_name",details.Get("firstname") & " " & details.Get("lastname"))
	data.Put("client_phone",details.Get("telephone"))
	data.Put("client_email",details.Get("email"))
	data.Put("client_site","-")
	
	Dim addr As String
	addr = details.Get("shipping_address")
	
	If addr.Length = 0 Then
		addr = details.Get("payment_address")
	End If
	
	data.Put("client_address",addr)
	data.Put("client_comment",details.Get("comment"))
	data.Put("shop_site",Library.GetStringResourse("url"))
	data.Put("payment",details.Get("payment_method"))
	data.Put("ship",details.Get("shipping_method"))
	
	If Library.IsPersian Then
		data.Put("lang","fa")
	Else
		data.Put("lang","en")
	End If
	
	For Each vs As String In data.Keys
		Dim tem As String
		tem = data.Get(vs)
		If tem.Length = 0 Then data.Put(vs,"-")	
	Next
	
	js.Initialize(data)
	
	Dim h As HttpJob
	h.Initialize("print",Me)
	h.PostString(Library.GetStringResourse("url") & "/app/invoice/invoice.php","data=" & js.ToString)
		
End Sub

Sub JobDone(Job As HttpJob)
	
	pnlloading.Visible = False
	
	If Job.Success = False Then 
		Return		
	End If
	
	Try
		
		Dim filename As String
		filename = $"order_${details.Get("order_id")}.pdf"$
		
		File.Delete(File.DirDocuments,filename)
		Dim ou As OutputStream
		ou = File.OpenOutput(File.DirDocuments,filename,False)
		File.Copy2(Job.GetInputStream,ou)
		ou.Close
		
		 di.Initialize("",File.DirDocuments,filename)
		 di.OpenFile(pg.RootPanel)
		 
	Catch
	End Try
	
End Sub

Sub StoreDetails_receive(res As Map,cat As String)
	
	ShopInformation = res.Get("data")
	Print
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.LastPage)
End Sub

Sub btnreturn_Click
	txtcomment.Text = ""
	pnlreturn.Visible = True
End Sub

Sub btncancelreturn_Click
	pnlreturn.Visible = False
End Sub

Sub btnreturn_product_Click
	
	Dim temp As Button
	temp = Sender
	
	Dim product As Map
	product = temp.Tag
	
	lblpb.Text = Library.GetStringResourse("apply")
	pnlloading.Visible = True
	
	If rbyes.Value = True Then
		user_details.Put("opened","1")
	Else
		user_details.Put("opened","0")
	End If
	
	user_details.Put("return_reason_id",reason_id.Get(spreason.GetSelectedRow(0)))
	user_details.Put("comment",txtcomment.Text)
	user_details.Put("product",product.Get("name"))
	user_details.Put("model",product.Get("model"))
	user_details.Put("quantity",product.Get("quantity"))
	
	Dim opReturn As OpenCart
	opReturn.Initialize
	opReturn.RequestReturn(Me,"return_receive",user_details)
	
End Sub

Sub return_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.IsInitialized Then
		If res.ContainsKey("success") Then
			If res.Get("success") = True Then
				pnlreturn.Visible = False
				toast.ShowToastMessageShow(Library.GetStringResourse("return_success"),2,True)
			End If
		End If
	End If
	
End Sub