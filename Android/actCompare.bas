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
	Private sv1 As ScrollView
	Dim sTop,sLeft,ProductCount As Int
	Dim except_item As Map
	Private pnldesc As Panel
	Private wb1 As WebView
	Private pnlloading As Panel
	Private btnclear As Button
	Private btnclose As Button
	Private LabelHeight,LabelTextSize As Int
	Private lblpb As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	If Activity.Height > Activity.Width Then
		Dim ph As Phone
		ph.SetScreenOrientation(0)
		Return		
	End If
	
	Library.setLocalApp(Library.currLang)
	
	Activity.LoadLayout("frmcompare")
	
	Library.ChangeStatusColor
	
	lblpb.Text = Library.GetStringResourse("loading")
	
	If Library.GetDevicePhysicalSize > 5 Then
		LabelTextSize	= 16
		LabelHeight		= 70dip
	Else
		LabelTextSize = 11
		LabelHeight		= 30dip
	End If
	
	Dim cd As ColorDrawable
	cd.Initialize(Library.Theme_Header,50)
	btnclear.Background = cd
	btnclose.Background = cd
	
	except_item.Initialize
	except_item.Put("thumb",1)
	except_item.Put("attribute",1)
	except_item.Put("product_id",1)
			
	sv1.Color = Colors.White
	sv1.Panel.Color = Colors.White
	
	Dim op As OpenCart
	op.Initialize
	op.CompareProduct(Me,"receive_compare")
		
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub receive_compare(Data As Map)
	
	If Data.ContainsKey("success") Then
		If Data.Get("success") = True Then
			
			Dim ls As Map
			ls = Data.Get("data")
			
			If ls.Size = 0 Then
				Activity.Finish
				Return
			End If
			
			ProductCount = ls.Size
			
			Dim temp As Map
			temp = ls.Get(ls.GetKeyAt(ls.Size-1))
			ShowHeader(temp)

			Dim html1 As Html
			Dim click_here As String
			click_here = Library.GetStringResourse("click_here")
			
			For Each d1 As String In ls.Keys
				
				Dim pro As Map
				pro = ls.Get(d1)
				
				For Each field As String In pro.Keys
					
					If except_item.ContainsKey(field) = True Then Continue
					
					If field = "rating" Then
						sv1.Panel.AddView(GetRate(pro.Get(field)),sLeft,sTop,GetItemWidth,LabelHeight)
						sTop = sTop + 30dip+1dip
						Continue	
					End If
					
					Dim l1 As Label
					
					If field.ToLowerCase = "description" Then
						l1.Initialize("lbldesc")
						l1.Text = click_here
						l1.TextColor = Library.Theme_Header
						l1.Tag = html1.FromHtml(pro.Get(field))
					Else
						l1.Initialize("")
						l1.Text = html1.FromHtml(pro.Get(field))
						l1.TextColor = Colors.Black
					End If
					
					If field = "price" Or field = "special" Then
						If pro.Get(field) = False Then l1.Text = Library.GetStringResourse("login_account")	
					End If
					
					If pro.Get(field) = Null Then l1.Text = "-"
					
					l1.Gravity = Gravity.CENTER
					l1.Color = Colors.RGB(239,239,239)
					l1.Typeface = Library.GetFont
					l1.TextSize = LabelTextSize
					sv1.Panel.AddView(l1,sLeft,sTop,GetItemWidth,LabelHeight)
					Library.LabelSpace(l1,1.5)
					sTop = sTop + l1.Height+1dip
					
				Next
				
				sLeft = sLeft + GetItemWidth + 2dip
				sTop = 40dip
				
			Next
			
		End If
	End If
	
	pnlloading.Visible = False
	
End Sub

Sub ShowHeader(Data As Map)
	
	Dim header As Label
	header.Initialize("")
	header.Text = Library.GetStringResourse("campare_title")
	header.Color = Library.Theme_Header
	header.TextColor = Colors.White
	header.Typeface = Library.GetFont
	header.TextSize = 13
	Library.LabelSpace(header,1.8)
	header.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	
	sv1.Panel.AddView(header,0,0,100%x,40dip)
	
	sTop = 40dip
	
	For Each v1 As String In Data.Keys
		
		If except_item.ContainsKey(v1) = True Then Continue
		
		Dim l1 As Label
		l1.Initialize("")
		l1.Text = " " & Library.GetStringResourse(v1)
		
		If l1.Text.Length = 0 Then l1.Text = v1
		
		l1.TextColor = Colors.White
		l1.TextSize = LabelTextSize
		l1.Typeface = Typeface.LoadFromAssets("byekan.ttf")
		l1.Gravity = Gravity.CENTER
		l1.Color = Library.Theme_Header
		sv1.Panel.AddView(l1,0,sTop,GetItemWidth,LabelHeight)
		Library.LabelSpace(l1,1.5)
		sTop = sTop + l1.Height+1dip
		
	Next
	
	sLeft = GetItemWidth
	sv1.Panel.Height = sTop
	
	sTop = 40dip
	
End Sub

Sub GetItemWidth As Int
	
	Dim rs As Int
	rs = Activity.Width / (ProductCount+1)
	
	Return rs
	
End Sub

Sub lbldesc_Click
	
	Dim lb As Label
	lb = Sender
	
	lb.SetColorAnimated(700,Colors.White,Colors.RGB(239,239,239))
	
	If lb.Tag = Null Then lb.Tag = "-"
	
	Dim style As String
	style = $"<body style="background-color:#F7F4F4;line-height:25px;font-family:tahoma;"$

	If Library.IsPersian Then
		style = style & $"direction:rtl">"$
	Else
		style = style & $"direction:ltr">"$
	End If
			
	wb1.LoadHtml(style & lb.Tag)
	pnldesc.SetVisibleAnimated(600,True)
	
End Sub

Sub GetRate(Rate As String) As Panel
	
	Dim p1 As Panel
	p1.Initialize("")
	p1.Color = Colors.RGB(239,239,239)
	
	Dim left As Int
	left = 10
	
	Dim unstar,star As String
	unstar = ""
	star = ""
	
	For i = 0 To 4
		
		Dim r1 As Label
		r1.Initialize("")
		r1.Typeface = Typeface.LoadFromAssets("icomoon.ttf")
		
		If Rate > i Then
			r1.Text = star
		Else
			r1.Text = unstar
		End If
		
		r1.TextColor = Library.Theme_Header
		p1.AddView(r1,left,9,GetItemWidth/5,30dip)
		left = left + r1.Width
		
	Next
	
	Return p1
	
End Sub

Sub btnclose_Click
	pnldesc.SetVisibleAnimated(600,False)
End Sub

Sub btnclear_Click
	Library.ListProductIDForCompare.Clear
	Library.AnimationFromLeft2Right
	Activity.Finish
End Sub