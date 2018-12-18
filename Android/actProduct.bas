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
	Public product As Map
	Private timerSlideshow As Timer
	Public IsOpenProduct,ClickedMenu As Boolean
End Sub

Sub Globals
	Private ScollButton As Button
	Private btnqr As Button
	Dim status As StatusBarCompat
	Dim progress As Panel
	Private googlebar As GoogleProgressBar
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
	Private lbldescription As Label
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
	Private txtfocus As EditText
	Private MyToastMessageShow As MyToastMessageShow
	Private FixPanelHeader As Boolean
	Dim pnlReviews,pnlAttribute,pnlBasket As Panel
	Private svReviews,svAttribute As ScrollView
	Private btnattributes As Button
	Dim lblfloat_basket As Label
'	Private tips As MSShowTipsBuilder
	Private TipTag,titleHelp As String
	Private btnshare As Button
	Private btnbasket As Button
	
	Dim slidepanel1 As AHPageContainer
	Dim slidepanelPage As AHViewPager
	
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
	
	Private ListImageView As List
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	
	ListOptions.Initialize
	ListImageView.Initialize
	sv1.Initialize2(0,"sve1")
	
	Dim Content As Panel
	Content.Initialize("")
	Activity.AddView(sv1,0,0,100%x,100%y)
	Activity.AddView(Content,0,0,100%x,100%y)
	
	ScollButton = Library.MakeUpScrollButton(Activity)
	ScollButton.BringToFront
	
	Library.ChangeStatusColor
	
	progress.Initialize("")
	progress.Color = Colors.ARGB(120,66,66,66)
	Activity.AddView(progress,0,0,100%x,100%y)
	googlebar.Initialize("",0,Array As Int(Colors.RGB(3,174,218),Colors.RGB(218,3,79),Colors.RGB(67,67,67), Colors.RGB(218,128,0)))
	progress.AddView(googlebar,Activity.Width / 2 - 40dip / 2,Activity.Height / 2 - 40dip,40dip,40dip)
	
	pnlReviews.Initialize("")
	Activity.AddView(pnlReviews,0,0,100%x,100%y)
	pnlReviews.Visible = False
	pnlReviews.Color = Colors.RGB(238, 238, 238)
	svReviews.Initialize(0)
	pnlReviews.AddView(svReviews,0,0,100%x,100%y)
	
	pnlAttribute.Initialize("")
	Activity.AddView(pnlAttribute,0,0,100%x,100%y)
	pnlAttribute.Visible = False
	pnlAttribute.Color = Colors.RGB(238, 238, 238)
	svAttribute.Initialize(0)
	pnlAttribute.AddView(svAttribute,0,0,100%x,100%y)
	
	pnlBasket.Initialize("")
	Activity.AddView(pnlBasket,0,100%y - 50dip,100%x,50dip)
	
	Dim cd As ColorDrawable
	cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),0,0,Colors.Gray)
	pnlBasket.Background = cd
	
	lblfloat_basket.Initialize("lbladd2cart")
	lblfloat_basket.TextColor = Colors.White
	lblfloat_basket.Typeface = Typeface.LoadFromAssets("icomoon.ttf")
	
	lblfloat_basket.TextSize = 14
	lblfloat_basket.Gravity = Gravity.CENTER
	pnlBasket.AddView(lblfloat_basket,0,0,pnlBasket.Width,pnlBasket.Height)
	pnlBasket.Visible = False
	Library.CenterView(lblfloat_basket,Activity)
	
	MyToastMessageShow.Initialize(Activity)
	
	If Library.IsEnglish Then
		sv1.Panel.LoadLayout("frmproduct_en")
	Else
		sv1.Panel.LoadLayout("frmproduct")
	End If
	
	lblpre_price.Typeface = Library.GetFont
	lbldate.Typeface = Library.GetFont
	
	CurrentTimerSpecialWidth = pnllistnumb.Width
	
	'pnlheader.Color = Library.Theme_Header
	sv1.Panel.Height = pnl2.Height + pnl2.top + 100dip
	sv1.ScrollPosition = 0
	
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
	
	IsOpenProduct = True
	slidemenu1.Initialize(Content,Me)
	
	lbls1.TextColor = Library.Theme_Header
	lbls2.TextColor = Library.Theme_Header
	lbls3.TextColor = Library.Theme_Header
	lbls4.TextColor = Library.Theme_Header
	lbls5.TextColor = Library.Theme_Header
	
'	Dim cc As ColorDrawable
'	cc.Initialize(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),9)
'	lbladd2cart.Background = cc
	
	If product.ContainsKey("product_id") = False Then
		LoadItem
	Else
		
		Dim detailsTemp As Map
		detailsTemp = Library.CacheSystem.GetCacheAsMap(product.Get("product_id"),"product_description")
		
		If detailsTemp <> Null And detailsTemp.IsInitialized Then
			Details_receive(detailsTemp,"")
		Else
			If Library.InternetState = False Then
				ToastMessageShow(Library.GetStringResourse("error_net_title"),False)
				Activity.Finish
				Return
			End If
		
			'ProgressDialogShow(Library.GetStringResourse("loading"))
			details.ProductDetails(Me,"Details_receive",product.Get("product_id"))
		End If
		
	End If
	
	GetCart
	
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
		pnlcircle.AddView(p1,left,pnlcircle.Height /2.2,10dip,10dip)
		p1.Background = c1
		left = left + 14dip
		pnlcircle.Width = left
		bullet.Add(p1)
	Next
	
	Library.CenterView(pnlcircle,Activity)

End Sub

Sub tips_Click
	
'	If TipTag = "share" Then
'		TipTag = "bookmark"
'		tips.Initialize("tips")
'		tips.setTarget(btnshare).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_share")).build
'		tips.setButtonText(Library.GetStringResourse("okay"))
'		tips.show
'	
'	Else If TipTag = "bookmark" Then
'		TipTag = "search"
'		tips.Initialize("tips")
'		tips.setTarget(btnbookmark).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_bookmark")).build
'		tips.setButtonText(Library.GetStringResourse("okay"))
'		tips.show
'	
'	Else If TipTag = "search" Then
'		TipTag = "barcode"
'		tips.Initialize("tips")
'		tips.setTarget(btnsearch).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_campare")).build
'		tips.setButtonText(Library.GetStringResourse("okay"))
'		tips.show
'	
'	Else If TipTag = "barcode" Then
'		TipTag = "review"
'		tips.Initialize("tips")
'		tips.setTarget(btnqr).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_barcode")).build
'		tips.setButtonText(Library.GetStringResourse("okay"))
'		tips.show
'	
'	Else If TipTag = "review" Then
'		TipTag = "attribute"
'		tips.Initialize("tips")
'		tips.setTarget(btnreviews).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_review")).build
'		tips.setButtonText(Library.GetStringResourse("okay"))
'		tips.show
'	
'	Else If TipTag = "attribute" Then
'		TipTag = "add2cart"
'		tips.Initialize("tips")
'		tips.setTarget(btnattributes).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_attribute")).build
'		tips.setButtonText(Library.GetStringResourse("okay"))
'		tips.show
'			
'	Else If TipTag = "add2cart" Then
'		TipTag = ""
'		tips.Initialize("tips")
'		tips.setTarget(lbladd2cart).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_add_basket")).build
'		tips.setButtonText(Library.GetStringResourse("okay"))
'		tips.show
'		
'	End If
	
