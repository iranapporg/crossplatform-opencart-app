Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Public title As String
	Public res As List
	Private pg As Page
	Private lbltitle As Label
	Private pnlloading As Panel
	Private lblpb As Label
	Private pnlheader As Panel
	Private sv1 As ScrollView
	Private top As Int = 30
	Private lblbasket As Label
	Dim MyToastMessageShow1 As MyToastMessageShow
	Private btnclose As Button
	Private btnsearch As Button
	Private btnbasket As Button
End Sub

Public Sub StartActivity
	
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmcategory")
	MyToastMessageShow1.Initialize(pg.RootPanel)
	
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	Library.SetFont(btnbasket,"icomoon",btnclose.CustomLabel.Font.Size)
	Library.SetFont(btnsearch,"icomoon",btnclose.CustomLabel.Font.Size)
	Library.NavControl.ShowPage(pg)
	
	lbltitle.Text = title
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	
	If res.Size = 0 Then
		Library.HUD.ToastMessageShow(Library.GetStringResourse("no_exist_product"),False)
		Library.NavControl.ShowPage(Library.LastPage)
		Return
	End If
	
	top = 10dip
	
	sv1.Visible = False
	top =  LoadProduct(res,top,sv1)
	
	sv1.Panel.Height = sv1.Panel.Height + 290dip
	sv1.ContentWidth = Library.GetWidth
	sv1.ContentHeight = sv1.panel.Height
	
	sv1.Visible = True
	pnlloading.Visible = False
	sv1.Panel.Color = Library.Theme_Background
	pg.RootPanel.Color = Library.Theme_Background
	
	Library.ShowCartLabel(lblbasket)
	
End Sub

Sub pnlover_Click
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.Visible = True
	
	Dim temp As Map
	temp = p1.Tag
	Library.LastPage = pg
	actProduct.product = temp
	actProduct.StartActivity
	
End Sub

Sub btnsearch_Click
	Library.LastPage = pg
	actSearch.StartActivity
End Sub

Sub btnbasket_Click
	Library.LastPage = pg
	actBasket.StartActivity
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.MenuPage)
End Sub

Sub LoadProduct(res1 As List,DefaultTop As Int,ScrollView1 As ScrollView) As Int
	
	Dim Dimension(),Left,top As Int
	Dim countItem,AllSpace,SpaceUnit As Int
	
	Dimension = Library.GetParentPanelDimension("frmproduct_template")

	countItem = Library.GetWidth / Dimension(0)
	AllSpace = Library.GetWidth - (countItem * Dimension(0))
	
	SpaceUnit = AllSpace /(countItem + 1)
	
	Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
	
	'If Library.GetDevicePhysicalSize > 5 Then Left = Left - (SpaceUnit*2)
	'Left = SpaceUnit
	
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
		'Dim btncart As Button
		Dim TempLabel,LabelPrice As Label
		Dim TempPanel As Panel
		Dim ParentPanel As Panel = pa.GetView(0)
		
		'btncart = ParentPanel.GetView(5)
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
			'left = SpaceUnit
		Else
			Left = Left - SpaceUnit - Dimension(0)
			'Left = Left + SpaceUnit + Dimension(0)
		End If
		
	Next
	
	If res1.Size Mod countItem <> 0 Then
		top = top + Dimension(1)
		ScrollView1.Panel.Height = ScrollView1.Panel.Height + Dimension(1)
	End If
	
	Return top
	
End Sub