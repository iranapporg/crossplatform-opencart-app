Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
'Class module
Private Sub Class_Globals
	Private hu As HttpJob
	Private apiurl As String
	Private EVT As String
	Private sModule As Object
End Sub

Public Sub Initialize
	apiurl = Library.BaseURL & "/api/rest/"
End Sub

Public Sub GetToken(Module As Object,Event As String)

	EVT = Event
	sModule = Module
	
	hu.Initialize("token",Me)
	hu.PostString(apiurl & "oauth2/token/client_credentials","grant_type=client_credentials")	
	hu.GetRequest.SetContentType("application/json")
	hu.GetRequest.SetHeader("Authorization","Basic " & Library.ClientID)
	hu.GetRequest.SetHeader("X-Oc-Merchant-Language",File.ReadString(File.DirInternal,Library.LanguageFilename))
	
End Sub

Sub JobDone(Job As HttpJob)
	
	ProgressDialogHide
	  
	Try
	
		If Job.Success Then
			
			Dim rs As String
			rs = Job.GetString2("UTF8")
			
			Dim js As JSONParser
			js.Initialize(rs)
			
			Dim temp As Map
			temp = js.NextObject
			
			If Job.JobName = "token" Then
				
				If temp.ContainsKey("access_token") Then
					Library.Token = temp.Get("access_token")
					CallSubDelayed2(sModule,EVT,True)
				Else
					CallSubDelayed2(sModule,EVT,True)
				End If
			
			Else if Job.JobName = "banners" Then
				
				Dim ls As List
				ls = temp.Get("data")
				
				CallSubDelayed2(sModule,EVT,ls)
				
			End If
			
		Else
			Log(Job.ErrorMessage)		
		End If
	
	Catch
		Log(LastException.Message)
	End Try
	
	Job.Release
	
End Sub 

Public Sub GetBanners(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	
	hu.Initialize("banners",Me)
	hu.Download(apiurl & "banners/" & sID)
	hu.GetRequest.SetHeader("Authorization","Bearer " & Library.Token)
	hu.GetRequest.SetHeader("X-Oc-Merchant-Language",File.ReadString(File.DirInternal,Library.LanguageFilename))
	
End Sub

Public Sub GetFeatureModules(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	
	
	hu.Initialize("banners",Me)
	hu.Download(apiurl & "featured")
	hu.GetRequest.SetHeader("Authorization","Bearer " & Library.Token)
	hu.GetRequest.SetHeader("X-Oc-Merchant-Language",File.ReadString(File.DirInternal,Library.LanguageFilename))
	
End Sub

Public Sub GetInformation(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	
	
	hu.Initialize("banners",Me)
	hu.Download(apiurl & "information")
	hu.GetRequest.SetHeader("Authorization","Bearer " & Library.Token)
	hu.GetRequest.SetHeader("X-Oc-Merchant-Language",File.ReadString(File.DirInternal,Library.LanguageFilename))
	
End Sub