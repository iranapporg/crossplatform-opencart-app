Type=Class
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@

Private Sub Class_Globals
	Private sql1 As SQL
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize

	If File.Exists(File.DirInternal,"cache_datas") = False Then
		sql1.Initialize(File.DirInternal,"cache_datas",True)
		sql1.ExecNonQuery("CREATE TABLE cache (ID TEXT,Data TEXT,sType TEXT)")
	Else
		sql1.Initialize(File.DirInternal,"cache_datas",False)
	End If
	
End Sub

Sub AddMap2Cache(ID As String,Data As Map,sType As String)
	
	Return
	
	If Data = Null Then Return
	If Data.IsInitialized = False Then Return
	
	Try
		Dim js As JSONGenerator
		js.Initialize(Data)
			
		sql1.ExecNonQuery2("INSERT INTO cache VALUES(?,?,?)",Array As Object(ID,js.ToString,sType))
	Catch
	End Try
	
End Sub

Sub AddList2Cache(ID As String,Data As List,sType As String)
	
	Return
	
	If ExistID(ID,sType) Then Return
	If Data = Null Then Return
	If Data.IsInitialized = False Then Return
	
	Dim d1 As List
	
	Try
		If Data.IsInitialized = False Then Return
		d1 = Data
	Catch
		d1 = Data	
	End Try
	
	Try
		Dim js As JSONGenerator
		js.Initialize2(d1)
			
		sql1.ExecNonQuery2("INSERT INTO cache VALUES(?,?,?)",Array As Object(ID,js.ToString,sType))
	Catch
	End Try
	
End Sub

Public Sub ExistID(ID As String,sType As String) As Boolean
	
	Return False
	
	Try
		Dim res As ResultSet
		res = sql1.ExecQuery2("SELECT * FROM cache WHERE ID =? AND sType = ?",Array As String(ID,sType))
		
		If res.RowCount = 0 Then
			Return False
		Else
			Return True
		End If
	Catch
		Return False
	End Try
	
End Sub

Public Sub ExistType(sType As String) As Boolean
	
	Return False
	
	Try
		Dim res As ResultSet
		res = sql1.ExecQuery2("SELECT * FROM cache WHERE sType = ?",Array As String(sType))
		
		If res.RowCount = 0 Then
			Return False
		Else
			Return True
		End If
	Catch
		Return False
	End Try
	
End Sub

public Sub GetCacheAsMap(ID As String,sType As String) As Map
	
	Return Null
	
	Try
		Dim res As ResultSet
		res = sql1.ExecQuery2("SELECT * FROM cache WHERE ID =? AND sType = ?",Array As String(ID,sType))
		
		If res.RowCount = 0 Then
			Return Null
		Else
			res.Position = 0
			Dim js As JSONParser
			js.Initialize(res.GetString("Data"))
			Return js.NextObject
		End If
	Catch
		Return Null
	End Try
	
End Sub

Sub GetCacheAsList(ID As String,sType As String) As List
	
	Return Null
	
	Dim res As ResultSet
	
	Dim sql As String
	sql = $"SELECT * FROM cache WHERE ID ="${ID}" AND sType ="${sType}""$
	
	Try
		res = sql1.ExecQuery(sql)
		
		If res.RowCount = 0 Then
			Return Null
		Else
			res.Position = 0
			Dim js As JSONParser
			js.Initialize(res.GetString("Data"))
			Return js.NextArray
		End If
	Catch
		Return Null
	End Try
	
End Sub

Sub ClearCache
	
	sql1.ExecNonQuery("DELETE FROM cache")
	
End Sub

Sub ClearCache2(sType As String)
	
	sql1.ExecNonQuery2("DELETE FROM cache WHERE ID =? AND sType = ?",Array As String(sType,sType))
	
End Sub

Sub DeleteItem(ID As String,sType As String)
	
	sql1.ExecNonQuery2("DELETE FROM cache WHERE ID=? AND sType = ?",Array As Object(ID,sType))
	
End Sub

Sub GetRowsCache As Int
	
	Dim res As ResultSet
	
	Dim sql As String
	sql = $"SELECT * FROM cache"$
	res = sql1.ExecQuery(sql)
	Return res.RowCount
	
End Sub