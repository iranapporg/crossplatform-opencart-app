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
	Private lbltitle As Label
	Private txtsearch As EditText
	Private pbloading As ProgressBar
	Private pnlloading As Panel
	Private sv1 As ScrollView
	Private lblpb As Label
	Private pnlheader As Panel
	Private searchmodule As OpenCart
	Private top As Int = 10
	Private MyToastMessageShow As MyToastMessageShow
	
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
	Private rbasc As RadioButton
	Private rbdesc As RadioButton
	Private txtcampare As Spinner
	Private txtfields As Spinner
	Private txtlogic As Spinner
	Private txtsort_item As Spinner
	Private txtval As EditText
	Private svfilter As ScrollView
	Private btnadd As Button
	
	Private listCondition,listConditionView As List
	Private Filter As Map
	Private topFilter As Int
	
	Dim IME As IME
	Dim listFields,listSortFields As List
	
End Sub

Sub Activity_Create(FirstTime As Boolean)

	Activity.LoadLayout("frmsearch")
	MyToastMessageShow.Initialize(Activity)
	Library.setLocalApp(Library.currLang)
	
	IME.Initialize("")
	
	Library.ChangeStatusColor
	
	lbltitle.Text = Library.GetStringResourse("search_title")
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	searchmodule.Initialize
	txtsearch.Color = Colors.White
	txtsearch.RequestFocus
 
 	sv1.Panel.Color = Colors.Transparent
	sv1.Color = Colors.Transparent
	
	Dim vs As ViewSetting
	vs.setCursorDrawableColor(txtsearch,Library.Theme_Header)
	
	listCondition.Initialize
	Filter.Initialize
	listConditionView.Initialize
	
	LoadFilterPanel

	If Library.IsPersian = False Then
		txtsearch.Gravity = Gravity.LEFT
	End If
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		If svfilter.Visible = True Then
			btnlist_Click
			Return True
		End If
		Activity.Finish
	End If
	
End Sub

Sub txtsearch_EnterPressed
	
	If txtsearch.Text.Length = 0 Then Return
	
	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	pnlloading.SetVisibleAnimated(500,True)
	
	txtsearch.SetTextColorAnimated(700,Library.Theme_Header)
	
	searchmodule.SearchProduct2(Me,"product_receive",txtsearch.Text.Replace("ي","ی").Replace("ك","ک").Replace("",""))
	
End Sub

Sub product_receive(res As List,sCategory As String)
	
	If res.IsInitialized = False Then
		pnlloading.SetVisibleAnimated(500,False)
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_exist_product"),2,False)
		Return
	End If
	
	If res.Size = 0 Then
		pnlloading.SetVisibleAnimated(500,False)
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_exist_product"),2,False)
		Return
	End If
	
	txtsearch.SetTextColorAnimated(700,Colors.Black)
	
	sv1.Panel.RemoveAllViews
	sv1.Panel.Height = 0
	top = 10
	sv1.Visible = False
	top = Library.LoadProduct(res,top,sv1)

	sv1.Visible = True
	sv1.Panel.Height = sv1.Panel.Height + 400dip
	sv1.ScrollPosition = 0
	
	pnlloading.SetVisibleAnimated(500,False)
	
End Sub

Sub EndSearch_Load(LastTop As Int)
	sv1.Panel.Height = sv1.Panel.Height + 500
End Sub

Sub btnclose_Click
	Activity.Finish	
End Sub

Sub pnlover_Click
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.SetVisibleAnimated(500,True)
	
	Dim temp As Map
	temp = p1.Tag
	actProduct.product = temp
	StartActivity(actProduct)
	
End Sub

Sub btnadd_2_cart_Click
	
'	Dim b1 As Button
'	b1 = Sender
'	
'	Library.Add2Cart(b1.Tag,"1",Me)
	
End Sub

Sub Add2Cart2_receive(res As Map,cat As String)
	
	ProgressDialogHide
	
	If res.ContainsKey("error") Then
		
		Dim rs As Map
		
		rs = res.Get("error")
		
		If rs.ContainsKey("option") Then
			ToastMessageShow(Library.GetStringResourse("cannot_add_cart"),True)
			actProduct.product = CreateMap("product_id":Library.ProductChoosenID)
			Library.ProductChoosenID = 0
			StartActivity(actProduct)
			Return
		End If
		
	End If
	
	If res.Get("success") = True Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("add2cart"),1.5,True)
	End If
	
	Library.ProductChoosenID = 0
	
End Sub

