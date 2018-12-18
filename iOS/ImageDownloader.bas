Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Class module
Sub Class_Globals
	Private tasks As Map
	Private ongoingTasks As Map
	Private setting As Settings
End Sub

Public Sub Initialize
	tasks.Initialize
	setting.Initialize
	ongoingTasks.Initialize
End Sub

Public Sub Download (ImageViewsMap As Map)
	For Each iv As ImageView In ImageViewsMap.Keys
		Dim link As String = ImageViewsMap.Get(iv)
		tasks.Put(iv, link)
		If ongoingTasks.ContainsKey(link) = False Then
		
			If File.Exists(File.DirLibrary,Library.GetFilename(link)) Then
				iv.Bitmap = ResizeBitmap(LoadBitmap(File.DirLibrary,Library.GetFilename(link)),1.5)
			Else
				ongoingTasks.Put(link, "")
				Dim j As HttpJob
				j.Initialize(link, Me)
				j.Download(link.Replace(" ","%20"))
			End If
			
		End If
	Next
End Sub

Private Sub JobDone(Job As HttpJob)

	ongoingTasks.Remove(Job.JobName)
	
	If Job.Success Then
		Dim bmp As Bitmap = Job.GetBitmap
		If tasks.IsInitialized Then
			For Each iv As ImageView In tasks.Keys
				Dim link As String = tasks.Get(iv)
				If link = Job.JobName Then
					tasks.Remove(iv)
					iv.Bitmap = bmp
					If setting.GetBoolean("cache") = False Then
						SavePicture(bmp,Library.GetFilename(Job.JobName))
					End If
				End If
			Next
		End If
	Else
		Log("Error downloading image: " & Job.JobName & CRLF & Job.ErrorMessage)
	End If
	
	Job.Release
	
End Sub

Sub SavePicture(b1 As Bitmap,filename As String)
	Dim out As OutputStream
	out = File.OpenOutput(File.DirLibrary,filename,False)
	b1.WriteToStream(out,100,"PNG")
	out.Close
End Sub

'get extension of filename
Sub GetFileExt(FullPath As String) As String
  Return FullPath.SubString(FullPath.LastIndexOf(".")+1)
End Sub

Sub ResizeBitmap(bmp As Bitmap, scale As Float) As Bitmap
   Dim img As ImageView
   img.Initialize("")
   img.Width = bmp.Width * scale
   img.Height = bmp.Height * scale
   Dim cvs As Canvas
   cvs.Initialize(img)
   cvs.DrawBitmap(bmp, cvs.TargetRect)
   Dim res As Bitmap = cvs.CreateBitmap
   cvs.Release
   Return res
End Sub