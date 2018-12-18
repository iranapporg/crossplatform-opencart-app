package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class library {
private static library mostCurrent = new library();
public static Object getObject() {
    throw new RuntimeException("Code module does not support this method.");
}
 public anywheresoftware.b4a.keywords.Common __c = null;
public static boolean _blnopennointernet = false;
public static int _theme_header = 0;
public static int _theme_footer = 0;
public static int _theme_background = 0;
public static uk.co.martinpearman.b4a.androidresources.AndroidResources _ar = null;
public static anywheresoftware.b4a.objects.collections.Map _token = null;
public static String _productchoosenid = "";
public static anywheresoftware.b4a.objects.collections.Map _cartdetails = null;
public static String _currlang = "";
public static String _currcurrency = "";
public static de.amberhome.objects.preferenceactivity.PreferenceManager _manager = null;
public static anywheresoftware.b4a.phone.Phone.PhoneId _phone1 = null;
public static anywheresoftware.b4a.phone.Phone _phoneinfo = null;
public static anywheresoftware.b4a.objects.collections.Map _logindetails = null;
public static anywheresoftware.b4a.objects.collections.List _coupons = null;
public static anywheresoftware.b4a.objects.collections.Map _guestlogin = null;
public static anywheresoftware.b4a.objects.collections.List _imagesslideshow = null;
public static anywheresoftware.b4a.objects.collections.List _featureproduct = null;
public static anywheresoftware.b4a.objects.collections.List _bestproduct = null;
public static anywheresoftware.b4a.objects.collections.List _newproduct = null;
public static anywheresoftware.b4a.objects.collections.List _specialproduct = null;
public static anywheresoftware.b4a.objects.collections.List _listslideshow = null;
public static anywheresoftware.b4a.objects.collections.List _listmanufacturers = null;
public static anywheresoftware.b4a.objects.collections.List _listinformation = null;
public static anywheresoftware.b4a.objects.collections.List _listbanners = null;
public static String _storeid = "";
public static String _wishlist = "";
public static String _comparelist = "";
public static int _choosenaddress = 0;
public static int[] _tempdimension = null;
public static boolean _paymentsuccess = false;
public static com.devil.signature.CheckSignature _sign = null;
public static boolean _firstrun = false;
public static anywheresoftware.b4a.objects.StringUtils _stringutil = null;
public static com.apps.demo.cachesystem _cachesystem = null;
public static anywheresoftware.b4a.objects.collections.List _listproductidforcompare = null;
public static boolean _shopstate = false;
public static anywheresoftware.b4a.objects.collections.Map _config = null;
public static Object _currentmodule = null;
public static anywheresoftware.b4a.objects.collections.Map _bookmarked = null;
public static String _openproductfrompush = "";
public anywheresoftware.b4a.samples.httputils2.httputils2service _httputils2service = null;
public JHSBarcodes.V1.azteccode _azteccode = null;
public JHSBarcodes.V1.qrcode _qrcode = null;
public JHSBarcodes.V1.code25i _code25i = null;
public JHSBarcodes.V1.ean13 _ean13 = null;
public JHSBarcodes.V1.ean8 _ean8 = null;
public JHSBarcodes.V1.code128 _code128 = null;
public JHSBarcodes.V1.pdf417 _pdf417 = null;
public JHSBarcodes.V1.code39 _code39 = null;
public JHSBarcodes.V1.code93 _code93 = null;
public JHSBarcodes.V1.code11 _code11 = null;
public com.apps.demo.main _main = null;
public com.apps.demo.actproduct _actproduct = null;
public com.apps.demo.actcompare _actcompare = null;
public com.apps.demo.actmenu _actmenu = null;
public com.apps.demo.actdoorder _actdoorder = null;
public com.apps.demo.actbasket _actbasket = null;
public com.apps.demo.actpayment _actpayment = null;
public com.apps.demo.actproducts _actproducts = null;
public com.apps.demo.actsearch _actsearch = null;
public com.apps.demo.actreview _actreview = null;
public com.apps.demo.acterrorintrenet _acterrorintrenet = null;
public com.apps.demo.actcontact _actcontact = null;
public com.apps.demo.actcategory _actcategory = null;
public com.apps.demo.actnotification _actnotification = null;
public com.apps.demo.actabout _actabout = null;
public com.apps.demo.actorderdetails _actorderdetails = null;
public com.apps.demo.actregister _actregister = null;
public com.apps.demo.actlogin _actlogin = null;
public com.apps.demo.actupdate _actupdate = null;
public com.apps.demo.actsetting _actsetting = null;
public com.apps.demo.actdisableshop _actdisableshop = null;
public com.apps.demo.bookmark _bookmark = null;
public com.apps.demo.actaccount _actaccount = null;
public com.apps.demo.googlevoices _googlevoices = null;
public com.apps.demo.actpicture _actpicture = null;
public com.apps.demo.actsms _actsms = null;
public com.apps.demo.actshow _actshow = null;
public com.apps.demo.actweb _actweb = null;
public com.apps.demo.dateutils _dateutils = null;
public com.apps.demo.imagedownloader _imagedownloader = null;
public com.apps.demo.updater _updater = null;
public com.apps.demo.starter _starter = null;
public static class _responseadditem{
public boolean IsInitialized;
public anywheresoftware.b4a.objects.ConcreteViewWrapper View1;
public int Top;
public int Left;
public void Initialize() {
IsInitialized = true;
View1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
Top = 0;
Left = 0;
}
@Override
		public String toString() {
			return BA.TypeToString(this, false);
		}}
public static String  _add2cart(anywheresoftware.b4a.BA _ba,String _sid,String _scount,Object _smodule) throws Exception{
com.apps.demo.opencart _details = null;
 //BA.debugLineNum = 1332;BA.debugLine="Public Sub Add2Cart(sID As String,sCount As String";
 //BA.debugLineNum = 1334;BA.debugLine="If InternetState = False Then";
if (_internetstate(_ba)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1335;BA.debugLine="ToastMessageShow(GetStringResourse(\"error_net_de";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(_getstringresourse(_ba,"error_net_details")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1336;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1339;BA.debugLine="ProductChoosenID = sID";
_productchoosenid = _sid;
 //BA.debugLineNum = 1341;BA.debugLine="ProgressDialogShow(GetStringResourse(\"apply\"))";
anywheresoftware.b4a.keywords.Common.ProgressDialogShow(_ba,BA.ObjectToCharSequence(_getstringresourse(_ba,"apply")));
 //BA.debugLineNum = 1343;BA.debugLine="Dim details As OpenCart";
_details = new com.apps.demo.opencart();
 //BA.debugLineNum = 1344;BA.debugLine="details.Initialize";
_details._initialize((_ba.processBA == null ? _ba : _ba.processBA));
 //BA.debugLineNum = 1345;BA.debugLine="details.Add2Cart(sModule,\"Add2Cart2_receive\",sID,";
_details._add2cart(_smodule,"Add2Cart2_receive",_sid,_scount,anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("test"),(Object)("test")}));
 //BA.debugLineNum = 1347;BA.debugLine="End Sub";
return "";
}
public static com.apps.demo.library._responseadditem  _additem(anywheresoftware.b4a.BA _ba,String _title,String _stype,String _sname,Object _tag,Object _top,anywheresoftware.b4a.objects.ScrollViewWrapper _sv1,boolean _showicon) throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.EditTextWrapper _txt1 = null;
anywheresoftware.b4a.objects.SpinnerWrapper _sp = null;
anywheresoftware.b4a.objects.collections.List _lss = null;
int _i = 0;
anywheresoftware.b4a.objects.LabelWrapper _lbl1 = null;
com.apps.demo.library._responseadditem _st = null;
 //BA.debugLineNum = 1214;BA.debugLine="Sub AddItem(Title As String,sType As String,sName";
 //BA.debugLineNum = 1216;BA.debugLine="Dim v1 As View";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 1219;BA.debugLine="If sType = \"text\" Then";
if ((_stype).equals("text")) { 
 //BA.debugLineNum = 1220;BA.debugLine="Dim txt1 As EditText";
_txt1 = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 1221;BA.debugLine="txt1.Initialize(\"txtdata\")";
_txt1.Initialize(_ba,"txtdata");
 //BA.debugLineNum = 1222;BA.debugLine="txt1.Color = Colors.White";
_txt1.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1223;BA.debugLine="txt1.TextColor = Colors.Black";
_txt1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1224;BA.debugLine="txt1.Typeface = GetFont";
_txt1.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 1225;BA.debugLine="txt1.Gravity = GetStringResourse(\"direction\")";
_txt1.setGravity((int)(Double.parseDouble(_getstringresourse(_ba,"direction"))));
 //BA.debugLineNum = 1226;BA.debugLine="txt1.TextSize = 12";
_txt1.setTextSize((float) (12));
 //BA.debugLineNum = 1227;BA.debugLine="txt1.Tag = sName";
_txt1.setTag((Object)(_sname));
 //BA.debugLineNum = 1228;BA.debugLine="v1 = txt1";
_v1.setObject((android.view.View)(_txt1.getObject()));
 //BA.debugLineNum = 1230;BA.debugLine="If sName = \"telephone\" Or sName = \"postcode\" Or";
if ((_sname).equals("telephone") || (_sname).equals("postcode") || (_sname).equals("fax")) { 
 //BA.debugLineNum = 1231;BA.debugLine="txt1.InputType = txt1.INPUT_TYPE_PHONE";
_txt1.setInputType(_txt1.INPUT_TYPE_PHONE);
 //BA.debugLineNum = 1232;BA.debugLine="txt1.Gravity = Gravity.LEFT";
_txt1.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.LEFT);
 //BA.debugLineNum = 1233;BA.debugLine="If ShowIcon = True Then";
if (_showicon==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1234;BA.debugLine="EditTextIcon(txt1,\"ic_menu_edit\")";
_edittexticon(_ba,_txt1,"ic_menu_edit");
 };
 }else if((_sname).equals("password")) { 
 //BA.debugLineNum = 1238;BA.debugLine="txt1.PasswordMode = True";
_txt1.setPasswordMode(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1239;BA.debugLine="txt1.Gravity = Gravity.LEFT";
_txt1.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.LEFT);
 //BA.debugLineNum = 1240;BA.debugLine="If ShowIcon = True Then";
if (_showicon==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1241;BA.debugLine="EditTextIcon(txt1,\"ic_menu_login\")";
_edittexticon(_ba,_txt1,"ic_menu_login");
 };
 }else if((_sname).equals("email")) { 
 //BA.debugLineNum = 1245;BA.debugLine="txt1.Gravity = Gravity.LEFT";
_txt1.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.LEFT);
 //BA.debugLineNum = 1246;BA.debugLine="txt1.InputType = 33";
_txt1.setInputType((int) (33));
 //BA.debugLineNum = 1247;BA.debugLine="If ShowIcon = True Then";
if (_showicon==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1248;BA.debugLine="EditTextIcon(txt1,\"ic_menu_cc\")";
_edittexticon(_ba,_txt1,"ic_menu_cc");
 };
 }else {
 //BA.debugLineNum = 1252;BA.debugLine="If ShowIcon = True Then";
if (_showicon==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1253;BA.debugLine="EditTextIcon(txt1,\"ic_menu_edit\")";
_edittexticon(_ba,_txt1,"ic_menu_edit");
 };
 };
 //BA.debugLineNum = 1257;BA.debugLine="If sName <> \"password\" Then";
if ((_sname).equals("password") == false) { 
 //BA.debugLineNum = 1258;BA.debugLine="txt1.SingleLine = True";
_txt1.setSingleLine(anywheresoftware.b4a.keywords.Common.True);
 };
 }else if((_stype).equals("spinner")) { 
 //BA.debugLineNum = 1266;BA.debugLine="Dim sp As Spinner";
_sp = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 1267;BA.debugLine="sp.Initialize(sName)";
_sp.Initialize(_ba,_sname);
 //BA.debugLineNum = 1269;BA.debugLine="If Tag <> Null Then";
if (_tag!= null) { 
 //BA.debugLineNum = 1270;BA.debugLine="If Tag Is List Then";
if (_tag instanceof java.util.List) { 
 //BA.debugLineNum = 1271;BA.debugLine="sp.AddAll(Tag)";
_sp.AddAll((anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_tag)));
 };
 };
 //BA.debugLineNum = 1275;BA.debugLine="sp.Color = Colors.White";
_sp.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1276;BA.debugLine="sp.TextColor = Colors.Black";
_sp.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1277;BA.debugLine="sp.DropdownBackgroundColor = Colors.White";
_sp.setDropdownBackgroundColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1278;BA.debugLine="sp.DropdownTextColor = Colors.Black";
_sp.setDropdownTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1279;BA.debugLine="sp.TextSize = 12";
_sp.setTextSize((float) (12));
 //BA.debugLineNum = 1280;BA.debugLine="sp.Tag = sName";
_sp.setTag((Object)(_sname));
 //BA.debugLineNum = 1282;BA.debugLine="If IsPersian Then";
if (_ispersian(_ba)) { 
 //BA.debugLineNum = 1283;BA.debugLine="Dim lss As List";
_lss = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1284;BA.debugLine="lss = Tag";
_lss.setObject((java.util.List)(_tag));
 //BA.debugLineNum = 1285;BA.debugLine="For i=0 To lss.Size - 1";
{
final int step55 = 1;
final int limit55 = (int) (_lss.getSize()-1);
for (_i = (int) (0) ; (step55 > 0 && _i <= limit55) || (step55 < 0 && _i >= limit55); _i = ((int)(0 + _i + step55)) ) {
 //BA.debugLineNum = 1286;BA.debugLine="If lss.Get(i) = \"جمهوری اسلامی ایران\" Then";
if ((_lss.Get(_i)).equals((Object)("جمهوری اسلامی ایران"))) { 
 //BA.debugLineNum = 1287;BA.debugLine="sp.SelectedIndex = i";
_sp.setSelectedIndex(_i);
 //BA.debugLineNum = 1288;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 };
 //BA.debugLineNum = 1293;BA.debugLine="v1 = sp";
_v1.setObject((android.view.View)(_sp.getObject()));
 };
 //BA.debugLineNum = 1299;BA.debugLine="Dim lbl1 As Label";
_lbl1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1300;BA.debugLine="lbl1.Initialize(\"\")";
_lbl1.Initialize(_ba,"");
 //BA.debugLineNum = 1301;BA.debugLine="lbl1.TextColor = Colors.Black";
_lbl1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1302;BA.debugLine="lbl1.Typeface = GetFont";
_lbl1.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 1303;BA.debugLine="lbl1.TextSize = 12";
_lbl1.setTextSize((float) (12));
 //BA.debugLineNum = 1304;BA.debugLine="lbl1.Gravity = GetStringResourse(\"direction\")";
_lbl1.setGravity((int)(Double.parseDouble(_getstringresourse(_ba,"direction"))));
 //BA.debugLineNum = 1306;BA.debugLine="SV1.Panel.AddView(lbl1,15,Top,SV1.Width - 34,30di";
_sv1.getPanel().AddView((android.view.View)(_lbl1.getObject()),(int) (15),(int)(BA.ObjectToNumber(_top)),(int) (_sv1.getWidth()-34),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 1307;BA.debugLine="Top = Top + 34dip";
_top = (Object)((double)(BA.ObjectToNumber(_top))+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)));
 //BA.debugLineNum = 1309;BA.debugLine="If sName = \"address_1\" Then";
if ((_sname).equals("address_1")) { 
 //BA.debugLineNum = 1310;BA.debugLine="SV1.Panel.AddView(v1,15,Top,SV1.Width - 34,97dip";
_sv1.getPanel().AddView((android.view.View)(_v1.getObject()),(int) (15),(int)(BA.ObjectToNumber(_top)),(int) (_sv1.getWidth()-34),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (97)));
 }else {
 //BA.debugLineNum = 1312;BA.debugLine="SV1.Panel.AddView(v1,15,Top,SV1.Width - 34,37dip";
_sv1.getPanel().AddView((android.view.View)(_v1.getObject()),(int) (15),(int)(BA.ObjectToNumber(_top)),(int) (_sv1.getWidth()-34),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (37)));
 };
 //BA.debugLineNum = 1315;BA.debugLine="Top = Top + 52dip";
_top = (Object)((double)(BA.ObjectToNumber(_top))+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (52)));
 //BA.debugLineNum = 1317;BA.debugLine="lbl1.Text = Title";
_lbl1.setText(BA.ObjectToCharSequence(_title));
 //BA.debugLineNum = 1319;BA.debugLine="SV1.Panel.Height = Top";
_sv1.getPanel().setHeight((int)(BA.ObjectToNumber(_top)));
 //BA.debugLineNum = 1321;BA.debugLine="Dim st As ResponseAddItem";
_st = new com.apps.demo.library._responseadditem();
 //BA.debugLineNum = 1322;BA.debugLine="st.Initialize";
_st.Initialize();
 //BA.debugLineNum = 1323;BA.debugLine="st.Top = Top";
_st.Top = (int)(BA.ObjectToNumber(_top));
 //BA.debugLineNum = 1324;BA.debugLine="st.View1 = v1";
_st.View1 = _v1;
 //BA.debugLineNum = 1326;BA.debugLine="Return st";
if (true) return _st;
 //BA.debugLineNum = 1328;BA.debugLine="End Sub";
return null;
}
public static String  _addproduct2panel(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _scrollview1,int _left,int[] _dimension,anywheresoftware.b4a.objects.collections.Map _temp) throws Exception{
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
anywheresoftware.b4a.objects.drawable.BitmapDrawable _error_image = null;
boolean _cache_state = false;
anywheresoftware.b4a.objects.PanelWrapper _pa = null;
String _tag = "";
anywheresoftware.b4a.objects.ImageViewWrapper _imgtemp = null;
anywheresoftware.b4a.objects.LabelWrapper _templabel = null;
anywheresoftware.b4a.objects.LabelWrapper _labelprice = null;
anywheresoftware.b4a.objects.PanelWrapper _temppanel = null;
anywheresoftware.b4a.objects.ProgressBarWrapper _progress = null;
anywheresoftware.b4a.objects.PanelWrapper _parentpanel = null;
String _price = "";
String _special = "";
int _quantity = 0;
String _pathimage = "";
anywheresoftware.b4a.keywords.Regex.MatcherWrapper _ma = null;
 //BA.debugLineNum = 842;BA.debugLine="Sub AddProduct2Panel(ScrollView1 As HorizontalScro";
 //BA.debugLineNum = 844;BA.debugLine="Dim Glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 846;BA.debugLine="Dim error_image As BitmapDrawable";
_error_image = new anywheresoftware.b4a.objects.drawable.BitmapDrawable();
 //BA.debugLineNum = 847;BA.debugLine="error_image.Initialize(LoadBitmap(File.DirAssets";
_error_image.Initialize((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"noimage.png").getObject()));
 //BA.debugLineNum = 849;BA.debugLine="Dim cache_state As Boolean = manager.GetBoolean(";
_cache_state = _manager.GetBoolean("cache");
 //BA.debugLineNum = 851;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 852;BA.debugLine="Dim pa As Panel";
_pa = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 853;BA.debugLine="pa.Initialize(\"\")";
_pa.Initialize(_ba,"");
 //BA.debugLineNum = 854;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,0,Dimension(0)";
_scrollview1.getPanel().AddView((android.view.View)(_pa.getObject()),_left,(int) (0),_dimension[(int) (0)],(int) (0));
 //BA.debugLineNum = 856;BA.debugLine="Dim tag As String";
_tag = "";
 //BA.debugLineNum = 857;BA.debugLine="tag = ScrollView1.Tag";
_tag = BA.ObjectToString(_scrollview1.getTag());
 //BA.debugLineNum = 859;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
_pa.LoadLayout("frmproduct_template",_ba);
 //BA.debugLineNum = 861;BA.debugLine="pa.Height = Dimension(1)";
_pa.setHeight(_dimension[(int) (1)]);
 //BA.debugLineNum = 864;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 866;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = new anywheresoftware.b4a.objects.LabelWrapper();
