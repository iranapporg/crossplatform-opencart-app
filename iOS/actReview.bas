Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private sv1 As ScrollView
	Public id As String
	Private Rate As String = "1"
	Private lbltitle As Label
	Private lblname As Label
	Private txtname As TextField
	Private lblrate As Label
	Private lbltext As Label
	Private txttext As TextView
	Private btnsend As Button
	Private pnlloading As Panel
	Private lblpb As Label
	Private pnlheader As Panel
	Private MyToastMessageShow1 As MyToastMessageShow
	Private lbls5 As Label
	Private lbls4 As Label
	Private lbls3 As Label
	Private lbls2 As Label
	Private lbls1 As Label
	Private pnlreviews As Panel
	Private btnclose As Button
	Dim pg As Page
End Sub

Sub StartActivity
	
	sv1.Initialize("sv1",Library.GetWidth,Library.GetHeight)
	sv1.ContentHeight = Library.GetHeight
	sv1.ContentWidth = Library.GetWidth
	sv1.Color = Colors.White
	sv1.Panel.Color = Colors.White
	
	
	pg.Initialize("")
	
	pg.RootPanel.AddView(sv1,0,0,Library.GetWidth,Library.GetHeight)
	sv1.Panel.LoadLayout("frmreview")
	sv1.ContentHeight = Library.GetHeight+300dip
	Library.NavControl.ShowPage(pg)
	MyToastMessageShow1.Initialize(pg.RootPanel)
	
	lbls1.TextColor = Library.Theme_Header
	
	lbls2.TextColor = Library.Theme_Header
	lbls3.TextColor = Library.Theme_Header
	lbls4.TextColor = Library.Theme_Header
	lbls5.TextColor = Library.Theme_Header
	
	lbltitle.Text = Library.GetStringResourse("reviews")
	lblpb.Text = Library.GetStringResourse("apply")
	pnlheader.Color = Library.Theme_Header
	
	lblname.Text = Library.GetStringResourse("tname")
	lblrate.Text = Library.GetStringResourse("trate")
	lbltext.Text = Library.GetStringResourse("ttext")
	btnsend.Text = Library.GetStringResourse("send")
	Library.GetButtonState(btnsend)
	Library.SetFont(btnsend,"icomoon",btnsend.CustomLabel.Font.Size)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	btnsend.CustomLabel.Font = Library.GetFont(14)
	
	For Each v1 As View In pnlreviews.GetAllViewsRecursive
		If v1 Is Label Then
			Dim lb2 As Label
			lb2 = v1
			If lb2.Tag <> "icon" Then
				lb2.Font = Library.GetFont(lb2.Font.Size)
			Else
				Library.SetFont(lb2,"icomoon",lb2.Font.Size)
			End If
		End If
	Next
	
	txtname.Color = Colors.RGB(250,250,250)
	txttext.Color = Colors.RGB(250,250,250)
	
	lblname.TextAlignment = Library.GetStringResourse("direction_ios")
	txtname.TextAlignment = Library.GetStringResourse("direction_ios")
	lblrate.TextAlignment = Library.GetStringResourse("direction_ios")
	lbltext.TextAlignment = Library.GetStringResourse("direction_ios")
	txttext.TextAlignment = Library.GetStringResourse("direction_ios")
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.LastPage)
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
	op.AddReviewProduct(Me,"SendReview_receive",id,txtname.Text,txttext.Text,Rate)
	
End Sub

Sub SendReview_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	Dim res1 As String
	res1 = res.Get("success")
	
	If res1.ToLowerCase = "true" Then
		txtname.Text = ""
		txttext.Text = ""
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("success_send"),1.5,True)
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_data").Replace("\n",CRLF),2,False)
	End If
	
End Sub

Sub lbls5_Click
	Rate = "5"
	ChangeStar
End Sub

Sub lbls4_Click
	Rate = "4"
	ChangeStar
End Sub

Sub lbls3_Click
	Rate = "3"
	ChangeStar
End Sub

Sub lbls2_Click
	Rate = "2"
	ChangeStar
End Sub

Sub lbls1_Click
	Rate = "1"
	ChangeStar
End Sub

Sub ChangeStar
	
	If Rate = "1" Then
		lbls1.Text = ""
		lbls2.Text = ""
		lbls3.Text = ""
		lbls4.Text = ""
		lbls5.Text = ""
		
	Else If Rate = "2" Then
		lbls1.Text = ""
		lbls2.Text = ""
		lbls3.Text = ""
		lbls4.Text = ""
		lbls5.Text = ""
		
	Else If Rate = "3" Then
		lbls1.Text = ""
		lbls2.Text = ""
		lbls3.Text = ""
		lbls4.Text = ""
		lbls5.Text = ""

	Else If Rate = "4" Then
		lbls1.Text = ""
		lbls2.Text = ""
		lbls3.Text = ""
		lbls4.Text = ""
		lbls5.Text = ""
		
	Else If Rate = "5" Or Rate > 5 Then
		lbls1.Text = ""
		lbls2.Text = ""
		lbls3.Text = ""
		lbls4.Text = ""
		lbls5.Text = ""
	End If
		
End Sub

Sub txttext_Click
	txttext.RequestFocus
	sv1.ScrollTo(0,txttext.Top,True)
End Sub

Sub pnlreviews_Click
	pg.ResignFocus
End Sub