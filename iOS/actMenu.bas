Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
Sub Process_Globals

	Private TimerPush As Timer
	
	Dim slidepanel1 As ScrollView
	Private timerSlideshow As Timer
	Private isOffline As Boolean
	Private svhNewProduct,svhFeatureProduct,svhBestProduct As ScrollView
	Private sv1 As ScrollView
	Private lbltitle As Label
	Private btnbasket As Button
	Private lblheadername As Label
	Private lblnext As Label

	Dim FeatureProduct,NewProduct,BestProduct,Slideshow,opManufacturers As OpenCart
	Private pnlheader As Panel
	
	Private offsetSlideshow As Int = 0
	
	Private lblslidetitle As Label
	
	Private pnlheadert As Panel
	Private pnlheaderproduct As Panel

	Private pnlloading As Panel
	
	Private lblpb As Label
	
	Private pnlads As Panel
	
	Private pbslideshow As ProgressView
	Private pnloverheader As Panel
	Private lblbasket As Label
	
	Private pnlcircle As Panel
	Private bullet As List
	
	Dim svH As ScrollView
	Dim MyToastMessageShow1 As MyToastMessageShow

	Private btnsearch As Button
	Private btnmenu As Button
	
	Dim btncat As Button
	
	Dim topSV As Int
	Dim sm As SlideMenu
	
End Sub

Sub StartActivity
	
	Library.MenuPage.Initialize("MenuPage")

	TimerPush.Initialize("tmrPush",9000)
	TimerPush.Enabled = True
	
	Library.AddTabbar(Library.MenuPage)
	
	If Library.currLang = "فارسی" Then
		Library.MenuPage.RootPanel.LoadLayout("frmmenu")
	Else
		Library.MenuPage.RootPanel.LoadLayout("frmmenu_en")
	End If
	
	sv1.ContentWidth = Library.GetWidth
	
	Library.NavControl.ShowPage(Library.MenuPage)
	
	MyToastMessageShow1.Initialize(Library.MenuPage.RootPanel)
	
	pnlheader.Color = Library.Theme_Header
	Library.MenuPage.RootPanel.Color  = Library.Theme_Background
	sv1.Panel.Color = Library.Theme_Background
	Library.SetFont(btnmenu,"icomoon",btnmenu.CustomLabel.Font.Size)
	Library.SetFont(btnbasket,"icomoon",btnbasket.CustomLabel.Font.Size)
	Library.SetFont(btnsearch,"icomoon",btnsearch.CustomLabel.Font.Size)
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	lbltitle.Text = ""
	topSV = 0
	
	#Region Slide
	Dim slide As Panel
	slide.Initialize("")
	sv1.Panel.AddView(slide,0,0,sv1.Width,0)
	slide.LoadLayout("frmslideshow_panels")
	slide.Height = pnlads.Height + pnlcircle.Height
	slide.Color = Colors.Transparent
	topSV = slide.Height + pnlcircle.Height - 10dip
	sv1.Panel.Height = topSV
	#End Region
	
	btncat.Initialize("btncat",btncat.STYLE_SYSTEM)
	
	topSV = topSV + 5
	sv1.Panel.AddView(btncat,0,topSV,80%x,40dip)
	
	btncat.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	btncat.Text = Library.GetStringResourse("category")
	btncat.CustomLabel.TextColor = Colors.White
	btncat.TintColor = Colors.White
	btncat.CustomLabel.Font = Library.GetFont(14)
	Library.CenterView(btncat,sv1)
	
	topSV = topSV + 60dip
	
	FeatureProduct.Initialize
	NewProduct.Initialize
	BestProduct.Initialize
	Slideshow.Initialize
	
	lblpb.Text = Library.GetStringResourse("loading")
	lbltitle.Text = Library.GetStringResourse("app_title")
	
	#Region Load data main page
	
	If Library.listSlideshow.IsInitialized Then
		LoadSlideshow(Library.listSlideshow)
	Else
		Slideshow.GetSlideshow(Me,"slideshow_receive")
	End If
 
	If Library.NewProduct.IsInitialized Then
		isOffline = True
		topSV = AddHeader(Library.GetStringResourse("newproduct"),"newproduct",topSV)
		svhNewProduct.Initialize(0,sv1.Width,210dip)
		sv1.Panel.AddView(svhNewProduct,0,topSV,sv1.Width,210dip)
		topSV = topSV + LoadProductHorizontalScroll(Library.NewProduct,svhNewProduct) + 70dip
		Dim v As View
		v = svhNewProduct.Panel.GetView(0)
		v.Top = 0
	Else
		If Library.InternetState = False Then
			pnlloading.Visible = False
		Else
			NewProduct.GetSpecialProduct("latest",True,Library.GetLimitLoadItem,Me,"NewProduct_receive")
		End If
	End If
	
	If Library.FeatureProduct.IsInitialized Then
		If Library.FeatureProduct.Size > 0 Then
			topSV = AddHeader(Library.GetStringResourse("featureproduct"),"featureproduct",topSV)
			svhFeatureProduct.Initialize(0,sv1.Width,210dip)
			sv1.Panel.AddView(svhFeatureProduct,0,topSV,sv1.Width,210dip)
			topSV = topSV + LoadProductHorizontalScroll(Library.FeatureProduct,svhFeatureProduct) + 70dip
		
			Dim v As View
			v = svhFeatureProduct.Panel.GetView(0)
			If v.IsInitialized Then v.Top = 0
 		End If
	End If
	
	If Library.BestProduct.IsInitialized Then
		sv1.Panel.Height = sv1.Panel.Height - 180dip
		topSV = AddHeader(Library.GetStringResourse("bestproduct"),"bestproduct",topSV)
		svhBestProduct.Initialize(0,sv1.Width,210dip)
		sv1.Panel.AddView(svhBestProduct,0,topSV,sv1.Width,210dip)
		topSV = topSV + LoadProductHorizontalScroll(Library.BestProduct,svhBestProduct) + 70dip
		sv1.Panel.Height = sv1.Panel.Height + 180dip
		sv1.ContentHeight = sv1.Panel.Height