_labelprice = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 867;BA.debugLine="Dim TempPanel As Panel";
_temppanel = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 868;BA.debugLine="Dim progress As ProgressBar";
_progress = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 869;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = new anywheresoftware.b4a.objects.PanelWrapper();
_parentpanel.setObject((android.view.ViewGroup)(_pa.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 872;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.setObject((android.widget.ImageView)(_parentpanel.GetView((int) (4)).getObject()));
 //BA.debugLineNum = 873;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.setObject((android.widget.TextView)(_parentpanel.GetView((int) (1)).getObject()));
 //BA.debugLineNum = 874;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.setObject((android.widget.TextView)(_parentpanel.GetView((int) (2)).getObject()));
 //BA.debugLineNum = 875;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.setObject((android.view.ViewGroup)(_parentpanel.GetView((int) (6)).getObject()));
 //BA.debugLineNum = 876;BA.debugLine="progress = ParentPanel.GetView(0)";
_progress.setObject((android.widget.ProgressBar)(_parentpanel.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 878;BA.debugLine="TempLabel.Text = temp.Get(\"name\")";
_templabel.setText(BA.ObjectToCharSequence(_temp.Get((Object)("name"))));
 //BA.debugLineNum = 879;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
_templabel.setText(BA.ObjectToCharSequence(_templabel.getText().replace("&quot;",anywheresoftware.b4a.keywords.Common.QUOTE).replace("&amp;","&")));
 //BA.debugLineNum = 881;BA.debugLine="If (TempLabel.Text.Length > 30) Then TempLabel.T";
if ((_templabel.getText().length()>30)) { 
_templabel.setText(BA.ObjectToCharSequence(_templabel.getText().substring((int) (0),(int) (30))+"..."));};
 //BA.debugLineNum = 882;BA.debugLine="LabelSpace(TempLabel,0.7)";
_labelspace(_ba,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_templabel.getObject())),(float) (0.7));
 //BA.debugLineNum = 884;BA.debugLine="Dim price,special As String";
_price = "";
_special = "";
 //BA.debugLineNum = 885;BA.debugLine="Dim quantity As Int";
_quantity = 0;
 //BA.debugLineNum = 887;BA.debugLine="If temp.ContainsKey(\"quantity\") Then";
if (_temp.ContainsKey((Object)("quantity"))) { 
 //BA.debugLineNum = 888;BA.debugLine="quantity = temp.Get(\"quantity\")";
_quantity = (int)(BA.ObjectToNumber(_temp.Get((Object)("quantity"))));
 }else {
 //BA.debugLineNum = 890;BA.debugLine="quantity = -1";
_quantity = (int) (-1);
 };
 //BA.debugLineNum = 893;BA.debugLine="If temp.ContainsKey(\"price_formated\") Then";
if (_temp.ContainsKey((Object)("price_formated"))) { 
 //BA.debugLineNum = 894;BA.debugLine="price   = temp.Get(\"price_formated\")";
_price = BA.ObjectToString(_temp.Get((Object)("price_formated")));
 }else {
 //BA.debugLineNum = 896;BA.debugLine="price   = temp.Get(\"price\")";
_price = BA.ObjectToString(_temp.Get((Object)("price")));
 };
 //BA.debugLineNum = 899;BA.debugLine="If temp.ContainsKey(\"special_formated\") Then";
if (_temp.ContainsKey((Object)("special_formated"))) { 
 //BA.debugLineNum = 900;BA.debugLine="special = temp.Get(\"special_formated\")";
_special = BA.ObjectToString(_temp.Get((Object)("special_formated")));
 //BA.debugLineNum = 901;BA.debugLine="If temp.ContainsKey(\"special\") Then";
if (_temp.ContainsKey((Object)("special"))) { 
 //BA.debugLineNum = 902;BA.debugLine="If temp.Get(\"special\") = \"0\" Then";
if ((_temp.Get((Object)("special"))).equals((Object)("0"))) { 
 //BA.debugLineNum = 903;BA.debugLine="special = \"\"";
_special = "";
 };
 };
 }else if(_temp.ContainsKey((Object)("special"))) { 
 //BA.debugLineNum = 907;BA.debugLine="special = temp.Get(\"special\")";
_special = BA.ObjectToString(_temp.Get((Object)("special")));
 //BA.debugLineNum = 908;BA.debugLine="If special = \"0 تومان\" Then special = \"\"";
if ((_special).equals("0 تومان")) { 
_special = "";};
 };
 //BA.debugLineNum = 911;BA.debugLine="If special = \"null\" Or special = \"false\" Then sp";
if ((_special).equals("null") || (_special).equals("false")) { 
_special = "";};
 //BA.debugLineNum = 913;BA.debugLine="LabelPrice.Typeface = GetFont";
_labelprice.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 914;BA.debugLine="TempLabel.Typeface = GetFont";
_templabel.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 916;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if (_price.length()>0 && _special.length()==0) { 
 //BA.debugLineNum = 917;BA.debugLine="If price.StartsWith(\"0\") = True Then";
if (_price.startsWith("0")==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 918;BA.debugLine="LabelPrice.Text = GetStringResourse(\"call_us\")";
_labelprice.setText(BA.ObjectToCharSequence(_getstringresourse(_ba,"call_us")));
 }else {
 //BA.debugLineNum = 920;BA.debugLine="LabelPrice.Text = price";
_labelprice.setText(BA.ObjectToCharSequence(_price));
 };
 }else if(_special.length()>0) { 
 //BA.debugLineNum = 923;BA.debugLine="LabelPrice.Text = DiscountStyleLabel(price,spec";
_labelprice.setText(BA.ObjectToCharSequence(_discountstylelabel(_ba,_price,_special).getObject()));
 };
 //BA.debugLineNum = 926;BA.debugLine="If LabelPrice.Text.ToLowerCase = \"false\" Then La";
if ((_labelprice.getText().toLowerCase()).equals("false")) { 
_labelprice.setText(BA.ObjectToCharSequence(_getstringresourse(_ba,"login_account")));};
 //BA.debugLineNum = 928;BA.debugLine="If quantity = 0 Then";
if (_quantity==0) { 
 //BA.debugLineNum = 929;BA.debugLine="LabelPrice.Text = temp.Get(\"stock_status\")";
_labelprice.setText(BA.ObjectToCharSequence(_temp.Get((Object)("stock_status"))));
 };
 //BA.debugLineNum = 932;BA.debugLine="Dim PathImage As String";
_pathimage = "";
 //BA.debugLineNum = 934;BA.debugLine="If temp.ContainsKey(\"image\") Then";
if (_temp.ContainsKey((Object)("image"))) { 
 //BA.debugLineNum = 935;BA.debugLine="PathImage = temp.Get(\"image\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("image")));
 }else if(_temp.ContainsKey((Object)("thumb"))) { 
 //BA.debugLineNum = 937;BA.debugLine="PathImage = temp.Get(\"thumb\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("thumb")));
 };
 //BA.debugLineNum = 940;BA.debugLine="PathImage = PathImage.Replace(\" \",\"%20\")";
_pathimage = _pathimage.replace(" ","%20");
 //BA.debugLineNum = 942;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ((_pathimage.toLowerCase()).equals("null") || _pathimage.length()==0) { 
 //BA.debugLineNum = 943;BA.debugLine="Glide.Load(\"file:///android_asset/noimage1.png\"";
_glide.Load((Object)("file:///android_asset/noimage1.png")).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getHeight()))).CenterCrop().IntoImageView(_imgtemp);
 }else {
 //BA.debugLineNum = 945;BA.debugLine="Glide.Load(PathImage).AsBitmap.Resize(Abs(imgTe";
_glide.Load((Object)(_pathimage)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getHeight()))).CenterCrop().IntoImageView(_imgtemp);
 };
 //BA.debugLineNum = 948;BA.debugLine="progress.RemoveView";
_progress.RemoveView();
 //BA.debugLineNum = 950;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ((_temppanel.getTag()).equals((Object)("over"))) { 
 //BA.debugLineNum = 951;BA.debugLine="TempPanel.Tag = temp";
_temppanel.setTag((Object)(_temp.getObject()));
 }else if((_temppanel.getTag()).equals((Object)("topbar"))) { 
 //BA.debugLineNum = 953;BA.debugLine="TempPanel.Color = Theme_Header";
_temppanel.setColor(_theme_header);
 };
 //BA.debugLineNum = 956;BA.debugLine="If temp.ContainsKey(\"href\") Then";
if (_temp.ContainsKey((Object)("href"))) { 
 //BA.debugLineNum = 957;BA.debugLine="Dim ma As Matcher";
_ma = new anywheresoftware.b4a.keywords.Regex.MatcherWrapper();
 //BA.debugLineNum = 958;BA.debugLine="ma = Regex.Matcher(\"product_id=(\\d+)\",temp.Get(";
_ma = anywheresoftware.b4a.keywords.Common.Regex.Matcher("product_id=(\\d+)",BA.ObjectToString(_temp.Get((Object)("href"))));
 //BA.debugLineNum = 960;BA.debugLine="If ma.Find Then";
if (_ma.Find()) { 
 //BA.debugLineNum = 961;BA.debugLine="TempPanel.Tag = CreateMap(\"product_id\":ma.Grou";
_temppanel.setTag((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("product_id"),(Object)(_ma.Group((int) (1)))}).getObject()));
 };
 };
 //BA.debugLineNum = 968;BA.debugLine="End Sub";
return "";
}
public static String  _animationfrombutton2top(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 47;BA.debugLine="Sub AnimationFromButton2Top";
 //BA.debugLineNum = 48;BA.debugLine="SetAnimation(\"from_bottom_to_up\",\"from_up_to_bott";
_setanimation(_ba,"from_bottom_to_up","from_up_to_bottom");
 //BA.debugLineNum = 49;BA.debugLine="End Sub";
return "";
}
public static String  _animationfromleft2right(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 38;BA.debugLine="Sub AnimationFromLeft2Right";
 //BA.debugLineNum = 39;BA.debugLine="SetAnimation(\"file1\",\"file2\")";
_setanimation(_ba,"file1","file2");
 //BA.debugLineNum = 40;BA.debugLine="End Sub";
return "";
}
public static String  _animationfromright2left(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 43;BA.debugLine="Sub AnimationFromRight2Left";
 //BA.debugLineNum = 44;BA.debugLine="SetAnimation(\"file1\",\"file2\")";
_setanimation(_ba,"file1","file2");
 //BA.debugLineNum = 45;BA.debugLine="End Sub";
return "";
}
public static String  _animationfromtop2button(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 51;BA.debugLine="Sub AnimationFromTop2Button";
 //BA.debugLineNum = 52;BA.debugLine="SetAnimation(\"from_up_to_up\",\"from_up_to_bottom\")";
_setanimation(_ba,"from_up_to_up","from_up_to_bottom");
 //BA.debugLineNum = 53;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString  _boldstring(anywheresoftware.b4a.BA _ba,String _str) throws Exception{
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _r1 = null;
 //BA.debugLineNum = 1351;BA.debugLine="Public Sub BoldString(str As String) As RichString";
 //BA.debugLineNum = 1353;BA.debugLine="Dim r1 As RichString";
_r1 = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 1354;BA.debugLine="r1.Initialize(str)";
_r1.Initialize(BA.ObjectToCharSequence(_str));
 //BA.debugLineNum = 1355;BA.debugLine="r1.Style2(r1.STYLE_BOLD,\"{b}\")";
_r1.Style2(_r1.STYLE_BOLD,"{b}");
 //BA.debugLineNum = 1356;BA.debugLine="r1.Color2(Theme_Header,\"{c}\")";
_r1.Color2(_theme_header,"{c}");
 //BA.debugLineNum = 1357;BA.debugLine="Return r1";
if (true) return _r1;
 //BA.debugLineNum = 1359;BA.debugLine="End Sub";
return null;
}
public static String  _centerview(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ConcreteViewWrapper _v,anywheresoftware.b4a.objects.ConcreteViewWrapper _parent) throws Exception{
 //BA.debugLineNum = 578;BA.debugLine="Sub CenterView(v As View, parent As View)";
 //BA.debugLineNum = 579;BA.debugLine="v.Left = parent.Width / 2 - v.Width / 2";
_v.setLeft((int) (_parent.getWidth()/(double)2-_v.getWidth()/(double)2));
 //BA.debugLineNum = 580;BA.debugLine="End Sub";
return "";
}
public static String  _centerview2(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ConcreteViewWrapper _v,anywheresoftware.b4a.objects.ConcreteViewWrapper _parent) throws Exception{
 //BA.debugLineNum = 233;BA.debugLine="Sub CenterView2(v As View, parent As View)";
 //BA.debugLineNum = 234;BA.debugLine="v.Left = parent.Width / 2 - v.Width / 2";
_v.setLeft((int) (_parent.getWidth()/(double)2-_v.getWidth()/(double)2));
 //BA.debugLineNum = 235;BA.debugLine="v.Top = parent.Height / 2 - v.Height / 2";
_v.setTop((int) (_parent.getHeight()/(double)2-_v.getHeight()/(double)2));
 //BA.debugLineNum = 236;BA.debugLine="End Sub";
return "";
}
public static String  _changecheckboximage(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ConcreteViewWrapper _view,String _stype) throws Exception{
anywheresoftware.b4a.objects.drawable.StateListDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.BitmapDrawable _actcolor = null;
anywheresoftware.b4a.objects.drawable.BitmapDrawable _hovercolor = null;
 //BA.debugLineNum = 238;BA.debugLine="Sub ChangeCheckBoxImage(view As View,sType As Stri";
 //BA.debugLineNum = 240;BA.debugLine="Dim c1 As StateListDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.StateListDrawable();
 //BA.debugLineNum = 241;BA.debugLine="Dim actColor,hoverColor As BitmapDrawable";
_actcolor = new anywheresoftware.b4a.objects.drawable.BitmapDrawable();
_hovercolor = new anywheresoftware.b4a.objects.drawable.BitmapDrawable();
 //BA.debugLineNum = 243;BA.debugLine="actColor.Initialize(LoadBitmapSample(File.DirAsse";
_actcolor.Initialize((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmapSample(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),_stype+"_on.png",(int) (32),(int) (32)).getObject()));
 //BA.debugLineNum = 244;BA.debugLine="hoverColor.Initialize(LoadBitmapSample(File.DirAs";
_hovercolor.Initialize((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmapSample(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),_stype+"_off.png",(int) (32),(int) (32)).getObject()));
 //BA.debugLineNum = 246;BA.debugLine="c1.Initialize";
_c1.Initialize();
 //BA.debugLineNum = 247;BA.debugLine="c1.AddState(c1.State_Checked,actColor)";
_c1.AddState(_c1.State_Checked,(android.graphics.drawable.Drawable)(_actcolor.getObject()));
 //BA.debugLineNum = 248;BA.debugLine="c1.AddState(c1.State_Unchecked,hoverColor)";
_c1.AddState(_c1.State_Unchecked,(android.graphics.drawable.Drawable)(_hovercolor.getObject()));
 //BA.debugLineNum = 249;BA.debugLine="c1.AddCatchAllState(hoverColor)";
_c1.AddCatchAllState((android.graphics.drawable.Drawable)(_hovercolor.getObject()));
 //BA.debugLineNum = 251;BA.debugLine="view.Background = c1";
_view.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 253;BA.debugLine="End Sub";
return "";
}
public static String  _changelistviewstyle(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ListViewWrapper _lv1) throws Exception{
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
 //BA.debugLineNum = 337;BA.debugLine="Sub ChangeListviewStyle(lv1 As ListView)";
 //BA.debugLineNum = 339;BA.debugLine="If GetDevicePhysicalSize > 5 Then";
if (_getdevicephysicalsize(_ba)>5) { 
 //BA.debugLineNum = 340;BA.debugLine="lv1.TwoLinesLayout.ItemHeight = 130   'ertefa ha";
_lv1.getTwoLinesLayout().setItemHeight((int) (130));
 };
 //BA.debugLineNum = 343;BA.debugLine="If GetDevicePhysicalSize < 6 Then";
if (_getdevicephysicalsize(_ba)<6) { 
 //BA.debugLineNum = 344;BA.debugLine="lv1.TwoLinesLayout.Label.TextSize = 13";
_lv1.getTwoLinesLayout().Label.setTextSize((float) (13));
 //BA.debugLineNum = 345;BA.debugLine="lv1.SingleLineLayout.Label.TextSize = 13";
_lv1.getSingleLineLayout().Label.setTextSize((float) (13));
 //BA.debugLineNum = 346;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.TextSize = 19";
_lv1.getTwoLinesLayout().SecondLabel.setTextSize((float) (19));
 }else {
 //BA.debugLineNum = 348;BA.debugLine="lv1.TwoLinesLayout.Label.TextSize = 16";
_lv1.getTwoLinesLayout().Label.setTextSize((float) (16));
 //BA.debugLineNum = 349;BA.debugLine="lv1.SingleLineLayout.Label.TextSize = 19";
_lv1.getSingleLineLayout().Label.setTextSize((float) (19));
 //BA.debugLineNum = 350;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.TextSize = 22";
_lv1.getTwoLinesLayout().SecondLabel.setTextSize((float) (22));
 };
 //BA.debugLineNum = 353;BA.debugLine="lv1.TwoLinesLayout.Label.Height = lv1.TwoLinesLay";
_lv1.getTwoLinesLayout().Label.setHeight(_lv1.getTwoLinesLayout().getItemHeight());
 //BA.debugLineNum = 354;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.Height = lv1.TwoLi";
_lv1.getTwoLinesLayout().SecondLabel.setHeight(_lv1.getTwoLinesLayout().Label.getHeight());
 //BA.debugLineNum = 356;BA.debugLine="SetDivider(lv1,Colors.RGB(82,160,218),1)";
_setdivider(_ba,_lv1,anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (82),(int) (160),(int) (218)),(int) (1));
 //BA.debugLineNum = 358;BA.debugLine="lv1.TwoLinesLayout.Label.TextColor	= ConvertHex2I";
_lv1.getTwoLinesLayout().Label.setTextColor((int)(Double.parseDouble(_converthex2int(_ba,_getstringresourse(_ba,"menubar_textcolor")))));
 //BA.debugLineNum = 359;BA.debugLine="lv1.SingleLineLayout.Label.TextColor = ConvertHex";
_lv1.getSingleLineLayout().Label.setTextColor((int)(Double.parseDouble(_converthex2int(_ba,_getstringresourse(_ba,"menubar_textcolor")))));
 //BA.debugLineNum = 360;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.TextColor	=  Conve";
_lv1.getTwoLinesLayout().SecondLabel.setTextColor((int)(Double.parseDouble(_converthex2int(_ba,_getstringresourse(_ba,"menubar_textcolor")))));
 //BA.debugLineNum = 362;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 363;BA.debugLine="c1.Initialize(ConvertHex2Int(GetStringResourse(\"m";
_c1.Initialize((int)(Double.parseDouble(_converthex2int(_ba,_getstringresourse(_ba,"menubar_header")))),(int) (0));
 //BA.debugLineNum = 364;BA.debugLine="lv1.SingleLineLayout.Background = c1";
_lv1.getSingleLineLayout().Background = (android.graphics.drawable.Drawable)(_c1.getObject());
 //BA.debugLineNum = 366;BA.debugLine="lv1.TwoLinesLayout.Label.Typeface	= GetFont";
_lv1.getTwoLinesLayout().Label.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 367;BA.debugLine="lv1.SingleLineLayout.Label.Typeface	= GetFont";
_lv1.getSingleLineLayout().Label.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 368;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.Typeface=  Typefac";
_lv1.getTwoLinesLayout().SecondLabel.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("icomoon.ttf"));
 //BA.debugLineNum = 370;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.Top		= lv1.TwoLine";
_lv1.getTwoLinesLayout().SecondLabel.setTop(_lv1.getTwoLinesLayout().Label.getTop());
 //BA.debugLineNum = 371;BA.debugLine="lv1.SingleLineLayout.Label.Top			= lv1.TwoLinesLa";
_lv1.getSingleLineLayout().Label.setTop(_lv1.getTwoLinesLayout().Label.getTop());
 //BA.debugLineNum = 373;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.Width	= lv1.Width-";
_lv1.getTwoLinesLayout().SecondLabel.setWidth((int) (_lv1.getWidth()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (17))));
 //BA.debugLineNum = 374;BA.debugLine="lv1.TwoLinesLayout.Label.Width			= lv1.Width-50di";
