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
	
	Private ScollButton As Button
	Private lbltitle As Label
	Private lblpb As Label
	Private pnlloading As Panel
	Private lblctitle As Label
	Private imgicon As ImageView
	Private pncategory As Panel
	Private pnlheader As Panel
	
	Private historyCategory,historyCategoryTitle As List
	
	Private imgiconcat As ImageView
	Private pnlovercat As Panel
	Private lblbasket As Label
	Dim MyToastMessageShow As MyToastMessageShow
	
	Dim ulv As UltimateListView
	Dim result,resultCategory As List
	Dim cache_state As Boolean
	Dim error_image As BitmapDrawable
	Dim op As OpenCart
	Private currentCategoryID As String : currentCategoryID = ""
	
	
	Private pnlcontainer As Panel
	Private btnreturn As Button
	
	Private loading As ProgressBar
	Private btnclose As Button
	Private lblcrumb As Label
	Dim aria As AriaGlide
	
End Sub

#Region Activity Section

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmcategory")
	MyToastMessageShow.Initialize(Activity)
	
	Library.ChangeStatusColor
	
'	Library.Bookmarked.Clear
	
	ScollButton = Library.MakeUpScrollButton(Activity)
	
	btnreturn.Width = ScollButton.Width
	btnreturn.Height = ScollButton.Height
	
	Library.setLocalApp(Library.currLang)
	
	lbltitle.Text = Library.GetStringResourse("category")
	lbltitle.Tag = lbltitle.Text
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	
	Dim c1 As ColorDrawable
	c1.Initialize(Library.Theme_Header,50)
	btnreturn.Background = Library.GetButtonStateCircle(btnreturn.Width)
	
	currentCategoryID = "0"
	
	historyCategory.Initialize	
	historyCategoryTitle.Initialize
	
	historyCategory.Add("0")
	historyCategoryTitle.Add(Library.GetStringResourse("home"))
	
	cache_state		= Library.manager.GetBoolean("cache")
	error_image.Initialize(LoadBitmap(File.DirAssets,"noimage.png"))
	
	op.Initialize
	
	ulv.Initialize(0, 0, "", "ULV")
	ulv.Color = Library.Theme_Background
	
	Dim cd As ColorDrawable
	cd.Initialize(Colors.Transparent,0)
	ulv.PressedDrawable = cd
	
	pnlcontainer.AddView(ulv, 0, 0,pnlcontainer.Width, pnlcontainer.Height)
	
	lblcrumb.Text = Library.GetStringResourse("home")
	
	ulv.AddLayout("category","Categorys_LayoutCreator","Categorys_ContentFiller",93dip,True)
	ulv.AddLayout("products","Items_LayoutCreator", "Items_ContentFiller",113dip,True)
	
	Dim cache As List
	cache = Library.CacheSystem.GetCacheAsList(currentCategoryID,"category")
	
	If cache.IsInitialized Then
		CategoryList_Receive(cache,"")
	Else
		pnlloading.SetVisibleAnimated(600,True)
		op.GetCategory(Me,"CategoryList_Receive","")
	End If
	
End Sub

Sub Activity_Resume
	Library.ShowCartLabel(lblbasket)
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		If historyCategory.Size = 1 Then
			Activity.Finish
		Else
'			pnloverreturn_Click
		End If
'		Return True
	End If
	
End Sub

#End Region

#Region Buttons

Sub btnsearch_Click
	StartActivity(actSearch)
End Sub

Sub btnbasket_Click
	StartActivity(actBasket)	
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

#End Region

Sub ShowCrumb
	
	Dim title,count As String
	
	If result.IsInitialized Then
		count = " [ " & result.Size & " ]"
	End If
	
	If historyCategoryTitle.Size > 1 Then
		For i = 0 To  historyCategoryTitle.Size - 1
			title = title & " » " & historyCategoryTitle.Get(i)
		Next
		title = title & " " & count
	Else
		title = Library.GetStringResourse("home")
	End If
	
	lblcrumb.Text = title
	
End Sub

