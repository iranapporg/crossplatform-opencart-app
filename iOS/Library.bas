Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Public setting As Settings
	Type ResponseAddItem(View1 As View,Top As Int,Left As Int)
	Public StringResourse As String
	Public RefererPage As Page
	Public HUD As HUD
	Public PaymentSuccess As Boolean
	Public Application As Application
	Private ln As Notification
	Public NavControl As NavigationController
	Public MainPage,ErrorNetPage,MenuPage,CategoryPage,ProductPage,pageBasket,AccountPage,DoOrderPage As Page
	Public token,CartDetails As Map
	Public currLang,currCurrency As String
	Public StoreID As String
	Public Manager As clsPreferenceManager
	Public FirstRun As Boolean
	Public imagesSlideshow,imagesSlideshowProduct,FeatureProduct,BestProduct,NewProduct,listSlideshow,listManufacturers,listInformation As List
	Public wishlist As String
	Public Theme_Header,Theme_Footer,Theme_Background As Int
	Public Coupons As List
	Public Language As Map
	Public App As Application
	Private TempDimension() As Int
	Public ProductChoosenID As String
	Public loginDetails As Map
	Public LastPage As Page
	Dim POSITIVE As Int
	Dim NEGATIVE As Int
	Dim CANCEL As Int
	Public GuestLogin As Map
	Public ChoosenAddress As Int
	Public PItemDefault As Panel
	Private pnlcustomdialog As Panel
	Public KEY_APP As String = "OR5syFVZuTWHuYCV9Jf4ecYqhRI="
End Sub

Sub CenterView2(v As View, parent As View)
    v.Left = parent.Width / 2 - v.Width / 2
    v.Top = parent.Height / 2 - v.Height / 2
End Sub

Sub GetParent(View1 As View) As View
	
	Dim No As NativeObject = View1
	Dim parent As View = No.GetField("superview")
	
	Return parent
	
End Sub

Public Sub UnderLine(str As String,label As Label)
	
	Dim rich As RichString
	rich.Initialize(str)
	rich.Underline(True,Colors.Black,0,str.Length)
	rich.SetToLabel(label)
	
End Sub

Sub FullScreenApp(App1 As Application)
	Dim no As NativeObject = App1
	no.RunMethod("setStatusBarHidden:animated:", Array(True, True))
End Sub

Public Sub GetLimitLoadItem As Int
	
	If GetDevicePhysicalSize > 6 Then
		Return 12
	Else
		Return 7
	End If
	
End Sub

Sub GetFilename(fullpath As String) As String
   Return fullpath.SubString(fullpath.LastIndexOf("/") + 1)
End Sub

Sub GetDevicePhysicalSize As Float
    Dim lv As LayoutValues
    lv = GetDeviceLayoutValues
	Dim t As Float
    t = Sqrt(Power(lv.Height / lv.Scale / 160, 2) + Power(lv.Width / lv.Scale / 160, 2))
	Return t
End Sub

Sub GetWidth As Int
	Dim lv As LayoutValues
    lv = GetDeviceLayoutValues
	Return lv.Width
End Sub

Sub GetHeight As Int
	Dim lv As LayoutValues
    lv = GetDeviceLayoutValues
	Return lv.Height
End Sub

Sub ShowCartLabel(lbl As Label)
	
	Dim cart As OpenCart
	cart.Initialize
	
	Dim countcart As Int
	countcart = cart.GetCartCount
	
	Dim c1 As Int
	c1 = Colors.RGB(178,34,34)
	lbl.Color = c1
	lbl.SetBorder(0,Colors.White,10dip)
	
	If countcart > 0 Then
		lbl.Text = countcart
		lbl.Visible = True
	Else
		lbl.Text = "0"
		lbl.Visible = False
	End If

End Sub

Sub ShowErrors(rs As Map)
	
	Dim err As String
	
	For Each v As String In rs.Values
		err = err & v & CRLF
	Next
	
	Msgbox(err,GetStringResourse("alert"))
	
End Sub