_lv1.getTwoLinesLayout().Label.setWidth((int) (_lv1.getWidth()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50))));
 //BA.debugLineNum = 375;BA.debugLine="lv1.SingleLineLayout.Label.Width		= lv1.TwoLinesL";
_lv1.getSingleLineLayout().Label.setWidth(_lv1.getTwoLinesLayout().SecondLabel.getWidth());
 //BA.debugLineNum = 377;BA.debugLine="If IsPersian2(currLang) Then";
if (_ispersian2(_ba,_currlang)) { 
 //BA.debugLineNum = 378;BA.debugLine="lv1.TwoLinesLayout.Label.Gravity = Bit.Or(Gravit";
_lv1.getTwoLinesLayout().Label.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 379;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.Gravity = Bit.Or(";
_lv1.getTwoLinesLayout().SecondLabel.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 380;BA.debugLine="lv1.SingleLineLayout.Label.Gravity = Bit.Or(Grav";
_lv1.getSingleLineLayout().Label.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 }else {
 //BA.debugLineNum = 382;BA.debugLine="lv1.TwoLinesLayout.Label.Gravity = Bit.Or(Gravit";
_lv1.getTwoLinesLayout().Label.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.LEFT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 383;BA.debugLine="lv1.TwoLinesLayout.SecondLabel.Gravity = Bit.Or(";
_lv1.getTwoLinesLayout().SecondLabel.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.LEFT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 384;BA.debugLine="lv1.SingleLineLayout.Label.Gravity = Bit.Or(Grav";
_lv1.getSingleLineLayout().Label.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.LEFT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 385;BA.debugLine="lv1.TwoLinesLayout.Label.Left = 40dip";
_lv1.getTwoLinesLayout().Label.setLeft(anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 };
 //BA.debugLineNum = 388;BA.debugLine="End Sub";
return "";
}
public static String  _changeprogresscolor(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ProgressBarWrapper _progressbar1) throws Exception{
anywheresoftware.b4j.object.JavaObject _jo = null;
 //BA.debugLineNum = 404;BA.debugLine="Sub ChangeProgressColor(ProgressBar1 As ProgressBa";
 //BA.debugLineNum = 406;BA.debugLine="Dim jo As JavaObject = ProgressBar1";
_jo = new anywheresoftware.b4j.object.JavaObject();
_jo.setObject((java.lang.Object)(_progressbar1.getObject()));
 //BA.debugLineNum = 407;BA.debugLine="jo = jo.RunMethod(\"getIndeterminateDrawable\", Nul";
_jo.setObject((java.lang.Object)(_jo.RunMethod("getIndeterminateDrawable",(Object[])(anywheresoftware.b4a.keywords.Common.Null))));
 //BA.debugLineNum = 408;BA.debugLine="jo.RunMethod(\"setColorFilter\", Array (Theme_Heade";
_jo.RunMethod("setColorFilter",new Object[]{(Object)(_theme_header),(Object)("MULTIPLY")});
 //BA.debugLineNum = 410;BA.debugLine="End Sub";
return "";
}
public static String  _changerbstyle(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rb) throws Exception{
 //BA.debugLineNum = 1361;BA.debugLine="Public Sub ChangeRBStyle(rb As RadioButton)";
 //BA.debugLineNum = 1376;BA.debugLine="End Sub";
return "";
}
public static String  _changestatuscolor(anywheresoftware.b4a.BA _ba) throws Exception{
wrap.Wrap _status = null;
 //BA.debugLineNum = 109;BA.debugLine="Sub ChangeStatusColor";
 //BA.debugLineNum = 111;BA.debugLine="If phoneInfo.SdkVersion >=19 Then";
if (_phoneinfo.getSdkVersion()>=19) { 
 //BA.debugLineNum = 112;BA.debugLine="Dim status As StatusBarCompat";
_status = new wrap.Wrap();
 //BA.debugLineNum = 113;BA.debugLine="status.Initialize";
_status.Initialize(_ba);
 //BA.debugLineNum = 114;BA.debugLine="status.StatusBarColor = Theme_Header";
_status.setStatusBarColor(_theme_header);
 };
 //BA.debugLineNum = 117;BA.debugLine="End Sub";
return "";
}
public static String  _changestatuscolor2(anywheresoftware.b4a.BA _ba,int _color) throws Exception{
wrap.Wrap _status = null;
 //BA.debugLineNum = 119;BA.debugLine="Sub ChangeStatusColor2(Color As Int)";
 //BA.debugLineNum = 121;BA.debugLine="If phoneInfo.SdkVersion >=19 Then";
if (_phoneinfo.getSdkVersion()>=19) { 
 //BA.debugLineNum = 122;BA.debugLine="Dim status As StatusBarCompat";
_status = new wrap.Wrap();
 //BA.debugLineNum = 123;BA.debugLine="status.Initialize";
_status.Initialize(_ba);
 //BA.debugLineNum = 124;BA.debugLine="status.StatusBarColor = Color";
_status.setStatusBarColor(_color);
 };
 //BA.debugLineNum = 127;BA.debugLine="End Sub";
return "";
}
public static String  _commonerrorhttpjob(anywheresoftware.b4a.BA _ba,String _error) throws Exception{
 //BA.debugLineNum = 1530;BA.debugLine="Sub CommonErrorHttpJob(Error As String) As String";
 //BA.debugLineNum = 1532;BA.debugLine="If Error.ToLowerCase.IndexOf(\"javax.net.ssl.SSLEx";
if (_error.toLowerCase().indexOf("javax.net.ssl.SSLException: hostname in certificate didn't match")>-1) { 
 //BA.debugLineNum = 1533;BA.debugLine="Return GetStringResourse(\"error_ssl\")";
if (true) return _getstringresourse(_ba,"error_ssl");
 }else if(_error.toLowerCase().indexOf("domain not available")>-1) { 
 //BA.debugLineNum = 1536;BA.debugLine="Return GetStringResourse(\"error_domain\")";
if (true) return _getstringresourse(_ba,"error_domain");
 };
 //BA.debugLineNum = 1540;BA.debugLine="End Sub";
return "";
}
public static String  _converthex2int(anywheresoftware.b4a.BA _ba,String _hex) throws Exception{
int _r = 0;
int _g = 0;
int _b = 0;
 //BA.debugLineNum = 438;BA.debugLine="Sub ConvertHex2Int(hex As String) As String";
 //BA.debugLineNum = 439;BA.debugLine="Dim R,G,b As Int";
_r = 0;
_g = 0;
_b = 0;
 //BA.debugLineNum = 440;BA.debugLine="R = Bit.ParseInt(hex.SubString2(1,3), 16)";
_r = anywheresoftware.b4a.keywords.Common.Bit.ParseInt(_hex.substring((int) (1),(int) (3)),(int) (16));
 //BA.debugLineNum = 441;BA.debugLine="G = Bit.ParseInt(hex.SubString2(3,5), 16)";
_g = anywheresoftware.b4a.keywords.Common.Bit.ParseInt(_hex.substring((int) (3),(int) (5)),(int) (16));
 //BA.debugLineNum = 442;BA.debugLine="b = Bit.ParseInt(hex.SubString2(5,7), 16)";
_b = anywheresoftware.b4a.keywords.Common.Bit.ParseInt(_hex.substring((int) (5),(int) (7)),(int) (16));
 //BA.debugLineNum = 443;BA.debugLine="Return Colors.RGB(R, G, b)";
if (true) return BA.NumberToString(anywheresoftware.b4a.keywords.Common.Colors.RGB(_r,_g,_b));
 //BA.debugLineNum = 444;BA.debugLine="End Sub";
return "";
}
public static String  _converthtml2string(anywheresoftware.b4a.BA _ba,String _text) throws Exception{
String _pattern = "";
String _replacement = "";
anywheresoftware.b4a.keywords.Regex.MatcherWrapper _m = null;
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
 //BA.debugLineNum = 477;BA.debugLine="Sub ConvertHtml2String(Text As String) As String";
 //BA.debugLineNum = 478;BA.debugLine="Dim Pattern, Replacement As String";
_pattern = "";
_replacement = "";
 //BA.debugLineNum = 479;BA.debugLine="Dim m As Matcher";
_m = new anywheresoftware.b4a.keywords.Regex.MatcherWrapper();
 //BA.debugLineNum = 481;BA.debugLine="Pattern = \"<[^>]*>\"";
_pattern = "<[^>]*>";
 //BA.debugLineNum = 482;BA.debugLine="Replacement = \" \"";
_replacement = " ";
 //BA.debugLineNum = 484;BA.debugLine="Try";
try { //BA.debugLineNum = 485;BA.debugLine="m = Regex.Matcher2(Pattern, Regex.CASE_INSENS";
_m = anywheresoftware.b4a.keywords.Common.Regex.Matcher2(_pattern,anywheresoftware.b4a.keywords.Common.Regex.CASE_INSENSITIVE,_text);
 //BA.debugLineNum = 486;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 487;BA.debugLine="R.Target = m";
_r.Target = (Object)(_m.getObject());
 //BA.debugLineNum = 488;BA.debugLine="Return R.RunMethod2(\"replaceAll\", Replacement";
if (true) return BA.ObjectToString(_r.RunMethod2("replaceAll",_replacement,"java.lang.String"));
 } 
       catch (Exception e11) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e11); //BA.debugLineNum = 490;BA.debugLine="Return Text";
if (true) return _text;
 };
 //BA.debugLineNum = 492;BA.debugLine="End Sub";
return "";
}
public static String  _decrypt(anywheresoftware.b4a.BA _ba,String _encrypteddata) throws Exception{
anywheresoftware.b4a.object.B4XEncryption _c = null;
anywheresoftware.b4a.objects.StringUtils _su = null;
String _key = "";
byte[] _b = null;
String _temp = "";
 //BA.debugLineNum = 1449;BA.debugLine="Sub Decrypt(encryptedData As String ) As String";
 //BA.debugLineNum = 1451;BA.debugLine="Dim c As B4XCipher";
_c = new anywheresoftware.b4a.object.B4XEncryption();
 //BA.debugLineNum = 1452;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 1453;BA.debugLine="Dim key As String = Sign.KeyHash.Replace(CRLF,\"\")";
_key = _sign.KeyHash((_ba.processBA == null ? _ba : _ba.processBA)).replace(anywheresoftware.b4a.keywords.Common.CRLF,"");
 //BA.debugLineNum = 1454;BA.debugLine="Dim b() As Byte = c.Decrypt(su.DecodeBase64(encry";
_b = _c.Decrypt(_su.DecodeBase64(_encrypteddata),_key);
 //BA.debugLineNum = 1456;BA.debugLine="Dim temp As String";
_temp = "";
 //BA.debugLineNum = 1457;BA.debugLine="temp = BytesToString(b, 0, b.Length, \"UTF-8\")";
_temp = anywheresoftware.b4a.keywords.Common.BytesToString(_b,(int) (0),_b.length,"UTF-8");
 //BA.debugLineNum = 1458;BA.debugLine="Return temp";
if (true) return _temp;
 //BA.debugLineNum = 1460;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString  _discountprice(anywheresoftware.b4a.BA _ba,String _price) throws Exception{
String _style = "";
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _rich = null;
 //BA.debugLineNum = 985;BA.debugLine="Public Sub DiscountPrice(Price As String) As RichS";
 //BA.debugLineNum = 987;BA.debugLine="Dim style As String";
_style = "";
 //BA.debugLineNum = 988;BA.debugLine="style = $\"{r}{u}${Price}{r}{u}\"$";
_style = ("{r}{u}"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_price))+"{r}{u}");
 //BA.debugLineNum = 990;BA.debugLine="Dim rich As RichString";
_rich = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 991;BA.debugLine="rich.Initialize(style)";
_rich.Initialize(BA.ObjectToCharSequence(_style));
 //BA.debugLineNum = 992;BA.debugLine="rich.Color2(Colors.Black,\"{g}\")";
_rich.Color2(anywheresoftware.b4a.keywords.Common.Colors.Black,"{g}");
 //BA.debugLineNum = 993;BA.debugLine="rich.Color2(Colors.Red,\"{r}\")";
_rich.Color2(anywheresoftware.b4a.keywords.Common.Colors.Red,"{r}");
 //BA.debugLineNum = 994;BA.debugLine="rich.Strikethrough2(\"{u}\")";
_rich.Strikethrough2("{u}");
 //BA.debugLineNum = 995;BA.debugLine="rich.Underscore2(\"{un}\")";
_rich.Underscore2("{un}");
 //BA.debugLineNum = 996;BA.debugLine="Return rich";
if (true) return _rich;
 //BA.debugLineNum = 998;BA.debugLine="End Sub";
return null;
}
public static anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString  _discountstylelabel(anywheresoftware.b4a.BA _ba,String _price,String _finalprice) throws Exception{
String _style = "";
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _rich = null;
 //BA.debugLineNum = 970;BA.debugLine="Public Sub DiscountStyleLabel(Price As String,Fina";
 //BA.debugLineNum = 972;BA.debugLine="Dim style As String";
_style = "";
 //BA.debugLineNum = 973;BA.debugLine="style = $\"{r}{u}${Price}{r}{u}${CRLF}{g}${FinalPr";
_style = ("{r}{u}"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_price))+"{r}{u}"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(anywheresoftware.b4a.keywords.Common.CRLF))+"{g}"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_finalprice))+"{g}");
 //BA.debugLineNum = 975;BA.debugLine="Dim rich As RichString";
_rich = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 976;BA.debugLine="rich.Initialize(style)";
_rich.Initialize(BA.ObjectToCharSequence(_style));
 //BA.debugLineNum = 977;BA.debugLine="rich.Color2(Colors.Black,\"{g}\")";
_rich.Color2(anywheresoftware.b4a.keywords.Common.Colors.Black,"{g}");
 //BA.debugLineNum = 978;BA.debugLine="rich.Color2(Colors.Red,\"{r}\")";
_rich.Color2(anywheresoftware.b4a.keywords.Common.Colors.Red,"{r}");
 //BA.debugLineNum = 979;BA.debugLine="rich.Strikethrough2(\"{u}\")";
_rich.Strikethrough2("{u}");
 //BA.debugLineNum = 981;BA.debugLine="Return rich";
if (true) return _rich;
 //BA.debugLineNum = 983;BA.debugLine="End Sub";
