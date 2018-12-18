Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private wb1 As WebView
	Private pnlheader As Panel
	Private lbltitle As Label
	Public title,link,data As String
	Private btnclose As Button
End Sub

Sub StartActivity
	
	Dim pg As Page
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmweb")
	Library.NavControl.ShowPage(pg)
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	
	lbltitle.Text = title
	pnlheader.Color = Library.Theme_Header
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	
	Dim no As NativeObject = wb1
	no.RunMethod("stringByEvaluatingJavaScriptFromString:", Array("document.body.style.fontSize = '20px';"))
	
	Dim style As String
	
	If Library.IsPersian Then
		style = "<body style=""font-size:18px;direction:rtl;text-align:right !important;line-height:35px"">"
	Else
		style = "<body style=""font-size:18px;direction:ltr;text-align:left !important"">"
	End If
	
	If data.Length > 0 Then
		data = data.Replace("&gt;",">").Replace("&lt;","<").replace("&quot;",QUOTE).Replace("&amp;","&")
		wb1.LoadHtml(style & data & "</p>")
		data = ""
	Else
		wb1.LoadUrl(link)
		link = ""
	End If
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.MenuPage)
End Sub