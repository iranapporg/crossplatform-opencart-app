package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class cachesystem extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.demo.cachesystem");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.demo.cachesystem.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.sql.SQL _sql1 = null;
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
public String  _addlist2cache(String _id,anywheresoftware.b4a.objects.collections.List _data,String _stype) throws Exception{
anywheresoftware.b4a.objects.collections.List _d1 = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 35;BA.debugLine="Sub AddList2Cache(ID As String,Data As List,sType";
 //BA.debugLineNum = 37;BA.debugLine="Return";
if (true) return "";
 //BA.debugLineNum = 39;BA.debugLine="If ExistID(ID,sType) Then Return";
if (_existid(_id,_stype)) { 
if (true) return "";};
 //BA.debugLineNum = 40;BA.debugLine="If Data = Null Then Return";
if (_data== null) { 
if (true) return "";};
 //BA.debugLineNum = 41;BA.debugLine="If Data.IsInitialized = False Then Return";
if (_data.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 43;BA.debugLine="Dim d1 As List";
_d1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 45;BA.debugLine="Try";
try { //BA.debugLineNum = 46;BA.debugLine="If Data.IsInitialized = False Then Return";
if (_data.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 47;BA.debugLine="d1 = Data";
_d1 = _data;
 } 
       catch (Exception e10) {
			ba.setLastException(e10); //BA.debugLineNum = 49;BA.debugLine="d1 = Data";
_d1 = _data;
 };
 //BA.debugLineNum = 52;BA.debugLine="Try";
try { //BA.debugLineNum = 53;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 54;BA.debugLine="js.Initialize2(d1)";
_js.Initialize2(_d1);
 //BA.debugLineNum = 56;BA.debugLine="sql1.ExecNonQuery2(\"INSERT INTO cache VALUES(?,?";
_sql1.ExecNonQuery2("INSERT INTO cache VALUES(?,?,?)",anywheresoftware.b4a.keywords.Common.ArrayToList(new Object[]{(Object)(_id),(Object)(_js.ToString()),(Object)(_stype)}));
 } 
       catch (Exception e17) {
			ba.setLastException(e17); };
 //BA.debugLineNum = 60;BA.debugLine="End Sub";
return "";
}
public String  _addmap2cache(String _id,anywheresoftware.b4a.objects.collections.Map _data,String _stype) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
 //BA.debugLineNum = 18;BA.debugLine="Sub AddMap2Cache(ID As String,Data As Map,sType As";
 //BA.debugLineNum = 20;BA.debugLine="Return";
if (true) return "";
 //BA.debugLineNum = 22;BA.debugLine="If Data = Null Then Return";
if (_data== null) { 
if (true) return "";};
 //BA.debugLineNum = 23;BA.debugLine="If Data.IsInitialized = False Then Return";
if (_data.IsInitialized()==__c.False) { 
if (true) return "";};
 //BA.debugLineNum = 25;BA.debugLine="Try";
try { //BA.debugLineNum = 26;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 27;BA.debugLine="js.Initialize(Data)";
_js.Initialize(_data);
 //BA.debugLineNum = 29;BA.debugLine="sql1.ExecNonQuery2(\"INSERT INTO cache VALUES(?,?";
_sql1.ExecNonQuery2("INSERT INTO cache VALUES(?,?,?)",anywheresoftware.b4a.keywords.Common.ArrayToList(new Object[]{(Object)(_id),(Object)(_js.ToString()),(Object)(_stype)}));
 } 
       catch (Exception e9) {
			ba.setLastException(e9); };
 //BA.debugLineNum = 33;BA.debugLine="End Sub";
return "";
}
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Private Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private sql1 As SQL";
_sql1 = new anywheresoftware.b4a.sql.SQL();
 //BA.debugLineNum = 4;BA.debugLine="End Sub";
return "";
}
public String  _clearcache() throws Exception{
 //BA.debugLineNum = 148;BA.debugLine="Sub ClearCache";
 //BA.debugLineNum = 150;BA.debugLine="sql1.ExecNonQuery(\"DELETE FROM cache\")";
_sql1.ExecNonQuery("DELETE FROM cache");
 //BA.debugLineNum = 152;BA.debugLine="End Sub";
return "";
}
public String  _clearcache2(String _stype) throws Exception{
 //BA.debugLineNum = 154;BA.debugLine="Sub ClearCache2(sType As String)";
 //BA.debugLineNum = 156;BA.debugLine="sql1.ExecNonQuery2(\"DELETE FROM cache WHERE ID =?";
_sql1.ExecNonQuery2("DELETE FROM cache WHERE ID =? AND sType = ?",anywheresoftware.b4a.keywords.Common.ArrayToList(new String[]{_stype,_stype}));
 //BA.debugLineNum = 158;BA.debugLine="End Sub";
return "";
}
public String  _deleteitem(String _id,String _stype) throws Exception{
 //BA.debugLineNum = 160;BA.debugLine="Sub DeleteItem(ID As String,sType As String)";
 //BA.debugLineNum = 162;BA.debugLine="sql1.ExecNonQuery2(\"DELETE FROM cache WHERE ID=?";
_sql1.ExecNonQuery2("DELETE FROM cache WHERE ID=? AND sType = ?",anywheresoftware.b4a.keywords.Common.ArrayToList(new Object[]{(Object)(_id),(Object)(_stype)}));
 //BA.debugLineNum = 164;BA.debugLine="End Sub";
return "";
}
public boolean  _existid(String _id,String _stype) throws Exception{
anywheresoftware.b4a.sql.SQL.ResultSetWrapper _res = null;
 //BA.debugLineNum = 62;BA.debugLine="Public Sub ExistID(ID As String,sType As String) A";
 //BA.debugLineNum = 64;BA.debugLine="Return False";
if (true) return __c.False;
 //BA.debugLineNum = 66;BA.debugLine="Try";
try { //BA.debugLineNum = 67;BA.debugLine="Dim res As ResultSet";
_res = new anywheresoftware.b4a.sql.SQL.ResultSetWrapper();
 //BA.debugLineNum = 68;BA.debugLine="res = sql1.ExecQuery2(\"SELECT * FROM cache WHERE";
_res.setObject((android.database.Cursor)(_sql1.ExecQuery2("SELECT * FROM cache WHERE ID =? AND sType = ?",new String[]{_id,_stype})));
 //BA.debugLineNum = 70;BA.debugLine="If res.RowCount = 0 Then";
if (_res.getRowCount()==0) { 
 //BA.debugLineNum = 71;BA.debugLine="Return False";
if (true) return __c.False;
 }else {
 //BA.debugLineNum = 73;BA.debugLine="Return True";
if (true) return __c.True;
 };
 } 
       catch (Exception e11) {
			ba.setLastException(e11); //BA.debugLineNum = 76;BA.debugLine="Return False";
if (true) return __c.False;
 };
 //BA.debugLineNum = 79;BA.debugLine="End Sub";
return false;
}
public boolean  _existtype(String _stype) throws Exception{
anywheresoftware.b4a.sql.SQL.ResultSetWrapper _res = null;
 //BA.debugLineNum = 81;BA.debugLine="Public Sub ExistType(sType As String) As Boolean";
 //BA.debugLineNum = 83;BA.debugLine="Return False";
if (true) return __c.False;
 //BA.debugLineNum = 85;BA.debugLine="Try";
try { //BA.debugLineNum = 86;BA.debugLine="Dim res As ResultSet";
_res = new anywheresoftware.b4a.sql.SQL.ResultSetWrapper();
 //BA.debugLineNum = 87;BA.debugLine="res = sql1.ExecQuery2(\"SELECT * FROM cache WHERE";
_res.setObject((android.database.Cursor)(_sql1.ExecQuery2("SELECT * FROM cache WHERE sType = ?",new String[]{_stype})));
 //BA.debugLineNum = 89;BA.debugLine="If res.RowCount = 0 Then";
if (_res.getRowCount()==0) { 
 //BA.debugLineNum = 90;BA.debugLine="Return False";
if (true) return __c.False;
 }else {
 //BA.debugLineNum = 92;BA.debugLine="Return True";
if (true) return __c.True;
 };
 } 
       catch (Exception e11) {
			ba.setLastException(e11); //BA.debugLineNum = 95;BA.debugLine="Return False";
if (true) return __c.False;
 };
 //BA.debugLineNum = 98;BA.debugLine="End Sub";
return false;
}
public anywheresoftware.b4a.objects.collections.List  _getcacheaslist(String _id,String _stype) throws Exception{
anywheresoftware.b4a.sql.SQL.ResultSetWrapper _res = null;
String _sql = "";
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
 //BA.debugLineNum = 122;BA.debugLine="Sub GetCacheAsList(ID As String,sType As String) A";
 //BA.debugLineNum = 124;BA.debugLine="Return Null";
if (true) return (anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(__c.Null));
 //BA.debugLineNum = 126;BA.debugLine="Dim res As ResultSet";
_res = new anywheresoftware.b4a.sql.SQL.ResultSetWrapper();
 //BA.debugLineNum = 128;BA.debugLine="Dim sql As String";
_sql = "";
 //BA.debugLineNum = 129;BA.debugLine="sql = $\"SELECT * FROM cache WHERE ID =\"${ID}\" AND";
_sql = ("SELECT * FROM cache WHERE ID =\""+__c.SmartStringFormatter("",(Object)(_id))+"\" AND sType =\""+__c.SmartStringFormatter("",(Object)(_stype))+"\"");
 //BA.debugLineNum = 131;BA.debugLine="Try";
try { //BA.debugLineNum = 132;BA.debugLine="res = sql1.ExecQuery(sql)";
_res.setObject((android.database.Cursor)(_sql1.ExecQuery(_sql)));
 //BA.debugLineNum = 134;BA.debugLine="If res.RowCount = 0 Then";
if (_res.getRowCount()==0) { 
 //BA.debugLineNum = 135;BA.debugLine="Return Null";
if (true) return (anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(__c.Null));
 }else {
 //BA.debugLineNum = 137;BA.debugLine="res.Position = 0";
_res.setPosition((int) (0));
 //BA.debugLineNum = 138;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 139;BA.debugLine="js.Initialize(res.GetString(\"Data\"))";
_js.Initialize(_res.GetString("Data"));
 //BA.debugLineNum = 140;BA.debugLine="Return js.NextArray";
if (true) return _js.NextArray();
 };
 } 
       catch (Exception e16) {
			ba.setLastException(e16); //BA.debugLineNum = 143;BA.debugLine="Return Null";
if (true) return (anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(__c.Null));
 };
 //BA.debugLineNum = 146;BA.debugLine="End Sub";
return null;
}
public anywheresoftware.b4a.objects.collections.Map  _getcacheasmap(String _id,String _stype) throws Exception{
anywheresoftware.b4a.sql.SQL.ResultSetWrapper _res = null;
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
 //BA.debugLineNum = 100;BA.debugLine="public Sub GetCacheAsMap(ID As String,sType As Str";
 //BA.debugLineNum = 102;BA.debugLine="Return Null";
if (true) return (anywheresoftware.b4a.objects.collections.Map) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.Map(), (anywheresoftware.b4a.objects.collections.Map.MyMap)(__c.Null));
 //BA.debugLineNum = 104;BA.debugLine="Try";
