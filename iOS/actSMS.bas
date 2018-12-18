Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Public basket As String
	Private txtname As TextField
	Private btnsend As Button
	Private lblphone As Label
	Private lbltitle As Label
	Private MyToastMessageShow1 As MyToastMessageShow
	Private txtcomment As TextView
	Private lblcomment As Label
	Private btnproduts As Button
	Private btnclose As Button
	Private ps As MessageComposer
	Private pg As Page
	Private pnlheader As Panel
End Sub

Sub StartActivity
	
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmsms")
	Library.NavControl.ShowPage(pg)
	
	pnlheader.Color = Library.Theme_Header
	btnsend.Top = Library.GetHeight-btnsend.Height-20dip
	btnproduts.Top = Library.GetHeight-btnproduts.Height-20dip
	
	MyToastMessageShow1.Initialize(pg.RootPanel)
	lbltitle.Text = Library.GetStringResourse("send_sms")
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	
	txtname.HintText	= Library.GetStringResourse("sms_name")
	txtcomment.Text = Library.GetStringResourse("sms_order_comment")
	
	btnsend.Text				= Library.GetStringResourse("send_request")
	btnproduts.Text				= Library.GetStringResourse("my_product")
	txtname.TextAlignment		= Library.GetStringResourse("direction_ios")
	txtcomment.TextAlignment	= Library.GetStringResourse("direction_ios")
	lblphone.Text				= Library.GetStringResourse("sms_contact") & " " & Library.GetStringResourse("shop_phone")
	lblcomment.Text				= Library.GetStringResourse("sms_help")
	
	btnsend.CustomLabel.Font = Library.GetFont(btnsend.CustomLabel.Font.Size)
	btnproduts.CustomLabel.Font = Library.GetFont(btnsend.CustomLabel.Font.Size)
	
	btnsend.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	btnproduts.Color = Library.ConvertHex2Int(Library.GetStringResourse("category_button"))
	
End Sub

Sub btnsend_Click
	
	If txtname.Text.Length = 0 Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("error_name"),1.6,False)
		Return
	End If
	
	basket = basket & CRLF & txtname.Text
	SendSms(basket,True)
	
End Sub

#Region Send Sms and handle it

Sub SendSms(Text As String,Intent As Boolean)
	
	ps.Initialize("sms")
	ps.SetRecipients(Array(Library.GetStringResourse("shop_sms")))
	ps.Body = Text
	ps.Show(pg)
	 
	MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("send_order"),1.7,True)
	txtcomment.Text = ""
	txtname.Text = ""
	
End Sub

Sub sms_Complete (Result As Int)
	
	If Result = ps.RESULT_SENT Then
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("send_order"),2,True)
	Else
		MyToastMessageShow1.ShowToastMessageShow(Library.GetStringResourse("deliver_sms").Replace("\n",CRLF),2,True)
	End If
	
End Sub

#End Region

Sub btnproduts_Click
	actBasket.StartActivity
End Sub

Sub btnclose_Click
		Library.NavControl.ShowPage(Library.LastPage)
End Sub

Sub lblcfocus_Click
	pg.ResignFocus
End Sub

Sub txtcomment_Click
	txtcomment.RequestFocus
End Sub