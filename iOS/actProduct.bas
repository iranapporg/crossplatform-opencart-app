Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	
	Private tmrCicle As Timer
	Private IsDateTime As Boolean
	Public product As Map
	Private timerSlideshow As Timer
	Public IsOpenProduct As Boolean
	
	Private btnqr As Button
	Dim progress As Panel
	Private bullet As List
	Private lbltitle As Label
	Private lblprice As Label
	Private lbls1 As Label
	Private lbls2 As Label
	Private lbls3 As Label
	Private lbls4 As Label
	Private lbls5 As Label
	Private lblstate As Label
	Private lblproducer As Label
	Private lbldate As Label
	Private lblmodel As Label
	Private lblvisit As Label
	Private btnreview As Button
	Private pnl2 As Panel
	Private pnl1 As Panel
	Dim listSlideshow As List
	Dim offsetSlideshow As Int
	Private lblratetitle As Label
	Private lblstatetitle As Label
	Private lblproducertitle As Label
	Private lbldatetitle As Label
	Private lblmodeltitle As Label
	Private lblvisitcount As Label
	Dim sv1 As ScrollView
	Private lbldivider2 As Label
	Private lbldescription As WebView
	Dim details As OpenCart
	Private btnbookmark As Button
	Private lblbasket As Label
	Private lblauthor As Label
	Private lbldate_comment As Label
	Private lblcomment_review As Label
	Private pnlitem_comment As Panel
	Private lblcommentstar1 As Label
	Private lblcommentstar2 As Label
	Private lblcommentstar3 As Label
	Private lblcommentstar4 As Label
	Private lblcommentstar5 As Label
	Private btnreviews As Button
	Private topReview,topOptions,topAttr As Int
	Private lblnumber As Label
	Private pnloverheader As Panel
	Private lblheadername As Label
	Private pnlheadert As Panel
	Dim top As Int
	Private pnlheaderproduct As Panel
	Private pnlads As Panel
	Private ListOptions As List
	Private lblattr As Label
	Private lbloptions As Label
	Private slidemenu1 As SlideMenu
	Private lbladd2cart As Label
	Private pnlheader As Panel
	Private listBanner As List
	Private imgspecial As ImageView
	Private txtfocus As TextField
	Private MyToastMessageShow1 As MyToastMessageShow
	Private FixPanelHeader As Boolean
	Dim pnlReviews,pnlAttribute,pnlBasket,pnlOptions As Panel
	Private svReviews,svAttribute,svOptions As ScrollView
	Private btnattributes As Button
	Dim lblfloat_basket As Label
	Private TipTag,titleHelp As String
	Private btnshare As Button
	Private btnbasket As Button
	
	Private btnsearch As Button
	Private btnback As Button
	Private pnlcircle As Panel
	Private lblpre_price As Label
	Private pnltimer As Panel
	Private lblnum1 As Label
	Private lblnum2 As Label
	Private lblnum3 As Label
	Private pnlprice As Panel
	
	Private timerSpecial As Timer
	Dim SpecialDateInformation As Period
	Private CurrentTimerSpecialWidth As Int
	
	Private lblline2 As Label
	Private lblline1 As Label
	Private lblwonderfull As Label
	Private lblnum4 As Label
	Private pnllistnumb As Panel
	Private pnlQR As Panel
	Dim slidepanel1 As ScrollView
	Private lblnext As Label
	Private pnlcustomdialog As Panel
	Private lblmonth As Label
	Private lblday As Label
	Private lblyear As Label
	Private btnok_date As Button
	Private btncancel_date As Button
	Private txtyear As Picker
	Private txtmonth As Picker
	Private txtday As Picker
	Private currentTextField As TextField
	Private lblhour As Label
	Private lblminute As Label
	Private lblsecond As Label
	Private pnldate_time As Panel
	Private pnldatetime As Panel
	Private txthour As Picker
	Private txtminute As Picker
	Private txtsecond As Picker
	Private btncancel_time As Button
	Private btnok_time As Button
	Private btnoptions As Button
	Private btnmore As Button
	Private wballdesc As WebView
	Private btnclose_wb As Button
	Private pnlwb As Panel
End Sub

Sub StartActivity
	
	ListOptions.Initialize
	Library.ProductPage.Initialize("pageProduct")
	Library.ProductPage.RootPanel.LoadLayout("frmproduct_sv")
	
	Library.SetFont(btnclose_wb,"icomoon",btnclose_wb.CustomLabel.Font.Size)
	
	Library.RefererPage = Library.LastPage
	
	sv1.PagingEnabled = True
	sv1.SizeToFit
	
	If Library.IsEnglish Then
		sv1.Panel.LoadLayout("frmproduct_en")
		btnback.Text = ""
	Else
		sv1.Panel.LoadLayout("frmproduct")
	End If
	
	Library.NavControl.ShowPage(Library.ProductPage)
	
	sv1.ContentWidth = Library.GetWidth
	sv1.Panel.Width = Library.GetWidth
	
	For Each v1 As View In sv1.Panel.GetAllViewsRecursive
		If v1.Tag = "icon" Then
			If v1 Is Button Then
				Dim b1 As Button
				b1 = v1
				Library.SetFont(b1.CustomLabel,"icomoon",b1.CustomLabel.Font.Size)
			Else if v1 Is Label Then
				Dim l2 As Label
				l2 = v1
				Library.SetFont(l2,"icomoon",l2.Font.Size)
			End If
		Else
			If v1 Is Button Then
				Dim b1 As Button
				b1 = v1
				b1.CustomLabel.Font = Library.GetFont(b1.CustomLabel.Font.Size)
			Else if v1 Is Label Then
				Dim l2 As Label
				l2 = v1
				l2.Font = Library.GetFont(l2.Font.Size)
			End If
		End If
	Next
	
	btnmore.Text = Library.GetStringResourse("more")
	btnmore.CustomLabel.Font = Library.Getfont(14)
	
	btnoptions.Text = Library.GetStringResourse("options")
	btnoptions.CustomLabel.Font = Library.Getfont(14)
	btnoptions.Color = Library.Theme_Header
	btnoptions.SetBorder(1,Colors.White,31)
	btnoptions.Top = Library.GetHeight-btnoptions.Height-20dip
	btnoptions.Top = Library.GetHeight - btnoptions.Height - 40dip
	
	pnlReviews.Initialize("")
	Library.ProductPage.RootPanel.AddView(pnlReviews,0,0,Library.GetWidth,Library.GetHeight)
	pnlReviews.Visible = False
	pnlReviews.Color = Colors.RGB(238, 238, 238)
	svReviews.Initialize("",Library.GetWidth,Library.GetHeight)
	pnlReviews.AddView(svReviews,0,0,Library.GetWidth,100%y)
	
	pnlOptions.Initialize("")
	Library.ProductPage.RootPanel.AddView(pnlOptions,0,0,Library.GetWidth,Library.GetHeight)
	svOptions.Initialize("",Library.GetWidth,Library.GetHeight)
	pnlOptions.Visible = False
	svOptions.Color = Colors.White
	svOptions.Panel.Color = Colors.White
	pnlOptions.Color = Colors.White
	pnlOptions.AddView(svOptions,10dip,10dip,Library.GetWidth-20dip,Library.GetHeight-10dip)
	
	pnlAttribute.Initialize("")
	Library.ProductPage.RootPanel.AddView(pnlAttribute,0,0,Library.GetWidth,Library.GetHeight)
	pnlAttribute.Visible = False
	pnlAttribute.Color = Colors.RGB(238, 238, 238)
	svAttribute.Initialize("",Library.GetWidth,Library.GetHeight)
	pnlAttribute.AddView(svAttribute,0,0,Library.GetWidth,Library.GetHeight)
	
	pnlBasket.Initialize("")
	Library.ProductPage.RootPanel.AddView(pnlBasket,0,Library.GetHeight - 70dip,Library.GetWidth,50dip)

	pnlBasket.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	
	lblfloat_basket.Initialize("lbladd2cart")
	lblfloat_basket.TextColor = Colors.White
	lblfloat_basket.TextAlignment = lblfloat_basket.ALIGNMENT_CENTER
	Library.SetFont(lblfloat_basket,"icomoon",14)
	
	pnlBasket.AddView(lblfloat_basket,0,0,Library.GetWidth,pnlBasket.Height)
	pnlBasket.Visible = False
	lblfloat_basket.Left = 0
		
	MyToastMessageShow1.Initialize(Library.ProductPage.RootPanel)
	
'	lblpre_price.Font= Library.GetFont(lblpre_price.Font.Size)
'	lbldate.Font = Library.GetFont(lbldate.Font.Size)
	
	CurrentTimerSpecialWidth = pnllistnumb.Width

	sv1.ScrollOffsetY = 0
	
	details.Initialize
	listBanner.Initialize

	lblratetitle.Text = Library.GetStringResourse("ratetitle")
	lbldatetitle.Text = Library.GetStringResourse("datetitle")
	lblmodeltitle.Text = Library.GetStringResourse("modeltitle")
	lblproducertitle.Text = Library.GetStringResourse("producertitle")
	lblstatetitle.Text = Library.GetStringResourse("statetitle")
	lblvisitcount.Text = Library.GetStringResourse("visitcount")
	lbloptions.Text  = Library.GetStringResourse("options")
	lblattr.Text  = Library.GetStringResourse("attribute")
	btnattributes.Text = Library.GetStringResourse("attribute")
	btnreviews.Text = Library.GetStringResourse("reviews")
	
	IsOpenProduct = True
	
	lbls1.TextColor = Library.Theme_Header
	lbls2.TextColor = Library.Theme_Header
	lbls3.TextColor = Library.Theme_Header
	lbls4.TextColor = Library.Theme_Header
	lbls5.TextColor = Library.Theme_Header

	lbladd2cart.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	lbladd2cart.SetBorder(1,Library.ConvertHex2Int(Library.GetStringResourse("category_button")),9)
 
	If product.ContainsKey("product_id") = False Then
		LoadItem
	Else
		
		Dim detailsTemp As Map
		detailsTemp = CacheData.GetProductDescriptionFromCache(product.Get("product_id"))
		
		If detailsTemp <> Null And detailsTemp.IsInitialized Then
			Details_receive(detailsTemp,"")
		Else
			If Library.InternetState = False Then
				Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_title"),False)
				Library.NavControl.ShowPage(Library.MenuPage)
				Return
			End If
		
			Library.HUD.ProgressDialogShow(Library.GetStringResourse("loading"))
			details.ProductDetails(Me,"Details_receive",product.Get("product_id"))
		End If
		
	End If
	
	sv1.ContentHeight = 1900
	
