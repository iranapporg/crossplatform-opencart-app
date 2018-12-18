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
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	Private lblheader1 As Label
	Private btnok As Button
	Private btncancel As Button
	Private progress As ShowProgress
	Private toast As MyToastMessageShow
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmnewversion")
	lblheader1.Text = lblheader1.Text.Replace("0",Library.ShopAppVersion)
	
	progress.Initialize(Activity)
	toast.Initialize(Activity)
	
	Dim status As StatusBarCompat
	status.Initialize
	status.StatusBarColor = Colors.RGB(41,150,221)
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub btnok_Click
	
	progress.ShowProgress("در حال ارتقا...")
	
	Dim hu As HttpJob
	hu.Initialize("new_version",Me)
	hu.Download(Library.URL & "method=set_version_app")
	
End Sub

Sub JobDone(Job As HttpJob)
	
	progress.HideProgress
	
	If Job.Success Then
		If Job.JobName = "new_version" Then

			Dim data As Map
			data = Library.Json2Map(Job.GetString)
			If data.Get("result") = True Then
				toast.ShowToastMessageShow("اپ موبایل با موفقیت ارتقاط داده شد",0,True)
				lblheader1.Text = lblheader1.Text.Replace(Library.ShopAppVersion,data.Get("version"))
				Library.ShopAppVersion = data.Get("version")
			Else
				toast.ShowToastMessageShow("متاسفانه ارتقا با شکست مواجه شد",0,False)
			End If
			
		End If	
	End If
	
End Sub

Sub btncancel_Click
	Activity.Finish	
End Sub