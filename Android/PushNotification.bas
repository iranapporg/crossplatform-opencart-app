Type=StaticCode
Version=2
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals

End Sub

Sub CheckNewPushNotification(Data As String)
	
	Dim js As JSONParser
	
	Try
		js.Initialize(Data)
		
		Dim temp As Map
		temp = js.NextObject
		
		If File.Exists(File.DirLibrary,"push3_" & temp.Get("id")) = False Then
			File.WriteString(File.DirLibrary,"push3_" & temp.Get("id"),"")
			ShowPushNotification(temp.Get("body"))
		Else
			Return
		End If
		
	Catch
		Return
	End Try
	
End Sub

Sub ShowPushNotification(Body As String)
	
	Dim ln As Notification
	ln.Initialize(DateTime.Now + 1 * DateTime.TicksPerSecond) '6 seconds from now
	ln.IconBadgeNumber = 0
	ln.AlertBody = Library.GetStringResourse("push_subscribe")
	File.WriteString(File.DirLibrary,"push",Body)
	ln.PlaySound = True
	ln.Register
	
End Sub