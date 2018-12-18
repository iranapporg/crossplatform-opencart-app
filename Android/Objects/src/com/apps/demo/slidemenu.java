package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class slidemenu extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.demo.slidemenu");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.demo.slidemenu.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.objects.ListViewWrapper _lsheader = null;
public de.amberhome.navdrawer.NavigationDrawer _navdrawer = null;
public Object _memodule = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imglogo = null;
public anywheresoftware.b4a.objects.Timer _tmrdelay = null;
public String _value = "";
public ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
public anywheresoftware.b4a.objects.collections.List _exclumenu = null;
public de.amberhome.navdrawer.SlideDrawableWrapper _sd = null;
public int _gravitymenu = 0;
public anywheresoftware.b4a.objects.PanelWrapper _content = null;
public boolean _opended = false;
public boolean _clickeditem = false;
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
public com.apps.demo.library _library = null;
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
public String  _addheader() throws Exception{
com.apps.demo.opencart _opinformation = null;
 //BA.debugLineNum = 113;BA.debugLine="Public Sub AddHeader";
 //BA.debugLineNum = 115;BA.debugLine="If lsheader.IsInitialized = False Then Return";
if (_lsheader.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 117;BA.debugLine="lsheader.Clear";
_lsheader.Clear();
 //BA.debugLineNum = 119;BA.debugLine="If IsPaused(actMenu) Then";
if (__c.IsPaused(ba,(Object)(_actmenu.getObject()))) { 
 //BA.debugLineNum = 120;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"home")),BA.ObjectToCharSequence(""),(Object)("home"));
 };
 //BA.debugLineNum = 123;BA.debugLine="If ExistExclusiveMenu(\"basket\") = False Then";
if (_existexclusivemenu("basket")==__c.False) { 
 //BA.debugLineNum = 124;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"basket_title")),BA.ObjectToCharSequence(""),(Object)("basket"));
 };
 //BA.debugLineNum = 127;BA.debugLine="If ExistExclusiveMenu(\"catalog\") = False Then";
if (_existexclusivemenu("catalog")==__c.False) { 
 //BA.debugLineNum = 128;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"category")),BA.ObjectToCharSequence(""),(Object)("catalog"));
 };
 //BA.debugLineNum = 131;BA.debugLine="If ExistExclusiveMenu(\"search\") = False Then";
if (_existexclusivemenu("search")==__c.False) { 
 //BA.debugLineNum = 132;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"search_title")),BA.ObjectToCharSequence(""),(Object)("search"));
 };
 //BA.debugLineNum = 135;BA.debugLine="If ExistExclusiveMenu(\"bookmark\") = False Then";
if (_existexclusivemenu("bookmark")==__c.False) { 
 //BA.debugLineNum = 136;BA.debugLine="lsheader.AddTwoLines2(Library.wishlist,\"\",\"book";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._wishlist),BA.ObjectToCharSequence(""),(Object)("bookmark"));
 };
 //BA.debugLineNum = 143;BA.debugLine="If ExistExclusiveMenu(\"compare\") = False Then";
if (_existexclusivemenu("compare")==__c.False) { 
 //BA.debugLineNum = 144;BA.debugLine="lsheader.AddTwoLines2(Library.comparelist,\"\",\"c";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._comparelist),BA.ObjectToCharSequence(""),(Object)("compare"));
 };
 //BA.debugLineNum = 147;BA.debugLine="If actProduct.IsOpenProduct = True Then";
if (_actproduct._isopenproduct==__c.True) { 
 //BA.debugLineNum = 148;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"close_product_page")),BA.ObjectToCharSequence(""),(Object)("finish_product"));
 };
 //BA.debugLineNum = 151;BA.debugLine="lsheader.AddSingleLine(Library.GetStringResourse(";
_lsheader.AddSingleLine(BA.ObjectToCharSequence(_library._getstringresourse(ba,"users")));
 //BA.debugLineNum = 153;BA.debugLine="If Library.loginDetails.IsInitialized = False The";
if (_library._logindetails.IsInitialized()==__c.False) { 
 //BA.debugLineNum = 154;BA.debugLine="If ExistExclusiveMenu(\"login\") = False Then";
if (_existexclusivemenu("login")==__c.False) { 
 //BA.debugLineNum = 155;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"login")),BA.ObjectToCharSequence(""),(Object)("login"));
 };
 //BA.debugLineNum = 158;BA.debugLine="If ExistExclusiveMenu(\"register\") = False Then";
if (_existexclusivemenu("register")==__c.False) { 
 //BA.debugLineNum = 159;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"register")),BA.ObjectToCharSequence(""),(Object)("register"));
 };
 }else {
 //BA.debugLineNum = 163;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ((_library._logindetails.Get((Object)("login"))).equals((Object)(__c.True))) { 
 //BA.debugLineNum = 164;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"account")),BA.ObjectToCharSequence(""),(Object)("account"));
 //BA.debugLineNum = 165;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"logout")),BA.ObjectToCharSequence(""),(Object)("logout"));
 }else {
 //BA.debugLineNum = 167;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"login")),BA.ObjectToCharSequence(""),(Object)("login"));
 //BA.debugLineNum = 168;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"register")),BA.ObjectToCharSequence(""),(Object)("register"));
 };
 };
 //BA.debugLineNum = 172;BA.debugLine="lsheader.AddSingleLine(Library.GetStringResourse(";
_lsheader.AddSingleLine(BA.ObjectToCharSequence(_library._getstringresourse(ba,"shops")));
 //BA.debugLineNum = 174;BA.debugLine="If ExistExclusiveMenu(\"latest\") = False Then";
if (_existexclusivemenu("latest")==__c.False) { 
 //BA.debugLineNum = 175;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"newproduct")),BA.ObjectToCharSequence(""),(Object)("new"));
 };
 //BA.debugLineNum = 178;BA.debugLine="If ExistExclusiveMenu(\"feature\") = False Then";
if (_existexclusivemenu("feature")==__c.False) { 
 //BA.debugLineNum = 179;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"featureproduct")),BA.ObjectToCharSequence(""),(Object)("feature"));
 };
 //BA.debugLineNum = 182;BA.debugLine="If ExistExclusiveMenu(\"best\") = False Then";
if (_existexclusivemenu("best")==__c.False) { 
 //BA.debugLineNum = 183;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"bestproduct")),BA.ObjectToCharSequence(""),(Object)("best"));
 };
 //BA.debugLineNum = 186;BA.debugLine="lsheader.AddSingleLine(Library.GetStringResourse(";
_lsheader.AddSingleLine(BA.ObjectToCharSequence(_library._getstringresourse(ba,"contact_shop")));
 //BA.debugLineNum = 188;BA.debugLine="If ExistExclusiveMenu(\"contact\") = False Then";
if (_existexclusivemenu("contact")==__c.False) { 
 //BA.debugLineNum = 189;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"contact")),BA.ObjectToCharSequence(""),(Object)("contact"));
 };
 //BA.debugLineNum = 192;BA.debugLine="If ExistExclusiveMenu(\"about\") = False Then";
if (_existexclusivemenu("about")==__c.False) { 
 //BA.debugLineNum = 193;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"about")),BA.ObjectToCharSequence(""),(Object)("about"));
 };
 //BA.debugLineNum = 196;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(\"";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"setting")),BA.ObjectToCharSequence(""),(Object)("setting"));
 //BA.debugLineNum = 198;BA.debugLine="If ExistExclusiveMenu(\"update\") = False Then";
if (_existexclusivemenu("update")==__c.False) { 
 //BA.debugLineNum = 199;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"again_update")),BA.ObjectToCharSequence(""),(Object)("update_db"));
 };
 //BA.debugLineNum = 202;BA.debugLine="If ExistExclusiveMenu(\"information\") = False Then";
if (_existexclusivemenu("information")==__c.False) { 
 //BA.debugLineNum = 203;BA.debugLine="If lsheader.Size < 20 Then";
if (_lsheader.getSize()<20) { 
 //BA.debugLineNum = 204;BA.debugLine="If Library.listInformation.IsInitialized = Fals";
if (_library._listinformation.IsInitialized()==__c.False) { 
 //BA.debugLineNum = 205;BA.debugLine="Dim opInformation As OpenCart";
_opinformation = new com.apps.demo.opencart();
 //BA.debugLineNum = 206;BA.debugLine="opInformation.Initialize";
_opinformation._initialize(ba);
 //BA.debugLineNum = 207;BA.debugLine="opInformation.GetInformation(Me,\"information_r";
_opinformation._getinformation(this,"information_receive");
 }else {
 //BA.debugLineNum = 209;BA.debugLine="ShowInformationLink(Library.listInformation)";
_showinformationlink(_library._listinformation);
 };
 };
 };
 //BA.debugLineNum = 214;BA.debugLine="If ExistExclusiveMenu(\"share\") = False Then";
if (_existexclusivemenu("share")==__c.False) { 
 };
 //BA.debugLineNum = 218;BA.debugLine="End Sub";
return "";
}
public String  _bookmark_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 412;BA.debugLine="Sub bookmark_receive(res As Map,cat As String)";
 //BA.debugLineNum = 414;BA.debugLine="ProgressDialogHide";
