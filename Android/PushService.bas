B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=7.28
@EndOfDesignText@
#Region Module Attributes
	#StartAtBoot: True
#End Region

Sub Process_Globals
	Dim SenderId,Token As String
	Dim IntentC2DM As Intent
End Sub

Sub Service_Create
	
End Sub

Sub Service_Start (StartingIntent As Intent)
	
	IntentC2DM	= StartingIntent
	SenderId	= "805572620195"
	
	Select IntentC2DM.Action
		Case "com.google.android.c2dm.intent.REGISTRATION"
			HandleRegistrationResult(IntentC2DM)
		Case "com.google.android.c2dm.intent.RECEIVE"
			MessageArrived(IntentC2DM)
	End Select
	
End Sub

Sub MessageArrived (Intent As Intent)
	
	If Library.manager.GetBoolean("push") = False Then Return
	
	#region parse message
	Dim From, CollapseKey, Data As String 'ignore
	If Intent.HasExtra("from") Then 		From = Intent.GetExtra("from")
	If Intent.HasExtra("data") Then 		Data = Intent.GetExtra("data")
	If Intent.HasExtra("collapse_key") Then CollapseKey = Intent.GetExtra("collapse_key")
	#end region
	
	Dim message As String
	message = Data
	
	Dim js As JSONParser
	js.Initialize(message)
	
	Dim m1 As Map
	m1 = js.NextObject
	
	actNotification.Data		= m1.Get("message")
	actNotification.Title		= m1.Get("title")
	actNotification.ButtonText	= m1.Get("button")
	actNotification.Value		= m1.Get("value")
	actNotification.sType		= m1.Get("type")
	StartActivity(actNotification)
	
End Sub

Sub RegisterDevice (Unregister As Boolean)
	Dim i As Intent
	If Unregister Then		
		i.Initialize("com.google.android.c2dm.intent.UNREGISTER", "")
	Else
		i.Initialize("com.google.android.c2dm.intent.REGISTER", "")
		i.PutExtra("sender", SenderId)
	End If
	Dim r As Reflector
	Dim i2 As Intent
	i2 = r.CreateObject("android.content.Intent")
	Dim pi As Object
	pi = r.RunStaticMethod("android.app.PendingIntent", "getBroadcast", _
		Array As Object(r.GetContext, 0, i2, 0), _
		Array As String("android.content.Context", "java.lang.int", "android.content.Intent", "java.lang.int"))
	i.PutExtra("app", pi)
	StartService(i)
End Sub

Sub HandleRegistrationResult(Intent As Intent)
	
	If Intent.HasExtra("error") Then
		
	Else If Intent.HasExtra("unregistered") Then
		RegUser("0",False)
		
	Else If Intent.HasExtra("registration_id") Then
		Dim rid As String
		rid = Intent.GetExtra("registration_id")
		Token = rid
		RegUser(rid,True)
	End If
	
End Sub

Sub JobDone(Job As HttpJob)
 
	If Job.Success Then
		Select Job.JobName
			Case "RegisterTask"
				Log(Job.GetString)
				Log("Registration completed successfully.")
				If Token.Length > 0 Then Library.manager.SetBoolean("registeration", True)
				
			Case "UnregisterTask"
				Log("Unregistration completed successfully.")
			
			Case "sender"
				SenderId = Library.Decrypt(Job.GetString)
				RegisterDevice(False)
'				
		End Select
	Else
	End If
	
	Job.Release
	
End Sub

Sub Service_Destroy

End Sub

Sub RegUser(sToken As String,Register As Boolean)
	
	Dim htReg As HttpJob
	htReg.Initialize("RegisterTask",Me)
	
	Dim dataconnection As Phone
	Dim ID,SIM,Connection,OS,sDeviceName,URL,Param,state As String
	
	ID			= Library.phone1.GetDeviceId
	SIM			= dataconnection.GetNetworkOperatorName
	Connection	= dataconnection.GetNetworkType
	sDeviceName	= dataconnection.Model
	OS			= "android"
	
	If Register Then
		state = "register"
	Else
		state = "unregister"
	End If
	
	If SIM.Length = 0 Then SIM = "-"
	
	URL = Library.GetStringResourse("url") & "/app/ws.php?method=statistic"
	Param = $"token=${sToken}&info=${GetDeviceInformation}&id=${ID}&connection=${Connection}&os=${OS}&device_name=${sDeviceName}&sim=${SIM}&sign=${Library.Sign.KeyHash.Replace(CRLF,"")}&android_version=${GetAndroidVersion}&state=${state}"$
	
	htReg.PostString(URL,Param)
	
End Sub

Sub GetDeviceInformation As String
	
	Dim ma As Map
	ma.Initialize
	
	Dim phone1 As Phone
	
	Dim nativeMe As JavaObject
	nativeMe.InitializeContext
	
	ma.Put("Model",phone1.Model)
	ma.Put("Brand","0")
	ma.Put("SDK",phone1.SdkVersion)
	ma.Put("Root",Library.GetRoot)
	ma.Put("Manufacturer",phone1.Manufacturer)
	ma.Put("Language",Library.GetLanguage)
	ma.Put("Country","ir")
	ma.Put("OSName","-")
	ma.Put("OSVersion",GetAndroidVersion)
	ma.Put("PhoneNumber","-")
	ma.Put("UserAgent","-")
	ma.Put("IP","-")
	ma.Put("Location","-")
	ma.Put("AppVersion",Application.VersionCode)
	
	Dim js As JSONGenerator
	js.Initialize(ma)
	Return js.ToString
	
End Sub

Sub GetAndroidVersion As String
	
	Dim ps As Phone
	Select ps.SdkVersion
		Case 1
			Return "1"
		Case 2
			Return "1.1"
		Case 3
			Return "1.5"
		Case 4
			Return "1.6"
		Case 5
			Return "2"
		Case 6
			Return "2.0.1"
		Case 7
			Return "2.1"
		Case 8
			Return "2.2"
		Case 9
			Return "2.3"
		Case 10
			Return "2.3.3"
		Case 11
			Return "3"
		Case 12
			Return "3.1"
		Case 13
			Return "3.2"
		Case 14
			Return "4"
		Case 15
			Return "4.0.3"
		Case 16
			Return "4.1"
		Case 17
			Return "4.2"
		Case 18
			Return "4.3"
		Case 19
			Return "4.4"
		Case 20
			Return "4.4"
		Case 21
			Return "5"
		Case 22
			Return "5.1"
		Case 23
			Return "6"
	End Select
	
End Sub