End Sub

Sub Details_receive(res As Map,cat As String)
	
	If res.IsInitialized Then
		product = res
		Library.CacheSystem.AddMap2Cache(res.Get("id"),res,"product_description")
		LoadItem
	End If
	
End Sub

Sub Activity_Resume
	
'	Dim justify As TeamEightJustify
'	justify.Initialize
	'lbldescription.Text = justify.JustifyByAddSpace(lbldescription,lbldescription.Text,False,0.5)
	lbldescription.Text = lbldescription.Text
	
	If product = Null Then
		Activity.Finish
		Return
	End If
	
	If product.IsInitialized = False Then Activity.Finish
	
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	
	timerSpecial.Enabled = False
	Library.AnimationFromLeft2Right
	
	If ClickedMenu = True Then
		ClickedMenu = False
		IsOpenProduct = False
		Activity.Finish
	End If
	
End Sub

Sub ChooseBullet(i As Int)
	
	If i > bullet.Size-1 Then i = 0
	
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

Sub pager_PageChanged (Position As Int)
	ChooseBullet(Position)
End Sub

Sub LoadItem
	
	Dim product_name As String
	product_name = product.Get("name")
	
	For i = 0 To product.Size - 1
		
		Dim s1 As String
		s1 = product.GetValueAt(i)
		
		If s1.ToLowerCase = "null" Then
			product.Put(product.GetKeyAt(i),"-")
		End If
		
	Next
	
	If GetDiscount = True Then
		'pnltimer.Visible = True
		lblwonderfull.Text = Library.RedString(Library.GetStringResourse("special_wonderful"))
		pnlprice.top = pnltimer.top + pnltimer.Height
		pnl2.top = pnlprice.top + pnlprice.Height-2
		timerSpecial.Initialize("timerSpecial",1000)
		timerSpecial.Enabled = True
		lblline2.Color = Colors.Black
		lblline1.Color = Colors.Transparent
	End If
	
	lbltitle.Text = product_name
	lbltitle.Text = lbltitle.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
	
	Dim price,special As String
	price = product.Get("price_formated")
	special = product.Get("special_formated")
	
	If price.StartsWith("0") = True Or price.ToLowerCase = "false" Then
		price = Library.GetStringResourse("login_account")
	End If
	
	If special.StartsWith("0") = True Or special.ToLowerCase = "false" Then
		special = ""
	End If
	
	If price.Length > 0 And special.Length = 0 Then
		
		lbladd2cart.Text =  price
		
		btnreviews.Typeface = Library.GetFont
		btnattributes.Typeface = Library.GetFont
		
	Else If special.Length > 0 Then
			
		lbladd2cart.Text = special
		lblpre_price.Text = Library.DiscountPrice(price)
		
		If Library.IsPersian Then
			imgspecial.SetBackgroundImage(LoadBitmap(File.DirAssets,"special_fa.png"))
		Else
			imgspecial.SetBackgroundImage(LoadBitmap(File.DirAssets,"special_en.png"))
		End If
		
		imgspecial.SetVisibleAnimated(700,True)
		
	End If
	
	If product_name.Length > 17 Then product_name = product_name.SubString2(0,13) & "..."
	
	If product.Get("quantity") = 0 Then
		lbladd2cart.Typeface = Typeface.DEFAULT
		lbladd2cart.Text = Library.GetStringResourse("no_stock")
		Dim no_product As ColorDrawable
		no_product.Initialize(Colors.RGB(253,77,90),9)
		pnlBasket.Visible = False
		lbladd2cart.Background = no_product
		lbladd2cart.Enabled = False
		lblstate.Text = product.Get("stock_status")
	Else
		lblstate.Text = Library.GetStringResourse("yes_stock")
	End If
	
	lblproducer.Text = product.Get("manufacturer")
	lblmodel.Text = product.Get("model")
	lblvisit.Text = product.Get("viewed")
	
	Dim listoption As List
	listoption = product.Get("options")

	top = lbldescription.top
	
	If listoption.Size > 0 Then
		LoadOptions(listoption)
		Dim lbld As Label
		lbld = lbldescription
		lbldescription.RemoveView
		DoEvents
		pnl2.AddView(lbld,10,top + 20dip,sv1.Width-20,lbld.Height)
		DoEvents
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
		
		If listSlideshow.Size > 0 Then
			slidepanel1.Initialize
			
			Dim Glide As AriaGlide
			
			AddBullet(listSlideshow.Size)
			ChooseBullet(0)
			
			Dim imagesMap As Map
			imagesMap.Initialize
			
			For i = 0 To listSlideshow.Size - 1
				
				Dim p1 As Panel
				p1.Initialize("pnlImage")
				slidepanel1.AddPage(p1,"")
		
				Dim im1 As ImageView
				im1.Initialize("imgADs")
				im1.Gravity = Gravity.FILL
				Library.imagesSlideshow.Add(im1)
				
				p1.AddView(im1,0,0,pnlads.Width,pnlads.Height)
				im1.Tag = listSlideshow.Get(i)
				
				Dim spath As String
				spath = listSlideshow.Get(i)
				spath = spath.Replace(" ","%20")
				
				imagesMap.Put(im1,spath)
				'picasso.LoadUrl(spath).Resize(Abs(im1.Width),Abs(im1.Height)).CenterInside.IntoImageView(im1)
				
				DoEvents
				
			Next
			
			slidepanelPage.Initialize(slidepanel1,"pager")
			pnlads.AddView(slidepanelPage,0,0,pnlads.Width,pnlads.Height)
			
			CallSubDelayed2(ImageDownloader,"Download",imagesMap)
			
			timerSlideshow.Initialize("tmrSlideshow",3900)
			timerSlideshow.Enabled = True
			
		End If
		
	End If
	
	#End Region
	
	Dim html1 As Html
	lbldescription.Text = html1.FromHtml(product.Get("description"))