Sub CategoryList_Receive(res As List,scategory As String)
	
	resultCategory = res
	
	If res.IsInitialized = True Then
		Library.CacheSystem.AddList2Cache(currentCategoryID,res,"category")
	End If
	
	ulv.ClearContent
	
	If res.IsInitialized Then
		ulv.BulkAddItems(res.Size, "category", 0)
	End If

	If currentCategoryID <> 0 Then

		Dim cache As List
		cache = Library.CacheSystem.GetCacheAsList(currentCategoryID,"product_of_category")
	
		If cache.IsInitialized Then
			ProductsList_Receive(cache,"")
		Else
			pnlloading.Visible = True
			op.GetCategoryProducts(Me,"ProductsList_Receive",currentCategoryID)
		End If
		
	Else
		pnlloading.Visible = False
		lbltitle.Text = lbltitle.Tag
		loading.Visible = False
		btnclose.Visible = True
'		btnreturn.SetVisibleAnimated(800,False)
	End If
	
End Sub

Sub Categorys_LayoutCreator(LayoutName As String, LayoutPanel As Panel)
	
	If Library.IsPersian Then
		LayoutPanel.LoadLayout("frmtemplage_category")
	Else
		LayoutPanel.LoadLayout("frmtemplage_category_en")
	End If
	
	LayoutPanel.Tag = "category"
		
End Sub

Sub Categorys_ContentFiller(ItemID As Long, LayoutName As String, LayoutPanel As Panel, Position As Int)
	
	If Position > resultCategory.Size - 1 Then
		Return	
	End If
	
	Dim pnl As Panel : pnl = LayoutPanel.GetView(0)
	Dim imgiconcat As ImageView
	Dim lblctitle As Label
	
	imgiconcat = pnl.GetView(0)
	lblctitle = pnl.GetView(1)
	
	Dim m1 As Map
	m1 = resultCategory.Get(Position)

	lblctitle.Text = m1.Get("name")
	lblctitle.Text = lblctitle.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
	
	Dim image As String
	image = m1.Get("image")
	image = image.Replace(" ","%20")
	
	If image.Length > 0 And image <> "null" Then
		aria.Load(image).AsBitmap.Error(error_image.Bitmap).Resize(imgiconcat.Width,imgiconcat.Height).CenterCrop.IntoImageView(imgiconcat)
	Else
		aria.Load("File:///android_asset/noimage1.png").AsBitmap.Error(error_image.Bitmap).Resize(imgiconcat.Width,imgiconcat.Height).CenterCrop.IntoImageView(imgiconcat)
	End If
	
End Sub

Sub ProductsList_Receive(res As List,sCategory As String)
	
	result = res
	
	ProgressDialogHide
'	ToastMessageShow(Library.GetStringResourse("loading"),False)
	
	Library.CacheSystem.AddList2Cache(currentCategoryID,res,"product_of_category")
	
	ShowCrumb
	
	'If res.IsInitialized = False Then
	If True Then
		pnlloading.SetVisibleAnimated(500,False)
		lbltitle.Text = lbltitle.Tag
		loading.Visible = False
		btnclose.Visible = True
		'Return
	End If
	
	If res.Size = 0 Then 
		pnlloading.SetVisibleAnimated(500,False)
		lbltitle.Text = lbltitle.Tag
		btnclose.Visible = True
		loading.Visible = False
		Return
	End If
	
	ulv.BulkAddItems(res.Size,"products", 1)
	
	If historyCategory.Size > 1 Then
		btnreturn.SetVisibleAnimated(800,True)
	Else
		btnreturn.SetVisibleAnimated(800,False)
	End If
	
End Sub

Sub Items_LayoutCreator(LayoutName As String, LayoutPanel As Panel)
	
	If Library.IsPersian Then
		LayoutPanel.LoadLayout("frmtemplate_product_fa")
	Else
		LayoutPanel.LoadLayout("frmtemplate_product_en")
	End If
	
	LayoutPanel.Tag = "product"
	
End Sub

