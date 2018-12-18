Type=Activity
Version=7.01
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	Public Data As Map
End Sub

Sub Globals
	Dim sv As ScrollView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp
	
	sv.Initialize(0)
	Activity.AddView(sv,0,0,100%x,100%y)
	sv.Color = Colors.White
	sv.Panel.Color = Colors.White
	
	Try
		Dim ip_info,info,all As Map
		ip_info = Library.Json2Map(Data.Get("sIPInfo"))
		info = Library.Json2Map(Data.Get("sInfo"))
		all.Initialize
		
		If ip_info.IsInitialized Then
			For Each d1 As String In ip_info.Keys
				all.Put(d1,ip_info.Get(d1))
			Next
		End If
		
		If info.IsInitialized Then
			For Each d1 As String In info.Keys
				If d1.ToLowerCase = "location" Or d1.ToLowerCase = "country" Then Continue
				all.Put(d1,info.Get(d1))
			Next
		End If
		
		Dim top As Int
		Dim lang As String
		lang = File.ReadString(File.DirInternal,Library.LanguageFilename)
			
		For Each item As String In all.Keys
			
			Dim key As Label
			key.Initialize("")
			key.TextColor = Colors.White
			key.TextSize = 12
			key.Text = "   " & Library.GetStringResourse(item.ToLowerCase) & "   "
			key.Typeface = Typeface.LoadFromAssets("iran sans.ttf")
			
			If lang = "en" Then
				key.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
			Else
				key.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
			End If
			
			key.Color = Library.ThemeColor
			sv.Panel.AddView(key,0,top,100%x,40dip)
			
			top = top + 40dip
			
			Dim val_item As String
			Dim value As Label
			
			val_item = all.Get(item) 
			value.Initialize("lblitem")
			value.TextColor = Colors.RGB(134,134,134)
			value.TextSize = 12
			
			If val_item.ToLowerCase == "false" Then
				val_item = Library.GetStringResourse("no")
			Else if val_item.ToLowerCase == "true" Then
				val_item = Library.GetStringResourse("yes")
			End If
			
			If item.ToLowerCase = "loc" Then
				value.Tag = val_item
			End If
			
			value.Text = "   {b}" & val_item& "{b}   "
			value.Typeface = Typeface.LoadFromAssets("iran sans.ttf")
			
			If lang = "en" Then
				value.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
			Else
				value.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
			End If
			
			value.Color = Colors.White
			Library.BoldString(value.Text ,value)
			sv.Panel.AddView(value,0,top,100%x,40dip)
			
			top = top + 60dip
			
		Next
		
		sv.Panel.Height = top+700
		
	Catch
		Log("Error in activity actDetailsOfReportItem")
	End Try
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub lblitem_Click
	
	Dim la As Label
	la = Sender
	
	If la.Tag = Null Then Return
	
	OpenGoogleMap(la.Tag)
	
End Sub

Sub OpenGoogleMap(location As String)
	
	Dim MapIntent As Intent
	location = "geo:" & location & "?q=" & location
	
	Try
		MapIntent.Initialize(MapIntent.ACTION_VIEW, location)
		StartActivity(MapIntent)
	Catch
	End Try
	
End Sub