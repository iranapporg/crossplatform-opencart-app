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
	Public Data As String
	Public StartPayment As Boolean
End Sub

Sub Globals
	Private lbltitle As Label
	Private pnlheader As Panel
	Private wb1 As WebView
	Private pnlloading As Panel
	Private lblpb As Label
	Private dwvc As DefaultWebViewClient
	Private extra As WebViewExtras
End Sub

Sub Activity_Create(FirstTime As Boolean)
		
	Library.setLocalApp(Library.currLang)
	
	Library.ChangeStatusColor
	
	Dim phone1 As Phone
	phone1.SetScreenOrientation(1)
	
	Activity.LoadLayout("frmpayment")
	lbltitle.Text = Library.GetStringResourse("payment")
	pnlheader.Color = Library.Theme_Header
	lblpb.Text = Library.GetStringResourse("loading")
	
	wb1.JavaScriptEnabled = True
	wb1.ZoomEnabled = False
	
End Sub

Sub CallURL

	StartPayment = True
	pnlloading.SetVisibleAnimated(500,True)
	
	Dim i As Intent
	Dim url As String
	Dim state As String
	
	url = Library.GetStringResourse("url")
	state = Library.GetStringResourse("is_https").ToLowerCase
	
	If state = "1" Or state = "on" Then
		url = url.Replace("http://","https://") & "/index.php?route=rest/confirm/confirm&page=pay&access_token=" & Library.token.Get("access_token")
	Else
		url = url & "/index.php?route=rest/confirm/confirm&page=pay&access_token=" & Library.token.Get("access_token")
	End If
	
	i.Initialize(i.ACTION_VIEW,url)
	StartActivity(i)
	
	Return
	
'	dwvc.Initialize("wbSSL")
'	extra.Initialize(wb1)
'	extra.SetWebViewClient(dwvc)
'	
'	Dim de As DefaultJavascriptInterface
'	de.Initialize
'	extra.AddJavascriptInterface(de,"B4A")
'	extra.JavaScriptEnabled = True
'	
'	Dim rs As Map
'	rs = CreateMap("Authorization":$"${Library.token.Get("token_type")} ${Library.token.Get("access_token")}"$)
'	
'	url = Library.GetStringResourse("url")
'	
'	If state = "1" Or state = "on" Then
'		extra.LoadUrl2(url.Replace("http://","https://") & "/index.php?route=rest/confirm/confirm&page=pay",rs)
'	Else
'		extra.LoadUrl2(url & "/index.php?route=rest/confirm/confirm&page=pay",rs)
'	End If

End Sub

Sub Activity_Resume

	If StartPayment Then
		
		StartPayment = False
	
		GetOrderStatus(Data)
	
	Else
		CallURL
	End If
	
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub clearCart_receive
	Activity.Finish
End Sub

Sub wbSSL_PageFinished(Url As String)
	
	pnlloading.SetVisibleAnimated(500,False)

	If Url.ToLowerCase.IndexOf("order_id=") > -1 Then
		wb1.Visible = False
		pnlloading.SetVisibleAnimated(500,True)
		extra.executeJavascript("B4A.CallSub('JavascriptCallback_Receive', true, document.documentElement.outerHTML)")
	End If
	
End Sub

#IgnoreWarnings: 12
Sub JavascriptCallback_Receive(Html1 As String)
	
	Dim lsError As List
	lsError.Initialize
	lsError.Add("انصراف")
	lsError.Add("منصرف")
	
	For i = 0 To lsError.Size - 1
		Dim temp As String
		temp = lsError.Get(i)
		If Html1.IndexOf(temp) > -1 Then
			Activity.Finish
			Log("ok payment")
			Return
		End If
	Next
	
	wb1.Visible = False
	pnlloading.SetVisibleAnimated(500,True)

	Log("save order and verify it")
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.SaveOrder(Me,"SaveOrder_receive",True)
	
	If Library.CartDetails.IsInitialized Then
		Library.CartDetails.Clear
	End If
	
End Sub 

Sub wbSSL_ReceivedSslError(SslErrorHandler1 As SslErrorHandler, SslError1 As SslError)
	SslErrorHandler1.Proceed
End Sub

Sub GetOrderStatus(ID As String)
	
	Dim p1 As OpenCart
	p1.Initialize
	p1.GetOrders(Me,"CheckOrder_receive",ID)
	
End Sub

Sub CheckOrder_receive(res As Map,cat As String)
	
	If res.Get("success") = False Then
		Activity.Finish
		Return
	End If

	Dim op1 As OpenCart
	op1.Initialize
	op1.SaveOrder(Me,"SaveOrder_receive",True)

	If Library.CartDetails.IsInitialized Then
		Library.CartDetails.Clear
	End If

End Sub

Sub SaveOrder_receive(res As Map,cat As String)
	
	Dim res As Map
	res = res.Get("data")
	
	Library.PaymentSuccess = True
	Msgbox(Library.GetStringResourse("success_payment"),Library.GetStringResourse("alert"))
	
	Activity.Finish
	
End Sub