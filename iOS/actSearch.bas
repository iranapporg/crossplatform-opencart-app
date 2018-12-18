Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private pg As Page
	Private lbltitle As Label
	Private txtsearch As TextField
	Private pnlloading As Panel
	Private sv1 As ScrollView
	Private lblpb As Label
	Private pnlheader As Panel
	Private searchmodule As OpenCart
	Private top As Int = 10
	Private MyToastMessageShow1 As MyToastMessageShow
	
	'filter section
	Private btnclose As Button
	Private btnlist As Button
	Private btnsearch As Button
	Private divider As ImageView
	Private Label2 As Label
	Private Label3 As Label
	Private lblcompare As Label
	Private lbldivider1 As Label
	Private lbldivier2 As Label
	Private lblfield As Label
	Private lbllogical As Label
	Private lblsearch As Button
	Private lblsort_item As Label
	Private lblsort_type As Label
	Private lblval As Label
	Private pnlfilter As Panel
	Private pnlloading1 As Panel
	Private pnlsearch As Panel
	Private rbasc As Switch
	Private rbdesc As Switch
	Private txtcampare As Picker
	Private txtfields As Picker
	Private txtlogic As Picker
	Private txtsort_item As Picker
	Private txtval As TextField
	Private svfilter As ScrollView
	Private btnadd As Button
	
	Private listCondition,listConditionView As List
	Private Filter As Map
	Private topFilter As Int
	
	Dim listFields,listSortFields As List
	Private lbldesc As Label
	Private lblasc As Label
End Sub

Public Sub StartActivity
	
	pg.Initialize("Page1")
	pg.RootPanel.LoadLayout("frmsearch")
	Library.NavControl.ShowPage(pg)
	sv1.ContentWidth = pg.RootPanel.Width

	MyToastMessageShow1.Initialize(pg.RootPanel)
	
	lbltitle.Text = Library.GetStringResourse("search_title")
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	searchmodule.Initialize
	txtsearch.Color = Colors.White
 
 	sv1.Panel.Color = Colors.Transparent
	sv1.Color = Colors.Transparent
	
	listCondition.Initialize
	Filter.Initialize
	listConditionView.Initialize
	
	LoadFilterPanel
	Library.ChangeFont(pg.RootPanel)
	txtsearch.TextAlignment = Library.GetStringResourse("direction_ios")
	
End Sub

Private Sub Page1_Resize(Width As Int, Height As Int)
	Log("resize")
'	sv1.Width = Width
'	sv1.ContentWidth = Width
'	sv1.Height = Height
End Sub

Sub txtsearch_EnterPressed
	
	pg.ResignFocus
	
	If txtsearch.Text.Length = 0 Then Return
	
	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	pnlloading.Visible = True
	
	searchmodule.SearchProduct2(Me,"product_receive",txtsearch.Text.Replace("ي","ی").Replace("ك","ک").Replace("",""))
	
End Sub

Sub product_receive(res As List,sCategory As String)
	
	pnlloading.Visible = False
	pg.ResignFocus
	
	If res.IsInitialized = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_exist_product"),2,False)
		Return
	End If
	
	If res.Size = 0 Then
		sv1.Panel.RemoveAllViews
		sv1.Panel.Height = 0
		top = 10
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_exist_product"),2,False)
		Return
	End If
	
	sv1.Panel.RemoveAllViews
	sv1.Panel.Height = 0
	top = 10
	sv1.Visible = False
	top = LoadProduct(res,top,sv1)

	sv1.Visible = True
	sv1.Panel.Height = sv1.Panel.Height + 300dip
	sv1.ContentHeight = top
	sv1.ContentWidth = Library.GetWidth
	
End Sub

Sub EndSearch_Load(LastTop As Int)
	sv1.Panel.Height = sv1.Panel.Height + 500
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.LastPage)
End Sub

