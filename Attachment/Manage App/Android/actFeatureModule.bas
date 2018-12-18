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
	Private MenusItems As List
	Private ServerChoosenMenu As String
	Private sv1 As ScrollView
	Private lbltitle As Label
	Private CurrentID As String
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmmenu")
	
	Library.setLocalApp
	
	lblheader.Text = Library.GetStringResourse("choose_module")
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

	progress.ShowProgress(Library.GetStringResourse("during_apply"))

	Dim hu As HttpJob
	hu.Initialize("save_menu",Me)
	hu.Download(Library.URL & "method=save_featuremodule&id=" & CurrentID)
	
End Sub

Sub JobDone(Job As HttpJob)
	
	If 	Job.Success Then
		
		If Job.JobName = "save_menu" Then
			Dim m As Map
			m = Library.Json2Map(Job.GetString)
			If m.Get("result") = True Then
				toast.ShowToastMessageShow(Library.GetStringResourse("choosen_module"),2,True)
			Else
				toast.ShowToastMessageShow(Library.GetStringResourse("error_data"),2,False)
			End If
		
		Else if Job.JobName = "config" Then
			
			Dim m1 As Map
			m1 = Library.Json2Map(Job.GetString)
			
			ServerChoosenMenu = m1.Get("feature_module")
			
			opencart1.GetFeatureModules(Me,"FeatureModule_Receive")
			
			Return
			
		End If
		
	End If
	
	progress.HideProgress
	
End Sub

Sub btncancel_Click
	Activity.Finish
End Sub

Sub FeatureModule_Receive(Data As List)
	
	MenusItems = Data
	
	Dim Top As Int
	
	For i = 0 To MenusItems.Size - 1
		
		Dim p1 As Panel
		p1.Initialize("")
		sv1.Panel.AddView(p1,0,Top,100%x,50dip)
		
		If File.ReadString(File.DirInternal,Library.LanguageFilename) = "fa" Then
			p1.LoadLayout("frmitem_module")
		Else
			p1.LoadLayout("frmitem_module_en")
		End If
	
		Dim lbltitle As Label
		Dim chk1 As RadioButton
		Dim parent As Panel
		Dim product As List
		
		parent = p1
		
		Dim d1 As Map
		d1 = MenusItems.Get(i)
		
		lbltitle	= parent.GetView(1)
		chk1		= parent.GetView(0)
		
		Dim name As String
		name = d1.Get("name")
		name = name.ToLowerCase.Replace("&quot;",QUOTE).Replace("&amp;","&")
		
		product = d1.Get("products")
		
		lbltitle.Text	=  name & " " & Library.GetStringResourse("product_count").Replace("0",product.Size)
		chk1.Tag		= d1.Get("module_id")
		
		If ServerChoosenMenu =  chk1.Tag Then chk1.Checked = True
		
		lbltitle.Tag = chk1
		
		If i = 0 Then
			chk1.Checked = True
			CurrentID = d1.Get("module_id")
		End If
		
		Checks.Add(chk1)
		
		Top = Top + p1.Height
			
	Next
	
	sv1.Panel.Height = Top

	progress.HideProgress
	
End Sub

Sub lbltitle_Click
	
	Dim ls As Label
	ls = Sender
	
	Dim chk As RadioButton
	chk = ls.Tag
	
	For i = 0 To Checks.Size - 1
		
		Dim rb As RadioButton
		rb = Checks.Get(i)
		rb.Checked = False	
	Next
	
	chk.Checked = Not(chk.Checked)
	
End Sub

Sub chk1_CheckedChange(Checked As Boolean)
	
	Dim c As RadioButton
	c = Sender
	
	For i = 0 To Checks.Size - 1
		
		Dim rb As RadioButton
		rb = Checks.Get(i)
		rb.Checked = False	
	Next
	
	c.Checked = Checked
	CurrentID = c.Tag
	
End Sub