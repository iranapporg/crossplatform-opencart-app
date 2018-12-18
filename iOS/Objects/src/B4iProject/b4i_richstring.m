
#import "b4i_richstring.h"
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
#import "b4i_actsms.h"
#import "b4i_html.h"
#import "b4i_actorderdetails.h"
#import "b4i_modshare.h"
#import "b4i_acterrorinternet.h"
#import "b4i_httputils2service.h"
#import "b4i_cachedata.h"
#import "b4i_mytoastmessageshow.h"
#import "b4i_customlistview.h"
#import "b4i_dateutils.h"
#import "b4i_bookmark.h"
#import "b4i_actabout.h"
#import "b4i_actshow.h"
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_richstring 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_richstring) instance released.");
}
- (b4i_richstring*)  _addattribute:(NSString*) _attr :(NSObject*) _value :(int) _start :(int) _endindex{
 //BA.debugLineNum = 54;BA.debugLine="Private Sub AddAttribute(attr As String, value As";
 //BA.debugLineNum = 55;BA.debugLine="s.RunMethod(\"addAttribute:value:range:\", Array(at";
[self._s RunMethod:@"addAttribute:value:range:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(_attr)],[B4I nilToNSNull:_value],[B4I nilToNSNull:(NSObject*)([self._s MakeRange:_start :(int) (_endindex-_start)])]]]];
 //BA.debugLineNum = 57;BA.debugLine="Return Me";
if (true) return (b4i_richstring*)(self);
 //BA.debugLineNum = 58;BA.debugLine="End Sub";
return nil;
}
- (b4i_richstring*)  _backgroundcolor:(int) _clr :(int) _start :(int) _endindex{
 //BA.debugLineNum = 20;BA.debugLine="Public Sub BackgroundColor (clr As Int, Start As I";
 //BA.debugLineNum = 21;BA.debugLine="Return AddAttribute(\"NSBackgroundColor\", s.ColorT";
if (true) return [self _addattribute:@"NSBackgroundColor" :(NSObject*)([self._s ColorToUIColor:_clr]) :_start :_endindex];
 //BA.debugLineNum = 22;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 3;BA.debugLine="Private s As NativeObject";
self._s = [B4INativeObject new];
 //BA.debugLineNum = 4;BA.debugLine="Private t As String";
self._t = @"";
 //BA.debugLineNum = 5;BA.debugLine="End Sub";
return @"";
}
- (b4i_richstring*)  _color:(int) _clr :(int) _start :(int) _endindex{
 //BA.debugLineNum = 16;BA.debugLine="Public Sub Color (clr As Int, Start As Int, EndInd";
 //BA.debugLineNum = 17;BA.debugLine="Return AddAttribute(\"NSColor\", s.ColorToUIColor(c";
if (true) return [self _addattribute:@"NSColor" :(NSObject*)([self._s ColorToUIColor:_clr]) :_start :_endindex];
 //BA.debugLineNum = 18;BA.debugLine="End Sub";
return nil;
}
- (B4IAttributedString*)  _getattributedstring{
 //BA.debugLineNum = 11;BA.debugLine="Public Sub getAttributedString As AttributedString";
 //BA.debugLineNum = 12;BA.debugLine="Return s";
if (true) return (B4IAttributedString*) [B4IObjectWrapper createWrapper:[B4IAttributedString new] object:(NSAttributedString*)((self._s).object)];
 //BA.debugLineNum = 13;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _gettext{
 //BA.debugLineNum = 44;BA.debugLine="Public Sub getText As String";
 //BA.debugLineNum = 45;BA.debugLine="Return t";
if (true) return self._t;
 //BA.debugLineNum = 46;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba :(NSString*) _text{
[self initializeClassModule];
 //BA.debugLineNum = 7;BA.debugLine="Public Sub Initialize (Text As String)";
 //BA.debugLineNum = 8;BA.debugLine="setText(Text)";
[self _settext:_text];
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return @"";
}
- (b4i_richstring*)  _setfont:(B4IFontWrapper*) _fnt :(int) _start :(int) _endindex{
 //BA.debugLineNum = 35;BA.debugLine="Public Sub SetFont(fnt As Font, Start As Int, EndI";
 //BA.debugLineNum = 36;BA.debugLine="Return AddAttribute(\"NSFont\", fnt, Start, EndInde";
if (true) return [self _addattribute:@"NSFont" :(NSObject*)((_fnt).object) :_start :_endindex];
 //BA.debugLineNum = 37;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _settext:(NSString*) _text{
 //BA.debugLineNum = 48;BA.debugLine="Public Sub setText(text As String)";
 //BA.debugLineNum = 49;BA.debugLine="s = s.Initialize(\"NSMutableAttributedString\").Run";
self._s = [[[self._s Initialize:@"NSMutableAttributedString"] RunMethod:@"alloc" :(B4IArray*)([self.__c Null])] RunMethod:@"initWithString:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(_text)]]]];
 //BA.debugLineNum = 51;BA.debugLine="t = text";
self._t = _text;
 //BA.debugLineNum = 52;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _settolabel:(B4ILabelWrapper*) _lbl{
B4INativeObject* _no = nil;
 //BA.debugLineNum = 39;BA.debugLine="Public Sub SetToLabel(lbl As Label)";
 //BA.debugLineNum = 40;BA.debugLine="Dim no As NativeObject = lbl";
_no = [B4INativeObject new];
_no.object = (NSObject*)((_lbl).object);
 //BA.debugLineNum = 41;BA.debugLine="no.SetField(\"attributedText\", s)";
[_no SetField:@"attributedText" :(NSObject*)((self._s).object)];
 //BA.debugLineNum = 42;BA.debugLine="End Sub";
return @"";
}
- (b4i_richstring*)  _strikethrough:(BOOL) _visible :(int) _start :(int) _endindex{
 //BA.debugLineNum = 24;BA.debugLine="Public Sub Strikethrough(Visible As Boolean, Start";
 //BA.debugLineNum = 25;BA.debugLine="Return AddAttribute(\"NSStrikethrough\", Visible, S";
if (true) return [self _addattribute:@"NSStrikethrough" :(NSObject*)(@(_visible)) :_start :_endindex];
 //BA.debugLineNum = 26;BA.debugLine="End Sub";
return nil;
}
- (b4i_richstring*)  _underline:(BOOL) _visible :(int) _clr :(int) _start :(int) _endindex{
 //BA.debugLineNum = 28;BA.debugLine="Public Sub Underline(Visible As Boolean, Clr As In";
 //BA.debugLineNum = 29;BA.debugLine="AddAttribute(\"NSUnderline\", Visible, Start, EndIn";
[self _addattribute:@"NSUnderline" :(NSObject*)(@(_visible)) :_start :_endindex];
 //BA.debugLineNum = 30;BA.debugLine="Return AddAttribute(\"NSUnderlineColor\", s.ColorTo";
if (true) return [self _addattribute:@"NSUnderlineColor" :(NSObject*)([self._s ColorToUIColor:_clr]) :_start :_endindex];
 //BA.debugLineNum = 31;BA.debugLine="End Sub";
return nil;
}
@end
