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
	Private btnclose As Button
	Private btndefault As Button
	Private btnsave As Button
	Private chkcache As CheckBox
	Private chknewsletter As CheckBox
	Private ImageView1 As ImageView
	Private ImageView2 As ImageView
	Private lblcurr As Label
	Private lbllang As Label
	Private lbltitle As Label
	Private Panel1 As Panel
	Private Panel2 As Panel
	Private Panel3 As Panel
	Private Panel4 As Panel
	Private pnlheader As Panel
	Private rben As RadioButton
	Private rbfa As RadioButton
	Private spcurr As Spinner
	Private defaultLanguage,defaultCurrency,chooseLang As String
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.ChangeStatusColor
	
	Activity.LoadLayout("frmsetting")
	
	lbltitle.Text = Library.GetStringResourse("setting_title")
	lblcurr.Text = Library.GetStringResourse("setting_currency_summary")
	lbllang.Text = Library.GetStringResourse("language_summary")
	chkcache.Text = Library.GetStringResourse("cache_image_title")
	chknewsletter.Text = Library.GetStringResourse("push_subscribe")
	btnsave.Text = Library.GetStringResourse("setting_save")
	btndefault.Text = Library.GetStringResourse("setting_default")
	
	lblcurr.Gravity = Library.GetStringResourse("direction")
	lbllang.Gravity = Library.GetStringResourse("direction")
	chkcache.Gravity = Library.GetStringResourse("direction")
	chknewsletter.Gravity = Library.GetStringResourse("direction")
	
	spcurr.DropdownBackgroundColor = Colors.White
	spcurr.DropdownTextColor = Colors.Black
	
	pnlheader.Color = Library.Theme_Header
	
	btnsave.Background = Library.GetButtonState
	btndefault.Background = Library.GetButtonState
	
	defaultLanguage = Library.manager.GetString("lang")
	defaultCurrency = Library.manager.GetString("curr")
	
	chkcache.Checked = Library.manager.GetBoolean("cache")
	chknewsletter.Checked = Library.manager.GetBoolean("push")
	
	If defaultLanguage = "فارسی" Then
		chooseLang = "فارسی"
		rbfa.Checked = True
	Else
		chooseLang = "english"
		rben.Checked = True
	End If
	
	#region Get Currency List
	Dim ls,listCurr As List
	
	ls = Library.CacheSystem.GetCacheAsList("currencies","currencies")
	listCurr.Initialize
	
	If ls.IsInitialized Then
		For i = 0 To ls.Size - 1
			Dim m2 As Map
			m2 = ls.Get(i)
			spcurr.Add(m2.Get("title"))
			If defaultCurrency = m2.Get("title") Then spcurr.SelectedIndex = i
		Next
	End If
	#end region
	
'	#region Get Languages
'	Dim ls1,listLang As List
'	Dim temp1 As String
'	
'	temp1 = File.ReadString(CacheData.DirCache,"language")
'	
'	ls1 = Library.String2List(temp1)
'	listLang.Initialize
'	
'	If ls1.IsInitialized Then
'		For i1 = 0 To ls1.Size - 1
'			Dim m21 As Map
'			m21 = ls1.Get(i1)
'			listLang.Add(m21.Get("name"))
'		Next
'	End If
'	#end region
	
	#IF com_apps_skharid OR com_apps_ebaghcom
		rben.Visible = False
		ImageView1.Visible = False
	#End If

End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	
	If UserClosed Then
		Activity.Finish
	End If
	
	Library.AnimationFromLeft2Right
	
End Sub

Sub btnsave_Click
	
	Library.manager.SetBoolean("cache",chkcache.Checked)
	Library.manager.SetBoolean("push",chknewsletter.Checked)
	Library.manager.SetString("curr",spcurr.SelectedItem)
	Library.manager.SetString("lang",chooseLang)
	
	ToastMessageShow(Library.GetStringResourse("setting_saved"),False)
	
	If chooseLang <> defaultLanguage Or spcurr.SelectedItem <> defaultCurrency Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_title"),False)
			Return
		End If
		
		CallSubDelayed(actMenu,"ApplySettingChanges")
		Activity.Finish
		
	End If
	
End Sub

Sub btndefault_Click
	
	Library.manager.SetBoolean("cache",False)
	Library.manager.SetBoolean("push",True)
	Library.manager.SetString("curr","USD")
	Library.manager.SetString("lang","english")
		
	CallSubDelayed(actMenu,"ApplySettingChanges")
	Activity.Finish

End Sub

Sub rben_CheckedChange(Checked As Boolean)
	chooseLang = "english"
End Sub

Sub rbfa_CheckedChange(Checked As Boolean)
	chooseLang = "فارسی"
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub