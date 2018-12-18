package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class customlistview extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.demo.customlistview");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.demo.customlistview.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv = null;
public anywheresoftware.b4a.objects.collections.List _items = null;
public anywheresoftware.b4a.objects.collections.List _panels = null;
public float _dividerheight = 0f;
public Object _presseddrawable = null;
public String _eventname = "";
public Object _callback = null;
public anywheresoftware.b4a.objects.StringUtils _su = null;
public int _defaulttextsize = 0;
public int _defaulttextcolor = 0;
public int _defaulttextbackgroundcolor = 0;
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
public String  _add(anywheresoftware.b4a.objects.PanelWrapper _pnl,int _itemheight,Object _value) throws Exception{
 //BA.debugLineNum = 155;BA.debugLine="Public Sub Add(Pnl As Panel, ItemHeight As Int, Va";
 //BA.debugLineNum = 156;BA.debugLine="InsertAt(items.Size, Pnl, ItemHeight, Value)";
_insertat(_items.getSize(),_pnl,_itemheight,_value);
 //BA.debugLineNum = 157;BA.debugLine="End Sub";
return "";
}
public String  _addtextitem(String _text,Object _value) throws Exception{
 //BA.debugLineNum = 84;BA.debugLine="Public Sub AddTextItem(Text As String, Value As Ob";
 //BA.debugLineNum = 85;BA.debugLine="InsertAtTextItem(items.Size, Text, Value)";
_insertattextitem(_items.getSize(),_text,_value);
 //BA.debugLineNum = 86;BA.debugLine="End Sub";
return "";
}
public anywheresoftware.b4a.objects.ConcreteViewWrapper  _asview() throws Exception{
 //BA.debugLineNum = 47;BA.debugLine="Public Sub AsView As View";
 //BA.debugLineNum = 48;BA.debugLine="Return sv";
if (true) return (anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_sv.getObject()));
 //BA.debugLineNum = 49;BA.debugLine="End Sub";
return null;
}
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private sv As ScrollView";
_sv = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 4;BA.debugLine="Private items As List";
_items = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 5;BA.debugLine="Private panels As List";
_panels = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 6;BA.debugLine="Private dividerHeight As Float";
_dividerheight = 0f;
 //BA.debugLineNum = 7;BA.debugLine="Private pressedDrawable As Object";
_presseddrawable = new Object();
 //BA.debugLineNum = 8;BA.debugLine="Private EventName As String";
_eventname = "";
 //BA.debugLineNum = 9;BA.debugLine="Private CallBack As Object";
_callback = new Object();
 //BA.debugLineNum = 10;BA.debugLine="Private su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 11;BA.debugLine="Public DefaultTextSize As Int";
_defaulttextsize = 0;
 //BA.debugLineNum = 12;BA.debugLine="Public DefaultTextColor As Int";
_defaulttextcolor = 0;
 //BA.debugLineNum = 13;BA.debugLine="Public DefaultTextBackgroundColor As Int";
_defaulttextbackgroundcolor = 0;
 //BA.debugLineNum = 14;BA.debugLine="End Sub";