End Sub

Sub pageProduct_Appear
	GetCart
End Sub

Sub pageProduct_Disappear
	offsetSlideshow = 1
End Sub

Sub pageProduct_Resize(Width As Int,Height As Int)

End Sub

Sub AddBullet(size As Int)

	Dim left As Int
	left = 0
	
	If bullet.IsInitialized = False Then bullet.Initialize
	
	pnlcircle.RemoveAllViews
	
	Dim c1 As Int
	c1 = Colors.RGB(191,191,191)
	
	pnlcircle.Width = 0
	
	For i = 1 To size
		Dim p1 As Panel
		p1.Initialize("")
		pnlcircle.AddView(p1,left,pnlcircle.Height /2,10dip,10dip)
		p1.Color = c1
		p1.SetBorder(0,c1,5)
		left = left + 14dip
		p1.Tag = i
		bullet.Add(p1)
	Next
	
	pnlcircle.Width = (p1.Width + p1.Left) * size
	'pnlcircle.Visible = True
	
End Sub

Sub Details_receive(res As Map,cat As String)
	
	If res.IsInitialized Then
		product = res
		CacheData.AddProductDescription2Cache(res)
		LoadItem
	End If
	
	Library.HUD.ProgressDialogHide
	
End Sub

Sub ChooseBullet(i As Int)
	
	'If i > bullet.Size-1 Then i = 0
	
	Dim c1,c2 As Int
	c1 = Colors.RGB(66,66,66)
	c2 = Colors.RGB(191,191,191)
	
	For Each v1 As View In pnlcircle.GetAllViewsRecursive
		Dim p2 As Panel
		p2 = v1
		p2.Color = c2
		p2.SetBorder(0,c2,5)
		
		If p2.Tag = i Then
			p2.Color = c1
			p2.SetBorder(0,c1,5)
		End If
		
	Next
	
End Sub

Sub LoadItem
	
	Dim product_name As String
	product_name = product.Get("name")
	
	Dim pr As Map
	pr.Initialize
	
	For Each vvs As String In product.Keys
		
		Dim s1 As Object
		s1 = product.Get(vvs)
			
		If s1 = Null Or s1 = "<null>" Or s1 = "null" Then
			pr.Put(vvs,"-")
		Else
			pr.Put(vvs,s1)
		End If
		
	Next
	
	product = pr
	
	lbltitle.Text = product_name
	lbltitle.Text = lbltitle.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
	
	Dim price,special As String
	price = product.Get("price_formated")
	special = product.Get("special_formated")
	
	If price.Length > 0 And special.Length = 0 Then
		lbladd2cart.Text = " " & price
		
		btnreviews.CustomLabel.Font= Library.GetFont(btnreviews.CustomLabel.Font.Size)
		btnattributes.CustomLabel.Font= Library.GetFont(btnattributes.CustomLabel.Font.Size)
		
	Else If special.Length > 0 Then
		lbladd2cart.Text = " " &special
		Library.DiscountPrice(price,lblpre_price)
		
		If Library.IsPersian Then
			imgspecial.Bitmap = LoadBitmap(File.DirAssets,"special_fa.png")
		Else
			imgspecial.Bitmap = LoadBitmap(File.DirAssets,"special_en.png")
		End If
		
		imgspecial.Visible = True
		
	End If
	
	If product_name.Length > 17 Then product_name = product_name.SubString2(0,13) & "..."
	
	Dim qus As String
	qus = product.Get("stock_status")
	
	If product.Get("quantity") = 0 Then 'Or qus = "ناموجود" Or qus.ToLowerCase.IndexOf("not") > -1 Then
		lblstate.Text = Library.GetStringResourse("no_stock")
		lbladd2cart.Font = Font.DEFAULT
		lbladd2cart.Text = Library.GetStringResourse("no_stock")
		pnlBasket.Visible = False
		pnl2.top = pnlprice.top + pnlprice.Height-2
		lbladd2cart.Color = Colors.RGB(253,77,90)
		lbladd2cart.SetBorder(1,Colors.RGB(253,77,90),9)
		lbladd2cart.UserInteractionEnabled = False
	Else
		lblstate.Text = Library.GetStringResourse("yes_stock")
	End If
	
	lblproducer.Text = product.Get("manufacturer")
	If lblproducer.Text.IndexOf("null") <> -1 Then lblproducer.Text = "-"
	
	lblmodel.Text = product.Get("model")
	If lblmodel.Text.IndexOf("null") <> -1 Then lblmodel.Text = "-"
	
	lblvisit.Text = product.Get("viewed")
	
	Dim listoption As List
	listoption = product.Get("options")

	top = lbldescription.top
	
	If listoption.Size > 0 Then
		LoadOptions(listoption)
'		Dim lbld As Label
'		lbld = lbldescription
'		lbldescription.RemoveViewFromParent
'		pnl2.AddView(lbld,10,top + 20dip,sv1.Width-20,lbld.Height)
	End If
	
	Dim review As Map
	review.Initialize
	review = product.Get("reviews")
	
	If review.IsInitialized Then
		btnreviews.Text = Library.GetStringResourse("reviews") & " [ " & review.Get("review_total") & " ]"
	Else
		btnreviews.Text = Library.GetStringResourse("reviews")
	End If
	
	#Region Rating
	If product.ContainsKey("rating") Then
		
		Dim rating As String
		rating = product.Get("rating")
		
		If rating = "0" Then
			lbls1.Text = ""
			lbls2.Text = ""
			lbls3.Text = ""
			lbls4.Text = ""
			lbls5.Text = ""
			
		Else If rating = "1" Then
			lbls1.Text = ""
			lbls2.Text = ""
			lbls3.Text = ""
			lbls4.Text = ""
			lbls5.Text = ""
			
		Else If rating = "2" Then
			lbls1.Text = ""
			lbls2.Text = ""
			lbls3.Text = ""
			lbls4.Text = ""
			lbls5.Text = ""
			
		Else If rating = "3" Then
			lbls1.Text = ""
			lbls2.Text = ""
			lbls3.Text = ""
			lbls4.Text = ""
			lbls5.Text = ""

		Else If rating = "4" Then
			lbls1.Text = ""
			lbls2.Text = ""
			lbls3.Text = ""
			lbls4.Text = ""
			lbls5.Text = ""
			
		Else If rating = "5" Or rating > 5 Then
			lbls1.Text = ""
			lbls2.Text = ""
			lbls3.Text = ""
			lbls4.Text = ""
			lbls5.Text = ""
		End If
	
	End If
	#End Region
	
	#Region Slide banner
	
	If product.ContainsKey("images") Then
		
		listSlideshow = product.Get("images")
		
		If product.ContainsKey("image") Then
			listSlideshow.InsertAt(0,product.Get("image"))
		End If
		
		Library.imagesSlideshowProduct.Initialize
		
		If listSlideshow.Size > 0 Then
		
			slidepanel1.Initialize("slideshowsv",Library.GetWidth,pnlads.Height)
			
			Dim images As Map
			images.Initialize
	
			Dim left As Int
			
			For i = 0 To listSlideshow.Size - 1
					
				Dim p1 As Panel
				p1.Initialize("pnlImage")
				slidepanel1.Panel.AddView(p1,left,0,Library.GetWidth,Library.GetWidth)
				
				Dim im1 As ImageView
				im1.Initialize("imgADs")
				im1.ContentMode = im1.MODE_FIT
				Library.imagesSlideshowProduct.Add(im1)
				
				If Library.GetDevicePhysicalSize > 5 Then
					p1.AddView(im1,0,0,Library.GetWidth-20dip,Library.GetWidth-160dip)
				Else
					p1.AddView(im1,0,0,Library.GetWidth-20dip,Library.GetWidth-140dip)
				End If
				
				im1.Tag = listSlideshow.Get(i)
				left = left + Library.GetWidth
				
				images.Put(im1,listSlideshow.Get(i))
					
			Next
			
			Dim imagedownload1 As ImageDownloader
			imagedownload1.Initialize
			imagedownload1.Download(images)
			
			slidepanel1.ContentWidth = listSlideshow.Size * Library.GetWidth
			pnlads.AddView(slidepanel1,0,0,Library.GetWidth,pnlads.Height)
			
			AddBullet(listSlideshow.Size)
			ChooseBullet(0)
			
			timerSlideshow.Initialize("tmrSlideshow",2500)
			timerSlideshow.Enabled = True
			
		End If
		
	End If
	
	#End Region

	Dim style As String
	style = "<style>body {text-align:justify;line-height:25px;"
	
	sv1.Panel.Height = sv1.Panel.Height + lbldescription.Height-340dip
	pnl2.Height = pnl2.Height + lbldescription.Height -270dip
	
	If Library.IsPersian Then
		lbldate.Text = Library.GetDate(product.Get("date_added"))
		style = style & "direction:rtl;}</style>"
	Else
		lbldate.Text = product.Get("date_added")
		style = style & "direction:ltr;}</style>"
	End If
	
	Dim ks As String
	ks = product.Get("description")
	
	If ks.Length < 601 Then btnmore.Visible = False
	
	If ks.Length > 600 Then
		ks = ks.SubString2(0,600) & "...."
	End If
	
	lbldescription.LoadHtml(style & ks)
	
	top = sv1.Panel.height + 2dip
	sv1.ContentHeight = top
	
	Dim opRelat As OpenCart 
	opRelat.Initialize
	opRelat.RelatedProduct(Me,"RelatedProduct_receive",product.Get("id"))
	
	lbladd2cart.Text = lbladd2cart.Text
	lblfloat_basket.Text = " " & Library.GetStringResourse("add2cartbtn") 'product_name & " " & lbladd2cart.Text
	
	If GetDiscount = True Then
		timerSpecial.Initialize("timerSpecial",1000)
		timerSpecial.Enabled = True
	End If
	
	tmrCicle.Initialize("tmrCircles",2000)
	tmrCicle.Enabled = True
	
