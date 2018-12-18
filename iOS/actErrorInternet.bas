Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

private Sub Process_Globals
	Public Module As Object
	Public NoShop As String
	Private lbltitle As Label
	Private lbldetails As Label
	Private btnsetting As Button
	Private btnretry As Button
	Private pnlheader As Panel
	Private lblalert As Label
End Sub

Sub StartActivity
	
	Library.ErrorNetPage.Initialize("Page1")
	Library.ErrorNetPage.RootPanel.LoadLayout("frmerronet")
	Library.NavControl.ShowPage(Library.ErrorNetPage)
	
	lbltitle.Text	= Library.GetStringResourse2("error_net_title")
	Library.SetFont(lbltitle,"",14)
	
	If NoShop.Length = 0 Then
		lbldetails.Text = Library.GetStringResourse2("error_net_details")
	Else
		lbldetails.Text = NoShop
	End If
	
	Library.SetFont(lbldetails,"",10)
	
	btnretry.Text	= Library.GetStringResourse2("btnretry")
	Library.SetFont(btnretry,"",14)
	btnsetting.Text = Library.GetStringResourse2("btnsetting")
	Library.SetFont(btnsetting,"",14)
	
	pnlheader.Color = Library.Theme_Header
	Library.SetFont(lblalert,"icomoon",93)
	
End Sub

Sub btnsetting_Click
	
	If Library.App.OSVersion >= 8 Then
   		Library.App.OpenURL("app-settings:")
	Else
		Msgbox(Library.GetStringResourse2("error_net_details"),Library.GetStringResourse2("alert"))
	End If
	
End Sub

Sub btnretry_Click

	If Library.InternetState = False Then
		Library.HUD.ToastMessageShow(Library.GetStringResourse2("error_again_net"),False)
	Else
		Main.StartActivity
	End If
	
End Sub