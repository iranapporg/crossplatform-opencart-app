Type=StaticCode
Version=2
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@

Sub Process_Globals

End Sub

Public Sub AddProductDescription2Cache(Product As Map)
	
	Dim cache As Map
	cache.Initialize
	
	If File.Exists(File.DirInternal,"cache") Then
		cache = File.ReadMap(File.DirInternal,"cache")
	End If
	
	If cache.ContainsKey(Product.Get("id")) = False Then
		cache.Put(Product.Get("id"),Product)
	End If
	
	File.WriteMap(File.DirInternal,"cache",cache)
	
End Sub

Public Sub GetProductDescriptionFromCache(sID As String)
	
	Dim cache As Map
	cache.Initialize
	
	If File.Exists(File.DirInternal,"cache") Then
		cache = File.ReadMap(File.DirInternal,"cache")
	Else
		Null
	End If
	
	If cache.ContainsKey("sID") Then
		Return cache.Get(sID)
	Else
		Return Null
	End If
	
End Sub

Public Sub AddProducts2Cache(Products As List)
	
	File.WriteMap(File.DirInternal,"cache_products",Products)
	
End Sub