return null;
}
public static String  _docommand(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.collections.List _texts) throws Exception{
int _i = 0;
String _res = "";
 //BA.debugLineNum = 1462;BA.debugLine="Sub DoCommand(Texts As List)";
 //BA.debugLineNum = 1464;BA.debugLine="If Texts.IsInitialized = False Then Return";
if (_texts.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 1466;BA.debugLine="For i = 0 To Texts.Size - 1";
{
final int step2 = 1;
final int limit2 = (int) (_texts.getSize()-1);
for (_i = (int) (0) ; (step2 > 0 && _i <= limit2) || (step2 < 0 && _i >= limit2); _i = ((int)(0 + _i + step2)) ) {
 //BA.debugLineNum = 1468;BA.debugLine="Dim res As String";
_res = "";
 //BA.debugLineNum = 1469;BA.debugLine="res = Texts.Get(i)";
_res = BA.ObjectToString(_texts.Get(_i));
 //BA.debugLineNum = 1471;BA.debugLine="If res.IndexOf(\"login\") > -1 Or res.IndexOf(\"ورو";
if (_res.indexOf("login")>-1 || _res.indexOf("ورود")>-1) { 
 //BA.debugLineNum = 1472;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(mostCurrent._actlogin.getObject()));
 }else if(_res.indexOf("register")>-1 || _res.indexOf("ثبت")>-1) { 
 //BA.debugLineNum = 1474;BA.debugLine="StartActivity(actRegister)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(mostCurrent._actregister.getObject()));
 }else if(_res.indexOf("category")>-1 || _res.indexOf("دسته")>-1) { 
 //BA.debugLineNum = 1476;BA.debugLine="StartActivity(actCategory)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(mostCurrent._actcategory.getObject()));
 }else if(_res.indexOf("contact")>-1 || _res.indexOf("ارتباط")>-1) { 
 //BA.debugLineNum = 1478;BA.debugLine="StartActivity(actContact)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(mostCurrent._actcontact.getObject()));
 }else if(_res.indexOf("about")>-1 || _res.indexOf("درباره")>-1) { 
 //BA.debugLineNum = 1480;BA.debugLine="StartActivity(actAbout)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(mostCurrent._actabout.getObject()));
 }else if(_res.indexOf("cart")>-1 || _res.indexOf("سبد")>-1) { 
 //BA.debugLineNum = 1482;BA.debugLine="StartActivity(actBasket)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(mostCurrent._actbasket.getObject()));
 }else if(_res.indexOf("search")>-1 || _res.indexOf("جستجو")>-1) { 
 //BA.debugLineNum = 1484;BA.debugLine="StartActivity(actSearch)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(mostCurrent._actsearch.getObject()));
 }else if(_res.indexOf("close")>-1 || _res.indexOf("برگرد")>-1 || _res.indexOf("عقب")>-1) { 
 //BA.debugLineNum = 1486;BA.debugLine="If CurrentModule <> Null Then";
if (_currentmodule!= null) { 
 //BA.debugLineNum = 1487;BA.debugLine="If SubExists(CurrentModule,\"CloseMe\") Then";
if (anywheresoftware.b4a.keywords.Common.SubExists(_ba,_currentmodule,"CloseMe")) { 
 //BA.debugLineNum = 1488;BA.debugLine="CallSubDelayed(CurrentModule,\"CloseMe\")";
anywheresoftware.b4a.keywords.Common.CallSubDelayed(_ba,_currentmodule,"CloseMe");
 };
 };
 };
 }
};
 //BA.debugLineNum = 1495;BA.debugLine="End Sub";
return "";
}
public static String  _edittexticon(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.EditTextWrapper _edittxt,String _icon) throws Exception{
anywheresoftware.b4j.object.JavaObject _etxt = null;
 //BA.debugLineNum = 1418;BA.debugLine="Sub EditTextIcon(EditTxt As EditText,Icon As Strin";
 //BA.debugLineNum = 1420;BA.debugLine="Dim ar As AndroidResources";
_ar = new uk.co.martinpearman.b4a.androidresources.AndroidResources();
 //BA.debugLineNum = 1421;BA.debugLine="Dim ETxt As JavaObject = EditTxt";
_etxt = new anywheresoftware.b4j.object.JavaObject();
_etxt.setObject((java.lang.Object)(_edittxt.getObject()));
 //BA.debugLineNum = 1423;BA.debugLine="ETxt.RunMethod(\"setCompoundDrawablesWithIntrinsic";
_etxt.RunMethod("setCompoundDrawablesWithIntrinsicBounds",new Object[]{(Object)(_ar.GetAndroidDrawable(_icon)),anywheresoftware.b4a.keywords.Common.Null,anywheresoftware.b4a.keywords.Common.Null,anywheresoftware.b4a.keywords.Common.Null});
 //BA.debugLineNum = 1425;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.objects.drawable.StateListDrawable  _getbuttonstate(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.objects.drawable.StateListDrawable _state = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c2 = null;
 //BA.debugLineNum = 1028;BA.debugLine="Public Sub GetButtonState As StateListDrawable";
 //BA.debugLineNum = 1030;BA.debugLine="Dim state As StateListDrawable";
_state = new anywheresoftware.b4a.objects.drawable.StateListDrawable();
 //BA.debugLineNum = 1031;BA.debugLine="Dim c1,c2 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
_c2 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1033;BA.debugLine="state.Initialize";
_state.Initialize();
 //BA.debugLineNum = 1034;BA.debugLine="c1.Initialize(ConvertHex2Int(GetStringResourse(\"b";
_c1.Initialize((int)(Double.parseDouble(_converthex2int(_ba,_getstringresourse(_ba,"button_hover_color")))),(int) (4));
 //BA.debugLineNum = 1035;BA.debugLine="c2.Initialize(ConvertHex2Int(GetStringResourse(\"b";
_c2.Initialize((int)(Double.parseDouble(_converthex2int(_ba,_getstringresourse(_ba,"button_active_color")))),(int) (4));
 //BA.debugLineNum = 1037;BA.debugLine="state.AddState(state.State_Pressed,c1)";
_state.AddState(_state.State_Pressed,(android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 1038;BA.debugLine="state.AddCatchAllState(c2)";
_state.AddCatchAllState((android.graphics.drawable.Drawable)(_c2.getObject()));
 //BA.debugLineNum = 1040;BA.debugLine="Return state";
if (true) return _state;
 //BA.debugLineNum = 1042;BA.debugLine="End Sub";
return null;
}
public static anywheresoftware.b4a.objects.drawable.StateListDrawable  _getbuttonstatecircle(anywheresoftware.b4a.BA _ba,int _width) throws Exception{
anywheresoftware.b4a.objects.drawable.StateListDrawable _state = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c2 = null;
 //BA.debugLineNum = 1060;BA.debugLine="Public Sub GetButtonStateCircle(Width As Int) As S";
 //BA.debugLineNum = 1062;BA.debugLine="Dim state As StateListDrawable";
_state = new anywheresoftware.b4a.objects.drawable.StateListDrawable();
 //BA.debugLineNum = 1063;BA.debugLine="Dim c1,c2 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
_c2 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1065;BA.debugLine="state.Initialize";
_state.Initialize();
 //BA.debugLineNum = 1066;BA.debugLine="c1.Initialize(Theme_Header,Width / 2)";
_c1.Initialize(_theme_header,(int) (_width/(double)2));
 //BA.debugLineNum = 1067;BA.debugLine="c2.Initialize(Theme_Header,Width / 2)";
_c2.Initialize(_theme_header,(int) (_width/(double)2));
 //BA.debugLineNum = 1069;BA.debugLine="state.AddState(state.State_Pressed,c1)";
_state.AddState(_state.State_Pressed,(android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 1070;BA.debugLine="state.AddCatchAllState(c2)";
_state.AddCatchAllState((android.graphics.drawable.Drawable)(_c2.getObject()));
 //BA.debugLineNum = 1072;BA.debugLine="Return state";
if (true) return _state;
 //BA.debugLineNum = 1074;BA.debugLine="End Sub";
return null;
}
public static anywheresoftware.b4a.objects.drawable.StateListDrawable  _getbuttonstateontheme(anywheresoftware.b4a.BA _ba,int _radius) throws Exception{
anywheresoftware.b4a.objects.drawable.StateListDrawable _state = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c2 = null;
 //BA.debugLineNum = 1044;BA.debugLine="Public Sub GetButtonStateOnTheme(Radius As Int) As";
 //BA.debugLineNum = 1046;BA.debugLine="Dim state As StateListDrawable";
_state = new anywheresoftware.b4a.objects.drawable.StateListDrawable();
 //BA.debugLineNum = 1047;BA.debugLine="Dim c1,c2 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
_c2 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1049;BA.debugLine="state.Initialize";
_state.Initialize();
 //BA.debugLineNum = 1050;BA.debugLine="c1.Initialize(Theme_Header + 4,Radius)";
_c1.Initialize((int) (_theme_header+4),_radius);
 //BA.debugLineNum = 1051;BA.debugLine="c2.Initialize(Theme_Header,Radius)";
_c2.Initialize(_theme_header,_radius);
 //BA.debugLineNum = 1053;BA.debugLine="state.AddState(state.State_Pressed,c1)";
_state.AddState(_state.State_Pressed,(android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 1054;BA.debugLine="state.AddCatchAllState(c2)";
_state.AddCatchAllState((android.graphics.drawable.Drawable)(_c2.getObject()));
 //BA.debugLineNum = 1056;BA.debugLine="Return state";
if (true) return _state;
 //BA.debugLineNum = 1058;BA.debugLine="End Sub";
return null;
}
public static String  _getdate(anywheresoftware.b4a.BA _ba,String _date1) throws Exception{
String[] _res = null;
String _month = "";
String[] _perdate = null;
anywheresoftware.b4a.student.PersianDate _per = null;
String[] _pp = null;
 //BA.debugLineNum = 522;BA.debugLine="Public Sub GetDate(date1 As String) As String";
 //BA.debugLineNum = 524;BA.debugLine="Dim res(),month,perDate() As String";
_res = new String[(int) (0)];
java.util.Arrays.fill(_res,"");
_month = "";
_perdate = new String[(int) (0)];
java.util.Arrays.fill(_perdate,"");
 //BA.debugLineNum = 525;BA.debugLine="Dim per As PersianDate";
_per = new anywheresoftware.b4a.student.PersianDate();
 //BA.debugLineNum = 527;BA.debugLine="Dim pp() As String";
_pp = new String[(int) (0)];
java.util.Arrays.fill(_pp,"");
 //BA.debugLineNum = 529;BA.debugLine="pp = Regex.Split(\" \",date1)";
_pp = anywheresoftware.b4a.keywords.Common.Regex.Split(" ",_date1);
 //BA.debugLineNum = 531;BA.debugLine="Try";
try { //BA.debugLineNum = 533;BA.debugLine="If pp(0).IndexOf(\"-\") > -1 Then";
if (_pp[(int) (0)].indexOf("-")>-1) { 
 //BA.debugLineNum = 534;BA.debugLine="res = Regex.Split(\"-\",pp(0))";
_res = anywheresoftware.b4a.keywords.Common.Regex.Split("-",_pp[(int) (0)]);
 }else {
 //BA.debugLineNum = 536;BA.debugLine="res = Regex.Split(\"/\",pp(0))";
_res = anywheresoftware.b4a.keywords.Common.Regex.Split("/",_pp[(int) (0)]);
 };
 //BA.debugLineNum = 539;BA.debugLine="month = res(1)";
_month = _res[(int) (1)];
 //BA.debugLineNum = 541;BA.debugLine="perDate = Regex.Split(\"/\",per.GetDate(res(0),mon";
_perdate = anywheresoftware.b4a.keywords.Common.Regex.Split("/",_per.getDate((int)(Double.parseDouble(_res[(int) (0)])),(int)(Double.parseDouble(_month)),(int)(Double.parseDouble(_res[(int) (2)])),"/"));
 //BA.debugLineNum = 543;BA.debugLine="Select Case perDate(1)";
switch (BA.switchObjectToInt(_perdate[(int) (1)],BA.NumberToString(1),BA.NumberToString(2),BA.NumberToString(3),BA.NumberToString(4),BA.NumberToString(5),BA.NumberToString(6),BA.NumberToString(7),BA.NumberToString(8),BA.NumberToString(9),BA.NumberToString(10),BA.NumberToString(11),BA.NumberToString(12))) {
case 0: {
 //BA.debugLineNum = 545;BA.debugLine="month = \"فروردین\"";
_month = "فروردین";
 break; }
case 1: {
 //BA.debugLineNum = 547;BA.debugLine="month = \"اردیبهشت\"";
_month = "اردیبهشت";
 break; }
case 2: {
 //BA.debugLineNum = 549;BA.debugLine="month = \"خرداد\"";
_month = "خرداد";
 break; }
case 3: {
 //BA.debugLineNum = 551;BA.debugLine="month = \"تیر\"";
_month = "تیر";
 break; }
case 4: {
 //BA.debugLineNum = 553;BA.debugLine="month = \"مرداد\"";
_month = "مرداد";
 break; }
case 5: {
 //BA.debugLineNum = 555;BA.debugLine="month = \"شهریور\"";
_month = "شهریور";
 break; }
case 6: {
 //BA.debugLineNum = 557;BA.debugLine="month = \"مهر\"";
_month = "مهر";
 break; }
case 7: {
 //BA.debugLineNum = 559;BA.debugLine="month = \"آبان\"";
_month = "آبان";
 break; }
case 8: {
 //BA.debugLineNum = 561;BA.debugLine="month = \"آذر\"";
_month = "آذر";
 break; }
case 9: {
 //BA.debugLineNum = 563;BA.debugLine="month = \"دی\"";
_month = "دی";
 break; }
case 10: {
 //BA.debugLineNum = 565;BA.debugLine="month = \"بهمن\"";
_month = "بهمن";
 break; }
case 11: {
 //BA.debugLineNum = 567;BA.debugLine="month = \"اسفند\"";
_month = "اسفند";
 break; }
}
;
 //BA.debugLineNum = 570;BA.debugLine="Return perDate(2) & \" \" & month & \" ماه \" & \" \"";
if (true) return _perdate[(int) (2)]+" "+_month+" ماه "+" "+_perdate[(int) (0)];
 } 
       catch (Exception e41) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e41); //BA.debugLineNum = 573;BA.debugLine="Return date1";
if (true) return _date1;
 };
 //BA.debugLineNum = 576;BA.debugLine="End Sub";
return "";
}
public static float  _getdevicephysicalsize(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.keywords.LayoutValues _lv = null;
 //BA.debugLineNum = 159;BA.debugLine="Sub GetDevicePhysicalSize As Float";
 //BA.debugLineNum = 160;BA.debugLine="Dim lv As LayoutValues";
_lv = new anywheresoftware.b4a.keywords.LayoutValues();
 //BA.debugLineNum = 161;BA.debugLine="lv = GetDeviceLayoutValues";
_lv = anywheresoftware.b4a.keywords.Common.GetDeviceLayoutValues(_ba);
 //BA.debugLineNum = 162;BA.debugLine="Return Sqrt(Power(lv.Height / lv.Scale / 160,";
if (true) return (float) (anywheresoftware.b4a.keywords.Common.Sqrt(anywheresoftware.b4a.keywords.Common.Power(_lv.Height/(double)_lv.Scale/(double)160,2)+anywheresoftware.b4a.keywords.Common.Power(_lv.Width/(double)_lv.Scale/(double)160,2)));
 //BA.debugLineNum = 163;BA.debugLine="End Sub";
return 0f;
}
public static String  _getfilename(anywheresoftware.b4a.BA _ba,String _fullpath) throws Exception{
String _res = "";
 //BA.debugLineNum = 461;BA.debugLine="Sub GetFilename(fullpath As String) As String";
 //BA.debugLineNum = 462;BA.debugLine="Dim res As String";
_res = "";
 //BA.debugLineNum = 463;BA.debugLine="res = fullpath.SubString(fullpath.LastIndexOf(\"/\"";
_res = _fullpath.substring((int) (_fullpath.lastIndexOf("/")+1));
 //BA.debugLineNum = 464;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 465;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.keywords.constants.TypefaceWrapper  _getfont(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 278;BA.debugLine="Sub GetFont As Typeface";
 //BA.debugLineNum = 280;BA.debugLine="If IsPersian Then";
if (_ispersian(_ba)) { 
 //BA.debugLineNum = 281;BA.debugLine="Return Typeface.LoadFromAssets(\"byekan.ttf\")";
if (true) return (anywheresoftware.b4a.keywords.constants.TypefaceWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.keywords.constants.TypefaceWrapper(), (android.graphics.Typeface)(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("byekan.ttf")));
 }else {
 //BA.debugLineNum = 283;BA.debugLine="Return Typeface.SANS_SERIF";
if (true) return (anywheresoftware.b4a.keywords.constants.TypefaceWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.keywords.constants.TypefaceWrapper(), (android.graphics.Typeface)(anywheresoftware.b4a.keywords.Common.Typeface.SANS_SERIF));
 };
 //BA.debugLineNum = 286;BA.debugLine="End Sub";
return null;
}
public static String  _getip(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.objects.SocketWrapper.ServerSocketWrapper _mylan = null;
String _ip = "";
 //BA.debugLineNum = 129;BA.debugLine="Sub GetIP As String";
 //BA.debugLineNum = 131;BA.debugLine="Dim mylan As ServerSocket";
_mylan = new anywheresoftware.b4a.objects.SocketWrapper.ServerSocketWrapper();
 //BA.debugLineNum = 132;BA.debugLine="mylan.Initialize(0,\"\")";
_mylan.Initialize((_ba.processBA == null ? _ba : _ba.processBA),(int) (0),"");
 //BA.debugLineNum = 134;BA.debugLine="Dim ip As String";
_ip = "";
 //BA.debugLineNum = 135;BA.debugLine="ip = mylan.GetMyIP";
_ip = _mylan.GetMyIP();
 //BA.debugLineNum = 137;BA.debugLine="Return ip";
if (true) return _ip;
 //BA.debugLineNum = 139;BA.debugLine="End Sub";
return "";
}
public static String  _getlanguage(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _obj1 = null;
Object[] _args = null;
String[] _types = null;
 //BA.debugLineNum = 1558;BA.debugLine="Sub GetLanguage As String";
 //BA.debugLineNum = 1559;BA.debugLine="Dim Obj1 As Reflector";
_obj1 = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 1560;BA.debugLine="Dim args(0) As Object";
_args = new Object[(int) (0)];
{
int d0 = _args.length;
for (int i0 = 0;i0 < d0;i0++) {
_args[i0] = new Object();
}
}
;
 //BA.debugLineNum = 1561;BA.debugLine="Dim types(0) As String";
_types = new String[(int) (0)];
java.util.Arrays.fill(_types,"");
 //BA.debugLineNum = 1562;BA.debugLine="Return Obj1.RunStaticMethod(\"java.util.Locale\", \"";
if (true) return BA.ObjectToString(_obj1.RunStaticMethod("java.util.Locale","getDefault",_args,_types));
 //BA.debugLineNum = 1563;BA.debugLine="End Sub";
return "";
}
public static int  _getlimitloaditem(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 1399;BA.debugLine="Public Sub GetLimitLoadItem As Int";
 //BA.debugLineNum = 1401;BA.debugLine="If GetDevicePhysicalSize > 6 Then";
if (_getdevicephysicalsize(_ba)>6) { 
 //BA.debugLineNum = 1402;BA.debugLine="Return 12";
if (true) return (int) (12);
 }else {
 //BA.debugLineNum = 1404;BA.debugLine="Return 7";
if (true) return (int) (7);
 };
 //BA.debugLineNum = 1407;BA.debugLine="End Sub";
return 0;
}
public static String  _getmd5(anywheresoftware.b4a.BA _ba,String _sstr,boolean _sonlynumber) throws Exception{
anywheresoftware.b4a.agraham.encryption.CipherWrapper.MessageDigestWrapper _md = null;
anywheresoftware.b4a.agraham.byteconverter.ByteConverter _bytecon = null;
byte[] _passwordhash = null;
String _md5string = "";
String _res = "";
int _i = 0;
 //BA.debugLineNum = 165;BA.debugLine="Sub GetMD5(sStr As String,sOnlynumber As Boolean)";
 //BA.debugLineNum = 166;BA.debugLine="Dim md As MessageDigest";
_md = new anywheresoftware.b4a.agraham.encryption.CipherWrapper.MessageDigestWrapper();
 //BA.debugLineNum = 167;BA.debugLine="Dim ByteCon As ByteConverter";
_bytecon = new anywheresoftware.b4a.agraham.byteconverter.ByteConverter();
 //BA.debugLineNum = 168;BA.debugLine="Dim passwordhash() As Byte";
_passwordhash = new byte[(int) (0)];
;
 //BA.debugLineNum = 170;BA.debugLine="passwordhash = md.GetMessageDigest(sStr.GetBytes(";
_passwordhash = _md.GetMessageDigest(_sstr.getBytes("UTF8"),"MD5");
 //BA.debugLineNum = 172;BA.debugLine="Dim md5string,res As String";
_md5string = "";
_res = "";
 //BA.debugLineNum = 174;BA.debugLine="md5string = ByteCon.HexFromBytes(passwordhash)";
_md5string = _bytecon.HexFromBytes(_passwordhash);
 //BA.debugLineNum = 176;BA.debugLine="If sOnlynumber = False Then";
if (_sonlynumber==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 177;BA.debugLine="Return md5string";
if (true) return _md5string;
 }else {
 //BA.debugLineNum = 179;BA.debugLine="For i = 0 To md5string.Length - 1";
{
final int step10 = 1;
final int limit10 = (int) (_md5string.length()-1);
for (_i = (int) (0) ; (step10 > 0 && _i <= limit10) || (step10 < 0 && _i >= limit10); _i = ((int)(0 + _i + step10)) ) {
 //BA.debugLineNum = 180;BA.debugLine="If IsNumber(md5string.CharAt(i)) Then";
if (anywheresoftware.b4a.keywords.Common.IsNumber(BA.ObjectToString(_md5string.charAt(_i)))) { 
 //BA.debugLineNum = 181;BA.debugLine="res = res & md5string.CharAt(i)";
_res = _res+BA.ObjectToString(_md5string.charAt(_i));
 };
 }
};
 //BA.debugLineNum = 184;BA.debugLine="Return res";
if (true) return _res;
 };
 //BA.debugLineNum = 187;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.objects.ConcreteViewWrapper  _getparent(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ConcreteViewWrapper _v) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
 //BA.debugLineNum = 79;BA.debugLine="Sub GetParent(v As View) As View";
 //BA.debugLineNum = 80;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 81;BA.debugLine="R.Target = v";
_r.Target = (Object)(_v.getObject());
 //BA.debugLineNum = 82;BA.debugLine="Try";
try { //BA.debugLineNum = 83;BA.debugLine="Return R.RunMethod(\"getParent\")";
if (true) return (anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_r.RunMethod("getParent")));
 } 
       catch (Exception e6) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e6); //BA.debugLineNum = 85;BA.debugLine="Return v";
if (true) return _v;
 };
 //BA.debugLineNum = 87;BA.debugLine="End Sub";
return null;
}
public static int[]  _getparentpaneldimension(anywheresoftware.b4a.BA _ba,String _layoutname) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _parent = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
 //BA.debugLineNum = 632;BA.debugLine="Public Sub GetParentPanelDimension(LayoutName As S";
 //BA.debugLineNum = 634;BA.debugLine="If TempDimension.Length > 0 Then Return TempDimen";
if (_tempdimension.length>0) { 
if (true) return _tempdimension;};
 //BA.debugLineNum = 636;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 637;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(_ba,"");
 //BA.debugLineNum = 638;BA.debugLine="p1.LoadLayout(LayoutName)";
_p1.LoadLayout(_layoutname,_ba);
 //BA.debugLineNum = 639;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 641;BA.debugLine="Dim parent As View";
_parent = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 642;BA.debugLine="Dim v1 As View";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 644;BA.debugLine="For Each v1 As View In p1.GetAllViewsRecursive";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group8 = _p1.GetAllViewsRecursive();
final int groupLen8 = group8.getSize();
for (int index8 = 0;index8 < groupLen8 ;index8++){
_v1.setObject((android.view.View)(group8.Get(index8)));
 //BA.debugLineNum = 645;BA.debugLine="If v1 Is Panel Then";
if (_v1.getObjectOrNull() instanceof android.view.ViewGroup) { 
 //BA.debugLineNum = 646;BA.debugLine="parent = v1";
_parent = _v1;
 //BA.debugLineNum = 647;BA.debugLine="Exit";
if (true) break;
 };
 //BA.debugLineNum = 649;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
;
 //BA.debugLineNum = 652;BA.debugLine="TempDimension = Array As Int(parent.Width,parent.";
_tempdimension = new int[]{_parent.getWidth(),_parent.getHeight()};
 //BA.debugLineNum = 654;BA.debugLine="Return Array As Int(parent.Width,parent.Height)";
if (true) return new int[]{_parent.getWidth(),_parent.getHeight()};
 //BA.debugLineNum = 656;BA.debugLine="End Sub";
return null;
}
public static int  _getrelativetop(anywheresoftware.b4a.BA _ba,anywheresoftware.b4j.object.JavaObject _v) throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _vw = null;
 //BA.debugLineNum = 1565;BA.debugLine="Sub GetRelativeTop(V As JavaObject) As Int";
 //BA.debugLineNum = 1569;BA.debugLine="If GetType(V) = \"android.view.ViewRoot\" Or GetTyp";
if ((anywheresoftware.b4a.keywords.Common.GetType((Object)(_v.getObject()))).equals("android.view.ViewRoot") || (anywheresoftware.b4a.keywords.Common.GetType((Object)(_v.getObject()))).equals("android.view.ViewRootImpl")) { 
 //BA.debugLineNum = 1570;BA.debugLine="Return 0";
if (true) return (int) (0);
 }else {
 //BA.debugLineNum = 1573;BA.debugLine="Try";
try { //BA.debugLineNum = 1574;BA.debugLine="Dim VW As View = V";
_vw = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
_vw.setObject((android.view.View)(_v.getObject()));
 //BA.debugLineNum = 1575;BA.debugLine="Return VW.Top + GetRelativeTop(V.RunMethod(\"get";
if (true) return (int) (_vw.getTop()+_getrelativetop(_ba,(anywheresoftware.b4j.object.JavaObject) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4j.object.JavaObject(), (java.lang.Object)(_v.RunMethod("getParent",(Object[])(anywheresoftware.b4a.keywords.Common.Null))))));
 } 
       catch (Exception e8) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e8); //BA.debugLineNum = 1577;BA.debugLine="Return GetRelativeTop(V.RunMethod(\"getParent\",N";
if (true) return _getrelativetop(_ba,(anywheresoftware.b4j.object.JavaObject) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4j.object.JavaObject(), (java.lang.Object)(_v.RunMethod("getParent",(Object[])(anywheresoftware.b4a.keywords.Common.Null)))));
 };
 };
 //BA.debugLineNum = 1580;BA.debugLine="End Sub";
