Type=StaticCode
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	Public Token,ShopAppVersion,URL,BaseURL As String
	Public IsActiveShop,IsHttps As Boolean
	Public Manager As PreferenceManager
	Public LanguageFilename As String : LanguageFilename = "langug"
	Public Token,ClientID As String
	Public Config As Map
	Public Sign As CheckSignature
	Public ThemeColor As Int
	Public ShopTitle As String
End Sub

Sub InstallApp(sDir As String,sFilename As String)
	Dim Uri As String
	Dim i2 As Intent
	Uri = "file://" & File.Combine(sDir, sFilename)
	i2.Initialize(i2.ACTION_VIEW, Uri)
	i2.SetType("application/vnd.android.package-archive")
	StartActivity(i2)
End Sub

Sub InternetState As Boolean 

	Dim mylan As ServerSocket
	mylan.Initialize(0,"")
	
	Dim ip As String
	ip = mylan.GetMyIP
	
	If ip = "127.0.0.1" Then  
		Return False
	Else
		Return True
	End If
	
End Sub

Sub Json2Map(data As String) As Map
	
	If data = "null" Then Return Null
	
	Dim js As JSONParser
	js.Initialize(data)
	Return js.NextObject
	
End Sub

Sub EditTextIcon(EditTxt As EditText,Icon As String)
    Dim ar As AndroidResources
    Dim ETxt As JavaObject = EditTxt
    ETxt.RunMethod("setCompoundDrawablesWithIntrinsicBounds",Array As Object(ar.GetAndroidDrawable(Icon),Null,Null,Null))
End Sub

Sub GetStringResourse(Key As String) As String
	
	Try
		Dim s As String
		Dim ar As AndroidResources
		s = ar.GetApplicationString(Key)
		If s = Null Then Return ""
		Return s
	Catch
		Return ""
	End Try
	
End Sub

Sub setLocalApp
	
	Dim loc As Locale
	Dim res As Resources
	
	If File.GetText(File.DirInternal,LanguageFilename) = "fa" Then
		loc.Initialize("fa")
	Else
		loc.Initialize("en")
	End If
	
	res.SetDefaultLocale(loc)
	res.Initialize(res.RESOURCE_SOURCE_APPLICATION)
	
End Sub

Sub LabelSpace(view1 As View,Space As Float)
	Dim Obj1 As Reflector
	Obj1.Target = view1
	Obj1.RunMethod3("setLineSpacing", Space, "java.lang.float", Space, "java.lang.float")
End Sub

Sub GetDevicePhysicalSize As Float
    Dim lv As LayoutValues
    lv = GetDeviceLayoutValues
    Return Sqrt(Power(lv.Height / lv.Scale / 160, 2) + Power(lv.Width / lv.Scale / 160, 2))
End Sub

Sub ConvertHex2Int(Color As String) As String
	
    Dim R,G,b As Int
	Dim hex As String
	hex = Color
	
    R = Bit.ParseInt(hex.SubString2(1,3), 16)
    G = Bit.ParseInt(hex.SubString2(3,5), 16)
    b = Bit.ParseInt(hex.SubString2(5,7), 16)
	
    Return Colors.RGB(R, G, b)
	
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

Sub BoldString(Str As String,Label As Label)
	
	Dim ri As RichString
	ri.Initialize(Str)
	ri.Style2(ri.STYLE_BOLD,"{b}")
	Label.Text = ri
	
End Sub

Sub Notify(Title As String,Body As String,sType As String,Data As String)
	
	Dim sT As NotificationBigTextStyle
	sT.Initialize
	sT.BigContentTitle = "توجه"
	sT.BigText = Body
	sT.SummaryText = "پیام جدید از مدیریت اپن کارت"
	
	If File.Exists(File.DirRootExternal,"notification.mp3") = False Then
		File.Copy(File.DirAssets,"notification.mp3",File.DirRootExternal,"notification.mp3")
	End If
	
	Dim nb As NotificationBuilder
	nb.Initialize
	nb.AutoCancel = True
	nb.DefaultLight = True
	nb.DefaultSound = True
	nb.DefaultVibrate = True
	nb.SmallIcon = "icon"
	nb.CustomSound = File.Combine(File.DirRootExternal,"notification.mp3")
	nb.Tag = "New message"
	
	If sType = "link" Then
		Dim int1 As Intent
		int1.Initialize(int1.ACTION_VIEW,Data)
		nb.setIntent(int1)
	
	Else if sType = "update" Then
		nb.setActivity(Main)
	Else
		
	End If
	
	nb.SetStyle(sT)
	nb.Notify(1)
	
End Sub