Type=Class
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
'Class module
Sub Class_Globals
	Private lsheader As ListView
	Private NavDrawer As AHNavigationDrawer
	Private meModule As Object
	Private imgLogo As ImageView
	Private tmrdelay As Timer
	Private value As String
	Private Glide As AriaGlide
	Private excluMenu As List
	Dim sd As SlideDrawable
	Private GravityMenu As Int
	Private Content As Panel
	Private Opended,ClickedItem As Boolean
End Sub

Public Sub Initialize(pContent As Panel,Module As Object)
	
	meModule = Module
	Content = pContent
	
	If Library.IsPersian2(Library.currLang) Then
		NavDrawer.Initialize2("Drawer", pContent, 85%x,NavDrawer.GRAVITY_RIGHT)
		GravityMenu = NavDrawer.GRAVITY_RIGHT
	Else
		NavDrawer.Initialize2("Drawer", pContent, 85%x,NavDrawer.GRAVITY_LEFT)
		GravityMenu = NavDrawer.GRAVITY_LEFT
	End If
	
	Dim xml As XmlLayoutBuilder
	NavDrawer.ShadowDrawable = xml.GetDrawable("drawer_shadow")
	NavDrawer.StatusBarColor = Library.Theme_Header

	sd.Initialize(xml.GetDrawable("ic_drawer"))
	imgLogo.Initialize("")
	lsheader.Initialize("lsheader")
	
	Dim p As Panel
	p.Initialize("")
	NavDrawer.ContentPanel.AddView(P, (pContent.Width - Min(pContent.Width, pContent.Height)) / 2, (pContent.Height - Min(pContent.Width, pContent.Height)) / 2 , Min(pContent.Width, pContent.Height), Min(pContent.Width, pContent.Height))
	
	'We add the mListView to our NavigationPanel
	NavDrawer.NavigationPanel.AddView(imgLogo, 0, 0, 85%x,230dip)
	NavDrawer.NavigationPanel.AddView(lsheader, 0, imgLogo.Height,85%x, pContent.Height-imgLogo.Height)
	NavDrawer.NavigationPanel.Color = Library.ConvertHex2Int(Library.GetStringResourse("menubar_color"))

	Glide.Load("file:///android_asset/logo.jpg").AsBitmap.Resize(Abs(imgLogo.Width),Abs(imgLogo.Height)).CenterCrop.IntoImageView(imgLogo)
	
	Library.ChangeListviewStyle(lsheader)
	lsheader.TwoLinesLayout.SecondLabel.TextColor = Library.Theme_Header
	Library.SetDivider(lsheader,Colors.aRGB(70,228,228,228),1)
	
	excluMenu.Initialize
	If Library.Config <> Null Then
		If Library.Config.IsInitialized Then
			Try
				excluMenu = Library.Config.Get("menus")
			Catch
				excluMenu = Null
			End Try
			If excluMenu = Null Then
				Dim tes As List
				tes.Initialize
				excluMenu = tes
			End If
			If excluMenu.IsInitialized = False Then
				excluMenu.Initialize
			End If
		End If
	End If
	
	AddHeader
	
	tmrdelay.Initialize("tmr1",340)
	pContent.Visible = False
	
End Sub

Sub Drawer_DrawerClosed (DrawerGravity As Int)
	
	Opended = False
	Content.Visible = False
	
	If ClickedItem Then
		ClickedItem = False
		tmrdelay.Enabled = True
	End If
	
End Sub

'Called when the drawer opens
Sub Drawer_DrawerOpened (DrawerGravity As Int)
	Opended = True
End Sub

'Called while sliding the drawer
'Sets the Offset of the Drawer indicator image
Sub Drawer_DrawerSlide (Position As Float, DrawerGravity As Int)
	sd.Offset = Position
End Sub

Public Sub ToggleMenu
	
	If GetVisible Then
		NavDrawer.CloseDrawer2(GravityMenu)
	Else
		Content.Visible = True
		NavDrawer.OpenDrawer2(GravityMenu)
	End If
	
End Sub