__c.ProgressDialogHide();
 //BA.debugLineNum = 416;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 417;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(__c.True))) { 
 //BA.debugLineNum = 418;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 419;BA.debugLine="temp = res.Get(\"data\")";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 420;BA.debugLine="actProducts.res = temp.Get(\"products\")";
_actproducts._res.setObject((java.util.List)(_temp.Get((Object)("products"))));
 //BA.debugLineNum = 421;BA.debugLine="actProducts.title = Library.GetStringResourse(\"";
_actproducts._title = _library._getstringresourse(ba,"bookmark");
 //BA.debugLineNum = 422;BA.debugLine="StartActivity(actProducts)";
__c.StartActivity(ba,(Object)(_actproducts.getObject()));
 };
 };
 //BA.debugLineNum = 426;BA.debugLine="End Sub";
return "";
}
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private lsheader As ListView";
_lsheader = new anywheresoftware.b4a.objects.ListViewWrapper();
 //BA.debugLineNum = 4;BA.debugLine="Private NavDrawer As AHNavigationDrawer";
_navdrawer = new de.amberhome.navdrawer.NavigationDrawer();
 //BA.debugLineNum = 5;BA.debugLine="Private meModule As Object";
_memodule = new Object();
 //BA.debugLineNum = 6;BA.debugLine="Private imgLogo As ImageView";
