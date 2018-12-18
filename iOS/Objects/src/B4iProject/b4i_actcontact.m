
#import "b4i_actcontact.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
#import "b4i_actsearch.h"
#import "b4i_opencart.h"
#import "b4i_actregister.h"
#import "b4i_actaccount.h"
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


@implementation b4i_actcontact 


+ (instancetype)new {
    static b4i_actcontact* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 96;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 97;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 98;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsend_click{
b4i_opencart* _op = nil;
 //BA.debugLineNum = 59;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 61;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 62;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 63;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 66;BA.debugLine="If txtname.Text.Length < 2 Or txttext.Text.Length";
if ([[self._txtname Text] Length]<2 || [[self._txttext Text] Length]<25) { 
 //BA.debugLineNum = 67;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[[self._library _getstringresourse:@"error_data"] Replace:@"\\n" :[self.__c CRLF]] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 68;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 71;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 72;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 73;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 74;BA.debugLine="op.ContactUs(Me,\"SendReview_receive\",txtemail.Tex";
[_op _contactus:self :@"SendReview_receive" :[self._txtemail Text] :[self._txtname Text] :[self._txttext Text]];
 //BA.debugLineNum = 76;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblfocus_click{
 //BA.debugLineNum = 100;BA.debugLine="Sub lblfocus_Click";
 //BA.debugLineNum = 101;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 102;BA.debugLine="sv1.ScrollTo(0,0,True)";
[self._sv1 ScrollTo:(int) (0) :(int) (0) :[self.__c True]];
 //BA.debugLineNum = 103;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _process_globals{
self._main=[b4i_main new];
self._actmenu=[b4i_actmenu new];
self._library=[b4i_library new];
self._actsearch=[b4i_actsearch new];
self._actregister=[b4i_actregister new];
self._actaccount=[b4i_actaccount new];
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
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 5;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private lblname As Label";
self._lblname = [B4ILabelWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private txtname As TextField";
self._txtname = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private lblemail As Label";
self._lblemail = [B4ILabelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private txtemail As TextField";
self._txtemail = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private lbltext As Label";
self._lbltext = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private txttext As TextField";
self._txttext = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private btnsend As Button";
self._btnsend = [B4IButtonWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Dim MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 17;BA.debugLine="Dim pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 18;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _sendreview_receive:(B4IMap*) _res :(NSString*) _cat{
NSString* _res1 = @"";
 //BA.debugLineNum = 78;BA.debugLine="Sub SendReview_receive(res As Map,cat As String)";
 //BA.debugLineNum = 80;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 82;BA.debugLine="Dim res1 As String";
_res1 = @"";
 //BA.debugLineNum = 83;BA.debugLine="res1 = res.Get(\"success\")";
_res1 = [self.bi ObjectToString:[_res Get:(NSObject*)(@"success")]];
 //BA.debugLineNum = 85;BA.debugLine="If res1.ToLowerCase = \"true\" Or res1 = \"1\" Then";
if ([[_res1 ToLowerCase] isEqual:@"true"] || [_res1 isEqual:@"1"]) { 
 //BA.debugLineNum = 86;BA.debugLine="txtemail.Text = \"\"";
[self._txtemail setText:@""];
 //BA.debugLineNum = 87;BA.debugLine="txtname.Text = \"\"";
[self._txtname setText:@""];
 //BA.debugLineNum = 88;BA.debugLine="txttext.Text = \"\"";
[self._txttext setText:@""];
 //BA.debugLineNum = 89;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"success_send"] :(long long) (2) :[self.__c True]];
 }else {
 //BA.debugLineNum = 91;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[[self._library _getstringresourse:@"error_data"] Replace:@"\\n" :[self.__c CRLF]] :(long long) (2) :[self.__c False]];
 };
 //BA.debugLineNum = 94;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 20;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 22;BA.debugLine="sv1.Initialize(\"sv1\",Library.GetWidth,Library.Get";
[self._sv1 Initialize:self.bi :@"sv1" :[self._library _getwidth] :[self._library _getheight]];
 //BA.debugLineNum = 23;BA.debugLine="sv1.ContentHeight = Library.GetHeight";
[self._sv1 setContentHeight:[self._library _getheight]];
 //BA.debugLineNum = 24;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 25;BA.debugLine="sv1.Color = Colors.White";
[self._sv1 setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 26;BA.debugLine="sv1.Panel.Color = Colors.White";
[[self._sv1 Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 28;BA.debugLine="pg.Initialize(\"pg\")";
[self._pg Initialize:self.bi :@"pg"];
 //BA.debugLineNum = 29;BA.debugLine="pg.RootPanel.AddView(sv1,0,0,Library.GetWidth,Lib";
[[self._pg RootPanel] AddView:(UIView*)((self._sv1).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getheight])];
 //BA.debugLineNum = 30;BA.debugLine="sv1.Panel.LoadLayout(\"frmcontact\")";
[[self._sv1 Panel] LoadLayout:@"frmcontact" :self.bi];
 //BA.debugLineNum = 31;BA.debugLine="sv1.ContentHeight = Library.GetHeight+300dip";
[self._sv1 setContentHeight:(int) ([self._library _getheight]+[self.__c DipToCurrent:(int) (300)])];
 //BA.debugLineNum = 32;BA.debugLine="Library.ChangeFont(pg.RootPanel)";
[self._library _changefont:[self._pg RootPanel]];
 //BA.debugLineNum = 33;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 35;BA.debugLine="MyToastMessageShow1.Initialize(pg.RootPanel)";
[self._mytoastmessageshow1 _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 37;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"contac";
[self._lbltitle setText:[self._library _getstringresourse:@"contact"]];
 //BA.debugLineNum = 38;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 39;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 41;BA.debugLine="lblname.Text = Library.GetStringResourse(\"tname\")";
[self._lblname setText:[self._library _getstringresourse:@"tname"]];
 //BA.debugLineNum = 42;BA.debugLine="lblemail.Text = Library.GetStringResourse(\"email\"";
[self._lblemail setText:[self._library _getstringresourse:@"email"]];
 //BA.debugLineNum = 43;BA.debugLine="lbltext.Text = Library.GetStringResourse(\"ttext\")";
[self._lbltext setText:[self._library _getstringresourse:@"ttext"]];
 //BA.debugLineNum = 44;BA.debugLine="btnsend.Text = Library.GetStringResourse(\"send\")";
[self._btnsend setText:[self._library _getstringresourse:@"send"]];
 //BA.debugLineNum = 45;BA.debugLine="Library.GetButtonState(btnsend)";
[self._library _getbuttonstate:self._btnsend];
 //BA.debugLineNum = 47;BA.debugLine="txtname.Color = Colors.RGB(250,250,250)";
[self._txtname setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 48;BA.debugLine="txtemail.Color = Colors.RGB(250,250,250)";
[self._txtemail setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 49;BA.debugLine="txttext.Color = Colors.RGB(250,250,250)";
[self._txttext setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 51;BA.debugLine="lblname.TextAlignment	= Library.GetStringResourse";
[self._lblname setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 52;BA.debugLine="txtname.TextAlignment	= Library.GetStringResourse";
[self._txtname setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 53;BA.debugLine="txttext.TextAlignment	= Library.GetStringResourse";
[self._txttext setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 54;BA.debugLine="lblemail.TextAlignment	= Library.GetStringResours";
[self._lblemail setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 55;BA.debugLine="lbltext.TextAlignment	= Library.GetStringResourse";
[self._lbltext setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 57;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txttext_click{
 //BA.debugLineNum = 105;BA.debugLine="Sub txttext_Click";
 //BA.debugLineNum = 106;BA.debugLine="txttext.RequestFocus";
[self._txttext RequestFocus];
 //BA.debugLineNum = 107;BA.debugLine="sv1.ScrollTo(0,txttext.Top,True)";
[self._sv1 ScrollTo:(int) (0) :(int) ([self._txttext Top]) :[self.__c True]];
 //BA.debugLineNum = 108;BA.debugLine="End Sub";
return @"";
}
@end