'		Dim v As View
'		v = svhBestProduct.Panel.GetView(0)
'		If v.IsInitialized Then v.Top = 0
	Else
		sv1.Panel.Height = sv1.Panel.Height + 100dip
		sv1.ContentHeight = sv1.Panel.Height
	End If
	
	opManufacturers.Initialize

	If Library.listManufacturers.IsInitialized Then
		LoadManufacturers(Library.listManufacturers)
	End If
	
	#End Region
	
	If isOffline = True Then
		pnlloading.Visible = False
	End If
	
	sm.Initialize(100dip,Me)
	
	pnlloading.Visible = False
	
End Sub

Sub NewProduct_receive(Res As List,category As String)
	
	Library.NewProduct.Initialize
	Library.NewProduct = Res
	
	topSV = AddHeader(Library.GetStringResourse("newproduct"),"newproduct",topSV)
	
	svhNewProduct.Initialize(0,sv1.Width,210dip)
	sv1.Panel.AddView(svhNewProduct,0,topSV,sv1.Width,210dip)
	topSV = topSV + LoadProductHorizontalScroll(Res,svhNewProduct) + 70dip
	
	Dim v As View
	v = svhNewProduct.Panel.GetView(0)
	v.Top = 0
		
	FeatureProduct.GetSpecialProduct("featured",False,Library.GetLimitLoadItem,Me,"FeatureProduct_receive")
	
	sv1.ScrollOffsetX = 0
	sv1.ContentHeight = topSV

End Sub

Sub FeatureProduct_receive(Res As List,category As String)
	
	Library.FeatureProduct.Initialize
	Library.FeatureProduct = Res
	
	
	If Res.Size > 0 Then
		topSV = AddHeader(Library.GetStringResourse("featureproduct"),"featureproduct",topSV)
		svhFeatureProduct.Initialize(0,sv1.Width,210)
		sv1.Panel.AddView(svhFeatureProduct,0,topSV,sv1.Width,210dip)
		topSV = topSV + LoadProductHorizontalScroll(Library.FeatureProduct,svhFeatureProduct) + 70dip
		
		Dim v As View
		v = svhFeatureProduct.Panel.GetView(0)
		v.Top = 0
	End If
	
	sv1.Panel.Height = sv1.Panel.Height + 180dip
	sv1.ContentHeight = sv1.Panel.Height
	
	BestProduct.GetSpecialProduct("bestsellers",False,Library.GetLimitLoadItem,Me,"bestproduct_receive")
	
End Sub

