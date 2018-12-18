package com.apps.manageropencart;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class opencart extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.manageropencart.opencart");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.manageropencart.opencart.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.samples.httputils2.httpjob _v6 = null;
public String _vvvvvv5 = "";
public String _vvvvvv6 = "";
public Object _vvvvvv7 = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.actdetailsofreportitem _vvvvvvv5 = null;
public com.apps.manageropencart.library _vvvvvvv6 = null;
public com.apps.manageropencart.actfeaturemodule _vvvvvvv7 = null;
public com.apps.manageropencart.actbanners _vvvvvvv0 = null;
public com.apps.manageropencart.actstatistic _vvvvvvvv1 = null;
public com.apps.manageropencart.actmenu _vvvvvvvv2 = null;
public com.apps.manageropencart.actmenus _vvvvvvvv3 = null;
public com.apps.manageropencart.actnewversion _vvvvvvvv4 = null;
public com.apps.manageropencart.actpassword _vvvvvvvv5 = null;
public com.apps.manageropencart.starter _vvvvvvvv6 = null;
public com.apps.manageropencart.firebasemessaging _vvvvvvvv7 = null;
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Private Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private hu As HttpJob";
_v6 = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 4;BA.debugLine="Private apiurl As String";
_vvvvvv5 = "";
 //BA.debugLineNum = 5;BA.debugLine="Private EVT As String";
_vvvvvv6 = "";
 //BA.debugLineNum = 6;BA.debugLine="Private sModule As Object";
_vvvvvv7 = new Object();
 //BA.debugLineNum = 7;BA.debugLine="End Sub";
return "";
}
public String  _vvvvvv1(Object _module,String _event,String _sid) throws Exception{
 //BA.debugLineNum = 73;BA.debugLine="Public Sub GetBanners(Module As Object,Event As St";
 //BA.debugLineNum = 75;BA.debugLine="sModule = Module";
_vvvvvv7 = _module;
 //BA.debugLineNum = 76;BA.debugLine="EVT = Event";
_vvvvvv6 = _event;
 //BA.debugLineNum = 79;BA.debugLine="hu.Initialize(\"banners\",Me)";
_v6._initialize(ba,"banners",this);
 //BA.debugLineNum = 80;BA.debugLine="hu.Download(apiurl & \"banners/\" & sID)";
_v6._download(_vvvvvv5+"banners/"+_sid);
 //BA.debugLineNum = 81;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",\"Bearer \"";
_v6._getrequest().SetHeader("Authorization","Bearer "+_vvvvvvv6._v0);
 //BA.debugLineNum = 82;BA.debugLine="hu.GetRequest.SetHeader(\"X-Oc-Merchant-Language\",";
_v6._getrequest().SetHeader("X-Oc-Merchant-Language",__c.File.ReadString(__c.File.getDirInternal(),_vvvvvvv6._vv7));
 //BA.debugLineNum = 84;BA.debugLine="End Sub";
return "";
}
public String  _vvvvvv2(Object _module,String _event) throws Exception{
 //BA.debugLineNum = 86;BA.debugLine="Public Sub GetFeatureModules(Module As Object,Even";
 //BA.debugLineNum = 88;BA.debugLine="sModule = Module";
_vvvvvv7 = _module;
 //BA.debugLineNum = 89;BA.debugLine="EVT = Event";
_vvvvvv6 = _event;
 //BA.debugLineNum = 92;BA.debugLine="hu.Initialize(\"banners\",Me)";
_v6._initialize(ba,"banners",this);
 //BA.debugLineNum = 93;BA.debugLine="hu.Download(apiurl & \"featured\")";
_v6._download(_vvvvvv5+"featured");
 //BA.debugLineNum = 94;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",\"Bearer \"";
_v6._getrequest().SetHeader("Authorization","Bearer "+_vvvvvvv6._v0);
 //BA.debugLineNum = 95;BA.debugLine="hu.GetRequest.SetHeader(\"X-Oc-Merchant-Language\",";
_v6._getrequest().SetHeader("X-Oc-Merchant-Language",__c.File.ReadString(__c.File.getDirInternal(),_vvvvvvv6._vv7));
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
return "";
}
public String  _vvvvvv3(Object _module,String _event) throws Exception{
 //BA.debugLineNum = 99;BA.debugLine="Public Sub GetInformation(Module As Object,Event A";
 //BA.debugLineNum = 101;BA.debugLine="sModule = Module";
_vvvvvv7 = _module;
 //BA.debugLineNum = 102;BA.debugLine="EVT = Event";
_vvvvvv6 = _event;
 //BA.debugLineNum = 105;BA.debugLine="hu.Initialize(\"banners\",Me)";
_v6._initialize(ba,"banners",this);
 //BA.debugLineNum = 106;BA.debugLine="hu.Download(apiurl & \"information\")";
_v6._download(_vvvvvv5+"information");
 //BA.debugLineNum = 107;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",\"Bearer \"";
_v6._getrequest().SetHeader("Authorization","Bearer "+_vvvvvvv6._v0);
 //BA.debugLineNum = 108;BA.debugLine="hu.GetRequest.SetHeader(\"X-Oc-Merchant-Language\",";
_v6._getrequest().SetHeader("X-Oc-Merchant-Language",__c.File.ReadString(__c.File.getDirInternal(),_vvvvvvv6._vv7));
 //BA.debugLineNum = 110;BA.debugLine="End Sub";
return "";
}
public String  _vvvvvv4(Object _module,String _event) throws Exception{
 //BA.debugLineNum = 13;BA.debugLine="Public Sub GetToken(Module As Object,Event As Stri";
 //BA.debugLineNum = 15;BA.debugLine="EVT = Event";
_vvvvvv6 = _event;
 //BA.debugLineNum = 16;BA.debugLine="sModule = Module";
_vvvvvv7 = _module;
 //BA.debugLineNum = 18;BA.debugLine="hu.Initialize(\"token\",Me)";
_v6._initialize(ba,"token",this);
 //BA.debugLineNum = 19;BA.debugLine="hu.PostString(apiurl & \"oauth2/token/client_crede";
_v6._poststring(_vvvvvv5+"oauth2/token/client_credentials","grant_type=client_credentials");
 //BA.debugLineNum = 20;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
_v6._getrequest().SetContentType("application/json");
 //BA.debugLineNum = 21;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",\"Basic \"";
_v6._getrequest().SetHeader("Authorization","Basic "+_vvvvvvv6._vv0);
 //BA.debugLineNum = 22;BA.debugLine="hu.GetRequest.SetHeader(\"X-Oc-Merchant-Language\",";
_v6._getrequest().SetHeader("X-Oc-Merchant-Language",__c.File.ReadString(__c.File.getDirInternal(),_vvvvvvv6._vv7));
 //BA.debugLineNum = 24;BA.debugLine="End Sub";
return "";
}
public String  _initialize(anywheresoftware.b4a.BA _ba) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 9;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 10;BA.debugLine="apiurl = Library.BaseURL & \"/api/rest/\"";
_vvvvvv5 = _vvvvvvv6._vv3+"/api/rest/";
 //BA.debugLineNum = 11;BA.debugLine="End Sub";
