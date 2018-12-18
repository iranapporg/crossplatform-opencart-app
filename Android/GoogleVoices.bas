Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals

End Sub

Sub Globals
	Private voice As VoiceRecognition
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.Color = Colors.Transparent
	
	voice.Initialize("VR")
	
	If Library.manager.GetString("lang") = "English" Then
		voice.Language = "en"
	Else
		voice.Language = "fa"
	End If
	
	voice.Prompt = Library.GetStringResourse("google_voice")
	
End Sub

Sub Listen
	voice.Listen
End Sub

Sub VR_Result (Success As Boolean, Texts As List)
	
	If Texts.IsInitialized = False Then Activity.Finish
	Library.DoCommand(Texts)
	Activity.Finish
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	If UserClosed = True Then
		Activity.Finish
	End If
End Sub
