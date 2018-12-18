Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private pnlloading As Panel
	Private lblpb As Label
	Dim res As String
End Sub

Sub StartActivity
	
	Dim pg As Page
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmwaiting")
	lblpb.Text = Library.GetStringResourse("loading")
	
'	If res.Length = 0 Then
'		res = Library.ParseURL_Scheme(Activity.GetStartingIntent)
'	End If
'	
'	If res <> "" Then
'	
'		Dim arr() As String
'		arr = Regex.Split("/",res)
'		
'		If IsNumber(arr(0)) Then
'			
'			If Library.InternetState = False Then
'				StartActivity(actErrorIntrenet)
'				Return
'			End If
'			
'			Dim op As OpenCart
'			op.Initialize
'			op.ProductDetails(Me,"Details_receive",arr(0))
'		Else
'			Activity.Finish
'		End If
'		
'	Else
'		Activity.Finish
'	End If
	
End Sub

Sub Details_receive(res1 As Map,cat As String)
	
	If res1.IsInitialized Then
		actProduct.product = res1
		actProduct.StartActivity
	End If
	
End Sub