Sub pnlover_Click
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	pg.ResignFocus
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.Visible = True
	
	Dim temp As Map
	temp = p1.Tag
	actProduct.product = temp
	actProduct.StartActivity
	
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
			Library.HUD.ToastMessageShow(Library.GetStringResourse("cannot_add_cart"),True)
			actProduct.product = CreateMap("product_id":Library.ProductChoosenID)
			Library.ProductChoosenID = 0
			actProduct.StartActivity
			Return
		End If
		
	End If
	
	If res.Get("success") = True Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("add2cart"),1.5,True)
	End If
	
	Library.ProductChoosenID = 0
	
End Sub

Sub btnadd_Click
	
	Dim order As String
	
	pg.ResignFocus
	
	If listCondition.Size = 0 Then
	
		If rbasc.Value = True Then
			order = "asc"
		Else
			order = "desc"
		End If
		
		Filter.Put("sort",listSortFields.Get(txtsort_item.GetSelectedRow(0)))
		Filter.Put("order",order)
	
	End If
	
	If txtval.Text.Length = 0 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("filter_error_val"),1.8,False)
		Return
	End If
	
	listCondition.Add(CreateMap("field":listFields.Get(txtfields.GetSelectedRow(0)),"operand":txtcampare.GetSelectedItem(0),"value":txtval.Text))
	
	Dim lbl As Label
	lbl.Initialize("")
	lbl.TextColor = Colors.Black
	lbl.Font = Library.GetFont(14)
	lbl.TextAlignment = Library.GetStringResourse("direction_ios")
	lbl.Text = "   [ " & Library.GetStringResourse("filter_show_field") & txtfields.GetSelectedItem(0) & " ] , [ " & txtcampare.GetSelectedItem(0) & " ]"
	svfilter.Panel.AddView(lbl,0,topFilter,svfilter.Width,40dip)
	svfilter.Panel.Height = svfilter.Panel.Height + 40dip
	svfilter.ContentHeight = svfilter.Panel.Height
	listConditionView.Add(lbl)
	
	topFilter = topFilter + 40dip
	
	Dim lbl1 As Label
	lbl1.Initialize("")
	lbl1.TextColor = Colors.Black
	lbl1.Font = Library.GetFont(14)
	lbl1.TextAlignment = Library.GetStringResourse("direction_ios")
	lbl1.Text = "   " & Library.GetStringResourse("filter_show_val") & txtval.Text
	svfilter.Panel.AddView(lbl1,0,topFilter,svfilter.Width,40dip)
	listConditionView.Add(lbl1)
	
	topFilter = topFilter + 45dip
	svfilter.Panel.Height = svfilter.Panel.Height + 40dip
	
	Dim sdivider As Label
	sdivider.Initialize("")
	sdivider.Color = Colors.Gray
	svfilter.Panel.AddView(sdivider,10,topFilter,svfilter.Width-20,1dip)
	listConditionView.Add(sdivider)
	topFilter = topFilter + 5dip
	svfilter.Panel.Height = svfilter.Panel.Height + 12dip
	
	If listCondition.Size = 1 Then svfilter.ScrollTo(0,sdivider.top,True)
	
	txtval.Text = ""
	
End Sub

Sub btnsearch_Click
	
	pg.ResignFocus
	
	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	If listCondition.Size = 0 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("no_filter"),1.8,False)
		Return
	End If
	
	Filter.Put("filters",listCondition)
	
	pnlloading.Visible = True
	
	Dim op As OpenCart
	op.Initialize
	op.CustomSearchProduct(Me,"product_receive",Filter,1000)
	
	btnlist_Click
	
End Sub

Sub btnlist_Click
	
	If svfilter.Visible = False Then
		svfilter.Visible = True
		btnlist.Text = Library.GetStringResourse("filter_search")
		svfilter.BringToFront
		listCondition.Clear
		Filter.Clear
	Else
		
		svfilter.ScrollTo(0,0,True)
		topFilter = btnadd.top + btnadd.Height + 30dip
		
		For i = 0 To listConditionView.Size - 1
			Dim v1 As View
			v1 = listConditionView.Get(i)
			v1.RemoveViewFromParent
		Next
		
		svfilter.Visible = False
		btnlist.Text = Library.GetStringResourse("filter_button")
		
	End If
	
End Sub

