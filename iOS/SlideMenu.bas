Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Class module
Sub Class_Globals
	Private AddInformation As Boolean
	Private lsheader As CustomListView
	Private meModule As Object
	Private SubscribeState As String
	Private tmrdelay As Timer
	Private value As String
	Private pageSide As Page
	Private side As SideMenuController
	Private pnlslide As Panel
	Private imglogo As ImageView
	Private lbltitle As Label
	Private left,width As Int
	Private lblicon As Label
	Private lbltitle_header As Label
	Private v2 As View
End Sub

Public Sub Initialize(titlebarHeight As Int,Module As Object)
	
	Library.NavControl.Initialize("nc")
	
	pageSide.Initialize("pageside")
	pageSide.RootPanel.SizeToFit
	pageSide.RootPanel.LoadLayout("frmslidemenu")
	pageSide.HideBackButton = True
	
	lsheader.Initialize(Me,"lsheader",pnlslide.Width)
	pnlslide.AddView(lsheader.AsView,0,imglogo.Height-25,100%x,pnlslide.Height-(imglogo.Top + imglogo.Height))
	
	pnlslide.Color = Library.ConvertHex2Int(Library.GetStringResourse("menubar_color"))
	pageSide.RootPanel.Color = Library.ConvertHex2Int(Library.GetStringResourse("menubar_color"))
	
	imglogo.Top = -23
	
	Library.NavControl.NavigationBarVisible = False
	Library.NavControl.ToolBarVisible = False
	
	If Library.IsPersian Then
		side.Initialize(Null,Library.NavControl,pageSide)
	Else
		side.Initialize(pageSide,Library.NavControl,Null)
	End If
	
	Library.APP.KeyController = side
	Library.NavControl.ShowPage(Library.MenuPage)
	AddHeader(False)
	
End Sub

Sub OpenMenu
	
	If Library.IsPersian Then
		side.OpenRightMenu
	Else
		side.OpenLeftMenu
	End If
	
End Sub

Public Sub AddHeader(Update As Boolean)
	
	lsheader.Clear
	
	AddItem(Library.GetStringResourse("home"),"","home")
	AddItem(Library.GetStringResourse("basket_title"),"","basket")
	AddItem(Library.GetStringResourse("category"),"","catalog")
	AddItem(Library.wishlist,"","bookmark")
	
	AddHeaderTitle(Library.GetStringResourse("users"))
	
	If Library.loginDetails.IsInitialized = False Then
		AddItem(Library.GetStringResourse("login"),"","login")
		AddItem(Library.GetStringResourse("register"),"","register")
	Else
		If Library.loginDetails.Get("login") = True Then
			AddItem(Library.GetStringResourse("account"),"","account")
			AddItem(Library.GetStringResourse("logout"),"","logout")
		Else
			AddItem(Library.GetStringResourse("login"),"","login")
			AddItem(Library.GetStringResourse("register"),"","register")
		End If	
	End If
	
	AddHeaderTitle(Library.GetStringResourse("shops"))
	AddItem(Library.GetStringResourse("newproduct"),"","new")
	AddItem(Library.GetStringResourse("featureproduct"),"","feature")
	AddItem(Library.GetStringResourse("bestproduct"),"","best")
	
	AddHeaderTitle(Library.GetStringResourse("contact_shop"))
	AddItem(Library.GetStringResourse("contact"),"","contact")
	AddItem(Library.GetStringResourse("about"),"","about")
	AddItem(Library.GetStringResourse("setting"),"","setting")
	AddItem(Library.GetStringResourse("again_update"),"","update_db")
	
	If AddInformation = False Then
		If Library.listInformation.IsInitialized = False Then
			Dim opInformation As OpenCart
			opInformation.Initialize
			opInformation.GetInformation(Me,"information_receive")
		Else
			ShowInformationLink(Library.listInformation)
		End If
	End If
	
	AddItem(Library.GetStringResourse("share_app"),"","shareme")
	
End Sub

Private Sub AddItem(Title As String,Icon As String,sValue As String)
	
	Dim p1 As Panel
	p1.Initialize("lsheader")
	
	If Library.IsPersian Then
		p1.LoadLayout("frmslidemenu_item")
	Else
		p1.LoadLayout("frmslidemenu_item_en")
	End If
	
	lsheader.Add(p1,43dip,sValue)
	
	lbltitle.Text = " " & Title
	lblicon.Text = Icon
	lbltitle.Font = Library.GetFont(13)
	Library.SetFont(lblicon,"icomoon",19)
	lbltitle.TextColor = Library.ConvertHex2Int(Library.GetStringResourse("menubar_textcolor"))
	lblicon.TextColor = Library.Theme_Header
	lbltitle.Tag = sValue
	lblicon.Tag = sValue
	left = p1.Left
	width = p1.Width
	
End Sub

Private Sub AddHeaderTitle(Title As String)
	
	Dim p As Panel
	p.Initialize("")
	p.LoadLayout("frmslidemenu_header")
	
	lbltitle_header.Color = Library.ConvertHex2Int(Library.GetStringResourse("menubar_header"))
	lbltitle_header.TextColor = Library.ConvertHex2Int(Library.GetStringResourse("menubar_textcolor"))
	lbltitle_header.Text = "  " & Title
	lbltitle_header.Font = Library.GetFont(14)
	lsheader.Add(p,40dip,"")

	lbltitle_header.TextAlignment = Library.GetStringResourse("direction_ios")
	
