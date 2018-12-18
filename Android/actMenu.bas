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
	Private timerSlideshow,tmrShowDialogFirst As Timer
	Private topSV As Int = 0
End Sub

Sub Globals
	Private pnlmenuinapp As Panel
	Private Glide As AriaGlide
	Private ScollButton As Button
	Private isOffline As Boolean
	Private svhNewProduct,svhFeatureProduct,svhBestProduct,svhSpecialProduct As HorizontalScrollView
	Private sv1 As ScrollView
	Private lbltitle As Label
	Private btnbasket As Button
	Private lblheadername As Label
	Private lblnext As Label

	Dim FeatureProduct,NewProduct,BestProduct,Slideshow,opManufacturers,opSpecialProduct As OpenCart
	Private pnlheader As Panel
	
	Private offsetSlideshow As Int = 0
	
	Private lblslidetitle As Label
	
	Private pnlheadert As Panel
	Private pnlheaderproduct As Panel

	Private pnlloading As Panel
	Private SlideMenu As SlideMenu
	
	Private lblpb As Label
	
	Private pnlads As Panel
	
	Private pbslideshow As ProgressBar
	Private pnloverheader As Panel
	Private lblbasket As Label
	Dim slidepanel1 As AHPageContainer
	Dim slidepanelPage As AHViewPager
	
	Private pnlcircle As Panel
	Private bullet As List
	
	Dim svH As HorizontalScrollView
	Dim MyToastMessageShow As MyToastMessageShow
	'Dim tip As MSShowTipsBuilder

	Private btnsearch As Button
	Private btnmenu As Button
	
	Private TipTag As String
	Dim titleHelp As String
	Dim btncat As Button
	
	Private BannerScrollView As Map
		
	Private imgbannerid As ImageView
	Private OffsetBannerLoaded As Int
	Private ListBannerLoaded As List
	Private isOffline As Boolean
	
	Private pbloading As ProgressBar
	Private ImageViewList As Map

End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	If Library.IsPersian Then
		Activity.LoadLayout("frmmenu")
	Else
		Activity.LoadLayout("frmmenu_en")
	End If
	
	If Library.manager.GetBoolean("fistshowdialog1") = False Then
		tmrShowDialogFirst.Initialize("tmrshowdialog",6000)
		tmrShowDialogFirst.Enabled = True
	End If

	SlideMenu.Initialize(pnlmenuinapp,Me)
	
	Library.HideScrollbar(sv1)
	
	ScollButton = Library.MakeUpScrollButton(Activity)
	
	MyToastMessageShow.Initialize(Activity)
	opManufacturers.Initialize
	ImageViewList.Initialize
	opSpecialProduct.Initialize
	
	pnlheader.Color = Library.Theme_Header
	Activity.Color  = Library.Theme_Background
	sv1.Panel.Color = Library.Theme_Background
	
	Library.setLocalApp(Library.currLang)
	
	Library.ChangeStatusColor
		
	topSV = 0
	
	#Region Slide
	Dim slide As Panel
	slide.Initialize("")
	sv1.Panel.AddView(slide,0,0,sv1.Width,0)
	slide.LoadLayout("frmslideshow_panels")
	slide.Height = pnlads.Height + pnlcircle.Height
	topSV = slide.Height + pnlcircle.Height
	sv1.Panel.Height = topSV
	#End Region
	
	btncat.Initialize("btncat")
	
	topSV = topSV + 5
	sv1.Panel.AddView(btncat,0,topSV,80%x,40dip)
	
	Dim cd As ColorDrawable
	cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),5,1,Colors.Gray)
	btncat.Background = cd
	btncat.Text = Library.GetStringResourse("category")
	btncat.TextColor = Colors.White
	btncat.TextSize = 14
	btncat.Typeface = Library.GetFont
	Library.CenterView(btncat,Activity)
	topSV = topSV + 60dip
	
	FeatureProduct.Initialize
	NewProduct.Initialize
	BestProduct.Initialize
	Slideshow.Initialize
	
	lblpb.Text = Library.GetStringResourse("loading")
	lbltitle.Text = Library.GetStringResourse("app_title")
	
	#Region Load data main page
	
	If Library.listSlideshow = Null Then
		Dim ls As List
		ls.Initialize
		Library.listSlideshow = ls
	End If
	
	If Library.listSlideshow.IsInitialized Then
		
		LoadSlideshow(Library.listSlideshow)
		
		isOffline = True
		
		If Library.listBanners.IsInitialized Then
			Banners_Receive(Library.listBanners,"")	
		End If
		
	Else
		Slideshow.GetSlideshow(Me,"slideshow_receive")
		Return
	End If
 
	If Library.SpecialProduct.IsInitialized Then
		isOffline = True
		SpecialsProduct_receive(Library.SpecialProduct,"special")
	Else
		If Library.InternetState = False Then
			pnlloading.SetVisibleAnimated(500,False)
		Else
			opSpecialProduct.GetSpecialProduct("specials",True,Library.GetLimitLoadItem,Me,"SpecialsProduct_receive")
		End If
	End If
	
	If Library.NewProduct.IsInitialized Then
		isOffline = True
		NewProduct_receive(Library.NewProduct,"new")
	Else
		If Library.InternetState = False Then
			pnlloading.SetVisibleAnimated(500,False)
		Else
			NewProduct.GetSpecialProduct("latest",True,Library.GetLimitLoadItem,Me,"NewProduct_receive")
		End If
	End If

	If Library.FeatureProduct.IsInitialized Then
		If Library.FeatureProduct.Size > 0 Then
			FeatureProduct_receive(Library.FeatureProduct,"feature")
 		End If
	End If
	
	If Library.BestProduct.IsInitialized Then
		bestproduct_receive(Library.BestProduct,"best")
	Else
		sv1.Panel.Height = sv1.Panel.Height + 100dip
	End If

	If Library.listManufacturers.IsInitialized Then
		
		If CheckShowBannerConfig("manufacture") = True Then
			LoadManufacturers(Library.listManufacturers)
		Else
			sv1.Panel.Height = sv1.Panel.Height + 100dip
			topSV = topSV + 12dip
			sv1.Panel.Height = topSV
			pnlloading.SetVisibleAnimated(600,False)
		End If
		
	End If
	
	#End Region
	
	If isOffline = True Then
		pnlloading.SetVisibleAnimated(500,False)
	End If
	
	CheckPushProduct
	