'	If lbldescription.Text.Length > 1000 Then
'		lbldescription.Text = lbldescription.Text.SubString2(0,1000) & "..."
'		product.Put("description",lbldescription.Text)
'	End If
	
	#region Description
	lbldescription.TextSize = 14
	
	Library.LabelSpace(lbldescription,1.7)
	
	Dim su As StringUtils
	Dim new_height As Int

	Try
		new_height = su.MeasureMultilineTextHeight(lbldescription,lbldescription.Text)
	Catch
		new_height = lbldescription.Height
	End Try
	
	Dim su As StringUtils
    Dim OneLineHeight As Long = su.MeasureMultilineTextHeight(lbldescription, lbldescription.Text)
    Dim H As Long = su.MeasureMultilineTextHeight(lbldescription, lbldescription.Text)
 	
	Dim obj1 As Reflector
	obj1.Target = lbldescription
	
	'Log($"Line Height: ${obj1.RunMethod("getLineHeight")} Line Count: ${(Ceil(H/OneLineHeight))/1.9}"$)
	
	new_height = (obj1.RunMethod("getLineHeight") * Ceil(H/OneLineHeight))/1.9
			
	If new_height < lbldescription.Height Then
		new_height = lbldescription.Height / 2
	End If
	
	lbldescription.Height = new_height + (new_height) + 50dip
	
	sv1.Panel.Height = sv1.Panel.Height + lbldescription.Height-340dip
	pnl2.Height = pnl2.Height + lbldescription.Height -270dip
	
	If Library.IsPersian Then
		lbldescription.Gravity = Gravity.RIGHT
		lbldate.Text = Library.GetDate(product.Get("date_added"))
	Else
		lbldescription.Gravity = Gravity.LEFT
		lbldate.Text = product.Get("date_added")
	End If
	
	'top = sv1.Panel.height + lbldescription.Height + lbldescription.Top + 5dip
	top = Library.GetRelativeTop(lbldescription) + lbldescription.Height + 20dip
	DoEvents
	
	#end region
	
	Dim opRelat As OpenCart 
	opRelat.Initialize
	opRelat.RelatedProduct(Me,"RelatedProduct_receive",product.Get("id"))
	
	progress.Visible = False
	
	lbladd2cart.Text = lbladd2cart.Text
	lblfloat_basket.Text = " " & Library.GetStringResourse("add2cartbtn") 'product_name & " " & lbladd2cart.Text
	
	#region Minimum
	If product.ContainsKey("minimum") Then
		Dim minu As Int
		minu = product.Get("minimum")
		If minu > 1 Then
			Dim rich As RichString
			rich.Initialize(lblstate.Text & " {c}{b}" & Library.GetStringResourse("atleast_product_to_cart").Replace("0",$" ${minu} "$) & "{c}{b}")
			rich.Style2(rich.STYLE_BOLD,"{b}")
			rich.Color2(Colors.Red,"{c}")
			lblstate.Text = rich
		End If
	End If
	#end region
	
	If Library.manager.GetBoolean("first_show_products") = False Then
		Library.manager.setBoolean("first_show_products",True)
		titleHelp = Library.GetStringResourse("help")
		
		If Library.phoneInfo.SdkVersion <> 19 Then
			TipTag = "share"
'			tips.Initialize("tips")
'			tips.setTarget(btnbasket).setTitle(titleHelp).setTitleColor(Library.Theme_Header).setCircleColor(Library.Theme_Header).setDescription(CRLF & Library.GetStringResourse("help_basket")).build
'			tips.setButtonText(Library.GetStringResourse("okay"))
'			tips.show
		End If
	End If
	
	Dim price2 As String
	price2 = product.Get("price")
	If price2 = "0" Then
		lbladd2cart.Text = Library.GetStringResourse("call_us")
	End If
	
End Sub

Sub GetDiscount As Boolean
	
	Dim start_date,end_date As String
	start_date = product.Get("special_start_date")
	end_date   = product.Get("special_end_date")
	
	Dim sd() As String = Regex.Split("-",start_date)
	Dim ed() As String = Regex.Split("-",end_date)
	
	File.Delete(File.DirInternal,"timeout_ids_" & product.Get("id"))
	
	If start_date = "0000-00-00" Or end_date = "0000-00-00" Or start_date.Length = 0 Or end_date.Length = 0 Then Return False

	If Regex.IsMatch("\d{4}-\d{1,2}-\d{1,2}",start_date) And Regex.IsMatch("\d{4}-\d{1,2}-\d{1,2}",end_date) Then
	
		Try

'			If File.Exists(File.DirInternal,"timeout_ids_" & product.Get("id")) Then
'				Dim temp As Map
'				temp = File.ReadMap(File.DirInternal,"timeout_ids_" & product.Get("id"))
'				SpecialDateInformation.Days = Abs(temp.Get("Days"))
'				SpecialDateInformation.Hours = Abs(temp.Get("Hours"))
'				SpecialDateInformation.Minutes = Abs(temp.Get("Minutes"))
'				SpecialDateInformation.Months = Abs(temp.Get("Months"))
'				SpecialDateInformation.Seconds = Abs(temp.Get("Seconds"))
'				SpecialDateInformation.Years = Abs(temp.Get("Years"))
'			Else
				DateTime.DateFormat = "yyyy-mm-dd"
				Dim sd1 As Long = DateUtils.SetDate(DateTime.GetYear(DateTime.Now),DateTime.GetMonth(DateTime.Now),DateTime.GetDayOfMonth(DateTime.Now))
				Dim se1 As Long = DateUtils.SetDate(ed(0),ed(1),ed(2))
				
				SpecialDateInformation = DateUtils.PeriodBetweenInDays(sd1,se1)
				
				SpecialDateInformation.Days = Abs(SpecialDateInformation.Days)
				SpecialDateInformation.Hours = Abs(SpecialDateInformation.Hours)
				SpecialDateInformation.Minutes = Abs(SpecialDateInformation.Minutes)
				SpecialDateInformation.Months = Abs(SpecialDateInformation.Months)
				SpecialDateInformation.Seconds = Abs(SpecialDateInformation.Seconds)
				SpecialDateInformation.Years = Abs(SpecialDateInformation.Years)
				
				If SpecialDateInformation.Months > 0 Then
					SpecialDateInformation.Days = SpecialDateInformation.Days + (SpecialDateInformation.Months * 30)
				End If
				
				If SpecialDateInformation.Days > 0 Then
					SpecialDateInformation.Days = SpecialDateInformation.Days - 1
					SpecialDateInformation.Hours = SpecialDateInformation.Hours + 24
					SpecialDateInformation.Hours = Abs(DateTime.GetHour(DateTime.Now) - SpecialDateInformation.Hours)
				
					If SpecialDateInformation.Hours > 24 Then 
						SpecialDateInformation.Hours = SpecialDateInformation.Hours - 24
						SpecialDateInformation.Minutes = SpecialDateInformation.Minutes + 59
					Else
						SpecialDateInformation.Hours = SpecialDateInformation.Hours - 1
						SpecialDateInformation.Minutes = Abs(59-DateTime.GetMinute(DateTime.Now))
						SpecialDateInformation.Seconds = Abs(59-DateTime.GetSecond(DateTime.Now))
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
				File.WriteMap(File.DirInternal,"timeout_ids_" & product.Get("id"),m)
				
'			End If
			
			Return True
			
		Catch
		End Try
		
	End If
	
	Return False
	
End Sub

