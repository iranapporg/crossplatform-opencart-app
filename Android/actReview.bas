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
	Public id As String
End Sub

Sub Globals
	Private Rate As String = "1"
	Private lbltitle As Label
	Private lblname As Label
	Private txtname As EditText
	Private lblrate As Label
	Private lbltext As Label
	Private txttext As EditText
	Private btnsend As Button
	Private pnlloading As Panel
	Private lblpb As Label
	Private pnlheader As Panel
	Private MyToastMessageShow As MyToastMessageShow
	Private lbls5 As Label
	Private lbls4 As Label
	Private lbls3 As Label
	Private lbls2 As Label
	Private lbls1 As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	
	Activity.LoadLayout("frmreview")
	MyToastMessageShow.Initialize(Activity)
	
	Library.ChangeStatusColor
	
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
	btnsend.Background = Library.GetButtonState
	
	txtname.Color = Colors.RGB(250,250,250)
	txttext.Color = Colors.RGB(250,250,250)
	
	lblname.Gravity = Library.GetStringResourse("direction")
	lblrate.Gravity = Library.GetStringResourse("direction")
	lbltext.Gravity = Library.GetStringResourse("direction")
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Activity.Finish
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub btnsend_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),2,False)
		Return
	End If
	
	If txtname.Text.Length < 2 Or txttext.Text.Length < 25 Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_data").Replace("\n",CRLF),2,False)
		Return
	End If
	
	Dim op As OpenCart
	op.Initialize
	pnlloading.SetVisibleAnimated(500,True)
	op.AddReviewProduct(Me,"SendReview_receive",id,txtname.Text,txttext.Text,Rate)
	
End Sub

Sub SendReview_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(600,False)
	
	Dim res1 As String
	res1 = res.Get("success")
	
	If res1.ToLowerCase = "true" Then
		txtname.Text = ""
		txttext.Text = ""
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("success_send"),1.5,True)
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_data").Replace("\n",CRLF),2,False)
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