return 0;
}
public static anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper  _getresourcebitmap(anywheresoftware.b4a.BA _ba,String _key) throws Exception{
anywheresoftware.b4a.objects.drawable.BitmapDrawable _bd = null;
 //BA.debugLineNum = 430;BA.debugLine="Sub GetResourceBitmap(key As String) As Bitmap";
 //BA.debugLineNum = 432;BA.debugLine="Dim bd As BitmapDrawable";
_bd = new anywheresoftware.b4a.objects.drawable.BitmapDrawable();
 //BA.debugLineNum = 433;BA.debugLine="bd = ar.GetApplicationDrawable(key)";
_bd.setObject((android.graphics.drawable.BitmapDrawable)(_ar.GetApplicationDrawable(_key)));
 //BA.debugLineNum = 434;BA.debugLine="Return bd.Bitmap";
if (true) return (anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper(), (android.graphics.Bitmap)(_bd.getBitmap()));
 //BA.debugLineNum = 436;BA.debugLine="End Sub";
return null;
}
public static boolean  _getroot(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.phone.Phone _p = null;
boolean _isroot = false;
 //BA.debugLineNum = 1542;BA.debugLine="Sub GetRoot As Boolean";
 //BA.debugLineNum = 1544;BA.debugLine="Dim p As Phone";
_p = new anywheresoftware.b4a.phone.Phone();
 //BA.debugLineNum = 1545;BA.debugLine="Dim IsRoot As Boolean";
_isroot = false;
 //BA.debugLineNum = 1546;BA.debugLine="Try";
try { //BA.debugLineNum = 1547;BA.debugLine="p.Shell(\"su\", Null, Null, Null)";
_p.Shell("su",(String[])(anywheresoftware.b4a.keywords.Common.Null),(java.lang.StringBuilder)(anywheresoftware.b4a.keywords.Common.Null),(java.lang.StringBuilder)(anywheresoftware.b4a.keywords.Common.Null));
 //BA.debugLineNum = 1548;BA.debugLine="File.WriteString(\"/\", \"test.txt\", \"\")";
anywheresoftware.b4a.keywords.Common.File.WriteString("/","test.txt","");
 //BA.debugLineNum = 1549;BA.debugLine="IsRoot = True";
_isroot = anywheresoftware.b4a.keywords.Common.True;
 } 
       catch (Exception e8) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e8); //BA.debugLineNum = 1551;BA.debugLine="IsRoot = False";
_isroot = anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 1554;BA.debugLine="Return IsRoot";
if (true) return _isroot;
 //BA.debugLineNum = 1556;BA.debugLine="End Sub";
return false;
}
public static String  _getstringresourse(anywheresoftware.b4a.BA _ba,String _key) throws Exception{
String _s = "";
 //BA.debugLineNum = 390;BA.debugLine="Sub GetStringResourse(Key As String) As String";
 //BA.debugLineNum = 392;BA.debugLine="Try";
try { //BA.debugLineNum = 393;BA.debugLine="Dim s As String";
_s = "";
 //BA.debugLineNum = 394;BA.debugLine="s = ar.GetApplicationString(Key)";
_s = _ar.GetApplicationString(_key);
 //BA.debugLineNum = 395;BA.debugLine="If s.Length = 0 Then Log(\"key \" & Key & \" is emp";
if (_s.length()==0) { 
anywheresoftware.b4a.keywords.Common.Log("key "+_key+" is empty");};
 //BA.debugLineNum = 396;BA.debugLine="If s = Null Then Return \"\"";
if (_s== null) { 
if (true) return "";};
 //BA.debugLineNum = 397;BA.debugLine="Return s";
if (true) return _s;
 } 
       catch (Exception e8) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e8); //BA.debugLineNum = 399;BA.debugLine="Return \"\"";
if (true) return "";
 };
 //BA.debugLineNum = 402;BA.debugLine="End Sub";
return "";
}
public static String  _hidescrollbar(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ScrollViewWrapper _scrollview1) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
 //BA.debugLineNum = 1009;BA.debugLine="Sub HideScrollbar(ScrollView1 As ScrollView)";
 //BA.debugLineNum = 1010;BA.debugLine="Dim r As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 1011;BA.debugLine="r.Target = ScrollView1";
_r.Target = (Object)(_scrollview1.getObject());
 //BA.debugLineNum = 1012;BA.debugLine="r.RunMethod2(\"setVerticalScrollBarEnabled\", False";
_r.RunMethod2("setVerticalScrollBarEnabled",BA.ObjectToString(anywheresoftware.b4a.keywords.Common.False),"java.lang.boolean");
 //BA.debugLineNum = 1013;BA.debugLine="End Sub";
return "";
}
public static boolean  _internetstate(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.objects.SocketWrapper.ServerSocketWrapper _mylan = null;
String _ip = "";
 //BA.debugLineNum = 89;BA.debugLine="Sub InternetState As Boolean";
 //BA.debugLineNum = 91;BA.debugLine="Dim mylan As ServerSocket";
_mylan = new anywheresoftware.b4a.objects.SocketWrapper.ServerSocketWrapper();
 //BA.debugLineNum = 92;BA.debugLine="mylan.Initialize(0,\"\")";
_mylan.Initialize((_ba.processBA == null ? _ba : _ba.processBA),(int) (0),"");
 //BA.debugLineNum = 94;BA.debugLine="Dim ip As String";
_ip = "";
 //BA.debugLineNum = 95;BA.debugLine="ip = mylan.GetMyIP";
_ip = _mylan.GetMyIP();
 //BA.debugLineNum = 97;BA.debugLine="If ip = \"127.0.0.1\" Then";
if ((_ip).equals("127.0.0.1")) { 
 //BA.debugLineNum = 98;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 }else {
 //BA.debugLineNum = 100;BA.debugLine="If Regex.IsMatch(\"\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{";
if (anywheresoftware.b4a.keywords.Common.Regex.IsMatch("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}",_ip)) { 
 //BA.debugLineNum = 101;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 103;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 };
 //BA.debugLineNum = 107;BA.debugLine="End Sub";
return false;
}
public static boolean  _isenglish(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 308;BA.debugLine="Sub IsEnglish As Boolean";
 //BA.debugLineNum = 310;BA.debugLine="If manager.GetString(\"lang\").IndexOf(\"انگلیسی\") >";
if (_manager.GetString("lang").indexOf("انگلیسی")>-1 || _manager.GetString("lang").toLowerCase().indexOf("english")>-1) { 
 //BA.debugLineNum = 311;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 313;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 316;BA.debugLine="End Sub";
return false;
}
public static boolean  _isenglish2(anywheresoftware.b4a.BA _ba,String _lang) throws Exception{
 //BA.debugLineNum = 318;BA.debugLine="Sub IsEnglish2(Lang As String) As Boolean";
 //BA.debugLineNum = 320;BA.debugLine="If Lang.IndexOf(\"انگلیسی\") > -1 Or Lang.ToLowerCa";
if (_lang.indexOf("انگلیسی")>-1 || _lang.toLowerCase().indexOf("english")>-1) { 
 //BA.debugLineNum = 321;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 323;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 326;BA.debugLine="End Sub";
return false;
}
public static boolean  _ispersian(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 288;BA.debugLine="Sub IsPersian As Boolean";
 //BA.debugLineNum = 290;BA.debugLine="If manager.GetString(\"lang\").IndexOf(\"فارسی\") > -";
if (_manager.GetString("lang").indexOf("فارسی")>-1 || _manager.GetString("lang").toLowerCase().indexOf("persian")>-1) { 
 //BA.debugLineNum = 291;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 293;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 296;BA.debugLine="End Sub";
return false;
}
public static boolean  _ispersian2(anywheresoftware.b4a.BA _ba,String _lang) throws Exception{
 //BA.debugLineNum = 298;BA.debugLine="Sub IsPersian2(Lang As String) As Boolean";
 //BA.debugLineNum = 300;BA.debugLine="If Lang.IndexOf(\"فارسی\") > -1 Or Lang.ToLowerCase";
if (_lang.indexOf("فارسی")>-1 || _lang.toLowerCase().indexOf("persian")>-1) { 
 //BA.debugLineNum = 301;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 303;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 306;BA.debugLine="End Sub";
return false;
}
public static String  _labelspace(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ConcreteViewWrapper _view1,float _space) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _obj1 = null;
 //BA.debugLineNum = 141;BA.debugLine="Sub LabelSpace(view1 As View,Space As Float)";
 //BA.debugLineNum = 142;BA.debugLine="Dim Obj1 As Reflector";
_obj1 = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 143;BA.debugLine="Obj1.Target = view1";
_obj1.Target = (Object)(_view1.getObject());
 //BA.debugLineNum = 144;BA.debugLine="Obj1.RunMethod3(\"setLineSpacing\", Space, \"java.la";
_obj1.RunMethod3("setLineSpacing",BA.NumberToString(_space),"java.lang.float",BA.NumberToString(_space),"java.lang.float");
 //BA.debugLineNum = 145;BA.debugLine="End Sub";
return "";
}
public static String  _list2json(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.collections.List _data) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 266;BA.debugLine="Sub List2Json(Data As List) As String";
 //BA.debugLineNum = 268;BA.debugLine="If Data = Null Then Return \"\"";
if (_data== null) { 
if (true) return "";};
 //BA.debugLineNum = 269;BA.debugLine="If Data.IsInitialized = False Then Return \"\"";
if (_data.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 271;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 272;BA.debugLine="js.Initialize2(Data)";
_js.Initialize2(_data);
 //BA.debugLineNum = 273;BA.debugLine="Return js.ToString";
if (true) return _js.ToString();
 //BA.debugLineNum = 275;BA.debugLine="End Sub";
return "";
}
public static int  _loadproduct(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.collections.List _res,int _defaulttop,anywheresoftware.b4a.objects.ScrollViewWrapper _scrollview1) throws Exception{
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
int[] _dimension = null;
int _left = 0;
int _top = 0;
int _countitem = 0;
int _allspace = 0;
int _spaceunit = 0;
anywheresoftware.b4a.objects.drawable.BitmapDrawable _error_image = null;
int _i = 0;
anywheresoftware.b4a.objects.PanelWrapper _pa = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.ImageViewWrapper _imgtemp = null;
anywheresoftware.b4a.objects.LabelWrapper _templabel = null;
anywheresoftware.b4a.objects.LabelWrapper _labelprice = null;
anywheresoftware.b4a.objects.PanelWrapper _temppanel = null;
anywheresoftware.b4a.objects.ProgressBarWrapper _progress = null;
anywheresoftware.b4a.objects.PanelWrapper _parentpanel = null;
String _price = "";
String _special = "";
int _quantity = 0;
String _pathimage = "";
 //BA.debugLineNum = 658;BA.debugLine="Sub LoadProduct(res As List,DefaultTop As Int,Scro";
 //BA.debugLineNum = 660;BA.debugLine="Dim Glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 662;BA.debugLine="Dim Dimension(),Left,Top As Int";
_dimension = new int[(int) (0)];
;
_left = 0;
_top = 0;
 //BA.debugLineNum = 663;BA.debugLine="Dim countItem,AllSpace,SpaceUnit As Int";
_countitem = 0;
_allspace = 0;
_spaceunit = 0;
 //BA.debugLineNum = 665;BA.debugLine="Dimension = GetParentPanelDimension(\"frmproduct_t";
_dimension = _getparentpaneldimension(_ba,"frmproduct_template");
 //BA.debugLineNum = 667;BA.debugLine="countItem = 100%x / Dimension(0)";
_countitem = (int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),_ba)/(double)_dimension[(int) (0)]);
 //BA.debugLineNum = 668;BA.debugLine="AllSpace = 100%x - (countItem * Dimension(0))";
_allspace = (int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),_ba)-(_countitem*_dimension[(int) (0)]));
 //BA.debugLineNum = 670;BA.debugLine="SpaceUnit = AllSpace /(countItem + 1)";
_spaceunit = (int) (_allspace/(double)(_countitem+1));
 //BA.debugLineNum = 672;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0)";
_left = (int) ((_countitem*_dimension[(int) (0)])-_dimension[(int) (0)]+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 674;BA.debugLine="If GetDevicePhysicalSize > 5 Then Left = Left - (";
if (_getdevicephysicalsize(_ba)>5) { 
_left = (int) (_left-(_spaceunit*2));};
 //BA.debugLineNum = 676;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0)";
_left = (int) ((_countitem*_dimension[(int) (0)])-_dimension[(int) (0)]+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 677;BA.debugLine="Top = DefaultTop";
_top = _defaulttop;
 //BA.debugLineNum = 679;BA.debugLine="Dim error_image As BitmapDrawable";
_error_image = new anywheresoftware.b4a.objects.drawable.BitmapDrawable();
 //BA.debugLineNum = 680;BA.debugLine="error_image.Initialize(LoadBitmap(File.DirAssets,";
_error_image.Initialize((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"noimage.png").getObject()));
 //BA.debugLineNum = 684;BA.debugLine="For i = 1 To res.Size";
{
final int step14 = 1;
final int limit14 = _res.getSize();
for (_i = (int) (1) ; (step14 > 0 && _i <= limit14) || (step14 < 0 && _i >= limit14); _i = ((int)(0 + _i + step14)) ) {
 //BA.debugLineNum = 686;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 687;BA.debugLine="Dim pa As Panel";
_pa = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 688;BA.debugLine="pa.Initialize(\"\")";
_pa.Initialize(_ba,"");
 //BA.debugLineNum = 689;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,Top,ScrollView";
_scrollview1.getPanel().AddView((android.view.View)(_pa.getObject()),_left,_top,_scrollview1.getWidth(),(int) (0));
 //BA.debugLineNum = 690;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
_pa.LoadLayout("frmproduct_template",_ba);
 //BA.debugLineNum = 691;BA.debugLine="pa.Height = Dimension(1)";
_pa.setHeight(_dimension[(int) (1)]);
 //BA.debugLineNum = 692;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 694;BA.debugLine="Dim Temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 695;BA.debugLine="Temp = res.Get(i-1)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((int) (_i-1))));
 //BA.debugLineNum = 698;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 700;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = new anywheresoftware.b4a.objects.LabelWrapper();
_labelprice = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 701;BA.debugLine="Dim TempPanel As Panel";
_temppanel = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 702;BA.debugLine="Dim progress As ProgressBar";
_progress = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 703;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = new anywheresoftware.b4a.objects.PanelWrapper();
_parentpanel.setObject((android.view.ViewGroup)(_pa.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 706;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.setObject((android.widget.ImageView)(_parentpanel.GetView((int) (4)).getObject()));
 //BA.debugLineNum = 707;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.setObject((android.widget.TextView)(_parentpanel.GetView((int) (1)).getObject()));
 //BA.debugLineNum = 708;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.setObject((android.widget.TextView)(_parentpanel.GetView((int) (2)).getObject()));
 //BA.debugLineNum = 709;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.setObject((android.view.ViewGroup)(_parentpanel.GetView((int) (6)).getObject()));
 //BA.debugLineNum = 710;BA.debugLine="progress = ParentPanel.GetView(0)";
_progress.setObject((android.widget.ProgressBar)(_parentpanel.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 712;BA.debugLine="TempLabel.Text = Temp.Get(\"name\")";
_templabel.setText(BA.ObjectToCharSequence(_temp.Get((Object)("name"))));
 //BA.debugLineNum = 713;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
_templabel.setText(BA.ObjectToCharSequence(_templabel.getText().replace("&quot;",anywheresoftware.b4a.keywords.Common.QUOTE).replace("&amp;","&")));
 //BA.debugLineNum = 715;BA.debugLine="If (TempLabel.Text.Length > 30) Then TempLabel.T";
if ((_templabel.getText().length()>30)) { 
_templabel.setText(BA.ObjectToCharSequence(_templabel.getText().substring((int) (0),(int) (30))+"..."));};
 //BA.debugLineNum = 716;BA.debugLine="LabelSpace(TempLabel,0.7)";
_labelspace(_ba,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_templabel.getObject())),(float) (0.7));
 //BA.debugLineNum = 718;BA.debugLine="Dim price,special As String";
_price = "";
_special = "";
 //BA.debugLineNum = 720;BA.debugLine="If Temp.ContainsKey(\"price_formated\") Then";
if (_temp.ContainsKey((Object)("price_formated"))) { 
 //BA.debugLineNum = 721;BA.debugLine="price   = Temp.Get(\"price_formated\")";
_price = BA.ObjectToString(_temp.Get((Object)("price_formated")));
 }else {
 //BA.debugLineNum = 723;BA.debugLine="price   = Temp.Get(\"price\")";
_price = BA.ObjectToString(_temp.Get((Object)("price")));
 };
 //BA.debugLineNum = 726;BA.debugLine="If Temp.ContainsKey(\"special_formated\") Then";
if (_temp.ContainsKey((Object)("special_formated"))) { 
 //BA.debugLineNum = 727;BA.debugLine="special = Temp.Get(\"special_formated\")";
_special = BA.ObjectToString(_temp.Get((Object)("special_formated")));
 //BA.debugLineNum = 728;BA.debugLine="If Temp.ContainsKey(\"special\") Then";
if (_temp.ContainsKey((Object)("special"))) { 
 //BA.debugLineNum = 729;BA.debugLine="If Temp.Get(\"special\") = \"0\" Then";
if ((_temp.Get((Object)("special"))).equals((Object)("0"))) { 
 //BA.debugLineNum = 730;BA.debugLine="special = \"\"";
_special = "";
 };
 };
 }else if(_temp.ContainsKey((Object)("special"))) { 
 //BA.debugLineNum = 734;BA.debugLine="special = Temp.Get(\"special\")";
_special = BA.ObjectToString(_temp.Get((Object)("special")));
 //BA.debugLineNum = 735;BA.debugLine="If special = \"0 تومان\" Then special = \"\"";
if ((_special).equals("0 تومان")) { 
_special = "";};
 };
 //BA.debugLineNum = 738;BA.debugLine="If special = \"null\" Or special = \"false\" Then sp";
if ((_special).equals("null") || (_special).equals("false")) { 
_special = "";};
 //BA.debugLineNum = 740;BA.debugLine="TempLabel.Typeface = GetFont";
_templabel.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 741;BA.debugLine="LabelPrice.Typeface = GetFont";
_labelprice.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 743;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if (_price.length()>0 && _special.length()==0) { 
 //BA.debugLineNum = 744;BA.debugLine="If price.StartsWith(\"0\") = True Then";
if (_price.startsWith("0")==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 745;BA.debugLine="LabelPrice.Text = GetStringResourse(\"call_us\")";
_labelprice.setText(BA.ObjectToCharSequence(_getstringresourse(_ba,"call_us")));
 }else {
 //BA.debugLineNum = 747;BA.debugLine="LabelPrice.Text = price";
_labelprice.setText(BA.ObjectToCharSequence(_price));
 };
 }else if(_special.length()>0) { 
 //BA.debugLineNum = 750;BA.debugLine="LabelPrice.Text = DiscountStyleLabel(price,spec";
_labelprice.setText(BA.ObjectToCharSequence(_discountstylelabel(_ba,_price,_special).getObject()));
 };
 //BA.debugLineNum = 753;BA.debugLine="If LabelPrice.Text.ToLowerCase = \"false\" Then La";
if ((_labelprice.getText().toLowerCase()).equals("false")) { 
_labelprice.setText(BA.ObjectToCharSequence(_getstringresourse(_ba,"login_account")));};
 //BA.debugLineNum = 755;BA.debugLine="Dim quantity As Int";
_quantity = 0;
 //BA.debugLineNum = 757;BA.debugLine="If Temp.ContainsKey(\"quantity\") Then";
if (_temp.ContainsKey((Object)("quantity"))) { 
 //BA.debugLineNum = 758;BA.debugLine="quantity = Temp.Get(\"quantity\")";
_quantity = (int)(BA.ObjectToNumber(_temp.Get((Object)("quantity"))));
 }else {
 //BA.debugLineNum = 760;BA.debugLine="quantity = -1";
_quantity = (int) (-1);
 };
 //BA.debugLineNum = 763;BA.debugLine="If quantity = 0 Then";
if (_quantity==0) { 
 //BA.debugLineNum = 764;BA.debugLine="LabelPrice.Text = Temp.Get(\"stock_status\")";
_labelprice.setText(BA.ObjectToCharSequence(_temp.Get((Object)("stock_status"))));
 };
 //BA.debugLineNum = 767;BA.debugLine="Dim PathImage As String";
_pathimage = "";
 //BA.debugLineNum = 769;BA.debugLine="If Temp.ContainsKey(\"image\") Then";
if (_temp.ContainsKey((Object)("image"))) { 
 //BA.debugLineNum = 770;BA.debugLine="PathImage = Temp.Get(\"image\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("image")));
 }else if(_temp.ContainsKey((Object)("thumb"))) { 
 //BA.debugLineNum = 772;BA.debugLine="PathImage = Temp.Get(\"thumb\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("thumb")));
 };
 //BA.debugLineNum = 775;BA.debugLine="PathImage = PathImage.Replace(\" \",\"%20\")";
_pathimage = _pathimage.replace(" ","%20");
 //BA.debugLineNum = 777;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ((_pathimage.toLowerCase()).equals("null") || _pathimage.length()==0) { 
 //BA.debugLineNum = 778;BA.debugLine="Glide.Load(\"file:///android_asset/noimage1.png\"";
_glide.Load((Object)("file:///android_asset/noimage1.png")).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getHeight()))).CenterCrop().IntoImageView(_imgtemp);
 }else {
 //BA.debugLineNum = 780;BA.debugLine="Glide.Load(PathImage).AsBitmap.Resize(Abs(imgTe";
_glide.Load((Object)(_pathimage)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_imgtemp.getHeight()))).CenterCrop().IntoImageView(_imgtemp);
 };
 //BA.debugLineNum = 783;BA.debugLine="progress.RemoveView";
_progress.RemoveView();
 //BA.debugLineNum = 785;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ((_temppanel.getTag()).equals((Object)("over"))) { 
 //BA.debugLineNum = 786;BA.debugLine="TempPanel.Tag = Temp";
_temppanel.setTag((Object)(_temp.getObject()));
 }else if((_temppanel.getTag()).equals((Object)("topbar"))) { 
 //BA.debugLineNum = 788;BA.debugLine="TempPanel.Color = Theme_Header";
_temppanel.setColor(_theme_header);
 };
 //BA.debugLineNum = 793;BA.debugLine="If i Mod countItem = 0 Then";