Sub timerSpecial_Tick
	
	If pnltimer.Visible = False Then pnltimer.SetVisibleAnimated(500,True)
	
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
	File.WriteMap(File.DirInternal,"timeout_ids_" & product.Get("id"),m)
	
	lblnum1.Text = SpecialDateInformation.Days
	lblnum2.Text = SpecialDateInformation.Hours
	lblnum3.Text = SpecialDateInformation.Minutes
	lblnum4.Text = SpecialDateInformation.Seconds
	
	If SpecialDateInformation.Days > 99 Then
		lblnum1.TextSize = 14		
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
	
	Dim sett As ViewSetting
	
	If product.ContainsKey("reviews") Then
		
		progress.Visible = True
		
		Dim reviewsMap As Map = product.Get("reviews")
		Dim reviews As List
		reviews = reviewsMap.Get("reviews")
		
		If reviews.IsInitialized Then
			
			Dim topReviews As Int
			Dim html1 As Html
			
			For j = 0 To reviews.Size - 1
				
				Dim m1 As Map
				m1 = reviews.Get(j)
				
				Dim p1 As Panel
				p1.Initialize("")
				
				svReviews.Panel.AddView(p1,0,topReviews,svReviews.Width,0)
				p1.LoadLayout("frmtemplate_comment")
				p1.height = pnlitem_comment.height + 4
				
				Library.LabelSpace(lblcomment_review,1.3)

				lblauthor.Text = m1.Get("author")
				
				If Library.IsPersian Then
					lbldate_comment.Text = Library.GetDate(m1.Get("date_added"))
					lblcomment_review.Gravity = Gravity.RIGHT
				Else
					lbldate_comment.Text = m1.Get("date_added")
					lblcomment_review.Gravity = Gravity.LEFT
				End If
				
				lblcomment_review.Text = html1.FromHtml(m1.Get("text"))'Library.ConvertHtml2String(m1.Get("text"))
				
				Dim newHeight As Int
				newHeight = sett.MeasureMultilineTextHeight(lblcomment_review,m1.Get("text"))
				
				If newHeight < p1.height Then
					newHeight = p1.height
				End If
				
				lblnumber.Text = j + 1
				
				lblcomment_review.height = newHeight
				p1.height = p1.height + (newHeight - p1.height)
				
				topReviews = topReviews + p1.height
				
				If j = 0 Then topReview = topReviews - p1.height
				
				#Region Rating
				
				Dim rating1 As Int
				rating1 = m1.Get("rating")
				
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
				
				DoEvents
				
			Next
			
		End If
		
		progress.Visible = False
		
		Dim btnbackre As Button
		btnbackre.Initialize("btnbackreviews")
		btnreview.Initialize("btnreview")
		
		topReviews = topReviews + 15
		
		svReviews.Panel.AddView(btnbackre,0,topReviews,120dip,40dip)
		topReviews = topReviews + 45dip
		svReviews.Panel.AddView(btnreview,0,topReviews,120dip,40dip)
		DoEvents
		
		Dim cd As ColorDrawable
		cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),5,1,Colors.Gray)
		btnbackre.Background = cd
		btnbackre.Text = Library.GetStringResourse("back")
		btnbackre.TextColor = Colors.White
		btnbackre.TextSize = 14
		btnbackre.Typeface = Library.GetFont
		Library.CenterView(btnbackre,Activity)
		
		Dim cd As ColorDrawable
		cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),5,1,Colors.Gray)
		btnreview.Background = cd
		btnreview.Text = Library.GetStringResourse("review").Replace("[0]","")
		btnreview.TextColor = Colors.White
		btnreview.TextSize = 14
		btnreview.Typeface = Library.GetFont
		Library.CenterView(btnreview,Activity)
	
		svReviews.Panel.height = topReviews + 55dip
		
	End If

End Sub

Sub btnreview_Click
	btnbackreviews_Click
	actReview.id = product.Get("id")
	StartActivity(actReview)
End Sub

Sub btnreviews_Click
	
	If svReviews.Panel.NumberOfViews = 0 Then
		LoadReviews
	End If
	
	If svReviews.Panel.NumberOfViews = 0 Then Return
	
	pnlReviews.top = pnlReviews.Height
	pnlReviews.Visible = True
	pnlReviews.SetLayoutAnimated(500,0,0,pnlReviews.Width,pnlReviews.Height)
	pnlReviews.BringToFront
	DoEvents
	
End Sub

Sub btnbackreviews_Click
	pnlReviews.SetLayoutAnimated(500,0,pnlReviews.Height,pnlReviews.Width,pnlReviews.Height)
	DoEvents
End Sub

#End Region

Sub imgADs_Click
	
	Try
		Dim im As ImageView
		im = Sender
		actPicture.link = im.Tag
		actPicture.images = product.Get("images")
		StartActivity(actPicture)
	Catch
	End Try
	
End Sub

Sub RelatedProduct_receive(res As List,cat As String)
	
	Dim listoption As List
	listoption = product.Get("options")
	
	If listoption.IsInitialized Then
	
		If listoption.Size > 0 Then
			pnl2.Height = pnl2.Height - 660dip
		End If
		
		sv1.Panel.Height = sv1.Panel.Height + 20dip
		
		If res.Size > 0 Then
			Dim svhProduct As HorizontalScrollView
			top = AddHeader(Library.GetStringResourse("relat_product"),"newproduct",top)
			svhProduct.Initialize(0,"")
			sv1.Panel.AddView(svhProduct,0,top,sv1.Width,190dip)
			top = top + Library.LoadProductHorizontalScroll(res,svhProduct) + 70dip
			Dim v As View
			v = svhProduct.Panel.GetView(0)
			v.Top = 0
			'top = Library.LoadProduct(res,top,sv1)
		End If
	
	End If
	
	sv1.Panel.Color = Colors.White
	sv1.Panel.Height = sv1.Panel.Height + 430dip
	
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
	
	p1.Height = pnlheadert.Height
	lblheadername.Text = Title
	pnloverheader.Tag = Tag
	
	Tops = Tops + p1.Height + 4dip
	
	Dim c1 As ColorDrawable
	c1.Initialize(Library.Theme_Header,16dip)
	pnlheaderproduct.Background = c1
	
	sv1.Panel.Height = sv1.Panel.Height + p1.Height
	
	Return Tops
	
End Sub

Sub pnlover_Click
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.SetVisibleAnimated(500,True)
	
	Dim temp As Map
	temp = p1.Tag
	product = temp
	top = 0
	sv1.Panel.RemoveAllViews
	
	Activity_Create(False)
	
End Sub

#Region Slideshow

Sub tmrSlideshow_Tick
	
	Try
		If Library.imagesSlideshow.IsInitialized = False Then Return
	
		If offsetSlideshow = listSlideshow.Size  Then offsetSlideshow = 0
	
		slidepanelPage.GotoPage(offsetSlideshow,True)
		DoEvents
		offsetSlideshow = offsetSlideshow + 1
		
	Catch
		Log("Error [Function : tmrSlideshow_Tick , Module : actProduct ]")
	End Try
	
End Sub

#End Region

#Region Bookmark

