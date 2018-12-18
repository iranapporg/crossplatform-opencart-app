package com.apps.manageropencart;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class showprogress extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.manageropencart.showprogress");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.manageropencart.showprogress.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.objects.PanelWrapper _vvvvvvvvv2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblmessage = null;
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
 //BA.debugLineNum = 2;BA.debugLine="private Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private pnl As Panel";
_vvvvvvvvv2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 4;BA.debugLine="Private lblmessage As Label";
_lblmessage = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 5;BA.debugLine="End Sub";
return "";
}
public String  _vvvvvvvv0() throws Exception{
 //BA.debugLineNum = 22;BA.debugLine="Sub HideProgress";
 //BA.debugLineNum = 23;BA.debugLine="pnl.Visible = False";
_vvvvvvvvv2.setVisible(__c.False);
 //BA.debugLineNum = 24;BA.debugLine="End Sub";
return "";
}
public String  _initialize(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.ActivityWrapper _module) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 8;BA.debugLine="Public Sub Initialize(Module As Activity)";
 //BA.debugLineNum = 10;BA.debugLine="pnl.Initialize(\"\")";
_vvvvvvvvv2.Initialize(ba,"");
 //BA.debugLineNum = 11;BA.debugLine="Module.AddView(pnl,0,0,100%x,100%y)";
_module.AddView((android.view.View)(_vvvvvvvvv2.getObject()),(int) (0),(int) (0),__c.PerXToCurrent((float) (100),ba),__c.PerYToCurrent((float) (100),ba));
 //BA.debugLineNum = 12;BA.debugLine="pnl.LoadLayout(\"frmloading\")";
_vvvvvvvvv2.LoadLayout("frmloading",ba);
 //BA.debugLineNum = 13;BA.debugLine="pnl.Visible = False";
_vvvvvvvvv2.setVisible(__c.False);
 //BA.debugLineNum = 15;BA.debugLine="End Sub";
return "";
}
public String  _vvvvvvvvv1(String _message) throws Exception{
 //BA.debugLineNum = 17;BA.debugLine="Sub ShowProgress(Message As String)";
 //BA.debugLineNum = 18;BA.debugLine="lblmessage.Text = Message";
_lblmessage.setText(BA.ObjectToCharSequence(_message));
 //BA.debugLineNum = 19;BA.debugLine="pnl.Visible = True";
_vvvvvvvvv2.setVisible(__c.True);
 //BA.debugLineNum = 20;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
