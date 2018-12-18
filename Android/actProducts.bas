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
	Public res As List
	Public title As String
End Sub

Sub Globals
	Private lbltitle As Label
	Private pnlloading As Panel
	Private lblpb As Label
	Private pnlheader As Panel
	Private sv1 As ScrollView
	Private top As Int = 30
	Private lblbasket As Label
	Dim MyToastMessageShow As MyToastMessageShow
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	Activity.LoadLayout("frmproducts")
	MyToastMessageShow.Initialize(Activity)
	
	Library.ChangeStatusColor
	
	lbltitle.Text = title
	lblpb.Text = Library.GetStringResourse("loading")
	pnlheader.Color = Library.Theme_Header
	
	If res.Size = 0 Then
		ToastMessageShow(Library.GetStringResourse("no_exist_product"),False)
		Activity.Finish
		Return
	End If
	
	sv1.Visible = False
	top = Library.LoadProduct(res,top,sv1)
	
	sv1.Panel.Height = sv1.Panel.Height + 290dip
	sv1.Visible = True
	pnlloading.Visible = False
	sv1.Panel.Color = Library.Theme_Background
	Activity.Color = Library.Theme_Background
	
	Library.ShowCartLabel(lblbasket)
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish	
End Sub

Sub pnlover_Click
	
	Dim p1,p2 As Panel
	p1 = Sender
	
	p2 = Library.GetParent(p1)
	p2.Visible = False
	p2.SetVisibleAnimated(500,True)
	
	Dim temp As Map
	temp = p1.Tag
	actProduct.product = temp
	StartActivity(actProduct)
	
End Sub

Sub btnsearch_Click
	StartActivity(actSearch)
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		Activity.Finish
		Return True
	End If
	
End Sub

Sub btnadd_2_cart_Click
	
'	Dim b1 As Button
'	b1 = Sender
'	
'	Library.Add2Cart(b1.Tag,"1",Me)
	
End Sub

Sub btnbasket_Click
	StartActivity(actBasket)
End Sub