Sub btnbookmark_Click
	
	Dim op As OpenCart
	op.Initialize

	sv1.ScrollToNow(0)
	
	If Bookmark.Bookmark(product) = True Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("add_bookmark"),2,True)
		btnbookmark.TextColor = Colors.Red
		op.Wishlist(Me,"Bookmark_receive",product.Get("id"))
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("remove_bookmark"),2,True)
		btnbookmark.TextColor = Colors.RGB(145, 145, 145)
		op.Wishlist(Me,"Bookmark_receive","-" & product.Get("id"))
	End If
	
End Sub

Sub Bookmark_receive(res As Map,cat As String)
	Log(res)
End Sub

#End Region

Sub btnshare_Click
	
	Dim id1 As id
	Dim rs As Int
	
'	rs = id1.InputList1(Array As String(Library.GetStringResourse("share_all"),Library.GetStringResourse("share_inapp")),Library.GetStringResourse("share"))
	
	Dim link As String
	
'	If rs = 0 Then
		link = details.GetURL & "/index.php?route=product/product&product_id=" & product.Get("id")
		
'	Else If rs = 1 Then
'		link = "opencart://" & Library.GetStringResourse("scheme") & "/" & product.Get("id")
'		
'	End If
'	
	Library.ShareString(product.Get("name"),product.Get("name") & CRLF & link,Library.GetStringResourse("share"))
	
	
End Sub

#Region cart

Sub lbladd2cart_Click

	If Library.InternetState = False Then
		MyToastMessageShow.Initialize(Activity)
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	If Library.GetStringResourse("need_to_login_site") = "1" And Library.loginDetails.IsInitialized = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("login_force"),1.5,False)
		Return	
	End If
	
	If lbladd2cart.Text = Library.GetStringResourse("call_us") Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("call_us"),1.5,False)
		Return
	End If
	
	If product.Get("quantity") = 0 Then
		MyToastMessageShow.Initialize(Activity)
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_product"),1.5,False)
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
	
	progress.Visible = True
	details.Add2Cart(Me,"Add2Cart_receive",product.Get("id"),sMin,options)
	
End Sub

Sub btnbasket_Click
	Activity.Finish
	StartActivity(actBasket)
End Sub

Sub Add2Cart_receive(res As Map,cat As String)
	
	progress.Visible = False
	
	If res.ContainsKey("error") Then
		
		Dim rs As Map
		Dim err As String
		
		rs = res.Get("error")
		
		For i = 0 To rs.Size - 1
			Dim temp As String
			temp = rs.GetValueAt(i)
			temp = temp.Replace("{","").Replace("}","").Replace(",","")
			temp = Library.RegexReplace("\d+=",temp,CRLF)
			err = err & temp & CRLF
		Next
		
		MyToastMessageShow.ShowToastMessageShow(err,2,False)
		
		Return
		
	End If
	
	If res.Get("success") = True Then
		sv1.ScrollPosition = 0
		DoEvents
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("add2cart"),2,True)
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
	btnbasket.TextColor = Colors.Red
End Sub

#End Region

Sub btnback_Click
	slidemenu1.ToggleMenu
	'Activity.Finish
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_MENU Then
		slidemenu1.ToggleMenu
		
	Else If KeyCode = KeyCodes.KEYCODE_BACK Then
		
		If pnlQR.IsInitialized Then
			If pnlQR.Visible = True Then
				pnlQR.SetVisibleAnimated(500,False)
				Return True
			End If
		End If
		
		If pnlReviews.top = 0 And pnlReviews.Visible = True Then
			btnbackreviews_Click
			Return True
		End If
		
		If pnlAttribute.top = 0 And pnlAttribute.Visible = True Then
			btnbackattr_Click
			Return True
		End If
		
		IsOpenProduct = False
		Activity.Finish
		
		Return True
		
	End If
	
End Sub

#Region Attribute

Sub LoadAttribute
	
	Dim attr As List
	
	If product.ContainsKey("attribute_groups") Then
		attr = product.Get("attribute_groups")
	End If
	
	If attr.IsInitialized = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_attribute"),1.5,False)
		Return
	End If
	
	If attr.Size = 0 Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_attribute"),1.5,False)
		Return
	End If
	
	progress.Visible = True
	
	Dim topAttribute As Int
	
	Dim lblHeader As Label
	lblHeader.Initialize("")
	lblHeader.Color = Library.Theme_Background
	
	lblHeader.Typeface = Library.GetFont
	
	lblHeader.TextSize = 14
	lblHeader.TextColor = Colors.Gray
	lblHeader.Text = Library.GetStringResourse("attribute")
	lblHeader.Gravity = Library.GetStringResourse("direction")
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
		lblKey.Typeface = Library.GetFont
		lblKey.TextSize = 14
		lblKey.TextColor = Colors.White
		lblKey.Text = temp.Get("name")
		lblKey.Gravity = Library.GetStringResourse("direction")
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
			lblVal.Typeface =  Library.GetFont
			lblVal.TextSize = 12
			lblVal.TextColor = Colors.Black
			lblVal.Text = attrs.Get("name") & " : " & attrs.Get("text")
			lblVal.Gravity = Library.GetStringResourse("direction")
			Library.PaddingLabel(lblVal,10,0,10,0)
			
			svAttribute.Panel.AddView(lblVal,pnl2.Left,topAttribute,pnl2.Width,40dip)
			topAttribute = topAttribute + 40dip
			svAttribute.Panel.Height = svAttribute.Panel.Height + 40dip
			
			DoEvents
			
		Next
		
		DoEvents
		
	Next
	
	Dim btnback As Button
	btnback.Initialize("btnbackattr")
	
	topAttribute = topAttribute + 15
	
	svAttribute.Panel.AddView(btnback,0,topAttribute,120dip,40dip)
	DoEvents
	
	Dim cd As ColorDrawable
	cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),5,1,Colors.Gray)
	btnback.Background = cd
	btnback.Text = Library.GetStringResourse("back")
	btnback.TextColor = Colors.White
	btnback.TextSize = 14
	btnback.Typeface = Library.GetFont
	Library.CenterView(btnback,Activity)

	svAttribute.Panel.height = topAttribute + 55dip
	
	progress.Visible = False
	
End Sub

Sub lblattributes_Click
	
	If svAttribute.Panel.NumberOfViews = 0 Then
		LoadAttribute
	End If
	
	If svAttribute.Panel.NumberOfViews = 0 Then Return
	
	pnlAttribute.top = pnlAttribute.Height
	pnlAttribute.Visible = True
	pnlAttribute.SetLayoutAnimated(500,0,0,pnlAttribute.Width,pnlAttribute.Height)
	pnlAttribute.BringToFront
	DoEvents
	
End Sub

Sub btnbackattr_Click
	pnlAttribute.SetLayoutAnimated(500,0,pnlAttribute.Height,pnlAttribute.Width,pnlAttribute.Height)
	DoEvents
End Sub

#End Region

