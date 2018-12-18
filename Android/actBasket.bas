Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	Private timerAnimation As Timer
End Sub

Sub Globals
	Private pnlheader As Panel
	Private lbltitle As Label
	Private lblpb As Label
	Private pnlloading As Panel
	Private btnpayment As Button
	Private btnclear As Button
	Private lbltotal As Label
	Private lblsabadtitle As Label
	Private op1 As OpenCart
	Private txtcartcount As Spinner
	Private lblcprice As Label
	Private lblctitle As Label
	Private imgicon As ImageView
	Private pnlitemcart As Panel
	Private sv1 As ScrollView
	Private Top As Int = 0
	Private lblcount As Label
	Private btncoupon As Button
	Private lblremove_product As Label
	Private txtcoupon_id As EditText
	Private txtvoucher_id As EditText
	Private btnvoucher As Button
	Private BiggerSV,DoAnimateSV As Boolean
	Private DefaultTopSV,DefaultHeightSV As Int
	Private MyToastMessageShow As MyToastMessageShow
	Private ItemCountInBasket As Int = 0
	Private btnok As Button
	Private wbattention As WebView
	Private pnlattention As Panel
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Library.setLocalApp(Library.currLang)
	
	Activity.LoadLayout("frmbasket")
	MyToastMessageShow.Initialize(Activity)
	
	Library.ChangeStatusColor
	
	lbltitle.Text = Library.GetStringResourse("basket_title")
	lblpb.Text = Library.GetStringResourse("loading")
	btnclear.Text = Library.GetStringResourse("btnclear")
	btnpayment.Text = Library.GetStringResourse("btnpayment")
	btnok.Text = Library.GetStringResourse("ok")
	lblsabadtitle.Text = Library.GetStringResourse("basket_total")
	lblsabadtitle.TextSize = 12
	lbltotal.Text = "0"
	
	btncoupon.Text = Library.GetStringResourse("new_coupon")
	txtcoupon_id.Hint = Library.GetStringResourse("enter_coupon")
	txtvoucher_id.Hint = Library.GetStringResourse("enter_voucher")
	btnvoucher.Text = Library.GetStringResourse("new_voucher")
	
	'btnpayment.Background = Library.GetButtonState
	Dim cd As ColorDrawable
	cd.Initialize2(Library.ConvertHex2Int(Library.GetStringResourse("category_button")),0,0,Colors.Gray)
	btnpayment.Background = cd
	btnok.Background = cd
	btnclear.Color = Colors.Transparent
	
	pnlheader.Color = Library.Theme_Header
	op1.Initialize
	
	sv1.Color = Colors.RGB(247, 244, 244)
	sv1.Panel.Color = Colors.RGB(247, 244, 244)
	
	DefaultHeightSV = sv1.Height
	DefaultTopSV = sv1.Top
	
	timerAnimation.Initialize("tmrAnimation",1000)
	
	If Library.IsEnglish Then
		lbltotal.Typeface = Library.GetFont
		lblsabadtitle.Left = lbltotal.Left
		lbltotal.Left = lblsabadtitle.Left + lblsabadtitle.Width
		lbltotal.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTER_VERTICAL)
		lblsabadtitle.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER_VERTICAL)
	End If
	
End Sub

Sub Activity_Resume
	GetCart
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Library.AnimationFromLeft2Right
End Sub

Sub btnclose_Click
	Activity.Finish
End Sub

Sub btnpayment_Click
	
	If Library.InternetState = False Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_details"),1.5,False)
		Return
	End If
	
	If Library.loginDetails.IsInitialized Then
		If Library.loginDetails.Get("login") = True Then
			If DateTime.Now - Library.loginDetails.Get("expire")  > 1010020 Then
				StartActivity(actLogin)
				Return
			End If
			StartActivity(actDoOrder)
			Return
		End If
	End If
	
	If Library.GuestLogin.IsInitialized Then
		If Library.GuestLogin.Get("login") = True Then
			StartActivity(actDoOrder)
			Return
		End If
	End If
	
	StartActivity(actLogin)
	
End Sub

Sub btnclear_Click
	op1.ClearCart(Me,"ClearCart_receive")
End Sub

Sub ClearCart_receive(res As Map,cat As String)
	
	If res = Null Then Return
	
	If res.ContainsKey("success") Then
		
		Dim r1 As String
		r1 = res.Get("success")
		
		If r1.ToLowerCase = "true" Then
			ToastMessageShow(Library.GetStringResourse("cleared"),False)
			Activity.Finish
			Return
		Else
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		End If
	
	End If
	
