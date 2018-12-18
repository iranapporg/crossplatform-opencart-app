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

End Sub

Sub Globals
	Private pnlloading As Panel
	Private lblpb As Label
	Dim res As String
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmwaiting")
	lblpb.Text = Library.GetStringResourse("loading")
	
	Library.ChangeStatusColor
	
End Sub

Sub Activity_Resume
	
	If res.Length = 0 Then
		res = Library.ParseURL_Scheme(Activity.GetStartingIntent)
	End If
	
	If res <> "" Then
	
		Dim arr() As String
		arr = Regex.Split("/",res)
		
		If IsNumber(arr(0)) Then
			
			If Library.InternetState = False Then
				StartActivity(actErrorIntrenet)
				Return
			End If
			
			Dim op As OpenCart
			op.Initialize
			op.ProductDetails(Me,"Details_receive",arr(0))
		Else
			Activity.Finish
		End If
		
	Else
		Activity.Finish
	End If
	
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Activity.Finish
End Sub

Sub Details_receive(res1 As Map,cat As String)
	
	If res1.IsInitialized Then
		actProduct.product = res1
		StartActivity(actProduct)
	End If
	
End Sub