try { //BA.debugLineNum = 105;BA.debugLine="Dim res As ResultSet";
_res = new anywheresoftware.b4a.sql.SQL.ResultSetWrapper();
 //BA.debugLineNum = 106;BA.debugLine="res = sql1.ExecQuery2(\"SELECT * FROM cache WHERE";
_res.setObject((android.database.Cursor)(_sql1.ExecQuery2("SELECT * FROM cache WHERE ID =? AND sType = ?",new String[]{_id,_stype})));
 //BA.debugLineNum = 108;BA.debugLine="If res.RowCount = 0 Then";
if (_res.getRowCount()==0) { 
 //BA.debugLineNum = 109;BA.debugLine="Return Null";
if (true) return (anywheresoftware.b4a.objects.collections.Map) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.Map(), (anywheresoftware.b4a.objects.collections.Map.MyMap)(__c.Null));
 }else {
 //BA.debugLineNum = 111;BA.debugLine="res.Position = 0";
_res.setPosition((int) (0));
 //BA.debugLineNum = 112;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 113;BA.debugLine="js.Initialize(res.GetString(\"Data\"))";
_js.Initialize(_res.GetString("Data"));
 //BA.debugLineNum = 114;BA.debugLine="Return js.NextObject";
if (true) return _js.NextObject();
 };
 } 
       catch (Exception e14) {
			ba.setLastException(e14); //BA.debugLineNum = 117;BA.debugLine="Return Null";
if (true) return (anywheresoftware.b4a.objects.collections.Map) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.Map(), (anywheresoftware.b4a.objects.collections.Map.MyMap)(__c.Null));
 };
 //BA.debugLineNum = 120;BA.debugLine="End Sub";
