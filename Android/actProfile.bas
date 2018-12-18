Type=Activity
Version=5.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.

	Private btnaddress As Button
	Private btnnewaddress As Button
	Private btnorders As Button
	Private btnpassword As Button
	Private btnprofile As Button
	Private lblchoosenmenu As Label
	Private lblnewaddress As Label
	Private pnlmenu As Panel
	Private pnlmain As Panel
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("frmaccounts")
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

