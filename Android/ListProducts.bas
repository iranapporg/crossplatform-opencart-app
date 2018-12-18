Type=Class
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

Private Sub Class_Globals
	#IgnoreWarnings: 11
	Private thread1 As Thread
	Private ScrollView1 As ScrollView
	Private Top,Left,Dimension(),DefaultTop As Int
	Private countItem,AllSpace,SpaceUnit As Int
	Private images As Map
	Private Glide As AriaGlide
	Private sModule As Object
	Private sEV As String
	Private res As List
End Sub

'When load all data,we call event for end loaded
Public Sub Initialize(Module As Object,Event As String,ScrollView As ScrollView,DefaultTopView As Int,Result As List)
	
	ScrollView1	= ScrollView
	DefaultTop	= DefaultTopView
	sModule		= Module
	sEV			= Event
	res = Result
	
	Dimension = GetParentPanelDimension("frmproduct_template")
	
	images.Initialize
	
	thread1.Initialise("thread")
	Dim arg(1) As Object
	arg(0) = Result
	thread1.Start(Me,"LoadProduct",Null)
	
End Sub

#IgnoreWarnings: 12
Private Sub LoadProduct
	
	countItem = 100%x / Dimension(0)
	AllSpace = 100%x - (countItem * Dimension(0))
	
	SpaceUnit = AllSpace /(countItem + 1)
	
	'Left = SpaceUnit
	Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
	Top = DefaultTop
	
	For i = 1 To res.Size
		thread1.RunOnGuiThread("AddPanel",Array As Object(res.Get(i-1),i))
	Next
	
	If res.Size Mod countItem <> 0 Then
		Top = Top + Dimension(1)
		ScrollView1.Panel.Height = ScrollView1.Panel.Height + Dimension(1)
		DoEvents
	End If
	
	If SubExists(sModule,sEV) Then
		CallSub2(sModule,sEV,Top)
	End If
	
End Sub

Sub AddPanel(Tem As Object,j As Object)
	
	Dim temp As Map
	temp = Tem
	
	Dim i As Int
	i = j

	Dim pa As Panel
	pa.Initialize("")
	ScrollView1.Panel.AddView(pa,Left,Top,ScrollView1.Width,0)
	pa.LoadLayout("frmproduct_template")
	pa.Height = Dimension(1)
	DoEvents
	
	#Region Add value to view
	Dim imgTemp As ImageView
	Dim btncart As Button
	Dim TempLabel,LabelPrice As Label
	Dim TempPanel As Panel
	DoEvents
	Dim ParentPanel As Panel = pa.GetView(0)
	DoEvents
	btncart = ParentPanel.GetView(5)
	imgTemp = ParentPanel.GetView(4)
	TempLabel = ParentPanel.GetView(1)
	LabelPrice = ParentPanel.GetView(2)
	TempPanel = ParentPanel.GetView(6)
	DoEvents
	
	btncart.Text = Library.GetStringResourse("add2cartbtn")
	
	Dim price,special As String
	If temp.ContainsKey("price_formated") Then
		price   = temp.Get("price_formated")
	Else
		price   = temp.Get("price")
	End If
	special = temp.Get("special_formated")
	DoEvents
	If special = "null" Or special = "false" Then special = ""
	
	If price.Length > 0 And special.Length = 0 Then
		btncart.Text = price & " C"
	Else If special.Length > 0 Then
		btncart.Text = special & " C"
	End If
	
	DoEvents
	
	If temp.ContainsKey("id") Then
		btncart.Tag = temp.Get("id")
	Else
		btncart.Tag = temp.Get("product_id")
	End If

	TempLabel.Text = temp.Get("name")
	TempLabel.Text = TempLabel.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
	
	Dim price,special As String
	If temp.ContainsKey("price_formated") Then
		price   = temp.Get("price_formated")
	Else
		price   = temp.Get("price")
	End If
	
	DoEvents
	
	special = temp.Get("special_formated")
	
	If special = "null" Or special = "false" Then special = ""
	
	If price.Length > 0 And special.Length = 0 Then
		LabelPrice.Text = price
	Else If special.Length > 0 Then
		LabelPrice.Text = DiscountStyleLabel(price,special)
	End If
	
	DoEvents
		
	Dim PathImage As String
	
	If temp.ContainsKey("image") Then 
		PathImage = temp.Get("image")
	Else If temp.ContainsKey("thumb") Then
		PathImage = temp.Get("thumb")
	End If
	
	PathImage = PathImage.Replace(" ","%20")
	
	If PathImage.ToLowerCase = "null" Or PathImage.Length = 0 Then
		Glide.Load($"${File.DirInternal}\noimage1.png"$).AsBitmap.Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		DoEvents
	Else
		Glide.Load(PathImage).AsBitmap.Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		DoEvents
	End If

	If TempPanel.Tag = "over" Then
		TempPanel.Tag = temp
	Else If TempPanel.Tag = "topbar" Then
		TempPanel.Color = Library.Theme_Header
	End If

	#End Region
	
'	If i Mod countItem = 0 Then
'		Top = Top + pa.Height + 15dip
'		ScrollView1.Panel.Height = ScrollView1.Panel.Height + pa.Height
'		Left = SpaceUnit
'		DoEvents
'	Else
'		Left = Left + SpaceUnit + Dimension(0)
'	End If

	If i Mod countItem = 0 Then
		Top = Top + pa.Height + 15dip
		ScrollView1.Panel.Height = ScrollView1.Panel.Height + pa.Height
		Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
		'left = SpaceUnit
		DoEvents
	Else
		Left = Left - SpaceUnit - Dimension(0)
		'Left = Left + SpaceUnit + Dimension(0)
	End If
	
	DoEvents
		
End Sub

Private Sub GetParentPanelDimension(LayoutName As String) As Int()
	
	Dim p1 As Panel
	p1.Initialize("")
	p1.LoadLayout(LayoutName)
	DoEvents
	
	Dim parent As View
	Dim v1 As View
	
	For Each v1 As View In p1.GetAllViewsRecursive
		If v1 Is Panel Then
			parent = v1
			Exit
		End If
		DoEvents
	Next
	
	Return Array As Int(parent.Width,parent.Height)
	
End Sub

Private Sub DiscountStyleLabel(Price As String,FinalPrice As String) As RichString
	
	Dim style As String
	style = $"{r}{u}${Price}{r}{u}${CRLF}{g}${FinalPrice}{g}"$
	
	Dim rich As RichString
	rich.Initialize(style)
	rich.Color2(Colors.RGB(25,165,68),"{g}")
	rich.Color2(Colors.Red,"{r}")
	rich.Strikethrough2("{u}")
	
	Return rich
	
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