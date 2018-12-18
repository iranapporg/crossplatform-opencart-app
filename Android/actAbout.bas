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
	Private lbltitle As Label
	Private pnlheader As Panel
	Private btnclose As Button
	Private imglogo As ImageView
	Private lbladdress As Label
	Private lblemail As Label
	Private lblfax As Label
	Private lblname As Label
	Private lblowner As Label
	Private lblphone As Label
	Private lblurl As Label
	Private pnlsearch As Panel
	Private pnlloading As Panel
	Private lblpb As Label
	Private lblcomment As Label
	Private pb1 As ProgressBar
	Private lv1 As ListView
	Private pnlstores As Panel
	Private btnlist As Button
	Private btncancel As Button
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	
	Library.ChangeStatusColor
	
	Activity.LoadLayout("frmabout")
	pnlheader.Color = Library.Theme_Header
	lbltitle.Text = Library.GetStringResourse("about")
	lblpb.Text = Library.GetStringResourse("loading")
	btnlist.Text = Library.GetStringResourse("shop_list")
	btncancel.Text = Library.GetStringResourse("cancel")
	btncancel.Background = Library.GetButtonState
	
	Library.PaddingLabel(lbladdress,16,16,16,16)
	Library.PaddingLabel(lblcomment,16,16,16,16)
	Library.PaddingLabel(lblname,20,0,20,0)
	Library.PaddingLabel(lblphone,20,0,20,0)
	Library.PaddingLabel(lblfax,20,0,20,0)
	Library.PaddingLabel(lblemail,20,0,20,0)
	Library.PaddingLabel(lblowner,20,0,20,0)
	Library.PaddingLabel(lblurl,20,0,20,0)
	
	lblname.Gravity = Library.GetStringResourse("direction")
	lblphone.Gravity = Library.GetStringResourse("direction")
	lblfax.Gravity = Library.GetStringResourse("direction")
	lblemail.Gravity = Library.GetStringResourse("direction")
	lblurl.Gravity = Library.GetStringResourse("direction")
	lblowner.Gravity = Library.GetStringResourse("direction")
	lbladdress.Gravity = Library.GetStringResourse("direction")
	
	If Library.IsPersian Then
		lblcomment.Gravity = Bit.Or(Gravity.Right,Gravity.TOP)
	Else
		lblcomment.Gravity = Bit.Or(Gravity.LEFT,Gravity.TOP)
	End If
	
	lv1.SingleLineLayout.Label.TextColor = Colors.Black
	lv1.SingleLineLayout.Label.Typeface = Library.GetFont
	lv1.SingleLineLayout.Label.TextSize = 14
	lv1.SingleLineLayout.Label.Gravity = Library.GetStringResourse("direction")
	lv1.SingleLineLayout.Label.Width = lv1.Width - 10dip
	
	Library.SetDivider(lv1,Library.Theme_Header,1)
	lv1.TwoLinesLayout.Label.TextColor = Colors.Black
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.GetStore(Me,"StoreDetails_receive","0")
	
End Sub

Sub StoreDetails_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	Dim data As Map
	Dim l As List
	
	If res.Get("data") Is List Then
		l = res.Get("data")
		data = l.Get(0)
	Else
		data = res.Get("data")
	End If
	
	lblname.Text = data.Get("store_name")
	lblphone.Text = data.Get("store_telephone")
	lblfax.Text = data.Get("store_fax")
	
	If lblfax.Text.Length = 0 Then lblfax.Text = "-"
	
	lbladdress.Text = Library.GetStringResourse("shop_address") & data.Get("store_address")
	lblemail.Text = Library.GetStringResourse("shop_email") & data.Get("store_email")
	lblowner.Text = Library.GetStringResourse("shop_owner") & data.Get("store_owner")
	lblurl.Text = Library.GetStringResourse("url")
	lblcomment.Text = data.Get("store_comment")
	
	If lblcomment.Text.Length = 0 Then lblcomment.Text = Library.GetStringResourse("no_comment")
	
	Dim image As String
'	image = data.Get("store_image")
'	
'	If image.Length = 0 Or image = Null Then
	image = data.Get("thumb")
'	End If
	
	Dim glide As AriaGlide
	glide.Load(image).AsBitmap.Resize(Abs(imglogo.Width),Abs(imglogo.Height)).CenterCrop.IntoImageView(imglogo)
	
	For Each v1 As View In Activity.GetAllViewsRecursive
		If v1 Is Label Then
			Dim te As Label
			te = v1
			If te.Text.ToLowerCase = "null" Then te.Text = "-"	
		End If
	Next
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
	Activity.Finish
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub btnlist_Click

	If lv1.Size = 0 Then
		pnlloading.SetVisibleAnimated(500,True)
		Dim op As OpenCart
		op.Initialize
		op.GetStore(Me,"StoreList_receive","")
	Else
		pnlstores.SetVisibleAnimated(500,True)
	End If
	
End Sub

Sub StoreList_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	Dim data As List
	data = res.Get("data")
	
	For i = 0 To data.Size - 1
		Dim m1 As Map
		m1 = data.Get(i)
		lv1.AddSingleLine2(m1.Get("name") & " [ " & m1.Get("store_id") & " ]",m1.Get("store_id"))
	Next
	
	pnlstores.SetVisibleAnimated(500,True)
	
End Sub

Sub btncancel_Click
	pnlstores.SetVisibleAnimated(500,False)	
End Sub

Sub lv1_ItemClick (Position As Int, Value As Object)
	ToastMessageShow(Library.GetStringResourse("default_shop"),False)
	Library.manager.SetString("store_id",Value)
	Library.StoreID = Value
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		
		If pnlstores.Visible = True Then
			pnlstores.SetVisibleAnimated(500,False)
		Else
			Activity.Finish
		End If
		
		Return True
	
	Else If KeyCode = 24 Or KeyCode = 25 Then
		Library.CurrentModule = Me
		CallSubDelayed(GoogleVoices,"Listen")
		Return True
		
	End If
	
End Sub

Sub CloseMe
	Activity.Finish
End Sub