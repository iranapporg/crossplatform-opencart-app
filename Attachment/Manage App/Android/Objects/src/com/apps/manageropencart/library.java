package com.apps.manageropencart;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class library {
private static library mostCurrent = new library();
public static Object getObject() {
    throw new RuntimeException("Code module does not support this method.");
}
 public anywheresoftware.b4a.keywords.Common __c = null;
public static String _v0 = "";
public static String _vv1 = "";
public static String _vv2 = "";
public static String _vv3 = "";
public static boolean _vv4 = false;
public static boolean _vv5 = false;
public static anywheresoftware.b4a.objects.preferenceactivity.PreferenceManager _vv6 = null;
public static String _vv7 = "";
public static String _vv0 = "";
public static anywheresoftware.b4a.objects.collections.Map _vvv1 = null;
public static com.devil.signature.CheckSignature _vvv2 = null;
public static int _vvv3 = 0;
public static String _vvv4 = "";
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.actdetailsofreportitem _vvvvvvv5 = null;
public com.apps.manageropencart.actfeaturemodule _vvvvvvv7 = null;
public com.apps.manageropencart.actbanners _vvvvvvv0 = null;
public com.apps.manageropencart.actstatistic _vvvvvvvv1 = null;
public com.apps.manageropencart.actmenu _vvvvvvvv2 = null;
public com.apps.manageropencart.actmenus _vvvvvvvv3 = null;
public com.apps.manageropencart.actnewversion _vvvvvvvv4 = null;
public com.apps.manageropencart.actpassword _vvvvvvvv5 = null;
public com.apps.manageropencart.starter _vvvvvvvv6 = null;
public com.apps.manageropencart.firebasemessaging _vvvvvvvv7 = null;
public static String  _vvv5(anywheresoftware.b4a.BA _ba,String _str,anywheresoftware.b4a.objects.LabelWrapper _label) throws Exception{
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _ri = null;
 //BA.debugLineNum = 125;BA.debugLine="Sub BoldString(Str As String,Label As Label)";
 //BA.debugLineNum = 127;BA.debugLine="Dim ri As RichString";
_ri = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 128;BA.debugLine="ri.Initialize(Str)";
_ri.Initialize(BA.ObjectToCharSequence(_str));
 //BA.debugLineNum = 129;BA.debugLine="ri.Style2(ri.STYLE_BOLD,\"{b}\")";
_ri.Style2(_ri.STYLE_BOLD,"{b}");
 //BA.debugLineNum = 130;BA.debugLine="Label.Text = ri";
_label.setText(BA.ObjectToCharSequence(_ri.getObject()));
 //BA.debugLineNum = 132;BA.debugLine="End Sub";
return "";
}
public static String  _vvv6(anywheresoftware.b4a.BA _ba,String _color) throws Exception{
int _r = 0;
int _g = 0;
int _b = 0;
String _hex = "";
 //BA.debugLineNum = 98;BA.debugLine="Sub ConvertHex2Int(Color As String) As String";
 //BA.debugLineNum = 100;BA.debugLine="Dim R,G,b As Int";
_r = 0;
_g = 0;
_b = 0;
 //BA.debugLineNum = 101;BA.debugLine="Dim hex As String";
_hex = "";
 //BA.debugLineNum = 102;BA.debugLine="hex = Color";
_hex = _color;
 //BA.debugLineNum = 104;BA.debugLine="R = Bit.ParseInt(hex.SubString2(1,3), 16)";
_r = anywheresoftware.b4a.keywords.Common.Bit.ParseInt(_hex.substring((int) (1),(int) (3)),(int) (16));
 //BA.debugLineNum = 105;BA.debugLine="G = Bit.ParseInt(hex.SubString2(3,5), 16)";
_g = anywheresoftware.b4a.keywords.Common.Bit.ParseInt(_hex.substring((int) (3),(int) (5)),(int) (16));
 //BA.debugLineNum = 106;BA.debugLine="b = Bit.ParseInt(hex.SubString2(5,7), 16)";
_b = anywheresoftware.b4a.keywords.Common.Bit.ParseInt(_hex.substring((int) (5),(int) (7)),(int) (16));
 //BA.debugLineNum = 108;BA.debugLine="Return Colors.RGB(R, G, b)";
if (true) return BA.NumberToString(anywheresoftware.b4a.keywords.Common.Colors.RGB(_r,_g,_b));
 //BA.debugLineNum = 110;BA.debugLine="End Sub";
return "";
}
public static String  _vvv7(anywheresoftware.b4a.BA _ba,String _encrypteddata) throws Exception{
anywheresoftware.b4a.object.B4XEncryption _c = null;
anywheresoftware.b4a.objects.StringUtils _su = null;
String _key = "";
byte[] _b = null;
String _temp = "";
 //BA.debugLineNum = 112;BA.debugLine="Sub Decrypt(encryptedData As String ) As String";
 //BA.debugLineNum = 114;BA.debugLine="Dim c As B4XCipher";
_c = new anywheresoftware.b4a.object.B4XEncryption();
 //BA.debugLineNum = 115;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 116;BA.debugLine="Dim key As String = Sign.KeyHash.Replace(CRLF,\"\")";
_key = _vvv2.KeyHash((_ba.processBA == null ? _ba : _ba.processBA)).replace(anywheresoftware.b4a.keywords.Common.CRLF,"");
 //BA.debugLineNum = 117;BA.debugLine="Dim b() As Byte = c.Decrypt(su.DecodeBase64(encry";
_b = _c.Decrypt(_su.DecodeBase64(_encrypteddata),_key);
 //BA.debugLineNum = 119;BA.debugLine="Dim temp As String";
_temp = "";
 //BA.debugLineNum = 120;BA.debugLine="temp = BytesToString(b, 0, b.Length, \"UTF-8\")";
_temp = anywheresoftware.b4a.keywords.Common.BytesToString(_b,(int) (0),_b.length,"UTF-8");
 //BA.debugLineNum = 121;BA.debugLine="Return temp";
if (true) return _temp;
 //BA.debugLineNum = 123;BA.debugLine="End Sub";
return "";
}
public static String  _vvv0(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.EditTextWrapper _edittxt,String _icon) throws Exception{
uk.co.martinpearman.b4a.androidresources.AndroidResources _ar = null;
anywheresoftware.b4j.object.JavaObject _etxt = null;
 //BA.debugLineNum = 50;BA.debugLine="Sub EditTextIcon(EditTxt As EditText,Icon As Strin";
 //BA.debugLineNum = 51;BA.debugLine="Dim ar As AndroidResources";
_ar = new uk.co.martinpearman.b4a.androidresources.AndroidResources();
 //BA.debugLineNum = 52;BA.debugLine="Dim ETxt As JavaObject = EditTxt";
_etxt = new anywheresoftware.b4j.object.JavaObject();
_etxt.setObject((java.lang.Object)(_edittxt.getObject()));
 //BA.debugLineNum = 53;BA.debugLine="ETxt.RunMethod(\"setCompoundDrawablesWithIntrin";
_etxt.RunMethod("setCompoundDrawablesWithIntrinsicBounds",new Object[]{(Object)(_ar.GetAndroidDrawable(_icon)),anywheresoftware.b4a.keywords.Common.Null,anywheresoftware.b4a.keywords.Common.Null,anywheresoftware.b4a.keywords.Common.Null});
 //BA.debugLineNum = 54;BA.debugLine="End Sub";
return "";
}
public static float  _vvvv1(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.keywords.LayoutValues _lv = null;
 //BA.debugLineNum = 92;BA.debugLine="Sub GetDevicePhysicalSize As Float";
 //BA.debugLineNum = 93;BA.debugLine="Dim lv As LayoutValues";
_lv = new anywheresoftware.b4a.keywords.LayoutValues();
 //BA.debugLineNum = 94;BA.debugLine="lv = GetDeviceLayoutValues";
_lv = anywheresoftware.b4a.keywords.Common.GetDeviceLayoutValues(_ba);
 //BA.debugLineNum = 95;BA.debugLine="Return Sqrt(Power(lv.Height / lv.Scale / 160,";
if (true) return (float) (anywheresoftware.b4a.keywords.Common.Sqrt(anywheresoftware.b4a.keywords.Common.Power(_lv.Height/(double)_lv.Scale/(double)160,2)+anywheresoftware.b4a.keywords.Common.Power(_lv.Width/(double)_lv.Scale/(double)160,2)));
 //BA.debugLineNum = 96;BA.debugLine="End Sub";
return 0f;
}
public static String  _vvvv2(anywheresoftware.b4a.BA _ba,String _key) throws Exception{
String _s = "";
uk.co.martinpearman.b4a.androidresources.AndroidResources _ar = null;
 //BA.debugLineNum = 56;BA.debugLine="Sub GetStringResourse(Key As String) As String";
 //BA.debugLineNum = 58;BA.debugLine="Try";
try { //BA.debugLineNum = 59;BA.debugLine="Dim s As String";
_s = "";
 //BA.debugLineNum = 60;BA.debugLine="Dim ar As AndroidResources";
_ar = new uk.co.martinpearman.b4a.androidresources.AndroidResources();
 //BA.debugLineNum = 61;BA.debugLine="s = ar.GetApplicationString(Key)";
_s = _ar.GetApplicationString(_key);
 //BA.debugLineNum = 62;BA.debugLine="If s = Null Then Return \"\"";
if (_s== null) { 
if (true) return "";};
 //BA.debugLineNum = 63;BA.debugLine="Return s";
if (true) return _s;
 } 
       catch (Exception e8) {
			(_ba.processBA == null ? _ba : _ba.processBA).setLastException(e8); //BA.debugLineNum = 65;BA.debugLine="Return \"\"";
if (true) return "";
 };
 //BA.debugLineNum = 68;BA.debugLine="End Sub";
return "";
}
public static String  _vvvv3(anywheresoftware.b4a.BA _ba,String _sdir,String _sfilename) throws Exception{
String _uri = "";
anywheresoftware.b4a.objects.IntentWrapper _i2 = null;
 //BA.debugLineNum = 15;BA.debugLine="Sub InstallApp(sDir As String,sFilename As String)";
 //BA.debugLineNum = 16;BA.debugLine="Dim Uri As String";
_uri = "";
 //BA.debugLineNum = 17;BA.debugLine="Dim i2 As Intent";
_i2 = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Uri = \"file://\" & File.Combine(sDir, sFilename)";
_uri = "file://"+anywheresoftware.b4a.keywords.Common.File.Combine(_sdir,_sfilename);
 //BA.debugLineNum = 19;BA.debugLine="i2.Initialize(i2.ACTION_VIEW, Uri)";
_i2.Initialize(_i2.ACTION_VIEW,_uri);
 //BA.debugLineNum = 20;BA.debugLine="i2.SetType(\"application/vnd.android.package-archi";
_i2.SetType("application/vnd.android.package-archive");
 //BA.debugLineNum = 21;BA.debugLine="StartActivity(i2)";
anywheresoftware.b4a.keywords.Common.StartActivity((_ba.processBA == null ? _ba : _ba.processBA),(Object)(_i2.getObject()));
 //BA.debugLineNum = 22;BA.debugLine="End Sub";
return "";
}
public static boolean  _vvvv4(anywheresoftware.b4a.BA _ba) throws Exception{
anywheresoftware.b4a.objects.SocketWrapper.ServerSocketWrapper _mylan = null;
String _ip = "";
 //BA.debugLineNum = 24;BA.debugLine="Sub InternetState As Boolean";
 //BA.debugLineNum = 26;BA.debugLine="Dim mylan As ServerSocket";
_mylan = new anywheresoftware.b4a.objects.SocketWrapper.ServerSocketWrapper();
 //BA.debugLineNum = 27;BA.debugLine="mylan.Initialize(0,\"\")";
_mylan.Initialize((_ba.processBA == null ? _ba : _ba.processBA),(int) (0),"");
 //BA.debugLineNum = 29;BA.debugLine="Dim ip As String";
_ip = "";
 //BA.debugLineNum = 30;BA.debugLine="ip = mylan.GetMyIP";
_ip = _mylan.GetMyIP();
 //BA.debugLineNum = 32;BA.debugLine="If ip = \"127.0.0.1\" Then";
if ((_ip).equals("127.0.0.1")) { 
 //BA.debugLineNum = 33;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 }else {
 //BA.debugLineNum = 35;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 38;BA.debugLine="End Sub";
return false;
}
public static anywheresoftware.b4a.objects.collections.Map  _vvvv5(anywheresoftware.b4a.BA _ba,String _data) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
 //BA.debugLineNum = 40;BA.debugLine="Sub Json2Map(data As String) As Map";
 //BA.debugLineNum = 42;BA.debugLine="If data = \"null\" Then Return Null";
if ((_data).equals("null")) { 
if (true) return (anywheresoftware.b4a.objects.collections.Map) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.Map(), (anywheresoftware.b4a.objects.collections.Map.MyMap)(anywheresoftware.b4a.keywords.Common.Null));};
 //BA.debugLineNum = 44;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 45;BA.debugLine="js.Initialize(data)";
_js.Initialize(_data);
 //BA.debugLineNum = 46;BA.debugLine="Return js.NextObject";
if (true) return _js.NextObject();
 //BA.debugLineNum = 48;BA.debugLine="End Sub";
return null;
}
public static String  _vvvv6(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ConcreteViewWrapper _view1,float _space) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _obj1 = null;
 //BA.debugLineNum = 86;BA.debugLine="Sub LabelSpace(view1 As View,Space As Float)";
 //BA.debugLineNum = 87;BA.debugLine="Dim Obj1 As Reflector";
