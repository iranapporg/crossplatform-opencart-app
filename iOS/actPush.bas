Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	
	Public body As String

	Private lbldesc As TextView
	Private lbltitle As Label
	Private btnclose As Button
	Private pnlheader As Panel
	
End Sub

Sub StartActivity

	Dim pg As Page
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmpush")
	Library.NavControl.ShowPage(pg)
	
	Library.ChangeFont(pg.RootPanel)
	
	pnlheader.Color = Library.Theme_Header
	lbltitle.Text = Library.GetStringResourse("about")
	Library.ChangeFont(pg.RootPanel)
	
	lbldesc.TextAlignment = Library.GetStringResourse("direction_ios")
	lbldesc.Text = body
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.MenuPage)	
End Sub