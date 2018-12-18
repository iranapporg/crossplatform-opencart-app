Type=StaticCode
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	Public blnOpenNoInternet As Boolean
	Public Theme_Header,Theme_Footer,Theme_Background As Int
	Public ar As AndroidResources
	Public token As Map
	Public ProductChoosenID As String
	Public CartDetails As Map
	Public currLang,currCurrency As String
	Public manager As AHPreferenceManager
	Public phone1 As PhoneId
	Public phoneInfo As Phone
	Public loginDetails As Map
	Public Coupons As List
	Public GuestLogin As Map
	Public imagesSlideshow,FeatureProduct,BestProduct,NewProduct,SpecialProduct,listSlideshow,listManufacturers,listInformation,listBanners As List
	Public StoreID As String : StoreID = "0"
	Public wishlist As String
	Public comparelist As String
	Public ChoosenAddress As Int
	Type ResponseAddItem(View1 As View,Top As Int,Left As Int)
	Public TempDimension() As Int
	Public PaymentSuccess As Boolean
	Public Sign As CheckSignature
	Public FirstRun As Boolean
	Public StringUtil As StringUtils
	Public CacheSystem As CacheSystem
	Public ListProductIDForCompare As List
	Public ShopState As Boolean
	Public Config As Map
	Public CurrentModule As Object
	Public Bookmarked As Map
	Public OpenProductFromPush As String
End Sub

#Region Animation
Sub AnimationFromLeft2Right
	SetAnimation("file1","file2")
End Sub

'slide from right to left
Sub AnimationFromRight2Left
	SetAnimation("file1","file2")
End Sub

Sub AnimationFromButton2Top
	SetAnimation("from_bottom_to_up","from_up_to_bottom")
End Sub

Sub AnimationFromTop2Button
	SetAnimation("from_up_to_up","from_up_to_bottom")
End Sub

Sub ZoomIn
	SetAnimation("zoom_enter", "zoom_exit")
End Sub

Sub ZoomOut
	SetAnimation("zoom_exit", "zoom_enter")
End Sub

Private Sub SetAnimation(InAnimation As String, OutAnimation As String)
	Try
    	Dim R As Reflector
    	Dim package As String
    	Dim In, out As Int
   	 	package = R.GetStaticField("anywheresoftware.b4a.BA", "packageName")
    	In = R.GetStaticField(package & ".R$anim", InAnimation)
    	out = R.GetStaticField(package & ".R$anim", OutAnimation)
    	R.Target = R.GetActivity
    	R.RunMethod4("overridePendingTransition", Array As Object(In, out), Array As String("java.lang.int", "java.lang.int"))
	Catch
	End Try
End Sub

#End Region

Sub GetParent(v As View) As View
   Dim R As Reflector
   R.Target = v
   Try
   		Return R.RunMethod("getParent")
	Catch
		Return v
	End Try
End Sub

Sub InternetState As Boolean 

	Dim mylan As ServerSocket
	mylan.Initialize(0,"")
	
	Dim ip As String
	ip = mylan.GetMyIP
	
	If ip = "127.0.0.1" Then  
		Return False
	Else
		If Regex.IsMatch("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}",ip) Then
			Return True
		Else
			Return False
		End If
	End If
	
End Sub

Sub ChangeStatusColor
	
	If phoneInfo.SdkVersion >=19 Then
		Dim status As StatusBarCompat
		status.Initialize
		status.StatusBarColor = Theme_Header
	End If
		
End Sub

Sub ChangeStatusColor2(Color As Int)
	
	If phoneInfo.SdkVersion >=19 Then
		Dim status As StatusBarCompat
		status.Initialize
		status.StatusBarColor = Color
	End If
		
End Sub

Sub GetIP As String

	Dim mylan As ServerSocket
	mylan.Initialize(0,"")
	
	Dim ip As String
	ip = mylan.GetMyIP
	
	Return ip
	
End Sub

Sub LabelSpace(view1 As View,Space As Float)
	Dim Obj1 As Reflector
	Obj1.Target = view1
	Obj1.RunMethod3("setLineSpacing", Space, "java.lang.float", Space, "java.lang.float")
End Sub

Sub String2List(str As String) As List
	
	Try
		Dim js As JSONParser
		js.Initialize(str)
		Return js.NextArray		
	Catch
		Return Null
	End Try
	
End Sub

Sub GetDevicePhysicalSize As Float
    Dim lv As LayoutValues
    lv = GetDeviceLayoutValues
    Return Sqrt(Power(lv.Height / lv.Scale / 160, 2) + Power(lv.Width / lv.Scale / 160, 2))
End Sub

Sub GetMD5(sStr As String,sOnlynumber As Boolean) As String
Dim md As MessageDigest
Dim ByteCon As ByteConverter
Dim passwordhash() As Byte

	passwordhash = md.GetMessageDigest(sStr.GetBytes("UTF8"),"MD5")

	Dim md5string,res As String

	md5string = ByteCon.HexFromBytes(passwordhash)
	
	If sOnlynumber = False Then
		Return md5string
	Else
		For i = 0 To md5string.Length - 1
			If IsNumber(md5string.CharAt(i)) Then
				res = res & md5string.CharAt(i)
			End If
		Next
		Return res
	End If

End Sub

Sub ShowTime(Str As String)
	LogColor($"${Str} is ${DateTime.Time(DateTime.Now)}"$,Colors.Green)	
End Sub

Sub Truncate(s1 As String) As String
	If s1.Length > 20 Then
		Return s1.SubString2(0,17) & "..."
	Else
		Return s1
	End If
End Sub

