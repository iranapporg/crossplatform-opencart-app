package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class opencart extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.demo.opencart");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.demo.opencart.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
public anywheresoftware.b4a.objects.StringUtils _su = null;
public String _myurl = "";
public String _apiurl = "";
public String _evt = "";
public Object _smodule = null;
public String _currentcategory = "";
public String _token = "";
public String _tok = "";
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
public String  _add2cart(Object _module,String _event,String _sid,String _scount,anywheresoftware.b4a.objects.collections.Map _soptions) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sproduct = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1821;BA.debugLine="Public Sub Add2Cart(Module As Object,Event As Stri";
 //BA.debugLineNum = 1823;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1825;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1826;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1827;BA.debugLine="currentCategory = \"cart\"";
_currentcategory = "cart";
 //BA.debugLineNum = 1829;BA.debugLine="Dim sProduct As Map";
_sproduct = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1830;BA.debugLine="sProduct.Initialize";
_sproduct.Initialize();
 //BA.debugLineNum = 1831;BA.debugLine="sProduct.Put(\"product_id\",sID)";
_sproduct.Put((Object)("product_id"),(Object)(_sid));
 //BA.debugLineNum = 1832;BA.debugLine="sProduct.Put(\"quantity\",sCount)";
_sproduct.Put((Object)("quantity"),(Object)(_scount));
 //BA.debugLineNum = 1833;BA.debugLine="sProduct.Put(\"option\",sOptions)";
_sproduct.Put((Object)("option"),(Object)(_soptions.getObject()));
 //BA.debugLineNum = 1835;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1836;BA.debugLine="js.Initialize(sProduct)";
_js.Initialize(_sproduct);
 //BA.debugLineNum = 1838;BA.debugLine="hu.Initialize(\"add2cart\",Me)";
_hu._initialize(ba,"add2cart",this);
 //BA.debugLineNum = 1839;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1841;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1842;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1844;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1846;BA.debugLine="End Sub";
return "";
}
public String  _addaddress(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _sdata,boolean _ispayment) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1500;BA.debugLine="Public Sub AddAddress(Module As Object,Event As St";
 //BA.debugLineNum = 1502;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1504;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1505;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1507;BA.debugLine="If IsPayment Then";
if (_ispayment) { 
 //BA.debugLineNum = 1508;BA.debugLine="currentCategory = \"paymentaddress\"";
_currentcategory = "paymentaddress";
 }else {
 //BA.debugLineNum = 1510;BA.debugLine="currentCategory = \"shippingaddress\"";
_currentcategory = "shippingaddress";
 };
 //BA.debugLineNum = 1513;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1514;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 1516;BA.debugLine="hu.Initialize(\"addaddress\",Me)";
_hu._initialize(ba,"addaddress",this);
 //BA.debugLineNum = 1517;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1519;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1520;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1522;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1523;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 1524;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 1526;BA.debugLine="End Sub";
return "";
}
public String  _addaddressuser(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _sdata) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 2229;BA.debugLine="Public Sub AddAddressUser(Module As Object,Event A";
 //BA.debugLineNum = 2231;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2233;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2234;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2235;BA.debugLine="currentCategory = \"account/address\"";
_currentcategory = "account/address";
 //BA.debugLineNum = 2237;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 2238;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 2240;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2241;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 2243;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2244;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2245;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2246;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2248;BA.debugLine="End Sub";
return "";
}
public String  _addcoupon(Object _module,String _event,String _sid) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1661;BA.debugLine="Public Sub AddCoupon(Module As Object,Event As Str";
 //BA.debugLineNum = 1663;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1665;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1666;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1667;BA.debugLine="currentCategory = \"coupon\"";
_currentcategory = "coupon";
 //BA.debugLineNum = 1669;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1670;BA.debugLine="js.Initialize(CreateMap(\"coupon\" : sID))";
_js.Initialize(__c.createMap(new Object[] {(Object)("coupon"),(Object)(_sid)}));
 //BA.debugLineNum = 1672;BA.debugLine="hu.Initialize(\"coupon\",Me)";
_hu._initialize(ba,"coupon",this);
 //BA.debugLineNum = 1673;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1675;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1676;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1678;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1679;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 1680;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 1682;BA.debugLine="End Sub";
return "";
}
public String  _addreviewproduct(Object _module,String _event,String _sid,String _sname,String _stext,String _srating) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sreview = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1261;BA.debugLine="Public Sub AddReviewProduct(Module As Object,Event";
 //BA.debugLineNum = 1263;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1265;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1266;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1267;BA.debugLine="currentCategory = $\"products/${sID}/review\"$";
_currentcategory = ("products/"+__c.SmartStringFormatter("",(Object)(_sid))+"/review");
 //BA.debugLineNum = 1269;BA.debugLine="Dim sReview As Map";
_sreview = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1270;BA.debugLine="sReview.Initialize";
_sreview.Initialize();
 //BA.debugLineNum = 1271;BA.debugLine="sReview.Put(\"name\",sName)";
_sreview.Put((Object)("name"),(Object)(_sname));
 //BA.debugLineNum = 1272;BA.debugLine="sReview.Put(\"text\",sText)";
_sreview.Put((Object)("text"),(Object)(_stext));
 //BA.debugLineNum = 1273;BA.debugLine="sReview.Put(\"rating\",sRating)";
_sreview.Put((Object)("rating"),(Object)(_srating));
 //BA.debugLineNum = 1275;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1276;BA.debugLine="js.Initialize(sReview)";
_js.Initialize(_sreview);
 //BA.debugLineNum = 1278;BA.debugLine="hu.Initialize(\"review\",Me)";
_hu._initialize(ba,"review",this);
 //BA.debugLineNum = 1279;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1281;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1282;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1284;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1286;BA.debugLine="End Sub";
return "";
}
public String  _addreward(Object _module,String _event,String _sid) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1684;BA.debugLine="Public Sub AddReward(Module As Object,Event As Str";
 //BA.debugLineNum = 1686;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1688;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1689;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1690;BA.debugLine="currentCategory = \"reward\"";
_currentcategory = "reward";
 //BA.debugLineNum = 1692;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1693;BA.debugLine="js.Initialize(CreateMap(\"reward\" : sID))";
_js.Initialize(__c.createMap(new Object[] {(Object)("reward"),(Object)(_sid)}));
 //BA.debugLineNum = 1695;BA.debugLine="hu.Initialize(\"reward\",Me)";
_hu._initialize(ba,"reward",this);
 //BA.debugLineNum = 1696;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1698;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1699;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1701;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1702;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 1703;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 1705;BA.debugLine="End Sub";
return "";
}
public String  _addvoucher(Object _module,String _event,String _sid) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1707;BA.debugLine="Public Sub AddVoucher(Module As Object,Event As St";
 //BA.debugLineNum = 1709;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1711;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1712;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1713;BA.debugLine="currentCategory = \"voucher\"";
_currentcategory = "voucher";
 //BA.debugLineNum = 1715;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1716;BA.debugLine="js.Initialize(CreateMap(\"voucher\" : sID))";
_js.Initialize(__c.createMap(new Object[] {(Object)("voucher"),(Object)(_sid)}));
 //BA.debugLineNum = 1718;BA.debugLine="hu.Initialize(\"voucher\",Me)";
_hu._initialize(ba,"voucher",this);
 //BA.debugLineNum = 1719;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1721;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1722;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1724;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1725;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 1726;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 1728;BA.debugLine="End Sub";
return "";
}
public String  _banner(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2327;BA.debugLine="Public Sub Banner(Module As Object,Event As String";
 //BA.debugLineNum = 2329;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2331;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 2333;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2334;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2336;BA.debugLine="currentCategory = \"banners\"";
_currentcategory = "banners";
 //BA.debugLineNum = 2338;BA.debugLine="If sID <> \"\" Then currentCategory = currentCatego";
if ((_sid).equals("") == false) { 
_currentcategory = _currentcategory+"/"+_sid;};
 //BA.debugLineNum = 2340;BA.debugLine="hu.Initialize(\"banners\",Me)";
_hu._initialize(ba,"banners",this);
 //BA.debugLineNum = 2341;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2342;BA.debugLine="hu.Tag = apiurl & currentCategory";
_hu._tag = (Object)(_apiurl+_currentcategory);
 //BA.debugLineNum = 2344;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2345;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2346;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2348;BA.debugLine="End Sub";
return "";
}
public String  _checkhttps() throws Exception{
 //BA.debugLineNum = 22;BA.debugLine="Private Sub CheckHttps";
 //BA.debugLineNum = 24;BA.debugLine="If Library.Config <> Null Then";
if (_library._config!= null) { 
 //BA.debugLineNum = 25;BA.debugLine="If Library.Config.IsInitialized Then";
if (_library._config.IsInitialized()) { 
 //BA.debugLineNum = 26;BA.debugLine="If Library.Config.ContainsKey(\"https\") Then";
if (_library._config.ContainsKey((Object)("https"))) { 
 //BA.debugLineNum = 27;BA.debugLine="If Library.Config.Get(\"https\") = True Then";
if ((_library._config.Get((Object)("https"))).equals((Object)(__c.True))) { 
 //BA.debugLineNum = 28;BA.debugLine="myurl = myurl.Replace(\"http://\",\"https://\")";
_myurl = _myurl.replace("http://","https://");
 //BA.debugLineNum = 29;BA.debugLine="apiurl = apiurl.Replace(\"http://\",\"https://\")";
_apiurl = _apiurl.replace("http://","https://");
 };
 };
 };
 };
 //BA.debugLineNum = 35;BA.debugLine="End Sub";
return "";
}
public String  _checksumlocal(anywheresoftware.b4a.objects.collections.List _data) throws Exception{
boolean _blnchanged = false;
anywheresoftware.b4a.objects.collections.List _temp = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
anywheresoftware.b4a.objects.collections.Map _md = null;
anywheresoftware.b4a.objects.collections.Map _md2 = null;
String _d1 = "";
String _d2 = "";
String _tbl = "";
anywheresoftware.b4a.objects.NotificationWrapper _nt = null;
 //BA.debugLineNum = 64;BA.debugLine="Public Sub CheckSumLocal(Data As List)";
 //BA.debugLineNum = 66;BA.debugLine="Dim blnChanged As Boolean";
_blnchanged = false;
 //BA.debugLineNum = 68;BA.debugLine="If Library.CacheSystem.ExistID(\"checksum\",\"checks";
if (_library._cachesystem._existid("checksum","checksum")==__c.False) { 
 //BA.debugLineNum = 69;BA.debugLine="Library.CacheSystem.AddList2Cache(\"checksum\",Dat";
_library._cachesystem._addlist2cache("checksum",_data,"checksum");
 }else {
 //BA.debugLineNum = 71;BA.debugLine="Dim temp As List";
_temp = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 72;BA.debugLine="temp = Library.CacheSystem.GetCacheAsList(\"check";
_temp = _library._cachesystem._getcacheaslist("checksum","checksum");
 //BA.debugLineNum = 74;BA.debugLine="For i = 0 To temp.Size - 1";
{
final int step7 = 1;
final int limit7 = (int) (_temp.getSize()-1);
for (_i = (int) (0) ; (step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7); _i = ((int)(0 + _i + step7)) ) {
 //BA.debugLineNum = 76;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 77;BA.debugLine="js.Initialize(temp.Get(i))";
_js.Initialize(BA.ObjectToString(_temp.Get(_i)));
 //BA.debugLineNum = 79;BA.debugLine="Try";
try { //BA.debugLineNum = 80;BA.debugLine="Dim md,md2 As Map";
_md = new anywheresoftware.b4a.objects.collections.Map();
_md2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 81;BA.debugLine="md = js.NextObject";
_md = _js.NextObject();
 //BA.debugLineNum = 82;BA.debugLine="md2 = Data.Get(i)";
_md2.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get(_i)));
 } 
       catch (Exception e15) {
			ba.setLastException(e15); //BA.debugLineNum = 84;BA.debugLine="Continue";
if (true) continue;
 };
 //BA.debugLineNum = 87;BA.debugLine="Dim d1,d2 As String";
_d1 = "";
_d2 = "";
 //BA.debugLineNum = 88;BA.debugLine="d1 = md.Get(\"checksum\")";
_d1 = BA.ObjectToString(_md.Get((Object)("checksum")));
 //BA.debugLineNum = 89;BA.debugLine="d2 = md2.Get(\"checksum\")";
_d2 = BA.ObjectToString(_md2.Get((Object)("checksum")));
 //BA.debugLineNum = 91;BA.debugLine="If d1 <> d2 Then";
if ((_d1).equals(_d2) == false) { 
 //BA.debugLineNum = 93;BA.debugLine="blnChanged = True";
_blnchanged = __c.True;
 //BA.debugLineNum = 95;BA.debugLine="Dim tbl As String";
_tbl = "";
 //BA.debugLineNum = 96;BA.debugLine="tbl = md2.Get(\"table\")";
_tbl = BA.ObjectToString(_md2.Get((Object)("table")));
 //BA.debugLineNum = 98;BA.debugLine="If tbl.IndexOf(\"product_description\") > -1 The";
if (_tbl.indexOf("product_description")>-1) { 
 //BA.debugLineNum = 100;BA.debugLine="Library.CacheSystem.ClearCache";
_library._cachesystem._clearcache();
 }else if(_tbl.indexOf("product_to_category")>-1) { 
 //BA.debugLineNum = 106;BA.debugLine="Library.CacheSystem.ClearCache";
_library._cachesystem._clearcache();
 }else if(_tbl.indexOf("category")>-1) { 
 //BA.debugLineNum = 110;BA.debugLine="Library.CacheSystem.ClearCache";
_library._cachesystem._clearcache();
 }else if(_tbl.indexOf("product")>-1) { 
 //BA.debugLineNum = 113;BA.debugLine="Library.CacheSystem.ClearCache";
_library._cachesystem._clearcache();
 };
 };
 }
};
 //BA.debugLineNum = 120;BA.debugLine="If blnChanged = True Then";