End Sub

Sub GetCart
	
	pnlloading.SetVisibleAnimated(600,True)
	sv1.Panel.RemoveAllViews
	sv1.Panel.Height = 0
	Top = 0
	
	op1.GetCarts(Me,"Carts_receive")
	
End Sub

Sub Carts_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(600,False)
	
	If res.IsInitialized = False Then
		ToastMessageShow(Library.GetStringResourse("no_cart"),False)
		Activity.Finish
		Return
	End If
	
	If res.ContainsKey("attention") Then
		
		If res.Get("attention") <> "" Then
			Dim style As String
			
			If Library.IsPersian Then style = "<body style=""direction:rtl;text-align:right"">"
			
			wbattention.LoadHtml(style & res.Get("attention"))
			pnlattention.SetVisibleAnimated(700,True)
		Else
			pnlattention.Visible = False
		End If
		
	End If
	
	If res.ContainsKey("error_warning") Then
		
		If res.Get("error_warning") <> "" Then
			Msgbox(res.Get("error_warning"),Library.GetStringResourse("alert"))
		Else
			pnlattention.Visible = False
		End If
		
	End If
	
	Library.CartDetails = res
	lbltitle.Text = Library.GetStringResourse("basket_title") & " [ 0 ]".Replace("0",op1.GetCartCount)
	
	lbltitle.Typeface = Library.GetFont
	
	Dim total As Map
	total = op1.GetCartTotal(res.Get("totals"))
	lbltotal.Text = total.Get("total")
	
	Dim Glide As AriaGlide
	
	Top = 10
	
	If res.ContainsKey("products") Then
		
		Dim l1 As List
		l1.Initialize
		l1 = res.Get("products")
		
		Dim images As Map
		images.Initialize
		
		Dim html1 As Html
		
		ItemCountInBasket = l1.Size
		
		For i = 0 To l1.Size - 1
			
			Dim temp As Map
			temp = l1.Get(i)

			Dim p1 As Panel
			p1.Initialize("")
			sv1.Panel.AddView(p1,0,Top,sv1.Width,0)
			
			If Library.IsPersian Then
				p1.LoadLayout("frmtemplate_car")
			Else
				p1.LoadLayout("frmtemplate_car_en")
			End If
			
			p1.Tag = temp.Get("product_id")
			
			lblcprice.Typeface = Library.GetFont
			
			p1.Height = pnlitemcart.Height + 10dip
			
			txtcartcount.DropdownBackgroundColor = Colors.White
			txtcartcount.DropdownTextColor = Colors.Gray
			lblcount.Text = Library.GetStringResourse("cart_product_count")
			
			Dim qu As Int
			qu = temp.Get("quantity")
			
			For j = 1 To 80
				
				txtcartcount.Add(j)
				
				If j = qu Then
					txtcartcount.SelectedIndex = j-1
				End If
				
			Next
			
			txtcartcount.Tag = temp.Get("key")
			lblremove_product.Tag = temp.Get("key")
			
			lblctitle.Text = html1.FromHtml(temp.Get("name"))
			lblctitle.Gravity = Library.GetStringResourse("direction")
			lblcprice.Gravity = Library.GetStringResourse("direction")
			lblcprice.Text = temp.Get("price")
			If lblcprice.Text.StartsWith("0") = True Then lblcprice.Text = Library.GetStringResourse("call_us")
			
			If lblcprice.Text.ToLowerCase = "false" Then lblcprice.Text = "-"
			
			Dim thumb As String
			thumb = temp.Get("thumb")
			thumb = thumb.Replace(" ","%20")
			
			If thumb.Length = 0 Then
				Glide.Load("file:///android_asset/noimage1.png").AsBitmap.Resize(Abs(imgicon.Width),Abs(imgicon.Height)).CenterCrop.IntoTarget("CartThumb",imgicon)
			Else
				Glide.Load(thumb).AsBitmap.Resize(Abs(imgicon.Width),Abs(imgicon.Height)).CenterCrop.IntoTarget("CartThumb",imgicon)
			End If
			
			If temp.Get("stock") = False Then
				lblctitle.TextColor = Colors.Red
				lblctitle.Text = lblctitle.Text & " ***"
			End If
			
			Dim options As List
			options = temp.Get("option")
			
			Dim topOption As Int
			topOption = pnlitemcart.Height
			
			If options.IsInitialized Then
				For k = 0 To options.Size - 1
					Dim te As Map
					te = options.Get(k)
					Dim lblKey As Label
					lblKey.Initialize("")
					lblKey.Color = Colors.White
					lblKey.Typeface = Library.GetFont
					lblKey.TextSize = 11
					lblKey.TextColor = Colors.Black
					lblKey.Text = Library.UnderLine(te.Get("name") & " : " & "{un}" & te.Get("value") & "{un}")
					lblKey.Gravity = Library.GetStringResourse("direction")
					Library.PaddingLabel(lblKey,10,0,10,0)
					pnlitemcart.AddView(lblKey,18,topOption,pnlitemcart.Width-20,40dip)
					pnlitemcart.Height = pnlitemcart.Height + 42dip
					topOption = topOption + 35dip
					p1.Height = pnlitemcart.Height
					
				Next
				topOption = pnlitemcart.Height
			End If
			
			Top = Top + p1.Height + 1dip
			
		Next
		
		sv1.Panel.Height = Top
		
	End If
	