End Sub

Sub tmrshowdialog_Tick
	
	tmrShowDialogFirst.Enabled = False
	Library.manager.SetBoolean("fistshowdialog1",True)
	
	#if com_apps_mobiledigitell
	If Msgbox2("آیا مایل به عضویت در کانل تلگرام ما هستید؟","توجه","بله","خیر","",Null) = DialogResponse.POSITIVE Then
		Try
			Dim it As PhoneIntents
			StartActivity(it.OpenBrowser("http://telegram.me/digitellir"))
		Catch
			Log(LastException)
		End Try
	End If
	#End If
	
End Sub

Sub CheckPushProduct
	
	If Library.OpenProductFromPush <> "" Then
		actProduct.product = CreateMap("product_id" : Library.OpenProductFromPush)
		Library.OpenProductFromPush	=	""
		StartActivity(actProduct)
	End If
	
End Sub

Sub tips_Click

'	If TipTag = "basket" Then
'		TipTag = "menu"
'		tip.Initialize("tips")
'		tip.setTarget(btnsearch).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_search")).build
'		tip.setButtonText(Library.GetStringResourse("okay"))
'		tip.show
'	
'	Else If TipTag = "menu" Then
'		TipTag = "cat"
'		tip.Initialize("tips")
'		tip.setTarget(btnmenu).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_menu")).build
'		tip.setButtonText(Library.GetStringResourse("okay"))
'		tip.show
'	
'	Else If TipTag = "cat" Then
'		TipTag = "manufacture"
'		tip.Initialize("tips")
'		tip.setTarget(btncat).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_category")).build
'		tip.setButtonText(Library.GetStringResourse("okay"))
'		tip.show
'	
'	Else If TipTag = "manufacture" Then
'		TipTag = ""
'		If svH.IsInitialized = False Then Return
'		
'		sv1.ScrollPosition = svH.Top + svH.Height
'		DoEvents
'		tip.Initialize("tips")
'		tip.setTarget(svH).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(Library.GetStringResourse("help_manufacture") & CRLF & CRLF & CRLF).build
'		tip.setButtonText(Library.GetStringResourse("okay"))
'		tip.show
'	
'	Else
'		sv1.ScrollPosition = 0
'		DoEvents
'		Library.FirstRun = False
'	End If
	
End Sub

Sub SpecialsProduct_receive(res As List,category As String)
	
	If Library.SpecialProduct.IsInitialized = False Then
		Library.SpecialProduct.Initialize
		Library.SpecialProduct = res
	End If
	
	If res <> Null Then
		If res.Size > 0 Then
			
			topSV = AddHeader(Library.GetStringResourse("specialproduct"),"special",topSV)
	
			svhSpecialProduct.Initialize(0,"")
			svhSpecialProduct.Tag = "special"
			sv1.Panel.AddView(svhSpecialProduct,0,topSV,sv1.Width,190dip)
			topSV = topSV + Library.LoadProductHorizontalScroll(res,svhSpecialProduct) + 70dip
			
			Dim v As View
			v = svhSpecialProduct.Panel.GetView(0)
			If v.IsInitialized Then v.Top = 0
			
		End If
	End If
	
	If isOffline = False Then
		NewProduct.GetSpecialProduct("latest",True,Library.GetLimitLoadItem,Me,"NewProduct_receive")
	End If
	
	sv1.ScrollPosition = 0