if (_blnchanged==__c.True) { 
 //BA.debugLineNum = 122;BA.debugLine="Dim nt As Notification";
_nt = new anywheresoftware.b4a.objects.NotificationWrapper();
 //BA.debugLineNum = 123;BA.debugLine="nt.Initialize";
_nt.Initialize();
 //BA.debugLineNum = 124;BA.debugLine="nt.AutoCancel = True";
_nt.setAutoCancel(__c.True);
 //BA.debugLineNum = 125;BA.debugLine="nt.Icon = \"icon\"";
_nt.setIcon("icon");
 //BA.debugLineNum = 126;BA.debugLine="nt.Light = True";
_nt.setLight(__c.True);
 //BA.debugLineNum = 127;BA.debugLine="nt.Sound = True";
_nt.setSound(__c.True);
 //BA.debugLineNum = 128;BA.debugLine="nt.Vibrate = True";
_nt.setVibrate(__c.True);
 //BA.debugLineNum = 129;BA.debugLine="nt.SetInfo(Library.GetStringResourse(\"app_title";
_nt.SetInfo(ba,_library._getstringresourse(getActivityBA(),"app_title"),_library._getstringresourse(getActivityBA(),"update_checksum"),(Object)(_actmenu.getObject()));
 //BA.debugLineNum = 130;BA.debugLine="nt.Notify(1)";
_nt.Notify((int) (1));
 //BA.debugLineNum = 132;BA.debugLine="Library.CacheSystem.DeleteItem(\"checksum\",\"chec";
_library._cachesystem._deleteitem("checksum","checksum");
 //BA.debugLineNum = 133;BA.debugLine="Library.CacheSystem.AddList2Cache(\"checksum\",Da";
_library._cachesystem._addlist2cache("checksum",_data,"checksum");
 };
 };
 //BA.debugLineNum = 139;BA.debugLine="End Sub";
return "";
}
public String  _checksumonline(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2308;BA.debugLine="Public Sub CheckSumOnline(Module As Object,Event A";
 //BA.debugLineNum = 2310;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2312;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 2314;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2315;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2316;BA.debugLine="currentCategory = \"checksums\"";
_currentcategory = "checksums";
 //BA.debugLineNum = 2318;BA.debugLine="hu.Initialize(\"checksums\",Me)";
_hu._initialize(ba,"checksums",this);
 //BA.debugLineNum = 2319;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2321;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2322;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2323;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2325;BA.debugLine="End Sub";
return "";
}
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Private Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 4;BA.debugLine="Private su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 5;BA.debugLine="Private myurl,apiurl As String";
_myurl = "";
_apiurl = "";
 //BA.debugLineNum = 6;BA.debugLine="Private EVT As String";
_evt = "";
 //BA.debugLineNum = 7;BA.debugLine="Private sModule As Object";
_smodule = new Object();
 //BA.debugLineNum = 8;BA.debugLine="Private currentCategory,token,tok As String";
_currentcategory = "";
_token = "";
_tok = "";
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return "";
}
public String  _clearcart(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2004;BA.debugLine="Public Sub ClearCart(Module As Object,Event As Str";
 //BA.debugLineNum = 2006;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2008;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2009;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2010;BA.debugLine="currentCategory = \"cart/empty\"";
_currentcategory = "cart/empty";
 //BA.debugLineNum = 2012;BA.debugLine="hu.Initialize(\"clearcart\",Me)";
_hu._initialize(ba,"clearcart",this);
 //BA.debugLineNum = 2013;BA.debugLine="hu.PostString(apiurl & currentCategory,\"\")";
_hu._poststring(_apiurl+_currentcategory,"");
 //BA.debugLineNum = 2014;BA.debugLine="hu.GetRequest.InitializeDelete(apiurl & currentCa";
_hu._getrequest().InitializeDelete(_apiurl+_currentcategory);
 //BA.debugLineNum = 2016;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2017;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2018;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2020;BA.debugLine="End Sub";
return "";
}
public String  _clearcartafterpayment(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1927;BA.debugLine="Public Sub ClearCartAfterPayment(Module As Object,";
 //BA.debugLineNum = 1929;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1931;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1932;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1933;BA.debugLine="currentCategory = \"confirm\"";
_currentcategory = "confirm";
 //BA.debugLineNum = 1935;BA.debugLine="hu.Initialize(\"clearcart_payment\",Me)";
_hu._initialize(ba,"clearcart_payment",this);
 //BA.debugLineNum = 1936;BA.debugLine="hu.PostString(apiurl & currentCategory,\"\")";
_hu._poststring(_apiurl+_currentcategory,"");
 //BA.debugLineNum = 1937;BA.debugLine="hu.GetRequest.InitializePut2(apiurl & currentCate";
_hu._getrequest().InitializePut2(_apiurl+_currentcategory,"".getBytes("UTF8"));
 //BA.debugLineNum = 1939;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1940;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1942;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1943;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 1945;BA.debugLine="End Sub";
return "";
}
public String  _compareproduct(Object _module,String _event) throws Exception{
int _i = 0;
String _auth = "";
 //BA.debugLineNum = 2371;BA.debugLine="Public Sub CompareProduct(Module As Object,Event A";
 //BA.debugLineNum = 2373;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2375;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 2377;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2378;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2379;BA.debugLine="currentCategory = \"compare/\"";
_currentcategory = "compare/";
 //BA.debugLineNum = 2381;BA.debugLine="For i = 0 To Library.ListProductIDForCompare.Size";
{
final int step6 = 1;
final int limit6 = (int) (_library._listproductidforcompare.getSize()-1);
for (_i = (int) (0) ; (step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6); _i = ((int)(0 + _i + step6)) ) {
 //BA.debugLineNum = 2382;BA.debugLine="currentCategory = currentCategory & Library.List";
_currentcategory = _currentcategory+BA.ObjectToString(_library._listproductidforcompare.Get(_i))+",";
 }
};
 //BA.debugLineNum = 2385;BA.debugLine="currentCategory = currentCategory.SubString2(0,cu";
_currentcategory = _currentcategory.substring((int) (0),(int) (_currentcategory.length()-1));
 //BA.debugLineNum = 2387;BA.debugLine="hu.Initialize(\"compare\",Me)";
_hu._initialize(ba,"compare",this);
 //BA.debugLineNum = 2388;BA.debugLine="hu.Tag = apiurl & currentCategory";
_hu._tag = (Object)(_apiurl+_currentcategory);
 //BA.debugLineNum = 2389;BA.debugLine="Log(apiurl & currentCategory)";
__c.Log(_apiurl+_currentcategory);
 //BA.debugLineNum = 2390;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2392;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2393;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2394;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2395;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2397;BA.debugLine="End Sub";
return "";
}
public String  _contactus(Object _module,String _event,String _semail,String _sname,String _stext) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sreview = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 955;BA.debugLine="Public Sub ContactUs(Module As Object,Event As Str";
 //BA.debugLineNum = 957;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 959;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 960;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 961;BA.debugLine="currentCategory = \"contact\"";
_currentcategory = "contact";
 //BA.debugLineNum = 963;BA.debugLine="Dim sReview As Map";
_sreview = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 964;BA.debugLine="sReview.Initialize";
_sreview.Initialize();
 //BA.debugLineNum = 965;BA.debugLine="sReview.Put(\"name\",sName)";
_sreview.Put((Object)("name"),(Object)(_sname));
 //BA.debugLineNum = 966;BA.debugLine="sReview.Put(\"email\",sEmail)";
_sreview.Put((Object)("email"),(Object)(_semail));
 //BA.debugLineNum = 967;BA.debugLine="sReview.Put(\"enquiry\",sText)";
_sreview.Put((Object)("enquiry"),(Object)(_stext));
 //BA.debugLineNum = 969;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 970;BA.debugLine="js.Initialize(sReview)";
_js.Initialize(_sreview);
 //BA.debugLineNum = 972;BA.debugLine="hu.Initialize(\"contact\",Me)";
_hu._initialize(ba,"contact",this);
 //BA.debugLineNum = 973;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 975;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 976;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 978;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 980;BA.debugLine="End Sub";
return "";
}
public String  _customsearchproduct(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _sfield,int _limit) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1171;BA.debugLine="Public Sub CustomSearchProduct(Module As Object,Ev";
 //BA.debugLineNum = 1173;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1175;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1176;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1178;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 1179;BA.debugLine="currentCategory = \"products/custom_search/limit/\"";
_currentcategory = "products/custom_search/limit/"+BA.NumberToString(_limit)+"/page/1";
 //BA.debugLineNum = 1181;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1182;BA.debugLine="js.Initialize(sField)";
_js.Initialize(_sfield);
 //BA.debugLineNum = 1184;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 //BA.debugLineNum = 1185;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1187;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1188;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1190;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1192;BA.debugLine="hu.GetRequest.SetContentEncoding(\"utf-8\")";
_hu._getrequest().SetContentEncoding("utf-8");
 //BA.debugLineNum = 1193;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1195;BA.debugLine="End Sub";
return "";
}
public String  _deleteaddressuser(Object _module,String _event,String _sid) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sproduct = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 2202;BA.debugLine="Public Sub DeleteAddressUser(Module As Object,Even";
 //BA.debugLineNum = 2204;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2206;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2207;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2208;BA.debugLine="currentCategory = \"account/address/\" & sID";
_currentcategory = "account/address/"+_sid;
 //BA.debugLineNum = 2210;BA.debugLine="Dim sProduct As Map";
_sproduct = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 2211;BA.debugLine="sProduct.Initialize";
_sproduct.Initialize();
 //BA.debugLineNum = 2212;BA.debugLine="sProduct.Put(\"id\",sID)";
_sproduct.Put((Object)("id"),(Object)(_sid));
 //BA.debugLineNum = 2214;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 2215;BA.debugLine="js.Initialize(sProduct)";
_js.Initialize(_sproduct);
 //BA.debugLineNum = 2217;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2218;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 2219;BA.debugLine="hu.GetRequest.InitializeDelete(apiurl & currentCa";
_hu._getrequest().InitializeDelete(_apiurl+_currentcategory);
 //BA.debugLineNum = 2221;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2222;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2224;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2225;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 2227;BA.debugLine="End Sub";
return "";
}
public String  _deleteproductfromcart(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
anywheresoftware.b4a.objects.collections.Map _sproduct = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 1947;BA.debugLine="Public Sub DeleteProductFromCart(Module As Object,";
 //BA.debugLineNum = 1949;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1951;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1952;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1953;BA.debugLine="currentCategory = \"cart\"";
_currentcategory = "cart";
 //BA.debugLineNum = 1955;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1956;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1958;BA.debugLine="Dim sProduct As Map";
_sproduct = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1959;BA.debugLine="sProduct.Initialize";
_sproduct.Initialize();
 //BA.debugLineNum = 1960;BA.debugLine="sProduct.Put(\"key\",sID)";
_sproduct.Put((Object)("key"),(Object)(_sid));
 //BA.debugLineNum = 1962;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1963;BA.debugLine="js.Initialize(sProduct)";
_js.Initialize(_sproduct);
 //BA.debugLineNum = 1965;BA.debugLine="hu.Initialize(\"deletecartitem\",Me)";
_hu._initialize(ba,"deletecartitem",this);
 //BA.debugLineNum = 1966;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1967;BA.debugLine="hu.GetRequest.InitializeDelete2(apiurl & currentC";
_hu._getrequest().InitializeDelete2(_apiurl+_currentcategory,_js.ToString().getBytes("UTF8"));
 //BA.debugLineNum = 1969;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1970;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 1971;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 1973;BA.debugLine="End Sub";
return "";
}
public String  _editaddressuser(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _sdata,String _sid) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 2250;BA.debugLine="Public Sub EditAddressUser(Module As Object,Event";
 //BA.debugLineNum = 2252;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2254;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2255;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2256;BA.debugLine="currentCategory = \"account/address/\" & sID";
_currentcategory = "account/address/"+_sid;
 //BA.debugLineNum = 2258;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 2259;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 2261;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2262;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 2263;BA.debugLine="hu.GetRequest.InitializePut2(apiurl & currentCate";
_hu._getrequest().InitializePut2(_apiurl+_currentcategory,_js.ToString().getBytes("UTF8"));
 //BA.debugLineNum = 2265;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2266;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2267;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2268;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 2269;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 2270;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2272;BA.debugLine="End Sub";
return "";
}
public String  _forgotpassword(Object _module,String _event,String _semail) throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 982;BA.debugLine="Public Sub ForgotPassword(Module As Object,Event A";
 //BA.debugLineNum = 984;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 986;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 987;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 988;BA.debugLine="currentCategory = \"forgotten\"";
_currentcategory = "forgotten";
 //BA.debugLineNum = 990;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 991;BA.debugLine="data.Initialize";
_data.Initialize();
 //BA.debugLineNum = 992;BA.debugLine="data.Put(\"email\",sEmail)";
_data.Put((Object)("email"),(Object)(_semail));
 //BA.debugLineNum = 994;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 995;BA.debugLine="js.Initialize(data)";
_js.Initialize(_data);
 //BA.debugLineNum = 997;BA.debugLine="hu.Initialize(\"forgot\",Me)";
_hu._initialize(ba,"forgot",this);
 //BA.debugLineNum = 998;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1000;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1001;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1002;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1004;BA.debugLine="End Sub";
return "";
}
public int  _getcartcount() throws Exception{
anywheresoftware.b4a.objects.collections.List _l1 = null;
 //BA.debugLineNum = 1871;BA.debugLine="Public Sub GetCartCount As Int";
 //BA.debugLineNum = 1873;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1875;BA.debugLine="If Library.CartDetails = Null Then Return 0";
if (_library._cartdetails== null) { 
if (true) return (int) (0);};
 //BA.debugLineNum = 1876;BA.debugLine="If Library.CartDetails.IsInitialized = False Then";
if (_library._cartdetails.IsInitialized()==__c.False) { 
if (true) return (int) (0);};
 //BA.debugLineNum = 1877;BA.debugLine="If Library.CartDetails.ContainsKey(\"products\") =";
if (_library._cartdetails.ContainsKey((Object)("products"))==__c.False) { 
if (true) return (int) (0);};
 //BA.debugLineNum = 1879;BA.debugLine="Try";
try { //BA.debugLineNum = 1880;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1881;BA.debugLine="l1 = Library.CartDetails.Get(\"products\")";
_l1.setObject((java.util.List)(_library._cartdetails.Get((Object)("products"))));
 //BA.debugLineNum = 1882;BA.debugLine="Return l1.Size";
if (true) return _l1.getSize();
 } 
       catch (Exception e10) {
			ba.setLastException(e10); //BA.debugLineNum = 1884;BA.debugLine="Return 0";
if (true) return (int) (0);
 };
 //BA.debugLineNum = 1887;BA.debugLine="End Sub";
return 0;
}
public String  _getcarts(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1848;BA.debugLine="Public Sub GetCarts(Module As Object,Event As Stri";
 //BA.debugLineNum = 1850;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1852;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1853;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1854;BA.debugLine="currentCategory = \"cart\"";
_currentcategory = "cart";
 //BA.debugLineNum = 1856;BA.debugLine="hu.Initialize(\"carts\",Me)";
_hu._initialize(ba,"carts",this);
 //BA.debugLineNum = 1858;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1860;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1862;BA.debugLine="If Library.token.IsInitialized Then";
if (_library._token.IsInitialized()) { 
 //BA.debugLineNum = 1863;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Ge";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 };
 //BA.debugLineNum = 1866;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1867;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1869;BA.debugLine="End Sub";
return "";
}
public anywheresoftware.b4a.objects.collections.Map  _getcarttotal(anywheresoftware.b4a.objects.collections.List _data) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sdata = null;
anywheresoftware.b4a.objects.collections.Map _tax = null;
anywheresoftware.b4a.objects.collections.Map _afzodeh = null;
anywheresoftware.b4a.objects.collections.Map _total = null;
 //BA.debugLineNum = 1889;BA.debugLine="Public Sub GetCartTotal(Data As List) As Map";
 //BA.debugLineNum = 1891;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1893;BA.debugLine="Dim sdata,tax,afzodeh,total As Map";
_sdata = new anywheresoftware.b4a.objects.collections.Map();
_tax = new anywheresoftware.b4a.objects.collections.Map();
_afzodeh = new anywheresoftware.b4a.objects.collections.Map();
_total = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1894;BA.debugLine="sdata.Initialize";
_sdata.Initialize();
 //BA.debugLineNum = 1895;BA.debugLine="tax.Initialize";
_tax.Initialize();
 //BA.debugLineNum = 1896;BA.debugLine="afzodeh.Initialize";
_afzodeh.Initialize();
 //BA.debugLineNum = 1898;BA.debugLine="If Data.IsInitialized = False Then";
if (_data.IsInitialized()==__c.False) { 
 //BA.debugLineNum = 1899;BA.debugLine="sdata.Put(\"tax\",\"0\")";
_sdata.Put((Object)("tax"),(Object)("0"));
 //BA.debugLineNum = 1900;BA.debugLine="sdata.Put(\"total\",\"0\")";
_sdata.Put((Object)("total"),(Object)("0"));
 //BA.debugLineNum = 1901;BA.debugLine="sdata.Put(\"total\",\"0\")";
_sdata.Put((Object)("total"),(Object)("0"));
 //BA.debugLineNum = 1902;BA.debugLine="sdata.Put(\"afzodeh\",\"0\")";
_sdata.Put((Object)("afzodeh"),(Object)("0"));
 //BA.debugLineNum = 1903;BA.debugLine="Return sdata";
if (true) return _sdata;
 };
 //BA.debugLineNum = 1906;BA.debugLine="afzodeh = Data.Get(1)";
_afzodeh.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get((int) (1))));
 //BA.debugLineNum = 1908;BA.debugLine="If Data.Size > 2 Then";
