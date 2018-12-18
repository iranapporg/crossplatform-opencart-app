
#import "b4i_customlistview.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
#import "b4i_actsearch.h"
#import "b4i_opencart.h"
#import "b4i_actregister.h"
#import "b4i_actaccount.h"
#import "b4i_actcontact.h"
#import "b4i_actproduct.h"
#import "b4i_httpjob.h"
#import "b4i_clspreferencemanager.h"
#import "b4i_actpicture.h"
#import "b4i_actdoorder.h"
#import "b4i_actcategory.h"
#import "b4i_actpayment.h"
#import "b4i_actpush.h"
#import "b4i_pushnotification.h"
#import "b4i_actlogin.h"
#import "b4i_actbasket.h"
#import "b4i_actproducts.h"
#import "b4i_slidemenu.h"
#import "b4i_richstring.h"
#import "b4i_actsms.h"
#import "b4i_html.h"
#import "b4i_actorderdetails.h"
#import "b4i_modshare.h"
#import "b4i_acterrorinternet.h"
#import "b4i_httputils2service.h"
#import "b4i_cachedata.h"
#import "b4i_mytoastmessageshow.h"
#import "b4i_dateutils.h"
#import "b4i_bookmark.h"
#import "b4i_actabout.h"
#import "b4i_actshow.h"
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_customlistview 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_customlistview) instance released.");
}
- (NSString*)  _add:(B4IPanelWrapper*) _pnl :(int) _itemheight :(NSObject*) _value{
 //BA.debugLineNum = 130;BA.debugLine="Public Sub Add(Pnl As Panel, ItemHeight As Int, Va";
 //BA.debugLineNum = 131;BA.debugLine="InsertAt(items.Size, Pnl, ItemHeight, Value)";
[self _insertat:[self._items Size] :_pnl :_itemheight :_value];
 //BA.debugLineNum = 132;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addtextitem:(NSString*) _text :(NSObject*) _value{
 //BA.debugLineNum = 135;BA.debugLine="Public Sub AddTextItem(Text As String, Value As Ob";
 //BA.debugLineNum = 136;BA.debugLine="InsertAtTextItem(items.Size, Text, Value)";
[self _insertattextitem:[self._items Size] :_text :_value];
 //BA.debugLineNum = 137;BA.debugLine="End Sub";
return @"";
}
- (B4IViewWrapper*)  _asview{
 //BA.debugLineNum = 42;BA.debugLine="Public Sub AsView As View";
 //BA.debugLineNum = 43;BA.debugLine="sv.Color = Library.ConvertHex2Int(Library.GetStri";
[self._sv setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"menubar_color"]]].intValue];
 //BA.debugLineNum = 44;BA.debugLine="Return sv";
if (true) return (B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._sv).object)];
 //BA.debugLineNum = 45;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _class_globals{
self._main=[b4i_main new];
self._actmenu=[b4i_actmenu new];
self._library=[b4i_library new];
self._actsearch=[b4i_actsearch new];
self._actregister=[b4i_actregister new];
self._actaccount=[b4i_actaccount new];
self._actcontact=[b4i_actcontact new];
self._actproduct=[b4i_actproduct new];
self._actpicture=[b4i_actpicture new];
self._actdoorder=[b4i_actdoorder new];
self._actcategory=[b4i_actcategory new];
self._actpayment=[b4i_actpayment new];
self._actpush=[b4i_actpush new];
self._pushnotification=[b4i_pushnotification new];
self._actlogin=[b4i_actlogin new];
self._actbasket=[b4i_actbasket new];
self._actproducts=[b4i_actproducts new];
self._actsms=[b4i_actsms new];
self._actorderdetails=[b4i_actorderdetails new];
self._modshare=[b4i_modshare new];
self._acterrorinternet=[b4i_acterrorinternet new];
self._httputils2service=[b4i_httputils2service new];
self._cachedata=[b4i_cachedata new];
self._dateutils=[b4i_dateutils new];
self._bookmark=[b4i_bookmark new];
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 2;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private sv As ScrollView";
self._sv = [B4IScrollView new];
 //BA.debugLineNum = 4;BA.debugLine="Private items As List";
self._items = [B4IList new];
 //BA.debugLineNum = 5;BA.debugLine="Private panels As List";
self._panels = [B4IList new];
 //BA.debugLineNum = 6;BA.debugLine="Private dividerHeight As Float";