Public Sub AddHeader
	
	If lsheader.IsInitialized = False Then Return
	
	lsheader.Clear
	
	If IsPaused(actMenu) Then
		lsheader.AddTwoLines2(Library.GetStringResourse("home"),"","home")
	End If
	
	If ExistExclusiveMenu("basket") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("basket_title"),"","basket")
	End If
	
	If ExistExclusiveMenu("catalog") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("category"),"","catalog")
	End If
	
	If ExistExclusiveMenu("search") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("search_title"),"","search")
	End If
	
	If ExistExclusiveMenu("bookmark") = False Then
		lsheader.AddTwoLines2(Library.wishlist,"","bookmark")
	End If
	
	#if com_apps_mobiledigitell
		lsheader.AddTwoLines2("لیست قیمت","","list_price")
	#End If
	
	If ExistExclusiveMenu("compare") = False Then
		lsheader.AddTwoLines2(Library.comparelist,"","compare")
	End If
	
	If actProduct.IsOpenProduct = True Then
		lsheader.AddTwoLines2(Library.GetStringResourse("close_product_page"),"","finish_product")
	End If
	
	lsheader.AddSingleLine(Library.GetStringResourse("users"))
	
	If Library.loginDetails.IsInitialized = False Then
		If ExistExclusiveMenu("login") = False Then
			lsheader.AddTwoLines2(Library.GetStringResourse("login"),"","login")
		End If
		
		If ExistExclusiveMenu("register") = False Then
			lsheader.AddTwoLines2(Library.GetStringResourse("register"),"","register")
		End If
		
	Else
		If Library.loginDetails.Get("login") = True Then
			lsheader.AddTwoLines2(Library.GetStringResourse("account"),"","account")
			lsheader.AddTwoLines2(Library.GetStringResourse("logout"),"","logout")
		Else
			lsheader.AddTwoLines2(Library.GetStringResourse("login"),"","login")
			lsheader.AddTwoLines2(Library.GetStringResourse("register"),"","register")
		End If
	End If
	
	lsheader.AddSingleLine(Library.GetStringResourse("shops"))
	
	If ExistExclusiveMenu("latest") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("newproduct"),"","new")
	End If
	
	If ExistExclusiveMenu("feature") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("featureproduct"),"","feature")
	End If
	
	If ExistExclusiveMenu("best") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("bestproduct"),"","best")
	End If
	
	lsheader.AddSingleLine(Library.GetStringResourse("contact_shop"))
	
	If ExistExclusiveMenu("contact") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("contact"),"","contact")
	End If
	
	If ExistExclusiveMenu("about") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("about"),"","about")
	End If
	
	lsheader.AddTwoLines2(Library.GetStringResourse("setting"),"","setting")
	
	If ExistExclusiveMenu("update") = False Then
		lsheader.AddTwoLines2(Library.GetStringResourse("again_update"),"","update_db")
	End If
	
	If ExistExclusiveMenu("information") = False Then
		If lsheader.Size < 20 Then
			If Library.listInformation.IsInitialized = False Then
				Dim opInformation As OpenCart
				opInformation.Initialize
				opInformation.GetInformation(Me,"information_receive")
			Else
				ShowInformationLink(Library.listInformation)
			End If
		End If
	End If
	
	If ExistExclusiveMenu("share") = False Then
'		lsheader.AddTwoLines2(Library.GetStringResourse("share_app"),"","shareme")
	End If
	
End Sub

Sub ExistExclusiveMenu(Menu As String) As Boolean
	
	If excluMenu = Null Then Return False
	If excluMenu.IsInitialized = False Then Return False
	
	For i = 0 To excluMenu.Size - 1
		Dim temp As String
		temp = excluMenu.Get(i)
		temp = temp.ToLowerCase.Replace("&quot;",QUOTE).Replace("&amp;","&")
		If temp = Menu.ToLowerCase.Replace("&quot;",QUOTE).Replace("&amp;","&") Then Return True
	Next
	
	Return False
		
End Sub

Private Sub lsheader_ItemClick (Position As Int, Value1 As Object)
	
	NavDrawer.CloseDrawer2(GravityMenu)
	ClickedItem = True
	value = Value1

End Sub

Private Sub tmr1_Tick
	tmrdelay.Enabled = False
	DoAction
End Sub