Sub btnadd_Click
	
	Dim order As String
	
	If listCondition.Size = 0 Then
	
		If rbasc.Checked = True Then
			order = "asc"
		Else
			order = "desc"
		End If
			
		Filter.Put("sort",listSortFields.Get(txtsort_item.SelectedIndex))
		Filter.Put("order",order)
	
	End If
	
	If txtval.Text.Length = 0 Then
		Dim ToastMessageShow1 As MyToastMessageShow
		ToastMessageShow1.Initialize(Activity)
		ToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("filter_error_val"),1.8,False)
		Return
	End If
	
	listCondition.Add(CreateMap("field":listFields.Get(txtfields.SelectedIndex),"operand":txtcampare.SelectedItem,"value":txtval.Text))
	
	Dim lbl As Label
	lbl.Initialize("")
	lbl.TextColor = Colors.Black
	lbl.Typeface = Library.GetFont
	lbl.TextSize = 14
	lbl.Gravity = Library.GetStringResourse("direction")
	lbl.Text = "   [ " & Library.GetStringResourse("filter_show_field") & txtfields.SelectedItem & " ] , [ " & txtcampare.SelectedItem & " ]"
	svfilter.Panel.AddView(lbl,0,topFilter,svfilter.Width,40dip)
	svfilter.Panel.Height = svfilter.Panel.Height + 40dip
	listConditionView.Add(lbl)
	
	topFilter = topFilter + 40dip
	
	Dim lbl1 As Label
	lbl1.Initialize("")
	lbl1.TextColor = Colors.Black
	lbl1.Typeface = Library.GetFont
	lbl1.TextSize = 14
	lbl1.Gravity = Library.GetStringResourse("direction")
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
	
	If listCondition.Size = 1 Then svfilter.ScrollPosition = sdivider.top
	
	txtval.Text = ""
	
End Sub

Sub btnsearch_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	If listCondition.Size = 0 Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_filter"),1.8,False)
		Return
	End If
	
	Filter.Put("filters",listCondition)
	
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim op As OpenCart
	op.Initialize
	op.CustomSearchProduct(Me,"product_receive",Filter,1000)
	
	btnlist_Click
	
End Sub

Sub btnlist_Click
	
	If svfilter.Visible = False Then
		svfilter.SetVisibleAnimated(500,True)
		btnlist.Text = Library.GetStringResourse("filter_search")
		svfilter.BringToFront
		listCondition.Clear
		Filter.Clear
		IME.HideKeyboard
	Else
		
		IME.HideKeyboard
		
		svfilter.ScrollPosition = 0
		topFilter = btnadd.top + btnadd.Height + 30dip
		
		For i = 0 To listConditionView.Size - 1
			Dim v1 As View
			v1 = listConditionView.Get(i)
			v1.RemoveView
			DoEvents
		Next
		
		svfilter.SetVisibleAnimated(500,False)
		btnlist.Text = Library.GetStringResourse("filter_button")
		
	End If
	
End Sub

Sub LoadFilterPanel

	svfilter.Panel.LoadLayout("frmtemplate_filter")
	svfilter.Visible = False
	svfilter.Panel.Height = btnadd.top + btnadd.Height + 200dip
	topFilter = btnadd.top + btnadd.Height + 30dip
	btnsearch.Background = Library.GetButtonState
	btnadd.Background = Library.GetButtonState
	svfilter.Color = Colors.White
	svfilter.Panel.Color = Colors.White
	DoEvents
	
	btnlist.Text = Library.GetStringResourse("filter_button")
	btnadd.Text = Library.GetStringResourse("filter_add")
	btnsearch.Text = Library.GetStringResourse("filter_search")
	lblsort_item.Text = Library.GetStringResourse("filter_sort_item")
	lblsort_type.Text =Library.GetStringResourse("filter_sort_type")
	rbdesc.Text = Library.GetStringResourse("filter_desc")
	rbasc.Text = Library.GetStringResourse("filter_asc")
	lblfield.Text = Library.GetStringResourse("filter_choose_field")
	lblcompare.Text = Library.GetStringResourse("filter_comapre")
	lbllogical.Text = Library.GetStringResourse("filter_logic")
	lblval.Text = Library.GetStringResourse("filter_val")
	DoEvents
	
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
	
	For i = 0 To listFields.Size - 1
		txtfields.Add(Library.GetStringResourse("filter_field_" & listFields.Get(i)))
	Next
	
	listSortFields.Add("quantity")
	listSortFields.Add("rating")
	listSortFields.Add("sort_order")
	listSortFields.Add("model")
	listSortFields.Add("date_added")
	listSortFields.Add("name")
	listSortFields.Add("price")
	
	For i = 0 To listSortFields.Size - 1
		txtsort_item.Add(Library.GetStringResourse("filter_field_" & listSortFields.Get(i)))
	Next
	
	txtcampare.Add("=")
	txtcampare.Add("!=")
	txtcampare.Add("<>")
	txtcampare.Add(">")
	txtcampare.Add("<")
	txtcampare.Add(">=")
	txtcampare.Add("<=")
	txtcampare.Add("!<")
	txtcampare.Add("!>")
	'txtcampare.Add("in")
	txtcampare.Add("like")
	
	txtlogic.Add("and")
	txtlogic.Add("or")
	
	txtval.Color = Colors.ARGB(10,0,0,0)
	DoEvents
	
End Sub

Sub txtval_FocusChanged (HasFocus As Boolean)
	If HasFocus Then
		svfilter.ScrollPosition = txtval.top + txtval.Height
		txtval.SelectAll
	End If
End Sub