End Sub

Sub CartThumb_OnBitmapReady(bitmap As Bitmap,Tag As Object)
	
	Dim im As ImageView
	im = Tag
	
	im.Gravity = Gravity.FILL
	
	Dim nativeMe As JavaObject
	Dim borderWidth As Int = 50
	Dim borderColor As Int = Colors.Gray
	
	nativeMe.InitializeContext
    im.Bitmap = nativeMe.RunMethod("getRoundBitmap",Array(bitmap,borderColor, borderWidth))
	
End Sub

Sub lblremove_product_Click
	
	Dim p1 As Label
	p1 = Sender
	
	Library.GetParent(p1).Visible = False
	Library.GetParent(p1).SetVisibleAnimated(600,True)
	
	Dim product As String
	product = p1.Tag
	
	If Msgbox2(Library.GetStringResourse("question_delete_cart"),Library.GetStringResourse("alert"),Library.GetStringResourse("yes"),Library.GetStringResourse("no"),"",Null) = DialogResponse.POSITIVE Then
		pnlloading.SetVisibleAnimated(600,True)
		'op1.UpdateProductCart(Me,"UpdateProduct_receive",product,"0")
		op1.DeleteProductFromCart(Me,"UpdateProduct_receive",product)
	End If
	
End Sub

Sub DeleteItem_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(600,False)
	
	If res.ContainsKey("success") Then
		Dim re As String
		re = res.Get("success")
		
		If re.ToLowerCase = "false" Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Else
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("deleted_item"),1.5,True)
		End If
		
	End If
	
End Sub

Sub txtcartcount_ItemClick (Position As Int, Value As Object)
	
	Dim sp As Spinner
	sp = Sender
	
	Dim id As String
	id = sp.Tag
	
	pnlloading.SetVisibleAnimated(600,True)
	op1.UpdateProductCart(Me,"UpdateProduct_receive",id,Value)
	
End Sub

Sub UpdateProduct_receive(res As Map,cat As String)
	
	pnlloading.SetVisibleAnimated(600,False)
	
	If res.ContainsKey("success") Then
		Dim re As String
		re = res.Get("success")
		
		If re.ToLowerCase = "false" Then
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("error_net_title"),1.5,False)
		Else
			MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("update_count_item"),1.5,True)
			GetCart
		End If
		
	End If
	
End Sub

Sub Activity_KeyPress (KeyCode As Int) As Boolean 'Return True to consume the event
	
	If KeyCode = KeyCodes.KEYCODE_BACK Then
		Activity.Finish
		Return True
	End If
	
End Sub

Sub btncoupon_Click
	
	If IsNumber(txtcoupon_id.Text) Then
		Dim coupon As OpenCart
		coupon.Initialize
		lblpb.Text = Library.GetStringResourse("apply")
		pnlloading.SetVisibleAnimated(500,True)
		coupon.AddCoupon(Me,"addcoupon_receive",txtcoupon_id.Text)
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("enter_coupon"),1.5,False)
	End If
	
End Sub

Sub addcoupon_receive(state As Boolean)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	txtcoupon_id.Text = ""
	
	If state = True Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("add_coupon"),1.5,True)
		GetCart
		Return
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_coupon"),1.5,False)
	End If
	
End Sub

Sub btnvoucher_Click

	If IsNumber(txtvoucher_id.Text) Then
		Dim coupon As OpenCart
		coupon.Initialize
		lblpb.Text = Library.GetStringResourse("apply")
		pnlloading.SetVisibleAnimated(500,True)
		coupon.AddVoucher(Me,"addvoucher_receive",txtvoucher_id.Text)
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("enter_voucher"),1.5,False)
	End If
	