Private Sub DoAction
	
	actProduct.ClickedMenu = True
	
	Dim op As OpenCart
	op.Initialize
	
	If value = "home" Then
		StartActivity(actMenu)
		
	Else If value = "catalog" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		StartActivity(actCategory)
	
	Else if value = "search" Then
		StartActivity(actSearch)
	
	else if value = "compare" Then
		
		If Library.ListProductIDForCompare.Size = 0 Then
			ToastMessageShow(Library.GetStringResourse("no_campare_list"),True)
			Return
		End If
		
		StartActivity(actCompare)
			
	Else If value = "new" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed2(actMenu,"LoadProductSplit","newproduct")
	
	Else If value = "feature" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed2(actMenu,"LoadProductSplit","featureproduct")
	
	Else If value = "best" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed2(actMenu,"LoadProductSplit","bestproduct")
	
	Else If value = "finish_product" Then
		CallSubDelayed(actProduct,"FinishMe")
		
	Else If value = "register" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		StartActivity(actRegister)

	Else If value = "login" Then
		StartActivity(actLogin)
		
	Else If value = "about" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		StartActivity(actAbout)
	
	Else If value = "contact" Then
		StartActivity(actContact)
		
	Else If value = "setting" Then
		SettingMenu
	
	Else If value = "account" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		StartActivity(actAccount)
		
	Else If value = "basket" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		StartActivity(actBasket)
		
	Else If value = "bookmark" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		ProgressDialogShow(Library.GetStringResourse("loading"))
		
		op.Wishlist(Me,"bookmark_receive","")
	
	Else If value = "logout" Then
		
		If Library.InternetState = False Then
			ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed(actMenu,"Logout")
	
	Else If IsNumber(value) Then
		
		Dim cache As Map
		cache = Library.CacheSystem.GetCacheAsMap(value,"menu")
	
		If cache.IsInitialized Then
			DetailsInformation_receive(cache,"")
			Return
		End If
		
		'ProgressDialogShow(Library.GetStringResourse("loading"))
		CallSubDelayed2(actMenu,"ShowHideLoading",True)
		
		op.GetInformationDetailsID(Me,"DetailsInformation_receive",value)
	
	Else If value = "update_db" Then
		Library.CacheSystem.ClearCache
		CallSubDelayed(actMenu,"ReRunApp")
		
	Else If value = "close" Then
		File.Delete(File.DirInternal,"data")
		CallSubDelayed(actMenu,"ExitApplications")
	
	Else if value = "shareme" Then
		Dim share As ShareMyApp
		Dim r As Reflector
		share.startShare(r.GetActivity , Library.GetStringResourse("share_app"))
	
	Else if value = "list_price" Then
		actWeb.title	= "لیست قیمت"
		actWeb.link		= "http://goo.gl/UrT4ju"
		StartActivity(actWeb)
			
	End If
	
End Sub

Sub bookmark_receive(res As Map,cat As String)
	
	ProgressDialogHide
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim temp As Map
			temp = res.Get("data")
			actProducts.res = temp.Get("products")
			actProducts.title = Library.GetStringResourse("bookmark")
			StartActivity(actProducts)
		End If
	End If
	
End Sub

Private Sub SettingMenu
	
	StartActivity(actSetting)
	
End Sub

Sub information_receive(res As Map,cat As String)
	
	'	CallSubDelayed2(actMenu,"ShowHideLoading",False)
	
	If Library.listInformation.IsInitialized Then Return
	
	If res.ContainsKey("data") Then
	
		Dim ls As List
		ls = res.Get("data")
		
		If ls.Size = 0 Then Return
		
		Library.listInformation = ls
		
		ShowInformationLink(ls)
	
	End If
	
End Sub

Sub ShowInformationLink(ls As List)
	
	lsheader.AddSingleLine(Library.GetStringResourse("shop_inf"))
		
	For i = 0 To ls.Size - 1
		
		Dim Te As Map
		Te = ls.Get(i)
		Dim sname As String
		sname = Te.Get("title")
		
		sname = sname.Replace("&quot;",QUOTE).Replace("&amp;","&")
		
		If ExistExclusiveMenu(sname) = True Then Continue
		
		lsheader.AddTwoLines2(sname,"",Te.Get("id"))
		
	Next
	
	lsheader.AddTwoLines2(Library.GetStringResourse("exit_app"),"","close")
		
End Sub

Sub DetailsInformation_receive(res As Map,cat As String)
	
	CallSubDelayed2(actMenu,"ShowHideLoading",False)
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim	temp As Map
			temp = res.Get("data")
			actWeb.title	= temp.Get("title")
			actWeb.title = actWeb.title.Replace("&quot;",QUOTE).Replace("&amp;","&")
			actWeb.data		= temp.Get("description")
			StartActivity(actWeb)
		End If
	End If
	
End Sub

Public Sub GetVisible As Boolean
	Return Opended
End Sub