if (_data.getSize()>2) { 
 //BA.debugLineNum = 1909;BA.debugLine="tax		= Data.Get(2)";
_tax.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get((int) (2))));
 //BA.debugLineNum = 1910;BA.debugLine="sdata.Put(\"tax\",tax.Get(\"text\"))";
_sdata.Put((Object)("tax"),_tax.Get((Object)("text")));
 };
 //BA.debugLineNum = 1913;BA.debugLine="If Data.Size > 3 Then";
if (_data.getSize()>3) { 
 //BA.debugLineNum = 1914;BA.debugLine="total	= Data.Get(3)";
_total.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get((int) (3))));
 //BA.debugLineNum = 1915;BA.debugLine="sdata.Put(\"total\",total.Get(\"text\"))";
_sdata.Put((Object)("total"),_total.Get((Object)("text")));
 }else {
 //BA.debugLineNum = 1917;BA.debugLine="total	= Data.Get(1)";
_total.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get((int) (1))));
 //BA.debugLineNum = 1918;BA.debugLine="sdata.Put(\"total\",total.Get(\"text\"))";
_sdata.Put((Object)("total"),_total.Get((Object)("text")));
 };
 //BA.debugLineNum = 1921;BA.debugLine="sdata.Put(\"afzodeh\",afzodeh.Get(\"text\"))";
_sdata.Put((Object)("afzodeh"),_afzodeh.Get((Object)("text")));
 //BA.debugLineNum = 1923;BA.debugLine="Return sdata";
if (true) return _sdata;
 //BA.debugLineNum = 1925;BA.debugLine="End Sub";
return null;
}
public String  _getcategory(Object _module,String _event,String _sparentid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1059;BA.debugLine="Public Sub GetCategory(Module As Object,Event As S";
 //BA.debugLineNum = 1061;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1063;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1064;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1066;BA.debugLine="If sParentID = \"\" Then";
if ((_sparentid).equals("")) { 
 //BA.debugLineNum = 1067;BA.debugLine="currentCategory = \"categories\"";
_currentcategory = "categories";
 }else {
 //BA.debugLineNum = 1069;BA.debugLine="currentCategory = \"categories/parent/\" & sParent";
_currentcategory = "categories/parent/"+_sparentid;
 };
 //BA.debugLineNum = 1072;BA.debugLine="hu.Initialize(\"categories\",Me)";
_hu._initialize(ba,"categories",this);
 //BA.debugLineNum = 1073;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1075;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1076;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1078;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1079;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1081;BA.debugLine="End Sub";
return "";
}
public String  _getcategorydetails(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1083;BA.debugLine="Public Sub GetCategoryDetails(Module As Object,Eve";
 //BA.debugLineNum = 1085;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1087;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1088;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1090;BA.debugLine="currentCategory = \"categories/\" & sID";
_currentcategory = "categories/"+_sid;
 //BA.debugLineNum = 1092;BA.debugLine="hu.Initialize(\"categories\",Me)";
_hu._initialize(ba,"categories",this);
 //BA.debugLineNum = 1093;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1095;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1096;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1098;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1099;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1101;BA.debugLine="End Sub";
return "";
}
public String  _getcategoryproducts(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1103;BA.debugLine="Public Sub GetCategoryProducts(Module As Object,Ev";
 //BA.debugLineNum = 1105;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1107;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1108;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1110;BA.debugLine="If sID = \"0\" Then";
if ((_sid).equals("0")) { 
 //BA.debugLineNum = 1111;BA.debugLine="currentCategory = \"products/category\"";
_currentcategory = "products/category";
 }else {
 //BA.debugLineNum = 1113;BA.debugLine="currentCategory = \"products/category/\" & sID";
_currentcategory = "products/category/"+_sid;
 };
 //BA.debugLineNum = 1116;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 //BA.debugLineNum = 1118;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1120;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1121;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1123;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1124;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1126;BA.debugLine="End Sub";
return "";
}
public String  _getcategoryproductslimit(Object _module,String _event,String _sid,int _spage,int _slimit) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1128;BA.debugLine="Public Sub GetCategoryProductsLimit(Module As Obje";
 //BA.debugLineNum = 1130;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1132;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1133;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1135;BA.debugLine="currentCategory = $\"products/category/${sID}/limi";
_currentcategory = ("products/category/"+__c.SmartStringFormatter("",(Object)(_sid))+"/limit/"+__c.SmartStringFormatter("",(Object)(_slimit))+"/page/"+__c.SmartStringFormatter("",(Object)(_spage))+"");
 //BA.debugLineNum = 1137;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 //BA.debugLineNum = 1139;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1141;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1142;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1144;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1145;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1147;BA.debugLine="End Sub";
return "";
}
public String  _getcity(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1290;BA.debugLine="Public Sub GetCity(Module As Object,Event As Strin";
 //BA.debugLineNum = 1292;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1294;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1295;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1296;BA.debugLine="currentCategory = \"countries/\" & sID";
_currentcategory = "countries/"+_sid;
 //BA.debugLineNum = 1298;BA.debugLine="hu.Initialize(\"city\",Me)";
_hu._initialize(ba,"city",this);
 //BA.debugLineNum = 1300;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1302;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1303;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1305;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1306;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1308;BA.debugLine="End Sub";
return "";
}
public String  _getcountry(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1310;BA.debugLine="Public Sub GetCountry(Module As Object,Event As St";
 //BA.debugLineNum = 1312;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1314;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1315;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1316;BA.debugLine="currentCategory = \"countries\"";
_currentcategory = "countries";
 //BA.debugLineNum = 1318;BA.debugLine="hu.Initialize(\"country\",Me)";
_hu._initialize(ba,"country",this);
 //BA.debugLineNum = 1320;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1322;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1323;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1325;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1326;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1328;BA.debugLine="End Sub";
return "";
}
public String  _getcurrenttoken() throws Exception{
 //BA.debugLineNum = 59;BA.debugLine="Public Sub GetCurrentToken As String";
 //BA.debugLineNum = 60;BA.debugLine="tok = Library.token.Get(\"access_token\")";
_tok = BA.ObjectToString(_library._token.Get((Object)("access_token")));
 //BA.debugLineNum = 61;BA.debugLine="Return tok";
if (true) return _tok;
 //BA.debugLineNum = 62;BA.debugLine="End Sub";
return "";
}
public String  _getinformation(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1619;BA.debugLine="Public Sub GetInformation(Module As Object,Event A";
 //BA.debugLineNum = 1621;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1623;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 1625;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1626;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1628;BA.debugLine="currentCategory = \"information\"";
_currentcategory = "information";
 //BA.debugLineNum = 1630;BA.debugLine="hu.Initialize(\"information\",Me)";
_hu._initialize(ba,"information",this);
 //BA.debugLineNum = 1631;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1633;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1634;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1635;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1636;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1638;BA.debugLine="End Sub";
return "";
}
public String  _getinformationdetailsid(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1640;BA.debugLine="Public Sub GetInformationDetailsID(Module As Objec";
 //BA.debugLineNum = 1642;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1644;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1645;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1647;BA.debugLine="currentCategory = \"information/\" & sID";
_currentcategory = "information/"+_sid;
 //BA.debugLineNum = 1649;BA.debugLine="hu.Initialize(\"information\",Me)";
_hu._initialize(ba,"information",this);
 //BA.debugLineNum = 1650;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1652;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1653;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1654;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1655;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1657;BA.debugLine="End Sub";
return "";
}
public String  _getlanguages(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2399;BA.debugLine="Public Sub GetLanguages(Module As Object,Event As";
 //BA.debugLineNum = 2401;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2403;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 2405;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2406;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2407;BA.debugLine="currentCategory = \"languages\"";
_currentcategory = "languages";
 //BA.debugLineNum = 2409;BA.debugLine="hu.Initialize(\"languages\",Me)";
_hu._initialize(ba,"languages",this);
 //BA.debugLineNum = 2410;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2412;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2413;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2414;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2416;BA.debugLine="End Sub";
return "";
}
public String  _getmanufactureproduct(String _sid,Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1040;BA.debugLine="Public Sub GetmanufactureProduct(sID As String,Mod";
 //BA.debugLineNum = 1042;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1044;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1045;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1046;BA.debugLine="currentCategory = \"/index.php?route=feed/rest_api";
_currentcategory = "/index.php?route=feed/rest_api/products&manufacturer="+_sid;
 //BA.debugLineNum = 1048;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 //BA.debugLineNum = 1050;BA.debugLine="hu.Download(myurl & currentCategory)";
_hu._download(_myurl+_currentcategory);
 //BA.debugLineNum = 1052;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1053;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1054;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1055;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1057;BA.debugLine="End Sub";
return "";
}
public String  _getmanufacturers(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1598;BA.debugLine="Public Sub GetManufacturers(Module As Object,Event";
 //BA.debugLineNum = 1600;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1602;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 1604;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1605;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1607;BA.debugLine="currentCategory = \"manufacturers\"";
_currentcategory = "manufacturers";
 //BA.debugLineNum = 1609;BA.debugLine="hu.Initialize(\"manufacturers\",Me)";
_hu._initialize(ba,"manufacturers",this);
 //BA.debugLineNum = 1610;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1612;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1613;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1614;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1615;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1617;BA.debugLine="End Sub";
return "";
}
public String  _getorders(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1528;BA.debugLine="Public Sub GetOrders(Module As Object,Event As Str";
 //BA.debugLineNum = 1530;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1532;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1533;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1535;BA.debugLine="If sID = \"\" Then";
if ((_sid).equals("")) { 
 //BA.debugLineNum = 1536;BA.debugLine="currentCategory = \"customerorders\"";
_currentcategory = "customerorders";
 }else {
 //BA.debugLineNum = 1538;BA.debugLine="currentCategory = \"customerorders/\" & sID";
_currentcategory = "customerorders/"+_sid;
 };
 //BA.debugLineNum = 1541;BA.debugLine="hu.Initialize(\"getothers\",Me)";
_hu._initialize(ba,"getothers",this);
 //BA.debugLineNum = 1542;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1544;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1545;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1546;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1547;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1549;BA.debugLine="End Sub";
return "";
}
public String  _getpaymentaddress(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2166;BA.debugLine="Public Sub GetPaymentAddress(Module As Object,Even";
 //BA.debugLineNum = 2168;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2170;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2171;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2172;BA.debugLine="currentCategory = \"paymentaddress\"";
_currentcategory = "paymentaddress";
 //BA.debugLineNum = 2174;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2175;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2177;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2178;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2179;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2180;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2182;BA.debugLine="End Sub";
return "";
}
public String  _getpaymentmethods(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1393;BA.debugLine="Public Sub GetPaymentMethods(Module As Object,Even";
 //BA.debugLineNum = 1395;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1397;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1398;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1399;BA.debugLine="currentCategory = \"paymentmethods\"";
_currentcategory = "paymentmethods";
 //BA.debugLineNum = 1401;BA.debugLine="hu.Initialize(\"getpayments\",Me)";
_hu._initialize(ba,"getpayments",this);
 //BA.debugLineNum = 1402;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1404;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1405;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1406;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1407;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1409;BA.debugLine="End Sub";
return "";
}
public String  _getproductclass(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2350;BA.debugLine="Public Sub GetProductClass(Module As Object,Event";
 //BA.debugLineNum = 2352;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2354;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 2356;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2357;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2358;BA.debugLine="currentCategory = \"product_classes\"";
_currentcategory = "product_classes";
 //BA.debugLineNum = 2360;BA.debugLine="hu.Initialize(\"product_class\",Me)";
_hu._initialize(ba,"product_class",this);
 //BA.debugLineNum = 2361;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2362;BA.debugLine="hu.Tag = apiurl & currentCategory";
_hu._tag = (Object)(_apiurl+_currentcategory);
 //BA.debugLineNum = 2364;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2365;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2366;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2367;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2369;BA.debugLine="End Sub";
return "";
}
public String  _getreturns(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1551;BA.debugLine="Public Sub GetReturns(Module As Object,Event As St";
 //BA.debugLineNum = 1553;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1555;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1556;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1558;BA.debugLine="If sID = \"\" Then";
if ((_sid).equals("")) { 
 //BA.debugLineNum = 1559;BA.debugLine="currentCategory = \"returns\"";
_currentcategory = "returns";
 }else {
 //BA.debugLineNum = 1561;BA.debugLine="currentCategory = \"returns/\" & sID";
_currentcategory = "returns/"+_sid;
 };
 //BA.debugLineNum = 1564;BA.debugLine="hu.Initialize(\"getothers\",Me)";
_hu._initialize(ba,"getothers",this);
 //BA.debugLineNum = 1565;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1567;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1568;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1569;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1570;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1572;BA.debugLine="End Sub";
return "";
}
public String  _getshipaddress(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2184;BA.debugLine="Public Sub GetShipAddress(Module As Object,Event A";
 //BA.debugLineNum = 2186;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2188;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2189;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2190;BA.debugLine="currentCategory = \"shippingaddress\"";
_currentcategory = "shippingaddress";
 //BA.debugLineNum = 2192;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2193;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2195;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2196;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2197;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2198;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2200;BA.debugLine="End Sub";
return "";
}
public String  _getshipmethods(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1437;BA.debugLine="Public Sub GetShipMethods(Module As Object,Event A";
 //BA.debugLineNum = 1439;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1441;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1442;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1443;BA.debugLine="currentCategory = \"shippingmethods\"";
_currentcategory = "shippingmethods";
 //BA.debugLineNum = 1445;BA.debugLine="hu.Initialize(\"shippingmethods\",Me)";
_hu._initialize(ba,"shippingmethods",this);
 //BA.debugLineNum = 1446;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1448;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1449;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1450;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1451;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1453;BA.debugLine="End Sub";
return "";
}
public String  _getslideshow(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 782;BA.debugLine="Public Sub GetSlideshow(Module As Object,Event As";
 //BA.debugLineNum = 784;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 786;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 788;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 789;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 790;BA.debugLine="currentCategory = \"slideshow\"";
_currentcategory = "slideshow";
 //BA.debugLineNum = 792;BA.debugLine="hu.Initialize(\"slideshow\",Me)";
_hu._initialize(ba,"slideshow",this);
 //BA.debugLineNum = 794;BA.debugLine="hu.Download(apiurl & \"slideshows\")";
_hu._download(_apiurl+"slideshows");
 //BA.debugLineNum = 796;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 797;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 799;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 800;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 802;BA.debugLine="End Sub";
return "";
}
public String  _getspecialproduct(String _category,boolean _paging,int _limit,Object _module,String _event) throws Exception{
String _link = "";
String _auth = "";
 //BA.debugLineNum = 1010;BA.debugLine="Public Sub GetSpecialProduct(Category As String,Pa";
 //BA.debugLineNum = 1012;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1014;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1015;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1016;BA.debugLine="currentCategory = Category";
_currentcategory = _category;
 //BA.debugLineNum = 1018;BA.debugLine="If Category <> \"featured\" Then";
if ((_category).equals("featured") == false) { 
 //BA.debugLineNum = 1019;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 }else {
 //BA.debugLineNum = 1021;BA.debugLine="hu.Initialize(\"featured\",Me)";
_hu._initialize(ba,"featured",this);
 };
 //BA.debugLineNum = 1024;BA.debugLine="Dim link As String";
_link = "";
 //BA.debugLineNum = 1025;BA.debugLine="link = $\"/${Category}/limit/${Limit}\"$";
_link = ("/"+__c.SmartStringFormatter("",(Object)(_category))+"/limit/"+__c.SmartStringFormatter("",(Object)(_limit))+"");
 //BA.debugLineNum = 1027;BA.debugLine="If Paging = True Then";
if (_paging==__c.True) { 
 //BA.debugLineNum = 1028;BA.debugLine="link = link & \"/page/1\"";
_link = _link+"/page/1";
 };
 //BA.debugLineNum = 1031;BA.debugLine="hu.Download(apiurl & link)";
_hu._download(_apiurl+_link);
 //BA.debugLineNum = 1033;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1034;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1035;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1036;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1038;BA.debugLine="End Sub";
return "";
}
public String  _getstore(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1790;BA.debugLine="Public Sub GetStore(Module As Object,Event As Stri";
 //BA.debugLineNum = 1792;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1794;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1795;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1797;BA.debugLine="If sID = \"\" Then";
if ((_sid).equals("")) { 
 //BA.debugLineNum = 1798;BA.debugLine="currentCategory = \"stores\"";
_currentcategory = "stores";
 }else {
 //BA.debugLineNum = 1800;BA.debugLine="currentCategory = \"stores/\" & sID";
_currentcategory = "stores/"+_sid;
 };
 //BA.debugLineNum = 1803;BA.debugLine="hu.Initialize(\"store\",Me)";
_hu._initialize(ba,"store",this);
 //BA.debugLineNum = 1804;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1806;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1807;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1808;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1809;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1811;BA.debugLine="End Sub";
return "";
}
public String  _gettoken(Object _module,String _event) throws Exception{
 //BA.debugLineNum = 37;BA.debugLine="Public Sub GetToken(Module As Object,Event As Stri";
 //BA.debugLineNum = 39;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 41;BA.debugLine="token = su.EncodeBase64($\"${Library.Decrypt(Libra";
_token = _su.EncodeBase64((""+__c.SmartStringFormatter("",(Object)(_library._decrypt(getActivityBA(),_library._getstringresourse(getActivityBA(),"client_id"))))+":"+__c.SmartStringFormatter("",(Object)(_library._decrypt(getActivityBA(),_library._getstringresourse(getActivityBA(),"client_secret"))))+"").getBytes("UTF8"));
 //BA.debugLineNum = 47;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 48;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 50;BA.debugLine="hu.Initialize(\"token\",Me)";
_hu._initialize(ba,"token",this);
 //BA.debugLineNum = 51;BA.debugLine="hu.PostString(myurl & \"/api/rest/oauth2/token/cli";
_hu._poststring(_myurl+"/api/rest/oauth2/token/client_credentials","grant_type=client_credentials");
 //BA.debugLineNum = 52;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 53;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",\"Basic \"";
_hu._getrequest().SetHeader("Authorization","Basic "+_token);
 //BA.debugLineNum = 54;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 55;BA.debugLine="setStoreID(hu.GetRequest)";
_setstoreid(_hu._getrequest());
 //BA.debugLineNum = 57;BA.debugLine="End Sub";
return "";
}
public String  _geturl() throws Exception{
 //BA.debugLineNum = 1815;BA.debugLine="Public Sub GetURL As String";
 //BA.debugLineNum = 1816;BA.debugLine="Return myurl";
if (true) return _myurl;
 //BA.debugLineNum = 1817;BA.debugLine="End Sub";
return "";
}
public String  _initialize(anywheresoftware.b4a.BA _ba) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 11;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 13;BA.debugLine="myurl	= Library.GetStringResourse(\"url\")";
_myurl = _library._getstringresourse(getActivityBA(),"url");
 //BA.debugLineNum = 14;BA.debugLine="apiurl = myurl & \"/api/rest/\"";