if (_i%_countitem==0) { 
 //BA.debugLineNum = 794;BA.debugLine="Top = Top + pa.Height + 15dip";
_top = (int) (_top+_pa.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (15)));
 //BA.debugLineNum = 795;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.He";
_scrollview1.getPanel().setHeight((int) (_scrollview1.getPanel().getHeight()+_pa.getHeight()));
 //BA.debugLineNum = 796;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(";
_left = (int) ((_countitem*_dimension[(int) (0)])-_dimension[(int) (0)]+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 }else {
 //BA.debugLineNum = 799;BA.debugLine="Left = Left - SpaceUnit - Dimension(0)";
_left = (int) (_left-_spaceunit-_dimension[(int) (0)]);
 };
 }
};
 //BA.debugLineNum = 805;BA.debugLine="If res.Size Mod countItem <> 0 Then";
if (_res.getSize()%_countitem!=0) { 
 //BA.debugLineNum = 806;BA.debugLine="Top = Top + Dimension(1)";
_top = (int) (_top+_dimension[(int) (1)]);
 //BA.debugLineNum = 807;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.Hei";
_scrollview1.getPanel().setHeight((int) (_scrollview1.getPanel().getHeight()+_dimension[(int) (1)]));
 };
 //BA.debugLineNum = 810;BA.debugLine="Return Top";
if (true) return _top;
 //BA.debugLineNum = 812;BA.debugLine="End Sub";
return 0;
}
public static int  _loadproducthorizontalscroll(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.collections.List _res,anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _scrollview1) throws Exception{
int _left = 0;
int[] _dimension = null;
String _t2 = "";
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 814;BA.debugLine="Sub LoadProductHorizontalScroll(res As List,Scroll";
 //BA.debugLineNum = 816;BA.debugLine="Dim left As Int = 20";
_left = (int) (20);
 //BA.debugLineNum = 818;BA.debugLine="Dim Dimension() As Int";
_dimension = new int[(int) (0)];
;
 //BA.debugLineNum = 820;BA.debugLine="Dim t2 As String";
_t2 = "";
 //BA.debugLineNum = 821;BA.debugLine="t2 = ScrollView1.Tag";
_t2 = BA.ObjectToString(_scrollview1.getTag());
 //BA.debugLineNum = 823;BA.debugLine="Dimension = GetParentPanelDimension(\"frmproduct_t";
_dimension = _getparentpaneldimension(_ba,"frmproduct_template");
 //BA.debugLineNum = 825;BA.debugLine="For i = 0 To res.Size - 1";
{
final int step6 = 1;
final int limit6 = (int) (_res.getSize()-1);
for (_i = (int) (0) ; (step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6); _i = ((int)(0 + _i + step6)) ) {
 //BA.debugLineNum = 827;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 828;BA.debugLine="temp = res.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get(_i)));
 //BA.debugLineNum = 830;BA.debugLine="AddProduct2Panel(ScrollView1,left,Dimension,tem";
_addproduct2panel(_ba,_scrollview1,_left,_dimension,_temp);
 //BA.debugLineNum = 832;BA.debugLine="left = left + Dimension(0) + 10dip";
_left = (int) (_left+_dimension[(int) (0)]+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)));
 }
};
 //BA.debugLineNum = 836;BA.debugLine="ScrollView1.Panel.Width = left";
_scrollview1.getPanel().setWidth(_left);
 //BA.debugLineNum = 838;BA.debugLine="Return Dimension(0)";
if (true) return _dimension[(int) (0)];
 //BA.debugLineNum = 840;BA.debugLine="End Sub";
return 0;
}
public static String  _loadtheme(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 446;BA.debugLine="Sub LoadTheme";
 //BA.debugLineNum = 447;BA.debugLine="Theme_Header = ConvertHex2Int(ar.GetApplicationSt";
_theme_header = (int)(Double.parseDouble(_converthex2int(_ba,_ar.GetApplicationString("theme_header"))));
 //BA.debugLineNum = 448;BA.debugLine="Theme_Footer = ConvertHex2Int(ar.GetApplicationSt";
_theme_footer = (int)(Double.parseDouble(_converthex2int(_ba,_ar.GetApplicationString("theme_footer"))));
 //BA.debugLineNum = 449;BA.debugLine="Theme_Background = ConvertHex2Int(ar.GetApplicati";
_theme_background = (int)(Double.parseDouble(_converthex2int(_ba,_ar.GetApplicationString("theme_bg"))));
 //BA.debugLineNum = 450;BA.debugLine="End Sub";
return "";
}
public static String  _makedatedialog(anywheresoftware.b4a.BA _ba,String _year,String _month,String _day) throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _lblyear = null;
anywheresoftware.b4a.objects.LabelWrapper _lblmonth = null;
anywheresoftware.b4a.objects.LabelWrapper _lblday = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.SpinnerWrapper _spyear = null;
anywheresoftware.b4a.objects.SpinnerWrapper _spmonth = null;
anywheresoftware.b4a.objects.SpinnerWrapper _spday = null;
anywheresoftware.b4a.agraham.dialogs.InputDialog.CustomDialog2 _d1 = null;
String _currday = "";
String _currmonth = "";
String _curryear = "";
anywheresoftware.b4a.student.PersianDate _pr = null;
String _date1 = "";
String[] _date2 = null;
int _i = 0;
int _sfrom = 0;
int _j = 0;
int _s = 0;
 //BA.debugLineNum = 1076;BA.debugLine="Public Sub MakeDateDialog(Year As String,Month As";
 //BA.debugLineNum = 1078;BA.debugLine="Dim lblyear,lblmonth,lblday As Label";
_lblyear = new anywheresoftware.b4a.objects.LabelWrapper();
_lblmonth = new anywheresoftware.b4a.objects.LabelWrapper();
_lblday = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1079;BA.debugLine="lblyear.Initialize(\"\")";
_lblyear.Initialize(_ba,"");
 //BA.debugLineNum = 1080;BA.debugLine="lblmonth.Initialize(\"\")";
_lblmonth.Initialize(_ba,"");
 //BA.debugLineNum = 1081;BA.debugLine="lblday.Initialize(\"\")";
_lblday.Initialize(_ba,"");
 //BA.debugLineNum = 1083;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 1084;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(_ba,"");
 //BA.debugLineNum = 1086;BA.debugLine="Dim spyear,spmonth,spday As Spinner";
_spyear = new anywheresoftware.b4a.objects.SpinnerWrapper();
_spmonth = new anywheresoftware.b4a.objects.SpinnerWrapper();
_spday = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 1087;BA.debugLine="spyear.Initialize(\"\")";
_spyear.Initialize(_ba,"");
 //BA.debugLineNum = 1088;BA.debugLine="spmonth.Initialize(\"\")";
_spmonth.Initialize(_ba,"");
 //BA.debugLineNum = 1089;BA.debugLine="spday.Initialize(\"\")";
_spday.Initialize(_ba,"");
 //BA.debugLineNum = 1091;BA.debugLine="Dim d1 As CustomDialog2";
_d1 = new anywheresoftware.b4a.agraham.dialogs.InputDialog.CustomDialog2();
 //BA.debugLineNum = 1092;BA.debugLine="d1.AddView(p1,400,450)";
_d1.AddView((android.view.View)(_p1.getObject()),(int) (400),(int) (450));
 //BA.debugLineNum = 1093;BA.debugLine="p1.AddView(lblyear,0,5,p1.Width,30dip)";
_p1.AddView((android.view.View)(_lblyear.getObject()),(int) (0),(int) (5),_p1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 1094;BA.debugLine="p1.AddView(spyear,0,32dip,p1.Width,30dip)";
_p1.AddView((android.view.View)(_spyear.getObject()),(int) (0),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (32)),_p1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 1095;BA.debugLine="p1.AddView(lblmonth,0,spyear.Height + spyear.Top";
_p1.AddView((android.view.View)(_lblmonth.getObject()),(int) (0),(int) (_spyear.getHeight()+_spyear.getTop()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4))),_p1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 1096;BA.debugLine="p1.AddView(spmonth,0,spyear.Height + lblmonth.Top";
_p1.AddView((android.view.View)(_spmonth.getObject()),(int) (0),(int) (_spyear.getHeight()+_lblmonth.getTop()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4))),_p1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 1097;BA.debugLine="p1.AddView(lblday,0,spyear.Height + spmonth.Top+";
_p1.AddView((android.view.View)(_lblday.getObject()),(int) (0),(int) (_spyear.getHeight()+_spmonth.getTop()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4))),_p1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 1098;BA.debugLine="p1.AddView(spday,0,spyear.Height + lblday.Top+ 4d";
_p1.AddView((android.view.View)(_spday.getObject()),(int) (0),(int) (_spyear.getHeight()+_lblday.getTop()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4))),_p1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 1100;BA.debugLine="lblyear.Text = GetStringResourse(\"year\")";
_lblyear.setText(BA.ObjectToCharSequence(_getstringresourse(_ba,"year")));
 //BA.debugLineNum = 1101;BA.debugLine="lblmonth.Text = GetStringResourse(\"month\")";
_lblmonth.setText(BA.ObjectToCharSequence(_getstringresourse(_ba,"month")));
 //BA.debugLineNum = 1102;BA.debugLine="lblday.Text = GetStringResourse(\"day\")";
_lblday.setText(BA.ObjectToCharSequence(_getstringresourse(_ba,"day")));
 //BA.debugLineNum = 1103;BA.debugLine="lblyear.Gravity = GetStringResourse(\"direction\")";
_lblyear.setGravity((int)(Double.parseDouble(_getstringresourse(_ba,"direction"))));
 //BA.debugLineNum = 1104;BA.debugLine="lblmonth.Gravity = GetStringResourse(\"direction\")";
_lblmonth.setGravity((int)(Double.parseDouble(_getstringresourse(_ba,"direction"))));
 //BA.debugLineNum = 1105;BA.debugLine="lblday.Gravity = GetStringResourse(\"direction\")";
_lblday.setGravity((int)(Double.parseDouble(_getstringresourse(_ba,"direction"))));
 //BA.debugLineNum = 1106;BA.debugLine="lblyear.Typeface = GetFont";
_lblyear.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 1107;BA.debugLine="lblmonth.Typeface = GetFont";
_lblmonth.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 1108;BA.debugLine="lblday.Typeface = GetFont";
_lblday.setTypeface((android.graphics.Typeface)(_getfont(_ba).getObject()));
 //BA.debugLineNum = 1109;BA.debugLine="spyear.TextSize = 12";
_spyear.setTextSize((float) (12));
 //BA.debugLineNum = 1110;BA.debugLine="spmonth.TextSize = 12";
_spmonth.setTextSize((float) (12));
 //BA.debugLineNum = 1111;BA.debugLine="spday.TextSize = 12";
_spday.setTextSize((float) (12));
 //BA.debugLineNum = 1113;BA.debugLine="Dim currday,currmonth,curryear As String";
_currday = "";
_currmonth = "";
_curryear = "";
 //BA.debugLineNum = 1115;BA.debugLine="If IsPersian = False Then";
if (_ispersian(_ba)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1116;BA.debugLine="currday = DateTime.GetDayOfMonth(DateTime.Now)";
_currday = BA.NumberToString(anywheresoftware.b4a.keywords.Common.DateTime.GetDayOfMonth(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 //BA.debugLineNum = 1117;BA.debugLine="currmonth = DateTime.GetMonth(DateTime.Now)";
_currmonth = BA.NumberToString(anywheresoftware.b4a.keywords.Common.DateTime.GetMonth(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 //BA.debugLineNum = 1118;BA.debugLine="curryear = DateTime.GetYear(DateTime.Now)";
_curryear = BA.NumberToString(anywheresoftware.b4a.keywords.Common.DateTime.GetYear(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 }else {
 //BA.debugLineNum = 1120;BA.debugLine="Dim pr As PersianDate";
_pr = new anywheresoftware.b4a.student.PersianDate();
 //BA.debugLineNum = 1121;BA.debugLine="Dim date1,date2() As String";
_date1 = "";
_date2 = new String[(int) (0)];
java.util.Arrays.fill(_date2,"");
 //BA.debugLineNum = 1122;BA.debugLine="date1 = pr.GetDate(0,0,0,\"/\")";
_date1 = _pr.getDate((int) (0),(int) (0),(int) (0),"/");
 //BA.debugLineNum = 1123;BA.debugLine="date2 = Regex.Split(\"/\",date1)";
_date2 = anywheresoftware.b4a.keywords.Common.Regex.Split("/",_date1);
 //BA.debugLineNum = 1124;BA.debugLine="currday = date2(2)";
_currday = _date2[(int) (2)];
 //BA.debugLineNum = 1125;BA.debugLine="currmonth = date2(1)";
_currmonth = _date2[(int) (1)];
 //BA.debugLineNum = 1126;BA.debugLine="curryear = date2(0)";
_curryear = _date2[(int) (0)];
 };
 //BA.debugLineNum = 1129;BA.debugLine="For i = 1 To 31";
{
final int step45 = 1;
final int limit45 = (int) (31);
for (_i = (int) (1) ; (step45 > 0 && _i <= limit45) || (step45 < 0 && _i >= limit45); _i = ((int)(0 + _i + step45)) ) {
 //BA.debugLineNum = 1130;BA.debugLine="If i < 13 Then";
if (_i<13) { 
 //BA.debugLineNum = 1132;BA.debugLine="spmonth.Add(i)";
_spmonth.Add(BA.NumberToString(_i));
 //BA.debugLineNum = 1134;BA.debugLine="If i = Month And Month <> 0 Then";
if (_i==(double)(Double.parseDouble(_month)) && (_month).equals(BA.NumberToString(0)) == false) { 
 //BA.debugLineNum = 1135;BA.debugLine="spmonth.SelectedIndex = i-1";
_spmonth.setSelectedIndex((int) (_i-1));
 }else if(_i==(double)(Double.parseDouble(_currmonth))) { 
 //BA.debugLineNum = 1137;BA.debugLine="spmonth.SelectedIndex = i-1";
_spmonth.setSelectedIndex((int) (_i-1));
 };
 };
 //BA.debugLineNum = 1142;BA.debugLine="spday.Add(i)";
_spday.Add(BA.NumberToString(_i));
 //BA.debugLineNum = 1144;BA.debugLine="If i = Day And Day <> 0 Then";
if (_i==(double)(Double.parseDouble(_day)) && (_day).equals(BA.NumberToString(0)) == false) { 
 //BA.debugLineNum = 1145;BA.debugLine="spday.SelectedIndex = i-1";
_spday.setSelectedIndex((int) (_i-1));
 }else if(_i==(double)(Double.parseDouble(_currday))) { 
 //BA.debugLineNum = 1147;BA.debugLine="spday.SelectedIndex = i-1";
_spday.setSelectedIndex((int) (_i-1));
 };
 }
};
 //BA.debugLineNum = 1152;BA.debugLine="Dim sFrom As Int = 1900";
_sfrom = (int) (1900);
 //BA.debugLineNum = 1154;BA.debugLine="If IsPersian Then";
if (_ispersian(_ba)) { 
 //BA.debugLineNum = 1155;BA.debugLine="sFrom = 1350";
_sfrom = (int) (1350);
 };
 //BA.debugLineNum = 1158;BA.debugLine="For j = sFrom To sFrom + 100";
{
final int step65 = 1;
final int limit65 = (int) (_sfrom+100);
for (_j = _sfrom ; (step65 > 0 && _j <= limit65) || (step65 < 0 && _j >= limit65); _j = ((int)(0 + _j + step65)) ) {
 //BA.debugLineNum = 1159;BA.debugLine="spyear.Add(j)";
_spyear.Add(BA.NumberToString(_j));
 }
};
 //BA.debugLineNum = 1162;BA.debugLine="For s = 0 To spyear.Size - 1";
{
final int step68 = 1;
final int limit68 = (int) (_spyear.getSize()-1);
for (_s = (int) (0) ; (step68 > 0 && _s <= limit68) || (step68 < 0 && _s >= limit68); _s = ((int)(0 + _s + step68)) ) {
 //BA.debugLineNum = 1164;BA.debugLine="If spyear.GetItem(s) = Year And Year <> 0 Then";
if ((_spyear.GetItem(_s)).equals(_year) && (_year).equals(BA.NumberToString(0)) == false) { 
 //BA.debugLineNum = 1165;BA.debugLine="spyear.SelectedIndex = s";
_spyear.setSelectedIndex(_s);
 }else if((_spyear.GetItem(_s)).equals(_curryear)) { 
 //BA.debugLineNum = 1167;BA.debugLine="spyear.SelectedIndex = s";
_spyear.setSelectedIndex(_s);
 };
 }
};
 //BA.debugLineNum = 1172;BA.debugLine="If d1.Show(GetStringResourse(\"date_enter\"),GetStr";
if (_d1.Show(_getstringresourse(_ba,"date_enter"),_getstringresourse(_ba,"ok"),_getstringresourse(_ba,"cancel"),"",_ba,(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null))==anywheresoftware.b4a.keywords.Common.DialogResponse.POSITIVE) { 
 //BA.debugLineNum = 1173;BA.debugLine="Return $\"${spyear.SelectedItem}/${spmonth.Select";
if (true) return (""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_spyear.getSelectedItem()))+"/"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_spmonth.getSelectedItem()))+"/"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_spday.getSelectedItem()))+"");
 }else {
 //BA.debugLineNum = 1175;BA.debugLine="Return \"\"";
if (true) return "";
 };
 //BA.debugLineNum = 1178;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.objects.ButtonWrapper  _makeupscrollbutton(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.PanelWrapper _panel) throws Exception{