Sub SetProgressDrawable(P As ProgressBar)
	Dim gd As GradientDrawable
	Dim R As Reflector
	Dim clipDrawable As Object
	Dim cd As ColorDrawable

	gd.Initialize("TOP_BOTTOM", Array As Int(Theme_Header,Theme_Header))
	gd.CornerRadius = 3dip
	cd.Initialize(Colors.RGB(224,224,224), 0)

	Dim R As Reflector
	Dim clipDrawable As Object
	clipDrawable = R.CreateObject2("android.graphics.drawable.ClipDrawable", _
		Array As Object(gd, Gravity.LEFT, 1), _
		Array As String("android.graphics.drawable.Drawable", "java.lang.int", "java.lang.int"))
	R.Target = P
	R.Target = R.RunMethod("getProgressDrawable") 'Gets the layerDrawable
	R.RunMethod4("setDrawableByLayerId", _
		Array As Object(16908288, cd), _
		Array As String("java.lang.int", "android.graphics.drawable.Drawable"))
	R.RunMethod4("setDrawableByLayerId", _
		Array As Object(R.GetStaticField("android.R$id", "progress"), clipDrawable), _
		Array As String("java.lang.int", "android.graphics.drawable.Drawable"))
		
End Sub

Sub RequestSearchBar
	Dim ref As Reflector
	ref.Target = ref.GetActivity
	ref.RunPublicmethod("onSearchRequested", Null, Null)
End Sub

Sub CenterView2(v As View, parent As View)
    v.Left = parent.Width / 2 - v.Width / 2
    v.Top = parent.Height / 2 - v.Height / 2
End Sub

Sub ChangeCheckBoxImage(view As View,sType As String)
	
	Dim c1 As StateListDrawable
	Dim actColor,hoverColor As BitmapDrawable
	
	actColor.Initialize(LoadBitmapSample(File.DirAssets,sType & "_on.png",32,32))
	hoverColor.Initialize(LoadBitmapSample(File.DirAssets,sType & "_off.png",32,32))
	
	c1.Initialize
	c1.AddState(c1.State_Checked,actColor)
	c1.AddState(c1.State_Unchecked,hoverColor)
	c1.AddCatchAllState(hoverColor)
	
	view.Background = c1
	
End Sub

Sub Map2Json(Data As Map) As String
	
	If Data = Null Then Return ""
	If Data.IsInitialized = False Then Return ""
	
	Dim js As JSONGenerator
	js.Initialize(Data)
	Return js.ToString
		
End Sub

Sub List2Json(Data As List) As String
	
	If Data = Null Then Return ""
	If Data.IsInitialized = False Then Return ""
	
	Dim js As JSONGenerator
	js.Initialize2(Data)
	Return js.ToString
		
End Sub

#IgnoreWarnings: 17
Sub GetFont As Typeface
		
	If IsPersian Then
		Return Typeface.LoadFromAssets("byekan.ttf")
	Else
		Return Typeface.SANS_SERIF
	End If
	
End Sub

Sub IsPersian As Boolean
	
	If manager.GetString("lang").IndexOf("فارسی") > -1 Or manager.GetString("lang").ToLowerCase.IndexOf("persian") > -1 Then
		Return True
	Else
		Return False
	End If
	
End Sub

Sub IsPersian2(Lang As String) As Boolean
	
	If Lang.IndexOf("فارسی") > -1 Or Lang.ToLowerCase.IndexOf("persian") > -1 Then
		Return True
	Else
		Return False
	End If
	
End Sub

Sub IsEnglish As Boolean
	
	If manager.GetString("lang").IndexOf("انگلیسی") > -1 Or manager.GetString("lang").ToLowerCase.IndexOf("english") > -1 Then
		Return True
	Else
		Return False
	End If
	
End Sub

Sub IsEnglish2(Lang As String) As Boolean
	
	If Lang.IndexOf("انگلیسی") > -1 Or Lang.ToLowerCase.IndexOf("english") > -1 Then
		Return True
	Else
		Return False
	End If
	
End Sub

Sub SetDivider(lv As ListView, Color As Int, Height As Int)
   Dim R As Reflector
   R.Target = lv
   Dim CD As ColorDrawable
   CD.Initialize(Color, 0)
   R.RunMethod4("setDivider", Array As Object(CD), Array As String("android.graphics.drawable.Drawable"))
   R.RunMethod2("setDividerHeight", Height, "java.lang.int")
End Sub

Sub ChangeListviewStyle(lv1 As ListView)
	
	If GetDevicePhysicalSize > 5 Then
		lv1.TwoLinesLayout.ItemHeight = 130   'ertefa har menu
	End If
	
	If GetDevicePhysicalSize < 6 Then
		lv1.TwoLinesLayout.Label.TextSize = 13
		lv1.SingleLineLayout.Label.TextSize = 13
		lv1.TwoLinesLayout.SecondLabel.TextSize = 19
	Else
		lv1.TwoLinesLayout.Label.TextSize = 16
		lv1.SingleLineLayout.Label.TextSize = 19
		lv1.TwoLinesLayout.SecondLabel.TextSize = 22
	End If
	
	lv1.TwoLinesLayout.Label.Height = lv1.TwoLinesLayout.ItemHeight
	lv1.TwoLinesLayout.SecondLabel.Height = lv1.TwoLinesLayout.Label.Height
	
	SetDivider(lv1,Colors.RGB(82,160,218),1)
	
	lv1.TwoLinesLayout.Label.TextColor	= ConvertHex2Int(GetStringResourse("menubar_textcolor"))
	lv1.SingleLineLayout.Label.TextColor = ConvertHex2Int(GetStringResourse("menubar_textcolor"))
	lv1.TwoLinesLayout.SecondLabel.TextColor	=  ConvertHex2Int(GetStringResourse("menubar_textcolor"))
	
	Dim c1 As ColorDrawable
	c1.Initialize(ConvertHex2Int(GetStringResourse("menubar_header")),0)
	lv1.SingleLineLayout.Background = c1
	
	lv1.TwoLinesLayout.Label.Typeface	= GetFont
	lv1.SingleLineLayout.Label.Typeface	= GetFont
	lv1.TwoLinesLayout.SecondLabel.Typeface=  Typeface.LoadFromAssets("icomoon.ttf")
	
	lv1.TwoLinesLayout.SecondLabel.Top		= lv1.TwoLinesLayout.Label.Top
	lv1.SingleLineLayout.Label.Top			= lv1.TwoLinesLayout.Label.Top
	
	lv1.TwoLinesLayout.SecondLabel.Width	= lv1.Width-17dip
	lv1.TwoLinesLayout.Label.Width			= lv1.Width-50dip
	lv1.SingleLineLayout.Label.Width		= lv1.TwoLinesLayout.SecondLabel.Width
	
	If IsPersian2(currLang) Then
		lv1.TwoLinesLayout.Label.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
		lv1.TwoLinesLayout.SecondLabel.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
		lv1.SingleLineLayout.Label.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
	Else
		lv1.TwoLinesLayout.Label.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
		lv1.TwoLinesLayout.SecondLabel.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
		lv1.SingleLineLayout.Label.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
		lv1.TwoLinesLayout.Label.Left = 40dip
	End If
	