Sub LoadOptions(attr As List)
	
	Dim c1 As ColorDrawable
	c1.Initialize2(Colors.White,7,1,Colors.Gray)
	
	Dim Glide As AriaGlide
	
	If attr.IsInitialized = False Then Return
	If attr.Size = 0 Then Return
	
	progress.Visible = True
	
	topOptions = top
	
	Dim lblHeader As Label
	lblHeader.Initialize("")
	lblHeader.Color = Colors.White
	
	lblHeader.Typeface = Library.GetFont
	lblHeader.TextSize = 14
	lblHeader.TextColor = Colors.Gray
	lblHeader.Text = Library.GetStringResourse("options")
	lblHeader.Gravity = Library.GetStringResourse("direction")
	Library.PaddingLabel(lblHeader,10,0,10,0)
	pnl2.AddView(lblHeader,pnl2.Left,top + 20,pnl2.Width,40dip)
	top = top + lblHeader.Height+13dip
	sv1.Panel.Height = sv1.Panel.Height + 60dip
	pnl2.Height = sv1.Panel.Height + 60dip
	
	For i = 0 To attr.Size - 1
		
		Dim OptionType As Map
		Dim OptionValue As List
		
		OptionType = attr.Get(i)
		OptionValue = OptionType.Get("option_value")
		
		Dim lblKey As Label
		lblKey.Initialize("")
		lblKey.Color = Library.Theme_Header
		lblKey.Typeface = Library.GetFont
		lblKey.TextSize = 11
		lblKey.TextColor = Colors.White
		lblKey.Text = OptionType.Get("name") & " " & Library.GetStringResourse("request_state_" & OptionType.Get("required"))
		lblKey.Gravity = Library.GetStringResourse("direction")
		Library.PaddingLabel(lblKey,10,0,10,0)

		pnl2.AddView(lblKey,pnl2.Left,top,pnl2.Width,40dip)
		
		top = top + 43dip
		sv1.Panel.Height = sv1.Panel.Height + 43dip
		pnl2.Height = pnl2.Height + 43dip
		
		Dim sp1 As Spinner
		sp1.Initialize("")
		
		Dim pDefault As Panel
		Dim blnAddPanel As Boolean
		Dim TopRB As Int = 0
		pDefault.Initialize("")
		
		If OptionType.Get("type") = "text" Or OptionType.Get("type") = "file" Or OptionType.Get("type") = "textarea" Or OptionType.Get("type") = "time" Or OptionType.Get("type") = "date" Or OptionType.Get("type") = "datetime" Then
				
			Dim txt1 As EditText
			txt1.Initialize("txtoption")
			txt1.Typeface = Library.GetFont
			txt1.Background = c1
			txt1.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":"","Type" : OptionType.Get("type") ,"Index" : ListOptions.Size-1)
			ListOptions.Add(txt1)
			
			If OptionType.Get("type") = "textarea" Then
				txt1.SingleLine = False
				pnl2.AddView(txt1,10,top,pnl2.Width-20,120dip)
				top = top + 128dip
				sv1.Panel.Height = sv1.Panel.Height + 128dip
				pnl2.Height = sv1.Panel.Height + 128dip
				txt1.Gravity = Bit.Or(Library.GetStringResourse("direction"),Gravity.top)
			Else
				txt1.SingleLine = True
				pnl2.AddView(txt1,10,top,pnl2.Width-20,40dip)
				top = top + 48dip
				txt1.Gravity = Library.GetStringResourse("direction")
				sv1.Panel.Height = sv1.Panel.Height + 48dip
				pnl2.Height = sv1.Panel.Height + 48dip
			End If
			
			Continue
				
		End If
		
		For j = 0 To OptionValue.Size - 1
			Dim attrs As Map
			attrs = OptionValue.Get(j)
			
			If OptionType.Get("type") = "radio" Then
				
				Dim rb1 As RadioButton
				rb1.Initialize("")
				rb1.TextSize = 12
				Dim price_format As String
				price_format = attrs.Get("price_formated")
				If price_format = "false" Then price_format = ""
				
				rb1.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
				
