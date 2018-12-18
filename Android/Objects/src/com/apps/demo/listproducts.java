package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.B4AClass;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.debug.*;

public class listproducts extends B4AClass.ImplB4AClass implements BA.SubDelegator{
    private static java.util.HashMap<String, java.lang.reflect.Method> htSubs;
    private void innerInitialize(BA _ba) throws Exception {
        if (ba == null) {
            ba = new BA(_ba, this, htSubs, "com.apps.demo.listproducts");
            if (htSubs == null) {
                ba.loadHtSubs(this.getClass());
                htSubs = ba.htSubs;
            }
            
        }
        if (BA.isShellModeRuntimeCheck(ba)) 
			   this.getClass().getMethod("_class_globals", com.apps.demo.listproducts.class).invoke(this, new Object[] {null});
        else
            ba.raiseEvent2(null, true, "class_globals", false);
    }

 public anywheresoftware.b4a.keywords.Common __c = null;
public anywheresoftware.b4a.agraham.threading.Threading _thread1 = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _scrollview1 = null;
public int _top = 0;
public int _left = 0;
public int[] _dimension = null;
public int _defaulttop = 0;
public int _countitem = 0;
public int _allspace = 0;
public int _spaceunit = 0;
public anywheresoftware.b4a.objects.collections.Map _images = null;
public ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
public Object _smodule = null;
public String _sev = "";
public anywheresoftware.b4a.objects.collections.List _res = null;
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
public String  _addpanel(Object _tem,Object _j) throws Exception{
anywheresoftware.b4a.objects.collections.Map _temp = null;
int _i = 0;
anywheresoftware.b4a.objects.PanelWrapper _pa = null;
anywheresoftware.b4a.objects.ImageViewWrapper _imgtemp = null;
anywheresoftware.b4a.objects.ButtonWrapper _btncart = null;
anywheresoftware.b4a.objects.LabelWrapper _templabel = null;
anywheresoftware.b4a.objects.LabelWrapper _labelprice = null;
anywheresoftware.b4a.objects.PanelWrapper _temppanel = null;
anywheresoftware.b4a.objects.PanelWrapper _parentpanel = null;
String _price = "";
String _special = "";
String _pathimage = "";
 //BA.debugLineNum = 63;BA.debugLine="Sub AddPanel(Tem As Object,j As Object)";
 //BA.debugLineNum = 65;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 66;BA.debugLine="temp = Tem";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_tem));
 //BA.debugLineNum = 68;BA.debugLine="Dim i As Int";
_i = 0;
 //BA.debugLineNum = 69;BA.debugLine="i = j";
_i = (int)(BA.ObjectToNumber(_j));
 //BA.debugLineNum = 71;BA.debugLine="Dim pa As Panel";
_pa = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 72;BA.debugLine="pa.Initialize(\"\")";
_pa.Initialize(ba,"");
 //BA.debugLineNum = 73;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,Top,ScrollView1";
_scrollview1.getPanel().AddView((android.view.View)(_pa.getObject()),_left,_top,_scrollview1.getWidth(),(int) (0));
 //BA.debugLineNum = 74;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
_pa.LoadLayout("frmproduct_template",ba);
 //BA.debugLineNum = 75;BA.debugLine="pa.Height = Dimension(1)";
_pa.setHeight(_dimension[(int) (1)]);
 //BA.debugLineNum = 76;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 79;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 80;BA.debugLine="Dim btncart As Button";
_btncart = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 81;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = new anywheresoftware.b4a.objects.LabelWrapper();
_labelprice = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 82;BA.debugLine="Dim TempPanel As Panel";
_temppanel = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 83;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 84;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = new anywheresoftware.b4a.objects.PanelWrapper();
_parentpanel.setObject((android.view.ViewGroup)(_pa.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 85;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 86;BA.debugLine="btncart = ParentPanel.GetView(5)";
_btncart.setObject((android.widget.Button)(_parentpanel.GetView((int) (5)).getObject()));
 //BA.debugLineNum = 87;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.setObject((android.widget.ImageView)(_parentpanel.GetView((int) (4)).getObject()));
 //BA.debugLineNum = 88;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.setObject((android.widget.TextView)(_parentpanel.GetView((int) (1)).getObject()));
 //BA.debugLineNum = 89;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.setObject((android.widget.TextView)(_parentpanel.GetView((int) (2)).getObject()));
 //BA.debugLineNum = 90;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.setObject((android.view.ViewGroup)(_parentpanel.GetView((int) (6)).getObject()));
 //BA.debugLineNum = 91;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 93;BA.debugLine="btncart.Text = Library.GetStringResourse(\"add2car";
_btncart.setText(BA.ObjectToCharSequence(_library._getstringresourse(ba,"add2cartbtn")));
 //BA.debugLineNum = 95;BA.debugLine="Dim price,special As String";
_price = "";
_special = "";
 //BA.debugLineNum = 96;BA.debugLine="If temp.ContainsKey(\"price_formated\") Then";
if (_temp.ContainsKey((Object)("price_formated"))) { 
 //BA.debugLineNum = 97;BA.debugLine="price   = temp.Get(\"price_formated\")";
_price = BA.ObjectToString(_temp.Get((Object)("price_formated")));
 }else {
 //BA.debugLineNum = 99;BA.debugLine="price   = temp.Get(\"price\")";
_price = BA.ObjectToString(_temp.Get((Object)("price")));
 };
 //BA.debugLineNum = 101;BA.debugLine="special = temp.Get(\"special_formated\")";
_special = BA.ObjectToString(_temp.Get((Object)("special_formated")));
 //BA.debugLineNum = 102;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 103;BA.debugLine="If special = \"null\" Or special = \"false\" Then spe";
if ((_special).equals("null") || (_special).equals("false")) { 
_special = "";};
 //BA.debugLineNum = 105;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if (_price.length()>0 && _special.length()==0) { 
 //BA.debugLineNum = 106;BA.debugLine="btncart.Text = price & \" C\"";
_btncart.setText(BA.ObjectToCharSequence(_price+" C"));
 }else if(_special.length()>0) { 
 //BA.debugLineNum = 108;BA.debugLine="btncart.Text = special & \" C\"";
_btncart.setText(BA.ObjectToCharSequence(_special+" C"));
 };
 //BA.debugLineNum = 111;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 113;BA.debugLine="If temp.ContainsKey(\"id\") Then";
if (_temp.ContainsKey((Object)("id"))) { 
 //BA.debugLineNum = 114;BA.debugLine="btncart.Tag = temp.Get(\"id\")";
_btncart.setTag(_temp.Get((Object)("id")));
 }else {
 //BA.debugLineNum = 116;BA.debugLine="btncart.Tag = temp.Get(\"product_id\")";
_btncart.setTag(_temp.Get((Object)("product_id")));
 };
 //BA.debugLineNum = 119;BA.debugLine="TempLabel.Text = temp.Get(\"name\")";
_templabel.setText(BA.ObjectToCharSequence(_temp.Get((Object)("name"))));
 //BA.debugLineNum = 120;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\",";
_templabel.setText(BA.ObjectToCharSequence(_templabel.getText().replace("&quot;",__c.QUOTE).replace("&amp;","&")));
 //BA.debugLineNum = 122;BA.debugLine="Dim price,special As String";
_price = "";
_special = "";
 //BA.debugLineNum = 123;BA.debugLine="If temp.ContainsKey(\"price_formated\") Then";
if (_temp.ContainsKey((Object)("price_formated"))) { 
 //BA.debugLineNum = 124;BA.debugLine="price   = temp.Get(\"price_formated\")";
_price = BA.ObjectToString(_temp.Get((Object)("price_formated")));
 }else {
 //BA.debugLineNum = 126;BA.debugLine="price   = temp.Get(\"price\")";
_price = BA.ObjectToString(_temp.Get((Object)("price")));
 };
 //BA.debugLineNum = 129;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 131;BA.debugLine="special = temp.Get(\"special_formated\")";
_special = BA.ObjectToString(_temp.Get((Object)("special_formated")));
 //BA.debugLineNum = 133;BA.debugLine="If special = \"null\" Or special = \"false\" Then spe";
if ((_special).equals("null") || (_special).equals("false")) { 
_special = "";};
 //BA.debugLineNum = 135;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if (_price.length()>0 && _special.length()==0) { 
 //BA.debugLineNum = 136;BA.debugLine="LabelPrice.Text = price";
_labelprice.setText(BA.ObjectToCharSequence(_price));
 }else if(_special.length()>0) { 
 //BA.debugLineNum = 138;BA.debugLine="LabelPrice.Text = DiscountStyleLabel(price,speci";
_labelprice.setText(BA.ObjectToCharSequence(_discountstylelabel(_price,_special).getObject()));
 };
 //BA.debugLineNum = 141;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 143;BA.debugLine="Dim PathImage As String";
_pathimage = "";
 //BA.debugLineNum = 145;BA.debugLine="If temp.ContainsKey(\"image\") Then";
if (_temp.ContainsKey((Object)("image"))) { 
 //BA.debugLineNum = 146;BA.debugLine="PathImage = temp.Get(\"image\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("image")));
 }else if(_temp.ContainsKey((Object)("thumb"))) { 
 //BA.debugLineNum = 148;BA.debugLine="PathImage = temp.Get(\"thumb\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("thumb")));
 };
 //BA.debugLineNum = 151;BA.debugLine="PathImage = PathImage.Replace(\" \",\"%20\")";
_pathimage = _pathimage.replace(" ","%20");
 //BA.debugLineNum = 153;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.Le";
if ((_pathimage.toLowerCase()).equals("null") || _pathimage.length()==0) { 
 //BA.debugLineNum = 154;BA.debugLine="Glide.Load($\"${File.DirInternal}\\noimage1.png\"$)";
_glide.Load((Object)((""+__c.SmartStringFormatter("",(Object)(__c.File.getDirInternal()))+"\\noimage1.png"))).AsBitmap().Resize((int) (__c.Abs(_imgtemp.getWidth())),(int) (__c.Abs(_imgtemp.getHeight()))).CenterCrop().IntoImageView(_imgtemp);
 //BA.debugLineNum = 155;BA.debugLine="DoEvents";
__c.DoEvents();
 }else {
 //BA.debugLineNum = 157;BA.debugLine="Glide.Load(PathImage).AsBitmap.Resize(Abs(imgTem";
_glide.Load((Object)(_pathimage)).AsBitmap().Resize((int) (__c.Abs(_imgtemp.getWidth())),(int) (__c.Abs(_imgtemp.getHeight()))).CenterCrop().IntoImageView(_imgtemp);
 //BA.debugLineNum = 158;BA.debugLine="DoEvents";
__c.DoEvents();
 };
 //BA.debugLineNum = 161;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ((_temppanel.getTag()).equals((Object)("over"))) { 
 //BA.debugLineNum = 162;BA.debugLine="TempPanel.Tag = temp";
_temppanel.setTag((Object)(_temp.getObject()));
 }else if((_temppanel.getTag()).equals((Object)("topbar"))) { 
 //BA.debugLineNum = 164;BA.debugLine="TempPanel.Color = Library.Theme_Header";
_temppanel.setColor(_library._theme_header);
 };
 //BA.debugLineNum = 178;BA.debugLine="If i Mod countItem = 0 Then";
if (_i%_countitem==0) { 
 //BA.debugLineNum = 179;BA.debugLine="Top = Top + pa.Height + 15dip";
_top = (int) (_top+_pa.getHeight()+__c.DipToCurrent((int) (15)));
 //BA.debugLineNum = 180;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.Hei";
_scrollview1.getPanel().setHeight((int) (_scrollview1.getPanel().getHeight()+_pa.getHeight()));
 //BA.debugLineNum = 181;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0";
_left = (int) ((_countitem*_dimension[(int) (0)])-_dimension[(int) (0)]+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 183;BA.debugLine="DoEvents";
__c.DoEvents();
 }else {
 //BA.debugLineNum = 185;BA.debugLine="Left = Left - SpaceUnit - Dimension(0)";
_left = (int) (_left-_spaceunit-_dimension[(int) (0)]);
 };
 //BA.debugLineNum = 189;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 191;BA.debugLine="End Sub";
return "";
}
public String  _class_globals() throws Exception{
 //BA.debugLineNum = 2;BA.debugLine="Private Sub Class_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private thread1 As Thread";
_thread1 = new anywheresoftware.b4a.agraham.threading.Threading();
 //BA.debugLineNum = 5;BA.debugLine="Private ScrollView1 As ScrollView";
_scrollview1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 6;BA.debugLine="Private Top,Left,Dimension(),DefaultTop As Int";
_top = 0;
_left = 0;
_dimension = new int[(int) (0)];
;
_defaulttop = 0;
 //BA.debugLineNum = 7;BA.debugLine="Private countItem,AllSpace,SpaceUnit As Int";
_countitem = 0;
_allspace = 0;
_spaceunit = 0;
 //BA.debugLineNum = 8;BA.debugLine="Private images As Map";
_images = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 9;BA.debugLine="Private Glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 10;BA.debugLine="Private sModule As Object";
_smodule = new Object();
 //BA.debugLineNum = 11;BA.debugLine="Private sEV As String";
_sev = "";
 //BA.debugLineNum = 12;BA.debugLine="Private res As List";
_res = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 13;BA.debugLine="End Sub";
return "";
}
public anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString  _discountstylelabel(String _price,String _finalprice) throws Exception{
String _style = "";
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _rich = null;
 //BA.debugLineNum = 215;BA.debugLine="Private Sub DiscountStyleLabel(Price As String,Fin";
 //BA.debugLineNum = 217;BA.debugLine="Dim style As String";
_style = "";
 //BA.debugLineNum = 218;BA.debugLine="style = $\"{r}{u}${Price}{r}{u}${CRLF}{g}${FinalPr";
_style = ("{r}{u}"+__c.SmartStringFormatter("",(Object)(_price))+"{r}{u}"+__c.SmartStringFormatter("",(Object)(__c.CRLF))+"{g}"+__c.SmartStringFormatter("",(Object)(_finalprice))+"{g}");
 //BA.debugLineNum = 220;BA.debugLine="Dim rich As RichString";
_rich = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 221;BA.debugLine="rich.Initialize(style)";
_rich.Initialize(BA.ObjectToCharSequence(_style));
 //BA.debugLineNum = 222;BA.debugLine="rich.Color2(Colors.RGB(25,165,68),\"{g}\")";
_rich.Color2(__c.Colors.RGB((int) (25),(int) (165),(int) (68)),"{g}");
 //BA.debugLineNum = 223;BA.debugLine="rich.Color2(Colors.Red,\"{r}\")";
_rich.Color2(__c.Colors.Red,"{r}");
 //BA.debugLineNum = 224;BA.debugLine="rich.Strikethrough2(\"{u}\")";
_rich.Strikethrough2("{u}");
 //BA.debugLineNum = 226;BA.debugLine="Return rich";
if (true) return _rich;
 //BA.debugLineNum = 228;BA.debugLine="End Sub";
return null;
}
public int[]  _getparentpaneldimension(String _layoutname) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _parent = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
 //BA.debugLineNum = 193;BA.debugLine="Private Sub GetParentPanelDimension(LayoutName As";
 //BA.debugLineNum = 195;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 196;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(ba,"");
 //BA.debugLineNum = 197;BA.debugLine="p1.LoadLayout(LayoutName)";
_p1.LoadLayout(_layoutname,ba);
 //BA.debugLineNum = 198;BA.debugLine="DoEvents";
__c.DoEvents();
 //BA.debugLineNum = 200;BA.debugLine="Dim parent As View";
_parent = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 201;BA.debugLine="Dim v1 As View";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 203;BA.debugLine="For Each v1 As View In p1.GetAllViewsRecursive";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group7 = _p1.GetAllViewsRecursive();
final int groupLen7 = group7.getSize();
for (int index7 = 0;index7 < groupLen7 ;index7++){
_v1.setObject((android.view.View)(group7.Get(index7)));
 //BA.debugLineNum = 204;BA.debugLine="If v1 Is Panel Then";
if (_v1.getObjectOrNull() instanceof android.view.ViewGroup) { 
 //BA.debugLineNum = 205;BA.debugLine="parent = v1";
_parent = _v1;
 //BA.debugLineNum = 206;BA.debugLine="Exit";
if (true) break;
 };
 //BA.debugLineNum = 208;BA.debugLine="DoEvents";
__c.DoEvents();
 }
;
 //BA.debugLineNum = 211;BA.debugLine="Return Array As Int(parent.Width,parent.Height)";
if (true) return new int[]{_parent.getWidth(),_parent.getHeight()};
 //BA.debugLineNum = 213;BA.debugLine="End Sub";
return null;
}
public String  _initialize(anywheresoftware.b4a.BA _ba,Object _module,String _event,anywheresoftware.b4a.objects.ScrollViewWrapper _scrollview,int _defaulttopview,anywheresoftware.b4a.objects.collections.List _result) throws Exception{
innerInitialize(_ba);
Object[] _arg = null;
 //BA.debugLineNum = 16;BA.debugLine="Public Sub Initialize(Module As Object,Event As St";
 //BA.debugLineNum = 18;BA.debugLine="ScrollView1	= ScrollView";
_scrollview1 = _scrollview;
 //BA.debugLineNum = 19;BA.debugLine="DefaultTop	= DefaultTopView";
_defaulttop = _defaulttopview;
 //BA.debugLineNum = 20;BA.debugLine="sModule		= Module";
_smodule = _module;
 //BA.debugLineNum = 21;BA.debugLine="sEV			= Event";
_sev = _event;
 //BA.debugLineNum = 22;BA.debugLine="res = Result";
_res = _result;
 //BA.debugLineNum = 24;BA.debugLine="Dimension = GetParentPanelDimension(\"frmproduct_t";
_dimension = _getparentpaneldimension("frmproduct_template");
 //BA.debugLineNum = 26;BA.debugLine="images.Initialize";
_images.Initialize();
 //BA.debugLineNum = 28;BA.debugLine="thread1.Initialise(\"thread\")";
_thread1.Initialise(ba,"thread");
 //BA.debugLineNum = 29;BA.debugLine="Dim arg(1) As Object";
_arg = new Object[(int) (1)];
{
int d0 = _arg.length;
for (int i0 = 0;i0 < d0;i0++) {
_arg[i0] = new Object();
}
}
;
 //BA.debugLineNum = 30;BA.debugLine="arg(0) = Result";
_arg[(int) (0)] = (Object)(_result.getObject());
 //BA.debugLineNum = 31;BA.debugLine="thread1.Start(Me,\"LoadProduct\",Null)";
_thread1.Start(this,"LoadProduct",(Object[])(__c.Null));
 //BA.debugLineNum = 33;BA.debugLine="End Sub";
return "";
}
public String  _loadproduct() throws Exception{
int _i = 0;
 //BA.debugLineNum = 36;BA.debugLine="Private Sub LoadProduct";
 //BA.debugLineNum = 38;BA.debugLine="countItem = 100%x / Dimension(0)";
_countitem = (int) (__c.PerXToCurrent((float) (100),ba)/(double)_dimension[(int) (0)]);
 //BA.debugLineNum = 39;BA.debugLine="AllSpace = 100%x - (countItem * Dimension(0))";
_allspace = (int) (__c.PerXToCurrent((float) (100),ba)-(_countitem*_dimension[(int) (0)]));
 //BA.debugLineNum = 41;BA.debugLine="SpaceUnit = AllSpace /(countItem + 1)";
_spaceunit = (int) (_allspace/(double)(_countitem+1));
 //BA.debugLineNum = 44;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0)";
_left = (int) ((_countitem*_dimension[(int) (0)])-_dimension[(int) (0)]+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 45;BA.debugLine="Top = DefaultTop";
_top = _defaulttop;
 //BA.debugLineNum = 47;BA.debugLine="For i = 1 To res.Size";
{
final int step6 = 1;
final int limit6 = _res.getSize();
for (_i = (int) (1) ; (step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6); _i = ((int)(0 + _i + step6)) ) {
 //BA.debugLineNum = 48;BA.debugLine="thread1.RunOnGuiThread(\"AddPanel\",Array As Objec";
_thread1.RunOnGuiThread("AddPanel",new Object[]{_res.Get((int) (_i-1)),(Object)(_i)});
 }
};
 //BA.debugLineNum = 51;BA.debugLine="If res.Size Mod countItem <> 0 Then";
if (_res.getSize()%_countitem!=0) { 
 //BA.debugLineNum = 52;BA.debugLine="Top = Top + Dimension(1)";
_top = (int) (_top+_dimension[(int) (1)]);
 //BA.debugLineNum = 53;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.Hei";
_scrollview1.getPanel().setHeight((int) (_scrollview1.getPanel().getHeight()+_dimension[(int) (1)]));
 //BA.debugLineNum = 54;BA.debugLine="DoEvents";
__c.DoEvents();
 };
 //BA.debugLineNum = 57;BA.debugLine="If SubExists(sModule,sEV) Then";
if (__c.SubExists(ba,_smodule,_sev)) { 
 //BA.debugLineNum = 58;BA.debugLine="CallSub2(sModule,sEV,Top)";
__c.CallSubNew2(ba,_smodule,_sev,(Object)(_top));
 };
 //BA.debugLineNum = 61;BA.debugLine="End Sub";
return "";
}
public String  _pnlover_click() throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.PanelWrapper _p2 = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 230;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 232;BA.debugLine="Dim p1,p2 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
_p2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 233;BA.debugLine="p1 = Sender";
_p1.setObject((android.view.ViewGroup)(__c.Sender(ba)));
 //BA.debugLineNum = 235;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.setObject((android.view.ViewGroup)(_library._getparent(ba,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_p1.getObject()))).getObject()));
 //BA.debugLineNum = 236;BA.debugLine="p2.Visible = False";
_p2.setVisible(__c.False);
 //BA.debugLineNum = 237;BA.debugLine="p2.SetVisibleAnimated(500,True)";
_p2.SetVisibleAnimated((int) (500),__c.True);
 //BA.debugLineNum = 239;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 240;BA.debugLine="temp = p1.Tag";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_p1.getTag()));
 //BA.debugLineNum = 241;BA.debugLine="actProduct.product = temp";
_actproduct._product = _temp;
 //BA.debugLineNum = 242;BA.debugLine="StartActivity(actProduct)";
__c.StartActivity(ba,(Object)(_actproduct.getObject()));
 //BA.debugLineNum = 244;BA.debugLine="End Sub";
return "";
}
public Object callSub(String sub, Object sender, Object[] args) throws Exception {
BA.senderHolder.set(sender);
return BA.SubDelegator.SubNotFound;
}
}