Public Sub Add2Cart(sID As String,sCount As String,sModule As Object)
	
	If InternetState = False Then
		HUD.ToastMessageShow(GetStringResourse("error_net_details"),False)
		Return
	End If
	
	ProductChoosenID = sID
	
	HUD.ProgressDialogShow(GetStringResourse2("apply"))
	
	Dim details As OpenCart
	details.Initialize
	details.Add2Cart(sModule,"Add2Cart2_receive",sID,sCount,CreateMap("test":"test"))
	
End Sub

Sub CenterView(v As View, parent As View)
    v.Left = parent.Width / 2 - v.Width / 2
End Sub

Public Sub ValidEmail(EmailAddress As String) As Boolean
  
	Dim MatchEmail As Matcher = Regex.Matcher("^(?i)[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$", EmailAddress)

	If MatchEmail.Find = True Then
		Return True
	Else
		Return False
	End If
  
End Sub

Sub ConvertHex2Int(hex As String) As String
    Dim R,G,b As Int
    R = Bit.ParseInt(hex.SubString2(1,3), 16)
    G = Bit.ParseInt(hex.SubString2(3,5), 16)
    b = Bit.ParseInt(hex.SubString2(5,7), 16)
    Return Colors.RGB(R, G, b)
End Sub

Sub UnderLineString(label1 As Label)
	
	Dim rs As RichString
	rs.Initialize(label1.Text)
	rs.Underline(True,Theme_Header,0,label1.Text.Length)
	rs.SetToLabel(label1)
	
End Sub

Sub LoadTheme
	Theme_Header = ConvertHex2Int(GetStringResourse("theme_header"))
	Theme_Footer = ConvertHex2Int(GetStringResourse("theme_footer"))
	Theme_Background = ConvertHex2Int(GetStringResourse("theme_bg"))
End Sub

Public Sub RedString(Str As String,Label As Label)
	
	Dim rich As RichString
	rich.Initialize(Str)
	rich.Color(Colors.Red,0,Str.Length)
	rich.SetToLabel(Label)
	
End Sub

Sub ResizeBitmap(bmp As Bitmap, scale As Float) As Bitmap
   Dim img As ImageView
   img.Initialize("")
   img.Width = bmp.Width * scale
   img.Height = bmp.Height * scale
   Dim cvs As Canvas
   cvs.Initialize(img)
   cvs.DrawBitmap(bmp, cvs.TargetRect)
   Dim res As Bitmap = cvs.CreateBitmap
   cvs.Release
   Return res
End Sub

Sub GetStringResourse(Key As String) As String
	
	Dim str As String
	
	Dim match,match1 As Matcher
	match = Regex.Matcher($"<string name="${Key}">(\S+)</string>"$,StringResourse)
	
	If match.Find Then
		str = match.Group(1)
		Return str
	Else
		match1 = Regex.Matcher($"<string name="${Key}">([^a-zA-Z0-9]+)</string>"$,StringResourse)
		If match1.Find Then
			str = match1.Group(1)
			Return str
		Else
			If Language.ContainsKey(Key) Then
				str = Language.Get(Key)
				Return str
			
			Else
				match1 = Regex.Matcher($"<string name="${Key}">(.*)</string>"$,StringResourse)
				If match1.Find Then
					str = match1.Group(1)
					Return str
				Else
					Return ""
				End If
			End If
		End If
	End If
	
End Sub

Sub ChangeFont(Root As Panel)
	
	For Each v1 As View In Root.GetAllViewsRecursive
		If v1.Tag = "icon" Then
			If v1 Is Button Then
				Dim b1 As Button
				b1 = v1
				SetFont(b1.CustomLabel,"icomoon",b1.CustomLabel.Font.Size)
			Else if v1 Is Label Then
				Dim l2 As Label
				l2 = v1
				SetFont(l2,"icomoon",l2.Font.Size)
			End If
		Else
			If v1 Is Button Then
				Dim b1 As Button
				b1 = v1
				b1.CustomLabel.Font = GetFont(b1.CustomLabel.Font.Size)
			Else if v1 Is Label Then
				Dim l2 As Label
				l2 = v1
				l2.Font = GetFont(l2.Font.Size)
			End If
		End If
	Next
	
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

Sub GetStringResourse2(Key As String) As String
	
	If Language.ContainsKey(Key) Then
		Return Language.Get(Key)
	Else
		Return ""
	End If
	