int _size = 0;
anywheresoftware.b4a.objects.ButtonWrapper _b1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
 //BA.debugLineNum = 1508;BA.debugLine="Sub MakeUpScrollButton(Panel As Panel) As Button";
 //BA.debugLineNum = 1510;BA.debugLine="Dim size As Int : size = 40dip";
_size = 0;
 //BA.debugLineNum = 1510;BA.debugLine="Dim size As Int : size = 40dip";
_size = anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40));
 //BA.debugLineNum = 1512;BA.debugLine="Dim b1 As Button";
_b1 = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 1513;BA.debugLine="b1.Initialize(\"btnScrollUp\")";
_b1.Initialize(_ba,"btnScrollUp");
 //BA.debugLineNum = 1515;BA.debugLine="b1.Typeface = Typeface.LoadFromAssets(\"icomoon.tt";
_b1.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("icomoon.ttf"));
 //BA.debugLineNum = 1516;BA.debugLine="b1.Text = \"\"";
_b1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 1517;BA.debugLine="b1.TextColor = Colors.White";
_b1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1518;BA.debugLine="b1.TextSize = 15";
_b1.setTextSize((float) (15));
 //BA.debugLineNum = 1520;BA.debugLine="Panel.AddView(b1,Panel.Width - 48dip,Panel.Height";
_panel.AddView((android.view.View)(_b1.getObject()),(int) (_panel.getWidth()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))),(int) (_panel.getHeight()+_size+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))),_size,_size);
 //BA.debugLineNum = 1522;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1523;BA.debugLine="c1.Initialize(Theme_Header,size/2)";
_c1.Initialize(_theme_header,(int) (_size/(double)2));
 //BA.debugLineNum = 1524;BA.debugLine="b1.Background = c1";
_b1.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 1526;BA.debugLine="Return b1";
if (true) return _b1;
 //BA.debugLineNum = 1528;BA.debugLine="End Sub";
return null;
}
public static String  _map2json(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.collections.Map _data) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 255;BA.debugLine="Sub Map2Json(Data As Map) As String";
 //BA.debugLineNum = 257;BA.debugLine="If Data = Null Then Return \"\"";
if (_data== null) { 
if (true) return "";};
 //BA.debugLineNum = 258;BA.debugLine="If Data.IsInitialized = False Then Return \"\"";
if (_data.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 260;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 261;BA.debugLine="js.Initialize(Data)";
_js.Initialize(_data);
 //BA.debugLineNum = 262;BA.debugLine="Return js.ToString";
if (true) return _js.ToString();
 //BA.debugLineNum = 264;BA.debugLine="End Sub";
return "";
}
public static String  _paddinglabel(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.LabelWrapper _lbl,int _left,int _top,int _right,int _bottom) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
 //BA.debugLineNum = 626;BA.debugLine="Public Sub PaddingLabel(lbl As Label,Left As Int,T";
 //BA.debugLineNum = 627;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 628;BA.debugLine="R.Target = lbl";
_r.Target = (Object)(_lbl.getObject());
 //BA.debugLineNum = 629;BA.debugLine="R.RunMethod4(\"setPadding\", Array As Object(Left,T";
_r.RunMethod4("setPadding",new Object[]{(Object)(_left),(Object)(_top),(Object)(_right),(Object)(_bottom)},new String[]{"java.lang.int","java.lang.int","java.lang.int","java.lang.int"});
 //BA.debugLineNum = 630;BA.debugLine="End Sub";
return "";
}
public static int[]  _parsedate(anywheresoftware.b4a.BA _ba,String _date) throws Exception{
String[] _ra = null;
 //BA.debugLineNum = 1180;BA.debugLine="Public Sub ParseDate(Date As String) As Int()";
 //BA.debugLineNum = 1182;BA.debugLine="Dim ra() As String";
_ra = new String[(int) (0)];
java.util.Arrays.fill(_ra,"");
 //BA.debugLineNum = 1183;BA.debugLine="ra = Regex.Split(\"/\",Date)";
_ra = anywheresoftware.b4a.keywords.Common.Regex.Split("/",_date);
 //BA.debugLineNum = 1185;BA.debugLine="If ra.Length = 3 Then";
if (_ra.length==3) { 
 //BA.debugLineNum = 1186;BA.debugLine="Return Array As Int(ra(0),ra(1),ra(2))";
if (true) return new int[]{(int)(Double.parseDouble(_ra[(int) (0)])),(int)(Double.parseDouble(_ra[(int) (1)])),(int)(Double.parseDouble(_ra[(int) (2)]))};
 }else {
 //BA.debugLineNum = 1188;BA.debugLine="Return Array As Int(0,0,0)";
if (true) return new int[]{(int) (0),(int) (0),(int) (0)};
 };
 //BA.debugLineNum = 1191;BA.debugLine="End Sub";
return null;
}
public static int[]  _parsetime(anywheresoftware.b4a.BA _ba,String _time) throws Exception{
String[] _ra = null;
 //BA.debugLineNum = 1193;BA.debugLine="Public Sub ParseTime(Time As String) As Int()";
 //BA.debugLineNum = 1195;BA.debugLine="Dim ra() As String";
_ra = new String[(int) (0)];
java.util.Arrays.fill(_ra,"");
 //BA.debugLineNum = 1196;BA.debugLine="ra = Regex.Split(\":\",Time)";
_ra = anywheresoftware.b4a.keywords.Common.Regex.Split(":",_time);
 //BA.debugLineNum = 1198;BA.debugLine="If ra.Length = 2 Then";
if (_ra.length==2) { 
 //BA.debugLineNum = 1199;BA.debugLine="Return Array As Int(ra(0),ra(1))";
if (true) return new int[]{(int)(Double.parseDouble(_ra[(int) (0)])),(int)(Double.parseDouble(_ra[(int) (1)]))};
 }else {
 //BA.debugLineNum = 1201;BA.debugLine="Return Array As Int(DateTime.GetHour(DateTime.No";
if (true) return new int[]{anywheresoftware.b4a.keywords.Common.DateTime.GetHour(anywheresoftware.b4a.keywords.Common.DateTime.getNow()),anywheresoftware.b4a.keywords.Common.DateTime.GetMinute(anywheresoftware.b4a.keywords.Common.DateTime.getNow())};
 };
 //BA.debugLineNum = 1204;BA.debugLine="End Sub";
return null;
}
public static String  _parseurl_scheme(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.IntentWrapper _intent1) throws Exception{
String _i1 = "";
anywheresoftware.b4a.keywords.Regex.MatcherWrapper _m = null;
 //BA.debugLineNum = 1378;BA.debugLine="Sub ParseURL_Scheme(Intent1 As Intent) As String";
 //BA.debugLineNum = 1380;BA.debugLine="Dim i1 As String";
_i1 = "";
 //BA.debugLineNum = 1381;BA.debugLine="i1 = Intent1";
_i1 = BA.ObjectToString(_intent1);
 //BA.debugLineNum = 1382;BA.debugLine="i1 = i1.ToLowerCase";
_i1 = _i1.toLowerCase();
 //BA.debugLineNum = 1384;BA.debugLine="If i1.IndexOf($\"dat=opencart://${GetStringResours";
if (_i1.indexOf(("dat=opencart://"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_getstringresourse(_ba,"scheme")))+""))>-1) { 
 //BA.debugLineNum = 1386;BA.debugLine="Dim m As Matcher";
_m = new anywheresoftware.b4a.keywords.Regex.MatcherWrapper();
 //BA.debugLineNum = 1387;BA.debugLine="m = Regex.Matcher($\"dat=opencart://${GetStringRe";
_m = anywheresoftware.b4a.keywords.Common.Regex.Matcher(("dat=opencart://"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_getstringresourse(_ba,"scheme")))+"/(\\d+)"),_i1);
 //BA.debugLineNum = 1389;BA.debugLine="If m.Find Then";
if (_m.Find()) { 
 //BA.debugLineNum = 1390;BA.debugLine="Return m.Group(1)";
if (true) return _m.Group((int) (1));
 };
 };
 //BA.debugLineNum = 1395;BA.debugLine="Return \"\"";
if (true) return "";
 //BA.debugLineNum = 1397;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Public blnOpenNoInternet As Boolean";
_blnopennointernet = false;
 //BA.debugLineNum = 5;BA.debugLine="Public Theme_Header,Theme_Footer,Theme_Background";
_theme_header = 0;
_theme_footer = 0;
_theme_background = 0;
 //BA.debugLineNum = 6;BA.debugLine="Public ar As AndroidResources";
_ar = new uk.co.martinpearman.b4a.androidresources.AndroidResources();
 //BA.debugLineNum = 7;BA.debugLine="Public token As Map";
_token = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 8;BA.debugLine="Public ProductChoosenID As String";
_productchoosenid = "";
 //BA.debugLineNum = 9;BA.debugLine="Public CartDetails As Map";
_cartdetails = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 10;BA.debugLine="Public currLang,currCurrency As String";
_currlang = "";
_currcurrency = "";
 //BA.debugLineNum = 11;BA.debugLine="Public manager As AHPreferenceManager";
_manager = new de.amberhome.objects.preferenceactivity.PreferenceManager();
 //BA.debugLineNum = 12;BA.debugLine="Public phone1 As PhoneId";
_phone1 = new anywheresoftware.b4a.phone.Phone.PhoneId();
 //BA.debugLineNum = 13;BA.debugLine="Public phoneInfo As Phone";
_phoneinfo = new anywheresoftware.b4a.phone.Phone();
 //BA.debugLineNum = 14;BA.debugLine="Public loginDetails As Map";
_logindetails = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 15;BA.debugLine="Public Coupons As List";
_coupons = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 16;BA.debugLine="Public GuestLogin As Map";
_guestlogin = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 17;BA.debugLine="Public imagesSlideshow,FeatureProduct,BestProduct";
_imagesslideshow = new anywheresoftware.b4a.objects.collections.List();
_featureproduct = new anywheresoftware.b4a.objects.collections.List();
_bestproduct = new anywheresoftware.b4a.objects.collections.List();
_newproduct = new anywheresoftware.b4a.objects.collections.List();
_specialproduct = new anywheresoftware.b4a.objects.collections.List();
_listslideshow = new anywheresoftware.b4a.objects.collections.List();
_listmanufacturers = new anywheresoftware.b4a.objects.collections.List();
_listinformation = new anywheresoftware.b4a.objects.collections.List();
_listbanners = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 18;BA.debugLine="Public StoreID As String : StoreID = \"0\"";
_storeid = "";
 //BA.debugLineNum = 18;BA.debugLine="Public StoreID As String : StoreID = \"0\"";
_storeid = "0";
 //BA.debugLineNum = 19;BA.debugLine="Public wishlist As String";
_wishlist = "";
 //BA.debugLineNum = 20;BA.debugLine="Public comparelist As String";
_comparelist = "";
 //BA.debugLineNum = 21;BA.debugLine="Public ChoosenAddress As Int";
_choosenaddress = 0;
 //BA.debugLineNum = 22;BA.debugLine="Type ResponseAddItem(View1 As View,Top As Int,Lef";
;
 //BA.debugLineNum = 23;BA.debugLine="Public TempDimension() As Int";
_tempdimension = new int[(int) (0)];
;
 //BA.debugLineNum = 24;BA.debugLine="Public PaymentSuccess As Boolean";
_paymentsuccess = false;
 //BA.debugLineNum = 25;BA.debugLine="Public Sign As CheckSignature";
_sign = new com.devil.signature.CheckSignature();
 //BA.debugLineNum = 26;BA.debugLine="Public FirstRun As Boolean";
_firstrun = false;
 //BA.debugLineNum = 27;BA.debugLine="Public StringUtil As StringUtils";
_stringutil = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 28;BA.debugLine="Public CacheSystem As CacheSystem";
_cachesystem = new com.apps.demo.cachesystem();
 //BA.debugLineNum = 29;BA.debugLine="Public ListProductIDForCompare As List";
_listproductidforcompare = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 30;BA.debugLine="Public ShopState As Boolean";
_shopstate = false;
 //BA.debugLineNum = 31;BA.debugLine="Public Config As Map";
_config = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 32;BA.debugLine="Public CurrentModule As Object";
_currentmodule = new Object();
 //BA.debugLineNum = 33;BA.debugLine="Public Bookmarked As Map";
_bookmarked = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 34;BA.debugLine="Public OpenProductFromPush As String";
_openproductfrompush = "";
 //BA.debugLineNum = 35;BA.debugLine="End Sub";
return "";
}
public static Object  _readobjectfile(anywheresoftware.b4a.BA _ba,String _filename) throws Exception{
anywheresoftware.b4a.randomaccessfile.RandomAccessFile _rn = null;
String _res = "";
 //BA.debugLineNum = 1436;BA.debugLine="Sub ReadObjectFile(Filename As String) As Object";
 //BA.debugLineNum = 1438;BA.debugLine="Dim rn As RandomAccessFile";
_rn = new anywheresoftware.b4a.randomaccessfile.RandomAccessFile();
 //BA.debugLineNum = 1439;BA.debugLine="Dim res As String";
_res = "";
 //BA.debugLineNum = 1441;BA.debugLine="rn.Initialize(File.DirInternal,Filename,True)";
_rn.Initialize(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),_filename,anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1442;BA.debugLine="res = rn.ReadObject(0)";
_res = BA.ObjectToString(_rn.ReadObject((long) (0)));
 //BA.debugLineNum = 1443;BA.debugLine="rn.Close";
_rn.Close();
 //BA.debugLineNum = 1445;BA.debugLine="Return res";
if (true) return (Object)(_res);
 //BA.debugLineNum = 1447;BA.debugLine="End Sub";
return null;
}
public static anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString  _redstring(anywheresoftware.b4a.BA _ba,String _str) throws Exception{
String _style = "";
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _rich = null;
 //BA.debugLineNum = 1015;BA.debugLine="Public Sub RedString(Str As String) As RichString";
 //BA.debugLineNum = 1017;BA.debugLine="Dim style As String";
_style = "";
 //BA.debugLineNum = 1018;BA.debugLine="style = $\"{r}${Str}{r}\"$";
_style = ("{r}"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_str))+"{r}");
 //BA.debugLineNum = 1020;BA.debugLine="Dim rich As RichString";
_rich = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 1021;BA.debugLine="rich.Initialize(style)";
_rich.Initialize(BA.ObjectToCharSequence(_style));
 //BA.debugLineNum = 1022;BA.debugLine="rich.Color2(Colors.Red,\"{r}\")";
_rich.Color2(anywheresoftware.b4a.keywords.Common.Colors.Red,"{r}");
 //BA.debugLineNum = 1024;BA.debugLine="Return rich";
if (true) return _rich;
 //BA.debugLineNum = 1026;BA.debugLine="End Sub";
return null;
}
public static String  _regexreplace(anywheresoftware.b4a.BA _ba,String _pattern,String _text,String _replacement) throws Exception{
anywheresoftware.b4a.keywords.Regex.MatcherWrapper _m = null;
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
 //BA.debugLineNum = 1206;BA.debugLine="Sub RegexReplace(Pattern As String, Text As String";
 //BA.debugLineNum = 1207;BA.debugLine="Dim m As Matcher";
_m = new anywheresoftware.b4a.keywords.Regex.MatcherWrapper();
 //BA.debugLineNum = 1208;BA.debugLine="m = Regex.Matcher(Pattern, Text)";
_m = anywheresoftware.b4a.keywords.Common.Regex.Matcher(_pattern,_text);
 //BA.debugLineNum = 1209;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 1210;BA.debugLine="R.Target = m";
_r.Target = (Object)(_m.getObject());
 //BA.debugLineNum = 1211;BA.debugLine="Return R.RunMethod2(\"replaceAll\", Replacement,";
if (true) return BA.ObjectToString(_r.RunMethod2("replaceAll",_replacement,"java.lang.String"));
 //BA.debugLineNum = 1212;BA.debugLine="End Sub";
return "";
}
public static String  _requestsearchbar(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _ref = null;
 //BA.debugLineNum = 227;BA.debugLine="Sub RequestSearchBar";
 //BA.debugLineNum = 228;BA.debugLine="Dim ref As Reflector";
_ref = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 229;BA.debugLine="ref.Target = ref.GetActivity";
_ref.Target = (Object)(_ref.GetActivity((_ba.processBA == null ? _ba : _ba.processBA)));
 //BA.debugLineNum = 230;BA.debugLine="ref.RunPublicmethod(\"onSearchRequested\", Null, Nu";
_ref.RunPublicmethod("onSearchRequested",(Object[])(anywheresoftware.b4a.keywords.Common.Null),(String[])(anywheresoftware.b4a.keywords.Common.Null));
 //BA.debugLineNum = 231;BA.debugLine="End Sub";
return "";
}
public static String  _scalecenteranimation(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ConcreteViewWrapper _view1,float _fromx,String _fromy,float _tox,float _toy,float _duration) throws Exception{
flm.b4a.animationplus.AnimationPlusWrapper _ani = null;
 //BA.debugLineNum = 1497;BA.debugLine="Sub ScaleCenterAnimation(View1 As View,fromx As Fl";
 //BA.debugLineNum = 1499;BA.debugLine="Dim ani As AnimationPlus";
_ani = new flm.b4a.animationplus.AnimationPlusWrapper();
 //BA.debugLineNum = 1500;BA.debugLine="ani.InitializeScaleCenter(\"ani\",fromx,fromy,tox,t";
_ani.InitializeScaleCenter(_ba,"ani",_fromx,(float)(Double.parseDouble(_fromy)),_tox,_toy,(android.view.View)(_view1.getObject()));
 //BA.debugLineNum = 1501;BA.debugLine="ani.Duration = Duration";
_ani.setDuration((long) (_duration));
 //BA.debugLineNum = 1502;BA.debugLine="ani.PersistAfter = False";
_ani.setPersistAfter(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1503;BA.debugLine="ani.Start(View1)";
_ani.Start((android.view.View)(_view1.getObject()));
 //BA.debugLineNum = 1504;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1506;BA.debugLine="End Sub";
return "";
}
public static String  _setanimation(anywheresoftware.b4a.BA _ba,String _inanimation,String _outanimation) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
String _package = "";
int _in = 0;
int _out = 0;
 //BA.debugLineNum = 63;BA.debugLine="Private Sub SetAnimation(InAnimation As String, Ou";
 //BA.debugLineNum = 64;BA.debugLine="Try";
try { //BA.debugLineNum = 65;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 66;BA.debugLine="Dim package As String";
_package = "";
 //BA.debugLineNum = 67;BA.debugLine="Dim In, out As Int";
_in = 0;
_out = 0;
 //BA.debugLineNum = 68;BA.debugLine="package = R.GetStaticField(\"anywheresoftware";
_package = BA.ObjectToString(_r.GetStaticField("anywheresoftware.b4a.BA","packageName"));
 //BA.debugLineNum = 69;BA.debugLine="In = R.GetStaticField(package & \".R$anim\", In";
_in = (int)(BA.ObjectToNumber(_r.GetStaticField(_package+".R$anim",_inanimation)));
 //BA.debugLineNum = 70;BA.debugLine="out = R.GetStaticField(package & \".R$anim\", O";
_out = (int)(BA.ObjectToNumber(_r.GetStaticField(_package+".R$anim",_outanimation)));
 //BA.debugLineNum = 71;BA.debugLine="R.Target = R.GetActivity";
_r.Target = (Object)(_r.GetActivity((_ba.processBA == null ? _ba : _ba.processBA)));
 //BA.debugLineNum = 72;BA.debugLine="R.RunMethod4(\"overridePendingTransition\", Arr";
_r.RunMethod4("overridePendingTransition",new Object[]{(Object)(_in),(Object)(_out)},new String[]{"java.lang.int","java.lang.int"});
 } 
       catch (Exception e11) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e11); };
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
return "";
}
public static String  _setdivider(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ListViewWrapper _lv,int _color,int _height) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
 //BA.debugLineNum = 328;BA.debugLine="Sub SetDivider(lv As ListView, Color As Int, Heigh";
 //BA.debugLineNum = 329;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 330;BA.debugLine="R.Target = lv";
