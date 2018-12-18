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
	Private txtpass1 As EditText
	Private txtpass2 As EditText
	Private progress As ShowProgress
	Private toast As MyToastMessageShow
	Private lblheader1 As Label
	Private lblheader2 As Label
	Private lblpass1 As Label
	Private lblpass2 As Label
	Private btnok As Button
	Private btncancel As Button
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmchangepassword")
	txtpass1.Color = Colors.White
	txtpass2.Color = Colors.White
	
	Activity.Color = Library.ThemeColor
	
	Library.setLocalApp
	
	progress.Initialize(Activity)
	toast.Initialize(Activity)
	
	Dim status As StatusBarCompat
	status.Initialize
	status.StatusBarColor = Library.ThemeColor
	
	lblheader1.Text = Library.GetStringResourse("password_title1")
	lblheader2.Text = Library.GetStringResourse("password_title2")
	
	lblpass1.Text = Library.GetStringResourse("password2")
	lblpass1.Gravity = Library.GetStringResourse("direction")
	lblpass2.Text = Library.GetStringResourse("password_confirm")
	lblpass2.Gravity = Library.GetStringResourse("direction")
	
	btncancel.Text = Library.GetStringResourse("back")
	btnok.Text = Library.GetStringResourse("change_password_button")
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub btnok_Click
	
	If txtpass1.Text.Length < 5 Then
		toast.ShowToastMessageShow(Library.GetStringResourse("error_password"),0,False)
		Return	
	End If
	
	If txtpass1.Text <> txtpass2.Text Then
		toast.ShowToastMessageShow(Library.GetStringResourse("no_same_password"),0,False)
		Return	
	End If
	
	progress.ShowProgress(Library.GetStringResourse("chainging_password"))
	
	Dim hu As HttpJob
	hu.Initialize("password",Me)
	hu.Download(Library.URL & "method=change_password&new_password=" & txtpass1.Text)
	
End Sub

Sub JobDone(Job As HttpJob)
	
	progress.HideProgress
	
	If Job.Success Then
		If Job.JobName = "password" Then

			Dim data As Map
			data = Library.Json2Map(Job.GetString)
			
			If data.Get("result") = True Then
				
				Library.ShopAppVersion = ""
				Library.Token = ""
				Library.URL = ""
				
				File.WriteString(File.DirInternal,"code",txtpass1.Text)
				
				actLogin.isChangedPassword = True
				Activity.Finish
				StartActivity(actLogin)
				
			Else
				toast.ShowToastMessageShow(Library.GetStringResourse("error_data"),0,False)
			End If
			
		End If	
	End If
	
End Sub

Sub btncancel_Click
	Activity.Finish
End Sub