End Sub

Sub ChangeNavigationColor
	Dim no As NativeObject = NavControl
	no.GetField("navigationBar").RunMethod("setBarTintColor:", Array(no.ColorToUIColor(Theme_Header)))
End Sub

Sub Decrypt(encryptedData As String ) As String

	Dim c As Cipher
	Dim su As StringUtils
	Dim key As String = KEY_APP
	Dim b() As Byte = c.Decrypt(su.DecodeBase64(encryptedData),key)
	
	Dim temp As String
	temp = BytesToString(b, 0, b.Length, "utf-8")
	temp = temp.SubString2(0,temp.IndexOf(Chr(0)))
	Return temp
	
End Sub

Sub Encrypt(Data As String,Password As String)
	
	Dim c As Cipher
	Dim su As StringUtils
	Dim key As String = KEY_APP
	Dim b() As Byte = c.Encrypt(Data.GetBytes("UTF8"),Password)
	
	Dim temp As String
	temp = BytesToString(b, 0, b.Length, "utf-8")
	temp = temp.SubString2(0,temp.IndexOf(Chr(0)))
	Return temp
	
End Sub

Sub ShowNotification(Info As String,BadgeNumber As Int)
	ln.Initialize(DateTime.Now + 1 * DateTime.TicksPerSecond) '6 seconds from now
	ln.IconBadgeNumber = 0
	ln.IconBadgeNumber = BadgeNumber
	ln.AlertBody = Info
	ln.PlaySound = True
	ln.Register
End Sub

Public Sub ValidPostalCode(Code As String) As Boolean
	
	Try
		Return Regex.IsMatch("^[0-9]{2,10}$",Code)
	Catch
		Return False
	End Try
	
End Sub

Public Sub ValidPhoneNumber(id1 As String) As Boolean
	
	Try
		Return Regex.IsMatch("^0[0-9]{10}$",id1)
	Catch
		Return False
	End Try
	
End Sub

Sub InternetState As Boolean

	Dim myLAN As ServerSocket

	If myLAN.GetMyIP = "127.0.0.1" Then
		Return False
	Else
		Return True
	End If
	
End Sub

Sub LoadLanguage(Lang As String)
	
	Dim Langs As String = File.ReadString(File.DirAssets,Lang & ".xml")
	Language.Initialize
	
	Dim match As Matcher
	match = Regex.Matcher($"<string name="(.*)">(.*)</string>"$,Langs)
	
	Do While match.Find
		Language.Put(match.Group(1),match.Group(2))
	Loop
	
	Language.Put("CurrLang",Lang)
	
End Sub

Sub SetFont(Views As View,FontName As String,FontSize As Int)
	
	'If FontName = "" Then FontName = "byekan"
	If FontName = "" Then FontName = "iransans"
	
	If Views Is Button Then
		Dim b1 As Button
		b1 = Views
		b1.CustomLabel.Font = Font.CreateNew2(FontName,FontSize)
	
	Else if Views Is Label Then
		Dim lb As Label
		lb = Views
		lb.Font = Font.CreateNew2(FontName,FontSize)
	End If
	
End Sub

Public Sub GetParentPanelDimension(LayoutName As String) As Int()

	If TempDimension.Length > 0 Then Return TempDimension
	
	Dim p1 As Panel
	p1.Initialize("")
	p1.LoadLayout(LayoutName)
	
	Dim parent As View
	Dim v1 As View
	
	For Each v1 As View In p1.GetAllViewsRecursive
		If v1 Is Panel Then
			parent = v1
			Exit
		End If
	Next
	
	TempDimension = Array As Int(parent.Width,parent.Height) 
	
	Return Array As Int(parent.Width,parent.Height)
	
End Sub