End Sub

Sub addvoucher_receive(state As Boolean)
	
	pnlloading.SetVisibleAnimated(500,False)
	
	txtvoucher_id.Text = ""
	
	If state = True Then
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("add_voucher"),1.5,True)
		GetCart
		Return
	Else
		MyToastMessageShow.ShowToastMessageShow(Library.GetStringResourse("no_voucher"),1.5,False)
	End If
	
End Sub

Sub sv1_ScrollChanged(Position As Int)
	
'	If ItemCountInBasket < 3 Then Return
'	
'	If timerAnimation.Enabled = True Then Return
'	
' 	If Position < 1 And DoAnimateSV = True Then
'		DoAnimateSV = False
'		Return
'	End If
'	
'	If Position > 0 And BiggerSV = False Then
'		sv1.SetLayoutAnimated(400,0,lbltotal.Top + lbltotal.Height+ lbltotal.Height + 19dip,sv1.Width,Activity.Height - lbltotal.Height - pnlheader.Height - btnclear.Height- btnclear.Height)
'		timerAnimation.Enabled = True
'		DoAnimateSV = True
'		BiggerSV = True
'		sv1.ScrollPosition = 0
'		DoEvents
'		
'	Else If Position < 1 Then
'		
'		If BiggerSV = True Then
'			sv1.SetLayoutAnimated(400,0,DefaultTopSV,sv1.Width,DefaultHeightSV)
'			timerAnimation.Enabled = True
'			DoEvents
'		End If
'		
'		BiggerSV = False
'
'	End If
'	
End Sub

Sub tmrAnimation_Tick
		timerAnimation.Enabled = False
End Sub

Sub btnok_Click
	pnlattention.SetVisibleAnimated(700,False)
End Sub

Sub wbattention_OverrideUrl (Url As String) As Boolean
	
	If Url.ToLowerCase.IndexOf("login") > -1 Then
		StartActivity(actLogin)
	else if Url.ToLowerCase.IndexOf("register") > -1 Then
		StartActivity(actRegister)
	End If
	
	Return True
	
End Sub

Sub lblproduct_event_Click
	
	Dim v1 As View
	v1 = Sender
	
	Dim parent As View
	parent = v1.Parent
	
	Dim id As String
	
	If IsNumber(parent.Tag) Then
		id = parent.Tag
	Else
		parent = parent.Parent
		id = parent.Tag
	End If
	
	If IsNumber(id) Then
		actProduct.product = CreateMap("product_id":id)
		StartActivity(actProduct)
	End If
	
End Sub

#If Java

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.Path.FillType;
import android.graphics.Paint;
import android.graphics.Color;
import android.view.View;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.BitmapShader;
import android.graphics.Shader;
import android.graphics.PorterDuffXfermode;
import android.graphics.PorterDuff.Mode;


public static Bitmap getRoundBitmap(Bitmap scaleBitmapImage, int borderColor, int borderWidth) {
	int targetWidth = 1000;
	int targetHeight = 1000;
	int radius = Math.min((targetHeight - 5)/2, (targetWidth - 5)/2);   
	
	Bitmap targetBitmap = Bitmap.createBitmap(targetWidth, targetHeight,
			Bitmap.Config.ARGB_8888);

	Canvas canvas = new Canvas(targetBitmap);
	Path path = new Path();
	path.addCircle(((float) targetWidth - 1) / 2,
			((float) targetHeight - 1) / 2,
			(Math.min(((float) targetWidth), ((float) targetHeight)) / 2),
			Path.Direction.CCW);

	canvas.clipPath(path);
	
	Bitmap sourceBitmap = scaleBitmapImage;
	
	canvas.drawBitmap(sourceBitmap, new Rect(0, 0, sourceBitmap.getWidth(),
			sourceBitmap.getHeight()), new Rect(0, 0, targetWidth,
			targetHeight), null);
			
			
	Paint p = new Paint();                                              
	p.setAntiAlias(true);           		
	//	canvas.drawBitmap(sourceBitmap, 4, 4, p);                                      
	p.setXfermode(null);                                                
	p.setStyle(Paint.Style.STROKE);                                           
	p.setColor(borderColor);                                            
	p.setStrokeWidth(borderWidth);                                                
	canvas.drawCircle((targetWidth / 2) , (targetHeight / 2) , radius, p);      						

	return targetBitmap;
}

#End If