End Sub

Sub btnitem_Click

	Dim v1 As View
	v1 = Sender
	
	v2 = v1
	
	side.CloseMenu
	
	Dim bg As Int
	bg = Library.GetParent(v1).Color
	Library.GetParent(v1).Color = Colors.Rgb(233, 234, 238)
	Library.GetParent(v1).SetColorAnimated(600,bg)
	value = v1.Tag
	DoAction
	
End Sub

Sub bookmark_receive(res As Map,cat As String)
	
	Library.HUD.ProgressDialogHide
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim temp As Map
			temp = res.Get("data")
			Library.LastPage = Library.MenuPage
			actProducts.res = temp.Get("products")
			actProducts.title = Library.GetStringResourse("bookmark")
			actProducts.StartActivity
		End If
	End If
	
End Sub

Private Sub SettingMenu

	If Library.Application.OSVersion >= 8 Then
   		Library.App.OpenURL("app-settings:")
	Else
		Msgbox(Library.GetStringResourse2("error_net_details"),Library.GetStringResourse2("alert"))
	End If
	
End Sub

Sub information_receive(res As Map,cat As String)
	
	If res.ContainsKey("data") Then
	
		Dim ls As List
		ls = res.Get("data")
		
		If ls.Size = 0 Then Return
		
		Library.listInformation = ls
		
		ShowInformationLink(ls)
	
	End If
	
End Sub

Sub ShowInformationLink(ls As List)
	 
	If AddInformation = True Then Return
	 
	AddHeaderTitle(Library.GetStringResourse("shop_inf"))
		
	For i = 0 To ls.Size - 1
		
		Dim te As Map
		te = ls.Get(i)
		Dim sname As String
		sname = te.Get("title")
		sname = sname.Replace("&quot;",QUOTE).Replace("&amp;","&")
		AddItem(sname,"",te.Get("id"))	
		
	Next
	
'	AddItem(Library.GetStringResourse("exit_app"),"","close")
	
	AddInformation = True
		
End Sub

Sub DetailsInformation_receive(res As Map,cat As String)
	
	Library.HUD.ProgressDialogHide
	
	If res.ContainsKey("success") Then
		If res.Get("success") = True Then
			Dim	temp As Map
			temp = res.Get("data")
			actWeb.title	= temp.Get("title")
			actWeb.title = actWeb.title.Replace("&quot;",QUOTE).Replace("&amp;","&")
			actWeb.data		= temp.Get("description")
			actWeb.StartActivity
		End If
	End If
	
End Sub

Private Sub DoAction
	
	Dim op As OpenCart
	op.Initialize
	
	Library.LastPage = Library.MenuPage
	
	If value = "catalog" Then	
		actCategory.StartActivity
	
	else if value = "home" Then
		Library.NavControl.ShowPage(Library.MenuPage)
		
	Else If value = "new" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed2(actMenu,"LoadProductSplit","newproduct")
	
	Else If value = "feature" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed2(actMenu,"LoadProductSplit","featureproduct")
	
	Else If value = "best" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed2(actMenu,"LoadProductSplit","bestproduct")
	
	Else If value = "finish_product" Then
		CallSubDelayed(actProduct,"FinishMe")	
		
	Else If value = "register" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		actRegister.StartActivity

	Else If value = "login" Then
		Library.LastPage = Library.MenuPage
		actLogin.StartActivity
		
	Else If value = "about" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		actAbout.StartActivity
	
	Else If value = "contact" Then
		actContact.StartActivity
		
	Else If value = "setting" Then
		SettingMenu
	
	Else If value = "account" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		actAccount.StartActivity
		
	Else If value = "basket" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		actBasket.StartActivity
		
	Else If value = "bookmark" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		Library.HUD.ProgressDialogShow(Library.GetStringResourse("loading"))
		
		op.Wishlist(Me,"bookmark_receive","")
	
	Else If value = "logout" Then
		
		If Library.InternetState = False Then
			Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_details"),False)
			Return
		End If
		
		CallSubDelayed(actMenu,"Logout")
	
	Else If IsNumber(value) Then
		
		Library.HUD.ProgressDialogShow(Library.GetStringResourse("loading"))
		op.GetInformationDetailsID(Me,"DetailsInformation_receive",value)
	
	Else If value = "update_db" Then
		File.Delete(CacheData.DirCache,"cache_category2")
		File.Delete(CacheData.DirCache,"cache_category_product2")
		File.Delete(CacheData.DirCache,"cache_string_file")
		File.Delete(CacheData.DirCache,"caches")
		File.Delete(CacheData.DirCache,"cache_string_files")
		CallSubDelayed(actMenu,"ReRunApp")
	
	Else if value = "shareme" Then
		Dim link As String
		link = Library.GetStringResourse("url")
		modShare.ShareToSocialMedia(Library.MenuPage, Library.GetStringResourse("share"), link, v2)
		
	End If
	
End Sub