Sub bestproduct_receive(Res As List,category As String)
	
	Library.BestProduct.Initialize
	Library.BestProduct = Res
	
	CacheData.AddProducts2Cache(Res,"best")
	CacheData.AddProducts2Cache(Library.NewProduct,"new")
	CacheData.AddProducts2Cache(Library.FeatureProduct,"feature")
	
	If Res.Size > 0 Then
		topSV = AddHeader(Library.GetStringResourse("bestproduct"),"bestproduct",topSV)
		svhBestProduct.Initialize(0,sv1.Width,210dip)
		sv1.Panel.AddView(svhBestProduct,0,topSV,sv1.Width,210dip)
		topSV = topSV + LoadProductHorizontalScroll(Library.BestProduct,svhBestProduct) + 70dip
		sv1.Panel.Height = sv1.Panel.Height + 180dip
		Dim v As View
		v = svhBestProduct.Panel.GetView(0)
		v.Top = 0
	End If
	
	sv1.Panel.Height = sv1.Panel.Height + 180dip
	sv1.ContentHeight = sv1.Panel.Height
	
	opManufacturers.GetManufacturers(Me,"Manufacturers_receive")
	
End Sub

#Region Activity Event

Sub ResumeApp
	
	If timerSlideshow.IsInitialized Then
		timerSlideshow.Enabled = True
	End If
	
	If Library.currLang.ToLowerCase <> Library.manager.GetString("lang").ToLowerCase Then
		
		If Library.loginDetails.IsInitialized Then
			Library.loginDetails.Put("login",False)
		End If
		
		File.Delete(File.DirLibrary,"cache_category2")
		File.Delete(File.DirLibrary,"cache_category_product2")
		File.Delete(File.DirLibrary,"cache_string_file")
		
		Library.NavControl.ShowPage(Library.MainPage)
		Return
	
	End If
	
	GetCart
	
	Dim opWish As OpenCart
	opWish.Initialize
	opWish.Wishlist(Me,"WishList_receive","")
	
End Sub

Sub WishList_receive(res As Map,cat As String)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim m1 As Map
			Dim ls As List
			m1 = res.Get("data")
			ls = m1.Get("products")
			Library.wishlist = Library.GetStringResourse("bookmark") & $" ( ${ls.Size} )"$
		End If
	End If
	
End Sub

#End Region

Sub AddHeader(Title As String,Tag As String,Top As Int) As Int
	
	Dim p1 As Panel
	p1.Initialize("")
	sv1.Panel.AddView(p1,0,Top,sv1.Width,0)
	
	If Library.manager.GetString("lang") = "فارسی" Then
		p1.LoadLayout("frmheader_template")
	Else
		p1.LoadLayout("frmheader_template_en")
	End If
	
	p1.Height = pnlheadert.Height
	lblheadername.Text = Title
	pnloverheader.Tag = Tag
	lblheadername.Font = Library.GetFont(lblheadername.Font.Size)
	Library.SetFont(lblnext,"icomoon",lblnext.Font.Size)
	Top = Top + p1.Height + 4dip
	
	Dim c1 As Int
	c1 = Library.Theme_Header
	pnlheaderproduct.Color = c1
	pnlheaderproduct.SetBorder(0,Colors.White,16dip)
	
	sv1.Panel.Height = sv1.Panel.Height + p1.Height
	
	Return Top
	
End Sub

Sub Manufacturers_receive(res1 As Map,category As String)
	
	pnlloading.Visible = False
	
 	Dim res As List
	res = res1.Get("data")
	
	Library.listManufacturers.Initialize
	Library.listManufacturers = res

	CacheData.AddProducts2Cache(res,"manufacturers")
	
	LoadManufacturers(res)
	
	sv1.Panel.Height = sv1.Panel.Height + 100dip
	
End Sub

