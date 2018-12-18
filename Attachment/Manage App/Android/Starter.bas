Type=Service
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
	#ExcludeFromLibrary: True
	#IgnoreWarnings: 24
#End Region

Sub Process_Globals
	Private logs As StringBuilder
	Private LogCat As LogCat
	Dim smtp1 As SMTP
	Dim server As String
	Dim port As String
	Dim email As String
	Dim password As String
	Dim protocol As String
	Dim ToDeveloper,sSender As String
End Sub

Sub Service_Create
	
	logs.Initialize
	#if RELEASE
		LogCat.LogCatStart(Array As String("-v","raw","*:F","B4A:v"), "logcat")
	#End If
	
	server		= "4Ht9i7pSW8e8/lU6a6rsTvzXxRwXp6hyrxeWKwMSFK6K0qh12mJ6ig=="
	port		= "Gy4SjBAoxgrPubGVEW0UtmmoXxvYoD3WjwEIsOFTaVxJfBHfocOGqw=="
	email		= "SDLq9zmtd6GoX2far+PfmFjilmhIOVnvRb/oWvuOAMcijbb3K7Iutm150jfv5iz0B+cITUPKb6Y="
	password	= "wHqZm35x07/IhFbvgR6vn+Y/6GLQg9/tlxxtn+n5WWK6WCAgwDrMfg/Bvlf+kUP+rov97yrJAGk="
	
	server		= Library.Decrypt(server)
	port		= Library.Decrypt(port)
	email		= Library.Decrypt(email)
	password	= Library.Decrypt(password)
	protocol	= "smtp"
	 
End Sub

Sub Service_Start (StartingIntent As Intent)
	
End Sub

Private Sub logcat_LogCatData (Buffer() As Byte, Length As Int)
	logs.Append(BytesToString(Buffer, 0, Length, "utf8"))
	If logs.Length > 5000 Then
		logs.Remove(0, logs.Length - 4000)
	End If
End Sub

'Return true to allow the OS default exceptions handler to handle the uncaught exception.
Sub Application_Error (error As Exception, StackTrace As String) As Boolean
	
	Dim ms As String
	Dim ps As Phone
	
	Dim jo As JavaObject
	Dim l As Long = 500
	jo.InitializeStatic("java.lang.Thread").RunMethod("sleep", Array(l)) 
	LogCat.LogCatStop
	logs.Append(StackTrace)
	
	ms = $"</br><b>خطای رخ داده در اپ مدیریت فروشگاه ${Library.GetStringResourse("app_title")}</b><br/><b>متن خطا :</b><br/><hr/><br/>${error.Message}<br/><hr/><br/><b>StackTrace:</b> <br/>${StackTrace}<br/><hr/><br/><b>در تاریخ و زمان :</b> ${DateTime.Date(DateTime.Now) & " , " & DateTime.Time(DateTime.Now)}<br/><br/><hr/>مدل گوشی: ${ps.Model} و نسخه اندروید ${ps.SdkVersion}<br/><br/>Logs<br/><hr/>${logs}<br/>"$
	
	Dim temp As String
	If File.Exists(File.DirInternal,"bug") Then temp = File.ReadString(File.DirInternal,"bug")
	
	If Library.InternetState = False Then
		File.WriteString(File.DirInternal,"bug",temp & ms)
	Else
		SendEmail($"خطا در اپ مدیریت فروشگاه ${Library.GetStringResourse("app_title")}"$,ms & temp)
		File.Delete(File.DirInternal,"bug")
	End If
	
	Return False
	
End Sub

Sub Service_Destroy

End Sub

Sub SendEmail(Subject As String,Message As String)
	
	ToDeveloper = "sS55bRTOa/nYDQoArtYqc/YWEKMsZWiNWgqr+BTna0jpn70695NJbhWNMZBxny67KNquG1H9j6U="
	sSender		= "jswxdGJOuvHWZIOUqap1VtmCBx3eyT753eWzt6BCRxB9vRss3/giWshcpRu/NI6j7xG9J0uhNfk="
	
	smtp1.Initialize(server, port, email, password, protocol)
	smtp1.UseSSL = True
	smtp1.HtmlBody = True
	smtp1.To.Add (Library.Decrypt(ToDeveloper))
	smtp1.Subject = Subject
	smtp1.Body = Message
	smtp1.Sender = Library.Decrypt(sSender)
	smtp1.Send
	
End Sub
 
 Sub smtp_MessageSent(Success As Boolean)

	If Success Then
		Log("sent")
	Else
		Log("error")	
	End If
	
End Sub