Sub LoadProduct(res As List,DefaultTop As Int,ScrollView1 As ScrollView) As Int
	
	Dim Dimension(),Left,Top As Int
	Dim countItem,AllSpace,SpaceUnit As Int
	
	Dimension = GetParentPanelDimension("frmproduct_template")

	countItem = GetWidth / Dimension(0)
	AllSpace = GetWidth - (countItem * Dimension(0))
	
	SpaceUnit = AllSpace /(countItem + 1)
	
	Left = ( countItem * Dimension(0)) - Dimension(0) + AllSpace / countItem + SpaceUnit / countItem
	
	If GetDevicePhysicalSize > 5 Then Left = Left - (SpaceUnit*2)
	'Left = SpaceUnit
	
	Top = DefaultTop
		
	For i = 1 To res.Size
	
		Dim pa As Panel
		pa.Initialize("")
		ScrollView1.Panel.AddView(pa,Left,Top,ScrollView1.Width,0)
		pa.LoadLayout("frmproduct_template")
		pa.Height = Dimension(1)
		
		Dim Temp As Map
		Temp = res.Get(i-1)

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
		
		TempLabel.Font = GetFont(LabelPrice.Font.Size)
		LabelPrice.Font = GetFont(LabelPrice.Font.Size)
		
		Log(special <> 0)
		
		If price.Length > 0 And (special <> 0) <> False Then
			LabelPrice.Text = price
		Else If (special <> 0) <> False Then
			DiscountStyleLabel(price,special,LabelPrice)
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

Sub LoadProductHorizontalScroll(res As List,ScrollView1 As ScrollView) As Int
	
	Dim left As Int = 20
	
	Dim Dimension() As Int
	Dimension = GetParentPanelDimension("frmproduct_template")
	
	For i = 0 To res.Size - 1
	
		Dim temp As Map
		temp = res.Get(i)
		
		AddProduct2Panel(ScrollView1,left,Dimension,temp)

		left = left + Dimension(0) + 10dip
		
	Next
	
	ScrollView1.Panel.Width = left
	ScrollView1.ContentWidth = left
	
	Return Dimension(0)
	
End Sub

Sub AddProduct2Panel(ScrollView1 As ScrollView, Left As Int,Dimension() As Int,temp As Map)

		Dim pa As Panel
		pa.Initialize("")
		ScrollView1.Panel.AddView(pa,Left,0,Dimension(0),0)
		pa.LoadLayout("frmproduct_template")
		pa.Height = Dimension(1)

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
		TempLabel.Text = temp.Get("name")
		TempLabel.Text = TempLabel.Text.Replace("&quot;",QUOTE).Replace("&amp;","&")

		Dim price,special As String
		
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
		
		If special = "null" Or special = "false" Or special = "0" Then special = ""
		
		If IsPersian Then
			SetFont(LabelPrice,"",14)
			SetFont(TempLabel,"",14)
		End If
		
		If price.Length > 0 And special.Length = 0 Then
			LabelPrice.Text = price
		Else If special.Length > 0 Then
			DiscountStyleLabel(price,special,LabelPrice)
		End If
			
		Dim PathImage As String
		
		If temp.ContainsKey("image") Then 
			PathImage = temp.Get("image")
		Else If temp.ContainsKey("thumb") Then
			PathImage = temp.Get("thumb")
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
			TempPanel.Tag = temp
		Else If TempPanel.Tag = "topbar" Then
			TempPanel.Color = Theme_Header
		End If

		#End Region
		
		
End Sub

Public Sub DiscountStyleLabel(Price As String,FinalPrice As String,Label1 As Label)
	
	Dim style As String
	style = FinalPrice
	Label1.Text = style
	
	Dim rich As RichString
	rich.Initialize(Label1.Text)
	rich.Color(Colors.RGB(34,157,40),0,FinalPrice.Length)
	rich.Underline(True,Colors.RGB(236,236,236),0,FinalPrice.Length)
	
	rich.SetToLabel(Label1)
	
End Sub

Public Sub Julian2Persian(Year As Int,Month As Int,Day As Int,seprator As String) As String

