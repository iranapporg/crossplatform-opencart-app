Type=StaticCode
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

Sub Process_Globals

End Sub

Public Sub Bookmark(Product As Map) As Boolean
	
	Dim m1 As Map
	m1.Initialize
	
	If ExistsFile Then
		m1 = File.ReadMap(File.DirInternal,"bookmarks")
	End If
	
	If m1.ContainsKey(Product.Get("id")) = False Then
		Dim js As JSONGenerator
		js.Initialize(Product)
		
		m1.Put(Product.Get("id"),js.ToString)
		File.WriteMap(File.DirInternal,"bookmarks",m1)
		
		Return True
	Else
		m1.Remove(Product.Get("id"))
		File.WriteMap(File.DirInternal,"bookmarks",m1)
		Return False
	End If
	
End Sub

Public Sub CheckID(sID As String) As Boolean
	
	Dim m1 As Map
	m1.Initialize
	
	If ExistsFile Then
		m1 = File.ReadMap(File.DirInternal,"bookmarks")
	End If
	
	If m1.ContainsKey(sID) = True Then
		Return True
	Else
		Return False
	End If
	
End Sub

Public Sub GetBookmarks As List

	Dim l1 As List
	l1.Initialize
	
	If ExistsFile Then
		Dim m1 As Map
		m1.Initialize
		m1 = File.ReadMap(File.DirInternal,"bookmarks")
		
		If m1.Size > 0 Then
			For i = 0 To m1.Size - 1
				Dim te As Map
				Dim j As JSONParser
				j.Initialize(m1.GetValueAt(i))
				te = j.NextObject
				l1.Add(te)
			Next
			Return l1
		End If
	End If
	
	Return l1
		
End Sub

Sub BookmarkCount As Int
	
	If ExistsFile Then
		Dim map1 As Map
		map1.Initialize
		map1 = File.ReadMap(File.DirInternal,"bookmarks")
		Return map1.Size
	Else
		Return 0
	End If
	
End Sub

Sub ExistsFile As Boolean
	Return File.Exists(File.DirInternal,"bookmarks")
End Sub