End Sub

Sub tmrCircles_Tick
	pnlcircle.Visible = True
	tmrCicle.Enabled = False
	pnlcircle.Width = (10dip + 4dip) * listSlideshow.Size
	pnlcircle.SetLayoutAnimated(500,1,Library.GetWidth / 2 - pnlcircle.Width / 2,pnlcircle.Top,pnlcircle.Width+32dip,pnlcircle.Height)
End Sub

Sub GetDiscount As Boolean
	
	Dim start_date,end_date As String
	start_date = product.Get("special_start_date")
	end_date   = product.Get("special_end_date")
	
	If start_date = "0000-00-00" Or end_date = "0000-00-00" Or start_date.Length = 0 Or end_date.Length = 0 Then Return False

	If Regex.IsMatch("\d{4}-\d{1,2}-\d{1,2}",start_date) And Regex.IsMatch("\d{4}-\d{1,2}-\d{1,2}",end_date) Then
	
		Try

			If File.Exists(File.DirLibrary,"timeout_ids_" & product.Get("id")) Then
				Dim temp As Map
				temp = File.ReadMap(File.DirLibrary,"timeout_ids_" & product.Get("id"))
				SpecialDateInformation.Days = temp.Get("Days")
				SpecialDateInformation.Hours = temp.Get("Hours")
				SpecialDateInformation.Minutes = temp.Get("Minutes")
				SpecialDateInformation.Months = temp.Get("Months")
				SpecialDateInformation.Seconds = temp.Get("Seconds")
				SpecialDateInformation.Years = temp.Get("Years")
			Else
				DateTime.DateFormat = "yyyy-mm-dd"
				SpecialDateInformation = DateUtils.PeriodBetweenInDays(DateTime.DateParse(start_date),DateTime.DateParse(end_date))
				
				If SpecialDateInformation.Months > 0 Then
					SpecialDateInformation.Days = SpecialDateInformation.Days + (SpecialDateInformation.Months * 30)
				End If
				
				If SpecialDateInformation.Days > 0 Then
					SpecialDateInformation.Days = SpecialDateInformation.Days - 1
					SpecialDateInformation.Hours = SpecialDateInformation.Hours + 24
					If SpecialDateInformation.Hours > 24 Then
						SpecialDateInformation.Hours = SpecialDateInformation.Hours - 24
						SpecialDateInformation.Minutes = SpecialDateInformation.Minutes + 59
					End If
				End If
				
				Dim m As Map
				m.Initialize
				m.Put("Years",SpecialDateInformation.Years)
				m.Put("Months",SpecialDateInformation.Months)
				m.Put("Days",SpecialDateInformation.Days)
				m.Put("Hours",SpecialDateInformation.Hours)
				m.Put("Minutes",SpecialDateInformation.Minutes)
				m.Put("Seconds",SpecialDateInformation.Seconds)
				File.WriteMap(File.DirLibrary,"timeout_ids_" & product.Get("id"),m)
				
			End If
			
			Return True
			
		Catch
		End Try
		
	End If
	
	Return False
	
End Sub

Sub timerSpecial_Tick
	
	If pnltimer.Visible = False Then
		pnltimer.Visible = True
		pnltimer.BringToFront
		Library.RedString(Library.GetStringResourse("special_wonderful").Replace("{r}",""),lblwonderfull)
		pnlprice.top = pnltimer.top + pnltimer.Height
		pnlprice.BringToFront
		pnl2.top = pnlprice.top + pnlprice.Height-2
		timerSpecial.Initialize("timerSpecial",1000)
		timerSpecial.Enabled = True
		lblline2.Color = Colors.Black
		lblline1.Color = Colors.Transparent
	End If
	
	If SpecialDateInformation.Seconds = 0 Then
		
		SpecialDateInformation.Seconds = 59
		
		If SpecialDateInformation.Minutes = 0 And SpecialDateInformation.Hours > 0 Then
			SpecialDateInformation.Minutes = 59
		Else If SpecialDateInformation.Minutes = 0 And SpecialDateInformation.Hours = 0 Then
			EndTimerSpecial
			Return
		Else
			SpecialDateInformation.Minutes = SpecialDateInformation.Minutes - 1
		End If
	
	Else
		SpecialDateInformation.Seconds = SpecialDateInformation.Seconds - 1
	End If
	
	If SpecialDateInformation.Minutes = 0 Then
		If SpecialDateInformation.Minutes = 0 And SpecialDateInformation.Hours > 0 Then
			SpecialDateInformation.Minutes = 59
			SpecialDateInformation.Hours = SpecialDateInformation.Hours - 1
		Else If SpecialDateInformation.Minutes = 0 And SpecialDateInformation.Hours = 0 Then
			EndTimerSpecial
			Return
		Else
			SpecialDateInformation.Hours = SpecialDateInformation.Hours - 1
		End If
	else if SpecialDateInformation.Minutes > 59 Then
		SpecialDateInformation.Minutes = SpecialDateInformation.Minutes - 59
		SpecialDateInformation.Hours = SpecialDateInformation.Hours + 1
	End If
	
	If SpecialDateInformation.Hours = 0 Then
		If SpecialDateInformation.Hours = 0 And SpecialDateInformation.Days > 0 Then
			SpecialDateInformation.Hours = 24
			SpecialDateInformation.Days = SpecialDateInformation.Days - 1
		Else If SpecialDateInformation.Hours = 0 And SpecialDateInformation.Hours = 0 Then
			EndTimerSpecial
			Return
		Else
			SpecialDateInformation.Hours = SpecialDateInformation.Hours - 1
		End If
	
	Else
		
	End If
	
	Dim m As Map
	m.Initialize
	m.Put("Years",SpecialDateInformation.Years)
	m.Put("Months",SpecialDateInformation.Months)
	m.Put("Days",SpecialDateInformation.Days)
	m.Put("Hours",SpecialDateInformation.Hours)
	m.Put("Minutes",SpecialDateInformation.Minutes)
	m.Put("Seconds",SpecialDateInformation.Seconds)
	File.WriteMap(File.DirLibrary,"timeout_ids_" & product.Get("id"),m)
	
	lblnum1.Text = SpecialDateInformation.Days
	lblnum2.Text = SpecialDateInformation.Hours
	lblnum3.Text = SpecialDateInformation.Minutes
	lblnum4.Text = SpecialDateInformation.Seconds
	
	If SpecialDateInformation.Days > 99 Then
		lblnum1.Font = Library.GetFont(14)	
	End If
	
End Sub

Sub EndTimerSpecial
	timerSpecial.Enabled = False
	pnlprice.top = pnltimer.top - pnltimer.Height
	pnltimer.Visible = False
	pnl2.top = pnlprice.top - pnlprice.Height
End Sub

#Region Reviews

