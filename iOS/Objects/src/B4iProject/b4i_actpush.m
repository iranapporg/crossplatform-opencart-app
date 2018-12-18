
#import "b4i_actpush.h"
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


@implementation b4i_actpush 


+ (instancetype)new {
    static b4i_actpush* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 32;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 33;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 34;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 5;BA.debugLine="Public body As String";
self._body = @"";
 //BA.debugLineNum = 7;BA.debugLine="Private lbldesc As TextView";
self._lbldesc = [B4ITextViewWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IPage* _pg = nil;
 //BA.debugLineNum = 14;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 16;BA.debugLine="Dim pg As Page";
_pg = [B4IPage new];
 //BA.debugLineNum = 17;BA.debugLine="pg.Initialize(\"\")";
[_pg Initialize:self.bi :@""];
 //BA.debugLineNum = 18;BA.debugLine="pg.RootPanel.LoadLayout(\"frmpush\")";
[[_pg RootPanel] LoadLayout:@"frmpush" :self.bi];
 //BA.debugLineNum = 19;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((_pg).object)];
 //BA.debugLineNum = 21;BA.debugLine="Library.ChangeFont(pg.RootPanel)";
[self._library _changefont:[_pg RootPanel]];
 //BA.debugLineNum = 23;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 24;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"about\"";
[self._lbltitle setText:[self._library _getstringresourse:@"about"]];
 //BA.debugLineNum = 25;BA.debugLine="Library.ChangeFont(pg.RootPanel)";
[self._library _changefont:[_pg RootPanel]];
 //BA.debugLineNum = 27;BA.debugLine="lbldesc.TextAlignment = Library.GetStringResourse";
[self._lbldesc setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 28;BA.debugLine="lbldesc.Text = body";
[self._lbldesc setText:self._body];
 //BA.debugLineNum = 30;BA.debugLine="End Sub";
return @"";
}
@end
