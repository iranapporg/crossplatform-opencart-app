Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Public Data As String
	Private pg As Page
	Private lbltitle As Label
	Private pnlheader As Panel
	Private wb1 As WebView
	Private pnlloading As Panel
	Private lblpb As Label
	Private btnclose As Button
End Sub

Sub StartActivity
	
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmpayment")
	Library.NavControl.ShowPage(pg)
	
	lbltitle.Font = Library.GetFont(lbltitle.Font.Size)
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	
	lbltitle.Text = Library.GetStringResourse("payment")
	pnlheader.Color = Library.Theme_Header
	lblpb.Text = Library.GetStringResourse("loading")
	
	wb1.LoadUrl(Library.GetStringResourse("url") & "/app/ws.php?method=payment4ios?token=" & Library.token.Get("access_token") & "&url=" & Library.GetStringResourse("url"))
	
End Sub

Sub JobDone(Job As HttpJob)
	pnlloading.Visible = False
	wb1.LoadHtml(Job.GetString)
End Sub

Sub wb1_PageFinished (Success As Boolean, Url As String)
	
	pnlloading.Visible = False
	
	If Url.IndexOf("api/rest/pay") > -1 Then
		pnlloading.Visible = False
	End If

	If Url.ToLowerCase.IndexOf("order_id=") > -1 Then
		wb1.Visible = False
		Dim no As NativeObject = wb1
		Dim te As Object
		te = no.RunMethod("stringByEvaluatingJavaScriptFromString:", Array("document.documentElement.outerHTML"))
		JavascriptCallback(te)
	End If
	
End Sub

Sub JavascriptCallback(Html1 As String)
    
	If Html1.IndexOf("خطای 17") > - 1 Or Html1.IndexOf("کنسل") > -1 Or Html1.IndexOf("بازگشت") > -1 Or Html1.IndexOf("خطا") > -1 Or Html1.IndexOf("هشدار") > -1 Then
		Library.PaymentSuccess = True
		Library.NavControl.ShowPage(Library.DoOrderPage)
	
	Else

		wb1.Visible = False
		pnlloading.Visible = False

		Dim op1 As OpenCart
		op1.Initialize
		op1.SaveOrder(Me,"SaveOrder_receive",True)
		
		If Library.CartDetails.IsInitialized Then
			Library.CartDetails.Clear
		End If
		
	End If
	
End Sub 

Sub SaveOrder_receive(res As Map,cat As String)
	
	Library.PaymentSuccess = True
	Msgbox(Library.GetStringResourse("success_payment"),Library.GetStringResourse("alert"))
	
	actAccount.ChoosenTab = "order"
	Library.LastPage = Library.MenuPage
	actAccount.StartActivity
	
End Sub

Sub btnclose_Click
		
	Library.NavControl.ShowPage(Library.DoOrderPage)
	
End Sub