End Sub

Sub GetStringResourse(Key As String) As String
	
	Try
		Dim s As String
		s = ar.GetApplicationString(Key)
		If s.Length = 0 Then Log("key " & Key & " is empty")
		If s = Null Then Return ""
		Return s
	Catch
		Return ""
	End Try
	
End Sub

Sub ChangeProgressColor(ProgressBar1 As ProgressBar)
	
	Dim jo As JavaObject = ProgressBar1
	jo = jo.RunMethod("getIndeterminateDrawable", Null)
	jo.RunMethod("setColorFilter", Array (Theme_Header, "MULTIPLY"))
	
End Sub

Sub setLocalApp(lang As String)
	
	Dim loc As Locale
	Dim res As Resources
	
	If IsPersian2(lang) Then
		loc.Initialize("fa")
	Else If IsEnglish2(lang) Then
		loc.Initialize("en")
	Else
		loc.Initialize("fa")
	End If
	
	res.SetDefaultLocale(loc)
	res.Initialize(res.RESOURCE_SOURCE_APPLICATION)
	
End Sub

Sub GetResourceBitmap(key As String) As Bitmap
	
	Dim bd As BitmapDrawable
	bd = ar.GetApplicationDrawable(key)
	Return bd.Bitmap
	
End Sub

Sub ConvertHex2Int(hex As String) As String
    Dim R,G,b As Int
    R = Bit.ParseInt(hex.SubString2(1,3), 16)
    G = Bit.ParseInt(hex.SubString2(3,5), 16)
    b = Bit.ParseInt(hex.SubString2(5,7), 16)
    Return Colors.RGB(R, G, b)
End Sub

Sub LoadTheme
	Theme_Header = ConvertHex2Int(ar.GetApplicationString("theme_header"))
	Theme_Footer = ConvertHex2Int(ar.GetApplicationString("theme_footer"))
	Theme_Background = ConvertHex2Int(ar.GetApplicationString("theme_bg"))
End Sub

Sub WriteBitmap2File(Bitmap1 As Bitmap,filename As String)
	Dim os As OutputStream
	Dim b1 As Bitmap	
	b1.Initialize3(Bitmap1)
	os = File.OpenOutput(File.DirInternal,filename,False)
	b1.WriteToStream(os,100,"PNG")
	os.Close
End Sub

Sub GetFilename(fullpath As String) As String
	Dim res As String
	res = fullpath.SubString(fullpath.LastIndexOf("/") + 1)
   Return res
End Sub

Sub ShareString(sInfo As String,sBody As String,sSubject As String)
	Dim share As Intent
	share.Initialize(share.ACTION_SEND,"")
	share.SetType("text/plain")
	share.PutExtra("android.intent.extra.TEXT",sBody)
	share.PutExtra("android.intent.extra.SUBJECT", sSubject)
	share.WrapAsIntentChooser(sInfo)
	StartActivity(share)
End Sub

Sub ConvertHtml2String(Text As String) As String
    Dim Pattern, Replacement As String
    Dim m As Matcher

    Pattern = "<[^>]*>"
    Replacement = " "
	
	Try
    	m = Regex.Matcher2(Pattern, Regex.CASE_INSENSITIVE, Text)
    	Dim R As Reflector
    	R.Target = m
    	Return R.RunMethod2("replaceAll", Replacement, "java.lang.String")
	Catch
		Return Text
	End Try
End Sub

Sub setPaddingLabel(mLbl As Label)
	Dim R As Reflector
	R.Target = mLbl
	R.RunMethod4("setPadding", Array As Object(0,0,0,0), Array As String("java.lang.int", "java.lang.int", "java.lang.int", "java.lang.int"))
	R.RunMethod4("setIncludeFontPadding", Array As Object(False), Array As String("java.lang.boolean"))
End Sub

Sub ShowCartLabel(lbl As Label)
	
	Dim cart As OpenCart
	cart.Initialize
	
	Dim countcart As Int
	countcart = cart.GetCartCount
	
	Dim c1 As ColorDrawable
	c1.Initialize2(Theme_Header,50dip,1,Colors.White)
	lbl.Background = c1
	
	If countcart > 0 Then
		lbl.Text = countcart
		lbl.SetVisibleAnimated(700,True)
	Else
		lbl.SetVisibleAnimated(700,False)
	End If

End Sub

Public Sub GetDate(date1 As String) As String
 
 	Dim res(),month,perDate() As String
	Dim per As PersianDate
	
	Dim pp() As String
	
	pp = Regex.Split(" ",date1)
	
	Try
		
		If pp(0).IndexOf("-") > -1 Then
			res = Regex.Split("-",pp(0))
		Else
			res = Regex.Split("/",pp(0))
		End If
		
		month = res(1)
		
		perDate = Regex.Split("/",per.GetDate(res(0),month,res(2),"/"))
		
		Select Case perDate(1)
			Case 1
				month = "فروردین"
			Case 2
				month = "اردیبهشت"
			Case 3
				month = "خرداد"
			Case 4
				month = "تیر"
			Case 5
				month = "مرداد"
			Case 6
				month = "شهریور"
			Case 7
				month = "مهر"
			Case 8
				month = "آبان"
			Case 9
				month = "آذر"
			Case 10
				month = "دی"
			Case 11
				month = "بهمن"
			Case 12
				month = "اسفند"
		End Select
		
		Return perDate(2) & " " & month & " ماه " & " " & perDate(0) 
	
	Catch
		Return date1
	End Try
	
 End Sub
 