self._dividerheight = 0.0f;
 //BA.debugLineNum = 7;BA.debugLine="Private EventName As String";
self._eventname = @"";
 //BA.debugLineNum = 8;BA.debugLine="Private CallBack As Object";
self._callback = [NSObject new];
 //BA.debugLineNum = 9;BA.debugLine="Public DefaultTextFont As Font";
self._defaulttextfont = [B4IFontWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Public DefaultTextColor As Int";
self._defaulttextcolor = 0;
 //BA.debugLineNum = 11;BA.debugLine="Public DefaultTextBackgroundColor As Int";
self._defaulttextbackgroundcolor = 0;
 //BA.debugLineNum = 12;BA.debugLine="Private HighlightColor As Int = Colors.LightGray";
self._highlightcolor = [[self.__c Colors] LightGray];
 //BA.debugLineNum = 13;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _clear{
 //BA.debugLineNum = 48;BA.debugLine="Public Sub Clear";
 //BA.debugLineNum = 49;BA.debugLine="items.Clear";
[self._items Clear];
 //BA.debugLineNum = 50;BA.debugLine="panels.Clear";
[self._panels Clear];
 //BA.debugLineNum = 51;BA.debugLine="sv.ContentHeight = 0";
[self._sv setContentHeight:(int) (0)];
 //BA.debugLineNum = 52;BA.debugLine="sv.Panel.RemoveAllViews";
[[self._sv Panel] RemoveAllViews];
 //BA.debugLineNum = 53;BA.debugLine="End Sub";
return @"";
}
- (int)  _getitemfromview:(B4IViewWrapper*) _v{
B4INativeObject* _r = nil;
NSObject* _parent = nil;
NSObject* _current = nil;
 //BA.debugLineNum = 178;BA.debugLine="Public Sub GetItemFromView(v As View) As Int";
 //BA.debugLineNum = 179;BA.debugLine="Dim r As NativeObject";
_r = [B4INativeObject new];
 //BA.debugLineNum = 180;BA.debugLine="Dim parent, current As Object";
_parent = [NSObject new];
_current = [NSObject new];
 //BA.debugLineNum = 181;BA.debugLine="parent = v";
_parent = (NSObject*)((_v).object);
 //BA.debugLineNum = 182;BA.debugLine="Do While (parent Is Panel) = False Or sv.Panel <>";
while (([_parent isKindOfClass: [B4IPanelView class]])==[self.__c False] || [[self._sv Panel] isEqual:(B4IPanelView*)(_parent)] == false) {
 //BA.debugLineNum = 183;BA.debugLine="current = parent";
_current = _parent;
 //BA.debugLineNum = 184;BA.debugLine="r = current";
_r.object = (NSObject*)(_current);
 //BA.debugLineNum = 185;BA.debugLine="parent = r.GetField(\"superview\")";
_parent = (NSObject*)(([_r GetField:@"superview"]).object);
 }
;
 //BA.debugLineNum = 187;BA.debugLine="v = current";
_v.object = (UIView*)(_current);
 //BA.debugLineNum = 188;BA.debugLine="Return v.Tag";
if (true) return [self.bi ObjectToNumber:[_v Tag]].intValue;
 //BA.debugLineNum = 189;BA.debugLine="End Sub";
return 0;
}
- (B4IPanelWrapper*)  _getpanel:(int) _index{
B4IPanelWrapper* _p = nil;
 //BA.debugLineNum = 61;BA.debugLine="Public Sub GetPanel(Index As Int) As Panel";
 //BA.debugLineNum = 62;BA.debugLine="Dim p As Panel";
_p = [B4IPanelWrapper new];
 //BA.debugLineNum = 63;BA.debugLine="p = panels.Get(Index) 'this is the parent panel";
_p.object = (B4IPanelView*)([self._panels Get:_index]);
 //BA.debugLineNum = 64;BA.debugLine="Return p.GetView(0)";
if (true) return (B4IPanelWrapper*) [B4IObjectWrapper createWrapper:[B4IPanelWrapper new] object:(B4IPanelView*)(([_p GetView:(int) (0)]).object)];
 //BA.debugLineNum = 65;BA.debugLine="End Sub";
return nil;
}
- (int)  _getsize{
 //BA.debugLineNum = 56;BA.debugLine="Public Sub GetSize As Int";
 //BA.debugLineNum = 57;BA.debugLine="Return items.Size";
if (true) return [self._items Size];
 //BA.debugLineNum = 58;BA.debugLine="End Sub";
return 0;
}
- (NSObject*)  _getvalue:(int) _index{
 //BA.debugLineNum = 68;BA.debugLine="Public Sub GetValue(Index As Int) As Object";
 //BA.debugLineNum = 69;BA.debugLine="Return items.Get(Index)";
if (true) return [self._items Get:_index];
 //BA.debugLineNum = 70;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _initialize:(B4I*) _ba :(NSObject*) _vcallback :(NSString*) _veventname :(int) _width{
[self initializeClassModule];
 //BA.debugLineNum = 16;BA.debugLine="Public Sub Initialize (vCallback As Object, vEvent";
 //BA.debugLineNum = 17;BA.debugLine="sv.Initialize(\"sv\", Width, 0)";
[self._sv Initialize:self.bi :@"sv" :_width :(int) (0)];
 //BA.debugLineNum = 18;BA.debugLine="items.Initialize";
[self._items Initialize];
 //BA.debugLineNum = 19;BA.debugLine="panels.Initialize";
[self._panels Initialize];
 //BA.debugLineNum = 20;BA.debugLine="dividerHeight = 1dip";
self._dividerheight = (float) ([self.__c DipToCurrent:(int) (1)]);
 //BA.debugLineNum = 21;BA.debugLine="EventName = vEventName";
self._eventname = _veventname;
 //BA.debugLineNum = 22;BA.debugLine="CallBack = vCallback";
self._callback = _vcallback;
 //BA.debugLineNum = 23;BA.debugLine="sv.Color = 0xFFF5F5F5 'this sets the dividers col";
[self._sv setColor:(int) (0xfff5f5f5)];
 //BA.debugLineNum = 24;BA.debugLine="DefaultTextColor = Colors.Black";
self._defaulttextcolor = [[self.__c Colors] Black];
 //BA.debugLineNum = 25;BA.debugLine="DefaultTextFont = Font.CreateNew(16)";
self._defaulttextfont = [[self.__c Font] CreateNew:(float) (16)];
 //BA.debugLineNum = 26;BA.debugLine="DefaultTextBackgroundColor = Colors.White";
self._defaulttextbackgroundcolor = [[self.__c Colors] White];
 //BA.debugLineNum = 27;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _insertat:(int) _index :(B4IPanelWrapper*) _pnl :(int) _itemheight :(NSObject*) _value{
B4IPanelWrapper* _p = nil;
int _top = 0;
B4IPanelWrapper* _previouspanel = nil;
B4IPanelWrapper* _p2 = nil;
int _i = 0;
 //BA.debugLineNum = 92;BA.debugLine="Public Sub InsertAt(Index As Int, Pnl As Panel, It";
 //BA.debugLineNum = 94;BA.debugLine="Dim p As Panel";
_p = [B4IPanelWrapper new];
 //BA.debugLineNum = 95;BA.debugLine="p.Initialize(\"panel\")";
[_p Initialize:self.bi :@"panel"];
 //BA.debugLineNum = 96;BA.debugLine="p.AddView(Pnl, 0, 0, sv.Width, ItemHeight)";
[_p AddView:(UIView*)((_pnl).object) :(float) (0) :(float) (0) :[self._sv Width] :(float) (_itemheight)];
 //BA.debugLineNum = 97;BA.debugLine="p.Tag = Index";
[_p setTag:(NSObject*)(@(_index))];
 //BA.debugLineNum = 98;BA.debugLine="p.Color = Pnl.Color";
[_p setColor:[_pnl Color]];
 //BA.debugLineNum = 99;BA.debugLine="Pnl.Color = Colors.Transparent";
[_pnl setColor:[[self.__c Colors] Transparent]];
 //BA.debugLineNum = 100;BA.debugLine="If Index = items.Size Then";
if (_index==[self._items Size]) { 
 //BA.debugLineNum = 101;BA.debugLine="items.Add(Value)";
[self._items Add:_value];
 //BA.debugLineNum = 102;BA.debugLine="panels.Add(p)";
[self._panels Add:(NSObject*)((_p).object)];
 //BA.debugLineNum = 103;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 104;BA.debugLine="If Index = 0 Then top = dividerHeight Else top =";
if (_index==0) { 
_top = (int) (self._dividerheight);}
else {
_top = (int) ([[self._sv Panel] Height]);};
 //BA.debugLineNum = 105;BA.debugLine="sv.Panel.AddView(p, 0, top, sv.Width, ItemHeight";
[[self._sv Panel] AddView:(UIView*)((_p).object) :(float) (0) :(float) (_top) :[self._sv Width] :(float) (_itemheight)];
 }else {
 //BA.debugLineNum = 107;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 108;BA.debugLine="If Index = 0 Then";
if (_index==0) { 
 //BA.debugLineNum = 109;BA.debugLine="top = dividerHeight";
_top = (int) (self._dividerheight);
 }else {
 //BA.debugLineNum = 111;BA.debugLine="Dim previousPanel As Panel";
_previouspanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 112;BA.debugLine="previousPanel = panels.Get(Index - 1)";
_previouspanel.object = (B4IPanelView*)([self._panels Get:(int) (_index-1)]);
 //BA.debugLineNum = 113;BA.debugLine="top = previousPanel.top + previousPanel.Height";
_top = (int) ([_previouspanel Top]+[_previouspanel Height]+self._dividerheight);
 };
 //BA.debugLineNum = 116;BA.debugLine="Dim p2 As Panel";
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 117;BA.debugLine="For i = Index To panels.Size - 1";
{
const int step23 = 1;
const int limit23 = (int) ([self._panels Size]-1);
_i = _index ;
for (;(step23 > 0 && _i <= limit23) || (step23 < 0 && _i >= limit23) ;_i = ((int)(0 + _i + step23))  ) {
 //BA.debugLineNum = 118;BA.debugLine="p2 = panels.Get(i)";
_p2.object = (B4IPanelView*)([self._panels Get:_i]);
 //BA.debugLineNum = 119;BA.debugLine="p2.top = p2.top + ItemHeight + dividerHeight";
[_p2 setTop:(float) ([_p2 Top]+_itemheight+self._dividerheight)];
 //BA.debugLineNum = 120;BA.debugLine="p2.Tag = i + 1";
[_p2 setTag:(NSObject*)(@(_i+1))];
 }
};
 //BA.debugLineNum = 122;BA.debugLine="items.InsertAt(Index, Value)";
[self._items InsertAt:_index :_value];
 //BA.debugLineNum = 123;BA.debugLine="panels.InsertAt(Index, p)";
[self._panels InsertAt:_index :(NSObject*)((_p).object)];
 //BA.debugLineNum = 124;BA.debugLine="sv.Panel.AddView(p, 0, top, sv.Width, ItemHeight";
[[self._sv Panel] AddView:(UIView*)((_p).object) :(float) (0) :(float) (_top) :[self._sv Width] :(float) (_itemheight)];
 };
 //BA.debugLineNum = 126;BA.debugLine="sv.ContentHeight = sv.ContentHeight + ItemHeight";
[self._sv setContentHeight:(int) ([self._sv ContentHeight]+_itemheight+self._dividerheight)];
 //BA.debugLineNum = 127;BA.debugLine="If items.Size = 1 Then sv.ContentHeight = sv.Cont";
if ([self._items Size]==1) { 
[self._sv setContentHeight:(int) ([self._sv ContentHeight]+self._dividerheight)];};
 //BA.debugLineNum = 128;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _insertattextitem:(int) _index :(NSString*) _text :(NSObject*) _value{
B4IPanelWrapper* _pnl = nil;
B4ILabelWrapper* _lbl = nil;
 //BA.debugLineNum = 140;BA.debugLine="Public Sub InsertAtTextItem(Index As Int, Text As";
 //BA.debugLineNum = 141;BA.debugLine="Dim pnl As Panel";
_pnl = [B4IPanelWrapper new];
 //BA.debugLineNum = 142;BA.debugLine="pnl.Initialize(\"\")";
[_pnl Initialize:self.bi :@""];
 //BA.debugLineNum = 143;BA.debugLine="Dim lbl As Label";
_lbl = [B4ILabelWrapper new];
 //BA.debugLineNum = 144;BA.debugLine="lbl.Initialize(\"\")";
[_lbl Initialize:self.bi :@""];
 //BA.debugLineNum = 145;BA.debugLine="lbl.TextAlignment = lbl.ALIGNMENT_LEFT";
[_lbl setTextAlignment:[_lbl ALIGNMENT_LEFT]];
 //BA.debugLineNum = 146;BA.debugLine="pnl.AddView(lbl, 5dip, 2dip, sv.Width - 5dip, 20d";
[_pnl AddView:(UIView*)((_lbl).object) :(float) ([self.__c DipToCurrent:(int) (5)]) :(float) ([self.__c DipToCurrent:(int) (2)]) :(float) ([self._sv Width]-[self.__c DipToCurrent:(int) (5)]) :(float) ([self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 147;BA.debugLine="lbl.Text = Text";
[_lbl setText:_text];
 //BA.debugLineNum = 148;BA.debugLine="lbl.Multiline = True";
[_lbl setMultiline:[self.__c True]];
 //BA.debugLineNum = 149;BA.debugLine="lbl.Font = DefaultTextFont";
[_lbl setFont:self._defaulttextfont];
 //BA.debugLineNum = 150;BA.debugLine="lbl.TextColor = DefaultTextColor";
[_lbl setTextColor:self._defaulttextcolor];
 //BA.debugLineNum = 151;BA.debugLine="pnl.Color = DefaultTextBackgroundColor";
[_pnl setColor:self._defaulttextbackgroundcolor];
 //BA.debugLineNum = 152;BA.debugLine="lbl.SizeToFit";
[_lbl SizeToFit];
 //BA.debugLineNum = 153;BA.debugLine="lbl.Height = Max(50dip, lbl.Height)";
[_lbl setHeight:(float) ([self.__c Max:[self.__c DipToCurrent:(int) (50)] :[_lbl Height]])];
 //BA.debugLineNum = 154;BA.debugLine="InsertAt(Index, pnl, lbl.Height + 2dip, Value)";
[self _insertat:_index :_pnl :(int) ([_lbl Height]+[self.__c DipToCurrent:(int) (2)]) :_value];
 //BA.debugLineNum = 155;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _jumptoitem:(int) _index{
int _top = 0;
B4IPanelWrapper* _p = nil;
int _i = 0;
 //BA.debugLineNum = 165;BA.debugLine="Public Sub JumpToItem(Index As Int)";
 //BA.debugLineNum = 166;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 167;BA.debugLine="Dim p As Panel";
_p = [B4IPanelWrapper new];
 //BA.debugLineNum = 168;BA.debugLine="For i = 0 To Min(Index - 1, items.Size - 1)";
{
const int step3 = 1;
const int limit3 = (int) ([self.__c Min:_index-1 :[self._items Size]-1]);
_i = (int) (0) ;
for (;(step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3) ;_i = ((int)(0 + _i + step3))  ) {
 //BA.debugLineNum = 169;BA.debugLine="p = panels.Get(i)";
_p.object = (B4IPanelView*)([self._panels Get:_i]);
 //BA.debugLineNum = 170;BA.debugLine="top = top + p.Height + dividerHeight";
_top = (int) (_top+[_p Height]+self._dividerheight);
 }
};
 //BA.debugLineNum = 172;BA.debugLine="SetOffset(top)";
[self _setoffset:_top];
 //BA.debugLineNum = 173;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _panel_click{
B4IPanelWrapper* _p = nil;
 //BA.debugLineNum = 157;BA.debugLine="Private Sub Panel_Click";
 //BA.debugLineNum = 158;BA.debugLine="Dim p As Panel = Sender";
_p = [B4IPanelWrapper new];
_p.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 159;BA.debugLine="p.GetView(0).Color = HighlightColor";
[[_p GetView:(int) (0)] setColor:self._highlightcolor];
 //BA.debugLineNum = 160;BA.debugLine="p.GetView(0).SetColorAnimated(700, Colors.Transpa";
[[_p GetView:(int) (0)] SetColorAnimated:(int) (700) :[[self.__c Colors] Transparent]];
 //BA.debugLineNum = 161;BA.debugLine="CallSub3(CallBack, EventName & \"_ItemClick\", p.Ta";
[self.__c CallSub3:self.bi :self._callback :[@[self._eventname,@"_ItemClick"] componentsJoinedByString:@""] :[_p Tag] :[self._items Get:[self.bi ObjectToNumber:[_p Tag]].intValue]];
 //BA.debugLineNum = 162;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _removeat:(int) _index{
B4IPanelWrapper* _removepanel = nil;
B4IPanelWrapper* _p = nil;
int _i = 0;
 //BA.debugLineNum = 73;BA.debugLine="Public Sub RemoveAt(Index As Int)";
 //BA.debugLineNum = 74;BA.debugLine="Dim removePanel, p As Panel";
_removepanel = [B4IPanelWrapper new];
_p = [B4IPanelWrapper new];
 //BA.debugLineNum = 75;BA.debugLine="removePanel = panels.Get(Index)";
_removepanel.object = (B4IPanelView*)([self._panels Get:_index]);
 //BA.debugLineNum = 76;BA.debugLine="For i = Index + 1 To items.Size - 1";
{
const int step3 = 1;
const int limit3 = (int) ([self._items Size]-1);
_i = (int) (_index+1) ;
for (;(step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3) ;_i = ((int)(0 + _i + step3))  ) {
 //BA.debugLineNum = 77;BA.debugLine="p = panels.Get(i)";
_p.object = (B4IPanelView*)([self._panels Get:_i]);
 //BA.debugLineNum = 78;BA.debugLine="p.Tag = i - 1";
[_p setTag:(NSObject*)(@(_i-1))];
 //BA.debugLineNum = 79;BA.debugLine="p.Top = p.Top - removePanel.Height - dividerHeig";
[_p setTop:(float) ([_p Top]-[_removepanel Height]-self._dividerheight)];
 }
};
 //BA.debugLineNum = 81;BA.debugLine="sv.ContentHeight = sv.ContentHeight - removePanel";
[self._sv setContentHeight:(int) ([self._sv ContentHeight]-[_removepanel Height]-self._dividerheight)];
 //BA.debugLineNum = 82;BA.debugLine="items.RemoveAt(Index)";
[self._items RemoveAt:_index];
 //BA.debugLineNum = 83;BA.debugLine="panels.RemoveAt(Index)";
[self._panels RemoveAt:_index];
 //BA.debugLineNum = 84;BA.debugLine="removePanel.RemoveViewFromParent";
[_removepanel RemoveViewFromParent];
 //BA.debugLineNum = 85;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setoffset:(int) _y{
 //BA.debugLineNum = 174;BA.debugLine="Private Sub SetOffset(y As Int)";
 //BA.debugLineNum = 175;BA.debugLine="sv.ScrollOffsetY = Max(0, Min(y, sv.ContentHeight";
[self._sv setScrollOffsetY:(int) ([self.__c Max:0 :[self.__c Min:_y :[self._sv ContentHeight]-[self._sv Height]]])];
 //BA.debugLineNum = 176;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setsize:(int) _width :(int) _height{
B4IPanelWrapper* _p = nil;
int _c = 0;
 //BA.debugLineNum = 29;BA.debugLine="Public Sub SetSize(width As Int, height As Int)";
 //BA.debugLineNum = 30;BA.debugLine="If width <> sv.ContentWidth Then";
if (_width!=[self._sv ContentWidth]) { 
 //BA.debugLineNum = 31;BA.debugLine="sv.ContentWidth = width";
[self._sv setContentWidth:_width];
 //BA.debugLineNum = 32;BA.debugLine="For Each p As Panel In panels";
_p = [B4IPanelWrapper new];
{
const id<B4IIterable> group3 = self._panels;
const int groupLen3 = group3.Size
;int index3 = 0;
;
for (; index3 < groupLen3;index3++){
_p.object = (B4IPanelView*)([group3 Get:index3]);
 //BA.debugLineNum = 33;BA.debugLine="p.width = width";
[_p setWidth:(float) (_width)];
 //BA.debugLineNum = 34;BA.debugLine="p.GetView(0).width = width";
[[_p GetView:(int) (0)] setWidth:(float) (_width)];
 }
};
 };
 //BA.debugLineNum = 37;BA.debugLine="Dim c As Int = sv.ScrollOffsetY";
_c = [self._sv ScrollOffsetY];
 //BA.debugLineNum = 38;BA.debugLine="sv.SetLayoutAnimated(0, 0, sv.Left, sv.Top, width";
[self._sv SetLayoutAnimated:(int) (0) :(float) (0) :[self._sv Left] :[self._sv Top] :(float) (_width) :(float) (_height)];
 //BA.debugLineNum = 39;BA.debugLine="SetOffset(c)";
[self _setoffset:_c];
 //BA.debugLineNum = 40;BA.debugLine="End Sub";
return @"";
}
- (int)  _swidth{
 //BA.debugLineNum = 87;BA.debugLine="Sub sWidth As Int";
 //BA.debugLineNum = 88;BA.debugLine="Return sv.Width";
if (true) return (int) ([self._sv Width]);
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return 0;
}
@end
