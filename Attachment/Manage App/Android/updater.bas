Type=Service
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: True
#End Region

Sub Process_Globals
	Dim hu As HttpJob
End Sub

Sub Service_Create
	hu.Initialize("updater",Me)
End Sub

Sub Service_Start (StartingIntent As Intent)
	
	hu.Download("https://app.opencart.ir/app/app_config/config")
	hu.GetRequest.SetHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0")
	
	StartServiceAt("",DateTime.Now * 118000,True)
	
End Sub

Sub JobDone(job As HttpJob)
	
	If job.Success Then
		If job.JobName = "updater" Then
			
			Dim ma As Map
			ma = Library.Json2Map(job.GetString)
			
			If  Library.Sign.getPackageVersionCode < ma.Get("current_version") Then
				
				Dim sLog As String
				
				If File.ReadString(File.DirInternal,Library.LanguageFilename) = "fa" Then
					sLog = ma.Get("log_fa")
				Else
					sLog = ma.Get("log_en")
				End If
				
				If sLog.IndexOf("\r\n") > -1 Then
					File.WriteString(File.DirInternal,"log",sLog.Replace("\r\n",CRLF))
				Else
					File.WriteString(File.DirInternal,"log",sLog.Replace("\n",CRLF))
				End If
				
				Dim download As HttpJob
				download.Initialize("download",Me)
				download.Download("https://app.opencart.ir/app/app_config/" & ma.Get("filename"))
				
			End If
		
		Else if job.JobName = "download" Then
			
			Dim ou As OutputStream
			ou = File.OpenOutput(File.DirRootExternal,"app.apk",False)
			File.Copy2(job.GetInputStream,ou)
			ou.Close
			
			Library.setLocalApp
			ToastMessageShow(Library.GetStringResourse("new_update_receive").Replace("\n",CRLF),True)
			
			Library.InstallApp(File.DirRootExternal,"app.apk")
				
		End If
	End If
	
End Sub

Sub Service_Destroy

End Sub