Sub LoadManufacturers(res As List)
	
	If res.Size > 0 Then
		
		If svH.IsInitialized Then
			If svH.Panel.NumberOfViews > 0 Then Return
		End If
		
		topSV = AddHeader(Library.GetStringResourse("manufacture"),"",topSV)
		
		If Library.GetDevicePhysicalSize < 7 Then
			svH.Initialize("svH",res.Size * 83dip + 20dip,120dip)
			sv1.Panel.AddView(svH,0,topSV,sv1.Width,75dip)
		Else
			svH.Initialize("svH",res.Size * 170dip + 20dip,120dip)
			sv1.Panel.AddView(svH,0,topSV,sv1.Width,155dip)
		End If
		
		svH.Panel.Color = Colors.White
		
		topSV = topSV + svH.Height
		
		Dim left As Int = 0
		Dim images As Map
		images.Initialize
		
		For i = 0 To res.Size - 1
			
			Dim temp As Map
			temp = res.Get(i)
			
			Dim img As ImageView
			img.Initialize("imgmanufacturers")
			
			svH.Panel.AddView(img,left,5,svH.Height-10dip,svH.Height-10dip)
			left = left + svH.Height + 10dip
			
			img.ContentMode = img.MODE_FIT
			images.Put(img,temp.Get("image"))

			img.Tag = temp.Get("manufacturer_id")
			
		Next
		
		Dim imgd As ImageDownloader
		imgd.Initialize
		imgd.Download(images)
		
		topSV = topSV + 12dip
		svH.ContentWidth = left
		svH.ContentHeight = svH.Height
		
		sv1.Panel.Height = topSV + 30dip
		sv1.ContentHeight = sv1.Panel.Height + 30dip
		svH.Color = Colors.White
		
	End If	
	
End Sub

#Region Slideshow

Sub slideshow_receive(res As List,category As String)
	
	Library.listSlideshow.Initialize
	Library.imagesSlideshow.Initialize
	Library.listSlideshow = res
	bullet.Initialize
	
	CacheData.AddProducts2Cache(res,"slideshow")
	
	LoadSlideshow(res)
	
End Sub

Sub LoadSlideshow(res As List)
 
 	If offsetSlideshow >= res.Size Then offsetSlideshow = 0
	
	Dim im,firstslide As Map
	im.Initialize
	firstslide.Initialize
	firstslide = res.Get(offsetSlideshow)
	
	slidepanel1.Initialize("slideshowsv",pnlads.Width,pnlads.Height)
	
	Dim images As Map
	images.Initialize
	
	Dim left As Int
	
	slidepanel1.PagingEnabled = True
	
	For i = 0 To res.Size - 1
	
		Dim p1 As Panel
		p1.Initialize("pnlImage")
		p1.Color = Library.Theme_Background
		slidepanel1.Panel.AddView(p1,left,0,pnlads.Width,pnlads.Height)
		
		Dim m1 As Map
		m1 = res.Get(i)
		
		Dim im1 As ImageView
		im1.Initialize("imgads")
		Library.imagesSlideshow.Add(im1)
		
		p1.AddView(im1,0,0,pnlads.Width,pnlads.Height)
		im1.Tag = m1
		im1.ContentMode = im1.MODE_FILL
		left = left + pnlads.Width
		
		Dim lbl As Label
		lbl.Initialize("")
		lbl.Text = m1.Get("title")
		If Library.IsPersian Then Library.SetFont(lbl,"",17)
		lbl.TextColor = Colors.Black
		lbl.TextAlignment = lbl.ALIGNMENT_CENTER
		
		Dim c1 As Int
		c1 = Colors.ARGB(60,230, 30, 30)
		
		lbl.Color = c1
		p1.AddView(lbl,0,pnlads.Height - 50dip,pnlads.Width,50dip)
		lbl.BringToFront
		
		images.Put(im1,m1.Get("image"))
		
	Next
	
	Dim imagedownload1 As ImageDownloader
	imagedownload1.Initialize
	imagedownload1.Download(images)
	
	slidepanel1.ContentWidth = res.Size * pnlads.Width
	
	pnlads.AddView(slidepanel1,0,0,pnlads.Width,pnlads.Height)
	
	AddBullet(res.Size)
	ChooseBullet(1)
	
	timerSlideshow.Initialize("tmrSlideshow",3600)
	timerSlideshow.Enabled = True
	
End Sub

Sub imgads_Click
	
	Dim im As ImageView
	im = Sender
	Dim te As Map
	te = im.Tag
	ShowSlideContent(te)
	
End Sub

Sub tmrSlideshow_Tick
	
	If Library.imagesSlideshow.IsInitialized = False Then Return
	
	If offsetSlideshow = Library.imagesSlideshow.Size  Then
		offsetSlideshow = 1
		slidepanel1.ScrollTo(0,slidepanel1.Top,True)
		ChooseBullet(offsetSlideshow)
	Else
		slidepanel1.ScrollTo(pnlads.Width * offsetSlideshow,slidepanel1.Top,True)
		offsetSlideshow = offsetSlideshow + 1
		ChooseBullet(offsetSlideshow)
	End If

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