_apiurl = _myurl+"/api/rest/";
 //BA.debugLineNum = 16;BA.debugLine="If Library.InternetState = False And Library.Cach";
if (_library._internetstate(getActivityBA())==__c.False && _library._cachesystem._existtype("product_main")==__c.False) { 
 //BA.debugLineNum = 17;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"erro";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(getActivityBA(),"error_net_title")),__c.False);
 };
 //BA.debugLineNum = 20;BA.debugLine="End Sub";
return "";
}
public String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
String _rs = "";
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js1 = null;
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
anywheresoftware.b4a.objects.collections.Map _res = null;
anywheresoftware.b4a.objects.collections.Map _res2 = null;
anywheresoftware.b4a.objects.collections.List _ls = null;
anywheresoftware.b4a.objects.collections.Map _res1 = null;
anywheresoftware.b4a.objects.collections.List _lslang = null;
int _i1 = 0;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _jslang = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _jsg = null;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
anywheresoftware.b4a.objects.collections.List _list_module = null;
anywheresoftware.b4a.objects.collections.List _list_products = null;
String _choose_module_id = "";
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _pro = null;
anywheresoftware.b4a.objects.collections.List _temp3 = null;
anywheresoftware.b4a.objects.collections.Map _temp2s = null;
anywheresoftware.b4a.objects.collections.List _l1 = null;
anywheresoftware.b4a.objects.collections.Map _product = null;
anywheresoftware.b4a.objects.collections.List _products = null;
anywheresoftware.b4a.objects.collections.List _temp = null;
anywheresoftware.b4a.objects.collections.Map _t1 = null;
anywheresoftware.b4a.objects.collections.Map _ms = null;
anywheresoftware.b4a.objects.collections.Map _temp1 = null;
anywheresoftware.b4a.objects.collections.List _temp2 = null;
anywheresoftware.b4a.objects.collections.Map _data1 = null;
anywheresoftware.b4a.objects.collections.Map _data2 = null;
anywheresoftware.b4a.objects.collections.Map _data3 = null;
anywheresoftware.b4a.objects.collections.Map _res_order1 = null;
anywheresoftware.b4a.objects.collections.Map _temps = null;
String _o = "";
 //BA.debugLineNum = 141;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 143;BA.debugLine="ProgressDialogHide";
__c.ProgressDialogHide();
 //BA.debugLineNum = 145;BA.debugLine="Try";