End Sub

Sub NewProduct_receive(res As List,category As String)
	
	If Library.NewProduct.IsInitialized = False Then
		Library.NewProduct.Initialize
		Library.NewProduct = res
	End If
	
	topSV = AddHeader(Library.GetStringResourse("newproduct"),"newproduct",topSV)
	
	svhNewProduct.Initialize(0,"")
	sv1.Panel.AddView(svhNewProduct,0,topSV,sv1.Width,190dip)
	topSV = topSV + Library.LoadProductHorizontalScroll(res,svhNewProduct) + 70dip
	
	Dim v As View
	v = svhNewProduct.Panel.GetView(0)
	v.Top = 0
	
	If isOffline = False Then
		FeatureProduct.GetSpecialProduct("featured",False,Library.GetLimitLoadItem,Me,"FeatureProduct_receive")
	End If
	
	sv1.ScrollPosition = 0

End Sub

Sub FeatureProduct_receive(res As List,category As String)
	
	If Library.FeatureProduct.IsInitialized = False Then
		Library.FeatureProduct.Initialize
		Library.FeatureProduct = res
	End If
	
	Library.FeatureProduct = res
	
	If res.Size > 0 Then
		topSV = AddHeader(Library.GetStringResourse("featureproduct"),"featureproduct",topSV)
		svhFeatureProduct.Initialize(0,"")
		sv1.Panel.AddView(svhFeatureProduct,0,topSV,sv1.Width,190dip)
		topSV = topSV + Library.LoadProductHorizontalScroll(Library.FeatureProduct,svhFeatureProduct) + 70dip
		
		Dim v As View
		v = svhFeatureProduct.Panel.GetView(0)
		v.Top = 0
		
	End If
	
	sv1.Panel.Height = sv1.Panel.Height + 180dip
	
	If isOffline = False Then
		BestProduct.GetSpecialProduct("bestsellers",False,Library.GetLimitLoadItem,Me,"bestproduct_receive")
	End If
	
End Sub

Sub bestproduct_receive(res As List,category As String)
	
	If Library.BestProduct.IsInitialized = False Then
		Library.BestProduct.Initialize
		Library.BestProduct = res
	End If
	
	Library.CacheSystem.AddList2Cache("best",res,"product_main")
	Library.CacheSystem.AddList2Cache("new",Library.NewProduct,"product_main")
	Library.CacheSystem.AddList2Cache("feature",Library.FeatureProduct,"product_main")
	Library.CacheSystem.AddList2Cache("special",Library.SpecialProduct,"product_main")
	
	If res.Size > 0 Then
		topSV = AddHeader(Library.GetStringResourse("bestproduct"),"bestproduct",topSV)
		svhBestProduct.Initialize(0,"")
		sv1.Panel.AddView(svhBestProduct,0,topSV,sv1.Width,190dip)
		topSV = topSV + Library.LoadProductHorizontalScroll(Library.BestProduct,svhBestProduct) + 70dip
		sv1.Panel.Height = sv1.Panel.Height + 180dip
		Dim v As View
		v = svhBestProduct.Panel.GetView(0)
		v.Top = 0
	End If
	
	sv1.Panel.Height = sv1.Panel.Height + 180dip
	
	If CheckShowBannerConfig("manufacture") = True Then
		If isOffline = False Then
			opManufacturers.GetManufacturers(Me,"Manufacturers_receive")
		End If
	Else
		sv1.Panel.Height = sv1.Panel.Height + 100dip
		topSV = topSV + 12dip
		sv1.Panel.Height = topSV
		pnlloading.SetVisibleAnimated(600,False)
	End If
	
End Sub

#Region Activity Event

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_MENU Then
		SlideMenu.ToggleMenu
		
	Else If KeyCode = KeyCodes.KEYCODE_BACK Then
		
		If pnlloading.Visible = True Then Return True
		
		If SlideMenu.GetVisible = True Then
			SlideMenu.ToggleMenu
			Return True
		End If
		
		If Msgbox2(Library.GetStringResourse("exit_app2"),Library.GetStringResourse("alert"),Library.GetStringResourse("yes"),Library.GetStringResourse("no"),"",Null) <> DialogResponse.POSITIVE Then
			Return True	
		End If
		
		File.Delete(File.DirInternal,"data")
		Activity.Finish
		
	Else If KeyCode = 24 Or KeyCode = 25 Then
		CallSubDelayed(GoogleVoices,"Listen")
		Return True

	End If
	
End Sub

Sub Activity_Resume
	
	If timerSlideshow.IsInitialized Then
		timerSlideshow.Enabled = True
	End If
	
	ApplySettingChanges
	
	GetCart
	
	Dim opWish As OpenCart
	opWish.Initialize
	opWish.Wishlist(Me,"WishList_receive","")
			
	SlideMenu.AddHeader
	