Sub ShowSlideContent(data As Map)

	Try
		
		Dim link As String
		link = data.Get("link")
		link = link.Replace("&amp;","&")
	 	
		Dim ma As Matcher
		ma = Regex.Matcher("product_id=(\d+)",link)
		
		If ma.Find Then
			link = ma.Group(1)
			Dim m1 As Map
			m1.Initialize
			m1.Put("product_id",link)
			actProduct.product = m1
			actProduct.StartActivity
		
		Else
			Library.App.OpenURL(link)
		End If
		
	Catch
	End Try
	
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
		pnlcircle.Width = left
		p1.Tag = i
		bullet.Add(p1)
	Next
	
	Library.CenterView(pnlcircle,pnlads)

End Sub

Sub slideshowsv_ScrollChanged (OffsetX As Int, OffsetY As Int)
	
	Dim i As Int
	i = OffsetX / pnlads.Width
	
	Try
		ChooseBullet(i+1)
	Catch
	End Try
	
End Sub

#End Region

Sub btnmenu_Click
	sm.OpenMenu
End Sub

Sub btnsearch_Click
	Library.LastPage = Library.MenuPage
	actSearch.StartActivity
End Sub

Sub btnbasket_Click

	If Library.InternetState = False Then
		Library.HUD.ToastMessageShow(Library.GetStringResourse2("error_net_title"),False)
		Return
	End If
	
	Library.LastPage = Library.MenuPage
	actBasket.StartActivity
	
End Sub

Sub pnlover_Click
	
	Dim p1 As Panel
	p1 = Sender
	
	Dim temp As Map
	temp = p1.Tag
	
	Library.LastPage = Library.MenuPage
	actProduct.product = temp
	actProduct.StartActivity
	
End Sub

Sub pnlover_LongClick
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.Visible = True
	
	Dim temp As Map
	temp = p1.Tag
	
	Dim sID As String
	
	If temp.ContainsKey("id") Then
		sID = temp.Get("id")
	Else
		sID = temp.Get("product_id")
	End If
	
	Library.Add2Cart(sID,"1",Me)
	
End Sub

Sub pnloverheader_Click
	
	Dim pa As Panel
	pa = Sender
	LoadProductSplit(pa.Tag)
	
End Sub

Sub LoadProductSplit(pa As String)

	Dim op As OpenCart
	op.Initialize
	
	pnlloading.Visible = True
	
	If pa = "bestproduct" Then
		op.GetSpecialProduct("bestsellers",True,6,Me,"allproduct_receive")
	
	Else If pa = "featureproduct" Then
		op.GetSpecialProduct("featured",True,12,Me,"AllProduct_receive")
	
	Else If pa = "newproduct" Then
		op.GetSpecialProduct("latest",True,12,Me,"AllProduct_receive")
	
	End If
	
End Sub

Sub allproduct_receive(res As List,category As String)

	CacheData.AddProducts2Cache(res,category)
	
	pnlloading.SetAlphaAnimated(500,1)
	
	actProducts.res = res
	
	Dim t1 As String
	
	If category = "bestsellers" Then
		t1 = Library.GetStringResourse("bestproduct")
	Else If category = "featured" Then
		t1 = Library.GetStringResourse("featureproduct")
	Else If category = "products" Or category = "latest" Then
		t1 = Library.GetStringResourse("newproduct")
	Else
		t1 = Library.GetStringResourse("relat_product")
	End If
	
	pnlloading.Visible = False
	Library.LastPage = Library.MenuPage
	actProducts.title = t1
	actProducts.StartActivity
	
End Sub

Sub GetCart
	Dim cart As OpenCart
	cart.Initialize
	cart.GetCarts(Me,"Carts_receive")
End Sub

Sub Carts_receive(res As Map,cat As String)
	
	If res = Null Then
		lblbasket.Visible = False
		Return
	End If
	
	Library.CartDetails = res
	Library.ShowCartLabel(lblbasket)
	
End Sub

Sub btncat_Click
	actCategory.StartActivity
End Sub

Sub Logout
	
	pnlloading.Visible = True
	Dim op1 As OpenCart
	op1.Initialize
	op1.Logout(Me,"Logout_receive")
	
End Sub