'				If j = 0 Then
'					rb1.Checked = True
'				End If
				
				ListOptions.Add(rb1)
				
				'pnl2.AddView(rb1,10,top,pnl2.Width-20,40dip)
				If blnAddPanel = False Then
					pnl2.AddView(pDefault,0,top,100%x,40dip)
				End If
				
				blnAddPanel = True
				
				If Library.IsPersian Then
					Dim lb2 As Label
					lb2.Initialize("")
					lb2.Text = "  " & attrs.Get("name") & " ( " & attrs.Get("price_prefix") & price_format & " )"
					lb2.Gravity = Gravity.RIGHT
					lb2.TextColor = Colors.Black
					lb2.TextSize = 11
					lb2.Typeface = Library.GetFont
					pDefault.AddView(lb2,0,TopRB+10,100%x - 40dip,40dip)
					pDefault.AddView(rb1,100%x-40dip,TopRB,40dip,40dip)
				Else
					rb1.Text = "  " & attrs.Get("name") & " ( " & attrs.Get("price_prefix") & price_format & " )"
					rb1.Gravity = Library.GetStringResourse("direction")
					rb1.Typeface = Library.GetFont
					pDefault.AddView(rb1,10,TopRB,pnl2.Width-20,40dip)
				End If
				
				top = top + 40dip
				TopRB = TopRB + 40dip
				sv1.Panel.Height = sv1.Panel.Height + 48dip
				pDefault.Height = pDefault.Height + 48dip
				pnl2.Height = sv1.Panel.Height + 48dip
			
			Else If OptionType.Get("type") = "checkbox" Then
				
				Dim ck1 As CheckBox
				ck1.Initialize("")
				ck1.Typeface = Library.GetFont
				ck1.TextSize = 12
				ck1.Gravity = Library.GetStringResourse("direction")
				ck1.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
				ListOptions.Add(ck1)
				
				Dim pr As String
				pr = attrs.Get("price_formated")
				If pr = "false" Then pr = " "
				
				If Library.IsPersian Then
					Dim lb21 As Label
					lb21.Initialize("")
					lb21.Text = "  " & attrs.Get("name") & " ( " & attrs.Get("price_prefix") & pr & " )" 
					lb21.Gravity = Gravity.RIGHT
					lb21.TextColor = Colors.Black
					lb21.Typeface = Library.GetFont
					lb21.TextSize = 11
					pnl2.AddView(lb21,0,top+10,100%x - 40dip,40dip)
					pnl2.AddView(ck1,100%x-40dip,top,40dip,40dip)
				Else
					ck1.Text = "  " & attrs.Get("name") & " ( " & attrs.Get("price_prefix") & attrs.Get("price_formated") & " )" 
					pnl2.AddView(ck1,10,top,pnl2.Width-20,40dip)
				End If
				
				top = top + 40dip
				sv1.Panel.Height = sv1.Panel.Height + 58dip
				pnl2.Height = sv1.Panel.Height + 58dip
				
			Else If OptionType.Get("type") = "select" Then
				
				Dim attrs1 As Map
				attrs1 = OptionValue.Get(j)
				
				Dim pr As String
				pr = attrs1.Get("price_formated")
				If pr = "false" Then pr = " )"
				
				sp1.Add(attrs1.Get("name") & " ( " & attrs1.Get("price_prefix") & pr & " )")
				
				If sp1.Size = OptionValue.Size Then
					sp1.SelectedIndex = 0
					sp1.Tag = CreateMap("Vals" : OptionValue,"id":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
					ListOptions.Add(sp1)
					sp1.TextSize = 12
					pnl2.AddView(sp1,10,top,pnl2.Width-20,40dip)
					top = top + 40dip
					topOptions = top
					sv1.Panel.Height = sv1.Panel.Height + 48dip
					pnl2.Height = sv1.Panel.Height + 48dip
				End If
				
			Else If OptionType.Get("type") = "image" Then
				
				Dim imageMap As Map
				imageMap.Initialize
				
				Dim img As Map
				img = OptionValue.Get(j)
				
				Dim rbimage As RadioButton
				rbimage.Initialize("")
				rbimage.TextSize = 12
				rbimage.Gravity = Library.GetStringResourse("direction")
				rbimage.Tag = CreateMap("ID":OptionType.Get("product_option_id"),"Val":attrs.Get("product_option_value_id"))
				
				Dim image As ImageView
				image.Initialize("")
				
				Dim lblImage As Label
				lblImage.Initialize("")
				lblImage.Typeface = Library.GetFont
				lblImage.TextSize = 11
				lblImage.TextColor = Colors.Black
				lblImage.Text = "  " & img.Get("name") & " ( " & img.Get("price_prefix") & " )" 
				lblImage.Gravity = Library.GetStringResourse("direction")
				
				If Library.IsPersian Then
					pnl2.AddView(rbimage,100%x-38dip,top,34dip,34dip)
					pnl2.AddView(image,100%x-38dip-38dip,top,34dip,34dip)
					pnl2.AddView(lblImage,0,top+8,100%x-38dip-38dip,43dip)
					lblImage.Gravity = Gravity.RIGHT
				Else
					pnl2.AddView(rbimage,10,top,34dip,34dip)
					pnl2.AddView(image,rbimage.Left + rbimage.Width,top,34dip,34dip)
					pnl2.AddView(lblImage,image.Left + image.Width,top,pnl2.Width-image.Width-(image.Width)-14,43dip)
				End If
				
'				If j = 0 Then rbimage.Checked = True
				
				Dim thumb As String
				thumb = img.Get("image")
				thumb = thumb.Replace(" ","%20")
				
				Glide.Load(thumb).AsBitmap.Resize(Abs(image.Width),Abs(image.Height)).CenterCrop.IntoImageView(image)
				
				ListOptions.Add(rbimage)
				
				top = top + 37dip
				topOptions = top
				sv1.Panel.Height = sv1.Panel.Height + 48dip
				pnl2.Height = sv1.Panel.Height + 48dip
			
			End If
			
			DoEvents
			
			pnl2.Height = pnl2.Height + 43dip
			
		Next
		
		DoEvents
		
	Next
	
	Dim divid As Label
	divid.Initialize("")
	divid.Color = Colors.RGB(212,212,212)
	pnl2.AddView(divid,10,top + 4,sv1.Width-20,1)
	
	progress.Visible = False
	
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
		If v1 Is EditText Then
			Dim txt1 As EditText
			txt1 = v1
			vals.Put(data.Get("ID"),txt1.Text)
		#End Region
		
		#Region get choosen radio
		Else If v1 Is RadioButton Then
			Dim rb1 As RadioButton
			rb1 = v1
			
			If rb1.Checked = True Then
				vals.Put(data.Get("ID"),data.Get("Val"))
			End If
		#End Region
		
		#Region Get Select data
		Else If v1 Is Spinner Then
			Dim sp1 As Spinner
			sp1 = v1
			
			Dim l1 As List
			l1 = data.Get("Vals")
			
			Dim choosen As String
			choosen = sp1.SelectedItem
				
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
		Else If v1 Is CheckBox Then
			Dim chk1 As CheckBox
			chk1 = v1
			
			If chk1.Checked = True Then
				If vals.ContainsKey(data.Get("ID")) Then
					vals.Put(data.Get("ID"),vals.Get(data.Get("ID")) & "<!>" & data.Get("Val"))
				Else
					vals.Put(data.Get("ID"),data.Get("Val"))
				End If
			End If
		
		End If
		#End Region
	Next
	
	For p = 0 To vals.Size - 1
		Dim te As String
		te = vals.GetValueAt(p) 
		If te.IndexOf("<!>") > -1 Then
			Dim s1() As String
			s1 = Regex.Split("<!>",te)
			
			Dim valid_val As List
			valid_val.Initialize
			
			For o = 0 To s1.Length - 1
				valid_val.Add(s1(o))
			Next
			
			vals.Put(vals.GetKeyAt(p),valid_val)
		End If
	Next
	
	Options.Put("options",vals)
	
	Return vals
	
End Sub

Sub txtoption_FocusChanged(HasFocus As Boolean)
		
	If HasFocus Then

		Dim ed As EditText
		ed = Sender
		
		Dim ime As IME
		ime.Initialize("")
		
		If ed.IsInitialized = False Then Return
		
		Dim data As Map
		data = ed.Tag
		
		Dim sType As String
		sType = data.Get("Type")
		
		If sType = "date" Then
			
			ime.HideKeyboard
			
			Dim Arrdate() As Int
			Arrdate = Library.ParseDate(ed.Text)
			
			ed.Text = Library.MakeDateDialog(Arrdate(0),Arrdate(1),Arrdate(2))
			
		Else If sType = "time" Then
			
			ime.HideKeyboard
			
			Dim picker1 As TimeDialog
			Dim Arrtime() As Int
			picker1.Is24Hours = False
			Arrtime = Library.ParseTime(ed.Text) 
			
			picker1.Hour = Arrtime(0)
			picker1.Minute = Arrtime(1)
 
			If picker1.Show(Library.GetStringResourse("enter_time"),Library.GetStringResourse("time_title"),Library.GetStringResourse("ok"),Library.GetStringResourse("cancel"),"",Null) = DialogResponse.POSITIVE Then
				ed.Text = picker1.Hour & ":" & picker1.Minute
			End If
		
		Else If sType = "datetime" Then
			
			ime.HideKeyboard
			
			Dim picker1 As TimeDialog
			Dim date,time As String
			date = Library.MakeDateDialog(0,0,0)
			time = picker1.Show(Library.GetStringResourse("enter_time"),Library.GetStringResourse("time_title"),Library.GetStringResourse("ok"),Library.GetStringResourse("cancel"),"",Null)
			time = picker1.Hour & ":" & picker1.Minute
			ed.Text = date & " " & time
			
		End If
		
	End If
	
End Sub

Sub txtoption_Click
	txtoption_FocusChanged(True)
End Sub

Sub lbloptions_Click
	sv1.ScrollToNow(topOptions)
End Sub

Sub lblattr_Click
	sv1.ScrollToNow(topAttr)
End Sub

Sub btnadd_2_cart_Click
	
	Dim b1 As Button
	b1 = Sender
	
	Library.Add2Cart(b1.Tag,"1",Me)
	
End Sub

Sub Add2Cart2_receive(res As Map,cat As String)
	
	ProgressDialogHide
	
	If res.ContainsKey("error") Then
		
		Dim rs As Map
		
		rs = res.Get("error")
		
		If rs.ContainsKey("option") Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("cannot_add_cart"),2,False)
			product = CreateMap("product_id":Library.ProductChoosenID)
			Library.ProductChoosenID = 0
			Activity_Create(False)
			Return
		End If
		
	End If
	
	If res.Get("success") = True Then
		sv1.ScrollPosition = 0
		DoEvents
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("add2cart"),2,True)
	End If
	
	Library.ProductChoosenID = 0
	