End Sub

Sub ApplySettingChanges
	
	If (Library.currLang.ToLowerCase <> Library.manager.GetString("lang").ToLowerCase) Or  (Library.currCurrency.ToLowerCase <> Library.manager.GetString("curr").ToLowerCase)Then
		
		If Library.loginDetails <> Null Then
			If Library.loginDetails.IsInitialized Then
				Library.loginDetails.Put("login",False)
			End If
		End If
		
		Library.CacheSystem.ClearCache
		
		Activity.Finish
		StartActivity(Main)
		
		Return
		
	Else
		Library.setLocalApp(Library.currLang)
	End If
	
End Sub

Sub WishList_receive(res As Map,cat As String)
	
	If res = Null Then Return
	If res.IsInitialized = False Then Return
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim m1 As Map
			Dim ls As List
			m1 = res.Get("data")
			ls = m1.Get("products")
			Library.wishlist = Library.GetStringResourse("bookmark") & $" ( ${ls.Size} )"$
			SlideMenu.AddHeader
		End If
	End If
	
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	timerSlideshow.Enabled = False
	Library.AnimationFromLeft2Right
End Sub

#End Region

Sub AddHeader(Title As String,Tag As String,Top As Int) As Int
	
	Dim p1 As Panel
	p1.Initialize("")
	sv1.Panel.AddView(p1,0,Top,sv1.Width,0)
	
	If Library.IsPersian Then
		p1.LoadLayout("frmheader_template")
	Else
		p1.LoadLayout("frmheader_template_en")
	End If
	
	DoEvents
	
	p1.Height = pnlheadert.Height
	lblheadername.Text = Title
	pnloverheader.Tag = Tag
	
	Top = Top + p1.Height + 4dip
	
	Dim c1 As ColorDrawable
	c1.Initialize(Library.Theme_Header,16dip)
	pnlheaderproduct.Background = c1
	
	sv1.Panel.Height = sv1.Panel.Height + p1.Height
	
	Return Top
	
End Sub