return null;
}
public int  _getrowscache() throws Exception{
anywheresoftware.b4a.sql.SQL.ResultSetWrapper _res = null;
String _sql = "";
 //BA.debugLineNum = 166;BA.debugLine="Sub GetRowsCache As Int";
 //BA.debugLineNum = 168;BA.debugLine="Dim res As ResultSet";
_res = new anywheresoftware.b4a.sql.SQL.ResultSetWrapper();
 //BA.debugLineNum = 170;BA.debugLine="Dim sql As String";
_sql = "";
 //BA.debugLineNum = 171;BA.debugLine="sql = $\"SELECT * FROM cache\"$";
_sql = ("SELECT * FROM cache");
 //BA.debugLineNum = 172;BA.debugLine="res = sql1.ExecQuery(sql)";
_res.setObject((android.database.Cursor)(_sql1.ExecQuery(_sql)));
 //BA.debugLineNum = 173;BA.debugLine="Return res.RowCount";
if (true) return _res.getRowCount();
 //BA.debugLineNum = 175;BA.debugLine="End Sub";
return 0;
}
public String  _initialize(anywheresoftware.b4a.BA _ba) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 7;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 9;BA.debugLine="If File.Exists(File.DirInternal,\"cache_datas\") =";
if (__c.File.Exists(__c.File.getDirInternal(),"cache_datas")==__c.False) { 
 //BA.debugLineNum = 10;BA.debugLine="sql1.Initialize(File.DirInternal,\"cache_datas\",T";
_sql1.Initialize(__c.File.getDirInternal(),"cache_datas",__c.True);
 //BA.debugLineNum = 11;BA.debugLine="sql1.ExecNonQuery(\"CREATE TABLE cache (ID TEXT,D";
_sql1.ExecNonQuery("CREATE TABLE cache (ID TEXT,Data TEXT,sType TEXT)");
 }else {
 //BA.debugLineNum = 13;BA.debugLine="sql1.Initialize(File.DirInternal,\"cache_datas\",F";
_sql1.Initialize(__c.File.getDirInternal(),"cache_datas",__c.False);
 };
 //BA.debugLineNum = 16;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
