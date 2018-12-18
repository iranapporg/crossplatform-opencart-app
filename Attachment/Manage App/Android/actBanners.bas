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
	Private ServerChoosenBanner,BannersItems As List
	Private sv1 As ScrollView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmbanners")
	
	Library.setLocalApp
	
	lblheader.Text = Library.GetStringResourse("choose_banner")
	btncancel.Text = Library.GetStringResourse("back")
	btnsend.Text = Library.GetStringResourse("apply")
	
	Dim status As StatusBarCompat
	status.Initialize
	status.StatusBarColor = Library.ThemeColor
	
	sv1.Color = Colors.Transparent
	sv1.Panel.Color = Colors.Transparent
	Activity.Color = Library.ThemeColor
	
	BannersItems.Initialize
	Checks.Initialize
	ServerChoosenBanner.Initialize
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
	hu.Initialize("save_banner",Me)
	hu.Download(Library.URL & "method=save_banner&id=" & su.EncodeUrl(js.ToString,"UTF8"))
	
End Sub

Sub JobDone(Job As HttpJob)
	
	progress.HideProgress
	
	If 	Job.Success Then
		
		If Job.JobName = "save_banner" Then
			Dim m As Map
			m = Library.Json2Map(Job.GetString)
			If m.Get("result") = True Then
				toast.ShowToastMessageShow(Library.GetStringResourse("choosen_banner"),2,True)
			Else
				toast.ShowToastMessageShow(Library.GetStringResourse("error_data"),2,False)
			End If
		
		Else if Job.JobName = "config" Then
			
			Dim m1 As Map
			m1 = Library.Json2Map(Job.GetString)
			
			ServerChoosenBanner = m1.Get("banner")
			
			opencart1.GetBanners(Me,"Banners_Receive","")
			
		End If
		
	End If
	
End Sub

Sub btncancel_Click
	Activity.Finish
End Sub

Sub Banners_Receive(Data As List)
	
	Dim predefine As Map
	predefine.Initialize
	predefine.Put("name",Library.GetStringResourse("manufacture_base"))
	predefine.Put("banner_id","manufacture")
	Data.Add(predefine)
	
	Dim Top As Int
	
	For i = 0 To Data.Size - 1
		
		Dim p1 As Panel
		p1.Initialize("")
		sv1.Panel.AddView(p1,0,Top,100%x,50dip)
		
		If File.ReadString(File.DirInternal,Library.LanguageFilename) = "fa" Then
			p1.LoadLayout("frmitem_banners")
		Else
			p1.LoadLayout("frmitem_banners_en")
		End If
	
		Dim d1 As Map
		d1 = Data.Get(i)
		
		Dim lbltitle As Label
		Dim chk1 As CheckBox
		
		lbltitle	= p1.GetView(1)
		chk1		= p1.GetView(0)
		
		lbltitle.Text = d1.Get("name")
		chk1.Tag = d1.Get("banner_id")
		
		If ExistKey(d1.Get("banner_id")) Then chk1.Checked = True
		
		lbltitle.Tag = chk1
		
		Checks.Add(chk1)
		
		Top = Top + p1.Height
		
	Next
	
	sv1.Panel.Height = Top
	progress.HideProgress
	
End Sub

Sub ExistKey(ID As String) As Boolean
	
	For i = 0 To ServerChoosenBanner.Size - 1
		Dim temp As String
		temp = ServerChoosenBanner.Get(i)
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