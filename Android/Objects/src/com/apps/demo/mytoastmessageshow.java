package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class mytoastmessageshow extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.demo.mytoastmessageshow");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.demo.mytoastmessageshow.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
public anywheresoftware.b4a.objects.Timer _timerdelay = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbl = null;
public anywheresoftware.b4a.objects.LabelWrapper _bullet = null;
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
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Private Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 4;BA.debugLine="Private timerDelay As Timer";
_timerdelay = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 5;BA.debugLine="Private lbl,bullet As Label";
_lbl = new anywheresoftware.b4a.objects.LabelWrapper();
_bullet = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 6;BA.debugLine="End Sub";
return "";
}
public String  _initialize(anywheresoftware.b4a.BA _ba,anywheresoftware.b4a.objects.PanelWrapper _panel1) throws Exception{
innerInitialize(_ba);
 //BA.debugLineNum = 9;BA.debugLine="Public Sub Initialize(Panel1 As Panel)";
 //BA.debugLineNum = 11;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(ba,"");
 //BA.debugLineNum = 12;BA.debugLine="Panel1.AddView(p1,0,-54dip,Panel1.Width,54dip)";
_panel1.AddView((android.view.View)(_p1.getObject()),(int) (0),(int) (-__c.DipToCurrent((int) (54))),_panel1.getWidth(),__c.DipToCurrent((int) (54)));
 //BA.debugLineNum = 13;BA.debugLine="p1.Color = Colors.White";
_p1.setColor(__c.Colors.White);
 //BA.debugLineNum = 15;BA.debugLine="lbl.Initialize(\"lblstop\")";
_lbl.Initialize(ba,"lblstop");
 //BA.debugLineNum = 16;BA.debugLine="bullet.Initialize(\"\")";
_bullet.Initialize(ba,"");
 //BA.debugLineNum = 17;BA.debugLine="bullet.TextColor = Library.ConvertHex2Int(Library";
_bullet.setTextColor((int)(Double.parseDouble(_library._converthex2int(ba,_library._getstringresourse(ba,"toastshow_textcolor")))));
 //BA.debugLineNum = 18;BA.debugLine="lbl.TextColor = Library.ConvertHex2Int(Library.Ge";
_lbl.setTextColor((int)(Double.parseDouble(_library._converthex2int(ba,_library._getstringresourse(ba,"toastshow_textcolor")))));
 //BA.debugLineNum = 19;BA.debugLine="bullet.Typeface = Typeface.LoadFromAssets(\"icomoo";
_bullet.setTypeface(__c.Typeface.LoadFromAssets("icomoon.ttf"));
 //BA.debugLineNum = 20;BA.debugLine="bullet.Text = \"\"";
_bullet.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 21;BA.debugLine="lbl.Typeface = Library.GetFont";
_lbl.setTypeface((android.graphics.Typeface)(_library._getfont(ba).getObject()));
 //BA.debugLineNum = 22;BA.debugLine="lbl.TextSize = 12";
_lbl.setTextSize((float) (12));
 //BA.debugLineNum = 23;BA.debugLine="bullet.TextSize = 14";
_bullet.setTextSize((float) (14));
 //BA.debugLineNum = 25;BA.debugLine="p1.Color = Library.ConvertHex2Int(Library.GetStri";
_p1.setColor((int)(Double.parseDouble(_library._converthex2int(ba,_library._getstringresourse(ba,"toastshow_color")))));
 //BA.debugLineNum = 27;BA.debugLine="If Library.IsPersian Then";
if (_library._ispersian(ba)) { 
 //BA.debugLineNum = 28;BA.debugLine="lbl.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CENTE";
_lbl.setGravity(__c.Bit.Or(__c.Gravity.RIGHT,__c.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 29;BA.debugLine="bullet.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CE";
_bullet.setGravity(__c.Bit.Or(__c.Gravity.RIGHT,__c.Gravity.CENTER_VERTICAL));
 }else {
 //BA.debugLineNum = 31;BA.debugLine="lbl.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENTER";
_lbl.setGravity(__c.Bit.Or(__c.Gravity.LEFT,__c.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 32;BA.debugLine="bullet.Gravity = Bit.Or(Gravity.LEFT,Gravity.CEN";
_bullet.setGravity(__c.Bit.Or(__c.Gravity.LEFT,__c.Gravity.CENTER_VERTICAL));
 };
 //BA.debugLineNum = 35;BA.debugLine="p1.AddView(bullet,10dip,0,30dip,p1.Height)";
_p1.AddView((android.view.View)(_bullet.getObject()),__c.DipToCurrent((int) (10)),(int) (0),__c.DipToCurrent((int) (30)),_p1.getHeight());
 //BA.debugLineNum = 36;BA.debugLine="p1.AddView(lbl,40,0,p1.Width-40,p1.Height)";
_p1.AddView((android.view.View)(_lbl.getObject()),(int) (40),(int) (0),(int) (_p1.getWidth()-40),_p1.getHeight());
 //BA.debugLineNum = 38;BA.debugLine="End Sub";
return "";
}
public String  _lblstop_click() throws Exception{
 //BA.debugLineNum = 68;BA.debugLine="Private Sub lblstop_Click";
 //BA.debugLineNum = 69;BA.debugLine="timerdelay_Tick";
_timerdelay_tick();
 //BA.debugLineNum = 70;BA.debugLine="End Sub";
return "";
}
public String  _showtoastmessageshow(String _message,long _delay,boolean _issuccess) throws Exception{
 //BA.debugLineNum = 41;BA.debugLine="Public Sub ShowToastMessageShow(Message As String,";
 //BA.debugLineNum = 43;BA.debugLine="lbl.Text = \"  \" & Message";
_lbl.setText(BA.ObjectToCharSequence("  "+_message));
 //BA.debugLineNum = 45;BA.debugLine="If IsSuccess Then";
if (_issuccess) { 
 //BA.debugLineNum = 46;BA.debugLine="p1.Color = Library.ConvertHex2Int(Library.GetStr";
_p1.setColor((int)(Double.parseDouble(_library._converthex2int(ba,_library._getstringresourse(ba,"toastshow_success")))));
 //BA.debugLineNum = 47;BA.debugLine="bullet.Text = \"\"";
_bullet.setText(BA.ObjectToCharSequence(""));
 }else {
 //BA.debugLineNum = 49;BA.debugLine="p1.Color = Library.ConvertHex2Int(Library.GetStr";
_p1.setColor((int)(Double.parseDouble(_library._converthex2int(ba,_library._getstringresourse(ba,"toastshow_color")))));
 //BA.debugLineNum = 50;BA.debugLine="bullet.Text = \"\"";
_bullet.setText(BA.ObjectToCharSequence(""));
 };
 //BA.debugLineNum = 53;BA.debugLine="p1.Top = -p1.Height";
_p1.setTop((int) (-_p1.getHeight()));
 //BA.debugLineNum = 54;BA.debugLine="p1.SetLayoutAnimated(600,0,0,p1.Width,p1.Height)";
_p1.SetLayoutAnimated((int) (600),(int) (0),(int) (0),_p1.getWidth(),_p1.getHeight());
 //BA.debugLineNum = 55;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 57;BA.debugLine="timerDelay.Initialize(\"timerdelay\",Library.GetStr";
_timerdelay.Initialize(ba,"timerdelay",(long) ((double)(Double.parseDouble(_library._getstringresourse(ba,"toastshow_delay")))*1000));
 //BA.debugLineNum = 58;BA.debugLine="timerDelay.Enabled = True";
_timerdelay.setEnabled(__c.True);
 //BA.debugLineNum = 60;BA.debugLine="End Sub";
return "";
}
public String  _timerdelay_tick() throws Exception{
 //BA.debugLineNum = 62;BA.debugLine="Private Sub timerdelay_Tick";
 //BA.debugLineNum = 63;BA.debugLine="p1.SetLayoutAnimated(600,0,-p1.Height,p1.Width,p1";
_p1.SetLayoutAnimated((int) (600),(int) (0),(int) (-_p1.getHeight()),_p1.getWidth(),_p1.getHeight());
 //BA.debugLineNum = 64;BA.debugLine="timerDelay.Enabled = False";
_timerdelay.setEnabled(__c.False);
 //BA.debugLineNum = 65;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 66;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
