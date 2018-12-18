Type=Service
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
#End Region

Sub Process_Globals
	Private cache As Map
	Private tasks As Map
	Private ongoingTasks As Map
End Sub

Sub Service_Create
	tasks.Initialize
	cache.Initialize
	ongoingTasks.Initialize
End Sub

Sub Service_Start (StartingIntent As Intent)

End Sub

Sub Service_Destroy

End Sub

Sub Download (ImageViewsMap As Map)
	
	For i = 0 To ImageViewsMap.Size - 1
		
		tasks.Put(ImageViewsMap.GetKeyAt(i), ImageViewsMap.GetValueAt(i))
		Dim link As String = ImageViewsMap.GetValueAt(i)
		
		If File.Exists(File.DirInternal,Library.GetFilename(link)) Then
			Dim iv As ImageView = ImageViewsMap.GetKeyAt(i)
			LoadImage(iv,link)
		
		Else If ongoingTasks.ContainsKey(link) = False Then
			ongoingTasks.Put(link, "")
			Dim j As HttpJob
			j.Initialize(link, Me)
			If link.Length < 20 Then Return
			j.Download(link)
		End If
		
	Next
	
End Sub

Sub JobDone(Job As HttpJob)
	
	ongoingTasks.Remove(Job.JobName)
	
	If Job.Success Then
		
		Dim bmp As Bitmap
		
		Try
			If Job.GetBitmap = Null Then
				bmp = LoadBitmap(File.DirAssets,"noimage.png")
			Else
				bmp = Job.GetBitmap
			End If
		Catch
			bmp = LoadBitmap(File.DirAssets,"noimage.png")
		End Try
		
		cache.Put(Job.JobName, bmp)
		
		If tasks.IsInitialized Then
			For i = 0 To tasks.Size - 1
				Dim link As String = tasks.GetValueAt(i)
				If link = Job.JobName Then
					Library.WriteBitmap2File(bmp,Library.GetFilename(Job.JobName))
					Dim iv As ImageView = tasks.GetKeyAt(i)
					LoadImage(iv,Job.JobName)
				End If
			Next
		End If
		
	Else
		Log("Error downloading image: " & Job.JobName & CRLF & Job.ErrorMessage)
	End If
	
	Job.Release
	
End Sub

Sub ActivityIsPaused
	tasks.Clear
End Sub

Sub LoadImage(iv As ImageView,Url As String)
	
	Dim glide As AriaGlide
	
	Dim s1 As String
	s1 = iv.Tag
	
	Dim path As String
	path = $"${File.DirInternal}/${Library.GetFilename(Url)}"$
	
	If s1 = "scale" Then
		glide.Load(path).AsBitmap.Resize(Abs(iv.Width),Abs(iv.Height)).CenterCrop.IntoImageView(iv)	
	Else
		glide.Load(path).AsBitmap.Resize(Abs(iv.Width),Abs(iv.Height)).FitCenter.IntoImageView(iv)
	End If
					
End Sub