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
	Public sLog As String
	Public ForceUpdate As Boolean
End Sub

Sub Globals
	Private lbltitle As Label
	Private pnlheader As Panel
	Private lblpb As Label
	Private pnlloading As Panel
	Private btnupdate As Button
	Private lbldesc As Label
	Private btnlog As Button
	Private lbllog As Label
	Private btncancel As Button
	Private pnllog As Panel
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmupdate")
	
	Library.ChangeStatusColor
	
	lbltitle.Text = Library.GetStringResourse("update")
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	
	If ForceUpdate = True Then
		lbldesc.Text = Library.GetStringResourse("force_update") & CRLF
	End If
	
	lbldesc.Text = lbldesc.Text & Library.GetStringResourse("update_text").Replace("\n",CRLF)
	
	btnupdate.Background = Library.GetButtonState
	btnlog.Background = Library.GetButtonState
	btncancel.Background = Library.GetButtonState
	
	btnlog.Text = Library.GetStringResourse("changelog")
	btnupdate.Text = Library.GetStringResourse("update")
	btncancel.Text = Library.GetStringResourse("back")
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Activity.Finish
	If ForceUpdate = False Then StartActivity(Main)
End Sub

Sub btnclose_Up
	Activity.Finish
	If ForceUpdate = False Then StartActivity(Main)
End Sub

Sub btnupdate_Click
	
	If Library.InternetState = False Then
		StartActivity(actErrorIntrenet)
		Return
	End If
	
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim hu As HttpJob
	hu.Initialize("download_app",Me)
	hu.Download(Library.GetStringResourse("url") & "/app/updater/app.apk")
	
End Sub

Sub JobDone(Job As HttpJob)
	
	If Job.Success Then
		
		If Job.JobName = "download_app" Then
			Dim ou As OutputStream
			ou = File.OpenOutput(File.DirRootExternal,"app.apk",False)
			File.Copy2(Job.GetInputStream,ou)
			ou.Close
			ToastMessageShow(Library.GetStringResourse("success_update"),True)
			InstallApp(File.DirRootExternal,"app.apk")
			ExitApplication
		End If
	
	Else
		ToastMessageShow(Library.GetStringResourse("error_net_title"),False)
	End If
	
	Job.Release
	
End Sub

Sub InstallApp(sDir As String,sFilename As String)
	Dim Uri As String
	Dim i2 As Intent
	Uri = "file://" & File.Combine(sDir, sFilename)
	i2.Initialize(i2.ACTION_VIEW, Uri)
	i2.SetType("application/vnd.android.package-archive")
	StartActivity(i2)
End Sub

Sub btnlog_Click
	lbllog.Text = sLog
	Library.LabelSpace(lbllog,2)
	pnllog.SetVisibleAnimated(600,True)
End Sub

Sub btncancel_Click
	pnllog.SetVisibleAnimated(600,False)
End Sub