Sub CenterView(v As View, parent As View)
    v.Left = parent.Width / 2 - v.Width / 2
End Sub

Sub ShowErrors(rs As Map)
	
	Dim err As String
	
	For i = 0 To rs.Size - 1
		err = err & rs.GetValueAt(i) & CRLF
	Next
	
	Msgbox(err,GetStringResourse("alert"))
	
End Sub

Public Sub ValidPhoneNumber(id1 As String) As Boolean
	
	Try
		Return Regex.IsMatch("^0[0-9]{10}$",id1)
	Catch
		Return False
	End Try
	
End Sub

Public Sub ValidPostalCode(Code As String) As Boolean
	
	Try
		Return Regex.IsMatch("^[0-9]{2,10}$",Code)
	Catch
		Return False
	End Try
	
End Sub

Public Sub ValidEmail(EmailAddress As String) As Boolean
  
	Dim MatchEmail As Matcher = Regex.Matcher("^(?i)[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$", EmailAddress)

	If MatchEmail.Find = True Then
		Return True
	Else
		Return False
	End If
  
End Sub

Public Sub PaddingLabel(lbl As Label,Left As Int,Top As Int,Right As Int,Bottom As Int)
	Dim R As Reflector
	R.Target = lbl
	R.RunMethod4("setPadding", Array As Object(Left,Top,Right,Bottom), Array As String("java.lang.int", "java.lang.int", "java.lang.int", "java.lang.int"))
End Sub

Public Sub GetParentPanelDimension(LayoutName As String) As Int()

	If TempDimension.Length > 0 Then Return TempDimension
	
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
	
	TempDimension = Array As Int(parent.Width,parent.Height) 
	
	Return Array As Int(parent.Width,parent.Height)
	
End Sub

Sub LoadProduct(res As List,DefaultTop As Int,ScrollView1 As ScrollView) As Int
	
	Dim Glide As AriaGlide
	
	Dim Dimension(),Left,Top As Int
	Dim countItem,AllSpace,SpaceUnit As Int
	
	Dimension = GetParentPanelDimension("frmproduct_template")

	countItem = 100%x / Dimension(0)
	AllSpace = 100%x - (countItem * Dimension(0))
	
	SpaceUnit = AllSpace /(countItem + 1)
	
	Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
	
	If GetDevicePhysicalSize > 5 Then Left = Left - (SpaceUnit*2)
	'Left = SpaceUnit
	Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
	Top = DefaultTop
	
	Dim error_image As BitmapDrawable
	error_image.Initialize(LoadBitmap(File.DirAssets,"noimage.png"))
	
'	Dim cache_state As Boolean = manager.GetBoolean("cache")
		
	For i = 1 To res.Size
	
		DoEvents
		Dim pa As Panel
		pa.Initialize("")
		ScrollView1.Panel.AddView(pa,Left,Top,ScrollView1.Width,0)
		pa.LoadLayout("frmproduct_template")
		pa.Height = Dimension(1)
		DoEvents
		
		Dim Temp As Map
		Temp = res.Get(i-1)

		#Region Add value to view
		Dim imgTemp As ImageView
		'Dim btncart As Button
		Dim TempLabel,LabelPrice As Label
		Dim TempPanel As Panel
		Dim progress As ProgressBar
		Dim ParentPanel As Panel = pa.GetView(0)
		
		'btncart = ParentPanel.GetView(5)
		imgTemp = ParentPanel.GetView(4)
		TempLabel = ParentPanel.GetView(1)
		LabelPrice = ParentPanel.GetView(2)
		TempPanel = ParentPanel.GetView(6)
		progress = ParentPanel.GetView(0)
	
		TempLabel.Text = Temp.Get("name")
		TempLabel.Text = TempLabel.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
		
		If (TempLabel.Text.Length > 30) Then TempLabel.Text = TempLabel.Text.SubString2(0,30) & "..."
		LabelSpace(TempLabel,0.7)
		
		Dim price,special As String
		
		If Temp.ContainsKey("price_formated") Then
			price   = Temp.Get("price_formated")
		Else
			price   = Temp.Get("price")
		End If
		
		If Temp.ContainsKey("special_formated") Then
			special = Temp.Get("special_formated")
			If Temp.ContainsKey("special") Then
				If Temp.Get("special") = "0" Then
					special = ""
				End If
			End If
		Else If Temp.ContainsKey("special") Then
			special = Temp.Get("special")
			If special = "0 تومان" Then special = ""
		End If
		
		If special = "null" Or special = "false" Then special = ""
		
		TempLabel.Typeface = GetFont
		LabelPrice.Typeface = GetFont
		
		If price.Length > 0 And special.Length = 0 Then
			If price.StartsWith("0") = True Then
				LabelPrice.Text = GetStringResourse("call_us")
			Else
				LabelPrice.Text = price
			End If
		Else If special.Length > 0 Then
			LabelPrice.Text = DiscountStyleLabel(price,special)
		End If
		
		If LabelPrice.Text.ToLowerCase = "false" Then LabelPrice.Text = GetStringResourse("login_account")
		
		Dim quantity As Int
		
		If Temp.ContainsKey("quantity") Then
			quantity = Temp.Get("quantity")
		Else
			quantity = -1
		End If
		
		If quantity = 0 Then
			LabelPrice.Text = Temp.Get("stock_status")
		End If
		
		Dim PathImage As String
		
		If Temp.ContainsKey("image") Then 
			PathImage = Temp.Get("image")
		Else If Temp.ContainsKey("thumb") Then
			PathImage = Temp.Get("thumb")
		End If
		
		PathImage = PathImage.Replace(" ","%20")
		
		If PathImage.ToLowerCase = "null" Or PathImage.Length = 0 Then
			Glide.Load("file:///android_asset/noimage1.png").AsBitmap.Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		Else
			Glide.Load(PathImage).AsBitmap.Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		End If
		
		progress.RemoveView
		
		If TempPanel.Tag = "over" Then
			TempPanel.Tag = Temp
		Else If TempPanel.Tag = "topbar" Then
			TempPanel.Color = Theme_Header
		End If

		#End Region
		
		If i Mod countItem = 0 Then
			Top = Top + pa.Height + 15dip
			ScrollView1.Panel.Height = ScrollView1.Panel.Height + pa.Height
			Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
			'left = SpaceUnit
		Else
			Left = Left - SpaceUnit - Dimension(0)
			'Left = Left + SpaceUnit + Dimension(0)
		End If
		
	Next
	
	If res.Size Mod countItem <> 0 Then
		Top = Top + Dimension(1)
		ScrollView1.Panel.Height = ScrollView1.Panel.Height + Dimension(1)
	End If
	
	Return Top
	