Sub Manufacturers_receive(res1 As Map,category As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res1 = Null Then Return
	If res1.IsInitialized = False Then Return
	
 	Dim res As List
	res = res1.Get("data")
	
	Library.listManufacturers.Initialize
	Library.listManufacturers = res

	Library.CacheSystem.AddList2Cache("manufacturers",res,"manufacturers")
	
	LoadManufacturers(res)
	
	sv1.Panel.Height = sv1.Panel.Height + 100dip
	
End Sub

Sub LoadManufacturers(res As List)
	
	If res.Size > 0 Then
		
		If svH.IsInitialized Then
			If svH.Panel.NumberOfViews > 0 Then Return
		End If
		
		topSV = AddHeader(Library.GetStringResourse("manufacture"),"manufacture",topSV)
		
		If Library.GetDevicePhysicalSize < 7 Then
			svH.Initialize(res.Size * 83dip + 20dip,"svH")
			sv1.Panel.AddView(svH,0,topSV,sv1.Width,75dip)
		Else
			svH.Initialize(res.Size * 170dip + 20dip,"svH")
			sv1.Panel.AddView(svH,0,topSV,sv1.Width,155dip)
		End If
		
		svH.Panel.Color = Colors.White
		
		topSV = topSV + svH.Height
		
		Dim left As Int = 0
		Dim error_image As BitmapDrawable
		error_image.Initialize(LoadBitmap(File.DirAssets,"noimage.png"))
		
		Dim cache_state As Boolean = Library.manager.GetBoolean("cache")
		
		For i = 0 To res.Size - 1
			
			Dim temp As Map
			temp = res.Get(i)
			
			Dim img As ImageView
			img.Initialize("imgmanufacturers")
			
			svH.Panel.AddView(img,left,10,svH.Height-10dip,svH.Height-10dip)
			left = left + svH.Height + 10dip
			
			Dim sPath As String
			sPath = temp.Get("image")
			sPath = sPath.Replace(" ","%20")
			
			Glide.Load(sPath).AsBitmap.Error(error_image.Bitmap).Resize(Abs(img.Width),Abs(img.Height)).CenterCrop.IntoImageView(img)

			img.Tag = temp.Get("manufacturer_id")
			
		Next
		
		topSV = topSV + 12dip

		sv1.Panel.Height = topSV
		svH.Color = Colors.White
		
	End If	
	
	If Library.FirstRun = True Then
		
		If Library.phoneInfo.SdkVersion >= 21 Then
			titleHelp = Library.GetStringResourse("help")
			
			TipTag = "basket"
'			tip.Initialize("tips")
'			tip.setTarget(btnbasket).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_basket")).build
'			tip.setButtonText(Library.GetStringResourse("okay"))
'			tip.show
			
		End If
		
	End If
	
End Sub

#Region Slideshow

Sub slideshow_receive(res As List,category As String)
	
	Library.listSlideshow.Initialize
	Library.imagesSlideshow.Initialize
	Library.listSlideshow = res
	bullet.Initialize
	
	If res = Null Then
		Dim rs As List
		rs.Initialize
		Dim mDefault As Map
		mDefault.Initialize
		mDefault.Put("title",Library.GetStringResourse("app_title"))
		mDefault.Put("image",Library.GetStringResourse("url") & "/app/default_app_banner.jpg")

		rs.Add(mDefault)
		res = rs
	End If
	
	If res.IsInitialized = False Then
		Dim rs As List
		rs.Initialize
		Dim mDefault As Map
		mDefault.Initialize
		mDefault.Put("title",Library.GetStringResourse("app_title"))
		mDefault.Put("image",Library.GetStringResourse("url") & "/app/default_app_banner.jpg")
		rs.Add(mDefault)
		res = rs
	End If
	
	Library.CacheSystem.AddList2Cache("slideshow",res,"slideshow")
	
	LoadSlideshow(res)
	
	If Library.CacheSystem.ExistID("banners","banners") = False Then
		Dim op As OpenCart
		op.Initialize
		op.Banner(Me,"Banners_Receive","")
	End If
	
End Sub

Sub LoadSlideshow(res As List)
 
	Dim im,firstslide As Map
	im.Initialize
	
	slidepanel1.Initialize
	
 	If res = Null Then
		Dim tem As List
		tem.Initialize
		res = tem	
	End If
	
	If res.Size = 0 Then
		Dim mDefault As Map
		mDefault.Initialize
		mDefault.Put("title",Library.GetStringResourse("app_title"))
		mDefault.Put("image",Library.GetStringResourse("url") & "/app/default_app_banner.jpg")
		res.Add(mDefault)
	End If
	
	firstslide.Initialize
	firstslide = res.Get(offsetSlideshow)
	
	For i = 0 To res.Size - 1
	
		Dim p1 As Panel
		p1.Initialize("pnlImage")
		slidepanel1.AddPage(p1,"")
		DoEvents
		
		Dim m1 As Map
		m1 = res.Get(i)
		
		Dim im1 As ImageView
		im1.Initialize("imgads")
		Library.imagesSlideshow.Add(im1)
		
		p1.AddView(im1,0,0,pnlads.Width,pnlads.Height)
		im1.Tag = m1
		DoEvents
		
		Dim lbl As Label
		lbl.Initialize("")
		lbl.Text = m1.Get("title")
		lbl.Typeface = Library.GetFont
		lbl.TextSize = 17
		lbl.TextColor = Colors.Black
		lbl.Gravity = Bit.Or(Gravity.CENTER,Gravity.CENTER_VERTICAL)
		
		Dim c1 As ColorDrawable
		c1.Initialize(Colors.ARGB(50,255,255,255),0)
		
		lbl.Background = c1
		p1.AddView(lbl,0,pnlads.Height - 50dip,pnlads.Width,50dip)
		
		Dim path As String
		path = m1.Get("image")
		path = path.Replace(" ","%20")
		
		Glide.Load(path).AsBitmap.Resize(Abs(im1.Width),Abs(im1.Height)).CenterCrop.IntoImageView(im1)
		
	Next
	
	slidepanelPage.Initialize(slidepanel1,"pager")
	pnlads.AddView(slidepanelPage,0,0,pnlads.Width,pnlads.Height)
	
	AddBullet(res.Size)
	ChooseBullet(0)
	
	timerSlideshow.Initialize("tmrSlideshow",3600)
	timerSlideshow.Enabled = True
	
End Sub

Sub imgads_Click
	
	Dim im As ImageView
	im = Sender
	
	If im.Tag Is Map Then
		Dim te As Map
		te = im.Tag
		ShowSlideContent(te)
	End If
	
End Sub

Sub tmrSlideshow_Tick
	
	If svH.IsInitialized Then
		If svH.ScrollPosition = 0 Then
			svH.FullScroll(True)
		Else
			svH.FullScroll(False)
		End If
	End If
	
	If Library.imagesSlideshow = Null Then Return
	
	If Library.imagesSlideshow.IsInitialized = False Then Return
	
	If offsetSlideshow = Library.imagesSlideshow.Size  Then offsetSlideshow = 0
	
	If slidepanelPage.IsInitialized = False Then
		slidepanelPage.Initialize(slidepanel1,"pager")
		pnlads.AddView(slidepanelPage,0,0,pnlads.Width,pnlads.Height)
	End If
	
	slidepanelPage.GotoPage(offsetSlideshow,True)
	
	DoEvents
	
	ChooseBullet(offsetSlideshow)
	offsetSlideshow = offsetSlideshow + 1

End Sub

Sub ChooseBullet(i As Int)
	
	If bullet = Null Then Return
	If bullet.IsInitialized = False Then Return
	
	If i > bullet.Size-1 Then i = 0
	If bullet.Size = 0 Then Return
	
	Dim p1 As Panel
	p1 = bullet.Get(i)
	
	Dim c1,c2 As ColorDrawable
	c1.Initialize(Colors.RGB(66,66,66),50)
	c2.Initialize(Colors.RGB(191,191,191),50)
	
	For Each v1 As View In pnlcircle.GetAllViewsRecursive
		Dim p2 As Panel
		p2 = v1
		p2.Background = c2
	Next
	
	p1.Background = c1
	
End Sub

Sub ShowSlideContent(data As Map)

	Try
		
		Dim link As String
		link = data.Get("link")
		link = link.Replace("&amp;","&")
	 	
		If link = "" Then Return
		
		#region Check link is product
		Dim ma As Matcher
		ma = Regex.Matcher("product_id=(\d+)",link)
		
		If ma.Find Then
			link = ma.Group(1)
			Dim m1 As Map
			m1.Initialize
			m1.Put("product_id",link)
			actProduct.product = m1
			StartActivity(actProduct)
			Return
		
		End If
		#end region
		
		#region Check link is manufacture id
		ma = Regex.Matcher("manufacturer_id=(\d+)",link)
		
		If ma.Find Then
			link = ma.Group(1)
			pnlloading.SetVisibleAnimated(500,True)
	
			Dim op As OpenCart
			op.Initialize
			op.GetmanufactureProduct(link,Me,"AllProduct_receive")
		
			Return

		End If
		#end region
		
		If link.ToLowerCase.IndexOf("www") > -1 Or link.ToLowerCase.IndexOf("http") > -1 Or _
												   Regex.IsMatch("^[\w-]+\.\S+$",link) Then
			actWeb.data = ""
			actWeb.link = link
			actWeb.title = "Web"
			StartActivity(actWeb)
			
		End If
		
	Catch
	End Try
	
End Sub

Sub AddBullet(size As Int)

	Dim left As Int
	left = 0
	
	If bullet.IsInitialized = False Then bullet.Initialize
	
	Dim c1,c2 As ColorDrawable
	c1.Initialize(Colors.RGB(66,66,66),50)
	c2.Initialize(Colors.RGB(191,191,191),50)
	
	pnlcircle.Width = 0
	
	For i = 1 To size
	
		Dim p1 As Panel
		p1.Initialize("")
		pnlcircle.AddView(p1,left,pnlcircle.Height /2,10dip,10dip)
		p1.Background = c1
		left = left + 14dip
		pnlcircle.Width = left
		bullet.Add(p1)
	Next
	
	Library.CenterView(pnlcircle,Activity)

End Sub

Sub pager_PageChanged (Position As Int)
	ChooseBullet(Position)
End Sub

#End Region

#Region Banners

Sub Banners_Receive(Res As List,ID As String)
	
	If Res = Null Then
		If isOffline = False Then
			NewProduct.Initialize
			NewProduct.GetSpecialProduct("latest",True,Library.GetLimitLoadItem,Me,"NewProduct_receive")
		Else
			pnlloading.Visible = False
		End If
		Return
	End If
	
	If Res.IsInitialized = False Then
		If isOffline = False Then
			NewProduct.Initialize
			NewProduct.GetSpecialProduct("latest",True,Library.GetLimitLoadItem,Me,"NewProduct_receive")
		Else
			pnlloading.Visible = False
		End If
		Return
	End If
	
	Library.CacheSystem.AddList2Cache("banners",Res,"banners")
	
	Dim op As OpenCart
	op.Initialize
	
	BannerScrollView.Initialize
	ListBannerLoaded.Initialize
	
	OffsetBannerLoaded = 0
	
	For i = 0 To Res.Size - 1
		
		Dim l1 As Map
		l1 = Res.Get(i)
		
		If CheckShowBannerConfig(l1.Get("banner_id")) = True Then
			
			ListBannerLoaded.Add(l1.Get("banner_id"))
		
			Dim svBanners As HorizontalScrollView
			svBanners.Initialize(0,"")
			svBanners.Color = Colors.Transparent
			svBanners.Panel.Color = Colors.Transparent
			
			Dim name As String
			name = l1.Get("name")
			name = name.ToLowerCase
			
			If name.IndexOf("مربع") > -1 Or name.IndexOf("square") > -1 Or name.IndexOf("grid") > -1 Then
				svBanners.Tag = "square"
			else if name.IndexOf("مستطیل") > -1 Or name.IndexOf("rect") > -1 Then
				svBanners.Tag = "rect"
			End If
			
			sv1.Panel.AddView(svBanners,0,topSV,100%x,140dip)
			topSV = topSV + svBanners.Height+8dip
			
			Dim progress As ProgressBar
			progress.Initialize("")
			progress.Indeterminate = True
			
			svBanners.Panel.AddView(progress,100%x / 2 - 30,svBanners.Height/2 - 60,60,60)
			svBanners.Panel.Width = 100%x
			
			BannerScrollView.Put(l1.Get("banner_id"),svBanners)
	
		End If
		
	Next
	
	If isOffline = False Then
		'NewProduct.Initialize
		'NewProduct.GetSpecialProduct("latest",True,Library.GetLimitLoadItem,Me,"NewProduct_receive")
		opSpecialProduct.GetSpecialProduct("specials",True,Library.GetLimitLoadItem,Me,"SpecialsProduct_receive")
	End If
	
	If ListBannerLoaded.Size > 0 Then
		OffsetBannerLoaded = 0
		Dim cache As List
		
		cache = Library.CacheSystem.GetCacheAsList("banner" & ListBannerLoaded.Get(0),"banner_info")
		
		If Library.CacheSystem.ExistID("banner" & ListBannerLoaded.Get(0),"banner_info") Then
			GetOnlyBanner_Receive(cache,ListBannerLoaded.Get(0))
		Else
			op.Banner(Me,"GetOnlyBanner_Receive",ListBannerLoaded.Get(0))
		End If
		
	End If
	
End Sub

Sub GetOnlyBanner_Receive(Data As List,ID As String)
	
	If Data = Null Then
		Return
	End If
	
	If Data.IsInitialized = False Then
		Return
	End If
	
	Dim sID As String
	sID = ListBannerLoaded.Get(OffsetBannerLoaded)
	
	Library.CacheSystem.AddList2Cache("banner" & sID,Data,"banner_info")
	
	Dim sv As HorizontalScrollView
	
	sv = BannerScrollView.Get(sID)
	
	sv.Panel.RemoveAllViews
	
	Dim left,svHeight As Int
	left = 10
	svHeight = sv.Height
	
	Dim coll As Map
	coll.Initialize
	
	For i = 0 To Data.Size - 1
		
		Dim d1 As Map
		d1 = Data.Get(i)
		
		Dim imgbannerid As ImageView
		imgbannerid.Initialize("imgbannerid")
		
		imgbannerid.Tag = d1.Get("link")
		
		Dim url As String
		url = d1.Get("image")
		url = url.Replace(" ","%20")
		
		Dim tag As String
		tag = sv.Tag
		
		If tag = "rect" Then
			sv.Panel.AddView(imgbannerid,left,0,Activity.Width,sv.Height)
			left = left + Activity.Width
			Glide.Load(url).AsBitmap.Resize(Abs(imgbannerid.Width),Abs(imgbannerid.Height)).CenterCrop.IntoImageView(imgbannerid)
		Else

			If Activity.Height > Activity.Width Then
				sv.Panel.AddView(imgbannerid,left,0,svHeight,svHeight)
			Else
				sv.Panel.AddView(imgbannerid,left,0,sv.Width/2.7,svHeight)
			End If
			
			Glide.Load(url).AsBitmap.Resize(Abs(imgbannerid.Width),Abs(imgbannerid.Height)).FitCenter.IntoImageView(imgbannerid)
			
			left = left + imgbannerid.Width + 5dip
			
		End If
		
		ImageViewList.Put(url,imgbannerid)
				
	Next
	
	sv.Panel.Width = left
	sv.ScrollPosition = sv.Panel.Width / 2
	DoEvents
	
	OffsetBannerLoaded = OffsetBannerLoaded + 1
	
	If OffsetBannerLoaded > ListBannerLoaded.Size-1 Then
		Return
	Else
		If Library.CacheSystem.ExistID("banner" & ListBannerLoaded.Get(OffsetBannerLoaded),"banner_info") Then
			Dim cache As List
			cache = Library.CacheSystem.GetCacheAsList("banner" & ListBannerLoaded.Get(OffsetBannerLoaded),"banner_info")
			GetOnlyBanner_Receive(cache,ListBannerLoaded.Get(OffsetBannerLoaded))
		Else
			Dim op As OpenCart
			op.Initialize
			op.Banner(Me,"GetOnlyBanner_Receive",ListBannerLoaded.Get(OffsetBannerLoaded))
		End If
	End If

End Sub

Sub CheckShowBannerConfig(ID As String) As Boolean
	
	Dim temp As List
	temp = Library.Config.Get("banner")
	
	For i = 0 To temp.Size - 1
		
		Dim t As String
		t = temp.Get(i)
		
		If t = ID Then Return True
			
	Next
	
	Return False
	
End Sub

#End Region

Sub btnmenu_Click
	SlideMenu.ToggleMenu
End Sub

Sub btnsearch_Click
	StartActivity(actSearch)
End Sub

Sub btnbasket_Click
	
	If Library.InternetState = False Then
		ToastMessageShow(Library.GetStringResourse("error_net_title"),False)
		Return
	End If
	
	StartActivity(actBasket)
	
End Sub

Sub pnlover_Click
	
	Dim p1 As Panel
	p1 = Sender
	
	Dim temp As Map
	temp = p1.Tag
	actProduct.product = temp
	StartActivity(actProduct)
	
End Sub

Sub pnloverheader_Click
	
	Dim pa As Panel
	pa = Sender
	
	If pa.Tag = "manufacture" Then Return
	
	LoadProductSplit(pa.Tag)
	
End Sub

Sub LoadProductSplit(pa As String)

	Dim op As OpenCart
	op.Initialize
	
	pnlloading.SetVisibleAnimated(500,True)
	
	If pa = "bestproduct" Then
		op.GetSpecialProduct("bestsellers",True,6,Me,"allproduct_receive")
	
	Else If pa = "featureproduct" Then
		op.GetSpecialProduct("featured",True,12,Me,"AllProduct_receive")
	
	Else If pa = "special" Then
		op.GetSpecialProduct("specials",True,12,Me,"AllProduct_receive")
		
	Else If pa = "newproduct" Then
		op.GetSpecialProduct("latest",True,12,Me,"AllProduct_receive")
	
	End If
	
End Sub

Sub allproduct_receive(res As List,category As String)

	If res = Null Then Return
	If res.IsInitialized = False Then Return
	
	Library.CacheSystem.AddList2Cache(category,res,"topic_products")
	
	pnlloading.SetVisibleAnimated(500,False)
	
	actProducts.res = res
	
	Dim t1 As String
	
	If category = "bestsellers" Then
		t1 = Library.GetStringResourse("bestproduct")
	Else If category = "featured" Then
		t1 = Library.GetStringResourse("featureproduct")
	Else If category = "products" Then
		t1 = Library.GetStringResourse("newproduct")
	Else
		t1 = Library.GetStringResourse("relat_product")
	End If
		
	actProducts.title = t1
	StartActivity(actProducts)
	
End Sub

Sub GetCart
	Dim cart As OpenCart
	cart.Initialize
	cart.GetCarts(Me,"Carts_receive")
End Sub

Sub Carts_receive(res As Map,cat As String)
	If res = Null Then Return
	If res.IsInitialized = False Then Return
	Library.CartDetails = res
	Library.ShowCartLabel(lblbasket)
End Sub

Sub btncat_Click
	StartActivity(actCategory)
End Sub

Sub Logout
	
	pnlloading.SetVisibleAnimated(500,True)
	Dim op1 As OpenCart
	op1.Initialize
	op1.Logout(Me,"Logout_receive")
	
End Sub

Sub Logout_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("success_logout"),2,True)
			If Library.loginDetails.IsInitialized Then Library.loginDetails.Put("login",False)
			lblbasket.SetVisibleAnimated(500,False)
			SlideMenu.AddHeader
		Else
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),2,False)
		End If
		
	End If
	