Sub LoadFilterPanel

	svfilter.Panel.Width = svfilter.Width
	svfilter.ContentHeight = 1000
	svfilter.Panel.LoadLayout("frmtemplate_filter")
	svfilter.ContentWidth = Library.GetWidth
	
	For Each v1 As View In svfilter.Panel.GetAllViewsRecursive
		If v1 Is Label Then
			Dim l2 As Label
			l2 = v1
			l2.Font = Library.GetFont(l2.Font.Size)
			l2.TextAlignment = Library.GetStringResourse("direction_ios")
		End If
	Next
	
	pnlfilter.Width = Library.GetWidth
	svfilter.Width = Library.GetWidth

	svfilter.Visible = False
	svfilter.Panel.Height = btnadd.top + btnadd.Height + 200dip
	topFilter = btnadd.top + btnadd.Height + 30dip
	Library.GetButtonState(btnsearch)
	Library.GetButtonState(btnadd)
	svfilter.Color = Colors.White
	svfilter.Panel.Color = Colors.White
	
	btnlist.Text = Library.GetStringResourse("filter_button")
	btnadd.Text = Library.GetStringResourse("filter_add")
	btnsearch.Text = Library.GetStringResourse("filter_search")
	lblsort_item.Text = Library.GetStringResourse("filter_sort_item")
	lblsort_type.Text =Library.GetStringResourse("filter_sort_type")
	lbldesc.Text = Library.GetStringResourse("filter_desc")
	lblasc.Text = Library.GetStringResourse("filter_asc")
	lblfield.Text = Library.GetStringResourse("filter_choose_field")
	lblcompare.Text = Library.GetStringResourse("filter_comapre")
	lbllogical.Text = Library.GetStringResourse("filter_logic")
	lblval.Text = Library.GetStringResourse("filter_val")
	
	listFields.Initialize
	listSortFields.Initialize
	
	listFields.Add("category")
	listFields.Add("quantity")
	listFields.Add("model")
	listFields.Add("upc")
	listFields.Add("name")
	listFields.Add("date_start")
	listFields.Add("date_end")
	listFields.Add("product_id")
	listFields.Add("price")
	'txtfields.Add("stock_status")
	'txtfields.Add("manufacturer")
	'txtfields.Add("filter_text")
	
	Dim t1 As List
	t1.Initialize
	
	For i = 0 To listFields.Size - 1
		t1.Add(Library.GetStringResourse("filter_field_" & listFields.Get(i)))
	Next
	txtfields.SetItems(0,t1)
	
	listSortFields.Add("quantity")
	listSortFields.Add("rating")
	listSortFields.Add("sort_order")
	listSortFields.Add("model")
	listSortFields.Add("date_added")
	listSortFields.Add("name")
	listSortFields.Add("price")
	
	t1.Clear
	For i = 0 To listSortFields.Size - 1
		t1.Add(Library.GetStringResourse("filter_field_" & listSortFields.Get(i)))
	Next
	txtsort_item.SetItems(0,t1)
	
	t1.Clear
	t1.Add("=")
	t1.Add("!=")
	t1.Add("<>")
	t1.Add(">")
	t1.Add("<")
	t1.Add(">=")
	t1.Add("<=")
	t1.Add("!<")
	t1.Add("!>")
	t1.Add("like")
	txtcampare.SetItems(0,t1)
	'txtcampare.Add("in")
	
'	txtlogic.SetItems(0,Array As String("and"))
'	txtlogic.SetItems(0,Array As String("or"))
	
	txtval.Color = Colors.ARGB(10,0,0,0)
	
End Sub

Sub txtval_FocusChanged (HasFocus As Boolean)
	If HasFocus Then
		svfilter.ScrollTo(0,txtval.top + txtval.Height,True)
		txtval.SelectAll
	End If
End Sub

Sub rbdesc_ValueChanged (Value As Boolean)
	If Value Then rbasc.Value = False
End Sub

Sub rbasc_ValueChanged (Value As Boolean)
	If Value Then rbdesc.Value = False
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
		
		Log(special <> 0)
		
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