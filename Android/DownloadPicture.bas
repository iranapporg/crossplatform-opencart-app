Type=Class
Version=6.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	Dim picasso As Picasso
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	
	picasso.Initialize
	picasso.SetDebugging(True)
	
End Sub

Public Sub Download(Map As Map)
	
	For i = 0 To Map.Size - 1
		
		Dim target As DefaultTarget
		target.Initialize("Target",Map.GetKeyAt(i))
		picasso.LoadUrl(Map.GetValueAt(i)).SkipCache.Fetch(target)
	Next
	
End Sub

Sub Target_Success(Bitmap1 As Bitmap, Tag As Object)
	
	Log("ok")
	
	Dim im As ImageView
	im = Tag
	im.Bitmap = Bitmap1
	
End Sub