End Sub

Sub imgmanufacturers_Click
	
	Dim im As ImageView
	im = Sender
	
	If im.Tag = Null Or im.Tag = "" Then Return
	
	Try
		
		Dim res As List
		res = Library.CacheSystem.GetCacheAsList("products/manufacturer/" & im.Tag,"information")
		
		If res.IsInitialized Then
			If res.Size > 0 Then
				actProducts.title = Library.GetStringResourse("relat_product")
				StartActivity(actProducts)
				Return
			End If
		End If
		
		pnlloading.SetVisibleAnimated(500,True)
		
		Dim op As OpenCart
		op.Initialize
		op.GetmanufactureProduct(im.Tag,Me,"AllProduct_receive")
		
	Catch
	End Try
	
End Sub

Sub ReRunApp
	Activity.Finish
	StartActivity(Main)
End Sub

Sub ExitApplications
	Activity.Finish
End Sub

Sub RefreshData
	
	Activity.Finish
	StartActivity(Main)
	
End Sub

Sub ShowHideLoading(State As Boolean)
	pnlloading.SetVisibleAnimated(500,State)
End Sub

Sub sv1_ScrollChanged(Position As Int)
	
	If Position > 100 Then
		If ScollButton.Top <> Activity.Height - ScollButton.Height Then
			ScollButton.SetLayoutAnimated(760,ScollButton.Left,Activity.Height-10dip- ScollButton.Height,ScollButton.Width,ScollButton.Height)
		End If
	
	Else if Position < 100 Then
		If ScollButton.Top <> Activity.Height + ScollButton.Height Then
			ScollButton.SetLayoutAnimated(760,ScollButton.Left,Activity.Height + ScollButton.Height,ScollButton.Width,ScollButton.Height)
		End If
	End If
	
End Sub

Sub btnScrollUp_Click
	sv1.ScrollPosition = 0
	DoEvents
End Sub

Sub imgbannerid_Click
	
	Dim img As ImageView
	img = Sender
	
	ShowSlideContent(CreateMap("link":img.Tag))
	
End Sub

Sub pnlmenuinapp_Click
	
End Sub