Sub LoadReviews
	
	
	If product.ContainsKey("reviews") Then
	
		Dim reviewsMap As Map = product.Get("reviews")
		Dim reviews As List
		reviews = reviewsMap.Get("reviews")
		
		If reviews.IsInitialized Then
			
			Dim topReviews As Int
			Dim html1 As Html
			html1.Initialize
			
			For j = 0 To reviews.Size - 1
				
				Dim m1 As Map
				m1 = reviews.Get(j)
				
				Dim p1 As Panel
				p1.Initialize("")
				
				svReviews.Panel.AddView(p1,0,topReviews,svReviews.Width,0)
				p1.LoadLayout("frmtemplate_comment")
				p1.height = pnlitem_comment.height + 4
				
				Library.LabelSpace(lblcomment_review,1.5)

				lblauthor.Text = m1.Get("author")
				
				If Library.IsPersian Then
					lbldate_comment.Text = Library.GetDate(m1.Get("date_added"))
					lblcomment_review.TextAlignment = lblcomment_review.ALIGNMENT_RIGHT
				Else
					lbldate_comment.Text = m1.Get("date_added")
					lblcomment_review.TextAlignment = lblcomment_review.ALIGNMENT_LEFT
				End If
				
				lblcomment_review.Text = html1.FromHtml(m1.Get("text"))
				lblnumber.Text = j + 1
				
				topReviews = topReviews + p1.height
				
				If j = 0 Then topReview = topReviews - p1.height
				
				#Region Rating
				
				Dim rating1 As Int
				rating1 = m1.Get("rating")
				
				Library.SetFont(lblcommentstar1,"icomoon",lblcommentstar1.Font.Size)
				Library.SetFont(lblcommentstar2,"icomoon",lblcommentstar1.Font.Size)
				Library.SetFont(lblcommentstar3,"icomoon",lblcommentstar1.Font.Size)
				Library.SetFont(lblcommentstar4,"icomoon",lblcommentstar1.Font.Size)
				Library.SetFont(lblcommentstar5,"icomoon",lblcommentstar1.Font.Size)
				
				If rating1 = "0" Then
					lblcommentstar1.Text = ""
					lblcommentstar2.Text = ""
					lblcommentstar3.Text = ""
					lblcommentstar4.Text = ""
					lblcommentstar5.Text = ""
					
				Else If rating1 = "1" Then
					lblcommentstar1.Text = ""
					lblcommentstar2.Text = ""
					lblcommentstar3.Text = ""
					lblcommentstar4.Text = ""
					lblcommentstar5.Text = ""
					
				Else If rating1 = "2" Then
					lblcommentstar1.Text = ""
					lblcommentstar2.Text = ""
					lblcommentstar3.Text = ""
					lblcommentstar4.Text = ""
					lblcommentstar5.Text = ""
					
				Else If rating1 = "3" Then
					lblcommentstar1.Text = ""
					lblcommentstar2.Text = ""
					lblcommentstar3.Text = ""
					lblcommentstar4.Text = ""
					lblcommentstar5.Text = ""

				Else If rating1 = "4" Then
					lblcommentstar1.Text = ""
					lblcommentstar2.Text = ""
					lblcommentstar3.Text = ""
					lblcommentstar4.Text = ""
					lblcommentstar5.Text = ""
					
				Else If rating1 = "5" Or rating1 > 5 Then
					lblcommentstar1.Text = ""
					lblcommentstar2.Text = ""
					lblcommentstar3.Text = ""
					lblcommentstar4.Text = ""
					lblcommentstar5.Text = ""
				End If
				
				#End Region
				
			Next
			
		End If
		
		Dim btnbackre As Button
		btnbackre.InitializeCustom("btnbackreviews",Colors.White,Colors.Gray)
		btnreview.InitializeCustom("btnreview",Colors.White,Colors.Gray)
		
		topReviews = topReviews + 15
		
		svReviews.Panel.AddView(btnbackre,0,topReviews,120dip,40dip)
		topReviews = topReviews + 45dip
		svReviews.Panel.AddView(btnreview,0,topReviews,120dip,40dip)
		
		btnbackre.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
		btnbackre.SetBorder(1,Colors.Gray,5)
		
		btnbackre.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
		btnbackre.SetBorder(1,Library.ConvertHex2Int(Library.GetStringResourse("category_button")),5)
		btnbackre.Text = Library.GetStringResourse("back")
		btnbackre.CustomLabel.TextColor = Colors.White
		btnbackre.CustomLabel.Font = Library.GetFont(14)
		Library.CenterView(btnbackre,Library.ProductPage.RootPanel)
		
		btnreview.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
		btnreview.SetBorder(1,Library.ConvertHex2Int(Library.GetStringResourse("category_button")),5)
		btnreview.Text = Library.GetStringResourse("review").Replace("[0]","")
		btnreview.CustomLabel.TextColor = Colors.White
		btnreview.CustomLabel.Font = Library.GetFont(14)
		Library.CenterView(btnreview,Library.ProductPage.RootPanel)
	
		svReviews.Panel.height = topReviews + 75dip
		svReviews.ContentHeight = topReviews + 75dip
		svReviews.ContentWidth = Library.GetWidth
		svReviews.Height = Library.GetHeight
		
	End If

End Sub

Sub btnreview_Click
	btnbackreviews_Click
	Library.LastPage = Library.ProductPage
	actReview.id = product.Get("id")
	Library.LastPage = Library.ProductPage
	actReview.StartActivity
End Sub

Sub btnreviews_Click
	
	If svReviews.Panel.NumberOfViews = 0 Then
		LoadReviews
	End If
	
	If svReviews.Panel.NumberOfViews = 0 Then Return
	
	pnlReviews.top = pnlReviews.Height
	pnlReviews.Visible = True
	pnlReviews.SetLayoutAnimated(500,1,0,0,pnlReviews.Width,pnlReviews.Height)
	pnlReviews.BringToFront
	
End Sub

Sub btnbackreviews_Click
	pnlReviews.SetLayoutAnimated(500,1,0,pnlReviews.Height,pnlReviews.Width,pnlReviews.Height)
End Sub

#End Region

Sub imgADs_Click
	
	Dim im As ImageView
	im = Sender

	Library.LastPage = Library.ProductPage
	
	actPicture.link = im.Tag
	actPicture.images = product.Get("images")
	actPicture.StartActivity
	
End Sub

Sub RelatedProduct_receive(res As List,cat As String)
	
	Dim listoption As List
	listoption = product.Get("options")
	
	If listoption.IsInitialized Then
	
		If listoption.Size > 0 Then
			pnl2.Height = pnl2.Height - 660dip
		End If
		
		sv1.Panel.Height = sv1.Panel.Height + 20dip
		
		'top = lbldescription.Top + lbldescription.Height
		
		If res.Size > 0 Then
			Dim svhProduct As ScrollView
			top = AddHeader(Library.GetStringResourse("relat_product"),"newproduct",lbldescription.Top + lbldescription.Height + lbldescription.Height+290dip)
			svhProduct.Initialize("",Library.GetWidth,210dip)
			svhProduct.ContentWidth = 1000
			svhProduct.ContentHeight = 210dip
			sv1.Panel.AddView(svhProduct,0,top,sv1.Width,210dip)
			top = top + LoadProductHorizontalScroll(res,svhProduct) + 70dip
		End If
	
	End If
	
	sv1.Panel.Color = Colors.White
	sv1.ContentHeight = sv1.Panel.GetView(sv1.Panel.NumberOfViews-1).Top + 310dip
	
End Sub

Sub AddHeader(Title As String,Tag As String,Tops As Int) As Int
	
	Dim p1 As Panel
	p1.Initialize("")
	sv1.Panel.AddView(p1,0,Tops,sv1.Width,0)
	
	If Library.IsPersian Then
		p1.LoadLayout("frmheader_template")
	Else
		p1.LoadLayout("frmheader_template_en")
	End If
	
	lblheadername.Font = Library.GetFont(lblheadername.Font.Size)
	Library.SetFont(lblnext,"icomoon",lblnext.Font.Size)
	
	p1.Height = pnlheadert.Height
	lblheadername.Text = Title
	pnloverheader.Tag = Tag
	
	Tops = Tops + p1.Height + 4dip
	
	pnlheaderproduct.Color = Library.Theme_Header
	pnlheaderproduct.SetBorder(1,Library.Theme_Header,16dip)
	
	sv1.Panel.Height = sv1.Panel.Height + p1.Height
	
	Return Tops
	
End Sub

Sub pnlover_Click
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.Visible = True
	
	Dim temp As Map
	temp = p1.Tag
	product = temp
	top = 0
	sv1.Panel.RemoveAllViews
	
	StartActivity
	
End Sub

Sub tmrSlideshow_Tick
	
	If Library.imagesSlideshowProduct.IsInitialized = False Then Return
	
	If offsetSlideshow >= Library.imagesSlideshowProduct.Size  Then
		offsetSlideshow = 1
		slidepanel1.ScrollTo(0,slidepanel1.Top,True)
		ChooseBullet(offsetSlideshow)
	Else
		slidepanel1.ScrollTo(Library.GetWidth * offsetSlideshow,slidepanel1.Top,True)
		offsetSlideshow = offsetSlideshow + 1
		ChooseBullet(offsetSlideshow)
	End If

End Sub

Sub btnbookmark_Click

	Dim op As OpenCart
	op.Initialize

	If Bookmark.Bookmarks(product) = True Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("add_bookmark"),2,True)
		btnbookmark.CustomLabel.TextColor = Colors.Red
		op.Wishlist(Me,"Bookmark_receive",product.Get("id"))	
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("remove_bookmark"),2,True)
		btnbookmark.CustomLabel.TextColor = Colors.RGB(145, 145, 145)
		op.Wishlist(Me,"Bookmark_receive","-" & product.Get("id"))
	End If
	
End Sub

Sub Bookmark_receive(res As Map,cat As String)
	Log(res)
End Sub

Sub btnshare_Click

	Dim link As String
	link = details.GetURL & "/index.php?route=product/product&product_id=" & product.Get("id")
	modShare.ShareToSocialMedia(Library.MenuPage, Library.GetStringResourse("share"), link, Sender)
	
End Sub

#Region cart

Sub lbladd2cart_Click
	
	pnlOptions.SetLayoutAnimated(500,1,0,pnlOptions.Height,pnlOptions.Width,pnlOptions.Height)
	btnoptions.SetLayoutAnimated(800,1,btnoptions.Left,Library.GetHeight - btnoptions.Height - 40dip,btnoptions.Width,btnoptions.Height)
	
	If Library.InternetState = False Then
		MyToastMessageShow1.Initialize(Library.ProductPage.RootPanel)
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	Dim qus As String
	qus = product.Get("stock_status")
	
	If product.Get("quantity") = 0 Then 'Or qus = "ناموجود" Or qus.ToLowerCase.IndexOf("not") > -1 Then
		MyToastMessageShow1.Initialize(Library.ProductPage.RootPanel)
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_product"),1.5,False)
		Return
	End If
	
	Dim sMin As Int
	If product.ContainsKey("minimum") Then
		sMin = product.Get("minimum")
	Else
		sMin = 1
	End If
	
	Dim options As Map
	options = GetCartOptions
	Library.HUD.ProgressDialogShow(Library.GetStringResourse("apply"))
	details.Add2Cart(Me,"Add2Cart_receive",product.Get("id"),sMin,options)
	