End Sub

Sub btnsearch_Click
	
	sv1.ScrollToNow(0)
	
	If Library.ListProductIDForCompare.Size > 4 Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("limit_compare"),2,False)
		Return	
	End If
	
	Dim id As String
	id = ""
	
	For i = 0 To Library.ListProductIDForCompare.Size - 1
		If Library.ListProductIDForCompare.Get(i) =	product.Get("product_id") Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("adding2comparelist"),2,True)
			Return
		End If
	Next
	
	If id = "" Then id = product.Get("id")
	
	Library.ListProductIDForCompare.Add(id)
	
	Library.comparelist = Library.GetStringResourse("comparelist") & $" ( ${Library.ListProductIDForCompare.Size} )"$
	slidemenu1.AddHeader
	
	MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("adding2comparelist"),2,True)
	
End Sub

Sub lblpayment_Click

	If Library.InternetState = False Then
		ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
		Return
	End If
	
	If Library.loginDetails.IsInitialized Then
		If Library.loginDetails.Get("login") = True Then
			If DateTime.Now - Library.loginDetails.Get("expire")  > 1010020 Then
				Activity.Finish
				StartActivity(actLogin)
				Return
			End If
			StartActivity(actDoOrder)
			Return
		End If
	End If
	
	If Library.GuestLogin.IsInitialized Then
		If Library.GuestLogin.Get("login") = True Then
			StartActivity(actDoOrder)
			Return
		End If
	End If
	
	Dim id1 As id
	Dim rs As Int
	
	rs = id1.InputList1(Array As String(Library.GetStringResourse("guest"),Library.GetStringResourse("register"),Library.GetStringResourse("login")),Library.GetStringResourse("user_choose"))
	
	If rs = 0 Then
		actRegister.Guest = True
		StartActivity(actRegister)
		
	Else If rs = 1 Then
		Activity.Finish
		StartActivity(actRegister)
	
	Else If rs = 2 Then
		Activity.Finish
		StartActivity(actLogin)
	End If
	
End Sub

Sub sve1_ScrollChanged(Position As Int)
	
	If Position > 100 Then
		If ScollButton.Top <> Activity.Height - ScollButton.Height Then
			ScollButton.BringToFront
			ScollButton.SetLayoutAnimated(760,ScollButton.Left,Activity.Height-30dip- ScollButton.Height,ScollButton.Width,ScollButton.Height)
		End If
	
	Else if Position < 100 Then
		If ScollButton.Top <> Activity.Height + ScollButton.Height Then
			ScollButton.SetLayoutAnimated(760,ScollButton.Left,Activity.Height + ScollButton.Height,ScollButton.Width,ScollButton.Height)
		End If
	End If
	
	If Position > pnlads.top + pnlads.Height And FixPanelHeader = False Then
		FixPanelHeader = True
		Dim pnl As Panel
		pnl = pnlheader
		Dim w,h As Int
		w = pnlheader.Width
		h = pnlheader.Height
		pnlheader.RemoveView
		DoEvents
		Activity.AddView(pnl,0,0,w,h)
		pnl.Color = Library.Theme_Header
		btnbasket.TextColor = Colors.White
		btnbookmark.TextColor = Colors.White
		btnshare.TextColor = Colors.White
		btnsearch.TextColor = Colors.White
		btnback.TextColor = Colors.White
		btnqr.TextColor = Colors.White
		btnback.TextColor = Colors.White
		If product.Get("quantity") > 0 Then pnlBasket.SetVisibleAnimated(600,True)
		pnl.Visible = False
		pnl.SetVisibleAnimated(600,True)
		Library.ChangeStatusColor
		DoEvents
		
	Else If Position < pnlads.top + pnlads.Height And FixPanelHeader = True Then
		FixPanelHeader = False
		Dim pnl As Panel
		pnl = pnlheader
		Dim w,h As Int
		w = pnlheader.Width
		h = pnlheader.Height
		pnlheader.RemoveView
		pnlBasket.SetVisibleAnimated(600,False)
		DoEvents
		sv1.Panel.AddView(pnl,0,0,w,h)
		pnl.Color = Colors.White
		btnbasket.TextColor = Colors.Gray
		btnbookmark.TextColor = Colors.Gray
		btnshare.TextColor = Colors.Gray
		btnsearch.TextColor = Colors.Gray
		btnback.TextColor = Colors.Gray
		btnqr.TextColor = Colors.Gray
		btnback.TextColor = Colors.Gray
		Library.ChangeStatusColor2(Colors.White)
		DoEvents
		
	End If
	
End Sub

Sub btncategory_Click
	StartActivity(actCategory)
End Sub

Sub btnqr_Click
	
	If pnlQR.IsInitialized = False Then
		
		pnlQR.Initialize("pnlqr")
		pnlQR.Color = Colors.ARGB(210,72,72,72)
		Activity.AddView(pnlQR,0,0,100%x,100%y)
		pnlQR.Visible = False
		
		Dim im As ImageView
		im.Initialize("")
		pnlQR.AddView(im,0,0,250,250)
		im.Gravity = Gravity.FILL
		Library.CenterView2(im,pnlQR)
		
		Dim code As String
		code = Library.GetStringResourse("url") & "/index.php?route=product/product&product_id=" & product.Get("id")
		QRcode.Draw_QR_Code(code,"L",7,Colors.White,Library.ConvertHex2Int(Library.GetStringResourse("theme_header")),"S")
		
		im.Bitmap = LoadBitmap(File.DirRootExternal, "/pictures/QRcode.png")
		
		pnlQR.SetVisibleAnimated(500,True)
		
		Return
			
	End If
	
	If pnlQR.Visible = False Then
		pnlQR.SetVisibleAnimated(500,True)
	Else
		pnlQR.SetVisibleAnimated(500,False)
	End If
	
End Sub

Sub pnlqr_Click
	pnlQR.SetVisibleAnimated(500,False)
End Sub

Sub FinishMe
	Activity.Finish
End Sub

Sub btnScrollUp_Click
	sv1.ScrollPosition = 0
	DoEvents
End Sub