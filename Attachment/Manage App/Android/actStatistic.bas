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

End Sub

Sub Globals
	Private ulv As UltimateListView
	Private progress As ShowProgress
	Dim button As Button
	Private RowsLabelViews As Map
	Dim Reports As List ' collection of data
	Dim lang As String
	Private lblcity2 As Label
	Private lblregister2 As Label
	Private lblip2 As Label
	Private lblname2 As Label
	Private lblnumber2 As Label
	Private lblheader1 As Label
	Private lblheader2 As Label
	Private pnlulv As Panel
	Private pnlheader As Panel
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp
	
	Activity.LoadLayout("frmstatistic")
	
	lang = File.ReadString(File.DirInternal,Library.LanguageFilename)
	
	ulv.Initialize(0, 0, "", "ULV")
	ulv.FastScroller(True)
	
	Dim cd As ColorDrawable
	cd.Initialize(Colors.Transparent,0)
	ulv.PressedDrawable = cd
	
	pnlulv.AddView(ulv, 0,0,pnlulv.Width,pnlulv.Height)
	ulv.Visible = False
	
	RowsLabelViews.Initialize
	progress.Initialize(Activity)
	
	progress.ShowProgress(Library.GetStringResourse("downloading"))
	
	Dim hu As HttpJob
	hu.Initialize("statistics",Me)
	hu.Download(Library.URL & "method=statistics")
	
	button.Initialize("btnclose")
	button.Typeface = Typeface.LoadFromAssets("icomoon.ttf")
	button.Text = ""
	button.TextColor = Colors.White
	button.Visible = False
	
	Dim cd As ColorDrawable
	cd.Initialize(Library.ThemeColor,50)
	button.Background = cd
	
	Activity.AddView(button,100%x-60dip,100%y-60dip,50dip,50dip)
	
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub ShowHeader
	
	lblheader1.Text = Library.GetStringResourse("statistic_title")  & " [ " & Reports.Size & " ]"
	lblheader2.Text = Library.GetStringResourse("extra")
	lblname2.Text = " " & Library.GetStringResourse("name")
	lblregister2.Text = " " & Library.GetStringResourse("time")
	lblip2.Text = " " & Library.GetStringResourse("ip")
	lblcity2.Text = " " & Library.GetStringResourse("city")
	
	lblcity2.Color = Library.ThemeColor
	lblip2.Color = Library.ThemeColor
	lblregister2.Color = Library.ThemeColor
	lblname2.Color = Library.ThemeColor
	lblheader2.Color = Library.ThemeColor
	lblheader1.Color = Library.ThemeColor
	lblnumber2.Color = Library.ThemeColor
	
End Sub

Sub JobDone(Job As HttpJob)

	If Job.Success Then
		If Job.JobName = "statistics" Then
			
			Dim js As JSONParser
			Dim ma As Map
			
			js.Initialize(Job.GetString2("UTF8"))
			ma = js.NextObject
			Reports = ma.Get("data")
			
			ShowHeader
			
			progress.HideProgress
			button.Visible = True
			
			ulv.AddLayout("Items","Items_LayoutCreator","Items_ContentFiller",40dip,True)
			ulv.BulkAddItems(Reports.Size,"Items",1)
	
			ulv.Visible = True
			
		End If
		
	End If
	
End Sub

Sub ParseDate(Date As String) As String
	
	If Date.StartsWith("0000-00-00") Then
		If Date.IndexOf(" ") > -1 Then
			Dim t() As String
			t = Regex.Split(" ",Date)
			Return t(0)
		Else
			Return Date
		End If
	End If
	
	Dim sa(),da() As String
	sa = Regex.Split(" ",Date)
	da = Regex.Split("-",sa(0))
	
	Try
		Dim per As PersianDate
		Return per.getDate(da(0),da(1),da(2),"/")
	Catch
		Return Date
	End Try
	
End Sub

Sub lblitem_Click
	
	Dim lb As Label
	lb = Sender
	
	Dim ls As List
	ls = RowsLabelViews.Get(lb.Tag)
	
	For i = 0 To ls.Size - 1
		Dim l2 As Label
		l2 = ls.Get(i)
		l2.SetColorAnimated(300,Library.ThemeColor,Colors.White)
	Next
	
	Dim res As Map
	res = Reports.Get(lb.Tag)
	
	actDetailsOfReportItem.Data = res
	StartActivity(actDetailsOfReportItem)
	
