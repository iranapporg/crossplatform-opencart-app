Type=Service
Version=4.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
#End Region

Sub Process_Globals
	Private thread1 As Thread
	Private Top,Left,Dimension(),DefaultTop As Int
	Private countItem,AllSpace,SpaceUnit As Int
	Private images As Map
	Private Picasso As Picasso
	Private sModule As Object
	Private sEV As String
	Public DefaultTopView As Int
	Public Module As Object
	Public Event As String
	Public ScrollView2 As Object
	Public Result As List
End Sub

Sub Service_Create
	
	DefaultTop	= DefaultTopView
	sModule		= Module
	sEV			= Event
	
	Dimension = GetParentPanelDimension("frmproduct_template")
	
	images.Initialize
	Picasso.Initialize
	
	thread1.Initialise("thread")
	Dim arg(1) As Object
	arg(0) = Result
	thread1.Start(Me,"LoadProductView_Load",arg)
	
End Sub

Sub Service_Start (StartingIntent As Intent)

End Sub

Sub Service_Destroy

End Sub

Private Sub LoadProductView_Load(res As List)
	
	Dim ScrollView1 As ScrollView
	ScrollView1 = ScrollView2
	
	countItem = 100%x / Dimension(0)
	AllSpace = 100%x - (countItem * Dimension(0))
	
	SpaceUnit = AllSpace /(countItem + 1)
	
	Left = SpaceUnit
	Top = DefaultTop
	
	For i = 0 To res.Size - 1
		DoEvents
		thread1.RunOnGuiThread("AddPanel",Array As Object(res.Get(i),i))
		DoEvents
	Next
	
	If res.Size Mod countItem <> 0 Then
		Top = Top + Dimension(1)
		ScrollView1.Panel.Height = ScrollView1.Panel.Height + Dimension(1)
		DoEvents
	End If
	
	If images.Size > 0 Then
	 	CallSubDelayed2(ImageDownloader,"Download",images)
	End If
	
	If SubExists(sModule,sEV) Then
		CallSub2(sModule,sEV,Top)
	End If
	
End Sub

Private Sub AddPanel(Temp As Map,i As Int)
	
	Dim ScrollView1 As ScrollView
	ScrollView1 = ScrollView2
	
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
	TempLabel = ParentPanel.GetView(0)
	LabelPrice = ParentPanel.GetView(1)
	TempPanel = ParentPanel.GetView(6)
	DoEvents
	
	btncart.Text = Library.GetStringResourse("add2cartbtn")
	
	Dim price,special As String
	If Temp.ContainsKey("price_formated") Then
		price   = Temp.Get("price_formated")
	Else
		price   = Temp.Get("price")
	End If
	special = Temp.Get("special_formated")
	DoEvents
	If special = "null" OR special = "false" Then special = ""
	
	If price.Length > 0 AND special.Length = 0 Then
		btncart.Text = price & " C"
	Else If special.Length > 0 Then
		btncart.Text = special & " C"
	End If
	DoEvents
	If Temp.ContainsKey("id") Then
		btncart.Tag = Temp.Get("id")
	Else
		btncart.Tag = Temp.Get("product_id")
	End If

	TempLabel.Text = Temp.Get("name")
	TempLabel.Text = TempLabel.Text.Replace("&quot;",QUOTE)
	DoEvents
	Dim price,special As String
	If Temp.ContainsKey("price_formated") Then
		price   = Temp.Get("price_formated")
	Else
		price   = Temp.Get("price")
	End If
	DoEvents
	special = Temp.Get("special_formated")
	
	If special = "null" OR special = "false" Then special = ""
	
	If price.Length > 0 AND special.Length = 0 Then
		LabelPrice.Text = price
	Else If special.Length > 0 Then
		LabelPrice.Text = DiscountStyleLabel(price,special)
	End If
	
	DoEvents
		
	Dim PathImage As String
	
	If Temp.ContainsKey("image") Then 
		PathImage = Temp.Get("image")
	Else If Temp.ContainsKey("thumb") Then
		PathImage = Temp.Get("thumb")
	End If
	
	If PathImage.ToLowerCase = "null" OR PathImage.Length = 0 Then
		Picasso.LoadFile(File.Combine(File.DirInternal,"noimage1.png")).Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		DoEvents
	Else
		Picasso.LoadUrl(PathImage).Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		DoEvents
	End If

	If TempPanel.Tag = "over" Then
		TempPanel.Tag = Temp
	Else If TempPanel.Tag = "topbar" Then
		TempPanel.Color = Library.Theme_Header
	End If

	#End Region
	
	If i Mod countItem = 0 Then
		Top = Top + pa.Height + 15dip
		ScrollView1.Panel.Height = ScrollView1.Panel.Height + pa.Height
		Left = SpaceUnit
		DoEvents
	Else
		Left = Left + SpaceUnit + Dimension(0)
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