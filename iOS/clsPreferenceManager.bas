Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'++++++++++++++++++++++++++++++++++++++
'Class-Name	:	clsPreferenceManager
'Version	:	1.00
'Autor		:	Filippo Gozza
'++++++++++++++++++++++++++++++++++++++

'Class module
Sub Class_Globals
	Private sql1 As SQL
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	If sql1.IsInitialized Then sql1.Close
	sql1.Initialize(File.DirLibrary, "pm.dat", True)
	CreateTable
End Sub

Public Sub SetBoolean(key As String, value As Boolean)
	PutSimple(key, value)
End Sub

Public Sub GetBoolean(key As String) As Boolean
	Return GetSimpleBoolean(key)
End Sub

Public Sub SetString(key As String, value As String)
	PutSimple(key, value)
End Sub

Public Sub GetString(key As String) As String
	Return GetSimpleString(key)
End Sub

Public Sub GetAll As Map
	Dim c As ResultSet= sql1.ExecQuery("SELECT * FROM main")
	Dim res As Map
	res.Initialize
	Do While c.NextRow	
		res.put(c.GetString2(0),c.GetString2(1))
	Loop
	Return res
End Sub

'creates the main table (if it does not exist)
Private Sub CreateTable
	sql1.ExecNonQuery("CREATE TABLE IF NOT EXISTS main(key TEXT PRIMARY KEY, value NONE)")
End Sub

Private Sub getCursor(Key As String) As ResultSet
	Return sql1.ExecQuery2("SELECT value FROM main WHERE key = ?", Array As String(Key))
End Sub

'Returns a "simple" value. See PutSimple.
Private Sub GetSimpleString(Key As String) As String
	Dim c As ResultSet = getCursor(Key)
	If c.NextRow = False Then 
		c.Close
		Return ""
	End If
	Dim res As String = c.GetString2(0)
'	Log("res=" & res)
	c.Close
	Return res
End Sub

'Returns a "simple" value. See PutSimple.
Private Sub GetSimpleBoolean(Key As String) As Boolean
	Dim c As ResultSet = getCursor(Key)
	If c.NextRow = False Then 
		c.Close
		Return ""
	End If
	Dim res As String = c.GetString2(0)
	c.Close
	If res = 1 Then
		Return True
	Else
		Return False
	End If
End Sub

'Puts a simple value in the store.
'Strings and number types are considered "simple" values.
Private Sub PutSimple(Key As String, Value As Object) As Boolean
	Try
		start(Key)
		insertQuery(Key, Value)
		Return complete(True)
	Catch
		Return complete(False)
	End Try
End Sub

Private Sub start (Key As String)
	sql1.BeginTransaction
	sql1.ExecNonQuery2("DELETE FROM main WHERE key = ?", Array As Object(Key))
End Sub

Private Sub insertQuery(Key As String, Value As Object)
	sql1.ExecNonQuery2("INSERT INTO main VALUES(?, ?)", Array As Object(Key, Value))
End Sub

Private Sub complete(success As Boolean) As Boolean
	If success Then
		sql1.TransactionSuccessful
	Else
		Log("Error saving object: " & LastException)
		sql1.Rollback
	End If
	Return success
End Sub

'Closes the store.
Public Sub Close
	sql1.Close
End Sub
