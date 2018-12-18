Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Class module
Sub Class_Globals
	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize

End Sub

Sub FromHtml(Text As String) As String
    
	Try
		Dim s As String
		s = Regex.Replace("<.*?>",Text,"")
		s = s.Replace("&nbsp;"," ").Replace("&amp;","&")
		Return s
	Catch
		Return Text
	End Try
	
End Sub