try { //BA.debugLineNum = 151;BA.debugLine="If Job.Success Or Job.ErrorMessage = \"java.io.IO";
if (_job._success || (_job._errormessage).equals("java.io.IOException: unexpected end of stream on okhttp3.Address@c17eb37")) { 
 //BA.debugLineNum = 153;BA.debugLine="If Job.JobName = \"confirmorderpayment\" Then";
if ((_job._jobname).equals("confirmorderpayment")) { 
 //BA.debugLineNum = 154;BA.debugLine="CallSubDelayed2(sModule,EVT,Job.GetString2(\"UT";
__c.CallSubDelayed2(getActivityBA(),_smodule,_evt,(Object)(_job._getstring2("UTF8")));
 //BA.debugLineNum = 155;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 156;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 159;BA.debugLine="Dim rs As String";
_rs = "";
 //BA.debugLineNum = 160;BA.debugLine="rs = Job.GetString2(\"UTF8\")";
_rs = _job._getstring2("UTF8");
 //BA.debugLineNum = 162;BA.debugLine="If rs.StartsWith(\"<b>Warning\") Then";
if (_rs.startsWith("<b>Warning")) { 
 //BA.debugLineNum = 163;BA.debugLine="Dim js1 As JSONGenerator";
_js1 = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 164;BA.debugLine="js1.Initialize(CreateMap(\"success\":True))";
_js1.Initialize(__c.createMap(new Object[] {(Object)("success"),(Object)(__c.True)}));
 //BA.debugLineNum = 165;BA.debugLine="rs = js1.ToString";
_rs = _js1.ToString();
 };
 //BA.debugLineNum = 168;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 169;BA.debugLine="js.Initialize(rs)";
_js.Initialize(_rs);
 //BA.debugLineNum = 171;BA.debugLine="If Job.GetString2(\"UTF8\").IndexOf(\"Unauthorized";
if (_job._getstring2("UTF8").indexOf("Unauthorized")>-1 && _job._getstring2("UTF8").indexOf("401")>-1) { 
 //BA.debugLineNum = 172;BA.debugLine="If Library.InternetState = True Then";
if (_library._internetstate(getActivityBA())==__c.True) { 
 //BA.debugLineNum = 173;BA.debugLine="StartActivity(Main)";
__c.StartActivity(getActivityBA(),(Object)(_main.getObject()));
 //BA.debugLineNum = 174;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 179;BA.debugLine="If Job.JobName = \"token\" Then";
if ((_job._jobname).equals("token")) { 
 //BA.debugLineNum = 181;BA.debugLine="Try";
try { //BA.debugLineNum = 183;BA.debugLine="Library.token = js.NextObject";
_library._token = _js.NextObject();
 //BA.debugLineNum = 185;BA.debugLine="If SubExists(sModule,EVT) Then";
if (__c.SubExists(getActivityBA(),_smodule,_evt)) { 
 //BA.debugLineNum = 186;BA.debugLine="CallSub3(sModule,EVT,Library.token,True)";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_library._token),(Object)(__c.True));
 };
 } 
       catch (Exception e31) {
			ba.setLastException(e31); };
 }else if((_job._jobname).equals("subscribe")) { 
 //BA.debugLineNum = 196;BA.debugLine="Dim res As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 197;BA.debugLine="res = js.NextObject";
_res = _js.NextObject();
 //BA.debugLineNum = 199;BA.debugLine="CallSub3(sModule,EVT,res,\"subscribe\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res),(Object)("subscribe"));
 }else if((_job._jobname).equals("banners")) { 
 //BA.debugLineNum = 205;BA.debugLine="Dim res2 As Map";
_res2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 206;BA.debugLine="res2 = js.NextObject";
_res2 = _js.NextObject();
 //BA.debugLineNum = 208;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 209;BA.debugLine="ls = res2.Get(\"data\")";
_ls.setObject((java.util.List)(_res2.Get((Object)("data"))));
 //BA.debugLineNum = 211;BA.debugLine="CallSub3(sModule,EVT,ls,currentCategory)";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_ls),(Object)(_currentcategory));
 }else if((_job._jobname).equals("languages")) { 
 //BA.debugLineNum = 217;BA.debugLine="Dim res,res1 As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
_res1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 218;BA.debugLine="res = js.NextObject";
_res = _js.NextObject();
 //BA.debugLineNum = 219;BA.debugLine="res1 = res.Get(\"data\")";
_res1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 221;BA.debugLine="Dim lsLang As List";
_lslang = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 222;BA.debugLine="lsLang.Initialize";
_lslang.Initialize();
 //BA.debugLineNum = 224;BA.debugLine="For i1 = 0 To res1.Size - 1";
{
final int step48 = 1;
final int limit48 = (int) (_res1.getSize()-1);
for (_i1 = (int) (0) ; (step48 > 0 && _i1 <= limit48) || (step48 < 0 && _i1 >= limit48); _i1 = ((int)(0 + _i1 + step48)) ) {
 //BA.debugLineNum = 225;BA.debugLine="lsLang.Add(res1.GetValueAt(i1))";
_lslang.Add(_res1.GetValueAt(_i1));
 }
};
 //BA.debugLineNum = 228;BA.debugLine="Dim jsLang As JSONGenerator";
_jslang = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 229;BA.debugLine="jsLang.Initialize2(lsLang)";
_jslang.Initialize2(_lslang);
 //BA.debugLineNum = 231;BA.debugLine="CallSub3(sModule,EVT,res,\"languages\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res),(Object)("languages"));
 }else if((_job._jobname).equals("product_class")) { 
 //BA.debugLineNum = 238;BA.debugLine="If Job.GetString2(\"UTF8\").ToLowerCase = $\"{\"st";
if ((_job._getstring2("UTF8").toLowerCase()).equals(("{\"statusCode\":400,\"statusText\":\"Bad Request\"}"))) { 
 //BA.debugLineNum = 239;BA.debugLine="CallSub3(sModule,EVT,Null,\"product_class\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,__c.Null,(Object)("product_class"));
 }else {
 //BA.debugLineNum = 242;BA.debugLine="Dim res,res1 As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
_res1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 243;BA.debugLine="res = js.NextObject";
_res = _js.NextObject();
 //BA.debugLineNum = 244;BA.debugLine="res1 = res.Get(\"data\")";
_res1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 246;BA.debugLine="Dim jsG As JSONGenerator";
_jsg = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 247;BA.debugLine="jsG.Initialize2(res.Get(\"return_reasons\"))";
_jsg.Initialize2((anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_res.Get((Object)("return_reasons")))));
 //BA.debugLineNum = 248;BA.debugLine="Library.CacheSystem.AddList2Cache(\"return_rea";
_library._cachesystem._addlist2cache("return_reasons",(anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_res.Get((Object)("return_reasons")))),"return_reasons");
 //BA.debugLineNum = 250;BA.debugLine="CallSub3(sModule,EVT,res,\"product_class\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res),(Object)("product_class"));
 };
 }else if((_job._jobname).equals("returns")) { 
 //BA.debugLineNum = 257;BA.debugLine="Dim res As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 258;BA.debugLine="res = js.NextObject";
_res = _js.NextObject();
 //BA.debugLineNum = 260;BA.debugLine="CallSub3(sModule,EVT,res,\"returns\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res),(Object)("returns"));
 }else if((_job._jobname).equals("checksums")) { 
 //BA.debugLineNum = 266;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 267;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 269;BA.debugLine="If m1.ContainsKey(\"success\") Then";
if (_m1.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 270;BA.debugLine="If m1.Get(\"success\") = True Then";
if ((_m1.Get((Object)("success"))).equals((Object)(__c.True))) { 
 //BA.debugLineNum = 271;BA.debugLine="CheckSumLocal(m1.Get(\"data\"))";
_checksumlocal((anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_m1.Get((Object)("data")))));
 };
 };
 //BA.debugLineNum = 275;BA.debugLine="CallSubDelayed(sModule,EVT)";
__c.CallSubDelayed(getActivityBA(),_smodule,_evt);
 }else if((_job._jobname).equals("compare")) { 
 //BA.debugLineNum = 282;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 283;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 285;BA.debugLine="CallSubDelayed2(sModule,EVT,m1)";
__c.CallSubDelayed2(getActivityBA(),_smodule,_evt,(Object)(_m1));
 }else if((_job._jobname).equals("product") || (_job._jobname).equals("bestsellers") || (_job._jobname).equals("featured")) { 
 //BA.debugLineNum = 292;BA.debugLine="If currentCategory = \"featured\" Then";
if ((_currentcategory).equals("featured")) { 
 //BA.debugLineNum = 294;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 295;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 297;BA.debugLine="Dim list_module,list_products As List";
_list_module = new anywheresoftware.b4a.objects.collections.List();
_list_products = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 298;BA.debugLine="list_module = m1.Get(\"data\")";
_list_module.setObject((java.util.List)(_m1.Get((Object)("data"))));
 //BA.debugLineNum = 299;BA.debugLine="list_products.Initialize";
_list_products.Initialize();
 //BA.debugLineNum = 301;BA.debugLine="Dim choose_module_id As String";
_choose_module_id = "";
 //BA.debugLineNum = 302;BA.debugLine="If Library.Config.ContainsKey(\"feature_module";
if (_library._config.ContainsKey((Object)("feature_module"))) { 
 //BA.debugLineNum = 303;BA.debugLine="choose_module_id = Library.Config.Get(\"featu";
_choose_module_id = BA.ObjectToString(_library._config.Get((Object)("feature_module")));
 }else {
 //BA.debugLineNum = 305;BA.debugLine="choose_module_id = \"0\"";
_choose_module_id = "0";
 };
 //BA.debugLineNum = 308;BA.debugLine="If choose_module_id <> \"0\" Then";
if ((_choose_module_id).equals("0") == false) { 
 //BA.debugLineNum = 309;BA.debugLine="For i = 0 To list_module.Size - 1";
{
final int step97 = 1;
final int limit97 = (int) (_list_module.getSize()-1);
for (_i = (int) (0) ; (step97 > 0 && _i <= limit97) || (step97 < 0 && _i >= limit97); _i = ((int)(0 + _i + step97)) ) {
 //BA.debugLineNum = 310;BA.debugLine="Dim pro As Map";
_pro = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 311;BA.debugLine="pro = list_module.Get(i)";
_pro.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_list_module.Get(_i)));
 //BA.debugLineNum = 312;BA.debugLine="If pro.Get(\"module_id\") = choose_module_id";
if ((_pro.Get((Object)("module_id"))).equals((Object)(_choose_module_id))) { 
 //BA.debugLineNum = 313;BA.debugLine="list_products = pro.Get(\"products\")";
_list_products.setObject((java.util.List)(_pro.Get((Object)("products"))));
 };
 }
};
 //BA.debugLineNum = 317;BA.debugLine="CallSubDelayed3(sModule,EVT,list_products,cu";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_list_products),(Object)(_currentcategory));
 }else {
 //BA.debugLineNum = 320;BA.debugLine="If list_module.Size = 0 Then";
if (_list_module.getSize()==0) { 
 //BA.debugLineNum = 321;BA.debugLine="Dim temp3 As List";
_temp3 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 322;BA.debugLine="temp3.Initialize";
_temp3.Initialize();
 //BA.debugLineNum = 323;BA.debugLine="CallSubDelayed3(sModule,EVT,temp3,currentCa";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_temp3),(Object)(_currentcategory));
 //BA.debugLineNum = 324;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 327;BA.debugLine="Dim temp2s As Map";
_temp2s = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 328;BA.debugLine="temp2s = list_module.Get(0)";
_temp2s.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_list_module.Get((int) (0))));
 //BA.debugLineNum = 330;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 331;BA.debugLine="l1 = temp2s.Get(\"products\")";
_l1.setObject((java.util.List)(_temp2s.Get((Object)("products"))));
 //BA.debugLineNum = 333;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,currentCatego";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_l1),(Object)(_currentcategory));
 };
 //BA.debugLineNum = 336;BA.debugLine="Return";
if (true) return "";
 }else if((_currentcategory).equals("bestsellers")) { 
 //BA.debugLineNum = 340;BA.debugLine="Dim m1,product As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
_product = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 341;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 343;BA.debugLine="Dim products As List";
_products = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 344;BA.debugLine="Dim temp2s As Map";
_temp2s = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 345;BA.debugLine="products.Initialize";
_products.Initialize();
 //BA.debugLineNum = 346;BA.debugLine="temp2s = m1.Get(\"data\")";
_temp2s.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_m1.Get((Object)("data"))));
 //BA.debugLineNum = 348;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 349;BA.debugLine="l1 = temp2s.Get(\"products\")";
_l1.setObject((java.util.List)(_temp2s.Get((Object)("products"))));
 //BA.debugLineNum = 351;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,currentCategor";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_l1),(Object)(_currentcategory));
 //BA.debugLineNum = 353;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 357;BA.debugLine="If SubExists(sModule,EVT) Then";
if (__c.SubExists(getActivityBA(),_smodule,_evt)) { 
 //BA.debugLineNum = 358;BA.debugLine="Try";
try { //BA.debugLineNum = 359;BA.debugLine="Dim m1,product As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
_product = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 360;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 362;BA.debugLine="If m1.ContainsKey(\"error\") Then";
if (_m1.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 363;BA.debugLine="Dim temp3 As List";
_temp3 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 364;BA.debugLine="temp3.Initialize";
_temp3.Initialize();
 //BA.debugLineNum = 365;BA.debugLine="CallSubDelayed3(sModule,EVT,temp3,currentCa";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_temp3),(Object)(_currentcategory));
 //BA.debugLineNum = 366;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 369;BA.debugLine="Dim temp,products As List";
_temp = new anywheresoftware.b4a.objects.collections.List();
_products = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 370;BA.debugLine="products.Initialize";
_products.Initialize();
 //BA.debugLineNum = 371;BA.debugLine="temp = m1.Get(\"data\")";
_temp.setObject((java.util.List)(_m1.Get((Object)("data"))));
 //BA.debugLineNum = 373;BA.debugLine="If temp Is List Then";
if (_temp.getObjectOrNull() instanceof java.util.List) { 
 //BA.debugLineNum = 375;BA.debugLine="If temp.Size = 0 Then";
if (_temp.getSize()==0) { 
 //BA.debugLineNum = 376;BA.debugLine="CallSubDelayed3(sModule,EVT,temp,currentCa";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_temp),(Object)(_currentcategory));
 //BA.debugLineNum = 377;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 380;BA.debugLine="If temp.Size = 0 Then";
if (_temp.getSize()==0) { 
 //BA.debugLineNum = 381;BA.debugLine="Dim temp3 As List";
_temp3 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 382;BA.debugLine="temp3.Initialize";
_temp3.Initialize();
 //BA.debugLineNum = 383;BA.debugLine="CallSubDelayed3(sModule,EVT,temp3,currentC";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_temp3),(Object)(_currentcategory));
 };
 //BA.debugLineNum = 386;BA.debugLine="Dim t1 As Map";
_t1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 387;BA.debugLine="t1 = temp.Get(0)";
_t1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_temp.Get((int) (0))));
 //BA.debugLineNum = 389;BA.debugLine="If t1.ContainsKey(\"products\") = False Then";
if (_t1.ContainsKey((Object)("products"))==__c.False) { 
 //BA.debugLineNum = 390;BA.debugLine="CallSubDelayed3(sModule,EVT,temp,currentCa";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_temp),(Object)(_currentcategory));
 //BA.debugLineNum = 391;BA.debugLine="Return";
if (true) return "";
 };
 }else if(_temp.getObjectOrNull() instanceof anywheresoftware.b4a.objects.collections.Map.MyMap) { 
 //BA.debugLineNum = 395;BA.debugLine="Dim ms As Map";
_ms = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 396;BA.debugLine="ms = temp";
_ms.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_temp.getObject()));
 //BA.debugLineNum = 397;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 398;BA.debugLine="l1 = ms.Get(\"products\")";
_l1.setObject((java.util.List)(_ms.Get((Object)("products"))));
 //BA.debugLineNum = 400;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,currentCateg";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_l1),(Object)(_currentcategory));
 //BA.debugLineNum = 401;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 405;BA.debugLine="Try";
try { //BA.debugLineNum = 406;BA.debugLine="product		= temp.Get(0)";
_product.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_temp.Get((int) (0))));
 //BA.debugLineNum = 407;BA.debugLine="products	= product.Get(\"products\")";
