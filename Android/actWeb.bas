Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	Public title,link,data As String
End Sub

Sub Globals
	Private wb1 As WebView
	Private pnlheader As Panel
	Private lbltitle As Label
	Private pnlloading As Panel
	Private lblpb As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)

	Activity.LoadLayout("frmweb")
	lbltitle.Text = title
	pnlheader.Color = Library.Theme_Header
	lblpb.Text = Library.GetStringResourse("loading")
	
	Library.ChangeStatusColor
	
	Dim style As String
	
	If Library.IsPersian Then
		style = "<body style=""direction:rtl;text-align:right !important;line-height:35px""><p>"
	Else
		style = "<body style=""direction:ltr;text-align:left !important""><p>"
	End If
	
	If data.Length > 0 Then
		data = data.Replace("&gt;",">").Replace("&lt;","<").replace("&quot;",QUOTE).Replace("&amp;","&")
		data = style & data & "</p>"
		File.WriteString(File.DirRootExternal,"a.html",data)
		wb1.LoadHtml(data)
		data = ""
	Else
		pnlloading.SetVisibleAnimated(600,True)
		wb1.LoadUrl(link)
		link = ""
	End If
	
End Sub

Sub wb1_PageFinished (Url As String)
	pnlloading.SetVisibleAnimated(600,False)
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCodes.KEYCODE_BACK = KeyCode Then
		Activity.Finish
		Return True
	End If
	
End Sub