End Sub

Sub LoadProductHorizontalScroll(res As List,ScrollView1 As HorizontalScrollView) As Int
	
	Dim left As Int = 20
	
	Dim Dimension() As Int
	
	Dim t2 As String
	t2 = ScrollView1.Tag
	
	Dimension = GetParentPanelDimension("frmproduct_template")
	
	For i = 0 To res.Size - 1
	
			Dim temp As Map
			temp = res.Get(i)
			
			AddProduct2Panel(ScrollView1,left,Dimension,temp)
			
			left = left + Dimension(0) + 10dip
		
	Next
	
	ScrollView1.Panel.Width = left
	
	Return Dimension(0)
	
End Sub

Sub AddProduct2Panel(ScrollView1 As HorizontalScrollView, Left As Int,Dimension() As Int,temp As Map)

		Dim Glide As AriaGlide

		Dim error_image As BitmapDrawable
		error_image.Initialize(LoadBitmap(File.DirAssets,"noimage.png"))
	
		Dim cache_state As Boolean = manager.GetBoolean("cache")
	
		DoEvents
		Dim pa As Panel
		pa.Initialize("")
		ScrollView1.Panel.AddView(pa,Left,0,Dimension(0),0)
		
		Dim tag As String
		tag = ScrollView1.Tag

		pa.LoadLayout("frmproduct_template")
		
		pa.Height = Dimension(1)

		#Region Add value to view
		Dim imgTemp As ImageView
		'Dim btncart As Button
		Dim TempLabel,LabelPrice As Label
		Dim TempPanel As Panel
		Dim progress As ProgressBar
		Dim ParentPanel As Panel = pa.GetView(0)
		
		'btncart = ParentPanel.GetView(5)
		imgTemp = ParentPanel.GetView(4)
		TempLabel = ParentPanel.GetView(1)
		LabelPrice = ParentPanel.GetView(2)
		TempPanel = ParentPanel.GetView(6)
		progress = ParentPanel.GetView(0)
		
		TempLabel.Text = temp.Get("name")
		TempLabel.Text = TempLabel.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")
		
		If (TempLabel.Text.Length > 30) Then TempLabel.Text = TempLabel.Text.SubString2(0,30) & "..."
		LabelSpace(TempLabel,0.7)
		
		Dim price,special As String
		Dim quantity As Int
		
		If temp.ContainsKey("quantity") Then
			quantity = temp.Get("quantity")
		Else
			quantity = -1
		End If
		
		If temp.ContainsKey("price_formated") Then
			price   = temp.Get("price_formated")
		Else
			price   = temp.Get("price")
		End If
		
		If temp.ContainsKey("special_formated") Then
			special = temp.Get("special_formated")
			If temp.ContainsKey("special") Then
				If temp.Get("special") = "0" Then
					special = ""
				End If
			End If
		Else If temp.ContainsKey("special") Then
			special = temp.Get("special")
			If special = "0 تومان" Then special = ""
		End If
		
		If special = "null" Or special = "false" Then special = ""
		
		LabelPrice.Typeface = GetFont
		TempLabel.Typeface = GetFont
		
		If price.Length > 0 And special.Length = 0 Then
			If price.StartsWith("0") = True Then
				LabelPrice.Text = GetStringResourse("call_us")
			Else
				LabelPrice.Text = price
			End If
		Else If special.Length > 0 Then
			LabelPrice.Text = DiscountStyleLabel(price,special)
		End If
		
		If LabelPrice.Text.ToLowerCase = "false" Then LabelPrice.Text = GetStringResourse("login_account")
		
		If quantity = 0 Then
			LabelPrice.Text = temp.Get("stock_status")
		End If
		
		Dim PathImage As String
		
		If temp.ContainsKey("image") Then 
			PathImage = temp.Get("image")
		Else If temp.ContainsKey("thumb") Then
			PathImage = temp.Get("thumb")
		End If
		
		PathImage = PathImage.Replace(" ","%20")
		
		If PathImage.ToLowerCase = "null" Or PathImage.Length = 0 Then
			Glide.Load("file:///android_asset/noimage1.png").AsBitmap.Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		Else
			Glide.Load(PathImage).AsBitmap.Resize(Abs(imgTemp.Width),Abs(imgTemp.Height)).CenterCrop.IntoImageView(imgTemp)
		End If
		
		progress.RemoveView
		
		If TempPanel.Tag = "over" Then
			TempPanel.Tag = temp
		Else If TempPanel.Tag = "topbar" Then
			TempPanel.Color = Theme_Header
		End If
		
		If temp.ContainsKey("href") Then
			Dim ma As Matcher
			ma = Regex.Matcher("product_id=(\d+)",temp.Get("href"))
			
			If ma.Find Then
				TempPanel.Tag = CreateMap("product_id":ma.Group(1))
			End If
		End If
		
		#End Region
		
		
End Sub

Public Sub DiscountStyleLabel(Price As String,FinalPrice As String) As RichString
	
	Dim style As String
	style = $"{r}{u}${Price}{r}{u}${CRLF}{g}${FinalPrice}{g}"$
	
	Dim rich As RichString
	rich.Initialize(style)
	rich.Color2(Colors.Black,"{g}")
	rich.Color2(Colors.Red,"{r}")
	rich.Strikethrough2("{u}")
	
	Return rich
	