return "";
}
public String  _clear() throws Exception{
int _i = 0;
 //BA.debugLineNum = 37;BA.debugLine="Public Sub Clear";
 //BA.debugLineNum = 38;BA.debugLine="items.Clear";
_items.Clear();
 //BA.debugLineNum = 39;BA.debugLine="panels.Clear";
_panels.Clear();
 //BA.debugLineNum = 40;BA.debugLine="sv.Panel.Height = 0";
_sv.getPanel().setHeight((int) (0));
 //BA.debugLineNum = 41;BA.debugLine="For i = sv.Panel.NumberOfViews - 1 To 0 Step -1";
{
final int step4 = (int) (-1);
final int limit4 = (int) (0);
for (_i = (int) (_sv.getPanel().getNumberOfViews()-1) ; (step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4); _i = ((int)(0 + _i + step4)) ) {
 //BA.debugLineNum = 42;BA.debugLine="sv.Panel.RemoveViewAt(i)";
_sv.getPanel().RemoveViewAt(_i);
 }
};
 //BA.debugLineNum = 44;BA.debugLine="End Sub";
return "";
}
public String  _getitemfromview(anywheresoftware.b4a.objects.ConcreteViewWrapper _v) throws Exception{
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
Object _parent = null;
Object _current = null;
 //BA.debugLineNum = 183;BA.debugLine="Public Sub GetItemFromView(v As View)";
 //BA.debugLineNum = 184;BA.debugLine="Dim r As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 185;BA.debugLine="Dim parent, current As Object";
_parent = new Object();
_current = new Object();
 //BA.debugLineNum = 186;BA.debugLine="parent = v";
_parent = (Object)(_v.getObject());
 //BA.debugLineNum = 187;BA.debugLine="Do While (parent Is Panel) = False OR sv.Panel <>";
while ((_parent instanceof android.view.ViewGroup)==__c.False || (_sv.getPanel()).equals((android.view.ViewGroup)(_parent)) == false) {
 //BA.debugLineNum = 188;BA.debugLine="current = parent";
_current = _parent;
 //BA.debugLineNum = 189;BA.debugLine="r.Target = current";
_r.Target = _current;
 //BA.debugLineNum = 190;BA.debugLine="parent = r.RunMethod(\"getParent\")";
_parent = _r.RunMethod("getParent");
 }
;
 //BA.debugLineNum = 192;BA.debugLine="v = current";
_v.setObject((android.view.View)(_current));
 //BA.debugLineNum = 193;BA.debugLine="Return v.Tag";
if (true) return BA.ObjectToString(_v.getTag());
 //BA.debugLineNum = 194;BA.debugLine="End Sub";
return "";
}
public anywheresoftware.b4a.objects.PanelWrapper  _getpanel(int _index) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p = null;
 //BA.debugLineNum = 57;BA.debugLine="Public Sub GetPanel(Index As Int) As Panel";
 //BA.debugLineNum = 58;BA.debugLine="Dim p As Panel";
_p = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 59;BA.debugLine="p = panels.Get(Index) 'this is the parent panel";
_p.setObject((android.view.ViewGroup)(_panels.Get(_index)));
 //BA.debugLineNum = 60;BA.debugLine="Return p.GetView(0)";
