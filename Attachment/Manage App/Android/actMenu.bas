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

End Sub

Sub Globals
	Private sv1 As ScrollView
	Private pnlover As Panel
	Private top As Int
	Private lbltitle1 As Label
	Private lbltitle2 As Label
	Private lblversion As Label
	Private pnlabout As Panel
	Private toast As MyToastMessageShow
	Private Progress As ShowProgress
	Private lblicon As Label
	Private lblabout_title As Label
	Private lblabout_subtitle As Label
	Private lblheader1 As Label
	Private lblheader2 As Label
	Private pnlheader As Panel
	Private lblicomoon As Label
	Private pnlversion As Panel
	Private Opencart As OpenCart
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmmeny")
	
	pnlheader.Color = Library.ThemeColor
	lblabout_title.Color = Library.ThemeColor
	
	Dim cd As ColorDrawable
	cd.Initialize(Colors.White,25)
	pnlversion.Background = cd
	lblversion.TextColor = Colors.Black
	
	Library.setLocalApp
	
	Dim status As StatusBarCompat
	status.Initialize
	status.StatusBarColor = Library.ThemeColor
		
	lblversion.Tag = Library.GetStringResourse("current_version")
	lblabout_subtitle.Text = Library.GetStringResourse("about").Replace("\n",CRLF)
	lblabout_title.Text = Library.GetStringResourse("about_title")
	lblabout_subtitle.Gravity = Library.GetStringResourse("direction")
	
	lblheader1.Text = Library.GetStringResourse("header1").Replace("0",Library.ShopTitle)
	lblheader2.Text = Library.GetStringResourse("header2")
	
	toast.Initialize(Activity)
	Progress.Initialize(Activity)
	
	Progress.ShowProgress(Library.GetStringResourse("prepare"))
	
	Opencart.Initialize
	Opencart.GetToken(Me,"Token_Receive")
	
End Sub

Sub Token_Receive(Success As Boolean)
	
	Progress.HideProgress
	
	If Success = False Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_client_id"),2,False)	
	End If
	
End Sub

Sub Activity_Resume
	
	Library.setLocalApp
	
	Dim rs As String
	rs = lblversion.Tag
	lblversion.Text = rs.Replace("0",Library.ShopAppVersion)
	
	sv1.Panel.RemoveAllViews
	top = 0
	
	AddItem(Library.GetStringResourse("menu_push_title") & " [ " & Library.Config.Get("push_count") & " ]",Library.GetStringResourse("menu_push_subtitle"),"1","")
	AddItem(Library.GetStringResourse("menu_statistic_title"),Library.GetStringResourse("menu_statistic_subtitle"),"2","")
	AddItem(Library.GetStringResourse("menu_banner_title"),Library.GetStringResourse("menu_banner_subtitle"),8,"")
	AddItem(Library.GetStringResourse("menu_menu_title"),Library.GetStringResourse("menu_menu_subtitle"),9,"")
	AddItem(Library.GetStringResourse("menu_feature_title"),Library.GetStringResourse("menu_feature_subtitle"),10,"")
	
	If Library.IsActiveShop Then
		AddItem(Library.GetStringResourse("menu_activeshop_title"),Library.GetStringResourse("menu_activeshop_subtitle"),"7","")
	Else
		AddItem(Library.GetStringResourse("menu_disactiveshop_title"),Library.GetStringResourse("menu_disactiveshop_subtitle"),"7","")
	End If
	
	If Library.IsHttps = False Then
		AddItem(Library.GetStringResourse("menu_https_title"),Library.GetStringResourse("menu_https_subtitle"),"https","")
	Else
		AddItem(Library.GetStringResourse("menu_nohttps_title"),Library.GetStringResourse("menu_nohttps_subtitle"),"https","")
	End If
	
	AddItem(Library.GetStringResourse("menu_password_title"),Library.GetStringResourse("menu_password_subtitle"),"4","")
	AddItem(Library.GetStringResourse("menu_download_title"),Library.GetStringResourse("menu_download_subtitle"),"3","")
	AddItem(Library.GetStringResourse("menu_about_title"),Library.GetStringResourse("menu_about_subtitle"),"6","")
	AddItem(Library.GetStringResourse("menu_exit_title"),Library.GetStringResourse("menu_exit_subtitle"),"5","")
	
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub AddItem(Title As String,SubTitle As String,ID As String,Icon As String)
	
	Dim p As Panel
	p.Initialize("")
	sv1.Panel.AddView(p,0,top,100%x,0)
	
	If File.ReadString(File.DirInternal,Library.LanguageFilename) = "fa" Then
		p.LoadLayout("frmitem")
	Else
		p.LoadLayout("frmitem_en")
	End If
	
	lblicomoon.TextColor = Library.ThemeColor
	lblicon.TextColor = Library.ThemeColor
	
	p.Height = pnlover.Height+1dip
	top = top + p.Height
	
	lbltitle1.Text = Title
	lbltitle2.Text = SubTitle
	pnlover.Tag = ID
	lblicon.Text = Icon
	
	sv1.Panel.Height = top
	
	p.Left = -p.Width
	p.SetLayoutAnimated(1000,0,p.Top,p.Width,p.Height)
	DoEvents
	
