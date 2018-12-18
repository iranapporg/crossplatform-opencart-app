Type=Service
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
#End Region

Sub Process_Globals
   Private fm As FirebaseMessaging
End Sub

Sub Service_Create
   fm.Initialize("fm")
End Sub

Public Sub SubscribeToTopics
	fm.SubscribeToTopic("general")
End Sub

Sub Service_Start (StartingIntent As Intent)
   If fm.HandleIntent(StartingIntent) Then Return
End Sub

Sub fm_MessageArrived (Message As RemoteMessage)
	
	Dim data As Map
	data		=	Message.GetData
   
	Dim sType As String
	sType	=	data.Get("type")
   
	Library.Notify("توجه",data.Get("body"),sType,data.Get("data"))

End Sub

Sub fm_TokenRefresh (Token As String)
	Log("Token is " & Token)
End Sub

Sub Service_Destroy

End Sub