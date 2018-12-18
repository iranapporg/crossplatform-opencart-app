package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class bookmark {
private static bookmark mostCurrent = new bookmark();
public static Object getObject() {
    throw new RuntimeException("Code module does not support this method.");
}
 public anywheresoftware.b4a.keywords.Common __c = null;
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
public static boolean  _bookmark(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.collections.Map _product) throws Exception{
anywheresoftware.b4a.objects.collections.Map _m1 = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 6;BA.debugLine="Public Sub Bookmark(Product As Map) As Boolean";
 //BA.debugLineNum = 8;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 9;BA.debugLine="m1.Initialize";
_m1.Initialize();
 //BA.debugLineNum = 11;BA.debugLine="If ExistsFile Then";
if (_existsfile(_ba)) { 
 //BA.debugLineNum = 12;BA.debugLine="m1 = File.ReadMap(File.DirInternal,\"bookmarks\")";
_m1 = anywheresoftware.b4a.keywords.Common.File.ReadMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bookmarks");
 };
 //BA.debugLineNum = 15;BA.debugLine="If m1.ContainsKey(Product.Get(\"id\")) = False Then";
if (_m1.ContainsKey(_product.Get((Object)("id")))==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 16;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 17;BA.debugLine="js.Initialize(Product)";
_js.Initialize(_product);
 //BA.debugLineNum = 19;BA.debugLine="m1.Put(Product.Get(\"id\"),js.ToString)";
_m1.Put(_product.Get((Object)("id")),(Object)(_js.ToString()));
 //BA.debugLineNum = 20;BA.debugLine="File.WriteMap(File.DirInternal,\"bookmarks\",m1)";
anywheresoftware.b4a.keywords.Common.File.WriteMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bookmarks",_m1);
 //BA.debugLineNum = 22;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 24;BA.debugLine="m1.Remove(Product.Get(\"id\"))";
_m1.Remove(_product.Get((Object)("id")));
 //BA.debugLineNum = 25;BA.debugLine="File.WriteMap(File.DirInternal,\"bookmarks\",m1)";
anywheresoftware.b4a.keywords.Common.File.WriteMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bookmarks",_m1);
 //BA.debugLineNum = 26;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 29;BA.debugLine="End Sub";
return false;
}
public static int  _bookmarkcount(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.objects.collections.Map _map1 = null;
 //BA.debugLineNum = 74;BA.debugLine="Sub BookmarkCount As Int";
 //BA.debugLineNum = 76;BA.debugLine="If ExistsFile Then";
if (_existsfile(_ba)) { 
 //BA.debugLineNum = 77;BA.debugLine="Dim map1 As Map";
_map1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 78;BA.debugLine="map1.Initialize";
_map1.Initialize();
 //BA.debugLineNum = 79;BA.debugLine="map1 = File.ReadMap(File.DirInternal,\"bookmarks\"";
_map1 = anywheresoftware.b4a.keywords.Common.File.ReadMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bookmarks");
 //BA.debugLineNum = 80;BA.debugLine="Return map1.Size";
if (true) return _map1.getSize();
 }else {
 //BA.debugLineNum = 82;BA.debugLine="Return 0";
if (true) return (int) (0);
 };
 //BA.debugLineNum = 85;BA.debugLine="End Sub";
return 0;
}
public static boolean  _checkid(anywheresoftware.b4a.BA _ba,String _sid) throws Exception{
anywheresoftware.b4a.objects.collections.Map _m1 = null;
 //BA.debugLineNum = 31;BA.debugLine="Public Sub CheckID(sID As String) As Boolean";
 //BA.debugLineNum = 33;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 34;BA.debugLine="m1.Initialize";
_m1.Initialize();
 //BA.debugLineNum = 36;BA.debugLine="If ExistsFile Then";
if (_existsfile(_ba)) { 
 //BA.debugLineNum = 37;BA.debugLine="m1 = File.ReadMap(File.DirInternal,\"bookmarks\")";
_m1 = anywheresoftware.b4a.keywords.Common.File.ReadMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bookmarks");
 };
 //BA.debugLineNum = 40;BA.debugLine="If m1.ContainsKey(sID) = True Then";
if (_m1.ContainsKey((Object)(_sid))==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 41;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else {
 //BA.debugLineNum = 43;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 46;BA.debugLine="End Sub";
return false;
}
public static boolean  _existsfile(anywheresoftware.b4a.BA _ba) throws Exception{
 //BA.debugLineNum = 87;BA.debugLine="Sub ExistsFile As Boolean";
 //BA.debugLineNum = 88;BA.debugLine="Return File.Exists(File.DirInternal,\"bookmarks\")";
if (true) return anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bookmarks");
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return false;
}
public static anywheresoftware.b4a.objects.collections.List  _getbookmarks(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.objects.collections.List _l1 = null;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _te = null;
anywheresoftware.b4a.objects.collections.JSONParser _j = null;
 //BA.debugLineNum = 48;BA.debugLine="Public Sub GetBookmarks As List";
 //BA.debugLineNum = 50;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 51;BA.debugLine="l1.Initialize";
_l1.Initialize();
 //BA.debugLineNum = 53;BA.debugLine="If ExistsFile Then";
if (_existsfile(_ba)) { 
 //BA.debugLineNum = 54;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 55;BA.debugLine="m1.Initialize";
_m1.Initialize();
 //BA.debugLineNum = 56;BA.debugLine="m1 = File.ReadMap(File.DirInternal,\"bookmarks\")";
_m1 = anywheresoftware.b4a.keywords.Common.File.ReadMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bookmarks");
 //BA.debugLineNum = 58;BA.debugLine="If m1.Size > 0 Then";
if (_m1.getSize()>0) { 
 //BA.debugLineNum = 59;BA.debugLine="For i = 0 To m1.Size - 1";
{
final int step8 = 1;
final int limit8 = (int) (_m1.getSize()-1);
for (_i = (int) (0) ; (step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8); _i = ((int)(0 + _i + step8)) ) {
 //BA.debugLineNum = 60;BA.debugLine="Dim te As Map";
_te = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 61;BA.debugLine="Dim j As JSONParser";
_j = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 62;BA.debugLine="j.Initialize(m1.GetValueAt(i))";
_j.Initialize(BA.ObjectToString(_m1.GetValueAt(_i)));
 //BA.debugLineNum = 63;BA.debugLine="te = j.NextObject";
_te = _j.NextObject();
 //BA.debugLineNum = 64;BA.debugLine="l1.Add(te)";
_l1.Add((Object)(_te.getObject()));
 }
};
 //BA.debugLineNum = 66;BA.debugLine="Return l1";
if (true) return _l1;
 };
 };
 //BA.debugLineNum = 70;BA.debugLine="Return l1";
if (true) return _l1;
 //BA.debugLineNum = 72;BA.debugLine="End Sub";
return null;
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="End Sub";
return "";
}
}