End Sub

Sub pnlover_Click
	
	Dim pn As Panel
	pn = Sender
	
	pn.SetColorAnimated(700,Colors.White,Colors.Transparent)
	
	Dim id As String
	id = pn.Tag
	
	Select id
		Case "1"
			StartActivity(actSendPush)
		
		Case "https"
			If Msgbox2(Library.GetStringResourse("change_state_https"),Library.GetStringResourse("alert"),Library.GetStringResourse("yes"),Library.GetStringResourse("no"),"",Null) = DialogResponse.POSITIVE Then
				Progress.ShowProgress(Library.GetStringResourse("during_apply"))
				Dim hu As HttpJob
				hu.Initialize("change_state_https",Me)
				hu.Download(Library.URL & "method=change_state_https")
			End If
			
		Case "2"
			StartActivity(actStatistic)
		
		Case "3"
			
			If Library.InternetState = False Then
				toast.ShowToastMessageShow(Library.GetStringResourse("no_internet"),2,False)
				Return
			End If
		
			Progress.ShowProgress(Library.GetStringResourse("downloading"))
			
			Dim Jo As HttpJob
			Jo.Initialize("download",Me)
			Jo.Download(Library.BaseURL & "app/updater/app.apk")
			
		Case "4"
			StartActivity(actPassword)
		
		Case "5"
			Library.Token = ""
			Library.ShopAppVersion = ""
			Library.URL = ""
			Activity.Finish
			StartActivity(Main)
		
		Case "6"
			pnlabout.SetLayoutAnimated(1100,pnlabout.Left,pnlabout.Top - pnlabout.Height,pnlabout.Width,pnlabout.Height)
		
		Case "7"
			If Msgbox2(Library.GetStringResourse("change_state_shop"),Library.GetStringResourse("alert"),Library.GetStringResourse("yes"),Library.GetStringResourse("no"),"",Null) = DialogResponse.POSITIVE Then
				Progress.ShowProgress(Library.GetStringResourse("during_apply"))
				Dim hu As HttpJob
				hu.Initialize("change_state",Me)
				hu.Download(Library.URL & "method=change_state")
			End If
		
		Case "8"
			If Library.Token.Length = 0 Then
				toast.ShowToastMessageShow(Library.GetStringResourse("error_client_id"),2,False)
				Return
			End If
			StartActivity(actBanners)
		
		Case "9"
			If Library.Token.Length = 0 Then
				toast.ShowToastMessageShow(Library.GetStringResourse("error_client_id"),2,False)
				Return
			End If
			StartActivity(actMenus)

		Case "10"
			If Library.Token.Length = 0 Then
				toast.ShowToastMessageShow(Library.GetStringResourse("error_client_id"),2,False)
				Return
			End If
			StartActivity(actFeatureModule)
							
	End Select
	
End Sub

Sub lblexitabout_Click
	pnlabout.SetLayoutAnimated(1100,pnlabout.Left,pnlabout.Top + pnlabout.Height,pnlabout.Width,pnlabout.Height)
End Sub

Sub JobDone(Job As HttpJob)
	
	Progress.HideProgress
	
	If Job.Success Then
		
		If Job.JobName = "download" Then
			Dim ou As OutputStream
			ou = File.OpenOutput(File.DirRootExternal,"app.apk",False)
			File.Copy2(Job.GetInputStream,ou)
			ou.Close
			Library.InstallApp(File.DirRootExternal,"app.apk")
		
		Else if Job.JobName = "change_state" Then
			Dim data As Map
			data = Library.Json2Map(Job.GetString)
			
			If data.Get("state") = False Then
				Library.IsActiveShop = False
				Activity_Resume
				toast.ShowToastMessageShow(Library.GetStringResourse("shop_is_disactive"),2,True)
				
			Else if data.Get("state") = True Then
				Library.IsActiveShop = True
				Activity_Resume
				toast.ShowToastMessageShow(Library.GetStringResourse("shop_is_active"),2,True)
			End If
		
		Else if Job.JobName = "change_state_https" Then
			
			Dim data As Map
			data = Library.Json2Map(Job.GetString)
			
			If data.Get("https") = False Then
				Library.IsHttps = False
				Activity_Resume
				toast.ShowToastMessageShow(Library.GetStringResourse("shop_is_http"),2,True)
				
			Else if data.Get("https") = True Then
				Library.IsActiveShop = True
				Activity_Resume
				toast.ShowToastMessageShow(Library.GetStringResourse("shop_is_https"),2,True)
			End If
			
		End If
		
	End If
	
End Sub