End Sub

Sub btnClose_Click
	Activity.Finish
End Sub

Sub Items_LayoutCreator(LayoutName As String, LayoutPanel As Panel)
	LayoutPanel.LoadLayout("frmitem_report")
End Sub

Sub Items_ContentFiller(ItemID As Long, LayoutName As String, LayoutPanel As Panel, Position As Int)
	
	Dim lblnumber,lblname,lblip,lblcity,lblregister As Label
	Dim imgsimcard As ImageView
	
	Dim parent As Panel
	parent = LayoutPanel
	
	lblnumber	= parent.GetView(0)
	lblname		= parent.GetView(1)
	lblip		= parent.GetView(2)
	lblregister = parent.GetView(3)
	imgsimcard	= parent.GetView(4)
	lblcity		= parent.GetView(5)
	
	Dim da As Map
	da = Reports.Get(Position)
	
	Dim sim As String
	Dim date As String
	
	sim = da.Get("sSIM")
	date = da.Get("sDateTime")
	
	If lang = "fa" Then
		da.Put("sDateTime",ParseDate(date))
	Else
		Dim te() As String
		te = Regex.Split(" ",date)
		da.Put("sDateTime",te(0))
	End If
	
	lblnumber.Text = Position + 1
	
	Select sim.ToLowerCase
		
		Case "irancell"
		Case "mtn irancell"
			imgsimcard.SetBackgroundImage(LoadBitmap(File.DirAssets,"irancell.png"))
		
		Case "ir-tci"
			imgsimcard.SetBackgroundImage(LoadBitmap(File.DirAssets,"ir-tci.png"))
		
		Case "rightel"
			imgsimcard.SetBackgroundImage(LoadBitmap(File.DirAssets,"rightel.png"))

		Case Else
			imgsimcard.SetBackgroundImage(LoadBitmap(File.DirAssets,"simcard.png"))
										
	End Select
	
	Dim name As String
	name = da.Get("sDeviceName")
	If name.IndexOf(" : ") > -1 Then
		Dim t() As String
		t = Regex.Split(" : ",name)
		name = t(0)
	End If
	
	lblname.Text	= name & $" Android ${da.Get("sAndroidVersion")}"$
	lblip.Text		= da.Get("sIP")
	lblregister.Text = da.Get("sDateTime")
	
	Dim ip_info As Map
	ip_info = Library.Json2Map(da.Get("sIPInfo"))
	lblcity.Text	= ip_info.Get("country") & ":" & ip_info.Get("city")
			
End Sub

Sub ULV_ItemClick(ItemID As Long, Position As Int, ClickedPanel As Panel)
	
	ClickedPanel.Visible = False
	ClickedPanel.SetVisibleAnimated(600,True)
	
	Dim res As Map
	res = Reports.Get(Position)
	
	actDetailsOfReportItem.Data = res
	StartActivity(actDetailsOfReportItem)
	
End Sub

Sub ULV_Scrolled(FirstVisibleItem As Int, VisibleItemCount As Int, TotalItemCount As Int, IsAtTop As Boolean, IsAtBottom As Boolean)
	
	If IsAtTop Then
		If pnlheader.Top = -pnlheader.Height	Then
			pnlheader.SetLayoutAnimated(600,0,0,pnlheader.Width,pnlheader.Height)
			pnlulv.SetLayoutAnimated(600,0,pnlheader.Height,pnlulv.Width,100%y - pnlheader.Height)
			ulv.Height = 100%y - pnlheader.Height
		End If
		Return
	End If
	
	If VisibleItemCount > 6 And TotalItemCount > 10 Then
		If pnlheader.Top <> -pnlheader.Height	Then
			pnlheader.SetLayoutAnimated(600,0,-pnlheader.Height,pnlheader.Width,pnlheader.Height)
			pnlulv.SetLayoutAnimated(600,0,0,pnlulv.Width,100%y)
			ulv.Height = 100%y
		End If
	End If
	
End Sub