Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@

Sub Process_Globals
	
	Private lbltitle As Label
	Private lblpb As Label
	Private pnlloading As Panel
	Private sv1 As ScrollView
	Dim category As OpenCart
	Private lblctitle As Label
	Private imgicon As ImageView
	Private pncategory As Panel
	Private pnlheader As Panel
	
	Private historyCategory As List
	
	Private pnloverreturn As Panel
	Private lblrtitle As Label
	Private pnlreturn As Panel
	
	Dim top As Int = 0
	Private imgiconcat As ImageView
	Private pnlovercat As Panel
	Private lblbasket As Label
	Private currentCategoryID As String
	Dim MyToastMessageShow1 As MyToastMessageShow
	Private btnopen As Button
	Private btnclose As Button
	Private btnsearch As Button
	Private btnbasket As Button
	
End Sub

public Sub StartActivity
	
	Library.CategoryPage.Initialize("pageCat")
	Library.CategoryPage.RootPanel.LoadLayout("frmcategory")
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	
	Library.SetFont(btnbasket.CustomLabel,"icomoon",btnbasket.CustomLabel.Font.Size)
	Library.SetFont(btnsearch.CustomLabel,"icomoon",btnsearch.CustomLabel.Font.Size)
	Library.SetFont(btnclose.CustomLabel,"icomoon",btnclose.CustomLabel.Font.Size)
	
	Library.NavControl.ShowPage(Library.CategoryPage)
	
	pnlheader.Color = Library.Theme_Header
	Library.CategoryPage.RootPanel.Color  = Library.Theme_Background
	
	MyToastMessageShow1.Initialize(Library.CategoryPage.RootPanel)
	
	lbltitle.Text = Library.GetStringResourse("category")
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	
	currentCategoryID = "0"
	
	historyCategory.Initialize	
	
	Dim lsCache As List
	lsCache = CacheData.GetCategoryFromCache("cats_" & currentCategoryID)
	
	If lsCache <> Null And lsCache.IsInitialized Then
		LoadCategory2Panel(lsCache)
		sv1.ContentHeight = sv1.ContentHeight + 130dip
		Return
	Else
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
	End If

	category.Initialize
	category.GetCategory(Me,"Category_receive","")
	
	Library.ShowCartLabel(lblbasket)
	
End Sub

Sub Category_receive(res As List,scategory As String)
	
	If res.IsInitialized = False Then
	
		If historyCategory.Size > 0 Then
			sv1.Panel.RemoveAllViews
			sv1.ScrollOffsetY = 0
			AddReturnPanel
			pnlloading.Visible = False
		End If
		
		Return
		
	End If
	
	CacheData.AddCategory2Cache(res,"cats_" & currentCategoryID)
	LoadCategory2Panel(res)
	
End Sub

#Region Load Category

Sub LoadCategory2Panel(res As List)
	
	top = 0
	sv1.Panel.RemoveAllViews
	sv1.Panel.Height = sv1.Height
	sv1.Panel.Color = Colors.White
	
	If historyCategory.Size > 1 Then
		AddReturnPanel
	End If
	
	#Region Add Item
	Dim im As Map
	im.Initialize
	
	For i = 0 To res.Size - 1
		
		Dim p1 As Panel
		p1.Initialize("")
		sv1.Panel.AddView(p1,0,top,sv1.Width,0)
	 
		If Library.IsPersian Then
			p1.LoadLayout("frmtemplage_category")
		Else
			p1.LoadLayout("frmtemplage_category_en")
		End If
		
		p1.Height = pncategory.Height
		
		Dim m1 As Map
		m1 = res.Get(i)
		
		lblctitle.Text = m1.Get("name")
		lblctitle.Text = lblctitle.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
		Library.SetFont(btnopen.CustomLabel,"icomoon",btnopen.CustomLabel.Font.Size)
		lblctitle.Font = Library.GetFont(lblctitle.Font.Size)
		
		Dim image As String
		image = m1.Get("image")
		
		If image.Length > 0 And image <> "null" Then
			im.Put(imgiconcat,m1.Get("image"))
		End If
		
		pnlovercat.Tag = m1
		
		top = top + p1.Height '+ 30dip
		
		sv1.Panel.Height = sv1.Panel.Height + p1.Height
		
		'p1.Left = -p1.Width
		'p1.SetLayoutAnimated(800,0,p1.top,p1.Width,p1.Height)
		
	Next
	
	sv1.ContentHeight = top
	sv1.Panel.Width = Library.GetWidth
	sv1.ContentWidth = Library.GetWidth
	
	If im.Size > 0 Then
		Dim download As ImageDownloader
		download.Initialize
		download.Download(im)
	End If
	
	sv1.ScrollOffsetY = 0
 
	#End Region
	
	If historyCategory.Size = 0 Then
		historyCategory.Add("0")
	End If
	
	If historyCategory.Get(historyCategory.Size-1) <> "0" Then
		
	Else
		pnlloading.Visible = False
	End If
	