Sub Items_ContentFiller(ItemID As Long, LayoutName As String, LayoutPanel As Panel, Position As Int)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	lbltitle.Text = lbltitle.Tag
	btnclose.Visible = True
	loading.Visible = False

	Dim pos As Int
	
	If resultCategory.IsInitialized Then
		pos = Abs(resultCategory.Size - Position)
	Else
		pos = Position
	End If

	If pos > result.Size - 1 Then
		Return
	End If

	Try
		
		Dim temp As Map
		temp = result.Get(pos)
		
		Dim pnl As Panel : pnl = LayoutPanel.GetView(0)
		Dim imgicon2 As ImageView
		Dim lblpprice,lblptitle,lblnostock,lblreview,lblfav As Label
		Dim lbls1,lbls2,lbls3,lbls4,lbls5 As Label
		
		imgicon2 = pnl.GetView(0)
		lblptitle = pnl.GetView(1)
		lblpprice = pnl.GetView(2)
		
		lbls1 = pnl.GetView(4)
		lbls2 = pnl.GetView(5)
		lbls3 = pnl.GetView(6)
		lbls4 = pnl.GetView(7)
		lbls5 = pnl.GetView(8)
		
		lblnostock = pnl.GetView(9)
		lblreview = pnl.GetView(10)
		lblfav = pnl.GetView(11)
		
		lbls1.TextColor = Library.Theme_Header
		lbls2.TextColor = Library.Theme_Header
		lbls3.TextColor = Library.Theme_Header
		lbls4.TextColor = Library.Theme_Header
		lbls5.TextColor = Library.Theme_Header
		
		lblptitle.Text = temp.Get("name")
		lblptitle.Text = lblptitle.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
		
		Dim price,special As String
		Dim quantity As Int
		
		quantity = temp.Get("quantity")
		
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
		
		If special = "null" Or special = "false" Then special = ""
		
		If Library.IsPersian Then
			lblptitle.Typeface = Typeface.LoadFromAssets("byekan.ttf")
			lblpprice.Typeface = Typeface.LoadFromAssets("byekan.ttf")
		Else
			lblptitle.Typeface = Typeface.SANS_SERIF
			lblpprice.Typeface = Typeface.SANS_SERIF
		End If
		
		If price.Length > 0 And special.Length = 0 Then
			lblpprice.Text = price
		Else If special.Length > 0 Then
			lblpprice.Text = Library.DiscountStyleLabel(price,special)
		End If
		
		If lblpprice.Text.ToLowerCase = "false" Then lblpprice.Text = Library.GetStringResourse("login_account")
			
		If quantity = 0 Then
			lblpprice.Text = temp.Get("stock_status")
		End If
		
		Dim PathImage As String
		
		If temp.ContainsKey("image") Then 
			PathImage = temp.Get("image")
		Else If temp.ContainsKey("thumb") Then
			PathImage = temp.Get("thumb")
		End If
		
		PathImage = PathImage.Replace(" ","%20")
		
		If PathImage.ToLowerCase = "null" Or PathImage.Length = 0 Then
			aria.Load("file:///android_asset/noimage1.png").AsBitmap.Error(error_image.Bitmap).Resize(imgicon2.Width,imgicon2.Height).CenterCrop.IntoImageView(imgicon2)
			
		Else
			#If com_apps_ebaghcom
				CallSubDelayed2(ImageDownloader,"Download",CreateMap(imgicon2:PathImage))
			
			#Else
				aria.Load(PathImage).AsBitmap.Error(error_image.Bitmap).Resize(imgicon2.Width,imgicon2.Height).CenterCrop.IntoImageView(imgicon2)
			#End If
			
		End If
		
		Dim review As Map
		review.Initialize
		review = temp.Get("reviews")
		If review.IsInitialized Then
			If review.ContainsKey("review_total") Then
				lblreview.Text = $"( ${review.Get("review_total") } )"$
			End If
		End If
		
		Dim id As String
		id = temp.Get("id")
		lblfav.Tag = id

		If Library.Bookmarked.ContainsKey(id) = True Then
			lblfav.Text = ""
			lblfav.TextColor = Library.Theme_Header
		Else
			lblfav.Text = ""
			lblfav.TextColor = Colors.Gray
		End If
		
'		Dim qu As Int
'		qu = temp.Get("quantity")
'		If qu = 0 Then
'			lblnostock.Visible = True
'			lblnostock.Text = Library.GetStringResourse("no_stock")
'		End If
		
		#region Rate
		Dim rating As String
		rating = temp.Get("rating")
		
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
	
		#end region
		
	Catch
		
	End Try
	