_imglogo = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 7;BA.debugLine="Private tmrdelay As Timer";
_tmrdelay = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 8;BA.debugLine="Private value As String";
_value = "";
 //BA.debugLineNum = 9;BA.debugLine="Private Glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 10;BA.debugLine="Private excluMenu As List";
_exclumenu = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 11;BA.debugLine="Dim sd As SlideDrawable";
_sd = new de.amberhome.navdrawer.SlideDrawableWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private GravityMenu As Int";
_gravitymenu = 0;
 //BA.debugLineNum = 13;BA.debugLine="Private Content As Panel";
_content = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private Opended,ClickedItem As Boolean";
_opended = false;
_clickeditem = false;
 //BA.debugLineNum = 15;BA.debugLine="End Sub";
return "";
}
public String  _detailsinformation_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 478;BA.debugLine="Sub DetailsInformation_receive(res As Map,cat As S";
 //BA.debugLineNum = 480;BA.debugLine="CallSubDelayed2(actMenu,\"ShowHideLoading\",False)";
__c.CallSubDelayed2(ba,(Object)(_actmenu.getObject()),"ShowHideLoading",(Object)(__c.False));
 //BA.debugLineNum = 482;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 483;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(__c.True))) { 
 //BA.debugLineNum = 484;BA.debugLine="Dim	temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 485;BA.debugLine="temp = res.Get(\"data\")";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 486;BA.debugLine="actWeb.title	= temp.Get(\"title\")";
_actweb._title = BA.ObjectToString(_temp.Get((Object)("title")));
 //BA.debugLineNum = 487;BA.debugLine="actWeb.title = actWeb.title.Replace(\"&quot;\",QU";
_actweb._title = _actweb._title.replace("&quot;",__c.QUOTE).replace("&amp;","&");
 //BA.debugLineNum = 488;BA.debugLine="actWeb.data		= temp.Get(\"description\")";
_actweb._data = BA.ObjectToString(_temp.Get((Object)("description")));
 //BA.debugLineNum = 489;BA.debugLine="StartActivity(actWeb)";
__c.StartActivity(ba,(Object)(_actweb.getObject()));
 };
 };
 //BA.debugLineNum = 493;BA.debugLine="End Sub";