_products.setObject((java.util.List)(_product.Get((Object)("products"))));
 //BA.debugLineNum = 408;BA.debugLine="CallSubDelayed3(sModule,EVT,products,curren";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_products),(Object)(_currentcategory));
 } 
       catch (Exception e173) {
			ba.setLastException(e173); //BA.debugLineNum = 410;BA.debugLine="CallSubDelayed3(sModule,EVT,products,curren";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_products),(Object)(_currentcategory));
 };
 } 
       catch (Exception e176) {
			ba.setLastException(e176); };
 };
 }else if((_job._jobname).equals("product_details")) { 
 //BA.debugLineNum = 422;BA.debugLine="If SubExists(sModule,EVT) Then";
if (__c.SubExists(getActivityBA(),_smodule,_evt)) { 
 //BA.debugLineNum = 423;BA.debugLine="Try";
try { //BA.debugLineNum = 424;BA.debugLine="Dim m1,product As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
_product = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 425;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 427;BA.debugLine="Dim temp1 As Map";
_temp1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 428;BA.debugLine="temp1 = m1.Get(\"data\")";
_temp1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_m1.Get((Object)("data"))));
 //BA.debugLineNum = 430;BA.debugLine="CallSub3(sModule,EVT,temp1,currentCategory)";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_temp1),(Object)(_currentcategory));
 } 
       catch (Exception e187) {
			ba.setLastException(e187); };
 };
 }else if((_job._jobname).equals("slideshow")) { 
 //BA.debugLineNum = 441;BA.debugLine="Dim temp1 As Map";
_temp1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 442;BA.debugLine="temp1 = js.NextObject";
_temp1 = _js.NextObject();
 //BA.debugLineNum = 444;BA.debugLine="Dim temp2 As List";
_temp2 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 445;BA.debugLine="temp2 = temp1.Get(\"data\")";
_temp2.setObject((java.util.List)(_temp1.Get((Object)("data"))));
 //BA.debugLineNum = 447;BA.debugLine="If temp2 = Null Then";
if (_temp2== null) { 
 //BA.debugLineNum = 448;BA.debugLine="CallSub3(sModule,EVT,Null,\"slideshow\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,__c.Null,(Object)("slideshow"));
 //BA.debugLineNum = 449;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 452;BA.debugLine="If temp2.Size = 0 Then";
if (_temp2.getSize()==0) { 
 //BA.debugLineNum = 453;BA.debugLine="CallSub3(sModule,EVT,Null,\"slideshow\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,__c.Null,(Object)("slideshow"));
 //BA.debugLineNum = 454;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 457;BA.debugLine="temp1 = temp2.Get(0)";
_temp1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_temp2.Get((int) (0))));
 //BA.debugLineNum = 459;BA.debugLine="temp2 = temp1.Get(\"banners\")";
_temp2.setObject((java.util.List)(_temp1.Get((Object)("banners"))));
 //BA.debugLineNum = 461;BA.debugLine="CallSub3(sModule,EVT,temp2,\"slideshow\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_temp2),(Object)("slideshow"));
 //BA.debugLineNum = 462;BA.debugLine="Return";
if (true) return "";
 }else if((_job._jobname).equals("categories")) { 
 //BA.debugLineNum = 469;BA.debugLine="Dim temp1 As Map";
_temp1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 470;BA.debugLine="temp1 = js.NextObject";
_temp1 = _js.NextObject();
 //BA.debugLineNum = 472;BA.debugLine="Dim temp2 As List";
_temp2 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 473;BA.debugLine="temp2 = temp1.Get(\"data\")";
_temp2.setObject((java.util.List)(_temp1.Get((Object)("data"))));
 //BA.debugLineNum = 475;BA.debugLine="CallSub3(sModule,EVT,temp2,\"categories\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_temp2),(Object)("categories"));
 }else if((_job._jobname).equals("add2cart")) { 
 //BA.debugLineNum = 482;BA.debugLine="Dim res As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 483;BA.debugLine="res = js.NextObject";
_res = _js.NextObject();
 //BA.debugLineNum = 485;BA.debugLine="CallSub3(sModule,EVT,res,\"add2cart\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res),(Object)("add2cart"));
 }else if((_job._jobname).equals("carts")) { 
 //BA.debugLineNum = 492;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 493;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 495;BA.debugLine="data2 = data1.Get(\"data\")";
_data2.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data1.Get((Object)("data"))));
 //BA.debugLineNum = 497;BA.debugLine="CallSub3(sModule,EVT,data2,\"carts\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data2),(Object)("carts"));
 }else if((_job._jobname).equals("clearcart")) { 
 //BA.debugLineNum = 504;BA.debugLine="Dim data3 As Map";
_data3 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 505;BA.debugLine="data3 = js.NextObject";
_data3 = _js.NextObject();
 //BA.debugLineNum = 506;BA.debugLine="CallSub3(sModule,EVT,data3,\"carts\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data3),(Object)("carts"));
 }else if((_job._jobname).equals("updatecart")) { 
 //BA.debugLineNum = 513;BA.debugLine="Dim data3 As Map";
_data3 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 514;BA.debugLine="data3 = js.NextObject";
_data3 = _js.NextObject();
 //BA.debugLineNum = 515;BA.debugLine="CallSub3(sModule,EVT,data3,\"update\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data3),(Object)("update"));
 }else if((_job._jobname).equals("review")) { 
 //BA.debugLineNum = 522;BA.debugLine="Dim res1 As Map";
_res1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 523;BA.debugLine="res1 = js.NextObject";
_res1 = _js.NextObject();
 //BA.debugLineNum = 524;BA.debugLine="CallSub3(sModule,EVT,res1,\"review\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res1),(Object)("review"));
 }else if((_job._jobname).equals("contact")) { 
 //BA.debugLineNum = 531;BA.debugLine="Dim res1 As Map";
_res1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 532;BA.debugLine="res1 = js.NextObject";
_res1 = _js.NextObject();
 //BA.debugLineNum = 533;BA.debugLine="CallSub3(sModule,EVT,res1,\"contact\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res1),(Object)("contact"));
 }else if((_job._jobname).equals("deletecartitem")) { 
 //BA.debugLineNum = 540;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 541;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 543;BA.debugLine="CallSub3(sModule,EVT,data1,\"deletecartitem\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("deletecartitem"));
 }else if((_job._jobname).equals("register")) { 
 //BA.debugLineNum = 550;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 551;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 553;BA.debugLine="CallSub3(sModule,EVT,data1,\"register\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("register"));
 }else if((_job._jobname).equals("login")) { 
 //BA.debugLineNum = 560;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 561;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 563;BA.debugLine="CallSub3(sModule,EVT,data1,\"login\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("login"));
 }else if((_job._jobname).equals("logout")) { 
 //BA.debugLineNum = 570;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 571;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 573;BA.debugLine="CallSub3(sModule,EVT,data1,\"logout\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("logout"));
 }else if((_job._jobname).equals("forgot")) { 
 //BA.debugLineNum = 580;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 581;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 583;BA.debugLine="CallSub3(sModule,EVT,data1,\"forgot\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("forgot"));
 }else if((_job._jobname).equals("coupon") || (_job._jobname).equals("voucher") || (_job._jobname).equals("reward")) { 
 //BA.debugLineNum = 590;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 591;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 593;BA.debugLine="If data1.ContainsKey(\"success\") Then";
if (_data1.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 594;BA.debugLine="If data1.Get(\"success\") = True Then";
if ((_data1.Get((Object)("success"))).equals((Object)(__c.True))) { 
 //BA.debugLineNum = 595;BA.debugLine="CallSubDelayed2(sModule,EVT,True)";
__c.CallSubDelayed2(getActivityBA(),_smodule,_evt,(Object)(__c.True));
 }else {
 //BA.debugLineNum = 597;BA.debugLine="CallSubDelayed2(sModule,EVT,False)";
__c.CallSubDelayed2(getActivityBA(),_smodule,_evt,(Object)(__c.False));
 };
 }else {
 //BA.debugLineNum = 600;BA.debugLine="CallSubDelayed2(sModule,EVT,False)";
__c.CallSubDelayed2(getActivityBA(),_smodule,_evt,(Object)(__c.False));
 };
 }else if((_job._jobname).equals("country")) { 
 //BA.debugLineNum = 608;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 609;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 610;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 611;BA.debugLine="l1 = m1.Get(\"data\")";
_l1.setObject((java.util.List)(_m1.Get((Object)("data"))));
 //BA.debugLineNum = 613;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,\"city\")";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_l1),(Object)("city"));
 }else if((_job._jobname).equals("city")) { 
 //BA.debugLineNum = 620;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 621;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 622;BA.debugLine="m1 = js.NextObject";
_m1 = _js.NextObject();
 //BA.debugLineNum = 623;BA.debugLine="m1 = m1.Get(\"data\")";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_m1.Get((Object)("data"))));
 //BA.debugLineNum = 624;BA.debugLine="l1 = m1.Get(\"zone\")";
_l1.setObject((java.util.List)(_m1.Get((Object)("zone"))));
 //BA.debugLineNum = 626;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,\"city\")";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_l1),(Object)("city"));
 }else if((_job._jobname).equals("order") || (_job._jobname).equals("confirmorder") || (_job._jobname).equals("pay")) { 
 //BA.debugLineNum = 633;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 634;BA.debugLine="Dim res_order1 As Map";
_res_order1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 635;BA.debugLine="res_order1.Initialize";
_res_order1.Initialize();
 //BA.debugLineNum = 637;BA.debugLine="Try";
try { //BA.debugLineNum = 638;BA.debugLine="res_order1 = js.NextObject";
_res_order1 = _js.NextObject();
 } 
       catch (Exception e289) {
			ba.setLastException(e289); //BA.debugLineNum = 640;BA.debugLine="If res_order1 = Null Then";
if (_res_order1== null) { 
 //BA.debugLineNum = 641;BA.debugLine="Dim temps As Map";
_temps = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 642;BA.debugLine="temps.Initialize";
_temps.Initialize();
 //BA.debugLineNum = 643;BA.debugLine="res_order1 = temps";
_res_order1 = _temps;
 };
 //BA.debugLineNum = 645;BA.debugLine="If rs.IndexOf(\"success\") > -1 Then";
if (_rs.indexOf("success")>-1) { 
 //BA.debugLineNum = 646;BA.debugLine="If rs.ToLowerCase.IndexOf(\"true\") > -1 Then";
if (_rs.toLowerCase().indexOf("true")>-1) { 
 //BA.debugLineNum = 647;BA.debugLine="res_order1.Put(\"success\",True)";
_res_order1.Put((Object)("success"),(Object)(__c.True));
 //BA.debugLineNum = 648;BA.debugLine="Dim o As String";
_o = "";
 //BA.debugLineNum = 649;BA.debugLine="o = rs.Replace(\"{\",\"\").Replace(\"}\",\"\").Repl";
_o = _rs.replace("{","").replace("}","").replace(("\"success\":true,"),"").replace(("\"order_id\":"),"");
 //BA.debugLineNum = 650;BA.debugLine="res_order1.Put(\"order_id\",o)";
_res_order1.Put((Object)("order_id"),(Object)(_o));
 }else {
 //BA.debugLineNum = 652;BA.debugLine="res_order1.Put(\"success\",False)";
_res_order1.Put((Object)("success"),(Object)(__c.False));
 };
 };
 };
 //BA.debugLineNum = 657;BA.debugLine="CallSub3(sModule,EVT,res_order1,\"order\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,(Object)(_res_order1),(Object)("order"));
 }else if((_job._jobname).equals("ordersimple")) { 
 //BA.debugLineNum = 664;BA.debugLine="CallSub2(sModule,EVT,Job.GetString2(\"UTF8\"))";
__c.CallSubNew2(getActivityBA(),_smodule,_evt,(Object)(_job._getstring2("UTF8")));
 }else if((_job._jobname).equals("getpayments") || (_job._jobname).equals("setpayments")) { 
 //BA.debugLineNum = 670;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 671;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 673;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"payments\")";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("payments"));
 }else if((_job._jobname).equals("shippingmethods")) { 
 //BA.debugLineNum = 679;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 680;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 682;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"shippingmet";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("shippingmethods"));
 }else if((_job._jobname).equals("addaddress")) { 
 //BA.debugLineNum = 688;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 689;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 691;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"addaddress\"";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("addaddress"));
 }else if((_job._jobname).equals("clearcart_payment")) { 
 //BA.debugLineNum = 696;BA.debugLine="CallSub(sModule,EVT)";
__c.CallSubNew(getActivityBA(),_smodule,_evt);
 }else if((_job._jobname).equals("account_user")) { 
 //BA.debugLineNum = 702;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 703;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 705;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"account_det";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("account_details"));
 }else if((_job._jobname).equals("getothers")) { 
 //BA.debugLineNum = 712;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 713;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 715;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"orders\")";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("orders"));
 }else if((_job._jobname).equals("manufacturers") || (_job._jobname).equals("information")) { 
 //BA.debugLineNum = 721;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 722;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 724;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,Job.JobName)";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)(_job._jobname));
 }else if((_job._jobname).equals("store")) { 
 //BA.debugLineNum = 731;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 732;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 734;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"store\")";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("store"));
 }else if((_job._jobname).equals("wishlist")) { 
 //BA.debugLineNum = 740;BA.debugLine="Dim data1,data2 As Map";
_data1 = new anywheresoftware.b4a.objects.collections.Map();
_data2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 741;BA.debugLine="data1 = js.NextObject";
_data1 = _js.NextObject();
 //BA.debugLineNum = 743;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"wishlist\")";
__c.CallSubDelayed3(getActivityBA(),_smodule,_evt,(Object)(_data1),(Object)("wishlist"));
 };
 }else {
 //BA.debugLineNum = 750;BA.debugLine="If Job.ErrorMessage.ToLowerCase.IndexOf(\"servic";
if (_job._errormessage.toLowerCase().indexOf("service unavailable")>-1) { 
 //BA.debugLineNum = 751;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"sh";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(getActivityBA(),"shop_disable")),__c.True);
 //BA.debugLineNum = 752;BA.debugLine="actErrorIntrenet.module = sModule";
_acterrorintrenet._module = _smodule;
 //BA.debugLineNum = 753;BA.debugLine="actErrorIntrenet.NoShop = Library.GetStringRes";
_acterrorintrenet._noshop = _library._getstringresourse(getActivityBA(),"shop_disable");
 //BA.debugLineNum = 754;BA.debugLine="StartActivity(actErrorIntrenet)";
__c.StartActivity(getActivityBA(),(Object)(_acterrorintrenet.getObject()));
 //BA.debugLineNum = 755;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 758;BA.debugLine="If Library.CacheSystem.ExistType(\"product_main\"";
if (_library._cachesystem._existtype("product_main")==__c.True && _library._internetstate(getActivityBA())==__c.False) { 
 }else {
 //BA.debugLineNum = 761;BA.debugLine="actErrorIntrenet.module = sModule";
_acterrorintrenet._module = _smodule;
 //BA.debugLineNum = 762;BA.debugLine="StartActivity(actErrorIntrenet)";
__c.StartActivity(getActivityBA(),(Object)(_acterrorintrenet.getObject()));
 };
 };
 } 
       catch (Exception e358) {
			ba.setLastException(e358); //BA.debugLineNum = 769;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"erro";
__c.ToastMessageShow(BA.ObjectToCharSequence(_library._getstringresourse(getActivityBA(),"error_net_title")),__c.False);
 //BA.debugLineNum = 770;BA.debugLine="Log(LastException.Message)";
__c.Log(__c.LastException(getActivityBA()).getMessage());
 //BA.debugLineNum = 772;BA.debugLine="If SubExists(sModule,EVT) Then";
if (__c.SubExists(getActivityBA(),_smodule,_evt)) { 
 //BA.debugLineNum = 773;BA.debugLine="CallSub3(sModule,EVT,Null,\"\")";
__c.CallSubNew3(getActivityBA(),_smodule,_evt,__c.Null,(Object)(""));
 };
 };
 //BA.debugLineNum = 778;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 780;BA.debugLine="End Sub";
return "";
}
public String  _listaddressuser(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2148;BA.debugLine="Public Sub ListAddressUser(Module As Object,Event";
 //BA.debugLineNum = 2150;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2152;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2153;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2154;BA.debugLine="currentCategory = \"account/address\"";
_currentcategory = "account/address";
 //BA.debugLineNum = 2156;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2157;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2159;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2160;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2161;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2162;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2164;BA.debugLine="End Sub";
return "";
}
public String  _login(Object _module,String _event,String _semail,String _spassword) throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 851;BA.debugLine="Public Sub Login(Module As Object,Event As String,";
 //BA.debugLineNum = 853;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 855;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 856;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 857;BA.debugLine="currentCategory = \"login\"";
_currentcategory = "login";
 //BA.debugLineNum = 859;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 860;BA.debugLine="data.Initialize";
_data.Initialize();
 //BA.debugLineNum = 861;BA.debugLine="data.Put(\"email\",sEmail)";
_data.Put((Object)("email"),(Object)(_semail));
 //BA.debugLineNum = 862;BA.debugLine="data.Put(\"password\",sPassword)";
_data.Put((Object)("password"),(Object)(_spassword));
 //BA.debugLineNum = 864;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 865;BA.debugLine="js.Initialize(data)";
_js.Initialize(_data);
 //BA.debugLineNum = 867;BA.debugLine="hu.Initialize(\"login\",Me)";
_hu._initialize(ba,"login",this);
 //BA.debugLineNum = 868;BA.debugLine="hu.PostString(apiurl & \"login\",js.ToString)";
_hu._poststring(_apiurl+"login",_js.ToString());
 //BA.debugLineNum = 870;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 871;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 873;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 874;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 876;BA.debugLine="End Sub";