End Sub

Sub Products_receive(res As List,sCategory As String)
	
	CacheData.AddProducts2Cache(res,"cats_" & currentCategoryID)
	
	pnlloading.Visible = False
	
	If res.Size > 0 Then
		top = LoadProduct(res,top + 10dip,sv1)
		sv1.ContentHeight = top + 130dip
	Else
		sv1.ContentHeight = sv1.ContentHeight + 130dip
	End If
	
End Sub

#End Region

Sub AddReturnPanel

	Dim p1 As Panel
	p1.Initialize("")
	sv1.Panel.AddView(p1,0,0,sv1.Width,0)
	
	If Library.IsPersian Then
		p1.LoadLayout("frmreturn_template")
	Else
		p1.LoadLayout("frmreturn_template_en")
	End If
	
	Library.SetFont(btnopen.CustomLabel,"icomoon",btnopen.CustomLabel.Font.Size)
	p1.Height = pnlreturn.Height
	top = top + p1.Height
	
	pnloverreturn.Tag = historyCategory.Get(historyCategory.Size-1)
	lblrtitle.Text = Library.GetStringResourse("return_category")
	
End Sub

Sub pnlovercat_Click
	
	Dim p1 As Panel
	p1 = Sender
	
	Dim data As Map
	data.Initialize
	data = p1.Tag
	
	Dim sID As String
	sID = data.Get("category_id")
	currentCategoryID = sID
	
	p1 = Library.GetParent(p1)
	p1.SetLayoutAnimated(500,1,-p1.Width,p1.top,p1.Width,p1.Height)
	historyCategory.Add(data.Get("category_id"))
	
	Dim lsCache As List
	lsCache = CacheData.GetCategoryFromCache("cats_" & currentCategoryID)
	
	If lsCache <> Null And lsCache.IsInitialized Then
	
		LoadCategory2Panel(lsCache)
		
		Dim lsCache As List
		lsCache = CacheData.GetProductsFromCache("cats_" & currentCategoryID)
		
		If lsCache <> Null And lsCache.IsInitialized Then
			top = LoadProduct(lsCache,top + 10dip,sv1)
			sv1.ContentHeight = top + 30dip
		End If
		
		Return
	
	Else
		Dim listProduct As OpenCart
		listProduct.Initialize
		listProduct.GetCategoryProducts(Me,"Products_receive",data.Get("category_id"))	
	End If
	
	sv1.Panel.RemoveAllViews
	
	pnlloading.Visible = True
	category.Initialize
	category.GetCategory(Me,"Category_receive",sID)
	
End Sub

Sub pnloverreturn_Click
	
	Dim sID As String
	
	historyCategory.RemoveAt(historyCategory.Size-1)
	sID = historyCategory.Get(historyCategory.Size-1)
	currentCategoryID = sID
	
	Dim lsCache As List
	lsCache = CacheData.GetCategoryFromCache("cats_" & currentCategoryID)
	
	If lsCache <> Null And lsCache.IsInitialized Then
		
		LoadCategory2Panel(lsCache)
		
		Dim lsCache As List
		lsCache = CacheData.GetProductsFromCache("cats_" & currentCategoryID)
		
		If lsCache <> Null And lsCache.IsInitialized Then
			top = LoadProduct(lsCache,top + 10dip,sv1)
			sv1.ContentHeight = top + 30dip
		End If
		
		Return
		
	End If
	
	pnlloading.Visible = True
	category.GetCategory(Me,"Category_receive",sID)
	

