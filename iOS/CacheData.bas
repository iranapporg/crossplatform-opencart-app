Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@

Sub Process_Globals
	Public DirCache As String = File.DirTemp
End Sub

Public Sub AddProductDescription2Cache(Product As Map)
	
	Dim Cache As Map
	Cache.Initialize
	
	If File.Exists(DirCache,"caches") Then
		Cache = File.ReadMap(DirCache,"caches")
	End If
	
	If Cache.ContainsKey(Product.Get("id")) = False Then
		Dim js As JSONGenerator
		js.Initialize(Product)
		Cache.Put(Product.Get("id"),js.ToString)
	End If
	
	File.WriteMap(DirCache,"caches",Cache)
	
End Sub

Public Sub GetProductDescriptionFromCache(sID As String) As Map
	
	Dim Cache As Map
	Cache.Initialize
	
	If File.Exists(DirCache,"caches") Then
		Cache = File.ReadMap(DirCache,"caches")
	Else
		Return Null
	End If
	
	If Cache.ContainsKey(sID) Then	
		Dim js As JSONParser
		js.Initialize(Cache.Get(sID))
		Return js.NextObject
	Else
		Return Null
	End If
	
End Sub

Public Sub AddCategory2Cache(Category As List,sID As String)
	
	Dim Cache As Map
	Cache.Initialize
	
	If File.Exists(DirCache,"cache_category2") Then
		Cache = File.ReadMap(DirCache,"cache_category2")
	End If
	
	If Cache.ContainsKey(sID) = False Then
		Dim js As JSONGenerator
		js.Initialize2(Category)
		Cache.Put(sID,js.ToString)
	End If
	
	File.WriteMap(DirCache,"cache_category2",Cache)
	
End Sub

Public Sub GetCategoryFromCache(sID As String) As List
	
	Dim Cache As Map
	Cache.Initialize
	
	If File.Exists(DirCache,"cache_category2") Then
		Cache = File.ReadMap(DirCache,"cache_category2")
	Else
		Return Null
	End If
	
	If Cache.ContainsKey(sID) Then
		Dim js As JSONParser
		js.Initialize(Cache.Get(sID))
		Return js.NextArray
	Else
		Return Null
	End If
	
End Sub

Public Sub AddProducts2Cache(Products As List,sID As String)
	
	If Products = Null Then Return
	
	Dim Cache As Map
	Cache.Initialize
	
	If File.Exists(DirCache,"cache_category_product2") Then
		Cache = File.ReadMap(DirCache,"cache_category_product2")
	End If
	
	If Cache.ContainsKey(sID) = False Then
		Dim js As JSONGenerator
		js.Initialize2(Products)
		Cache.Put(sID,js.ToString)
	End If
	
	File.WriteMap(DirCache,"cache_category_product2",Cache)
		
End Sub

Public Sub GetProductsFromCache(sID As String) As List
	
	Dim cache As Map
	cache.Initialize
	Log(File.Exists(DirCache,"cache_category_product2"))
	If File.Exists(DirCache,"cache_category_product2") Then
		cache = File.ReadMap(DirCache,"cache_category_product2")
	Else
		Return Null
	End If
	
	If cache.ContainsKey(sID) = False Then
		Return Null
	Else
		Dim js As JSONParser
		js.Initialize(cache.Get(sID))
		Return js.NextArray
	End If
	
End Sub

Public Sub ExistCacheProducts As Boolean
	Return File.Exists(DirCache,"cache_category_product2")
End Sub

Public Sub AddMap2Cache(Data As Map,sID As String)
	
	Dim cache As Map
	cache.Initialize
	
	If File.Exists(DirCache,"cache_string_file") Then
		cache = File.ReadMap(DirCache,"cache_string_files")
	End If
	
	If cache.ContainsKey(sID) = False Then
		Dim js As JSONGenerator
		js.Initialize(Data)
		cache.Put(sID,js.ToString)
	End If
	
	File.WriteMap(DirCache,"cache_string_files",cache)
	
End Sub

Public Sub GetMapFromCache(sID As String) As Map
	
	Dim cache As Map
	cache.Initialize
	
	If File.Exists(DirCache,"cache_string_files") Then
		cache = File.ReadMap(DirCache,"cache_string_files")
	Else
		Return Null
	End If
	
	If cache.ContainsKey(sID) = False Then
		Return Null
	Else
		Dim js As JSONParser
		js.Initialize(cache.Get(sID))
		Return js.NextObject
	End If
	
End Sub

Public Sub DeleteCache
	
	Dim ls As List
	ls = File.ListFiles(DirCache)
	
	If ls.IsInitialized = False Then Return
	
	For i = 0 To ls.Size - 1
		Try
			File.Delete(DirCache,ls.Get(i))
		Catch
		End Try
	Next
	
End Sub