return "";
}
public String  _loginuser(Object _module,String _event,String _semail,String _spassword) throws Exception{
String _auth = "";
anywheresoftware.b4a.objects.collections.Map _sdata = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 898;BA.debugLine="Public Sub LoginUser(Module As Object,Event As Str";
 //BA.debugLineNum = 900;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 902;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 903;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 904;BA.debugLine="currentCategory = \"login\"";
_currentcategory = "login";
 //BA.debugLineNum = 906;BA.debugLine="hu.Initialize(\"login\",Me)";
_hu._initialize(ba,"login",this);
 //BA.debugLineNum = 908;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 910;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 911;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 913;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 915;BA.debugLine="Dim sData As Map";
_sdata = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 916;BA.debugLine="sData.Initialize";
_sdata.Initialize();
 //BA.debugLineNum = 917;BA.debugLine="sData.Put(\"email\",sEMail)";
_sdata.Put((Object)("email"),(Object)(_semail));
 //BA.debugLineNum = 918;BA.debugLine="sData.Put(\"password\",sPassword)";
_sdata.Put((Object)("password"),(Object)(_spassword));
 //BA.debugLineNum = 920;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 921;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 922;BA.debugLine="hu.GetRequest.SetHeader(\"Login object\",js.ToStrin";
_hu._getrequest().SetHeader("Login object",_js.ToString());
 //BA.debugLineNum = 924;BA.debugLine="End Sub";
return "";
}
public String  _loginusersocial(Object _module,String _event,String _semail,String _saccesstoken,String _sprovider) throws Exception{
String _auth = "";
anywheresoftware.b4a.objects.collections.Map _sdata = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 926;BA.debugLine="Public Sub LoginUserSocial(Module As Object,Event";
 //BA.debugLineNum = 928;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 930;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 931;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 932;BA.debugLine="currentCategory = \"sociallogin\"";
_currentcategory = "sociallogin";
 //BA.debugLineNum = 934;BA.debugLine="hu.Initialize(\"login\",Me)";
_hu._initialize(ba,"login",this);
 //BA.debugLineNum = 936;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 938;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 939;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 941;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 943;BA.debugLine="Dim sData As Map";
_sdata = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 944;BA.debugLine="sData.Initialize";
_sdata.Initialize();
 //BA.debugLineNum = 945;BA.debugLine="sData.Put(\"email\",sEMail)";
_sdata.Put((Object)("email"),(Object)(_semail));
 //BA.debugLineNum = 946;BA.debugLine="sData.Put(\"access_token\",sAccessToken)";
_sdata.Put((Object)("access_token"),(Object)(_saccesstoken));
 //BA.debugLineNum = 947;BA.debugLine="sData.Put(\"provider\",sProvider)";
_sdata.Put((Object)("provider"),(Object)(_sprovider));
 //BA.debugLineNum = 949;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 950;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 951;BA.debugLine="hu.GetRequest.SetHeader(\"Login object\",js.ToStrin";
_hu._getrequest().SetHeader("Login object",_js.ToString());
 //BA.debugLineNum = 953;BA.debugLine="End Sub";
return "";
}
public String  _logout(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 878;BA.debugLine="Public Sub Logout(Module As Object,Event As String";
 //BA.debugLineNum = 880;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 882;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 883;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 884;BA.debugLine="currentCategory = \"logout\"";
_currentcategory = "logout";
 //BA.debugLineNum = 886;BA.debugLine="hu.Initialize(\"logout\",Me)";
_hu._initialize(ba,"logout",this);
 //BA.debugLineNum = 888;BA.debugLine="hu.PostString(apiurl & \"logout\",\"\")";
_hu._poststring(_apiurl+"logout","");
 //BA.debugLineNum = 890;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 891;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 893;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 894;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 896;BA.debugLine="End Sub";
return "";
}
public String  _paymentorder(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1376;BA.debugLine="Public Sub PaymentOrder(Module As Object,Event As";
 //BA.debugLineNum = 1378;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1380;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1381;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1382;BA.debugLine="currentCategory = \"pay\"";
_currentcategory = "pay";
 //BA.debugLineNum = 1384;BA.debugLine="hu.Initialize(\"confirmorderpayment\",Me)";
_hu._initialize(ba,"confirmorderpayment",this);
 //BA.debugLineNum = 1385;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1387;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1388;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1389;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1391;BA.debugLine="End Sub";
return "";
}
public String  _productdetails(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1241;BA.debugLine="Public Sub ProductDetails(Module As Object,Event A";
 //BA.debugLineNum = 1243;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1245;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1246;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1247;BA.debugLine="currentCategory = \"products/\" & sID";
_currentcategory = "products/"+_sid;
 //BA.debugLineNum = 1249;BA.debugLine="hu.Initialize(\"product_details\",Me)";
_hu._initialize(ba,"product_details",this);
 //BA.debugLineNum = 1251;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1253;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1254;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1256;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1257;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1259;BA.debugLine="End Sub";
return "";
}
public String  _register(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _data,boolean _isguest) throws Exception{
String _auth = "";
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _ss = "";
 //BA.debugLineNum = 806;BA.debugLine="Public Sub Register(Module As Object,Event As Stri";
 //BA.debugLineNum = 808;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 810;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 811;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 812;BA.debugLine="currentCategory = \"register\"";
_currentcategory = "register";
 //BA.debugLineNum = 814;BA.debugLine="hu.Initialize(\"register\",Me)";
_hu._initialize(ba,"register",this);
 //BA.debugLineNum = 816;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 817;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 819;BA.debugLine="If isGuest = True Then";
if (_isguest==__c.True) { 
 //BA.debugLineNum = 820;BA.debugLine="data.Put(\"address_2\",\"android\")";
_data.Put((Object)("address_2"),(Object)("android"));
 //BA.debugLineNum = 821;BA.debugLine="data.Put(\"company_id\",\"1\")";
_data.Put((Object)("company_id"),(Object)("1"));
 //BA.debugLineNum = 822;BA.debugLine="data.Put(\"company\",\"guest\")";
_data.Put((Object)("company"),(Object)("guest"));
 //BA.debugLineNum = 823;BA.debugLine="data.Put(\"password\",\"123456\")";
_data.Put((Object)("password"),(Object)("123456"));
 //BA.debugLineNum = 824;BA.debugLine="data.Put(\"confirm\",\"12345\")";
_data.Put((Object)("confirm"),(Object)("12345"));
 //BA.debugLineNum = 825;BA.debugLine="data.Put(\"fax\",\"1\")";
_data.Put((Object)("fax"),(Object)("1"));
 //BA.debugLineNum = 826;BA.debugLine="data.Put(\"tax_id\",\"\")";
_data.Put((Object)("tax_id"),(Object)(""));
 //BA.debugLineNum = 827;BA.debugLine="data.Put(\"agree\",\"1\")";
_data.Put((Object)("agree"),(Object)("1"));
 //BA.debugLineNum = 828;BA.debugLine="currentCategory = \"guest\"";
_currentcategory = "guest";
 }else {
 //BA.debugLineNum = 830;BA.debugLine="data.Put(\"company\",\"\")";
_data.Put((Object)("company"),(Object)(""));
 //BA.debugLineNum = 831;BA.debugLine="data.Put(\"address_2\",\"test\")";
_data.Put((Object)("address_2"),(Object)("test"));
 //BA.debugLineNum = 832;BA.debugLine="data.Put(\"company_id\",\"\")";
_data.Put((Object)("company_id"),(Object)(""));
 //BA.debugLineNum = 833;BA.debugLine="data.Put(\"confirm\",data.Get(\"password\"))";
_data.Put((Object)("confirm"),_data.Get((Object)("password")));
 //BA.debugLineNum = 834;BA.debugLine="data.Put(\"agree\",\"1\")";
_data.Put((Object)("agree"),(Object)("1"));
 //BA.debugLineNum = 835;BA.debugLine="data.Put(\"tax_id\",\"1\")";
_data.Put((Object)("tax_id"),(Object)("1"));
 //BA.debugLineNum = 836;BA.debugLine="currentCategory = \"register\"";
_currentcategory = "register";
 };
 //BA.debugLineNum = 839;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 840;BA.debugLine="js.Initialize(data)";
_js.Initialize(_data);
 //BA.debugLineNum = 842;BA.debugLine="Dim ss As String";
_ss = "";
 //BA.debugLineNum = 843;BA.debugLine="ss = js.ToString";
_ss = _js.ToString();
 //BA.debugLineNum = 845;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 847;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 849;BA.debugLine="End Sub";
return "";
}
public String  _relatedproduct(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1219;BA.debugLine="Public Sub RelatedProduct(Module As Object,Event A";
 //BA.debugLineNum = 1221;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1223;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1224;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1226;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 1227;BA.debugLine="currentCategory = \"related/\" & sID";
_currentcategory = "related/"+_sid;
 //BA.debugLineNum = 1229;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 //BA.debugLineNum = 1231;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1233;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1234;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1236;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1237;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1239;BA.debugLine="End Sub";
return "";
}
public String  _requestreturn(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _sdata) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1574;BA.debugLine="Public Sub RequestReturn(Module As Object,Event As";
 //BA.debugLineNum = 1576;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1578;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1579;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1580;BA.debugLine="currentCategory = \"returns\"";
_currentcategory = "returns";
 //BA.debugLineNum = 1582;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1583;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 1585;BA.debugLine="hu.Initialize(\"returns\",Me)";
_hu._initialize(ba,"returns",this);
 //BA.debugLineNum = 1586;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1588;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1589;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1591;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1592;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 1593;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 1595;BA.debugLine="End Sub";
return "";
}
public String  _saveorder(Object _module,String _event,boolean _isonlysave) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1332;BA.debugLine="Public Sub SaveOrder(Module As Object,Event As Str";
 //BA.debugLineNum = 1334;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1336;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1337;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1338;BA.debugLine="currentCategory = \"confirm\" 'this is method name";
_currentcategory = "confirm";
 //BA.debugLineNum = 1340;BA.debugLine="hu.Initialize(\"order\",Me)";
_hu._initialize(ba,"order",this);
 //BA.debugLineNum = 1341;BA.debugLine="hu.PostString(apiurl & currentCategory,\"\")";
_hu._poststring(_apiurl+_currentcategory,"");
 //BA.debugLineNum = 1343;BA.debugLine="If isOnlySave = True Then";
if (_isonlysave==__c.True) { 
 //BA.debugLineNum = 1344;BA.debugLine="hu.GetRequest.InitializePut2(apiurl & currentCat";
_hu._getrequest().InitializePut2(_apiurl+_currentcategory,"".getBytes("UTF8"));
 };
 //BA.debugLineNum = 1347;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1348;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1349;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1352;BA.debugLine="End Sub";
return "";
}
public String  _saveordersimple(Object _module,String _event,boolean _isonlysave) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1354;BA.debugLine="Public Sub SaveOrderSimple(Module As Object,Event";
 //BA.debugLineNum = 1356;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1358;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1359;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1360;BA.debugLine="currentCategory = \"simpleconfirm\" 'this is method";
_currentcategory = "simpleconfirm";
 //BA.debugLineNum = 1362;BA.debugLine="hu.Initialize(\"ordersimple\",Me)";
_hu._initialize(ba,"ordersimple",this);
 //BA.debugLineNum = 1363;BA.debugLine="hu.PostString(apiurl & currentCategory,\"\")";
_hu._poststring(_apiurl+_currentcategory,"");
 //BA.debugLineNum = 1365;BA.debugLine="If isOnlySave = True Then";
if (_isonlysave==__c.True) { 
 //BA.debugLineNum = 1366;BA.debugLine="hu.GetRequest.InitializePut2(apiurl & currentCat";
_hu._getrequest().InitializePut2(_apiurl+_currentcategory,"".getBytes("UTF8"));
 };
 //BA.debugLineNum = 1369;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1370;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1371;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1374;BA.debugLine="End Sub";
return "";
}
public String  _searchproduct(Object _module,String _event,String _sfield) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1149;BA.debugLine="Public Sub SearchProduct(Module As Object,Event As";
 //BA.debugLineNum = 1151;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1153;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1154;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1156;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 1157;BA.debugLine="currentCategory = \"products/search/\" & su.EncodeU";
_currentcategory = "products/search/"+_su.EncodeUrl(_sfield,"UTF8");
 //BA.debugLineNum = 1159;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 //BA.debugLineNum = 1161;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 1163;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1164;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1166;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1167;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1169;BA.debugLine="End Sub";
return "";
}
public String  _searchproduct2(Object _module,String _event,String _sfield) throws Exception{
String _auth = "";
 //BA.debugLineNum = 1197;BA.debugLine="Public Sub SearchProduct2(Module As Object,Event A";
 //BA.debugLineNum = 1199;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1201;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1202;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1204;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 1205;BA.debugLine="currentCategory = Library.GetStringResourse(\"url\"";
_currentcategory = _library._getstringresourse(getActivityBA(),"url")+"/index.php?route=feed/rest_api/products&search="+_su.EncodeUrl(_sfield,"UTF8");
 //BA.debugLineNum = 1207;BA.debugLine="hu.Initialize(\"product\",Me)";
_hu._initialize(ba,"product",this);
 //BA.debugLineNum = 1209;BA.debugLine="hu.Download(currentCategory)";
_hu._download(_currentcategory);
 //BA.debugLineNum = 1211;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1212;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1214;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1215;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 1217;BA.debugLine="End Sub";
return "";
}
public String  _setdefaultx_oc(anywheresoftware.b4h.okhttp.OkHttpClientWrapper.OkHttpRequest _request) throws Exception{
String _curr = "";
anywheresoftware.b4a.objects.collections.List _ls = null;
anywheresoftware.b4a.objects.collections.List _listcurr = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m2 = null;
 //BA.debugLineNum = 1732;BA.debugLine="Private Sub setDefaultX_OC(Request As OkHttpReques";
 //BA.debugLineNum = 1734;BA.debugLine="Dim curr As String";
_curr = "";
 //BA.debugLineNum = 1735;BA.debugLine="curr = Library.GetStringResourse(\"default_currenc";
_curr = _library._getstringresourse(getActivityBA(),"default_currency");
 //BA.debugLineNum = 1737;BA.debugLine="If Library.currLang = \"فارسی\" Then";
if ((_library._currlang).equals("فارسی")) { 
 //BA.debugLineNum = 1738;BA.debugLine="Request.SetHeader(\"X-Oc-Merchant-Language\",\"fa\")";
_request.SetHeader("X-Oc-Merchant-Language","fa");
 //BA.debugLineNum = 1739;BA.debugLine="If curr = \"\" Then curr = \"RLS\"";
if ((_curr).equals("")) { 
_curr = "RLS";};
 }else if((_library._currlang.toLowerCase()).equals("english")) { 
 //BA.debugLineNum = 1741;BA.debugLine="Request.SetHeader(\"X-Oc-Merchant-Language\",\"en\")";
_request.SetHeader("X-Oc-Merchant-Language","en");
 //BA.debugLineNum = 1742;BA.debugLine="If curr = \"\" Then curr = \"USD\"";
if ((_curr).equals("")) { 
_curr = "USD";};
 };
 //BA.debugLineNum = 1747;BA.debugLine="Dim ls,listCurr As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
_listcurr = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1749;BA.debugLine="If Library.CacheSystem.ExistID(\"currencies\",\"curr";
if (_library._cachesystem._existid("currencies","currencies")) { 
 //BA.debugLineNum = 1751;BA.debugLine="ls = Library.CacheSystem.GetCacheAsList(\"currenc";
_ls = _library._cachesystem._getcacheaslist("currencies","currencies");
 //BA.debugLineNum = 1753;BA.debugLine="listCurr.Initialize";
_listcurr.Initialize();
 //BA.debugLineNum = 1755;BA.debugLine="If ls.IsInitialized Then";
if (_ls.IsInitialized()) { 
 //BA.debugLineNum = 1756;BA.debugLine="For i = 0 To ls.Size - 1";
{
final int step15 = 1;
final int limit15 = (int) (_ls.getSize()-1);
for (_i = (int) (0) ; (step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15); _i = ((int)(0 + _i + step15)) ) {
 //BA.debugLineNum = 1758;BA.debugLine="Dim m2 As Map";
_m2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1759;BA.debugLine="m2 = ls.Get(i)";
_m2.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get(_i)));
 //BA.debugLineNum = 1761;BA.debugLine="If m2.Get(\"title\") = curr Then";
if ((_m2.Get((Object)("title"))).equals((Object)(_curr))) { 
 //BA.debugLineNum = 1762;BA.debugLine="curr = m2.Get(\"code\")";
_curr = BA.ObjectToString(_m2.Get((Object)("code")));
 //BA.debugLineNum = 1763;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 };
 }else {
 //BA.debugLineNum = 1770;BA.debugLine="If curr.Length = 0 Then curr = \"\"";
if (_curr.length()==0) { 
_curr = "";};
 };
 //BA.debugLineNum = 1774;BA.debugLine="If curr.Length = 0 Then curr = \"RLS\"";
if (_curr.length()==0) { 
_curr = "RLS";};
 //BA.debugLineNum = 1776;BA.debugLine="Request.SetHeader(\"X-Oc-Currency\",curr)";
_request.SetHeader("X-Oc-Currency",_curr);
 //BA.debugLineNum = 1780;BA.debugLine="Request.SetHeader(\"X-Oc-Image-Dimension\",$\"${100%";
_request.SetHeader("X-Oc-Image-Dimension",(""+__c.SmartStringFormatter("",(Object)(__c.PerXToCurrent((float) (100),getActivityBA())))+"x"+__c.SmartStringFormatter("",(Object)(__c.PerXToCurrent((float) (100),getActivityBA())))+""));
 //BA.debugLineNum = 1782;BA.debugLine="End Sub";
return "";
}
public String  _setguestshipmethods(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _sdata) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1480;BA.debugLine="Public Sub SetGuestShipMethods(Module As Object,Ev";
 //BA.debugLineNum = 1482;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1484;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1485;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1486;BA.debugLine="currentCategory = \"guestshipping\"";
_currentcategory = "guestshipping";
 //BA.debugLineNum = 1488;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1489;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 1491;BA.debugLine="hu.Initialize(\"shippingmethods\",Me)";
_hu._initialize(ba,"shippingmethods",this);
 //BA.debugLineNum = 1492;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1494;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1495;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1496;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1498;BA.debugLine="End Sub";
return "";
}
public String  _setpaymentmethods(Object _module,String _event,String _sid,String _comment) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sdata = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1411;BA.debugLine="Public Sub SetPaymentMethods(Module As Object,Even";
 //BA.debugLineNum = 1413;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1415;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1416;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1417;BA.debugLine="currentCategory = \"paymentmethods\"";
_currentcategory = "paymentmethods";
 //BA.debugLineNum = 1419;BA.debugLine="Dim sData As Map";
_sdata = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1420;BA.debugLine="sData.Initialize";
_sdata.Initialize();
 //BA.debugLineNum = 1421;BA.debugLine="sData.Put(\"payment_method\",sID)";
_sdata.Put((Object)("payment_method"),(Object)(_sid));
 //BA.debugLineNum = 1422;BA.debugLine="sData.Put(\"agree\",\"1\")";
_sdata.Put((Object)("agree"),(Object)("1"));
 //BA.debugLineNum = 1423;BA.debugLine="sData.Put(\"comment\",Comment)";
_sdata.Put((Object)("comment"),(Object)(_comment));
 //BA.debugLineNum = 1425;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1426;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 1428;BA.debugLine="hu.Initialize(\"setpayments\",Me)";
_hu._initialize(ba,"setpayments",this);
 //BA.debugLineNum = 1429;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1431;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1432;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1433;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1435;BA.debugLine="End Sub";
return "";
}
public String  _setshipmethods(Object _module,String _event,String _sid,String _comment) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sdata = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1455;BA.debugLine="Public Sub SetShipMethods(Module As Object,Event A";
 //BA.debugLineNum = 1457;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1459;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1460;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1461;BA.debugLine="currentCategory = \"shippingmethods\"";
