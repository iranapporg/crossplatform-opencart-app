Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@

Sub Process_Globals

End Sub

Public Sub Bookmarks(Product As Map) As Boolean
	
	Dim m1 As Map
	m1.Initialize
	
	If ExistsFile Then
		m1 = File.ReadMap(File.DirLibrary,"bookmarks")
	End If
	
	If m1.ContainsKey(Product.Get("id")) = False Then
		Dim js As JSONGenerator
		js.Initialize(Product)
		
		m1.Put(Product.Get("id"),js.ToString)
		File.WriteMap(File.DirLibrary,"bookmarks",m1)
		
		Return True
	Else
		m1.Remove(Product.Get("id"))
		File.WriteMap(File.DirLibrary,"bookmarks",m1)
		Return False
	End If
	
End Sub

Public Sub CheckID(sID As String) As Boolean
	
	Dim m1 As Map
	m1.Initialize
	
	If ExistsFile Then
		m1 = File.ReadMap(File.DirLibrary,"bookmarks")
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
		m1 = File.ReadMap(File.DirLibrary,"bookmarks")
		
		If m1.Size > 0 Then
			For Each v1 As String In m1.Values
				Dim te As Map
				Dim j As JSONParser
				j.Initialize(v1)
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
		map1 = File.ReadMap(File.DirLibrary,"bookmarks")
		Return map1.Size
	Else
		Return 0
	End If
	
End Sub

Sub ExistsFile As Boolean
	Return File.Exists(File.DirLibrary,"bookmarks")
End Sub