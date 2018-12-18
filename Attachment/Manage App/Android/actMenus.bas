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
	Private lblheader As Label
	Private btnsend As Button
	Private btncancel As Button
	Private progress As ShowProgress
	Dim opencart1 As OpenCart
	Private toast As MyToastMessageShow
	Private Checks As List
	Private ServerChoosenMenu,MenusItems As List
	Private sv1 As ScrollView
	Private lbltitle As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmmenu")
	
	Library.setLocalApp
	
	lblheader.Text = Library.GetStringResourse("choose_menu")
	btncancel.Text = Library.GetStringResourse("back")
	btnsend.Text = Library.GetStringResourse("apply")
	
	Dim status As StatusBarCompat
	status.Initialize
	status.StatusBarColor = Library.ThemeColor
	
	Activity.Color = Library.ThemeColor
	sv1.Color = Colors.Transparent
	sv1.Panel.Color = Colors.Transparent
	
	MenusItems.Initialize
	Checks.Initialize
	ServerChoosenMenu.Initialize
	opencart1.Initialize
	
	progress.Initialize(Activity)
	toast.Initialize(Activity)
	progress.ShowProgress(Library.GetStringResourse("downloading"))
	
	Dim hu As HttpJob
	hu.Initialize("config",Me)
	hu.Download(Library.BaseURL & "app/config")
	hu.GetRequest.SetHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0")
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub btnsend_Click
	
	Dim id As List
	id.Initialize
	
	For i = 0 To Checks.Size - 1
		
		Dim ch As CheckBox
		ch = Checks.Get(i)
	
		If ch.Checked = True Then	id.Add(ch.Tag)
		
	Next

	progress.ShowProgress(Library.GetStringResourse("during_apply"))
	
	Dim js As JSONGenerator
	js.Initialize2(id)
	
	Dim su As StringUtils
	
	Dim hu As HttpJob
	hu.Initialize("save_menu",Me)
	hu.Download(Library.URL & "method=save_menus&id=" & su.EncodeUrl(js.ToString,"UTF8"))
	
End Sub

Sub JobDone(Job As HttpJob)
	
	If 	Job.Success Then
		
		If Job.JobName = "save_menu" Then
			Dim m As Map
			m = Library.Json2Map(Job.GetString)
			If m.Get("result") = True Then
				toast.ShowToastMessageShow(Library.GetStringResourse("choosen_menu"),2,True)
			Else
				toast.ShowToastMessageShow(Library.GetStringResourse("error_data"),2,False)
			End If
		
		Else if Job.JobName = "config" Then
			
			Dim m1 As Map
			m1 = Library.Json2Map(Job.GetString)
			
			ServerChoosenMenu = m1.Get("menus")
			
			opencart1.GetInformation(Me,"Menus_Receive")
			
			Return
			
		End If
		
	End If
	
	progress.HideProgress
	
End Sub

Sub btncancel_Click
	Activity.Finish
End Sub

Sub Menus_Receive(Data As List)
	
	MenusItems = Data
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_basket"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_category"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_search"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_bookmark"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_compare"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_login"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_register"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_latest"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_feature"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_best"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_contact"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_about"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_update"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_information"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("title",Library.GetStringResourse("app_menu_share"))
	MenusItems.InsertAt(MenusItems.Size,predefine)
	
	Dim Top As Int
	
	For i = 0 To MenusItems.Size - 1
		
		Dim p1 As Panel
		p1.Initialize("")
		sv1.Panel.AddView(p1,0,Top,100%x,50dip)
		
		If File.ReadString(File.DirInternal,Library.LanguageFilename) = "fa" Then
			p1.LoadLayout("frmitem_banners")
		Else
			p1.LoadLayout("frmitem_banners_en")
		End If
	
		Dim lbltitle As Label
		Dim chk1 As CheckBox
		Dim parent As Panel
		parent = p1
		
		Dim d1 As Map
		d1 = MenusItems.Get(i)
		
		lbltitle	= parent.GetView(1)
		chk1		= parent.GetView(0)
		
		Dim name As String
		name = d1.Get("title")
		name = name.ToLowerCase.Replace("&quot;",QUOTE).Replace("&amp;","&")
		
		If name.IndexOf(":") > -1 Then
			Dim res() As String
			res = Regex.Split(":",name)
			lbltitle.Text	=  Capitalize(res(0))
			lbltitle.TextColor = Colors.Yellow
			chk1.Tag		= res(1)
		Else
			lbltitle.Text	= Capitalize(name)
			chk1.Tag		= name
		End If
		
		If ExistKey(chk1.Tag) Then chk1.Checked = True
		
		lbltitle.Tag = chk1
		
		Checks.Add(chk1)
		
		Top = Top + p1.Height
			
	Next
	
	sv1.Panel.Height = Top

	progress.HideProgress
	
End Sub

Sub Capitalize(t As String) As String
    Dim s,r  As String
    s = t.SubString2(0,1)
    r = t.SubString2(1, t.Length)
    Return s.ToUpperCase & r
End Sub

Sub ExistKey(ID As String) As Boolean
	
	For i = 0 To ServerChoosenMenu.Size - 1
		Dim temp As String
		temp = ServerChoosenMenu.Get(i)
		temp.ToLowerCase
		If temp = ID Then Return True		
	Next
	
	Return False
	
End Sub

Sub lbltitle_Click
	
	Dim ls As Label
	ls = Sender
	
	Dim chk As CheckBox
	chk = ls.Tag
	chk.Checked = Not(chk.Checked)
	
End Sub