End Sub

Sub Target_OnBitmapReady(bitmap As Bitmap,Tag As Object)
 	
	Dim r As RoundImage
	
	Dim im As ImageView
	im = Tag
	im.Bitmap = r.CreateBitmap(bitmap)

End Sub

Sub ULV_ItemClick(ItemID As Long, Position As Int, ClickedPanel As Panel)

	If ClickedPanel.Tag = "product" Then
		
		Dim pos As Int
	
		If resultCategory.IsInitialized Then
			pos = Abs(resultCategory.Size - Position)
		Else
			pos = Position
		End If
	
		Dim data As Map
		
		data = result.Get(pos)
		
		actProduct.product = data
		StartActivity(actProduct)
		
		Return
		
	End If
	
	Dim data As Map
	data = resultCategory.Get(Position)
	
	btnreturn.Visible = True
	historyCategory.Add(data.Get("category_id"))
	historyCategoryTitle.Add(data.Get("name"))
	
	pnlloading.Visible = True
	lbltitle.Text = Library.GetStringResourse("loading")
	loading.Visible = True
	btnclose.Visible = False
	
	currentCategoryID = data.Get("category_id")
	
	Dim cache As List
	cache = Library.CacheSystem.GetCacheAsList(currentCategoryID,"category")
	
	If cache.IsInitialized Then
		CategoryList_Receive(cache,"")
	Else
		op.GetCategory(Me,"CategoryList_Receive",currentCategoryID)
	End If
	
	ulv.JumpTo(0,True)
	
End Sub

Sub btnreturn_Click
	
	If historyCategory.Size = 1 Then Return
	
	historyCategory.RemoveAt(historyCategory.Size-1)
	historyCategoryTitle.RemoveAt(historyCategoryTitle.Size-1)
	
	If historyCategory.Size = 1 Then btnreturn.Visible = False
	
	ShowCrumb
	
	currentCategoryID = historyCategory.Get(historyCategory.Size-1)
		
	pnlloading.Visible = True
	
	Dim cache As List
	cache = Library.CacheSystem.GetCacheAsList(currentCategoryID,"category")
	
	If cache.IsInitialized Then
		CategoryList_Receive(cache,"")
	Else
		op.GetCategory(Me,"CategoryList_Receive",currentCategoryID)
	End If
	
	ulv.JumpTo(0,True)
	
End Sub

Sub ULV_Scrolled(FirstVisibleItem As Int, VisibleItemCount As Int, TotalItemCount As Int, IsAtTop As Boolean, IsAtBottom As Boolean)
	
	If IsAtTop = False Then
		ScollButton.SetLayoutAnimated(760,ScollButton.Left,Activity.Height-10dip- ScollButton.Height,ScollButton.Width,ScollButton.Height)
	Else
		ScollButton.SetLayoutAnimated(760,ScollButton.Left,Activity.Height + ScollButton.Height,ScollButton.Width,ScollButton.Height)
	End If
	
End Sub

Sub btnScrollUp_Click
	ulv.JumpTo(0,True)
	ScollButton.SetLayoutAnimated(760,ScollButton.Left,Activity.Height + ScollButton.Height,ScollButton.Width,ScollButton.Height)
	DoEvents
End Sub

Sub lblfav_Click
	
	Dim lb As Label
	lb = Sender
	
	Dim op As OpenCart
	op.Initialize
	
	If Library.Bookmarked.ContainsKey(lb.Tag) = False Then
		Library.Bookmarked.Put(lb.Tag,True)
		lb.Text = ""
		lb.TextColor = Library.Theme_Header
		op.Wishlist(Me,"Bookmark_receive",lb.Tag)
		lb.Visible = False
		lb.SetVisibleAnimated(1100,True)
		ulv.RefreshContent
	Else
		lb.Text = ""
		lb.TextColor = Colors.Gray
		Library.Bookmarked.Remove(lb.Tag)
		op.Wishlist(Me,"Bookmark_receive","-" & lb.Tag)
		ulv.RefreshContent
	End If
		
End Sub

Sub Bookmark_receive(res As Map,cat As String)
	Log(res)
End Sub