_currentcategory = "shippingmethods";
 //BA.debugLineNum = 1463;BA.debugLine="Dim sData As Map";
_sdata = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1464;BA.debugLine="sData.Initialize";
_sdata.Initialize();
 //BA.debugLineNum = 1465;BA.debugLine="sData.Put(\"shipping_method\",sID)";
_sdata.Put((Object)("shipping_method"),(Object)(_sid));
 //BA.debugLineNum = 1466;BA.debugLine="sData.Put(\"comment\",Comment)";
_sdata.Put((Object)("comment"),(Object)(_comment));
 //BA.debugLineNum = 1468;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1469;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 1471;BA.debugLine="hu.Initialize(\"shippingmethods\",Me)";
_hu._initialize(ba,"shippingmethods",this);
 //BA.debugLineNum = 1472;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1474;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1475;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1476;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1478;BA.debugLine="End Sub";
return "";
}
public String  _setstoreid(anywheresoftware.b4h.okhttp.OkHttpClientWrapper.OkHttpRequest _request) throws Exception{
 //BA.debugLineNum = 1786;BA.debugLine="Public Sub setStoreID(Request As OkHttpRequest)";
 //BA.debugLineNum = 1787;BA.debugLine="Request.SetHeader(\"X-Oc-Store-Id\",Library.StoreID";
_request.SetHeader("X-Oc-Store-Id",_library._storeid);
 //BA.debugLineNum = 1788;BA.debugLine="End Sub";
return "";
}
public String  _subscribe(Object _module,String _event,boolean _subscribes) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2062;BA.debugLine="Public Sub SubScribe(Module As Object,Event As Str";
 //BA.debugLineNum = 2064;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2066;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2067;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2069;BA.debugLine="If SubScribes Then";
if (_subscribes) { 
 //BA.debugLineNum = 2070;BA.debugLine="currentCategory = \"/index.php?route=rest/account";
_currentcategory = "/index.php?route=rest/account/newsletter&subscribe=1";
 }else {
 //BA.debugLineNum = 2072;BA.debugLine="currentCategory = \"/index.php?route=rest/account";
_currentcategory = "/index.php?route=rest/account/newsletter&subscribe=0";
 };
 //BA.debugLineNum = 2075;BA.debugLine="hu.Initialize(\"subscribe\",Me)";
_hu._initialize(ba,"subscribe",this);
 //BA.debugLineNum = 2076;BA.debugLine="hu.PostString(myurl & currentCategory,\"\")";
_hu._poststring(_myurl+_currentcategory,"");
 //BA.debugLineNum = 2077;BA.debugLine="hu.GetRequest.InitializePut2(myurl & currentCateg";
_hu._getrequest().InitializePut2(_myurl+_currentcategory,"".getBytes("UTF8"));
 //BA.debugLineNum = 2079;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2080;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2081;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2083;BA.debugLine="End Sub";
return "";
}
public String  _updatepassworduser(Object _module,String _event,String _spassword) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 2124;BA.debugLine="Public Sub UpdatePasswordUser(Module As Object,Eve";
 //BA.debugLineNum = 2126;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2128;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2129;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2130;BA.debugLine="currentCategory = \"account/password\"";
_currentcategory = "account/password";
 //BA.debugLineNum = 2132;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 2133;BA.debugLine="js.Initialize(CreateMap(\"password\":sPassword,\"con";
_js.Initialize(__c.createMap(new Object[] {(Object)("password"),(Object)(_spassword),(Object)("confirm"),(Object)(_spassword)}));
 //BA.debugLineNum = 2135;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2136;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 2137;BA.debugLine="hu.GetRequest.InitializePut2(apiurl & currentCate";
_hu._getrequest().InitializePut2(_apiurl+_currentcategory,_js.ToString().getBytes("UTF8"));
 //BA.debugLineNum = 2139;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2140;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2142;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2143;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 2144;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 2146;BA.debugLine="End Sub";
return "";
}
public String  _updateproductcart(Object _module,String _event,String _sid,String _scount) throws Exception{
anywheresoftware.b4a.objects.collections.Map _sproduct = null;
anywheresoftware.b4a.objects.collections.Map _id = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 1975;BA.debugLine="Public Sub UpdateProductCart(Module As Object,Even";
 //BA.debugLineNum = 1977;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 1979;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 1980;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 1981;BA.debugLine="currentCategory = \"cart\"";
_currentcategory = "cart";
 //BA.debugLineNum = 1983;BA.debugLine="Dim sProduct,id As Map";
_sproduct = new anywheresoftware.b4a.objects.collections.Map();
_id = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1984;BA.debugLine="sProduct.Initialize";
_sproduct.Initialize();
 //BA.debugLineNum = 1985;BA.debugLine="id.Initialize";
_id.Initialize();
 //BA.debugLineNum = 1986;BA.debugLine="sProduct.Put(\"quantity\",CreateMap(sID:sCount))";
_sproduct.Put((Object)("quantity"),(Object)(__c.createMap(new Object[] {(Object)(_sid),(Object)(_scount)}).getObject()));
 //BA.debugLineNum = 1988;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 1989;BA.debugLine="js.Initialize(sProduct)";
_js.Initialize(_sproduct);
 //BA.debugLineNum = 1991;BA.debugLine="hu.Initialize(\"updatecart\",Me)";
_hu._initialize(ba,"updatecart",this);
 //BA.debugLineNum = 1992;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 1993;BA.debugLine="hu.GetRequest.InitializePut2(apiurl & currentCate";
_hu._getrequest().InitializePut2(_apiurl+_currentcategory,_js.ToString().getBytes("UTF8"));
 //BA.debugLineNum = 1995;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 1996;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 1998;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 1999;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
_hu._getrequest().SetHeader("body",_js.ToString());
 //BA.debugLineNum = 2000;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_hu._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 2002;BA.debugLine="End Sub";
return "";
}
public String  _updateuserdetails(Object _module,String _event,anywheresoftware.b4a.objects.collections.Map _sdata) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
String _auth = "";
 //BA.debugLineNum = 2103;BA.debugLine="Public Sub UpdateUserDetails(Module As Object,Even";
 //BA.debugLineNum = 2105;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2107;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2108;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2109;BA.debugLine="currentCategory = \"account\"";
_currentcategory = "account";
 //BA.debugLineNum = 2111;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 2112;BA.debugLine="js.Initialize(sData)";
_js.Initialize(_sdata);
 //BA.debugLineNum = 2114;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2115;BA.debugLine="hu.PostString(apiurl & currentCategory,js.ToStrin";
_hu._poststring(_apiurl+_currentcategory,_js.ToString());
 //BA.debugLineNum = 2117;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2118;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2119;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2120;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2122;BA.debugLine="End Sub";
return "";
}
public String  _userdetails(Object _module,String _event) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2085;BA.debugLine="Public Sub UserDetails(Module As Object,Event As S";
 //BA.debugLineNum = 2087;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2089;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2090;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2091;BA.debugLine="currentCategory = \"account\"";
_currentcategory = "account";
 //BA.debugLineNum = 2093;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2094;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 //BA.debugLineNum = 2096;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2097;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2098;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2099;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2101;BA.debugLine="End Sub";
return "";
}
public String  _userorders(Object _module,String _event,String _sid,boolean _isrecorder) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2276;BA.debugLine="Public Sub UserOrders(Module As Object,Event As St";
 //BA.debugLineNum = 2278;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2280;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2281;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2283;BA.debugLine="If sID = \"0\" And isRecorder = False Then";
if ((_sid).equals("0") && _isrecorder==__c.False) { 
 //BA.debugLineNum = 2284;BA.debugLine="currentCategory = \"customerorders\"";
_currentcategory = "customerorders";
 }else {
 //BA.debugLineNum = 2286;BA.debugLine="currentCategory = \"customerorders/\" & sID";
_currentcategory = "customerorders/"+_sid;
 };
 //BA.debugLineNum = 2289;BA.debugLine="hu.Initialize(\"account_user\",Me)";
_hu._initialize(ba,"account_user",this);
 //BA.debugLineNum = 2291;BA.debugLine="If isRecorder = False Then";
if (_isrecorder==__c.False) { 
 //BA.debugLineNum = 2292;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 }else {
 //BA.debugLineNum = 2294;BA.debugLine="hu.PostString(apiurl & currentCategory,\"\")";
_hu._poststring(_apiurl+_currentcategory,"");
 };
 //BA.debugLineNum = 2297;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2298;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2299;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2300;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2302;BA.debugLine="End Sub";
return "";
}
public String  _wishlist(Object _module,String _event,String _sid) throws Exception{
String _auth = "";
 //BA.debugLineNum = 2026;BA.debugLine="Public Sub Wishlist(Module As Object,Event As Stri";
 //BA.debugLineNum = 2028;BA.debugLine="CheckHttps";
_checkhttps();
 //BA.debugLineNum = 2030;BA.debugLine="If Library.token.IsInitialized = False Then Retur";
if (_library._token.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 2032;BA.debugLine="sModule = Module";
_smodule = _module;
 //BA.debugLineNum = 2033;BA.debugLine="EVT = Event";
_evt = _event;
 //BA.debugLineNum = 2035;BA.debugLine="hu.Initialize(\"wishlist\",Me)";
_hu._initialize(ba,"wishlist",this);
 //BA.debugLineNum = 2037;BA.debugLine="If sID = \"\" Then";
if ((_sid).equals("")) { 
 //BA.debugLineNum = 2038;BA.debugLine="currentCategory = \"wishlist\"";
_currentcategory = "wishlist";
 //BA.debugLineNum = 2039;BA.debugLine="hu.Download(apiurl & currentCategory)";
_hu._download(_apiurl+_currentcategory);
 }else if(_sid.startsWith("-")) { 
 //BA.debugLineNum = 2042;BA.debugLine="currentCategory = \"wishlist/\" & sID.Replace(\"-\",";
_currentcategory = "wishlist/"+_sid.replace("-","");
 //BA.debugLineNum = 2043;BA.debugLine="hu.PostString(apiurl & currentCategory,\"\")";
_hu._poststring(_apiurl+_currentcategory,"");
 //BA.debugLineNum = 2044;BA.debugLine="hu.GetRequest.InitializeDelete(apiurl & currentC";
_hu._getrequest().InitializeDelete(_apiurl+_currentcategory);
 }else {
 //BA.debugLineNum = 2047;BA.debugLine="currentCategory = \"wishlist/\" & sID";
_currentcategory = "wishlist/"+_sid;
 //BA.debugLineNum = 2048;BA.debugLine="hu.PostString(apiurl & currentCategory,\"\")";
_hu._poststring(_apiurl+_currentcategory,"");
 };
 //BA.debugLineNum = 2051;BA.debugLine="Dim auth As String";
_auth = "";
 //BA.debugLineNum = 2052;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = (""+__c.SmartStringFormatter("",_library._token.Get((Object)("token_type")))+" "+__c.SmartStringFormatter("",(Object)(_getcurrenttoken()))+"");
 //BA.debugLineNum = 2053;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
_hu._getrequest().SetHeader("Authorization",_auth);
 //BA.debugLineNum = 2054;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
_setdefaultx_oc(_hu._getrequest());
 //BA.debugLineNum = 2056;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
if (BA.fastSubCompare(sub, "LOGOUT"))
	return _logout((Object) args[0], (String) args[1]);
return BA.SubDelegator.SubNotFound;
}
}
