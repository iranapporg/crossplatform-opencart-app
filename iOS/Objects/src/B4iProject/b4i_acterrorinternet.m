
#import "b4i_acterrorinternet.h"
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


@implementation b4i_acterrorinternet 


+ (instancetype)new {
    static b4i_acterrorinternet* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnretry_click{
 //BA.debugLineNum = 51;BA.debugLine="Sub btnretry_Click";
 //BA.debugLineNum = 53;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 54;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse2:@"error_again_net"] :[self.__c False]];
 }else {
 //BA.debugLineNum = 56;BA.debugLine="Main.StartActivity";
[self._main _startactivity];
 };
 //BA.debugLineNum = 59;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsetting_click{
 //BA.debugLineNum = 41;BA.debugLine="Sub btnsetting_Click";
 //BA.debugLineNum = 43;BA.debugLine="If Library.App.OSVersion >= 8 Then";
if ([self.bi ObjectToNumber:[self._library._app OSVersion]].doubleValue>=8) { 
 //BA.debugLineNum = 44;BA.debugLine="Library.App.OpenURL(\"app-settings:\")";
[self._library._app OpenURL:@"app-settings:"];
 }else {
 //BA.debugLineNum = 46;BA.debugLine="Msgbox(Library.GetStringResourse2(\"error_net_det";
[self.__c Msgbox:[self._library _getstringresourse2:@"error_net_details"] :[self._library _getstringresourse2:@"alert"]];
 };
 //BA.debugLineNum = 49;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _process_globals{
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
 //BA.debugLineNum = 3;BA.debugLine="private Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Public Module As Object";
self._module = [NSObject new];
 //BA.debugLineNum = 5;BA.debugLine="Public NoShop As String";
self._noshop = @"";
 //BA.debugLineNum = 6;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private lbldetails As Label";
self._lbldetails = [B4ILabelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private btnsetting As Button";
self._btnsetting = [B4IButtonWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private btnretry As Button";
self._btnretry = [B4IButtonWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private lblalert As Label";
self._lblalert = [B4ILabelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 14;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 16;BA.debugLine="Library.ErrorNetPage.Initialize(\"Page1\")";
[self._library._errornetpage Initialize:self.bi :@"Page1"];
 //BA.debugLineNum = 17;BA.debugLine="Library.ErrorNetPage.RootPanel.LoadLayout(\"frmerr";
[[self._library._errornetpage RootPanel] LoadLayout:@"frmerronet" :self.bi];
 //BA.debugLineNum = 18;BA.debugLine="Library.NavControl.ShowPage(Library.ErrorNetPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._errornetpage).object)];
 //BA.debugLineNum = 20;BA.debugLine="lbltitle.Text	= Library.GetStringResourse2(\"error";
[self._lbltitle setText:[self._library _getstringresourse2:@"error_net_title"]];
 //BA.debugLineNum = 21;BA.debugLine="Library.SetFont(lbltitle,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lbltitle).object)] :@"" :(int) (14)];
 //BA.debugLineNum = 23;BA.debugLine="If NoShop.Length = 0 Then";
if ([self._noshop Length]==0) { 
 //BA.debugLineNum = 24;BA.debugLine="lbldetails.Text = Library.GetStringResourse2(\"er";
[self._lbldetails setText:[self._library _getstringresourse2:@"error_net_details"]];
 }else {
 //BA.debugLineNum = 26;BA.debugLine="lbldetails.Text = NoShop";
[self._lbldetails setText:self._noshop];
 };
 //BA.debugLineNum = 29;BA.debugLine="Library.SetFont(lbldetails,\"\",10)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lbldetails).object)] :@"" :(int) (10)];
 //BA.debugLineNum = 31;BA.debugLine="btnretry.Text	= Library.GetStringResourse2(\"btnre";
[self._btnretry setText:[self._library _getstringresourse2:@"btnretry"]];
 //BA.debugLineNum = 32;BA.debugLine="Library.SetFont(btnretry,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnretry).object)] :@"" :(int) (14)];
 //BA.debugLineNum = 33;BA.debugLine="btnsetting.Text = Library.GetStringResourse2(\"btn";
[self._btnsetting setText:[self._library _getstringresourse2:@"btnsetting"]];
 //BA.debugLineNum = 34;BA.debugLine="Library.SetFont(btnsetting,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnsetting).object)] :@"" :(int) (14)];
 //BA.debugLineNum = 36;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 37;BA.debugLine="Library.SetFont(lblalert,\"icomoon\",93)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblalert).object)] :@"icomoon" :(int) (93)];
 //BA.debugLineNum = 39;BA.debugLine="End Sub";
return @"";
}
@end
