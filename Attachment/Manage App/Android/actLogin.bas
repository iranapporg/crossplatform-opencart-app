Type=Activity
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	Public isChangedPassword As Boolean
End Sub

Sub Globals
	Private txtusername As EditText
	Private txtpassword As EditText
	Private progress As ShowProgress
	Private toast As MyToastMessageShow
	Private lblheader1 As Label
	Private lblheader2 As Label
	Private btnlogin As Button
	Private pnllog As Panel
	Private lbllog As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Dim p As Phone
	If p.SdkVersion >=21 Then
		Dim status As StatusBarCompat
		status.Initialize
		status.StatusBarColor = Colors.RGB(33,33,33)
	End If
	
	Library.setLocalApp
	
	Activity.LoadLayout("frmlogin")
	txtpassword.Color = Colors.White
	txtusername.Color = Colors.White
	
	progress.Initialize(Activity)
	toast.Initialize(Activity)
	
	lblheader1.Text = Library.GetStringResourse("title1")
	lblheader2.Text = Library.GetStringResourse("title2")
	
	txtusername.Hint = Library.GetStringResourse("username")
	txtpassword.Hint = Library.GetStringResourse("password")
	
	btnlogin.Text = Library.GetStringResourse("login")
	
	lblheader1.TextColor = Colors.RGB(41,150,221)
	lblheader2.TextColor = Colors.RGB(41,150,221)
	
	lblheader1.SetTextColorAnimated(3000,Colors.White)
	lblheader2.SetTextColorAnimated(3000,Colors.rgb(218,217,217))
	
	Library.EditTextIcon(txtusername,"ic_menu_cc")
	Library.EditTextIcon(txtpassword,"ic_menu_login")
	
	If File.Exists(File.DirInternal,"code") Then
		txtpassword.Text = File.ReadString(File.DirInternal,"code")
	End If
	
	If File.Exists(File.DirInternal,"user") Then
		txtusername.Text = File.ReadString(File.DirInternal,"user")
	End If
	
	If isChangedPassword = True Then
		toast.ShowToastMessageShow(Library.GetStringResourse("changed_password"),0,True)
		isChangedPassword = False
	End If
	
	If File.Exists(File.DirInternal,"log") Then
		lbllog.Text = Library.GetStringResourse("changelog") & CRLF & CRLF & CRLF & File.ReadString(File.DirInternal,"log")
		File.Delete(File.DirInternal,"log")
		pnllog.Visible = True
		pnllog.Left = -pnllog.Width
		pnllog.SetLayoutAnimated(650,0,0,pnllog.Width,pnllog.Height)
	End If
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Activity.Finish
End Sub

Sub btnlogin_Click
	
	If Library.InternetState = False Then
		toast.ShowToastMessageShow(Library.GetStringResourse("no_internet"),0,False)
		Return
	End If
	
	If txtusername.Text = "demo" Then txtusername.Text = "api.kharidaram.com"
	
	If Regex.IsMatch("^(http|https)://[\w-]+\.\S+$",txtusername.Text) = False Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_username"),0,False)
		Return
	End If
	
	If txtpassword.Text.Length < 5 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_password"),0,False)
		Return
	End If
	
	progress.ShowProgress(Library.GetStringResourse("during_login"))
	
	Dim ht As HttpJob
	ht.Initialize("login",Me)
	ht.Download($"${txtusername.Text}/app/ws.php?username=${txtusername.Text}&password=${txtpassword.Text}&method=login"$)
	
End Sub

Sub JobDone(Job As HttpJob)
	
	If Job.Success Then
		If Job.JobName = "login" Then
			Dim res As Map
			res = Library.Json2Map(Job.GetString)
			If res.Get("result") = False Or res.Get("result") = "-1" Then
				toast.ShowToastMessageShow(Library.GetStringResourse("error_up"),0,False)
			Else
				
				If res.Get("config") = False Then
					toast.ShowToastMessageShow(Library.GetStringResourse("error_config"),2,False)
					Return	
				End If
				
				Library.Token			= res.Get("token")
				Library.ShopAppVersion	= res.Get("version")
				Library.URL				= $"${txtusername.Text}/app/ws.php?username=${txtusername.Text}&password=${txtpassword.Text}&token=${Library.Token}&"$
				Library.BaseURL			= $"${txtusername.Text}/"$
				Library.ClientID		= res.Get("client_id")
				Library.Config			= Library.Json2Map(res.Get("config"))
				Library.IsActiveShop	= Library.Config.Get("shop_state")
				If Library.Config.ContainsKey("https") Then
					Library.IsHttps			= Library.Config.Get("https")
				Else
					Library.IsHttps			= False
				End If
				Library.ThemeColor		= Library.ConvertHex2Int(Library.Config.Get("color"))
				Library.ShopTitle		= Library.Config.Get("title")
				Library.Config.Put("push_count",res.Get("push_count"))
				
				File.WriteString(File.DirInternal,"code",txtpassword.Text)
				File.WriteString(File.DirInternal,"user",txtusername.Text)
				
'				Activity.Finish
				StartActivity(actMenu)
				
			End If
		End If
	Else
		If Job.ErrorMessage.IndexOf("java.net.UnknownHostException") > -1 Then
			toast.ShowToastMessageShow(Library.GetStringResourse("no_domain"),0,False)
		End If
	End If
	
	progress.HideProgress
	
End Sub

Sub txtusername_EnterPressed
	txtpassword.RequestFocus
End Sub

Sub txtpassword_EnterPressed
	btnlogin_Click
End Sub

Sub lbllog_Click
	pnllog.SetLayoutAnimated(800,-pnllog.Width,0,pnllog.Width,pnllog.Height)
End Sub

Sub pnllog_Click
	pnllog.SetLayoutAnimated(800,-pnllog.Width,0,pnllog.Width,pnllog.Height)
End Sub