End Sub

Public Sub DiscountPrice(Price As String) As RichString
	
	Dim style As String
	style = $"{r}{u}${Price}{r}{u}"$
	
	Dim rich As RichString
	rich.Initialize(style)
	rich.Color2(Colors.Black,"{g}")
	rich.Color2(Colors.Red,"{r}")
	rich.Strikethrough2("{u}")
	rich.Underscore2("{un}")
	Return rich
	
End Sub

Public Sub UnderLine(str As String) As RichString
	
	Dim rich As RichString
	rich.Initialize(str)
	rich.Underscore2("{un}")
	Return rich
	
End Sub

Sub HideScrollbar(ScrollView1 As ScrollView)
	Dim r As Reflector
	r.Target = ScrollView1
	r.RunMethod2("setVerticalScrollBarEnabled", False, "java.lang.boolean")
End Sub

Public Sub RedString(Str As String) As RichString
	
	Dim style As String
	style = $"{r}${Str}{r}"$
	
	Dim rich As RichString
	rich.Initialize(style)
	rich.Color2(Colors.Red,"{r}")
	
	Return rich
	
End Sub

Public Sub GetButtonState As StateListDrawable
	
	Dim state As StateListDrawable
	Dim c1,c2 As ColorDrawable
	
	state.Initialize
	c1.Initialize(ConvertHex2Int(GetStringResourse("button_hover_color")),4)
	c2.Initialize(ConvertHex2Int(GetStringResourse("button_active_color")),4)
	
	state.AddState(state.State_Pressed,c1)
	state.AddCatchAllState(c2)
	
	Return state
	
End Sub

Public Sub GetButtonStateOnTheme(Radius As Int) As StateListDrawable
	
	Dim state As StateListDrawable
	Dim c1,c2 As ColorDrawable
	
	state.Initialize
	c1.Initialize(Theme_Header + 4,Radius)
	c2.Initialize(Theme_Header,Radius)
	
	state.AddState(state.State_Pressed,c1)
	state.AddCatchAllState(c2)
	
	Return state
	
End Sub

Public Sub GetButtonStateCircle(Width As Int) As StateListDrawable
	
	Dim state As StateListDrawable
	Dim c1,c2 As ColorDrawable
	
	state.Initialize
	c1.Initialize(Theme_Header,Width / 2)
	c2.Initialize(Theme_Header,Width / 2)
	
	state.AddState(state.State_Pressed,c1)
	state.AddCatchAllState(c2)
	
	Return state
	
End Sub

Public Sub MakeDateDialog(Year As String,Month As String,Day As String) As String
	
	Dim lblyear,lblmonth,lblday As Label
	lblyear.Initialize("")
	lblmonth.Initialize("")
	lblday.Initialize("")
	
	Dim p1 As Panel
	p1.Initialize("")
	
	Dim spyear,spmonth,spday As Spinner
	spyear.Initialize("")
	spmonth.Initialize("")
	spday.Initialize("")
	
	Dim d1 As CustomDialog2
	d1.AddView(p1,400,450)
	p1.AddView(lblyear,0,5,p1.Width,30dip)
	p1.AddView(spyear,0,32dip,p1.Width,30dip)
	p1.AddView(lblmonth,0,spyear.Height + spyear.Top + 4dip,p1.Width,30dip)
	p1.AddView(spmonth,0,spyear.Height + lblmonth.Top+ 4dip,p1.Width,30dip)
	p1.AddView(lblday,0,spyear.Height + spmonth.Top+ 4dip,p1.Width,30dip)
	p1.AddView(spday,0,spyear.Height + lblday.Top+ 4dip,p1.Width,30dip)
	
	lblyear.Text = GetStringResourse("year")
	lblmonth.Text = GetStringResourse("month")
	lblday.Text = GetStringResourse("day")
	lblyear.Gravity = GetStringResourse("direction")
	lblmonth.Gravity = GetStringResourse("direction")
	lblday.Gravity = GetStringResourse("direction")
	lblyear.Typeface = GetFont
	lblmonth.Typeface = GetFont
	lblday.Typeface = GetFont
	spyear.TextSize = 12
	spmonth.TextSize = 12
	spday.TextSize = 12
	
	Dim currday,currmonth,curryear As String
	
	If IsPersian = False Then
		currday = DateTime.GetDayOfMonth(DateTime.Now)
		currmonth = DateTime.GetMonth(DateTime.Now)
		curryear = DateTime.GetYear(DateTime.Now)
	Else
		Dim pr As PersianDate
		Dim date1,date2() As String
		date1 = pr.GetDate(0,0,0,"/")
		date2 = Regex.Split("/",date1)
		currday = date2(2)
		currmonth = date2(1)
		curryear = date2(0)
	End If
	
	For i = 1 To 31
		If i < 13 Then
			
			spmonth.Add(i)

			If i = Month And Month <> 0 Then
				spmonth.SelectedIndex = i-1
			Else If i = currmonth Then
				spmonth.SelectedIndex = i-1
			End If
			
		End If
		
		spday.Add(i)
		
		If i = Day And Day <> 0 Then
			spday.SelectedIndex = i-1
		Else If i = currday Then
			spday.SelectedIndex = i-1
		End If
		
	Next
	
	Dim sFrom As Int = 1900
	
	If IsPersian Then
		sFrom = 1350
	End If
	
	For j = sFrom To sFrom + 100
		spyear.Add(j)
	Next
	
	For s = 0 To spyear.Size - 1
		
		If spyear.GetItem(s) = Year And Year <> 0 Then
			spyear.SelectedIndex = s
		Else If spyear.GetItem(s) = curryear Then
			spyear.SelectedIndex = s
		End If
		
	Next
	
	If d1.Show(GetStringResourse("date_enter"),GetStringResourse("ok"),GetStringResourse("cancel"),"",Null) = DialogResponse.POSITIVE Then
		Return $"${spyear.SelectedItem}/${spmonth.SelectedItem}/${spday.SelectedItem}"$
	Else
		Return ""
	End If
	
