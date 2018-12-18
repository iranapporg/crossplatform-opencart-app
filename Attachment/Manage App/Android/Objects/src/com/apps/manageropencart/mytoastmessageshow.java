package com.apps.manageropencart;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class mytoastmessageshow extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.manageropencart.mytoastmessageshow");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.manageropencart.mytoastmessageshow.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.objects.PanelWrapper _vvvvvvvvv4 = null;
public anywheresoftware.b4a.objects.Timer _vvvvvvvvv5 = null;
public anywheresoftware.b4a.objects.LabelWrapper _vvvvvvvvv6 = null;
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
 //BA.debugLineNum = 3;BA.debugLine="Private p1 As Panel";
_vvvvvvvvv4 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 4;BA.debugLine="Private timerDelay As Timer";
_vvvvvvvvv5 = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 5;BA.debugLine="Private lbl As Label";
_vvvvvvvvv6 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 6;BA.debugLine="End Sub";
return "";
}
public String  _initialize(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.PanelWrapper _panel1) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 9;BA.debugLine="Public Sub Initialize(Panel1 As Panel)";
 //BA.debugLineNum = 11;BA.debugLine="p1.Initialize(\"\")";
_vvvvvvvvv4.Initialize(ba,"");
 //BA.debugLineNum = 12;BA.debugLine="Panel1.AddView(p1,0,-54dip,Panel1.Width,54dip)";
_panel1.AddView((android.view.View)(_vvvvvvvvv4.getObject()),(int) (0),(int) (-__c.DipToCurrent((int) (54))),_panel1.getWidth(),__c.DipToCurrent((int) (54)));
 //BA.debugLineNum = 13;BA.debugLine="p1.Color = Colors.White";
_vvvvvvvvv4.setColor(__c.Colors.White);
 //BA.debugLineNum = 15;BA.debugLine="lbl.Initialize(\"lblstop\")";
_vvvvvvvvv6.Initialize(ba,"lblstop");
 //BA.debugLineNum = 16;BA.debugLine="lbl.TextColor = Colors.White";
_vvvvvvvvv6.setTextColor(__c.Colors.White);
 //BA.debugLineNum = 17;BA.debugLine="lbl.Typeface = Typeface.LoadFromAssets(\"iran sans";
_vvvvvvvvv6.setTypeface(__c.Typeface.LoadFromAssets("iran sans.ttf"));
 //BA.debugLineNum = 18;BA.debugLine="lbl.TextSize = 11";
_vvvvvvvvv6.setTextSize((float) (11));
 //BA.debugLineNum = 19;BA.debugLine="lbl.Gravity = Library.GetStringResourse(\"directio";
_vvvvvvvvv6.setGravity((int)(Double.parseDouble(_vvvvvvv6._vvvv2(ba,"direction"))));
 //BA.debugLineNum = 20;BA.debugLine="p1.Color = Colors.Red";
_vvvvvvvvv4.setColor(__c.Colors.Red);
 //BA.debugLineNum = 21;BA.debugLine="p1.AddView(lbl,40,0,p1.Width-40,p1.Height)";
_vvvvvvvvv4.AddView((android.view.View)(_vvvvvvvvv6.getObject()),(int) (40),(int) (0),(int) (_vvvvvvvvv4.getWidth()-40),_vvvvvvvvv4.getHeight());
 //BA.debugLineNum = 23;BA.debugLine="End Sub";
return "";
}
public String  _lblstop_click() throws Exception{
 //BA.debugLineNum = 51;BA.debugLine="Private Sub lblstop_Click";
 //BA.debugLineNum = 52;BA.debugLine="timerdelay_Tick";
_timerdelay_tick();
 //BA.debugLineNum = 53;BA.debugLine="End Sub";
return "";
}
public String  _vvvvvvvvv3(String _message,long _delay,boolean _issuccess) throws Exception{
 //BA.debugLineNum = 26;BA.debugLine="Public Sub ShowToastMessageShow(Message As String,";
 //BA.debugLineNum = 28;BA.debugLine="lbl.Text = \"  \" & Message";
_vvvvvvvvv6.setText(BA.ObjectToCharSequence("  "+_message));
 //BA.debugLineNum = 30;BA.debugLine="If IsSuccess Then";
if (_issuccess) { 
 //BA.debugLineNum = 31;BA.debugLine="p1.Color =Colors.RGB(0, 207, 187)";
_vvvvvvvvv4.setColor(__c.Colors.RGB((int) (0),(int) (207),(int) (187)));
 }else {
 //BA.debugLineNum = 33;BA.debugLine="p1.Color = Colors.RGB(184, 62, 31)";
_vvvvvvvvv4.setColor(__c.Colors.RGB((int) (184),(int) (62),(int) (31)));
 };
 //BA.debugLineNum = 36;BA.debugLine="p1.Top = -p1.Height";
_vvvvvvvvv4.setTop((int) (-_vvvvvvvvv4.getHeight()));
 //BA.debugLineNum = 37;BA.debugLine="p1.SetLayoutAnimated(600,0,0,p1.Width,p1.Height)";
_vvvvvvvvv4.SetLayoutAnimated((int) (600),(int) (0),(int) (0),_vvvvvvvvv4.getWidth(),_vvvvvvvvv4.getHeight());
 //BA.debugLineNum = 38;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 40;BA.debugLine="timerDelay.Initialize(\"timerdelay\",1900)";
_vvvvvvvvv5.Initialize(ba,"timerdelay",(long) (1900));
 //BA.debugLineNum = 41;BA.debugLine="timerDelay.Enabled = True";
_vvvvvvvvv5.setEnabled(__c.True);
 //BA.debugLineNum = 43;BA.debugLine="End Sub";
return "";
}
public String  _timerdelay_tick() throws Exception{
 //BA.debugLineNum = 45;BA.debugLine="Private Sub timerdelay_Tick";
 //BA.debugLineNum = 46;BA.debugLine="p1.SetLayoutAnimated(600,0,-p1.Height,p1.Width,p1";
_vvvvvvvvv4.SetLayoutAnimated((int) (600),(int) (0),(int) (-_vvvvvvvvv4.getHeight()),_vvvvvvvvv4.getWidth(),_vvvvvvvvv4.getHeight());
 //BA.debugLineNum = 47;BA.debugLine="timerDelay.Enabled = False";
_vvvvvvvvv5.setEnabled(__c.False);
 //BA.debugLineNum = 48;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 49;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