return "";
}
public String  _doaction() throws Exception{
com.apps.demo.opencart _op = null;
anywheresoftware.b4a.objects.collections.Map _cache = null;
ir.androgo.sharemyapp_lib.ShareMyApp _share = null;
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
 //BA.debugLineNum = 249;BA.debugLine="Private Sub DoAction";
 //BA.debugLineNum = 251;BA.debugLine="actProduct.ClickedMenu = True";
_actproduct._clickedmenu = __c.True;
 //BA.debugLineNum = 253;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 254;BA.debugLine="op.Initialize";
_op._initialize(ba);
 //BA.debugLineNum = 256;BA.debugLine="If value = \"home\" Then";
if ((_value).equals("home")) { 
 //BA.debugLineNum = 257;BA.debugLine="StartActivity(actMenu)";
__c.StartActivity(ba,(Object)(_actmenu.getObject()));
 }else if((_value).equals("catalog")) { 
 //BA.debugLineNum = 261;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 262;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 263;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 266;BA.debugLine="StartActivity(actCategory)";
__c.StartActivity(ba,(Object)(_actcategory.getObject()));
 }else if((_value).equals("search")) { 
 //BA.debugLineNum = 269;BA.debugLine="StartActivity(actSearch)";
__c.StartActivity(ba,(Object)(_actsearch.getObject()));
 }else if((_value).equals("compare")) { 
 //BA.debugLineNum = 273;BA.debugLine="If Library.ListProductIDForCompare.Size = 0 Then";
if (_library._listproductidforcompare.getSize()==0) { 
 //BA.debugLineNum = 274;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"no_";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"no_campare_list")),__c.True);
 //BA.debugLineNum = 275;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 278;BA.debugLine="StartActivity(actCompare)";
__c.StartActivity(ba,(Object)(_actcompare.getObject()));
 }else if((_value).equals("new")) { 
 //BA.debugLineNum = 282;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 283;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 284;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 287;BA.debugLine="CallSubDelayed2(actMenu,\"LoadProductSplit\",\"newp";
__c.CallSubDelayed2(ba,(Object)(_actmenu.getObject()),"LoadProductSplit",(Object)("newproduct"));
 }else if((_value).equals("feature")) { 
 //BA.debugLineNum = 291;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 292;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 293;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 296;BA.debugLine="CallSubDelayed2(actMenu,\"LoadProductSplit\",\"feat";
__c.CallSubDelayed2(ba,(Object)(_actmenu.getObject()),"LoadProductSplit",(Object)("featureproduct"));
 }else if((_value).equals("best")) { 
 //BA.debugLineNum = 300;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 301;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 302;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 305;BA.debugLine="CallSubDelayed2(actMenu,\"LoadProductSplit\",\"best";
__c.CallSubDelayed2(ba,(Object)(_actmenu.getObject()),"LoadProductSplit",(Object)("bestproduct"));
 }else if((_value).equals("finish_product")) { 
 //BA.debugLineNum = 308;BA.debugLine="CallSubDelayed(actProduct,\"FinishMe\")";
__c.CallSubDelayed(ba,(Object)(_actproduct.getObject()),"FinishMe");
 }else if((_value).equals("register")) { 
 //BA.debugLineNum = 312;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 313;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 314;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 317;BA.debugLine="StartActivity(actRegister)";
__c.StartActivity(ba,(Object)(_actregister.getObject()));
 }else if((_value).equals("login")) { 
 //BA.debugLineNum = 320;BA.debugLine="StartActivity(actLogin)";
__c.StartActivity(ba,(Object)(_actlogin.getObject()));
 }else if((_value).equals("about")) { 
 //BA.debugLineNum = 324;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 325;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 326;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 329;BA.debugLine="StartActivity(actAbout)";
__c.StartActivity(ba,(Object)(_actabout.getObject()));
 }else if((_value).equals("contact")) { 
 //BA.debugLineNum = 332;BA.debugLine="StartActivity(actContact)";
__c.StartActivity(ba,(Object)(_actcontact.getObject()));
 }else if((_value).equals("setting")) { 
 //BA.debugLineNum = 335;BA.debugLine="SettingMenu";
_settingmenu();
 }else if((_value).equals("account")) { 
 //BA.debugLineNum = 339;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 340;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 341;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 344;BA.debugLine="StartActivity(actAccount)";
__c.StartActivity(ba,(Object)(_actaccount.getObject()));
 }else if((_value).equals("basket")) { 
 //BA.debugLineNum = 348;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 349;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 350;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 353;BA.debugLine="StartActivity(actBasket)";
__c.StartActivity(ba,(Object)(_actbasket.getObject()));
 }else if((_value).equals("bookmark")) { 
 //BA.debugLineNum = 357;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 358;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 359;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 362;BA.debugLine="ProgressDialogShow(Library.GetStringResourse(\"lo";
__c.ProgressDialogShow(ba,BA.ObjectToCharSequence(_library._getstringresourse(ba,"loading")));
 //BA.debugLineNum = 364;BA.debugLine="op.Wishlist(Me,\"bookmark_receive\",\"\")";
_op._wishlist(this,"bookmark_receive","");
 }else if((_value).equals("logout")) { 
 //BA.debugLineNum = 368;BA.debugLine="If Library.InternetState = False Then";
if (_library._internetstate(ba)==__c.False) { 
 //BA.debugLineNum = 369;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(ba,"error_net_details")),__c.False);
 //BA.debugLineNum = 370;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 373;BA.debugLine="CallSubDelayed(actMenu,\"Logout\")";
__c.CallSubDelayed(ba,(Object)(_actmenu.getObject()),"Logout");
 }else if(__c.IsNumber(_value)) { 
 //BA.debugLineNum = 377;BA.debugLine="Dim cache As Map";
_cache = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 378;BA.debugLine="cache = Library.CacheSystem.GetCacheAsMap(value,";
_cache = _library._cachesystem._getcacheasmap(_value,"menu");
 //BA.debugLineNum = 380;BA.debugLine="If cache.IsInitialized Then";
if (_cache.IsInitialized()) { 
 //BA.debugLineNum = 381;BA.debugLine="DetailsInformation_receive(cache,\"\")";
_detailsinformation_receive(_cache,"");
 //BA.debugLineNum = 382;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 386;BA.debugLine="CallSubDelayed2(actMenu,\"ShowHideLoading\",True)";
__c.CallSubDelayed2(ba,(Object)(_actmenu.getObject()),"ShowHideLoading",(Object)(__c.True));
 //BA.debugLineNum = 388;BA.debugLine="op.GetInformationDetailsID(Me,\"DetailsInformatio";
_op._getinformationdetailsid(this,"DetailsInformation_receive",_value);
 }else if((_value).equals("update_db")) { 
 //BA.debugLineNum = 391;BA.debugLine="Library.CacheSystem.ClearCache";
_library._cachesystem._clearcache();
 //BA.debugLineNum = 392;BA.debugLine="CallSubDelayed(actMenu,\"ReRunApp\")";
__c.CallSubDelayed(ba,(Object)(_actmenu.getObject()),"ReRunApp");
 }else if((_value).equals("close")) { 
 //BA.debugLineNum = 395;BA.debugLine="File.Delete(File.DirInternal,\"data\")";
__c.File.Delete(__c.File.getDirInternal(),"data");
 //BA.debugLineNum = 396;BA.debugLine="CallSubDelayed(actMenu,\"ExitApplications\")";
__c.CallSubDelayed(ba,(Object)(_actmenu.getObject()),"ExitApplications");
 }else if((_value).equals("shareme")) { 
 //BA.debugLineNum = 399;BA.debugLine="Dim share As ShareMyApp";
_share = new ir.androgo.sharemyapp_lib.ShareMyApp();
 //BA.debugLineNum = 400;BA.debugLine="Dim r As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 401;BA.debugLine="share.startShare(r.GetActivity , Library.GetStri";
_share.startShare(_r.GetActivity(ba),_library._getstringresourse(ba,"share_app"));
 }else if((_value).equals("list_price")) { 
 //BA.debugLineNum = 404;BA.debugLine="actWeb.title	= \"لیست قیمت\"";
_actweb._title = "لیست قیمت";
 //BA.debugLineNum = 405;BA.debugLine="actWeb.link		= \"http://goo.gl/UrT4ju\"";
_actweb._link = "http://goo.gl/UrT4ju";
 //BA.debugLineNum = 406;BA.debugLine="StartActivity(actWeb)";
__c.StartActivity(ba,(Object)(_actweb.getObject()));
 };
 //BA.debugLineNum = 410;BA.debugLine="End Sub";
return "";
}
public String  _drawer_drawerclosed(int _drawergravity) throws Exception{
 //BA.debugLineNum = 79;BA.debugLine="Sub Drawer_DrawerClosed (DrawerGravity As Int)";
 //BA.debugLineNum = 81;BA.debugLine="Opended = False";
_opended = __c.False;
 //BA.debugLineNum = 82;BA.debugLine="Content.Visible = False";
_content.setVisible(__c.False);
 //BA.debugLineNum = 84;BA.debugLine="If ClickedItem Then";
if (_clickeditem) { 
 //BA.debugLineNum = 85;BA.debugLine="ClickedItem = False";
_clickeditem = __c.False;
 //BA.debugLineNum = 86;BA.debugLine="tmrdelay.Enabled = True";
_tmrdelay.setEnabled(__c.True);
 };
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return "";
}
public String  _drawer_draweropened(int _drawergravity) throws Exception{
 //BA.debugLineNum = 92;BA.debugLine="Sub Drawer_DrawerOpened (DrawerGravity As Int)";
 //BA.debugLineNum = 93;BA.debugLine="Opended = True";
_opended = __c.True;
 //BA.debugLineNum = 94;BA.debugLine="End Sub";
return "";
}
public String  _drawer_drawerslide(float _position,int _drawergravity) throws Exception{
 //BA.debugLineNum = 98;BA.debugLine="Sub Drawer_DrawerSlide (Position As Float, DrawerG";
 //BA.debugLineNum = 99;BA.debugLine="sd.Offset = Position";
_sd.setOffset(_position);
 //BA.debugLineNum = 100;BA.debugLine="End Sub";
return "";
}
public boolean  _existexclusivemenu(String _menu) throws Exception{
int _i = 0;
String _temp = "";
 //BA.debugLineNum = 220;BA.debugLine="Sub ExistExclusiveMenu(Menu As String) As Boolean";
 //BA.debugLineNum = 222;BA.debugLine="If excluMenu = Null Then Return False";
if (_exclumenu== null) { 
if (true) return __c.False;};
 //BA.debugLineNum = 223;BA.debugLine="If excluMenu.IsInitialized = False Then Return Fa";
if (_exclumenu.IsInitialized()==__c.False) { 
if (true) return __c.False;};
 //BA.debugLineNum = 225;BA.debugLine="For i = 0 To excluMenu.Size - 1";
{
final int step3 = 1;
final int limit3 = (int) (_exclumenu.getSize()-1);
for (_i = (int) (0) ; (step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3); _i = ((int)(0 + _i + step3)) ) {
 //BA.debugLineNum = 226;BA.debugLine="Dim temp As String";
_temp = "";
 //BA.debugLineNum = 227;BA.debugLine="temp = excluMenu.Get(i)";
_temp = BA.ObjectToString(_exclumenu.Get(_i));
 //BA.debugLineNum = 228;BA.debugLine="temp = temp.ToLowerCase.Replace(\"&quot;\",QUOTE).";
_temp = _temp.toLowerCase().replace("&quot;",__c.QUOTE).replace("&amp;","&");
 //BA.debugLineNum = 229;BA.debugLine="If temp = Menu.ToLowerCase.Replace(\"&quot;\",QUOT";
if ((_temp).equals(_menu.toLowerCase().replace("&quot;",__c.QUOTE).replace("&amp;","&"))) { 
if (true) return __c.True;};
 }
};
 //BA.debugLineNum = 232;BA.debugLine="Return False";
if (true) return __c.False;
 //BA.debugLineNum = 234;BA.debugLine="End Sub";
return false;
}
public boolean  _getvisible() throws Exception{
 //BA.debugLineNum = 495;BA.debugLine="Public Sub GetVisible As Boolean";
 //BA.debugLineNum = 496;BA.debugLine="Return Opended";
if (true) return _opended;
 //BA.debugLineNum = 497;BA.debugLine="End Sub";
return false;
}
public String  _information_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.List _ls = null;
 //BA.debugLineNum = 434;BA.debugLine="Sub information_receive(res As Map,cat As String)";
 //BA.debugLineNum = 438;BA.debugLine="If Library.listInformation.IsInitialized Then Ret";
if (_library._listinformation.IsInitialized()) { 
if (true) return "";};
 //BA.debugLineNum = 440;BA.debugLine="If res.ContainsKey(\"data\") Then";
if (_res.ContainsKey((Object)("data"))) { 
 //BA.debugLineNum = 442;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 443;BA.debugLine="ls = res.Get(\"data\")";
_ls.setObject((java.util.List)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 445;BA.debugLine="If ls.Size = 0 Then Return";
if (_ls.getSize()==0) { 
if (true) return "";};
 //BA.debugLineNum = 447;BA.debugLine="Library.listInformation = ls";
_library._listinformation = _ls;
 //BA.debugLineNum = 449;BA.debugLine="ShowInformationLink(ls)";
_showinformationlink(_ls);
 };
 //BA.debugLineNum = 453;BA.debugLine="End Sub";
return "";
}
public String  _initialize(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.PanelWrapper _pcontent,Object _module) throws Exception{
innerInitialize(_ba);
anywheresoftware.b4a.object.XmlLayoutBuilder _xml = null;
anywheresoftware.b4a.objects.PanelWrapper _p = null;
anywheresoftware.b4a.objects.collections.List _tes = null;
 //BA.debugLineNum = 17;BA.debugLine="Public Sub Initialize(pContent As Panel,Module As";
 //BA.debugLineNum = 19;BA.debugLine="meModule = Module";
_memodule = _module;
 //BA.debugLineNum = 20;BA.debugLine="Content = pContent";
_content = _pcontent;
 //BA.debugLineNum = 22;BA.debugLine="If Library.IsPersian2(Library.currLang) Then";
if (_library._ispersian2(ba,_library._currlang)) { 
 //BA.debugLineNum = 23;BA.debugLine="NavDrawer.Initialize2(\"Drawer\", pContent, 85%x,N";
_navdrawer.Initialize2(ba,"Drawer",_pcontent,__c.PerXToCurrent((float) (85),ba),_navdrawer.GRAVITY_RIGHT);
 //BA.debugLineNum = 24;BA.debugLine="GravityMenu = NavDrawer.GRAVITY_RIGHT";
_gravitymenu = _navdrawer.GRAVITY_RIGHT;
 }else {
 //BA.debugLineNum = 26;BA.debugLine="NavDrawer.Initialize2(\"Drawer\", pContent, 85%x,N";
_navdrawer.Initialize2(ba,"Drawer",_pcontent,__c.PerXToCurrent((float) (85),ba),_navdrawer.GRAVITY_LEFT);
 //BA.debugLineNum = 27;BA.debugLine="GravityMenu = NavDrawer.GRAVITY_LEFT";
_gravitymenu = _navdrawer.GRAVITY_LEFT;
 };
 //BA.debugLineNum = 30;BA.debugLine="Dim xml As XmlLayoutBuilder";
_xml = new anywheresoftware.b4a.object.XmlLayoutBuilder();
 //BA.debugLineNum = 31;BA.debugLine="NavDrawer.ShadowDrawable = xml.GetDrawable(\"drawe";
_navdrawer.setShadowDrawable(_xml.GetDrawable("drawer_shadow"));
 //BA.debugLineNum = 32;BA.debugLine="NavDrawer.StatusBarColor = Library.Theme_Header";
_navdrawer.setStatusBarColor(_library._theme_header);
 //BA.debugLineNum = 34;BA.debugLine="sd.Initialize(xml.GetDrawable(\"ic_drawer\"))";
_sd.Initialize(_xml.GetDrawable("ic_drawer"));
 //BA.debugLineNum = 35;BA.debugLine="imgLogo.Initialize(\"\")";
_imglogo.Initialize(ba,"");
 //BA.debugLineNum = 36;BA.debugLine="lsheader.Initialize(\"lsheader\")";
_lsheader.Initialize(ba,"lsheader");
 //BA.debugLineNum = 38;BA.debugLine="Dim p As Panel";
_p = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 39;BA.debugLine="p.Initialize(\"\")";
_p.Initialize(ba,"");
 //BA.debugLineNum = 40;BA.debugLine="NavDrawer.ContentPanel.AddView(P, (pContent.Width";
_navdrawer.getContentPanel().AddView((android.view.View)(_p.getObject()),(int) ((_pcontent.getWidth()-__c.Min(_pcontent.getWidth(),_pcontent.getHeight()))/(double)2),(int) ((_pcontent.getHeight()-__c.Min(_pcontent.getWidth(),_pcontent.getHeight()))/(double)2),(int) (__c.Min(_pcontent.getWidth(),_pcontent.getHeight())),(int) (__c.Min(_pcontent.getWidth(),_pcontent.getHeight())));
 //BA.debugLineNum = 43;BA.debugLine="NavDrawer.NavigationPanel.AddView(imgLogo, 0, 0,";
_navdrawer.getNavigationPanel().AddView((android.view.View)(_imglogo.getObject()),(int) (0),(int) (0),__c.PerXToCurrent((float) (85),ba),__c.DipToCurrent((int) (230)));
 //BA.debugLineNum = 44;BA.debugLine="NavDrawer.NavigationPanel.AddView(lsheader, 0, im";
_navdrawer.getNavigationPanel().AddView((android.view.View)(_lsheader.getObject()),(int) (0),_imglogo.getHeight(),__c.PerXToCurrent((float) (85),ba),(int) (_pcontent.getHeight()-_imglogo.getHeight()));
 //BA.debugLineNum = 45;BA.debugLine="NavDrawer.NavigationPanel.Color = Library.Convert";
_navdrawer.getNavigationPanel().setColor((int)(Double.parseDouble(_library._converthex2int(ba,_library._getstringresourse(ba,"menubar_color")))));
 //BA.debugLineNum = 47;BA.debugLine="Glide.Load(\"file:///android_asset/logo.jpg\").AsBi";
_glide.Load((Object)("file:///android_asset/logo.jpg")).AsBitmap().Resize((int) (__c.Abs(_imglogo.getWidth())),(int) (__c.Abs(_imglogo.getHeight()))).CenterCrop().IntoImageView(_imglogo);
 //BA.debugLineNum = 49;BA.debugLine="Library.ChangeListviewStyle(lsheader)";
_library._changelistviewstyle(ba,_lsheader);
 //BA.debugLineNum = 50;BA.debugLine="lsheader.TwoLinesLayout.SecondLabel.TextColor = L";
_lsheader.getTwoLinesLayout().SecondLabel.setTextColor(_library._theme_header);
 //BA.debugLineNum = 51;BA.debugLine="Library.SetDivider(lsheader,Colors.aRGB(70,228,22";
_library._setdivider(ba,_lsheader,__c.Colors.ARGB((int) (70),(int) (228),(int) (228),(int) (228)),(int) (1));
 //BA.debugLineNum = 53;BA.debugLine="excluMenu.Initialize";
_exclumenu.Initialize();
 //BA.debugLineNum = 54;BA.debugLine="If Library.Config <> Null Then";
if (_library._config!= null) { 
 //BA.debugLineNum = 55;BA.debugLine="If Library.Config.IsInitialized Then";
if (_library._config.IsInitialized()) { 
 //BA.debugLineNum = 56;BA.debugLine="Try";
try { //BA.debugLineNum = 57;BA.debugLine="excluMenu = Library.Config.Get(\"menus\")";
_exclumenu.setObject((java.util.List)(_library._config.Get((Object)("menus"))));
 } 
       catch (Exception e32) {
			ba.setLastException(e32); //BA.debugLineNum = 59;BA.debugLine="excluMenu = Null";
_exclumenu.setObject((java.util.List)(__c.Null));
 };
 //BA.debugLineNum = 61;BA.debugLine="If excluMenu = Null Then";
if (_exclumenu== null) { 
 //BA.debugLineNum = 62;BA.debugLine="Dim tes As List";
_tes = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 63;BA.debugLine="tes.Initialize";
_tes.Initialize();
 //BA.debugLineNum = 64;BA.debugLine="excluMenu = tes";
_exclumenu = _tes;
 };
 //BA.debugLineNum = 66;BA.debugLine="If excluMenu.IsInitialized = False Then";
if (_exclumenu.IsInitialized()==__c.False) { 
 //BA.debugLineNum = 67;BA.debugLine="excluMenu.Initialize";
_exclumenu.Initialize();
 };
 };
 };
 //BA.debugLineNum = 72;BA.debugLine="AddHeader";
_addheader();
 //BA.debugLineNum = 74;BA.debugLine="tmrdelay.Initialize(\"tmr1\",340)";
_tmrdelay.Initialize(ba,"tmr1",(long) (340));
 //BA.debugLineNum = 75;BA.debugLine="pContent.Visible = False";
_pcontent.setVisible(__c.False);
 //BA.debugLineNum = 77;BA.debugLine="End Sub";
return "";
}
public String  _lsheader_itemclick(int _position,Object _value1) throws Exception{
 //BA.debugLineNum = 236;BA.debugLine="Private Sub lsheader_ItemClick (Position As Int, V";
 //BA.debugLineNum = 238;BA.debugLine="NavDrawer.CloseDrawer2(GravityMenu)";
_navdrawer.CloseDrawer2(_gravitymenu);
 //BA.debugLineNum = 239;BA.debugLine="ClickedItem = True";
_clickeditem = __c.True;
 //BA.debugLineNum = 240;BA.debugLine="value = Value1";
_value = BA.ObjectToString(_value1);
 //BA.debugLineNum = 242;BA.debugLine="End Sub";
return "";
}
public String  _settingmenu() throws Exception{
 //BA.debugLineNum = 428;BA.debugLine="Private Sub SettingMenu";
 //BA.debugLineNum = 430;BA.debugLine="StartActivity(actSetting)";
__c.StartActivity(ba,(Object)(_actsetting.getObject()));
 //BA.debugLineNum = 432;BA.debugLine="End Sub";
return "";
}
public String  _showinformationlink(anywheresoftware.b4a.objects.collections.List _ls) throws Exception{
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _te = null;
String _sname = "";
 //BA.debugLineNum = 455;BA.debugLine="Sub ShowInformationLink(ls As List)";
 //BA.debugLineNum = 457;BA.debugLine="lsheader.AddSingleLine(Library.GetStringResourse(";
_lsheader.AddSingleLine(BA.ObjectToCharSequence(_library._getstringresourse(ba,"shop_inf")));
 //BA.debugLineNum = 459;BA.debugLine="For i = 0 To ls.Size - 1";
{
final int step2 = 1;
final int limit2 = (int) (_ls.getSize()-1);
for (_i = (int) (0) ; (step2 > 0 && _i <= limit2) || (step2 < 0 && _i >= limit2); _i = ((int)(0 + _i + step2)) ) {
 //BA.debugLineNum = 461;BA.debugLine="Dim Te As Map";
_te = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 462;BA.debugLine="Te = ls.Get(i)";
_te.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get(_i)));
 //BA.debugLineNum = 463;BA.debugLine="Dim sname As String";
_sname = "";
 //BA.debugLineNum = 464;BA.debugLine="sname = Te.Get(\"title\")";
_sname = BA.ObjectToString(_te.Get((Object)("title")));
 //BA.debugLineNum = 466;BA.debugLine="sname = sname.Replace(\"&quot;\",QUOTE).Replace(\"&";
_sname = _sname.replace("&quot;",__c.QUOTE).replace("&amp;","&");
 //BA.debugLineNum = 468;BA.debugLine="If ExistExclusiveMenu(sname) = True Then Continu";
if (_existexclusivemenu(_sname)==__c.True) { 
if (true) continue;};
 //BA.debugLineNum = 470;BA.debugLine="lsheader.AddTwoLines2(sname,\"\",Te.Get(\"id\"))";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_sname),BA.ObjectToCharSequence(""),_te.Get((Object)("id")));
 }
};
 //BA.debugLineNum = 474;BA.debugLine="lsheader.AddTwoLines2(Library.GetStringResourse(\"";
_lsheader.AddTwoLines2(BA.ObjectToCharSequence(_library._getstringresourse(ba,"exit_app")),BA.ObjectToCharSequence(""),(Object)("close"));
 //BA.debugLineNum = 476;BA.debugLine="End Sub";
return "";
}
public String  _tmr1_tick() throws Exception{
 //BA.debugLineNum = 244;BA.debugLine="Private Sub tmr1_Tick";
 //BA.debugLineNum = 245;BA.debugLine="tmrdelay.Enabled = False";
_tmrdelay.setEnabled(__c.False);
 //BA.debugLineNum = 246;BA.debugLine="DoAction";
_doaction();
 //BA.debugLineNum = 247;BA.debugLine="End Sub";
return "";
}
public String  _togglemenu() throws Exception{
 //BA.debugLineNum = 102;BA.debugLine="Public Sub ToggleMenu";
 //BA.debugLineNum = 104;BA.debugLine="If GetVisible Then";
if (_getvisible()) { 
 //BA.debugLineNum = 105;BA.debugLine="NavDrawer.CloseDrawer2(GravityMenu)";
_navdrawer.CloseDrawer2(_gravitymenu);
 }else {
 //BA.debugLineNum = 107;BA.debugLine="Content.Visible = True";
_content.setVisible(__c.True);
 //BA.debugLineNum = 108;BA.debugLine="NavDrawer.OpenDrawer2(GravityMenu)";
_navdrawer.OpenDrawer2(_gravitymenu);
 };
 //BA.debugLineNum = 111;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
