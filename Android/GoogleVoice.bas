Type=Service
Version=5.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
	
#End Region

Private Sub Process_Globals
	Private voice As VoiceRecognition
End Sub

Sub Service_Create
	
End Sub

Sub VR_Result (Success As Boolean, Texts As List)
	Log(Texts)
End Sub

Sub Service_Start (StartingIntent As Intent)
	voice.Initialize("VR")
	voice.Language = "en"
	voice.Prompt = Library.GetStringResourse("google_voice")
	voice.Listen
End Sub

Sub Service_Destroy

End Sub