End Sub

Sub btnbasket_Click
	Library.LastPage = Library.ProductPage
	actBasket.StartActivity
End Sub

Sub Add2Cart_receive(res As Map,cat As String)
	
	Library.hud.ProgressDialogHide
	
	If res.ContainsKey("error") Then
		
		Dim rs As Map
		Dim err As String
		
		rs = res.Get("error")
		
		If rs.ContainsKey("option") Then
			Msgbox(Library.GetStringResourse("cannot_add_cart"),Library.GetStringResourse("alert"))
			ShowOptionsPanel
			Return
		End If
		
		For Each v1 As String In rs.Values
			Dim temp As String
			temp = v1
			temp = temp.Replace("{","").Replace("}","").Replace(",","")
			temp = Library.RegexReplace("\d+=",temp,CRLF)
			err = err & temp & CRLF
		Next
		
		Msgbox(err,Library.GetStringResourse("alert"))
		
		Return
		
	End If
	
	If res.Get("success") = True Then
		sv1.ScrollOffsetY = 0
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("add2cart"),2,True)
	End If
	
	GetCart
		
End Sub

Sub GetCart
	Dim cart As OpenCart
	cart.Initialize
	cart.GetCarts(Me,"Carts_receive")
End Sub

Sub Carts_receive(res As Map,cat As String)
	Library.CartDetails = res
	Library.ShowCartLabel(lblbasket)
	lblbasket.Font = Font.CreateNew(10)
	btnbasket.CustomLabel.TextColor = Colors.Red
End Sub

#End Region

#Region Attribute

Sub LoadAttribute
	
	Dim attr As List
	
	If product.ContainsKey("attribute_groups") Then
		attr = product.Get("attribute_groups")
	End If
	
	If attr.IsInitialized = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_attribute"),1.5,False)
		Return
	End If
	
	If attr.Size = 0 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_attribute"),1.5,False)
		Return
	End If
	
	Dim topAttribute As Int
	
	Dim lblHeader As Label
	lblHeader.Initialize("")
	lblHeader.Color = Library.Theme_Background
	
	lblHeader.Font = Library.GetFont(14)
	
	lblHeader.TextColor = Colors.Gray
	lblHeader.Text = Library.GetStringResourse("attribute")
	lblHeader.TextAlignment = lblHeader.ALIGNMENT_CENTER
	Library.PaddingLabel(lblHeader,10,0,10,0)
	svAttribute.Panel.AddView(lblHeader,pnl2.Left,topAttribute,pnl2.Width,40dip)
	topAttribute = topAttribute + 40dip
	svAttribute.Panel.Height = svAttribute.Panel.Height + 40dip
		
	For i = 0 To attr.Size - 1
		
		Dim temp As Map
		temp = attr.Get(i)
		
		Dim lblKey As Label
		lblKey.Initialize("")
		lblKey.Color = Library.Theme_Header
		lblKey.Font = Library.GetFont(14)
		lblKey.TextColor = Colors.White
		lblKey.Text = "  " & temp.Get("name") & "  "
		lblKey.TextAlignment = Library.GetStringResourse("direction_ios")
		Library.PaddingLabel(lblKey,10,0,10,0)
		
		svAttribute.Panel.AddView(lblKey,pnl2.Left,topAttribute,pnl2.Width,40dip)
		topAttribute = topAttribute + 40dip
		svAttribute.Panel.Height = svAttribute.Panel.Height + 40dip
		
		Dim vals As List
		vals = temp.Get("attribute")
		
		For j = 0 To vals.Size - 1
			
			Dim attrs As Map
			attrs = vals.Get(j)
			
			Dim lblVal As Label
			lblVal.Initialize("")
			lblVal.Color = Colors.White
			lblVal.Font =  Library.GetFont(12)
			lblVal.TextColor = Colors.Black
			lblVal.Text = "  " & attrs.Get("name") & " : " & attrs.Get("text") & "  "
			lblVal.TextAlignment = Library.GetStringResourse("direction_ios")
			Library.PaddingLabel(lblVal,10,0,10,0)
			
			svAttribute.Panel.AddView(lblVal,pnl2.Left,topAttribute,pnl2.Width,40dip)
			topAttribute = topAttribute + 40dip
			svAttribute.Panel.Height = svAttribute.Panel.Height + 40dip
			
		Next
		
	Next
	
	Dim btnback As Button
	btnback.InitializeCustom("btnbackattr",Colors.White,Colors.DarkGray)
	
	topAttribute = topAttribute + 15
	
	svAttribute.Panel.AddView(btnback,0,topAttribute,120dip,40dip)
	
	btnback.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	btnback.SetBorder(1,Colors.Gray,5)
	btnback.Text = Library.GetStringResourse("back")
	btnback.CustomLabel.TextColor = Colors.White
	btnback.CustomLabel.Font = Library.GetFont(14)
	Library.CenterView(btnback,Library.ProductPage.RootPanel)

	svAttribute.Panel.height = topAttribute + 55dip
	svAttribute.ContentHeight = topAttribute + 55dip
	svAttribute.ContentWidth = svAttribute.Width
		
End Sub

Sub lblattributes_Click
	
	If svAttribute.Panel.NumberOfViews = 0 Then
		LoadAttribute
	End If
	
	If svAttribute.Panel.NumberOfViews = 0 Then Return
	
	pnlAttribute.top = pnlAttribute.Height
	pnlAttribute.Visible = True
	pnlAttribute.SetLayoutAnimated(500,1,0,0,pnlAttribute.Width,pnlAttribute.Height)
	pnlAttribute.BringToFront
	
End Sub

Sub btnbackattr_Click
	pnlAttribute.SetLayoutAnimated(500,1,0,pnlAttribute.Height,pnlAttribute.Width,pnlAttribute.Height)
End Sub

#End Region

Sub ShowOptionsPanel
	
	pnlOptions.Visible = True
	pnlOptions.top = pnlOptions.Height
	pnlOptions.SetLayoutAnimated(500,1,0,0,pnlOptions.Width,pnlOptions.Height)
	btnoptions.SetLayoutAnimated(600,1,btnoptions.Left,Library.GetHeight + btnoptions.Height,btnoptions.Width,btnoptions.Height)
	Library.ProductPage.ResignFocus
	
End Sub

