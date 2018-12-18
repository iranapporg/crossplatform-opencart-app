Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private sv1 As ScrollView
	Private lbltitle As Label
	Private lblname As Label
	Private txtname As TextField
	Private lblemail As Label
	Private txtemail As TextField
	Private lbltext As Label
	Private txttext As TextField
	Private btnsend As Button
	Private pnlloading As Panel
	Private lblpb As Label
	Private pnlheader As Panel
	Dim MyToastMessageShow1 As MyToastMessageShow
	Dim pg As Page
End Sub

Sub StartActivity
	
	sv1.Initialize("sv1",Library.GetWidth,Library.GetHeight)
	sv1.ContentHeight = Library.GetHeight
	sv1.ContentWidth = Library.GetWidth
	sv1.Color = Colors.White
	sv1.Panel.Color = Colors.White
	
	pg.Initialize("pg")
	pg.RootPanel.AddView(sv1,0,0,Library.GetWidth,Library.GetHeight)
	sv1.Panel.LoadLayout("frmcontact")
	sv1.ContentHeight = Library.GetHeight+300dip
	Library.ChangeFont(pg.RootPanel)
	Library.NavControl.ShowPage(pg)
	
	MyToastMessageShow1.Initialize(pg.RootPanel)
	
	lbltitle.Text = Library.GetStringResourse("contact")
	lblpb.Text = Library.GetStringResourse("apply")
	pnlheader.Color = Library.Theme_Header
	
	lblname.Text = Library.GetStringResourse("tname")
	lblemail.Text = Library.GetStringResourse("email")
	lbltext.Text = Library.GetStringResourse("ttext")
	btnsend.Text = Library.GetStringResourse("send")
	Library.GetButtonState(btnsend)
	
	txtname.Color = Colors.RGB(250,250,250)
	txtemail.Color = Colors.RGB(250,250,250)
	txttext.Color = Colors.RGB(250,250,250)
	
	lblname.TextAlignment	= Library.GetStringResourse("direction_ios")
	txtname.TextAlignment	= Library.GetStringResourse("direction_ios")
	txttext.TextAlignment	= Library.GetStringResourse("direction_ios")
	lblemail.TextAlignment	= Library.GetStringResourse("direction_ios")
	lbltext.TextAlignment	= Library.GetStringResourse("direction_ios")
	
End Sub

Sub btnsend_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),2,False)
		Return
	End If
	
	If txtname.Text.Length < 2 Or txttext.Text.Length < 25 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_data").Replace("\n",CRLF),2,False)
		Return
	End If
	
	Dim op As OpenCart
	op.Initialize
	pnlloading.Visible = True
	op.ContactUs(Me,"SendReview_receive",txtemail.Text,txtname.Text,txttext.Text)
	
End Sub

Sub SendReview_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	Dim res1 As String
	res1 = res.Get("success")
	
	If res1.ToLowerCase = "true" Or res1 = "1" Then
		txtemail.Text = ""
		txtname.Text = ""
		txttext.Text = ""
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("success_send"),2,True)
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_data").Replace("\n",CRLF),2,False)
	End If
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.MenuPage)	
End Sub

Sub lblfocus_Click
	pg.ResignFocus
	sv1.ScrollTo(0,0,True)
End Sub

Sub txttext_Click
	txttext.RequestFocus
	sv1.ScrollTo(0,txttext.Top,True)
End Sub