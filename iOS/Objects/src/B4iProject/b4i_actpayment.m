
#import "b4i_actpayment.h"
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


@implementation b4i_actpayment 


+ (instancetype)new {
    static b4i_actpayment* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 88;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 90;BA.debugLine="Library.NavControl.ShowPage(Library.DoOrderPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._doorderpage).object)];
 //BA.debugLineNum = 92;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _javascriptcallback:(NSString*) _html1{
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 54;BA.debugLine="Sub JavascriptCallback(Html1 As String)";
 //BA.debugLineNum = 56;BA.debugLine="If Html1.IndexOf(\"خطای 17\") > - 1 Or Html1.IndexO";
if ([_html1 IndexOf:@"خطای 17"]>-1 || [_html1 IndexOf:@"کنسل"]>-1 || [_html1 IndexOf:@"بازگشت"]>-1 || [_html1 IndexOf:@"خطا"]>-1 || [_html1 IndexOf:@"هشدار"]>-1) { 
 //BA.debugLineNum = 57;BA.debugLine="Library.PaymentSuccess = True";
self._library._paymentsuccess = [self.__c True];
 //BA.debugLineNum = 58;BA.debugLine="Library.NavControl.ShowPage(Library.DoOrderPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._doorderpage).object)];
 }else {
 //BA.debugLineNum = 62;BA.debugLine="wb1.Visible = False";
[self._wb1 setVisible:[self.__c False]];
 //BA.debugLineNum = 63;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 65;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 66;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 67;BA.debugLine="op1.SaveOrder(Me,\"SaveOrder_receive\",True)";
[_op1 _saveorder:self :@"SaveOrder_receive" :[self.__c True]];
 //BA.debugLineNum = 69;BA.debugLine="If Library.CartDetails.IsInitialized Then";
if ([self._library._cartdetails IsInitialized]) { 
 //BA.debugLineNum = 70;BA.debugLine="Library.CartDetails.Clear";
[self._library._cartdetails Clear];
 };
 };
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _jobdone:(b4i_httpjob*) _job{
 //BA.debugLineNum = 31;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 32;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 33;BA.debugLine="wb1.LoadHtml(Job.GetString)";
[self._wb1 LoadHtml:[_job _getstring]];
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
 //BA.debugLineNum = 4;BA.debugLine="Public Data As String";
self._data = @"";
 //BA.debugLineNum = 5;BA.debugLine="Private pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 6;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private wb1 As WebView";
self._wb1 = [B4IWebViewWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _saveorder_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 77;BA.debugLine="Sub SaveOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 79;BA.debugLine="Library.PaymentSuccess = True";
self._library._paymentsuccess = [self.__c True];
 //BA.debugLineNum = 80;BA.debugLine="Msgbox(Library.GetStringResourse(\"success_payment";
[self.__c Msgbox:[self._library _getstringresourse:@"success_payment"] :[self._library _getstringresourse:@"alert"]];
 //BA.debugLineNum = 82;BA.debugLine="actAccount.ChoosenTab = \"order\"";
self._actaccount._choosentab = @"order";
 //BA.debugLineNum = 83;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 84;BA.debugLine="actAccount.StartActivity";
[self._actaccount _startactivity];
 //BA.debugLineNum = 86;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 14;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 16;BA.debugLine="pg.Initialize(\"\")";
[self._pg Initialize:self.bi :@""];
 //BA.debugLineNum = 17;BA.debugLine="pg.RootPanel.LoadLayout(\"frmpayment\")";
[[self._pg RootPanel] LoadLayout:@"frmpayment" :self.bi];
 //BA.debugLineNum = 18;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 20;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 21;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 23;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"paymen";
[self._lbltitle setText:[self._library _getstringresourse:@"payment"]];
 //BA.debugLineNum = 24;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 25;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 27;BA.debugLine="wb1.LoadUrl(Library.GetStringResourse(\"url\") & \"/";
[self._wb1 LoadUrl:[@[[self._library _getstringresourse:@"url"],@"/app/ws.php?method=payment4ios?token=",[self.bi ObjectToString:[self._library._token Get:(NSObject*)(@"access_token")]],@"&url=",[self._library _getstringresourse:@"url"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 29;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _wb1_pagefinished:(BOOL) _success :(NSString*) _url{
B4INativeObject* _no = nil;
NSObject* _te = nil;
 //BA.debugLineNum = 36;BA.debugLine="Sub wb1_PageFinished (Success As Boolean, Url As S";
 //BA.debugLineNum = 38;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 40;BA.debugLine="If Url.IndexOf(\"api/rest/pay\") > -1 Then";
if ([_url IndexOf:@"api/rest/pay"]>-1) { 
 //BA.debugLineNum = 41;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 };
 //BA.debugLineNum = 44;BA.debugLine="If Url.ToLowerCase.IndexOf(\"order_id=\") > -1 Then";
if ([[_url ToLowerCase] IndexOf:@"order_id="]>-1) { 
 //BA.debugLineNum = 45;BA.debugLine="wb1.Visible = False";
[self._wb1 setVisible:[self.__c False]];
 //BA.debugLineNum = 46;BA.debugLine="Dim no As NativeObject = wb1";
_no = [B4INativeObject new];
_no.object = (NSObject*)((self._wb1).object);
 //BA.debugLineNum = 47;BA.debugLine="Dim te As Object";
_te = [NSObject new];
 //BA.debugLineNum = 48;BA.debugLine="te = no.RunMethod(\"stringByEvaluatingJavaScriptF";
_te = (NSObject*)(([_no RunMethod:@"stringByEvaluatingJavaScriptFromString:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@"document.documentElement.outerHTML")]]]]).object);
 //BA.debugLineNum = 49;BA.debugLine="JavascriptCallback(te)";
[self _javascriptcallback:[self.bi ObjectToString:_te]];
 };
 //BA.debugLineNum = 52;BA.debugLine="End Sub";
return @"";
}
@end