Sub LoadOptions(attr As List)
	
	If attr.IsInitialized = False Then Return
	If attr.Size = 0 Then Return
	
	btnoptions.Visible = True
	btnoptions.BringToFront
	
	pnlOptions.SetLayoutAnimated(500,1,0,pnlOptions.Height,pnlOptions.Width,pnlOptions.Height)
	btnoptions.SetLayoutAnimated(800,1,btnoptions.Left,Library.GetHeight - btnoptions.Height - 40dip,btnoptions.Width,btnoptions.Height)

	topOptions = 3dip
	
	Dim lblHeader As Label
	lblHeader.Initialize("")
	lblHeader.Color = Colors.White
	
	lblHeader.Font = Library.GetFont(14)
	lblHeader.TextColor = Colors.Gray
	lblHeader.Text = Library.GetStringResourse("options")
	lblHeader.TextAlignment = Library.GetStringResourse("direction_ios")
	Library.PaddingLabel(lblHeader,10,0,10,0)
	svOptions.Panel.AddView(lblHeader,0,topOptions + 20,Library.GetWidth-20dip,40dip)
	topOptions = topOptions + lblHeader.Height+13dip
	svOptions.Panel.Height = svOptions.Panel.Height + 60dip
	
	For i = 0 To attr.Size - 1
		
		Dim OptionType As Map
		Dim OptionValue As List
		
		OptionType = attr.Get(i)
		OptionValue = OptionType.Get("option_value")
		
		Dim lblKey As Label
		lblKey.Initialize("")
		lblKey.Color = Library.Theme_Header
		lblKey.Font = Library.GetFont(14)
		lblKey.TextColor = Colors.White
		lblKey.Text = "  " & OptionType.Get("name") & " " & Library.GetStringResourse("request_state_" & OptionType.Get("required")) & "  "
		lblKey.Text = lblKey.Text.Replace("&amp;","&")
		lblKey.TextAlignment = Library.GetStringResourse("direction_ios")
		Library.PaddingLabel(lblKey,10,0,10,0)

		svOptions.Panel.AddView(lblKey,0,topOptions+10dip,Library.GetWidth-20dip,40dip)

		topOptions = topOptions + 55dip
		svOptions.Panel.Height = svOptions.Panel.Height + 43dip
		
		Dim sp1 As Picker
		sp1.Initialize("")
		
		Dim lsData As List
		lsData.Initialize
		
		Dim pDefault As Panel
		Dim blnAddPanel As Boolean
		Dim TopRB As Int = 0
		pDefault.Initialize("")
		
		If OptionType.Get("type") = "text" Or OptionType.Get("type") = "file" Or OptionType.Get("type") = "textarea" Or OptionType.Get("type") = "time" Or OptionType.Get("type") = "date" Or OptionType.Get("type") = "datetime" Then
				
			Dim txt1 As TextField
			txt1.Initialize("txtoption")
			txt1.Font = Library.GetFont(14)
			txt1.Color = Colors.White
			txt1.SetBorder(1,Colors.Gray,5)
			txt1.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":"","Type" : OptionType.Get("type") ,"Index" : ListOptions.Size-1)
			ListOptions.Add(txt1)
			
			If OptionType.Get("type") = "textarea" Then
				svOptions.Panel.AddView(txt1,10,topOptions,Library.GetWidth-20dip-20,120dip)
				topOptions = topOptions + 128dip
				svOptions.Panel.Height = svOptions.Panel.Height + 128dip

				If Library.IsPersian Then
					txt1.TextAlignment = txt1.ALIGNMENT_RIGHT
				Else
					txt1.TextAlignment = txt1.ALIGNMENT_LEFT
				End If
			Else
				svOptions.Panel.AddView(txt1,10,topOptions,Library.GetWidth-20dip-20,40dip)
				topOptions = topOptions + 48dip
				txt1.TextAlignment = Library.GetStringResourse("direction_ios")
				svOptions.Panel.Height = svOptions.Panel.Height + 48dip
			End If
			
			Continue
				
		End If
		
		For j = 0 To OptionValue.Size - 1
			Dim attrs As Map
			attrs = OptionValue.Get(j)
			
			If OptionType.Get("type") = "radio" Then
				
				Dim rb1 As Switch
				rb1.Initialize("")
				
				Dim price_format As String
				price_format = attrs.Get("price_formated")
				If price_format = "false" Then price_format = ""
				
				rb1.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
				
				ListOptions.Add(rb1)
				
				If blnAddPanel = False Then
					svOptions.Panel.AddView(pDefault,0,topOptions,Library.GetWidth-20dip,40dip)
				End If
				
				blnAddPanel = True
				
				Dim lb2 As Label
				lb2.Initialize("")
				lb2.Text = "  " & attrs.Get("name") & " ( " & attrs.Get("price_prefix") & price_format & " )"
				lb2.TextColor = Colors.Black
				lb2.Font = Library.GetFont(14)
				lb2.TextAlignment = Library.GetStringResourse("direction_ios")
				
				If Library.IsPersian Then
					pDefault.AddView(lb2,0,TopRB,Library.GetWidth-20dip - 60dip,40dip)
					pDefault.AddView(rb1,Library.GetWidth-20dip-60dip,TopRB,40dip,40dip)
				Else
					pDefault.AddView(lb2,70dip,TopRB-4,Library.GetWidth-20dip - 60dip,40dip)
					pDefault.AddView(rb1,10,TopRB,Library.GetWidth-20dip-20,40dip)
				End If
				
				topOptions = topOptions + 40dip
				TopRB = TopRB + 40dip
				svOptions.Panel.Height = svOptions.Panel.Height + 48dip
				pDefault.Height = pDefault.Height + 48dip
			
			Else If OptionType.Get("type") = "checkbox" Then
				
				Dim ck1 As Switch
				ck1.Initialize("")
				ck1.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
				ListOptions.Add(ck1)
				
				Dim pr As String
				pr = attrs.Get("price_formated")
				If pr = "false" Then pr = " "
				
				Dim lb21 As Label
				lb21.Initialize("")
				lb21.Text = "  " & attrs.Get("name") & " ( " & attrs.Get("price_prefix") & attrs.Get("price_formated") & " )" 
				lb21.TextColor = Colors.Black
				lb21.Font= Library.GetFont(14)
									
				If Library.IsPersian Then
					lb21.TextAlignment = lb21.ALIGNMENT_RIGHT
					svOptions.Panel.AddView(lb21,0,topOptions,Library.GetWidth-38dip - 40dip,40dip)
					svOptions.Panel.AddView(ck1,Library.GetWidth-20dip-60dip,topOptions,40dip,40dip)
				Else
					lb21.TextAlignment = lb21.ALIGNMENT_LEFT
					svOptions.Panel.AddView(lb21,70dip,topOptions-5,Library.GetWidth-38dip,40dip)
					svOptions.Panel.AddView(ck1,10,topOptions,Library.GetWidth-20dip-20,40dip)
				End If
				
				topOptions = topOptions + 40dip
				svOptions.Panel.Height = svOptions.Panel.Height + 58dip
				
			Else If OptionType.Get("type") = "select" Then
				
				Dim attrs1 As Map
				attrs1 = OptionValue.Get(j)
				
				Dim pr As String
				pr = attrs1.Get("price_formated")
				If pr = "false" Then pr = " )"
				
				lsData.Add(attrs1.Get("name") & " ( " & attrs1.Get("price_prefix") & pr & " )")
				
				'sp1.SetItems(0,Array(attrs1.Get("name") & " ( " & attrs1.Get("price_prefix") & pr & " )"))
				
'				If sp1.GetItems(0).Size = OptionValue.Size Then
'					sp1.SelectRow(0,0,True)
					sp1.Tag = CreateMap("Vals" : OptionValue,"id":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
					ListOptions.Add(sp1)
					svOptions.Panel.AddView(sp1,10,lblKey.Height + lblKey.Top + 20dip,Library.GetWidth-20dip-20,40dip)
					topOptions = topOptions + 40dip
					topOptions = topOptions
					svOptions.Panel.Height = svOptions.Panel.Height + 48dip
'				End If
				
			Else If OptionType.Get("type") = "image" Then
				
				Dim imageMap As Map
				imageMap.Initialize
				
				Dim img As Map
				img = OptionValue.Get(j)
				
				Dim rbimage As Switch
				rbimage.Initialize("")
				rbimage.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
				
				Dim image As ImageView
				image.Initialize("")
				
				Dim lblImage As Label
				lblImage.Initialize("")
				lblImage.Font = Library.GetFont(14)
				lblImage.TextColor = Colors.Black
				lblImage.Text = "  " & img.Get("name") & " ( " & img.Get("price_prefix") & " )"
				
				If Library.IsPersian Then
					svOptions.Panel.AddView(rbimage,Library.GetWidth-20dip-58dip,topOptions,34dip,34dip)
					svOptions.Panel.AddView(image,Library.GetWidth-20dip-58dip-38dip,topOptions,34dip,34dip)
					svOptions.Panel.AddView(lblImage,0,topOptions,Library.GetWidth-20dip-58dip-38dip,43dip)
					lblImage.TextAlignment = lblImage.ALIGNMENT_RIGHT
				Else
					svOptions.Panel.AddView(rbimage,10,topOptions,34dip,34dip)
					svOptions.Panel.AddView(image,rbimage.Left + rbimage.Width,topOptions,34dip,34dip)
					svOptions.Panel.AddView(lblImage,image.Left + image.Width,topOptions,Library.GetWidth-20dip-image.Width-(image.Width)-14,43dip)
				End If
				
'				If j = 0 Then rbimage.Checked = True
				
				Dim imdown As ImageDownloader
				imdown.Initialize
				imdown.Download(CreateMap(image:img.Get("image")))
				
				ListOptions.Add(rbimage)
				
				topOptions = topOptions + 37dip
				topOptions = topOptions
				svOptions.Panel.Height = svOptions.Panel.Height + 48dip
			
			End If
			
		Next
		
		sp1.SetItems(0,lsData)
		
	Next
	
	Dim divid As Label
	divid.Initialize("")
	divid.Color = Colors.RGB(212,212,212)
	
	Dim bt As Button
	bt.InitializeCustom("lbladd2cart",Colors.White,Colors.Gray)
	Library.GetButtonState(bt)
	bt.Text = Library.GetStringResourse("add2cartbtn")
	bt.CustomLabel.Font = Library.GetFont(14)
	
	Dim btcancel As Button
	btcancel.InitializeCustom("btnback_options",Colors.White,Colors.Gray)
	Library.GetButtonState(btcancel)
	btcancel.Text = Library.GetStringResourse("cancel")
	btcancel.CustomLabel.Font = Library.GetFont(14)
	
	svOptions.Panel.AddView(divid,10,topOptions + 4,Library.GetWidth-20dip-20,1)
	svOptions.Panel.AddView(bt,0,topOptions+30dip,120dip,40dip)
	svOptions.Panel.AddView(btcancel,svOptions.Panel.Width - 140dip,topOptions+30dip,120dip,40dip)
	'Library.CenterView(bt,svOptions.Panel)
	
	svOptions.ContentWidth = svOptions.Width
	svOptions.ContentHeight = topOptions+300
	
End Sub

Sub btnback_options_Click
	pnlOptions.SetLayoutAnimated(500,1,0,pnlOptions.Height,pnlOptions.Width,pnlOptions.Height)
	btnoptions.SetLayoutAnimated(800,1,btnoptions.Left,Library.GetHeight - btnoptions.Height - 40dip,btnoptions.Width,btnoptions.Height)
End Sub

Sub GetCartOptions As Map
	
	Dim Options,vals As Map
	Options.Initialize
	vals.Initialize
	
	For i = 0 To ListOptions.Size - 1
		
		Dim v1 As View
		Dim data As Map
		v1 = ListOptions.Get(i)
		data = v1.Tag
		
		#Region get text string
		If v1 Is TextField Then
			Dim txt1 As TextField
			txt1 = v1
			vals.Put(data.Get("ID"),txt1.Text)
		#End Region
		
		#Region get choosen radio
		Else If v1 Is Switch Then
			Dim rb1 As Switch
			rb1 = v1
			
			If rb1.Value = True Then
				vals.Put(data.Get("ID"),data.Get("Val"))
			End If
		#End Region
		
		#Region Get Select data
		Else If v1 Is Picker Then
			Dim sp1 As Picker
			sp1 = v1
			
			Dim l1 As List
			l1 = data.Get("Vals")
			
			Dim choosen As String
			choosen = sp1.GetSelectedItem(0)
				
			For t = 0 To l1.Size - 1
				Dim tempChoose As Map
				tempChoose = l1.Get(t)
				
				Dim price_format As String
				price_format = tempChoose.Get("price_formated")
				If price_format = "false" Then price_format = " )"
				
				If tempChoose.Get("name") & " ( " & tempChoose.Get("price_prefix") & price_format = choosen Or choosen.IndexOf(tempChoose.Get("name")) > -1 Then
					vals.Put(data.Get("id"),tempChoose.Get("product_option_value_id"))
					Continue
				End If
				
			Next
		
		#End Region
		
		#Region Get selected checkbox
		Else If v1 Is Switch Then
			Dim chk1 As Switch
			chk1 = v1
			
			If chk1.Value = True Then
				If vals.ContainsKey(data.Get("ID")) Then
					vals.Put(data.Get("ID"),vals.Get(data.Get("ID")) & "<!>" & data.Get("Val"))
				Else
					vals.Put(data.Get("ID"),data.Get("Val"))
				End If
			End If
		
		End If
		#End Region
	Next
	
	For Each vv As String In vals.Keys
		Dim te As String
		te = vv
		If te.IndexOf("<!>") > -1 Then
			Dim s1() As String
			s1 = Regex.Split("<!>",te)
			
			Dim valid_val As List
			valid_val.Initialize
			
			For o = 0 To s1.Length - 1
				valid_val.Add(s1(o))
			Next
			
			vals.Put(vv,valid_val)
		End If
	Next
	
	Options.Put("options",vals)
	
	Return vals
	
End Sub

Sub txtoption_BeginEdit

	Dim hasfocus As Boolean
	hasfocus = True
	
	If hasfocus Then

		Dim ed As TextField
		ed = Sender
		
		If ed.IsInitialized = False Then Return
		
		Dim data As Map
		data = ed.Tag
		
		Dim sType As String
		sType = data.Get("Type")
		
		If sType = "date" Then
			
			Dim Arrdate() As Int
			Arrdate = Library.ParseDate(ed.Text)
			
			currentTextField = ed
			
			MakeDateDialog(Arrdate(0),Arrdate(1),Arrdate(2))
			
		Else If sType = "time" Then
			
			Dim Arrtime() As Int
			Arrtime = Library.ParseTime(ed.Text) 
			currentTextField = ed
			MakeTimeDialog(Arrtime(0),Arrtime(1),Arrtime(2))
		
		Else If sType = "datetime" Then
			
			currentTextField = ed
			IsDateTime = True
			MakeDateDialog(Arrdate(0),Arrdate(1),Arrdate(2))
			
		End If

	End If
	
End Sub

Sub lbloptions_Click
	sv1.ScrollTo(0,topOptions,True)
End Sub

Sub lblattr_Click
	sv1.ScrollTo(0,topAttr,True)
End Sub

Sub btnadd_2_cart_Click
	
	Dim b1 As Button
	b1 = Sender
	
	Library.Add2Cart(b1.Tag,"1",Me)
	
End Sub

Sub Add2Cart2_receive(res As Map,cat As String)
	
	Library.HUD.ProgressDialogHide
	
	If res.ContainsKey("error") Then
		
		Dim rs As Map
		
		rs = res.Get("error")
		
		If rs.ContainsKey("option") Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("cannot_add_cart"),2,True)
			product = CreateMap("product_id":Library.ProductChoosenID)
			Library.ProductChoosenID = 0
			ShowOptionsPanel
			Return
		End If
		
	End If
	
	If res.Get("success") = True Then
		sv1.ScrollOffsetY = 0
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("add2cart"),2,True)
	End If
	
	Library.ProductChoosenID = 0
	
