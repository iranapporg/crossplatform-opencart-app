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
	Public link As String
	Public images As List
End Sub

Sub Globals
	Private pnl1 As Panel
	Dim touch As TouchImageView
	Private svH As HorizontalScrollView
	Private svV As ScrollView
	Private btnclose As Button
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	
	Activity.LoadLayout("frmpicture")
	
	Library.ChangeStatusColor
	
	Dim glide As AriaGlide

	touch.Initialize("touchme")
	touch.TouchEnabled = True
	touch.MaxScale = 5
	touch.MinScale = 0.5
	Activity.AddView(touch,10dip,10dip,100%x-10dip,100%y-10dip)
	
	pnl1.Color = Colors.Transparent
	Activity.Color = Colors.White
	
	touch.PreScale(1,pnl1.Width,pnl1.Height)
	Dim SourceImageRect, TouchImageViewRect As Rect
	touch.TranslatePadding=128dip
	touch.Gravity=Gravity.FILL
	
	svH.BringToFront
	btnclose.BringToFront
	svV.BringToFront
	
	Dim left,top As Int = 10
	left = 20
	
	svH.Panel.Color = Colors.Transparent

	For i = 0 To images.Size - 1
		
		Dim link As String
		link = images.Get(i)
		link = link.Replace(" ","%20")
		
		Dim img As ImageView
		img.Initialize("imgclick")
		
		If Activity.Height > Activity.Width Then
			svH.Panel.AddView(img,left,0,svH.Height-10,svH.Height-10)
			left = left + svH.Height + 4dip
		Else
			svV.Panel.AddView(img,0,top,svV.Width-10,svV.Width-10)
			top = top + svV.Width + 4dip
		End If
		
		Dim filename As String
		filename = Library.GetFilename(link)
		
		If filename = "null" Or filename.Length = 0 Then
			img.Gravity = Gravity.FILL
			img.SetBackgroundImage(LoadBitmap(File.DirAssets,"alert.png"))
			
		Else If File.Exists(File.DirInternal,filename) = True Then
			glide.Load($"${File.DirInternal}/${filename}"$).AsBitmap.Resize(Abs(img.Width),Abs(img.Height)).CenterCrop.IntoImageView(img)
			If i = 0 Then
				Try
					Dim b1 As Bitmap
					b1.Initialize(File.DirInternal,filename)
					SourceImageRect.Initialize(0, 0, b1.Width, b1.Height)
					TouchImageViewRect.Initialize(0, 0, touch.Width, touch.Height)
					touch.ScaleSrcRectToDestRect(SourceImageRect, TouchImageViewRect, "CENTER")
					touch.SetBitmap(LoadBitmap(File.DirInternal,filename))
				Catch
				End Try
			End If
		Else
			img.Tag = filename
			glide.Load(link).AsBitmap.Resize(Abs(img.Width),Abs(img.Height)).CenterCrop.IntoTarget("target",img)
		End If
		
		img.Tag = filename
			
	Next
	
	svH.Panel.Width = left
	svV.Panel.Height = top
		
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub touchme_Click(X As Int, Y As Int)
	
	If svH.Visible = False Then
		svH.SetVisibleAnimated(500,True)
	Else
		svH.SetVisibleAnimated(500,False)
	End If
	
End Sub

Sub imgclick_Click
	
	Dim im As ImageView
	im = Sender
	
	touch.SetBitmap(LoadBitmap(File.DirInternal,im.Tag))
	
End Sub

Sub target_Success(Bitmap1 As Bitmap, Tag As Object)
	
	Dim im As ImageView
	im = Tag
	
	Dim glide As AriaGlide
	
	If File.Exists(File.DirInternal,im.Tag) = False Then
		Dim ou As OutputStream
		ou = File.OpenOutput(File.DirInternal,im.Tag,False)
		Bitmap1.WriteToStream(ou,100,"PNG")
		ou.Close
	End If
	
	glide.Load($"${File.DirInternal}/${im.Tag}"$).AsBitmap.Resize(Abs(im.Width),Abs(im.Height)).CenterCrop.IntoImageView(im)
	
	Dim b1 As Bitmap
	Dim SourceImageRect, TouchImageViewRect As Rect
	b1.Initialize(File.DirInternal,im.Tag)
	SourceImageRect.Initialize(0, 0, b1.Width, b1.Height)
	TouchImageViewRect.Initialize(0, 0, touch.Width, touch.Height)
	touch.ScaleSrcRectToDestRect(SourceImageRect, TouchImageViewRect, "CENTER")
	touch.SetBitmap(LoadBitmap(File.DirInternal,im.Tag))
	
End Sub