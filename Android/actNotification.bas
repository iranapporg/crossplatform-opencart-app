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
	Public Data,Title,ButtonText,Value,sType As String
End Sub

Sub Globals
	Private lblnotify As Label
	Private btnOK As Button
	Private lbltitle As Label
	Private imgpush As ImageView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("frmnotify")
	Activity.Color  = Colors.Transparent
	lblnotify.Text = Data.Replace("\n",CRLF)
	
	Library.ChangeStatusColor
	
	If Library.IsPersian Then
		lblnotify.Gravity = Bit.Or(Gravity.RIGHT,Gravity.TOP)
	Else
		lblnotify.Gravity = Bit.Or(Gravity.LEFT,Gravity.TOP)
	End If
	
	If sType = "picture" Then
		imgpush.Visible = True
		lblnotify.Visible = True
		Dim glide As AriaGlide
		glide.Load(Value).AsBitmap.Resize(Abs(imgpush.Width),Abs(imgpush.Height)).CenterCrop.IntoImageView(imgpush)
	Else
		imgpush.Visible = False
		lblnotify.Visible = True
	End If
	
	btnOK.Text = ButtonText
	lbltitle.Text = Title
	Library.LabelSpace(lblnotify,2)
	
	Dim mp As MediaPlayer
	mp.Initialize2("")
	mp.Load(File.DirAssets,"notify.mp3")
	mp.Play
	
	lblnotify.Typeface = Library.GetFont
	
	Dim p2 As PhoneWakeState
	p2.KeepAlive(True)
	
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

Sub btnOK_Click
	
	If sType = "link" Then
		If Value.Length > 0 Then 
			Try
				Dim op As PhoneIntents
				StartActivity(op.OpenBrowser(Value))
			Catch
			End Try
		End If
		
		Activity.Finish
	
	Else if sType = "product" Then
		Library.OpenProductFromPush	=	Value
		StartActivity(Main)
		'actProduct.product = CreateMap("product_id" : Value)
	
	Else
		Activity.Finish
		
	End If
	
End Sub