End Sub

Sub pnlover_Click
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.Visible = True
	
	If Library.InternetState = False Then
		Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_title"),False)
		Return
	End If
			
	Dim temp As Map
	temp = p1.Tag
	actProduct.product = temp
	Library.LastPage = Library.CategoryPage
	actProduct.StartActivity
	
End Sub

#Region Buttons

Sub btnsearch_Click
	Library.LastPage = Library.CategoryPage
	actSearch.StartActivity
End Sub

Sub btnbasket_Click
	
	If Library.InternetState = False Then
		Library.HUD.ToastMessageShow(Library.GetStringResourse2("error_net_title"),False)
		Return
	End If
	
	Library.LastPage = Library.CategoryPage
	actBasket.StartActivity
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.MenuPage)
End Sub

#End Region

Sub LoadProduct(res1 As List,DefaultTop As Int,ScrollView1 As ScrollView) As Int
	
	Dim Dimension(),Left,top As Int
	Dim countItem,AllSpace,SpaceUnit As Int
	
	Dimension = Library.GetParentPanelDimension("frmproduct_template")

	countItem = Library.GetWidth / Dimension(0)
	AllSpace = Library.GetWidth - (countItem * Dimension(0))
	
	SpaceUnit = AllSpace /(countItem + 1)	
	Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem

	top = DefaultTop
		
	For i = 1 To res1.Size
	
		Dim pa As Panel
		pa.Initialize("")
		ScrollView1.Panel.AddView(pa,Left,top,Dimension(0),0)
		pa.LoadLayout("frmproduct_template")
		pa.Height = Dimension(1)
		
		Dim Temp As Map
		Temp = res1.Get(i-1)

		#Region Add value to view
		Dim imgTemp As ImageView
		Dim TempLabel,LabelPrice As Label
		Dim TempPanel As Panel
		Dim ParentPanel As Panel = pa.GetView(0)
	
		imgTemp = ParentPanel.GetView(4)
		TempLabel = ParentPanel.GetView(1)
		LabelPrice = ParentPanel.GetView(2)
		TempPanel = ParentPanel.GetView(6)
		
		TempLabel.Text = Temp.Get("name")
		TempLabel.Text = TempLabel.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")

		Dim price,special As String
		
		If Temp.ContainsKey("price_formated") Then
			price   = Temp.Get("price_formated")
		Else
			price   = Temp.Get("price")
		End If
		
		If Temp.ContainsKey("special_formated") Then
			special = Temp.Get("special_formated")
		Else If Temp.ContainsKey("special") Then
			special = Temp.Get("special")
		End If
		
		If special = "null" Or special = "false" Then special = ""
		
		TempLabel.Font = Library.GetFont(LabelPrice.Font.Size)
		LabelPrice.Font = Library.GetFont(LabelPrice.Font.Size)
		
		If price.Length > 0 And (special <> 0) <> False Then
			LabelPrice.Text = price
		Else If (special <> 0) <> False Then
			Library.DiscountStyleLabel(price,special,LabelPrice)
		Else
			LabelPrice.Text = price
		End If
			
		Dim PathImage As String
		
		If Temp.ContainsKey("image") Then 
			PathImage = Temp.Get("image")
		Else If Temp.ContainsKey("thumb") Then
			PathImage = Temp.Get("thumb")
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
			TempPanel.Tag = Temp
		Else If TempPanel.Tag = "topbar" Then
			TempPanel.Color = Library.Theme_Header
		End If

		#End Region
		
		If i Mod countItem = 0 Then
			top = top + pa.Height + 15dip
			ScrollView1.Panel.Height = ScrollView1.Panel.Height + pa.Height
			Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
		Else
			Left = Left - SpaceUnit - Dimension(0)
		End If
		
	Next
	
	If res1.Size Mod countItem <> 0 Then
		top = top + Dimension(1)
		ScrollView1.Panel.Height = ScrollView1.Panel.Height + Dimension(1)
	End If
	
	Return top
	
End Sub
