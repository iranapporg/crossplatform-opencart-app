Type=Activity
Version=7.01
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
	Private txtbuttontext As EditText
	Private txtval As EditText
	Private txttype As Spinner
	Private txtmessage As EditText
	Private txttitle As EditText
	Private Toast As MyToastMessageShow
	Private progress As ShowProgress
	Dim sv As ScrollView
	Dim ime As IME
	Private lblheader1 As Label
	Private lblheader2 As Label
	Private btnsend As Button
	Private btncancel As Button
	Private lblbuttontext As Label
	Private lblval As Label
	Private lbltype As Label
	Private lblmessage As Label
	Private lbltitle As Label
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	ime.Initialize("")
	sv.Initialize(2900)
	
	Library.setLocalApp
	
	Activity.AddView(sv,0,0,100%x,100%y)
	sv.Panel.LoadLayout("frmsendpush")
	sv.Color = Library.ThemeColor
	sv.Panel.Color = Library.ThemeColor
	
	For Each v1 As View In sv.Panel.GetAllViewsRecursive
		If v1 Is EditText Then
			Dim t As EditText
			t = v1
			t.Color = Colors.White
			t.TextColor = Colors.Black
		End If
	Next
	
	Dim status As StatusBarCompat
	status.Initialize
	status.StatusBarColor = Library.ThemeColor
	
	lblheader1.Text = Library.GetStringResourse("push_title1")
	lblheader2.Text = Library.GetStringResourse("push_title2")
	
	lbltitle.Text = Library.GetStringResourse("push_label")
	lbltitle.Gravity = Library.GetStringResourse("direction")
	
	lblbuttontext.Text = Library.GetStringResourse("push_button_text")
	lblbuttontext.Gravity = Library.GetStringResourse("direction")
	
	lblmessage.Text = Library.GetStringResourse("push_message")
	lblmessage.Gravity = Library.GetStringResourse("direction")
	
	lbltype.Text = Library.GetStringResourse("push_type")
	lbltype.Gravity = Library.GetStringResourse("direction")
	
	lblval.Text = Library.GetStringResourse("push_value")
	lblval.Gravity = Library.GetStringResourse("direction")
	
	btncancel.Text = Library.GetStringResourse("back")
	btnsend.Text = Library.GetStringResourse("send_push")
	
	txttype.Add(Library.GetStringResourse("push_type_site"))
	txttype.Add(Library.GetStringResourse("push_type_product"))
	txttype.Add(Library.GetStringResourse("push_type_picture"))
	
	txttype.DropdownBackgroundColor = Library.ThemeColor
	txttype.TextColor = Colors.Black
	txttype.Color = Colors.White
	txttype.DropdownTextColor = Colors.White
	
	Toast.Initialize(Activity)
	progress.Initialize(Activity)
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub btnsend_Click
	
	ime.HideKeyboard
	
	If txttitle.Text.Length < 3 Then
		Toast.ShowToastMessageShow(Library.GetStringResourse("error_push_title"),0,False)
		Return	
	End If
	
	If txtmessage.Text.Length < 20 Then
		Toast.ShowToastMessageShow(Library.GetStringResourse("error_push_message"),0,False)
		Return	
	End If
	
	Dim push_type As String
	
	If txttype.SelectedIndex = 0 Then
		push_type = "link"	
'		If txtval.Text.IndexOf(".") = -1 And txtval.Text.IndexOf("www") = -1 Then
'			Toast.ShowToastMessageShow(Library.GetStringResourse("no_push_type_site"),0,False)
'			Return
'		End If
	Else if txttype.SelectedIndex = 1 Then
		push_type = "product"
		If IsNumber(txtval.Text) = False Then
			Toast.ShowToastMessageShow(Library.GetStringResourse("no_push_type_product"),0,False)
			Return	
		End If
	Else if txttype.SelectedIndex = 2 Then
		push_type = "picture"
		If txtval.Text.IndexOf(".") = -1 And txtval.Text.IndexOf("www") = -1 Then
			Toast.ShowToastMessageShow(Library.GetStringResourse("no_push_type_site"),0,False)
			Return	
		End If	
	End If
	
	If txtbuttontext.Text = "" Then txtbuttontext.Text = Library.GetStringResourse("ok")
	
	progress.ShowProgress(Library.GetStringResourse("sending"))
	
	Dim su As StringUtils
	
	Dim hu As HttpJob
	hu.Initialize("send_push",Me)
	hu.Download(Library.URL & $"method=push&title=${su.EncodeUrl(txttitle.Text,"UTF8")}&message=${su.EncodeUrl(txtmessage.Text,"UTF8")}&button_text=${su.EncodeUrl(txtbuttontext.Text,"UTF8")}&push_type=${push_type}&push_val=${su.EncodeUrl(txtval.Text,"UTF8")}"$)
	sv.ScrollPosition = 0
	
End Sub

Sub JobDone(Job As HttpJob)
	
	progress.HideProgress
	sv.ScrollPosition = 0
	
	If Job.Success Then
		If Job.JobName = "send_push" Then

			Dim data As Map
			data = Library.Json2Map(Job.GetString)
			
			If data.Get("result") > -1 Then
				Toast.ShowToastMessageShow(Library.GetStringResourse("sent_push").Replace("0",data.Get("result")),2,True)
				txtmessage.Text = ""
				txttitle.Text = ""
				txttype.SelectedIndex = 0
				txtval.Text = ""
				txtbuttontext.Text = ""
			Else
				Toast.ShowToastMessageShow(Library.GetStringResourse("error_data"),0,False)
			End If
			
		End If	
	End If
	
End Sub

Sub btncancel_Click
	Activity.Finish
End Sub

Sub txttitle_FocusChanged (HasFocus As Boolean)
	sv.ScrollPosition = txttitle.Top
End Sub

Sub txtmessage_FocusChanged (HasFocus As Boolean)
	sv.ScrollPosition = txtmessage.Top	
End Sub

Sub txtval_FocusChanged (HasFocus As Boolean)
	sv.ScrollPosition = txtval.Top
End Sub

Sub txtbuttontext_FocusChanged (HasFocus As Boolean)
	sv.ScrollPosition = txtbuttontext.Top
End Sub