End Sub

Public Sub ParseDate(Date As String) As Int()
	
	Dim ra() As String
	ra = Regex.Split("/",Date)
	
	If ra.Length = 3 Then
		Return Array As Int(ra(0),ra(1),ra(2))
	Else
		Return Array As Int(0,0,0)
	End If
	
End Sub

Public Sub ParseTime(Time As String) As Int()
	
	Dim ra() As String
	ra = Regex.Split(":",Time)
	
	If ra.Length = 2 Then
		Return Array As Int(ra(0),ra(1))
	Else
		Return Array As Int(DateTime.GetHour(DateTime.Now),DateTime.GetMinute(DateTime.Now))
	End If
	
End Sub

Sub RegexReplace(Pattern As String, Text As String, Replacement As String) As String
    Dim m As Matcher
    m = Regex.Matcher(Pattern, Text)
    Dim R As Reflector
    R.Target = m
    Return R.RunMethod2("replaceAll", Replacement, "java.lang.String")
End Sub

Sub AddItem(Title As String,sType As String,sName As String,Tag As Object,Top As Object,SV1 As ScrollView,ShowIcon As Boolean) As ResponseAddItem
	
	Dim v1 As View
	
	#Region Make a Edittext
	If sType = "text" Then
		Dim txt1 As EditText
		txt1.Initialize("txtdata")
		txt1.Color = Colors.White
		txt1.TextColor = Colors.Black
		txt1.Typeface = GetFont
		txt1.Gravity = GetStringResourse("direction")
		txt1.TextSize = 12
		txt1.Tag = sName
		v1 = txt1
		
		If sName = "telephone" Or sName = "postcode" Or sName = "fax" Then
			txt1.InputType = txt1.INPUT_TYPE_PHONE
			txt1.Gravity = Gravity.LEFT
			If ShowIcon = True Then
				EditTextIcon(txt1,"ic_menu_edit")
			End If
			
		Else If sName = "password" Then
			txt1.PasswordMode = True
			txt1.Gravity = Gravity.LEFT
			If ShowIcon = True Then
				EditTextIcon(txt1,"ic_menu_login")
			End If
			
		Else If sName = "email" Then
			txt1.Gravity = Gravity.LEFT
			txt1.InputType = 33
			If ShowIcon = True Then
				EditTextIcon(txt1,"ic_menu_cc")
			End If
		
		Else
			If ShowIcon = True Then
				EditTextIcon(txt1,"ic_menu_edit")
			End If
		End If
		
		If sName <> "password" Then
			txt1.SingleLine = True
		End If
	
	#End Region
	
	#Region Make a Spinner
	Else If sType = "spinner" Then
		
		Dim sp As Spinner
		sp.Initialize(sName)
		
		If Tag <> Null Then
			If Tag Is List Then
				sp.AddAll(Tag)
			End If
		End If
		
		sp.Color = Colors.White
		sp.TextColor = Colors.Black
		sp.DropdownBackgroundColor = Colors.White
		sp.DropdownTextColor = Colors.Black
		sp.TextSize = 12
		sp.Tag = sName
		
		If IsPersian Then
			Dim lss As List
			lss = Tag
			For i=0 To lss.Size - 1
				If lss.Get(i) = "جمهوری اسلامی ایران" Then
					sp.SelectedIndex = i
					Exit				
				End If
			Next
		End If
		
		v1 = sp
	
	#End Region
	
	End If
		
	Dim lbl1 As Label
	lbl1.Initialize("")
	lbl1.TextColor = Colors.Black
	lbl1.Typeface = GetFont
	lbl1.TextSize = 12
	lbl1.Gravity = GetStringResourse("direction")
	
	SV1.Panel.AddView(lbl1,15,Top,SV1.Width - 34,30dip)
	Top = Top + 34dip
	
	If sName = "address_1" Then
		SV1.Panel.AddView(v1,15,Top,SV1.Width - 34,97dip)
	Else
		SV1.Panel.AddView(v1,15,Top,SV1.Width - 34,37dip)	
	End If
	
	Top = Top + 52dip
	
	lbl1.Text = Title
	
	SV1.Panel.Height = Top
	
	Dim st As ResponseAddItem
	st.Initialize
	st.Top = Top
	st.View1 = v1
	
	Return st
	
End Sub

#Region Add2Cart

Public Sub Add2Cart(sID As String,sCount As String,sModule As Object)
	
	If InternetState = False Then
		ToastMessageShow(GetStringResourse("error_net_details"),False)
		Return
	End If
	
	ProductChoosenID = sID
	
	ProgressDialogShow(GetStringResourse("apply"))
	
	Dim details As OpenCart
	details.Initialize
	details.Add2Cart(sModule,"Add2Cart2_receive",sID,sCount,CreateMap("test":"test"))
	
End Sub

#End Region

Public Sub BoldString(str As String) As RichString
	
	Dim r1 As RichString
	r1.Initialize(str)
	r1.Style2(r1.STYLE_BOLD,"{b}")
	r1.Color2(Theme_Header,"{c}")
	Return r1
	
End Sub

Public Sub ChangeRBStyle(rb As RadioButton)
	
'	Dim c1 As StateListDrawable
'	Dim actColor,hoverColor As ColorDrawable
'	
'	actColor.Initialize(Colors.Gray,0)
'	hoverColor.Initialize(Colors.Transparent,0)
'	
'	c1.Initialize
'	c1.AddState(c1.State_Checked,actColor)
'	c1.AddState(c1.State_Unchecked,hoverColor)
'	c1.AddCatchAllState(hoverColor)
'	
'	rb.Background = c1
	
End Sub

Sub ParseURL_Scheme(Intent1 As Intent) As String
	
	Dim i1 As String
	i1 = Intent1
	i1 = i1.ToLowerCase
	
	If i1.IndexOf($"dat=opencart://${GetStringResourse("scheme")}"$) > -1 Then
	
		Dim m As Matcher
		m = Regex.Matcher($"dat=opencart://${GetStringResourse("scheme")}/(\d+)"$,i1)
		
		If m.Find Then
			Return m.Group(1)
		End If

 	End If
	
	Return ""
	
