Type=Class
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Class_Globals
	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize

End Sub

Public Sub AddNotification(Message As String,DateTimes As Int)
	
	Dim m As Map
	If File.Exists(File.DirInternal,"notification") Then
		m = File.ReadMap(File.DirInternal,"notification")
	Else
		m.Initialize
	End If
	
	m.Put(m.Size + 1 , Library.Map2Json(CreateMap("message":Message,"time":DateTimes)))
	
	File.WriteMap(File.DirInternal,"notification",m)
	
End Sub

Public Sub GetNotificationCount As Int
	
	Dim m As Map
	If File.Exists(File.DirInternal,"notification") Then
		m = File.ReadMap(File.DirInternal,"notification")
		Return m.Size
	Else
		Return 0
	End If
	
End Sub

Public Sub GetNotifications As Map
	
	Dim m As Map
	If File.Exists(File.DirInternal,"notification") Then
		m = File.ReadMap(File.DirInternal,"notification")
		Return m
	Else
		m.Initialize
		Return m
	End If
	
End Sub

Public Sub RemoveNotifications
	File.Delete(File.DirInternal,"notification")
End Sub