Dim DayNumber As Int
Dim Kabiseh As Byte
Dim S As String
	
	If Year = 0 And Month = 0 And Day = 0 Then
		Year = DateTime.GetYear(DateTime.Now)
		Month = DateTime.GetMonth(DateTime.Now)
		Day   = DateTime.GetDayOfMonth(DateTime.Now)
	End If
	
	DayNumber = (Year - 622 Mod 1000) Mod 100

	If (((Year Mod 1000) Mod 100) = DayNumber) Or _
	(((Year Mod 1000) Mod 100) = DayNumber + 1) Then
		Year = 1300 + ((Year Mod 1000) Mod 100)
		Return Year & seprator & Month & seprator & Day
	End If

	If Year Mod 4 = 0 Then Kabiseh = 1 Else Kabiseh = 0
	
	Select Month
		Case 1: DayNumber = Day
		Case 2: DayNumber = 31 + Day
		Case 3: DayNumber = 31 + 28 + Kabiseh + Day
		Case 4: DayNumber = 31 + 28 + Kabiseh + 31 + Day
		Case 5: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + Day
		Case 6: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + 31 + Day
		Case 7: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + 31 + 30 + Day
		Case 8: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + 31 + 30 + 31 + Day
		Case 9: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + 31 + 30 + 31 + 31 + Day
		Case 10: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + 31 + 30 + 31 + 31 + 30 + Day
		Case 11: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + Day
		Case 12: DayNumber = 31 + 28 + Kabiseh + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + Day
	End Select
	
	Year = Year - 622
	Month = Month + 9

	If DayNumber > 79 Then
		DayNumber = DayNumber - (79 - Kabiseh)
		Year = Year + 1
	Else
		DayNumber = DayNumber + (286 + Kabiseh)
	End If
	
	If Month > 12 Then Month = Month - 11
	
	If DayNumber <= 186 Then
		Month = (DayNumber / 31) + 1
			If (DayNumber Mod 31) = 0 Then Month = Month - 1
				Day = (DayNumber Mod 31)
				If Day = 0 Then Day = 31
			Else
				Month = 7 + ((DayNumber - 186) / 30)
				If Month > 12 Then Month = 12
				If ((DayNumber - 186) Mod 30) = 0 Then Month = Month - 1
				Day = (DayNumber - 186) Mod 30
				If Day = 0 Then Day = 30
	End If
	
	Return Year & seprator & Month & seprator & Day
	
End Sub

Public Sub PaddingLabel(lbl As Label,Left As Int,Top As Int,Right As Int,Bottom As Int)

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
	
	If ra.Length = 3 Then
		Return Array As Int(ra(0),ra(1),ra(2))
	Else
		Return Array As Int(DateTime.GetHour(DateTime.Now),DateTime.GetMinute(DateTime.Now),DateTime.GetSecond(DateTime.Now))
	End If
	
End Sub

Public Sub GetDate(date1 As String) As String
 
 	Dim res(),month,perDate() As String
	
	Dim pp() As String
	
	pp = Regex.Split(" ",date1)
	
	Try
		
		If pp(0).IndexOf("-") > -1 Then
			res = Regex.Split("-",pp(0))
		Else
			res = Regex.Split("/",pp(0))
		End If
		
		month = res(1)
		
		perDate = Regex.Split("/",Julian2Persian(res(0),month,res(2),"/"))
		
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
 
Sub LabelSpace(view1 As View,Space As Float)

End Sub

Public Sub DiscountPrice(Price As String,Label1 As Label)
	
	Dim rich As RichString
	rich.Initialize(Price)
	rich.Color(Colors.Red,0,Price.Length)
	rich.Strikethrough(True,0,Price.Length)
	
	rich.SetToLabel(Label1)
	
End Sub

Sub GetFont(FontSize As Int) As Font
		
	If IsPersian Then
		'Return Font.CreateNew2("byekan",FontSize)
		Return Font.CreateNew2("iransans",FontSize)
	Else
		Return Font.DEFAULT
	End If
	
End Sub

Sub IsPersian As Boolean
	
	If setting.GetString("lang").IndexOf("فارسی") > -1 Or setting.GetString("lang").ToLowerCase.IndexOf("persian") > -1 Then
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
	
	If setting.GetString("lang").IndexOf("انگلیسی") > -1 Or setting.GetString("lang").ToLowerCase.IndexOf("english") > -1 Then
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

Sub RegexReplace(Pattern As String, Text As String, Replacement As String) As String
	Return Regex.Replace(Pattern,Text,Replacement)
End Sub

