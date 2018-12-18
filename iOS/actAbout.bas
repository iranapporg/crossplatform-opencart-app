Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module

Sub Process_Globals
	Private lbltitle As Label
	Private pnlheader As Panel
	Private btnclose As Button
	Private imglogo As ImageView
	Private lbladdress As Label
	Private lblemail As Label
	Private lblfax As Label
	Private lblname As Label
	Private lblowner As Label
	Private lblphone As Label
	Private lblurl As Label
	Private pnlsearch As Panel
	Private pnlloading As Panel
	Private lblpb As Label
	Private lblcomment As Label
	Private btnlist As Button
End Sub

Sub StartActivity
	
	Dim pg As Page
	pg.Initialize("")
	pg.RootPanel.LoadLayout("frmabout")
	Library.NavControl.ShowPage(pg)
	
	Library.ChangeFont(pg.RootPanel)
	
	pnlheader.Color = Library.Theme_Header
	lbltitle.Text = Library.GetStringResourse("about")
	lblpb.Text = Library.GetStringResourse("loading")
	btnlist.Text = Library.GetStringResourse("shop_list")
	
	Library.PaddingLabel(lbladdress,16,16,16,16)
	Library.PaddingLabel(lblcomment,16,16,16,16)
	Library.PaddingLabel(lblname,20,0,20,0)
	Library.PaddingLabel(lblphone,20,0,20,0)
	Library.PaddingLabel(lblfax,20,0,20,0)
	Library.PaddingLabel(lblemail,20,0,20,0)
	Library.PaddingLabel(lblowner,20,0,20,0)
	Library.PaddingLabel(lblurl,20,0,20,0)
	
	lblname.TextAlignment = Library.GetStringResourse("direction_ios")
	lblphone.TextAlignment = Library.GetStringResourse("direction_ios")
	lblfax.TextAlignment = Library.GetStringResourse("direction_ios")
	lblemail.TextAlignment = Library.GetStringResourse("direction_ios")
	lblurl.TextAlignment = Library.GetStringResourse("direction_ios")
	lblowner.TextAlignment = Library.GetStringResourse("direction_ios")
	lbladdress.TextAlignment = Library.GetStringResourse("direction_ios")
	lblcomment.TextAlignment = Library.GetStringResourse("direction_ios")
	
	Dim op1 As OpenCart
	op1.Initialize
	op1.GetStore(Me,"StoreDetails_receive","0")
	
End Sub

Sub StoreDetails_receive(res As Map,cat As String)
	
	pnlloading.Visible = False
	
	Dim data As Map
	data = res.Get("data")
	
	lblname.Text = data.Get("store_name")
	lblphone.Text = data.Get("store_telephone")
	lblfax.Text = data.Get("store_fax")
	
	If lblfax.Text.Length = 0 Then lblfax.Text = "-"
	
	lbladdress.Text = Library.GetStringResourse("shop_address") & data.Get("store_address")
	lblemail.Text = Library.GetStringResourse("shop_email") & data.Get("store_email")
	lblowner.Text = Library.GetStringResourse("shop_owner") & data.Get("store_owner")
	lblurl.Text = Library.GetStringResourse("url")
	lblcomment.Text = data.Get("store_comment")
	
	If lblcomment.Text.Length = 0 Then lblcomment.Text = Library.GetStringResourse("no_comment")
	
	Dim image As String
	image = data.Get("store_image")
	
	If image.Length = 0 Or image = Null Then
		If image.IndexOf("http") = -1 Then image = Library.GetStringResourse("url") & "/" & image
		image = data.Get("thumb")
	End If
	
	Dim d1 As ImageDownloader
	d1.Initialize
	d1.Download(CreateMap(imglogo:image))
	
End Sub

Sub btnclose_Click
	Library.NavControl.ShowPage(Library.MenuPage)
End Sub