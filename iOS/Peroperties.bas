Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'Public variables can be accessed from all modules.

End Sub

Sub GetDeviceSystemName As String
    ' get the system name of the device
    Dim device As NativeObject
    device = device.Initialize("UIDevice").RunMethod("currentDevice", Null)
    Dim name As Object = device.GetField("systemName").AsString
    Return name
End Sub

Sub GetDeviceModel As String
    ' get the device model
    Dim device As NativeObject
    device = device.Initialize("UIDevice").RunMethod("currentDevice", Null)
    Dim name As Object = device.GetField("model").AsString
    Return name
End Sub

Sub GetDeviceName As String
    ' get the device name
    Dim device As NativeObject
    device = device.Initialize("UIDevice").RunMethod("currentDevice", Null)
    Dim name As Object = device.GetField("name").AsString
    Return name
End Sub

Sub GetIMEI As String
    ' get device unique identifier
    Dim device As NativeObject
    device = device.Initialize("UIDevice").RunMethod("currentDevice", Null)
    Dim name As String = device.GetField("identifierForVendor").AsString 
    Return name
End Sub

Sub GetPackageName As String
   ' get your app package name
   Dim no As NativeObject
   no = no.Initialize("NSBundle").RunMethod("mainBundle", Null)
   Dim name As Object = no.RunMethod("objectForInfoDictionaryKey:", Array("CFBundleIdentifier"))
   Return name
End Sub

Sub GetAppName As String
    ' get app name
   Dim no As NativeObject
   no = no.Initialize("NSBundle").RunMethod("mainBundle", Null)
   Dim name As Object = no.RunMethod("objectForInfoDictionaryKey:", Array("CFBundleDisplayName"))
   Return name
End Sub

Sub GetVersion As String
   Dim no As NativeObject
   no = no.Initialize("NSBundle").RunMethod("mainBundle", Null)
   Dim name As Object = no.RunMethod("objectForInfoDictionaryKey:", Array("CFBundleShortVersionString"))
   Return name
End Sub

Sub GetVendorIdentifier As String
   Dim no As NativeObject
   no = no.Initialize("UIDevice").RunMethod("currentDevice", Null)
   Dim id As Object = no.GetField("identifierForVendor").GetField("UUIDString")
   Return id
End Sub