Public Sub MakeDateDialog(Year As String,Month As String,Day As String,P1 As Panel) As String
	
	Dim lblyear,lblmonth,lblday As Label
	lblyear.Initialize("")
	lblmonth.Initialize("")
	lblday.Initialize("")
	
	Dim spyear,spmonth,spday As Picker
	spyear.Initialize("")
	spmonth.Initialize("")
	spday.Initialize("")
	
	P1.AddView(lblyear,0,5,P1.Width,30dip)
	P1.AddView(spyear,0,32dip,P1.Width,30dip)
	P1.AddView(lblmonth,0,spyear.Height + spyear.Top + 4dip,P1.Width,30dip)
	P1.AddView(spmonth,0,spyear.Height + lblmonth.Top+ 4dip,P1.Width,30dip)
	P1.AddView(lblday,0,spyear.Height + spmonth.Top+ 4dip,P1.Width,30dip)
	P1.AddView(spday,0,spyear.Height + lblday.Top+ 4dip,P1.Width,30dip)
	
	lblyear.Text = GetStringResourse("year")
	lblmonth.Text = GetStringResourse("month")
	lblday.Text = GetStringResourse("day")
	lblyear.TextAlignment = GetStringResourse("direction_ios")
	lblmonth.TextAlignment = GetStringResourse("direction_ios")
	lblday.TextAlignment = GetStringResourse("direction_ios")
	lblyear.Font = GetFont(14)
	lblmonth.Font = GetFont(14)
	lblday.Font = GetFont(14)
	
	Dim currday,currmonth,curryear As String
	
	If IsPersian = False Then
		currday = DateTime.GetDayOfMonth(DateTime.Now)
		currmonth = DateTime.GetMonth(DateTime.Now)
		curryear = DateTime.GetYear(DateTime.Now)
	Else
		Dim date1,date2() As String
		date1 = Julian2Persian(DateTime.GetYear(DateTime.Now),DateTime.GetMonth(DateTime.Now),DateTime.GetDayOfMonth(DateTime.Now),"/")
		date2 = Regex.Split("/",date1)
		currday = date2(2)
		currmonth = date2(1)
		curryear = date2(0)
	End If
	
	For i = 1 To 31
		If i < 13 Then
			
			spmonth.SetItems(0,Array(i))

			If i = Month And Month <> 0 Then
				spmonth.SelectRow(0,i-1,True)
			Else If i = currmonth Then
				spmonth.SelectRow(0,i-1,True)
			End If
			
		End If
		
		spday.SetItems(0,Array(i))
		
		If i = Day And Day <> 0 Then
			spday.SelectRow(0,i-1,True)
		Else If i = currday Then
			spday.SelectRow(0,i-1,True)
		End If
		
	Next
	
	Dim sFrom As Int = 1900
	
	If IsPersian Then
		sFrom = 1350
	End If
	
	For j = sFrom To sFrom + 100
		spyear.SetItems(0,Array(j))
	Next
	
	For s = 0 To spyear.GetItems(0).Size - 1
		
		If spyear.GetSelectedRow(s) = Year And Year <> 0 Then
			spyear.SelectRow(0,s,True)
		Else If spyear.GetSelectedRow(s) = curryear Then
			spyear.SelectRow(0,s,True)
		End If
		
	Next
	
	Return $"${spyear.GetSelectedRow(0)}/${spmonth.GetSelectedRow(0)}/${spday.GetSelectedRow(0)}"$
	
End Sub

Sub GetButtonState(Button1 As Button)
	
	Button1.Color = ConvertHex2Int(GetStringResourse("button_active_color"))
	Button1.SetBorder(1,ConvertHex2Int(GetStringResourse("button_active_color")),4)
	Button1.CustomLabel.TextColor = Colors.White
	
End Sub

Sub AddTabbar(page As Page)
	
	Dim item As TabBarItem
	item.Initialize("",LoadBitmap(File.DirAssets,"home.png"),LoadBitmap(File.DirAssets,"home.png"))
	page.TabBarItem = item
End Sub

Sub AddHideKeyboardToView (TextField1 As Object,Container As Panel)
   Dim no As NativeObject = TextField1
   no.SetField("inputAccessoryView",Container)
End Sub