_obj1 = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 88;BA.debugLine="Obj1.Target = view1";
_obj1.Target = (Object)(_view1.getObject());
 //BA.debugLineNum = 89;BA.debugLine="Obj1.RunMethod3(\"setLineSpacing\", Space, \"java.la";
_obj1.RunMethod3("setLineSpacing",BA.NumberToString(_space),"java.lang.float",BA.NumberToString(_space),"java.lang.float");
 //BA.debugLineNum = 90;BA.debugLine="End Sub";
return "";
}
public static String  _vvvv7(anywheresoftware.b4a.BA _ba,String _title,String _body,String _stype,String _data) throws Exception{
barxdroid.NotificationBuilder.NotificationBigTextStyle _st = null;
barxdroid.NotificationBuilder.NotificationBuilder _nb = null;
anywheresoftware.b4a.objects.IntentWrapper _int1 = null;
 //BA.debugLineNum = 134;BA.debugLine="Sub Notify(Title As String,Body As String,sType As";
 //BA.debugLineNum = 136;BA.debugLine="Dim sT As NotificationBigTextStyle";
_st = new barxdroid.NotificationBuilder.NotificationBigTextStyle();
 //BA.debugLineNum = 137;BA.debugLine="sT.Initialize";
_st.Initialize((_ba.processBA == null ? _ba : _ba.processBA));
 //BA.debugLineNum = 138;BA.debugLine="sT.BigContentTitle = \"توجه\"";
_st.setBigContentTitle("توجه");
 //BA.debugLineNum = 139;BA.debugLine="sT.BigText = Body";
_st.setBigText(_body);
 //BA.debugLineNum = 140;BA.debugLine="sT.SummaryText = \"پیام جدید از مدیریت اپن کارت\"";
_st.setSummaryText("پیام جدید از مدیریت اپن کارت");
 //BA.debugLineNum = 142;BA.debugLine="If File.Exists(File.DirRootExternal,\"notification";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"notification.mp3")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 143;BA.debugLine="File.Copy(File.DirAssets,\"notification.mp3\",File";
anywheresoftware.b4a.keywords.Common.File.Copy(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"notification.mp3",anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"notification.mp3");
 };
 //BA.debugLineNum = 146;BA.debugLine="Dim nb As NotificationBuilder";