End Sub

Public Sub GetLimitLoadItem As Int
	
	If GetDevicePhysicalSize > 6 Then
		Return 12
	Else
		Return 7
	End If
	
End Sub

Sub UnderLineString(label1 As Label)
	
	Dim rs As RichString
	rs.Initialize("{u}" & label1.Text & "{u}")
	rs.Underscore2("{u}")
	label1.Text = rs
	
End Sub

Sub EditTextIcon(EditTxt As EditText,Icon As String)
    
	Dim ar As AndroidResources
    Dim ETxt As JavaObject = EditTxt
	
	ETxt.RunMethod("setCompoundDrawablesWithIntrinsicBounds",Array As Object(ar.GetAndroidDrawable(Icon),Null,Null,Null))
	
End Sub

Sub WriteObjectFile(object1 As Object,Filename As String)
	
	Dim rn As RandomAccessFile
	rn.Initialize(File.DirInternal,Filename,False)
	rn.WriteObject(object1,False,0)
	rn.Close
	
End Sub

Sub ReadObjectFile(Filename As String) As Object
	
	Dim rn As RandomAccessFile
	Dim res As String
	
	rn.Initialize(File.DirInternal,Filename,True)
	res = rn.ReadObject(0)
	rn.Close
	
	Return res
	
End Sub

Sub Decrypt(encryptedData As String ) As String
	
	Dim c As B4XCipher
	Dim su As StringUtils
	Dim key As String = Sign.KeyHash.Replace(CRLF,"")
	Dim b() As Byte = c.Decrypt(su.DecodeBase64(encryptedData),key)
	
	Dim temp As String
	temp = BytesToString(b, 0, b.Length, "UTF-8")
	Return temp

End Sub

Sub DoCommand(Texts As List)
	
	If Texts.IsInitialized = False Then Return
	
	For i = 0 To Texts.Size - 1
		
		Dim res As String
		res = Texts.Get(i)
		
		If res.IndexOf("login") > -1 Or res.IndexOf("ورود") > -1 Then
			StartActivity(actLogin)
		Else If res.IndexOf("register") > -1 Or res.IndexOf("ثبت") > -1  Then
			StartActivity(actRegister)
		Else If res.IndexOf("category") > -1 Or res.IndexOf("دسته") > -1  Then
			StartActivity(actCategory)
		Else If res.IndexOf("contact") > -1  Or res.IndexOf("ارتباط") > -1 Then
			StartActivity(actContact)
		Else If res.IndexOf("about") > -1  Or res.IndexOf("درباره") > -1  Then
			StartActivity(actAbout)
		Else If res.IndexOf("cart") > -1 Or res.IndexOf("سبد") > -1  Then
			StartActivity(actBasket)
		Else If res.IndexOf("search") > -1 Or res.IndexOf("جستجو") > -1  Then
			StartActivity(actSearch)
		Else if res.IndexOf("close") > -1 Or res.IndexOf("برگرد") > -1 Or res.IndexOf("عقب") > -1 Then
			If CurrentModule <> Null Then
				If SubExists(CurrentModule,"CloseMe") Then
					CallSubDelayed(CurrentModule,"CloseMe")
				End If
			End If	
		End If
		
	Next
	
End Sub

Sub ScaleCenterAnimation(View1 As View,fromx As Float,fromy,tox As Float,toy As Float,Duration As Float)
	
	Dim ani As AnimationPlus
	ani.InitializeScaleCenter("ani",fromx,fromy,tox,toy,View1)
	ani.Duration = Duration
	ani.PersistAfter = False
	ani.Start(View1)
	DoEvents
	
End Sub

Sub MakeUpScrollButton(Panel As Panel) As Button
	
	Dim size As Int : size = 40dip
	
	Dim b1 As Button
	b1.Initialize("btnScrollUp")
	
	b1.Typeface = Typeface.LoadFromAssets("icomoon.ttf")
	b1.Text = ""
	b1.TextColor = Colors.White
	b1.TextSize = 15
	
	Panel.AddView(b1,Panel.Width - 48dip,Panel.Height + size+10dip,size,size)
	
	Dim c1 As ColorDrawable
	c1.Initialize(Theme_Header,size/2)
	b1.Background = c1
	
	Return b1
	
End Sub

Sub CommonErrorHttpJob(Error As String) As String
	
	If Error.ToLowerCase.IndexOf("javax.net.ssl.SSLException: hostname in certificate didn't match") > -1 Then
		Return GetStringResourse("error_ssl")
	
	Else if Error.ToLowerCase.IndexOf("domain not available") > -1 Then
		Return GetStringResourse("error_domain")
		
	End If
	
End Sub

Sub GetRoot As Boolean
	
	Dim p As Phone
	Dim IsRoot As Boolean
	Try
		p.Shell("su", Null, Null, Null)
		File.WriteString("/", "test.txt", "")
		IsRoot = True
	Catch
		IsRoot = False
	End Try
	
	Return IsRoot

End Sub

Sub GetLanguage As String
	Dim Obj1 As Reflector
	Dim args(0) As Object
	Dim types(0) As String
	Return Obj1.RunStaticMethod("java.util.Locale", "getDefault", args, types)
End Sub

Sub GetRelativeTop(V As JavaObject) As Int
	'I tried several methods to do this, this was the only one that worked across API's and devices
  
	'One of these will always be the last parent
	If GetType(V) = "android.view.ViewRoot" Or GetType(V) = "android.view.ViewRootImpl" Then
		Return 0
	Else
		'If V.Top is valid for this view returns a value then add it, else skip to the next parent
		Try
			Dim VW As View = V
			Return VW.Top + GetRelativeTop(V.RunMethod("getParent",Null))
		Catch
			Return GetRelativeTop(V.RunMethod("getParent",Null))
		End Try
	End If
End Sub