if (true) return (anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(_p.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 61;BA.debugLine="End Sub";
return null;
}
public int  _getsize() throws Exception{
 //BA.debugLineNum = 52;BA.debugLine="Public Sub GetSize As Int";
 //BA.debugLineNum = 53;BA.debugLine="Return items.Size";
if (true) return _items.getSize();
 //BA.debugLineNum = 54;BA.debugLine="End Sub";
return 0;
}
public Object  _getvalue(int _index) throws Exception{
 //BA.debugLineNum = 64;BA.debugLine="Public Sub GetValue(Index As Int) As Object";
 //BA.debugLineNum = 65;BA.debugLine="Return items.Get(Index)";
if (true) return _items.Get(_index);
 //BA.debugLineNum = 66;BA.debugLine="End Sub";
return null;
}
public String  _initialize(anywheresoftware.b4a.BA _ba,Object _vcallback,String _veventname) throws Exception{
innerInitialize(_ba);
anywheresoftware.b4a.agraham.reflection.Reflection _r = null;
int _idpressed = 0;
 //BA.debugLineNum = 17;BA.debugLine="Public Sub Initialize (vCallback As Object, vEvent";
 //BA.debugLineNum = 18;BA.debugLine="sv.Initialize2(0, \"sv\")";
_sv.Initialize2(ba,(int) (0),"sv");
 //BA.debugLineNum = 19;BA.debugLine="items.Initialize";
_items.Initialize();
 //BA.debugLineNum = 20;BA.debugLine="panels.Initialize";
_panels.Initialize();
 //BA.debugLineNum = 21;BA.debugLine="dividerHeight = 2dip";
_dividerheight = (float) (__c.DipToCurrent((int) (2)));
 //BA.debugLineNum = 22;BA.debugLine="EventName = vEventName";
_eventname = _veventname;
 //BA.debugLineNum = 23;BA.debugLine="CallBack = vCallback";
_callback = _vcallback;
 //BA.debugLineNum = 24;BA.debugLine="sv.Color = 0xFFD9D7DE 'this sets the dividers col";
_sv.setColor((int) (0xffd9d7de));
 //BA.debugLineNum = 25;BA.debugLine="Dim r As Reflector";
_r = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 26;BA.debugLine="Dim idPressed As Int";
_idpressed = 0;
 //BA.debugLineNum = 27;BA.debugLine="idPressed = r.GetStaticField(\"android.R$drawab";
_idpressed = (int)(BA.ObjectToNumber(_r.GetStaticField("android.R$drawable","list_selector_background")));
 //BA.debugLineNum = 28;BA.debugLine="r.Target = r.GetContext";
_r.Target = (Object)(_r.GetContext(ba));
 //BA.debugLineNum = 29;BA.debugLine="r.Target = r.RunMethod(\"getResources\")";
_r.Target = _r.RunMethod("getResources");
 //BA.debugLineNum = 30;BA.debugLine="pressedDrawable = r.RunMethod2(\"getDrawable\", idP";
_presseddrawable = _r.RunMethod2("getDrawable",BA.NumberToString(_idpressed),"java.lang.int");
 //BA.debugLineNum = 31;BA.debugLine="DefaultTextColor = Colors.White";
_defaulttextcolor = __c.Colors.White;
 //BA.debugLineNum = 32;BA.debugLine="DefaultTextSize = 16";
_defaulttextsize = (int) (16);
 //BA.debugLineNum = 33;BA.debugLine="DefaultTextBackgroundColor = Colors.Black";
_defaulttextbackgroundcolor = __c.Colors.Black;
 //BA.debugLineNum = 34;BA.debugLine="End Sub";
return "";
}
public String  _insertat(int _index,anywheresoftware.b4a.objects.PanelWrapper _pnl,int _itemheight,Object _value) throws Exception{
anywheresoftware.b4a.objects.drawable.StateListDrawable _sd = null;
anywheresoftware.b4a.objects.PanelWrapper _p = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
int _top = 0;
anywheresoftware.b4a.objects.PanelWrapper _previouspanel = null;
anywheresoftware.b4a.objects.PanelWrapper _p2 = null;
int _i = 0;
 //BA.debugLineNum = 107;BA.debugLine="Public Sub InsertAt(Index As Int, Pnl As Panel, It";
 //BA.debugLineNum = 109;BA.debugLine="Dim sd As StateListDrawable";
_sd = new anywheresoftware.b4a.objects.drawable.StateListDrawable();
 //BA.debugLineNum = 110;BA.debugLine="sd.Initialize";
_sd.Initialize();
 //BA.debugLineNum = 111;BA.debugLine="sd.AddState(sd.State_Pressed, pressedDrawable)";
_sd.AddState(_sd.State_Pressed,(android.graphics.drawable.Drawable)(_presseddrawable));
 //BA.debugLineNum = 112;BA.debugLine="sd.AddCatchAllState(Pnl.Background)";
_sd.AddCatchAllState(_pnl.getBackground());
 //BA.debugLineNum = 115;BA.debugLine="Dim p As Panel";
_p = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 116;BA.debugLine="p.Initialize(\"panel\")";
_p.Initialize(ba,"panel");
 //BA.debugLineNum = 117;BA.debugLine="p.Background = sd";
_p.setBackground((android.graphics.drawable.Drawable)(_sd.getObject()));
 //BA.debugLineNum = 118;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 119;BA.debugLine="cd.Initialize(Colors.Transparent, 0)";
_cd.Initialize(__c.Colors.Transparent,(int) (0));
 //BA.debugLineNum = 120;BA.debugLine="Pnl.Background = cd";
_pnl.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 121;BA.debugLine="p.AddView(Pnl, 0, 0, sv.Width, ItemHeight)";
_p.AddView((android.view.View)(_pnl.getObject()),(int) (0),(int) (0),_sv.getWidth(),_itemheight);
 //BA.debugLineNum = 122;BA.debugLine="p.Tag = Index";
_p.setTag((Object)(_index));
 //BA.debugLineNum = 124;BA.debugLine="If Index = items.Size Then";
if (_index==_items.getSize()) { 
 //BA.debugLineNum = 125;BA.debugLine="items.Add(Value)";
_items.Add(_value);
 //BA.debugLineNum = 126;BA.debugLine="panels.Add(p)";
_panels.Add((Object)(_p.getObject()));
 //BA.debugLineNum = 127;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 128;BA.debugLine="If Index = 0 Then top = dividerHeight Else top =";
if (_index==0) { 
_top = (int) (_dividerheight);}
else {
_top = _sv.getPanel().getHeight();};
 //BA.debugLineNum = 129;BA.debugLine="sv.Panel.AddView(p, 0, top, sv.Width, ItemHeight";
_sv.getPanel().AddView((android.view.View)(_p.getObject()),(int) (0),_top,_sv.getWidth(),_itemheight);
 }else {
 //BA.debugLineNum = 131;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 132;BA.debugLine="If Index = 0 Then";
if (_index==0) { 
 //BA.debugLineNum = 133;BA.debugLine="top = dividerHeight";
_top = (int) (_dividerheight);
 }else {
 //BA.debugLineNum = 135;BA.debugLine="Dim previousPanel As Panel";
_previouspanel = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 136;BA.debugLine="previousPanel = panels.Get(Index - 1)";
_previouspanel.setObject((android.view.ViewGroup)(_panels.Get((int) (_index-1))));
 //BA.debugLineNum = 137;BA.debugLine="top = previousPanel.top + previousPanel.Height";
_top = (int) (_previouspanel.getTop()+_previouspanel.getHeight()+_dividerheight);
 };
 //BA.debugLineNum = 140;BA.debugLine="Dim p2 As Panel";
_p2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 141;BA.debugLine="For i = Index To panels.Size - 1";
{
final int step29 = 1;
final int limit29 = (int) (_panels.getSize()-1);
for (_i = _index ; (step29 > 0 && _i <= limit29) || (step29 < 0 && _i >= limit29); _i = ((int)(0 + _i + step29)) ) {
 //BA.debugLineNum = 142;BA.debugLine="p2 = panels.Get(i)";
_p2.setObject((android.view.ViewGroup)(_panels.Get(_i)));
 //BA.debugLineNum = 143;BA.debugLine="p2.top = p2.top + ItemHeight + dividerHeight";
_p2.setTop((int) (_p2.getTop()+_itemheight+_dividerheight));
 //BA.debugLineNum = 144;BA.debugLine="p2.Tag = i + 1";
_p2.setTag((Object)(_i+1));
 }
};
 //BA.debugLineNum = 146;BA.debugLine="items.InsertAt(Index, Value)";
_items.InsertAt(_index,_value);
 //BA.debugLineNum = 147;BA.debugLine="panels.InsertAt(Index, p)";
_panels.InsertAt(_index,(Object)(_p.getObject()));
 //BA.debugLineNum = 148;BA.debugLine="sv.Panel.AddView(p, 0, top, sv.Width, ItemHeight";
_sv.getPanel().AddView((android.view.View)(_p.getObject()),(int) (0),_top,_sv.getWidth(),_itemheight);
 };
 //BA.debugLineNum = 150;BA.debugLine="sv.Panel.Height = sv.Panel.Height + ItemHeight +";
_sv.getPanel().setHeight((int) (_sv.getPanel().getHeight()+_itemheight+_dividerheight));
 //BA.debugLineNum = 151;BA.debugLine="If items.Size = 1 Then sv.Panel.Height = sv.Panel";
if (_items.getSize()==1) { 
_sv.getPanel().setHeight((int) (_sv.getPanel().getHeight()+_dividerheight));};
 //BA.debugLineNum = 152;BA.debugLine="End Sub";
return "";
}
public String  _insertattextitem(int _index,String _text,Object _value) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _pnl = null;
anywheresoftware.b4a.objects.LabelWrapper _lbl = null;
int _minheight = 0;
 //BA.debugLineNum = 89;BA.debugLine="Public Sub InsertAtTextItem(Index As Int, Text As";
 //BA.debugLineNum = 90;BA.debugLine="Dim pnl As Panel";
_pnl = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 91;BA.debugLine="pnl.Initialize(\"\")";
_pnl.Initialize(ba,"");
 //BA.debugLineNum = 92;BA.debugLine="Dim lbl As Label";
_lbl = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 93;BA.debugLine="lbl.Initialize(\"\")";
_lbl.Initialize(ba,"");
 //BA.debugLineNum = 94;BA.debugLine="lbl.Gravity = Bit.OR(Gravity.CENTER_VERTICAL, Gra";
_lbl.setGravity(__c.Bit.Or(__c.Gravity.CENTER_VERTICAL,__c.Gravity.LEFT));
 //BA.debugLineNum = 95;BA.debugLine="pnl.AddView(lbl, 5dip, 2dip, sv.Width - 5dip, 20d";
_pnl.AddView((android.view.View)(_lbl.getObject()),__c.DipToCurrent((int) (5)),__c.DipToCurrent((int) (2)),(int) (_sv.getWidth()-__c.DipToCurrent((int) (5))),__c.DipToCurrent((int) (20)));
 //BA.debugLineNum = 96;BA.debugLine="lbl.Text = Text";
_lbl.setText(BA.ObjectToCharSequence(_text));
 //BA.debugLineNum = 97;BA.debugLine="lbl.TextSize = DefaultTextSize";
_lbl.setTextSize((float) (_defaulttextsize));
 //BA.debugLineNum = 98;BA.debugLine="lbl.TextColor = DefaultTextColor";
_lbl.setTextColor(_defaulttextcolor);
 //BA.debugLineNum = 99;BA.debugLine="pnl.Color = DefaultTextBackgroundColor";
_pnl.setColor(_defaulttextbackgroundcolor);
 //BA.debugLineNum = 100;BA.debugLine="Dim minHeight As Int";
_minheight = 0;
 //BA.debugLineNum = 101;BA.debugLine="minHeight = su.MeasureMultilineTextHeight(lbl, Te";
_minheight = _su.MeasureMultilineTextHeight((android.widget.TextView)(_lbl.getObject()),BA.ObjectToCharSequence(_text));
 //BA.debugLineNum = 102;BA.debugLine="lbl.Height = Max(50dip, minHeight)";
_lbl.setHeight((int) (__c.Max(__c.DipToCurrent((int) (50)),_minheight)));
 //BA.debugLineNum = 103;BA.debugLine="InsertAt(Index, pnl, lbl.Height + 2dip, Value)";
_insertat(_index,_pnl,(int) (_lbl.getHeight()+__c.DipToCurrent((int) (2))),_value);
 //BA.debugLineNum = 104;BA.debugLine="End Sub";
return "";
}
public String  _jumptoitem(int _index) throws Exception{
int _top = 0;
anywheresoftware.b4a.objects.PanelWrapper _p = null;
int _i = 0;
 //BA.debugLineNum = 160;BA.debugLine="Public Sub JumpToItem(Index As Int)";
 //BA.debugLineNum = 161;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 162;BA.debugLine="Dim p As Panel";
_p = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 163;BA.debugLine="For i = 0 To Min(Index - 1, items.Size - 1)";
{
final int step3 = 1;
final int limit3 = (int) (__c.Min(_index-1,_items.getSize()-1));
for (_i = (int) (0) ; (step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3); _i = ((int)(0 + _i + step3)) ) {
 //BA.debugLineNum = 164;BA.debugLine="p = panels.Get(i)";
_p.setObject((android.view.ViewGroup)(_panels.Get(_i)));
 //BA.debugLineNum = 165;BA.debugLine="top = top + p.Height + dividerHeight";
_top = (int) (_top+_p.getHeight()+_dividerheight);
 }
};
 //BA.debugLineNum = 167;BA.debugLine="sv.ScrollPosition = top";
_sv.setScrollPosition(_top);
 //BA.debugLineNum = 169;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 170;BA.debugLine="sv.ScrollPosition = top";
_sv.setScrollPosition(_top);
 //BA.debugLineNum = 171;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 172;BA.debugLine="End Sub";
return "";
}
public String  _panel_click() throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v = null;
 //BA.debugLineNum = 174;BA.debugLine="Private Sub Panel_Click";
 //BA.debugLineNum = 175;BA.debugLine="If SubExists(CallBack, EventName & \"_ItemClick\")";