End Sub

Sub btnsearch_Click
	Library.LastPage = Library.ProductPage
	actSearch.StartActivity
End Sub

Sub lblpayment_Click

	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),2,False)
		Return
	End If
	
	If Library.loginDetails.IsInitialized Then
		If Library.loginDetails.Get("login") = True Then
			If DateTime.Now - Library.loginDetails.Get("expire")  > 1010020 Then
				'Activity.Finish
				'StartActivity(actLogin)
				Return
			End If
			'StartActivity(actDoOrder)
			Return
		End If
	End If
	
	If Library.GuestLogin.IsInitialized Then
		If Library.GuestLogin.Get("login") = True Then
			'StartActivity(actDoOrder)
			Return
		End If
	End If
	
End Sub

Sub sv1_ScrollChanged (OffsetX As Int, OffsetY As Int)
	
	If OffsetY > pnlads.top + pnlads.Height And FixPanelHeader = False Then
	
		FixPanelHeader = True
		
		Dim pnl As Panel
		pnl = pnlheader
		Dim w,h As Int
		w = pnlheader.Width
		h = pnlheader.Height
		pnlheader.RemoveViewFromParent
		Library.ProductPage.RootPanel.AddView(pnl,0,0,w,h)
		pnl.Color = Library.Theme_Header
		btnbasket.CustomLabel.TextColor = Colors.White
		btnbookmark.CustomLabel.TextColor = Colors.White
		btnshare.CustomLabel.TextColor = Colors.White
		btnsearch.CustomLabel.TextColor = Colors.White
		btnback.CustomLabel.TextColor = Colors.White
		btnqr.CustomLabel.TextColor = Colors.White
		btnback.CustomLabel.TextColor = Colors.White
		If product.Get("quantity") > 0 Then pnlBasket.Visible = True
		pnl.Visible = False
		pnl.Visible = True
		
	Else If OffsetY < pnlads.top + pnlads.Height And FixPanelHeader = True Then
		FixPanelHeader = False
		Dim pnl As Panel
		pnl = pnlheader
		Dim w,h As Int
		w = pnlheader.Width
		h = pnlheader.Height
		pnlheader.RemoveViewFromParent
		pnlBasket.Visible = False
		sv1.Panel.AddView(pnl,0,0,w,h)
		pnl.Color = Colors.White
		btnbasket.CustomLabel.TextColor = Colors.Gray
		btnbookmark.CustomLabel.TextColor = Colors.Gray
		btnshare.CustomLabel.TextColor = Colors.Gray
		btnsearch.CustomLabel.TextColor = Colors.Gray
		btnback.CustomLabel.TextColor = Colors.Gray
		btnqr.CustomLabel.TextColor = Colors.Gray
		btnback.CustomLabel.TextColor = Colors.Gray
		
	End If
	
End Sub

Sub btncategory_Click
	actCategory.StartActivity
End Sub