_nb = new barxdroid.NotificationBuilder.NotificationBuilder();
 //BA.debugLineNum = 147;BA.debugLine="nb.Initialize";
_nb.Initialize((_ba.processBA == null ? _ba : _ba.processBA));
 //BA.debugLineNum = 148;BA.debugLine="nb.AutoCancel = True";
_nb.setAutoCancel(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 149;BA.debugLine="nb.DefaultLight = True";
_nb.setDefaultLight(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 150;BA.debugLine="nb.DefaultSound = True";
_nb.setDefaultSound(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 151;BA.debugLine="nb.DefaultVibrate = True";
_nb.setDefaultVibrate(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 152;BA.debugLine="nb.SmallIcon = \"icon\"";
_nb.setSmallIcon("icon");
 //BA.debugLineNum = 153;BA.debugLine="nb.CustomSound = File.Combine(File.DirRootExterna";
_nb.setCustomSound(anywheresoftware.b4a.keywords.Common.File.Combine(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"notification.mp3"));
 //BA.debugLineNum = 154;BA.debugLine="nb.Tag = \"New message\"";
_nb.setTag("New message");
 //BA.debugLineNum = 156;BA.debugLine="If sType = \"link\" Then";
if ((_stype).equals("link")) { 
 //BA.debugLineNum = 157;BA.debugLine="Dim int1 As Intent";
_int1 = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 158;BA.debugLine="int1.Initialize(int1.ACTION_VIEW,Data)";
_int1.Initialize(_int1.ACTION_VIEW,_data);
 //BA.debugLineNum = 159;BA.debugLine="nb.setIntent(int1)";
_nb.setIntent((_ba.processBA == null ? _ba : _ba.processBA),(android.content.Intent)(_int1.getObject()));
 }else if((_stype).equals("update")) { 
 //BA.debugLineNum = 162;BA.debugLine="nb.setActivity(Main)";
_nb.setActivity((_ba.processBA == null ? _ba : _ba.processBA),(Object)(mostCurrent._vvvvvvv1.getObject()));
 }else {
 };
 //BA.debugLineNum = 167;BA.debugLine="nb.SetStyle(sT)";
_nb.SetStyle((android.support.v4.app.NotificationCompat.Style)(_st.getObject()));
 //BA.debugLineNum = 168;BA.debugLine="nb.Notify(1)";
_nb.Notify((_ba.processBA == null ? _ba : _ba.processBA),(int) (1));
 //BA.debugLineNum = 170;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Public Token,ShopAppVersion,URL,BaseURL As String";
_v0 = "";
_vv1 = "";
_vv2 = "";
_vv3 = "";
 //BA.debugLineNum = 5;BA.debugLine="Public IsActiveShop,IsHttps As Boolean";
_vv4 = false;
_vv5 = false;
 //BA.debugLineNum = 6;BA.debugLine="Public Manager As PreferenceManager";
_vv6 = new anywheresoftware.b4a.objects.preferenceactivity.PreferenceManager();
 //BA.debugLineNum = 7;BA.debugLine="Public LanguageFilename As String : LanguageFilen";
_vv7 = "";
 //BA.debugLineNum = 7;BA.debugLine="Public LanguageFilename As String : LanguageFilen";
_vv7 = BA.__b (new byte[] {60,35,37,32,38,37}, 481063);
 //BA.debugLineNum = 8;BA.debugLine="Public Token,ClientID As String";
_v0 = "";
_vv0 = "";
 //BA.debugLineNum = 9;BA.debugLine="Public Config As Map";
_vvv1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 10;BA.debugLine="Public Sign As CheckSignature";
_vvv2 = new com.devil.signature.CheckSignature();
 //BA.debugLineNum = 11;BA.debugLine="Public ThemeColor As Int";
_vvv3 = 0;
 //BA.debugLineNum = 12;BA.debugLine="Public ShopTitle As String";
_vvv4 = "";
 //BA.debugLineNum = 13;BA.debugLine="End Sub";
return "";
}
public static String  _vvvv0(anywheresoftware.b4a.BA _ba) throws Exception{
uk.co.martinpearman.b4a.util.Locale _loc = null;
uk.co.martinpearman.b4a.content.res.Resources _res = null;
 //BA.debugLineNum = 70;BA.debugLine="Sub setLocalApp";
 //BA.debugLineNum = 72;BA.debugLine="Dim loc As Locale";
_loc = new uk.co.martinpearman.b4a.util.Locale();
 //BA.debugLineNum = 73;BA.debugLine="Dim res As Resources";
_res = new uk.co.martinpearman.b4a.content.res.Resources();
 //BA.debugLineNum = 75;BA.debugLine="If File.GetText(File.DirInternal,LanguageFilename";
if ((anywheresoftware.b4a.keywords.Common.File.GetText(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),_vv7)).equals("fa")) { 
 //BA.debugLineNum = 76;BA.debugLine="loc.Initialize(\"fa\")";
_loc.Initialize("fa");
 }else {
 //BA.debugLineNum = 78;BA.debugLine="loc.Initialize(\"en\")";
_loc.Initialize("en");
 };
 //BA.debugLineNum = 81;BA.debugLine="res.SetDefaultLocale(loc)";
_res.SetDefaultLocale((java.util.Locale)(_loc.getObject()));
 //BA.debugLineNum = 82;BA.debugLine="res.Initialize(res.RESOURCE_SOURCE_APPLICATION)";
_res.Initialize(_res.RESOURCE_SOURCE_APPLICATION);
 //BA.debugLineNum = 84;BA.debugLine="End Sub";
return "";
}
}