if (__c.SubExists(ba,_callback,_eventname+"_ItemClick")) { 
 //BA.debugLineNum = 176;BA.debugLine="Dim v As View";
_v = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 177;BA.debugLine="v = Sender";
_v.setObject((android.view.View)(__c.Sender(ba)));
 //BA.debugLineNum = 178;BA.debugLine="CallSub3(CallBack, EventName & \"_ItemClick\", v.T";
__c.CallSubNew3(ba,_callback,_eventname+"_ItemClick",_v.getTag(),_items.Get((int)(BA.ObjectToNumber(_v.getTag()))));
 };
 //BA.debugLineNum = 180;BA.debugLine="End Sub";
return "";
}
public String  _removeat(int _index) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _removepanel = null;
anywheresoftware.b4a.objects.PanelWrapper _p = null;
int _i = 0;
 //BA.debugLineNum = 69;BA.debugLine="Public Sub RemoveAt(Index As Int)";
 //BA.debugLineNum = 70;BA.debugLine="Dim removePanel, p As Panel";
_removepanel = new anywheresoftware.b4a.objects.PanelWrapper();
_p = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 71;BA.debugLine="removePanel = panels.Get(Index)";
_removepanel.setObject((android.view.ViewGroup)(_panels.Get(_index)));
 //BA.debugLineNum = 72;BA.debugLine="For i = Index + 1 To items.Size - 1";
{
final int step3 = 1;
final int limit3 = (int) (_items.getSize()-1);
for (_i = (int) (_index+1) ; (step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3); _i = ((int)(0 + _i + step3)) ) {
 //BA.debugLineNum = 73;BA.debugLine="p = panels.Get(i)";
_p.setObject((android.view.ViewGroup)(_panels.Get(_i)));
 //BA.debugLineNum = 74;BA.debugLine="p.Tag = i - 1";
_p.setTag((Object)(_i-1));
 //BA.debugLineNum = 75;BA.debugLine="p.Top = p.Top - removePanel.Height - dividerHeig";
_p.setTop((int) (_p.getTop()-_removepanel.getHeight()-_dividerheight));
 }
};
 //BA.debugLineNum = 77;BA.debugLine="sv.Panel.Height = sv.Panel.Height - removePanel.H";
_sv.getPanel().setHeight((int) (_sv.getPanel().getHeight()-_removepanel.getHeight()-_dividerheight));
 //BA.debugLineNum = 78;BA.debugLine="items.RemoveAt(Index)";
_items.RemoveAt(_index);
 //BA.debugLineNum = 79;BA.debugLine="panels.RemoveAt(Index)";
_panels.RemoveAt(_index);
 //BA.debugLineNum = 80;BA.debugLine="removePanel.RemoveView";
_removepanel.RemoveView();
 //BA.debugLineNum = 81;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
