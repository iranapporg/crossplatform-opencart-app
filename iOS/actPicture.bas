Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private svH As ScrollView
	Private svV As ScrollView
	Private btnclose As Button
	Public link As String
	Public images As List
	Private wb1 As WebView
End Sub

Sub StartActivity

	Dim pg As Page
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmpicture")
	Library.NavControl.ShowPage(pg)
	
	pg.RootPanel.Color = Colors.White
	Library.SetFont(btnclose,"icomoon",btnclose.CustomLabel.Font.Size)
	
	svH.BringToFront
	btnclose.BringToFront
	svV.BringToFront
	
	Dim left,top As Int = 10
	left = 20
	
	svH.Panel.Color = Colors.Transparent
	
	Dim images_1 As Map
	images_1.Initialize
	
	For i = 0 To images.Size - 1
		
		Dim link As String
		link = images.Get(i)
		
		Dim img As ImageView
		img.Initialize("imgclick")
		
		If Library.getHeight > Library.GetWidth Then
			svH.Panel.AddView(img,left,0,svH.Height-10,svH.Height-10)
			left = left + svH.Height + 4dip
		Else
			svV.Panel.AddView(img,0,top,svV.Width-10,svV.Width-10)
			top = top + svV.Width + 4dip
		End If
		
		Dim filename As String
		filename = Library.GetFilename(link)
		
		images_1.Put(img,link)
		
		img.Tag = filename
		
		If i = 0 Then
			wb1.LoadHtml($"<img width="100%" src="${File.Combine(File.DirLibrary,filename)}" />"$)
		End If
	
	Next
	
	Dim download As ImageDownloader
	download.Initialize
	download.Download(images_1)
	
	svH.Panel.Width = left
	svH.ContentWidth = left
	svH.ContentHeight = svH.Height
	svV.Panel.Height = top
	svV.ContentHeight = top
	
End Sub

Sub imgclick_Click

	Dim im As ImageView
	im = Sender

	wb1.LoadHtml($"<img width="100%" src="${File.Combine(File.DirLibrary,im.Tag)}" />"$)
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.LastPage)
End Sub