Sub btnqr_Click

	If pnlQR.IsInitialized = False Then
		
		pnlQR.Initialize("pnlqr")
		pnlQR.Color = Colors.ARGB(210,72,72,72)
		Library.ProductPage.RootPanel.AddView(pnlQR,0,0,Library.GetWidth,Library.GetHeight)
		pnlQR.Visible = False
		
		Dim im As ImageView
		im.Initialize("")
		pnlQR.AddView(im,0,0,250,250)
		im.ContentMode = im.MODE_FILL
		Library.CenterView2(im,pnlQR)
		
		Dim NativeMe As NativeObject = Me
	NativeMe.RunMethod("createQRForString::", Array (Library.GetStringResourse("url") & "/index.php?route=product/product&product_id=" & product.Get("id"),im))

	#If OBJC
	- (void)createQRForString:(NSString *)qrString :(UIImageView *)qrImageView
	{
	  // Need To convert the string To a UTF-8 encoded NSData object
	  NSData *stringData = [qrString dataUsingEncoding: NSISOLatin1StringEncoding];

	  // Create the filter
	  CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
	  // Set the message content And error-correction level
	  [qrFilter setValue:stringData forKey:@"inputMessage"];
	  [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
	 
	   // Remove blur effect with scaling
	   CGAffineTransform transform = CGAffineTransformMakeScale(100.0f,100.0f);
	   CIImage *qrOutput = [qrFilter.outputImage imageByApplyingTransform: transform];

	   //Convert CIImage to UIImage
	   UIImage *qrImage = [[UIImage alloc] initWithCIImage:qrOutput];
	 
	   //Set Image to ImageView
	   [qrImageView setImage:qrImage];
	}
	#End If
	#end region
	
		pnlQR.Visible = True
		
		Return
			
	End If
	
	If pnlQR.Visible = False Then
		pnlQR.Visible = True
	Else
		pnlQR.Visible = False
	End If
	
End Sub

Sub pnlqr_Click
	pnlQR.Visible = False
End Sub

Sub FinishMe
	Library.NavControl.ShowPage(Library.MenuPage)
End Sub

Sub btnback_Click
	timerSlideshow.Enabled = False
	pnltimer.Visible = False
	pnltimer.Visible = False
	timerSpecial.Enabled = False
	Library.NavControl.ShowPage(Library.RefererPage)
End Sub

Sub LoadProductHorizontalScroll(res As List,ScrollView1 As ScrollView) As Int
	
	Dim left As Int = 20
	
	Dim Dimension() As Int
	Dimension = Library.GetParentPanelDimension("frmproduct_template")
	
	For i = 0 To res.Size - 1
	
		Dim temp As Map
		temp = res.Get(i)
		
		AddProduct2Panel(ScrollView1,left,Dimension,temp)

		left = left + Dimension(0) + 10dip
		
	Next
	
	ScrollView1.Panel.Width = left
	ScrollView1.ContentWidth = left
	
	Return Dimension(0)
	
End Sub

Sub AddProduct2Panel(ScrollView1 As ScrollView, Left As Int,Dimension() As Int,temp As Map)

		Dim pa As Panel
		pa.Initialize("")
		ScrollView1.Panel.AddView(pa,Left,0,Dimension(0),0)
		pa.LoadLayout("frmproduct_template")
		pa.Height = Dimension(1)

		#Region Add value to view
		Dim imgTemp As ImageView
		'Dim btncart As Button
		Dim TempLabel,LabelPrice As Label
		Dim TempPanel As Panel
		Dim ParentPanel As Panel = pa.GetView(0)
		
		'btncart = ParentPanel.GetView(5)
		imgTemp = ParentPanel.GetView(4)
		TempLabel = ParentPanel.GetView(1)
		LabelPrice = ParentPanel.GetView(2)
		TempPanel = ParentPanel.GetView(6)
		TempLabel.Text = temp.Get("name")
		TempLabel.Text = TempLabel.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")

		Dim price,special As String
		
		If temp.ContainsKey("price_formated") Then
			price   = temp.Get("price_formated")
		Else
			price   = temp.Get("price")
		End If
		
		If temp.ContainsKey("special_formated") Then
			special = temp.Get("special_formated")
		Else If temp.ContainsKey("special") Then
			special = temp.Get("special")
		End If
		
		If special = "null" Or special = "false" Or special = "0" Then special = ""
		
		If Library.IsPersian Then
			Library.SetFont(LabelPrice,"",14)
			Library.SetFont(TempLabel,"",14)
		End If
		
		If price.Length > 0 And special.Length = 0 Then
			LabelPrice.Text = price
		Else If special.Length > 0 Then
			Library.DiscountStyleLabel(price,special,LabelPrice)
		End If
			
		Dim PathImage As String
		
		If temp.ContainsKey("image") Then 
			PathImage = temp.Get("image")
		Else If temp.ContainsKey("thumb") Then
			PathImage = temp.Get("thumb")
		End If
		
		If PathImage.ToLowerCase = "null" Or PathImage.Length = 0 Then
			imgTemp.Bitmap = LoadBitmap(File.DirAssets,"noimage.png")
		Else
			Dim img As Map
			img.Initialize
			img.Put(imgTemp,PathImage)
			Dim imgdownloader As ImageDownloader
			imgdownloader.Initialize
			imgdownloader.Download(img)
		End If

		If TempPanel.Tag = "over" Then
			TempPanel.Tag = temp
		Else If TempPanel.Tag = "topbar" Then
			TempPanel.Color = Library.Theme_Header
		End If

		#End Region
		
		
End Sub

Sub MakeDateDialog(Year As String,Month As String,Day As String)
	
	pnlcustomdialog.LoadLayout("frmdatetime")
	
	Dim currday,currmonth,curryear As String
	
	lblyear.Text = Library.GetStringResourse("year")
	lblmonth.Text = Library.GetStringResourse("month")
	lblday.Text = Library.GetStringResourse("day")
	
	lblyear.TextAlignment = Library.GetStringResourse("direction_ios")
	lblmonth.TextAlignment = Library.GetStringResourse("direction_ios")
	lblday.TextAlignment = Library.GetStringResourse("direction_ios")
	
	btnok_date.Text = Library.GetStringResourse("ok")
	btncancel_date.Text = Library.GetStringResourse("cancel")
	Library.GetButtonState(btncancel_date)
	Library.GetButtonState(btnok_date)
	
	lblyear.Font = Library.GetFont(14)
	lblmonth.Font = Library.GetFont(14)
	lblday.Font = Library.GetFont(14)
	
	If Year = 0 And Month = 0 And Day = 0 Then
		If Library.IsPersian = False Then
			currday = DateTime.GetDayOfMonth(DateTime.Now)
			currmonth = DateTime.GetMonth(DateTime.Now)
			curryear = DateTime.GetYear(DateTime.Now)
		Else
			Dim date1,date2() As String
			date1 = Library.Julian2Persian(DateTime.GetYear(DateTime.Now),DateTime.GetMonth(DateTime.Now),DateTime.GetDayOfMonth(DateTime.Now),"/")
			date2 = Regex.Split("/",date1)
			currday = date2(2)
			currmonth = date2(1)
			curryear = date2(0)
		End If
	Else
		currday = Day
		currmonth = Month
		curryear = Year
	End If
	
	Dim lsyear,lsmonth,lsday As List
	lsyear.Initialize
	lsmonth.Initialize
	lsday.Initialize
	
	Dim month_index,day_index,year_index As Int
	
	For i = 1 To 31
		If i < 13 Then
			
			lsmonth.Add(i)

			If i = currmonth And currmonth <> 0 Then
				month_index = i-1
			Else If i = currmonth Then
				month_index = i-1
			End If
			
		End If
		
		lsday.Add(i)
		
		If i = currday And currday <> 0 Then
			day_index = i-1
		Else If i = currday Then
			day_index = i-1
		End If
		
	Next
	
	Dim sFrom As Int = 1900
	Dim sTo As Int = 2090
	
	If Library.IsPersian Then
		sFrom = 1350
		sTo = 1900
	End If
	
	For j = sFrom To sTo
		lsyear.Add(j)
	Next
	
	txtyear.SetItems(0,lsyear)
	
	txtmonth.SetItems(0,lsmonth)
	txtmonth.SelectRow(0,month_index,True)
	
	txtday.SetItems(0,lsday)
	txtday.SelectRow(0,day_index,True)
	
	For s = 0 To txtyear.GetItems(0).Size - 1
		
		Dim tem As String
		tem = txtyear.GetItems(0).Get(s) 
		
		If tem = curryear Then
			year_index = s
		Else If txtyear.GetItems(0).Get(s) = curryear Then
			year_index = s
		End If
		
	Next
	
	txtyear.SelectRow(0,year_index,True)
	
	pnlcustomdialog.BringToFront
	pnlcustomdialog.Visible = True
	
	Library.ProductPage.ResignFocus
	
End Sub

Sub btncancel_date_Click
	pnlcustomdialog.RemoveAllViews
	pnlcustomdialog.Visible = False
End Sub

Sub btnok_date_Click
	
	btncancel_date_Click
	currentTextField.Text = $"${txtyear.GetSelectedItem(0)}/${txtmonth.GetSelectedItem(0)}/${txtday.GetSelectedItem(0)}"$
	
	If IsDateTime Then
		MakeTimeDialog(0,0,0)
	End If
	
End Sub

Sub MakeTimeDialog(Hour As String,Minute As String,Second As String)
	
	pnlcustomdialog.LoadLayout("frmtime")
	
	Dim currsecond,currminute,currhour As String
	
	lblhour.Text = Library.GetStringResourse("hour")
	lblminute.Text = Library.GetStringResourse("minute")
	lblsecond.Text = Library.GetStringResourse("second")
	
	lblhour.TextAlignment = Library.GetStringResourse("direction_ios")
	lblminute.TextAlignment = Library.GetStringResourse("direction_ios")
	lblsecond.TextAlignment = Library.GetStringResourse("direction_ios")
	
	btnok_time.Text = Library.GetStringResourse("ok")
	btncancel_time.Text = Library.GetStringResourse("cancel")
	Library.GetButtonState(btncancel_time)
	Library.GetButtonState(btnok_time)
	
	lblhour.Font = Library.GetFont(14)
	lblminute.Font = Library.GetFont(14)
	lblsecond.Font = Library.GetFont(14)
	
	If Hour = 0 And Minute = 0 And Second = 0 Then
		currhour = DateTime.GetHour(DateTime.Now)
		currminute = DateTime.GetMinute(DateTime.Now)
		currsecond = DateTime.GetSecond(DateTime.Now)
	Else
		currhour = Hour
		currminute = Minute
		currsecond = Second
	End If
	
	Dim lshour,lsminute,lssecond As List
	lshour.Initialize
	lsminute.Initialize
	lssecond.Initialize
	
	Dim hour_index,minute_index,second_index As Int
	
	For i = 1 To 59
	
		If i < 13 Then
			
			lshour.Add(i)

			If i = currhour And currhour <> 0 Then
				hour_index = i-1
			Else If i = currhour Then
				hour_index = i-1
			End If
			
		End If
		
		lsminute.Add(i)
		lssecond.Add(i)
		
		If i = currsecond And currsecond <> 0 Then
			second_index = i-1
		Else If i = currsecond Then
			second_index = i-1
		End If
		
		If i = currminute And currminute <> 0 Then
			minute_index = i-1
		Else If i = currsecond Then
			minute_index = i-1
		End If
		
	Next
	
	txthour.SetItems(0,lshour)
	txthour.SelectRow(0,hour_index,True)
	
	txtminute.SetItems(0,lsminute)
	txtminute.SelectRow(0,minute_index,True)
	
	txtsecond.SetItems(0,lssecond)
	txtsecond.SelectRow(0,second_index,True)
	
	pnlcustomdialog.BringToFront
	pnlcustomdialog.Visible = True
	Library.ProductPage.ResignFocus
	
End Sub

Sub btncancel_time_Click
	
	pnlcustomdialog.RemoveAllViews
	pnlcustomdialog.Visible = False
	IsDateTime = False
	
End Sub

Sub btnok_time_Click
	
	btncancel_date_Click
	
	If IsDateTime Then
		currentTextField.Text = currentTextField.Text & " " & $"${txthour.GetSelectedItem(0)}:${txtminute.GetSelectedItem(0)}:${txtsecond.GetSelectedItem(0)}"$
	Else
		currentTextField.Text = $"${txthour.GetSelectedItem(0)}:${txtminute.GetSelectedItem(0)}:${txtsecond.GetSelectedItem(0)}"$
	End If
	
	IsDateTime = False
	
End Sub

Sub btnoptions_Click
	ShowOptionsPanel
End Sub

Sub btnmore_Click
	
	Dim style As String
	style = "<style>body {text-align:justify;line-height:25px;"
	
	If Library.IsPersian Then
		style = style & "direction:rtl;}</style>"
	Else
		style = style & "direction:ltr;}</style>"
	End If
	
	Dim ks As String
	ks = product.Get("description")
	wballdesc.LoadHtml(style & ks)
	
	pnlwb.Visible = True
	
End Sub

Sub btnclose_wb_Click
	pnlwb.Visible = False
End Sub