_r.Target = (Object)(_lv.getObject());
 //BA.debugLineNum = 331;BA.debugLine="Dim CD As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 332;BA.debugLine="CD.Initialize(Color, 0)";
_cd.Initialize(_color,(int) (0));
 //BA.debugLineNum = 333;BA.debugLine="R.RunMethod4(\"setDivider\", Array As Object(CD),";
_r.RunMethod4("setDivider",new Object[]{(Object)(_cd.getObject())},new String[]{"android.graphics.drawable.Drawable"});
 //BA.debugLineNum = 334;BA.debugLine="R.RunMethod2(\"setDividerHeight\", Height, \"java.";
_r.RunMethod2("setDividerHeight",BA.NumberToString(_height),"java.lang.int");
 //BA.debugLineNum = 335;BA.debugLine="End Sub";
return "";
}
public static String  _setlocalapp(anywheresoftware.b4a.BA _ba,String _lang) throws Exception{
uk.co.martinpearman.b4a.util.Locale _loc = null;
uk.co.martinpearman.b4a.content.res.Resources _res = null;
 //BA.debugLineNum = 412;BA.debugLine="Sub setLocalApp(lang As String)";
 //BA.debugLineNum = 414;BA.debugLine="Dim loc As Locale";
_loc = new uk.co.martinpearman.b4a.util.Locale();
 //BA.debugLineNum = 415;BA.debugLine="Dim res As Resources";
_res = new uk.co.martinpearman.b4a.content.res.Resources();
 //BA.debugLineNum = 417;BA.debugLine="If IsPersian2(lang) Then";
if (_ispersian2(_ba,_lang)) { 
 //BA.debugLineNum = 418;BA.debugLine="loc.Initialize(\"fa\")";
_loc.Initialize("fa");
 }else if(_isenglish2(_ba,_lang)) { 
 //BA.debugLineNum = 420;BA.debugLine="loc.Initialize(\"en\")";
_loc.Initialize("en");
 }else {
 //BA.debugLineNum = 422;BA.debugLine="loc.Initialize(\"fa\")";
_loc.Initialize("fa");
 };
 //BA.debugLineNum = 425;BA.debugLine="res.SetDefaultLocale(loc)";
_res.SetDefaultLocale((java.util.Locale)(_loc.getObject()));
 //BA.debugLineNum = 426;BA.debugLine="res.Initialize(res.RESOURCE_SOURCE_APPLICATION)";
_res.Initialize(_res.RESOURCE_SOURCE_APPLICATION);
 //BA.debugLineNum = 428;BA.debugLine="End Sub";
return "";
}
public static String  _setpaddinglabel(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.LabelWrapper _mlbl) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
 //BA.debugLineNum = 494;BA.debugLine="Sub setPaddingLabel(mLbl As Label)";
 //BA.debugLineNum = 495;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 496;BA.debugLine="R.Target = mLbl";
_r.Target = (Object)(_mlbl.getObject());
 //BA.debugLineNum = 497;BA.debugLine="R.RunMethod4(\"setPadding\", Array As Object(0,0,0,";
_r.RunMethod4("setPadding",new Object[]{(Object)(0),(Object)(0),(Object)(0),(Object)(0)},new String[]{"java.lang.int","java.lang.int","java.lang.int","java.lang.int"});
 //BA.debugLineNum = 498;BA.debugLine="R.RunMethod4(\"setIncludeFontPadding\", Array As Ob";
_r.RunMethod4("setIncludeFontPadding",new Object[]{(Object)(anywheresoftware.b4a.keywords.Common.False)},new String[]{"java.lang.boolean"});
 //BA.debugLineNum = 499;BA.debugLine="End Sub";
return "";
}
public static String  _setprogressdrawable(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ProgressBarWrapper _p) throws Exception{
anywheresoftware.b4a.objects.drawable.GradientDrawable _gd = null;
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
Object _clipdrawable = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
 //BA.debugLineNum = 201;BA.debugLine="Sub SetProgressDrawable(P As ProgressBar)";
 //BA.debugLineNum = 202;BA.debugLine="Dim gd As GradientDrawable";
_gd = new anywheresoftware.b4a.objects.drawable.GradientDrawable();
 //BA.debugLineNum = 203;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 204;BA.debugLine="Dim clipDrawable As Object";
_clipdrawable = new Object();
 //BA.debugLineNum = 205;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 207;BA.debugLine="gd.Initialize(\"TOP_BOTTOM\", Array As Int(Theme_He";
_gd.Initialize(BA.getEnumFromString(android.graphics.drawable.GradientDrawable.Orientation.class,"TOP_BOTTOM"),new int[]{_theme_header,_theme_header});
 //BA.debugLineNum = 208;BA.debugLine="gd.CornerRadius = 3dip";
_gd.setCornerRadius((float) (anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (3))));
 //BA.debugLineNum = 209;BA.debugLine="cd.Initialize(Colors.RGB(224,224,224), 0)";
_cd.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (224),(int) (224),(int) (224)),(int) (0));
 //BA.debugLineNum = 211;BA.debugLine="Dim R As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 212;BA.debugLine="Dim clipDrawable As Object";
_clipdrawable = new Object();
 //BA.debugLineNum = 213;BA.debugLine="clipDrawable = R.CreateObject2(\"android.graphics.";
_clipdrawable = _r.CreateObject2("android.graphics.drawable.ClipDrawable",new Object[]{(Object)(_gd.getObject()),(Object)(anywheresoftware.b4a.keywords.Common.Gravity.LEFT),(Object)(1)},new String[]{"android.graphics.drawable.Drawable","java.lang.int","java.lang.int"});
 //BA.debugLineNum = 216;BA.debugLine="R.Target = P";
_r.Target = (Object)(_p.getObject());
 //BA.debugLineNum = 217;BA.debugLine="R.Target = R.RunMethod(\"getProgressDrawable\") 'Ge";
_r.Target = _r.RunMethod("getProgressDrawable");
 //BA.debugLineNum = 218;BA.debugLine="R.RunMethod4(\"setDrawableByLayerId\", _ 		Array As";
_r.RunMethod4("setDrawableByLayerId",new Object[]{(Object)(16908288),(Object)(_cd.getObject())},new String[]{"java.lang.int","android.graphics.drawable.Drawable"});
 //BA.debugLineNum = 221;BA.debugLine="R.RunMethod4(\"setDrawableByLayerId\", _ 		Array As";
_r.RunMethod4("setDrawableByLayerId",new Object[]{_r.GetStaticField("android.R$id","progress"),_clipdrawable},new String[]{"java.lang.int","android.graphics.drawable.Drawable"});
 //BA.debugLineNum = 225;BA.debugLine="End Sub";
return "";
}
public static String  _sharestring(anywheresoftware.b4a.BA _ba,String _sinfo,String _sbody,String _ssubject) throws Exception{
anywheresoftware.b4a.objects.IntentWrapper _share = null;
 //BA.debugLineNum = 467;BA.debugLine="Sub ShareString(sInfo As String,sBody As String,sS";
 //BA.debugLineNum = 468;BA.debugLine="Dim share As Intent";
_share = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 469;BA.debugLine="share.Initialize(share.ACTION_SEND,\"\")";
_share.Initialize(_share.ACTION_SEND,"");
 //BA.debugLineNum = 470;BA.debugLine="share.SetType(\"text/plain\")";
_share.SetType("text/plain");
 //BA.debugLineNum = 471;BA.debugLine="share.PutExtra(\"android.intent.extra.TEXT\",sBody)";
_share.PutExtra("android.intent.extra.TEXT",(Object)(_sbody));
 //BA.debugLineNum = 472;BA.debugLine="share.PutExtra(\"android.intent.extra.SUBJECT\", sS";
_share.PutExtra("android.intent.extra.SUBJECT",(Object)(_ssubject));
 //BA.debugLineNum = 473;BA.debugLine="share.WrapAsIntentChooser(sInfo)";
_share.WrapAsIntentChooser(_sinfo);
 //BA.debugLineNum = 474;BA.debugLine="StartActivity(share)";
anywheresoftware.b4a.keywords.Common.StartActivity(_ba,(Object)(_share.getObject()));
 //BA.debugLineNum = 475;BA.debugLine="End Sub";
return "";
}
public static String  _showcartlabel(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.LabelWrapper _lbl) throws Exception{
com.apps.demo.opencart _cart = null;
int _countcart = 0;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
 //BA.debugLineNum = 501;BA.debugLine="Sub ShowCartLabel(lbl As Label)";
 //BA.debugLineNum = 503;BA.debugLine="Dim cart As OpenCart";
_cart = new com.apps.demo.opencart();
 //BA.debugLineNum = 504;BA.debugLine="cart.Initialize";
_cart._initialize((_ba.processBA == null ? _ba : _ba.processBA));
 //BA.debugLineNum = 506;BA.debugLine="Dim countcart As Int";
_countcart = 0;
 //BA.debugLineNum = 507;BA.debugLine="countcart = cart.GetCartCount";
_countcart = _cart._getcartcount();
 //BA.debugLineNum = 509;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 510;BA.debugLine="c1.Initialize2(Theme_Header,50dip,1,Colors.White)";
_c1.Initialize2(_theme_header,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50)),(int) (1),anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 511;BA.debugLine="lbl.Background = c1";
_lbl.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 513;BA.debugLine="If countcart > 0 Then";
if (_countcart>0) { 
 //BA.debugLineNum = 514;BA.debugLine="lbl.Text = countcart";
_lbl.setText(BA.ObjectToCharSequence(_countcart));
 //BA.debugLineNum = 515;BA.debugLine="lbl.SetVisibleAnimated(700,True)";
_lbl.SetVisibleAnimated((int) (700),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 517;BA.debugLine="lbl.SetVisibleAnimated(700,False)";
_lbl.SetVisibleAnimated((int) (700),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 520;BA.debugLine="End Sub";
return "";
}
public static String  _showerrors(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.collections.Map _rs) throws Exception{
String _err = "";
int _i = 0;
 //BA.debugLineNum = 582;BA.debugLine="Sub ShowErrors(rs As Map)";
 //BA.debugLineNum = 584;BA.debugLine="Dim err As String";
_err = "";
 //BA.debugLineNum = 586;BA.debugLine="For i = 0 To rs.Size - 1";
{
final int step2 = 1;
final int limit2 = (int) (_rs.getSize()-1);
for (_i = (int) (0) ; (step2 > 0 && _i <= limit2) || (step2 < 0 && _i >= limit2); _i = ((int)(0 + _i + step2)) ) {
 //BA.debugLineNum = 587;BA.debugLine="err = err & rs.GetValueAt(i) & CRLF";
_err = _err+BA.ObjectToString(_rs.GetValueAt(_i))+anywheresoftware.b4a.keywords.Common.CRLF;
 }
};
 //BA.debugLineNum = 590;BA.debugLine="Msgbox(err,GetStringResourse(\"alert\"))";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(_err),BA.ObjectToCharSequence(_getstringresourse(_ba,"alert")),_ba);
 //BA.debugLineNum = 592;BA.debugLine="End Sub";
return "";
}
public static String  _showtime(anywheresoftware.b4a.BA _ba,String _str) throws Exception{
 //BA.debugLineNum = 189;BA.debugLine="Sub ShowTime(Str As String)";
 //BA.debugLineNum = 190;BA.debugLine="LogColor($\"${Str} is ${DateTime.Time(DateTime.Now";
anywheresoftware.b4a.keywords.Common.LogColor((""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_str))+" is "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(anywheresoftware.b4a.keywords.Common.DateTime.Time(anywheresoftware.b4a.keywords.Common.DateTime.getNow())))+""),anywheresoftware.b4a.keywords.Common.Colors.Green);
 //BA.debugLineNum = 191;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.objects.collections.List  _string2list(anywheresoftware.b4a.BA _ba,String _str) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
 //BA.debugLineNum = 147;BA.debugLine="Sub String2List(str As String) As List";
 //BA.debugLineNum = 149;BA.debugLine="Try";
try { //BA.debugLineNum = 150;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 151;BA.debugLine="js.Initialize(str)";
_js.Initialize(_str);
 //BA.debugLineNum = 152;BA.debugLine="Return js.NextArray";
if (true) return _js.NextArray();
 } 
       catch (Exception e6) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e6); //BA.debugLineNum = 154;BA.debugLine="Return Null";
if (true) return (anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(anywheresoftware.b4a.keywords.Common.Null));
 };
 //BA.debugLineNum = 157;BA.debugLine="End Sub";
return null;
}
public static String  _truncate(anywheresoftware.b4a.BA _ba,String _s1) throws Exception{
 //BA.debugLineNum = 193;BA.debugLine="Sub Truncate(s1 As String) As String";
 //BA.debugLineNum = 194;BA.debugLine="If s1.Length > 20 Then";
if (_s1.length()>20) { 
 //BA.debugLineNum = 195;BA.debugLine="Return s1.SubString2(0,17) & \"...\"";
if (true) return _s1.substring((int) (0),(int) (17))+"...";
 }else {
 //BA.debugLineNum = 197;BA.debugLine="Return s1";
if (true) return _s1;
 };
 //BA.debugLineNum = 199;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString  _underline(anywheresoftware.b4a.BA _ba,String _str) throws Exception{
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _rich = null;
 //BA.debugLineNum = 1000;BA.debugLine="Public Sub UnderLine(str As String) As RichString";
 //BA.debugLineNum = 1002;BA.debugLine="Dim rich As RichString";
_rich = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 1003;BA.debugLine="rich.Initialize(str)";
_rich.Initialize(BA.ObjectToCharSequence(_str));
 //BA.debugLineNum = 1004;BA.debugLine="rich.Underscore2(\"{un}\")";
_rich.Underscore2("{un}");
 //BA.debugLineNum = 1005;BA.debugLine="Return rich";
if (true) return _rich;
 //BA.debugLineNum = 1007;BA.debugLine="End Sub";
return null;
}
public static String  _underlinestring(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.LabelWrapper _label1) throws Exception{
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _rs = null;
 //BA.debugLineNum = 1409;BA.debugLine="Sub UnderLineString(label1 As Label)";
 //BA.debugLineNum = 1411;BA.debugLine="Dim rs As RichString";
_rs = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 1412;BA.debugLine="rs.Initialize(\"{u}\" & label1.Text & \"{u}\")";
_rs.Initialize(BA.ObjectToCharSequence("{u}"+_label1.getText()+"{u}"));
 //BA.debugLineNum = 1413;BA.debugLine="rs.Underscore2(\"{u}\")";
_rs.Underscore2("{u}");
 //BA.debugLineNum = 1414;BA.debugLine="label1.Text = rs";
_label1.setText(BA.ObjectToCharSequence(_rs.getObject()));
 //BA.debugLineNum = 1416;BA.debugLine="End Sub";
return "";
}
public static boolean  _validemail(anywheresoftware.b4a.BA _ba,String _emailaddress) throws Exception{
anywheresoftware.b4a.keywords.Regex.MatcherWrapper _matchemail = null;
 //BA.debugLineNum = 614;BA.debugLine="Public Sub ValidEmail(EmailAddress As String) As B";
 //BA.debugLineNum = 616;BA.debugLine="Dim MatchEmail As Matcher = Regex.Matcher(\"^(?i)[";
_matchemail = new anywheresoftware.b4a.keywords.Regex.MatcherWrapper();
_matchemail = anywheresoftware.b4a.keywords.Common.Regex.Matcher("^(?i)[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$",_emailaddress);
 //BA.debugLineNum = 618;BA.debugLine="If MatchEmail.Find = True Then";
if (_matchemail.Find()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 619;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 621;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 624;BA.debugLine="End Sub";
return false;
}
public static boolean  _validphonenumber(anywheresoftware.b4a.BA _ba,String _id1) throws Exception{
 //BA.debugLineNum = 594;BA.debugLine="Public Sub ValidPhoneNumber(id1 As String) As Bool";
 //BA.debugLineNum = 596;BA.debugLine="Try";
try { //BA.debugLineNum = 597;BA.debugLine="Return Regex.IsMatch(\"^0[0-9]{10}$\",id1)";
if (true) return anywheresoftware.b4a.keywords.Common.Regex.IsMatch("^0[0-9]{10}$",_id1);
 } 
       catch (Exception e4) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e4); //BA.debugLineNum = 599;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 602;BA.debugLine="End Sub";
return false;
}
public static boolean  _validpostalcode(anywheresoftware.b4a.BA _ba,String _code) throws Exception{
 //BA.debugLineNum = 604;BA.debugLine="Public Sub ValidPostalCode(Code As String) As Bool";
 //BA.debugLineNum = 606;BA.debugLine="Try";
try { //BA.debugLineNum = 607;BA.debugLine="Return Regex.IsMatch(\"^[0-9]{2,10}$\",Code)";
if (true) return anywheresoftware.b4a.keywords.Common.Regex.IsMatch("^[0-9]{2,10}$",_code);
 } 
       catch (Exception e4) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e4); //BA.debugLineNum = 609;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 612;BA.debugLine="End Sub";
return false;
}
public static String  _writebitmap2file(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _bitmap1,String _filename) throws Exception{
anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper _os = null;
anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _b1 = null;
 //BA.debugLineNum = 452;BA.debugLine="Sub WriteBitmap2File(Bitmap1 As Bitmap,filename As";
 //BA.debugLineNum = 453;BA.debugLine="Dim os As OutputStream";
_os = new anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper();
 //BA.debugLineNum = 454;BA.debugLine="Dim b1 As Bitmap";
_b1 = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper();
 //BA.debugLineNum = 455;BA.debugLine="b1.Initialize3(Bitmap1)";
_b1.Initialize3((android.graphics.Bitmap)(_bitmap1.getObject()));
 //BA.debugLineNum = 456;BA.debugLine="os = File.OpenOutput(File.DirInternal,filename,Fa";
_os = anywheresoftware.b4a.keywords.Common.File.OpenOutput(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),_filename,anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 457;BA.debugLine="b1.WriteToStream(os,100,\"PNG\")";
_b1.WriteToStream((java.io.OutputStream)(_os.getObject()),(int) (100),BA.getEnumFromString(android.graphics.Bitmap.CompressFormat.class,"PNG"));
 //BA.debugLineNum = 458;BA.debugLine="os.Close";
_os.Close();
 //BA.debugLineNum = 459;BA.debugLine="End Sub";
return "";
}
public static String  _writeobjectfile(anywheresoftware.b4a.BA _ba,Object _object1,String _filename) throws Exception{
anywheresoftware.b4a.randomaccessfile.RandomAccessFile _rn = null;
 //BA.debugLineNum = 1427;BA.debugLine="Sub WriteObjectFile(object1 As Object,Filename As";
 //BA.debugLineNum = 1429;BA.debugLine="Dim rn As RandomAccessFile";
_rn = new anywheresoftware.b4a.randomaccessfile.RandomAccessFile();
 //BA.debugLineNum = 1430;BA.debugLine="rn.Initialize(File.DirInternal,Filename,False)";
_rn.Initialize(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),_filename,anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1431;BA.debugLine="rn.WriteObject(object1,False,0)";
_rn.WriteObject(_object1,anywheresoftware.b4a.keywords.Common.False,(long) (0));
 //BA.debugLineNum = 1432;BA.debugLine="rn.Close";
_rn.Close();
 //BA.debugLineNum = 1434;BA.debugLine="End Sub";
return "";
}
public static String  _zoomin(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 55;BA.debugLine="Sub ZoomIn";
 //BA.debugLineNum = 56;BA.debugLine="SetAnimation(\"zoom_enter\", \"zoom_exit\")";
_setanimation(_ba,"zoom_enter","zoom_exit");
 //BA.debugLineNum = 57;BA.debugLine="End Sub";
return "";
}
public static String  _zoomout(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 59;BA.debugLine="Sub ZoomOut";
 //BA.debugLineNum = 60;BA.debugLine="SetAnimation(\"zoom_exit\", \"zoom_enter\")";
_setanimation(_ba,"zoom_exit","zoom_enter");
 //BA.debugLineNum = 61;BA.debugLine="End Sub";
return "";
}
}