return "";
}
public String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
String _rs = "";
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.collections.List _ls = null;
 //BA.debugLineNum = 26;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 28;BA.debugLine="ProgressDialogHide";
__c.ProgressDialogHide();
 //BA.debugLineNum = 30;BA.debugLine="Try";
try { //BA.debugLineNum = 32;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 34;BA.debugLine="Dim rs As String";
_rs = "";
 //BA.debugLineNum = 35;BA.debugLine="rs = Job.GetString2(\"UTF8\")";
_rs = _job._getstring2("UTF8");
 //BA.debugLineNum = 37;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 38;BA.debugLine="js.Initialize(rs)";
_js.Initialize(_rs);
 //BA.debugLineNum = 40;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 41;BA.debugLine="temp = js.NextObject";
_temp = _js.NextObject();
 //BA.debugLineNum = 43;BA.debugLine="If Job.JobName = \"token\" Then";
if ((_job._jobname).equals("token")) { 
 //BA.debugLineNum = 45;BA.debugLine="If temp.ContainsKey(\"access_token\") Then";
if (_temp.ContainsKey((Object)("access_token"))) { 
 //BA.debugLineNum = 46;BA.debugLine="Library.Token = temp.Get(\"access_token\")";
_vvvvvvv6._v0 = BA.ObjectToString(_temp.Get((Object)("access_token")));
 //BA.debugLineNum = 47;BA.debugLine="CallSubDelayed2(sModule,EVT,True)";
__c.CallSubDelayed2(ba,_vvvvvv7,_vvvvvv6,(Object)(__c.True));
 }else {
 //BA.debugLineNum = 49;BA.debugLine="CallSubDelayed2(sModule,EVT,True)";
__c.CallSubDelayed2(ba,_vvvvvv7,_vvvvvv6,(Object)(__c.True));
 };
 }else if((_job._jobname).equals("banners")) { 
 //BA.debugLineNum = 54;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 55;BA.debugLine="ls = temp.Get(\"data\")";
_ls.setObject((java.util.List)(_temp.Get((Object)("data"))));
 //BA.debugLineNum = 57;BA.debugLine="CallSubDelayed2(sModule,EVT,ls)";
__c.CallSubDelayed2(ba,_vvvvvv7,_vvvvvv6,(Object)(_ls));
 };
 }else {
 //BA.debugLineNum = 62;BA.debugLine="Log(Job.ErrorMessage)";
__c.Log(_job._errormessage);
 };
 } 
       catch (Exception e26) {
			ba.setLastException(e26); //BA.debugLineNum = 66;BA.debugLine="Log(LastException.Message)";
__c.Log(__c.LastException(getActivityBA()).getMessage());
 };
 //BA.debugLineNum = 69;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 71;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
