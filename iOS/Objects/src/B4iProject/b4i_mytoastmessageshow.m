
#import "b4i_mytoastmessageshow.h"
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


@implementation b4i_mytoastmessageshow 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_mytoastmessageshow) instance released.");
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
 //BA.debugLineNum = 2;BA.debugLine="Private Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private p1 As Panel";
self._p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 4;BA.debugLine="Private timerDelay As Timer";
self._timerdelay = [B4ITimer new];
 //BA.debugLineNum = 5;BA.debugLine="Private lbl,bullet As Label";
self._lbl = [B4ILabelWrapper new];
self._bullet = [B4ILabelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba :(B4IPanelWrapper*) _panel1{
[self initializeClassModule];
 //BA.debugLineNum = 9;BA.debugLine="Public Sub Initialize(Panel1 As Panel)";
 //BA.debugLineNum = 11;BA.debugLine="p1.Initialize(\"\")";
[self._p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 12;BA.debugLine="Panel1.AddView(p1,0,-76dip,Library.GetWidth,56dip";
[_panel1 AddView:(UIView*)((self._p1).object) :(float) (0) :(float) (-[self.__c DipToCurrent:(int) (76)]) :(float) ([self._library _getwidth]) :(float) ([self.__c DipToCurrent:(int) (56)])];
 //BA.debugLineNum = 13;BA.debugLine="p1.Color = Colors.White";
[self._p1 setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 15;BA.debugLine="lbl.Initialize(\"lblstop\")";
[self._lbl Initialize:self.bi :@"lblstop"];
 //BA.debugLineNum = 16;BA.debugLine="bullet.Initialize(\"\")";
[self._bullet Initialize:self.bi :@""];
 //BA.debugLineNum = 17;BA.debugLine="bullet.TextColor = Library.ConvertHex2Int(Library";
[self._bullet setTextColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"toastshow_textcolor"]]].intValue];
 //BA.debugLineNum = 18;BA.debugLine="lbl.TextColor = Library.ConvertHex2Int(Library.Ge";
[self._lbl setTextColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"toastshow_textcolor"]]].intValue];
 //BA.debugLineNum = 19;BA.debugLine="Library.SetFont(bullet,\"icomoon\",12)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._bullet).object)] :@"icomoon" :(int) (12)];
 //BA.debugLineNum = 20;BA.debugLine="bullet.Text = \"\"";
[self._bullet setText:@""];
 //BA.debugLineNum = 21;BA.debugLine="lbl.Font = Library.GetFont(14)";
[self._lbl setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 22;BA.debugLine="lbl.AdjustFontSizeToFit = True";
[self._lbl setAdjustFontSizeToFit:[self.__c True]];
 //BA.debugLineNum = 24;BA.debugLine="p1.Color = Library.ConvertHex2Int(Library.GetStri";
[self._p1 setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"toastshow_color"]]].intValue];
 //BA.debugLineNum = 26;BA.debugLine="lbl.TextAlignment = Library.GetStringResourse(\"di";
[self._lbl setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 27;BA.debugLine="bullet.TextAlignment = Library.GetStringResourse(";
[self._bullet setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 29;BA.debugLine="p1.AddView(bullet,20,0,30,p1.Height)";
[self._p1 AddView:(UIView*)((self._bullet).object) :(float) (20) :(float) (0) :(float) (30) :[self._p1 Height]];
 //BA.debugLineNum = 30;BA.debugLine="p1.AddView(lbl,40,0,p1.Width-40,p1.Height)";
[self._p1 AddView:(UIView*)((self._lbl).object) :(float) (40) :(float) (0) :(float) ([self._p1 Width]-40) :[self._p1 Height]];
 //BA.debugLineNum = 32;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblstop_click{
 //BA.debugLineNum = 62;BA.debugLine="Private Sub lblstop_Click";
 //BA.debugLineNum = 63;BA.debugLine="timerdelay_Tick";
[self _timerdelay_tick];
 //BA.debugLineNum = 64;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _showtoastmessageshow:(NSString*) _message :(long long) _delay :(BOOL) _issuccess{
 //BA.debugLineNum = 35;BA.debugLine="Public Sub ShowToastMessageShow(Message As String,";
 //BA.debugLineNum = 37;BA.debugLine="lbl.Text = \"  \" & Message";
[self._lbl setText:[@[@"  ",_message] componentsJoinedByString:@""]];
 //BA.debugLineNum = 39;BA.debugLine="If IsSuccess Then";
if (_issuccess) { 
 //BA.debugLineNum = 40;BA.debugLine="p1.Color = Library.ConvertHex2Int(Library.GetStr";
[self._p1 setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"toastshow_success"]]].intValue];
 //BA.debugLineNum = 41;BA.debugLine="bullet.Text = \"\"";
[self._bullet setText:@""];
 }else {
 //BA.debugLineNum = 43;BA.debugLine="p1.Color = Library.ConvertHex2Int(Library.GetStr";
[self._p1 setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"toastshow_color"]]].intValue];
 //BA.debugLineNum = 44;BA.debugLine="bullet.Text = \"\"";
[self._bullet setText:@""];
 };
 //BA.debugLineNum = 47;BA.debugLine="Library.SetFont(bullet,\"icomoon\",12)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._bullet).object)] :@"icomoon" :(int) (12)];
 //BA.debugLineNum = 49;BA.debugLine="p1.Top = -p1.Height";
[self._p1 setTop:(float) (-[self._p1 Height])];
 //BA.debugLineNum = 50;BA.debugLine="p1.SetLayoutAnimated(600,0.3,0,0,p1.Width,p1.Heig";
[self._p1 SetLayoutAnimated:(int) (600) :(float) (0.3) :(float) (0) :(float) (0) :[self._p1 Width] :[self._p1 Height]];
 //BA.debugLineNum = 52;BA.debugLine="timerDelay.Initialize(\"timerdelay\",Library.GetStr";
[self._timerdelay Initialize:self.bi :@"timerdelay" :(long long) ([self.bi ObjectToNumber:[self._library _getstringresourse:@"toastshow_delay"]].doubleValue*1000)];
 //BA.debugLineNum = 53;BA.debugLine="timerDelay.Enabled = True";
[self._timerdelay setEnabled:[self.__c True]];
 //BA.debugLineNum = 55;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _timerdelay_tick{
 //BA.debugLineNum = 57;BA.debugLine="Private Sub timerdelay_Tick";
 //BA.debugLineNum = 58;BA.debugLine="p1.SetLayoutAnimated(600,0.3,0,-76dip,p1.Width,p1";
[self._p1 SetLayoutAnimated:(int) (600) :(float) (0.3) :(float) (0) :(float) (-[self.__c DipToCurrent:(int) (76)]) :[self._p1 Width] :[self._p1 Height]];
 //BA.debugLineNum = 59;BA.debugLine="timerDelay.Enabled = False";
[self._timerdelay setEnabled:[self.__c False]];
 //BA.debugLineNum = 60;BA.debugLine="End Sub";
return @"";
}
@end