Sub Logout_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	If res.ContainsKey("success") Then
		If res.Get("success") = 1 Then
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse2("success_logout"),2,True)
			Library.loginDetails.Put("login",False)
			lblbasket.Visible = False
			UpdateUI
		Else
			MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse2("error_net_title"),2,False)
		End If
		
	End If
	
End Sub

Sub btnadd_2_cart_Click
	
	Dim b1 As Button
	b1 = Sender
	
	Library.Add2Cart(b1.Tag,"1",Me)
	
End Sub

Sub Add2Cart2_receive(res As Map,cat As String)
	
	Library.hud.ProgressDialogHide
	
	If res.ContainsKey("error") Then
		
		Dim rs As Map
		
		rs = res.Get("error")
		
		If rs.ContainsKey("option") Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("cannot_add_cart"),True)
			actProduct.product = CreateMap("product_id":Library.ProductChoosenID)
			Library.ProductChoosenID = 0
			actProduct.StartActivity
			Return
		End If
		
	End If
	
	If res.Get("success") = True Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse2("add2cart"),2,True)
		GetCart
	End If
	
	Library.ProductChoosenID = 0
	
End Sub

Sub imgmanufacturers_Click
	
	Dim im As ImageView
	im = Sender
	
	If im.Tag = Null Or im.Tag = "" Then Return
	
	Try
		
		Dim res As List
		res = CacheData.GetProductsFromCache("products/manufacturer/" & im.Tag)
		
		If res.IsInitialized Then
			If res.Size > 0 Then
				pnlloading.Visible = False
				Library.LastPage = Library.MenuPage
				actProducts.title = Library.GetStringResourse2("relat_product")
				actProducts.StartActivity
				Return
			End If
		End If
		
		pnlloading.Visible = True
		
		Dim op As OpenCart
		op.Initialize
		op.GetmanufactureProduct(im.Tag,Me,"AllProduct_receive")
		
	Catch
	End Try
	
End Sub

Sub ReRunApp
	Main.StartActivity
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
		Dim progress As ActivityIndicator
		Dim ParentPanel As Panel = pa.GetView(0)
		
		'btncart = ParentPanel.GetView(5)
		imgTemp = ParentPanel.GetView(4)
		TempLabel = ParentPanel.GetView(1)
		LabelPrice = ParentPanel.GetView(2)
		TempPanel = ParentPanel.GetView(6)
		progress = ParentPanel.GetView(0)
		
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
		
		progress.RemoveViewFromParent
		
		#End Region
		
		
End Sub

Sub UpdateUI
	
	If timerSlideshow.IsInitialized Then
		timerSlideshow.Enabled = True
	End If
	
	ApplySettingChanges
	
	GetCart
	
	Dim opWish As OpenCart
	opWish.Initialize
	opWish.Wishlist(Me,"WishList_receive","")
			
	sm.AddHeader(True)
	
End Sub

Sub ApplySettingChanges
	
	Dim se As Settings
	se.Initialize
	
	If (Library.currLang.ToLowerCase <> se.GetString("lang").ToLowerCase) Or  (Library.currCurrency.ToLowerCase <> se.GetString("curr").ToLowerCase)Then
		
		If Library.loginDetails.IsInitialized Then
			Library.loginDetails.Put("login",False)
		End If
		
		File.Delete(CacheData.DirCache,"cache_category2")
		File.Delete(CacheData.DirCache,"cache_category_product2")
		File.Delete(CacheData.DirCache,"cache_string_file")
		CacheData.DeleteCache
		
		Library.NavControl.ShowPage(Library.MainPage)
		
		Return
		
	End If
	
End Sub

Sub MenuPage_Resize(Width As Int,Height As Int)
	If sv1.ContentHeight < 1000 Then sv1.ContentHeight = 1300
End Sub

Sub MenuPage_Appear
	UpdateUI
End Sub

Sub tmrPush_Tick
	
	If Library.InternetState = False Then
		Return
	End If
	
	Dim hu As HttpJob
	hu.Initialize("push",Me)
	hu.Download(Library.GetStringResourse("url") & "/app/push/new_push.php")
	
End Sub

Sub JobDone(Job As HttpJob)
	
	If Job.Success Then
		If Job.JobName = "push" Then
			Try
				PushNotification.CheckNewPushNotification(Job.GetString2("UTF8"))
			Catch
			End Try
		End If
	End If
	
End Sub
