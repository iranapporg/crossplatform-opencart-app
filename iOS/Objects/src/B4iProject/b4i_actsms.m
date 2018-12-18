
#import "b4i_actsms.h"
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


@implementation b4i_actsms 


+ (instancetype)new {
    static b4i_actsms* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 95;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 96;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnproduts_click{
 //BA.debugLineNum = 91;BA.debugLine="Sub btnproduts_Click";
 //BA.debugLineNum = 92;BA.debugLine="actBasket.StartActivity";
[self._actbasket _startactivity];
 //BA.debugLineNum = 93;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsend_click{
 //BA.debugLineNum = 52;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 54;BA.debugLine="If txtname.Text.Length = 0 Then";
if ([[self._txtname Text] Length]==0) { 
 //BA.debugLineNum = 55;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_name"] :(long long) (1.6) :[self.__c False]];
 //BA.debugLineNum = 56;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 59;BA.debugLine="basket = basket & CRLF & txtname.Text";
self._basket = [@[self._basket,[self.__c CRLF],[self._txtname Text]] componentsJoinedByString:@""];
 //BA.debugLineNum = 60;BA.debugLine="SendSms(basket,True)";
[self _sendsms:self._basket :[self.__c True]];
 //BA.debugLineNum = 62;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblcfocus_click{
 //BA.debugLineNum = 99;BA.debugLine="Sub lblcfocus_Click";
 //BA.debugLineNum = 100;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 101;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 4;BA.debugLine="Public basket As String";
self._basket = @"";
 //BA.debugLineNum = 5;BA.debugLine="Private txtname As TextField";
self._txtname = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private btnsend As Button";
self._btnsend = [B4IButtonWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private lblphone As Label";
self._lblphone = [B4ILabelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 10;BA.debugLine="Private txtcomment As TextView";
self._txtcomment = [B4ITextViewWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private lblcomment As Label";
self._lblcomment = [B4ILabelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private btnproduts As Button";
self._btnproduts = [B4IButtonWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private ps As MessageComposer";
self._ps = [B4IMessageComposer new];
 //BA.debugLineNum = 15;BA.debugLine="Private pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 16;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _sendsms:(NSString*) _text :(BOOL) _intent{
 //BA.debugLineNum = 66;BA.debugLine="Sub SendSms(Text As String,Intent As Boolean)";
 //BA.debugLineNum = 68;BA.debugLine="ps.Initialize(\"sms\")";
[self._ps Initialize:self.bi :@"sms"];
 //BA.debugLineNum = 69;BA.debugLine="ps.SetRecipients(Array(Library.GetStringResourse(";
[self._ps SetRecipients:[self.bi ArrayToList:[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)([self._library _getstringresourse:@"shop_sms"])]]]]];
 //BA.debugLineNum = 70;BA.debugLine="ps.Body = Text";
[self._ps setBody:_text];
 //BA.debugLineNum = 71;BA.debugLine="ps.Show(pg)";
[self._ps Show:self._pg];
 //BA.debugLineNum = 73;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library.";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"send_order"] :(long long) (1.7) :[self.__c True]];
 //BA.debugLineNum = 74;BA.debugLine="txtcomment.Text = \"\"";
[self._txtcomment setText:@""];
 //BA.debugLineNum = 75;BA.debugLine="txtname.Text = \"\"";
[self._txtname setText:@""];
 //BA.debugLineNum = 77;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _sms_complete:(int) _result{
 //BA.debugLineNum = 79;BA.debugLine="Sub sms_Complete (Result As Int)";
 //BA.debugLineNum = 81;BA.debugLine="If Result = ps.RESULT_SENT Then";
if (_result==[self._ps RESULT_SENT]) { 
 //BA.debugLineNum = 82;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"send_order"] :(long long) (2) :[self.__c True]];
 }else {
 //BA.debugLineNum = 84;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[[self._library _getstringresourse:@"deliver_sms"] Replace:@"\\n" :[self.__c CRLF]] :(long long) (2) :[self.__c True]];
 };
 //BA.debugLineNum = 87;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 19;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 21;BA.debugLine="pg.Initialize(\"\")";
[self._pg Initialize:self.bi :@""];
 //BA.debugLineNum = 22;BA.debugLine="pg.RootPanel.LoadLayout(\"frmsms\")";
[[self._pg RootPanel] LoadLayout:@"frmsms" :self.bi];
 //BA.debugLineNum = 23;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 25;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 26;BA.debugLine="btnsend.Top = Library.GetHeight-btnsend.Height-20";
[self._btnsend setTop:(float) ([self._library _getheight]-[self._btnsend Height]-[self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 27;BA.debugLine="btnproduts.Top = Library.GetHeight-btnproduts.Hei";
[self._btnproduts setTop:(float) ([self._library _getheight]-[self._btnproduts Height]-[self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 29;BA.debugLine="MyToastMessageShow1.Initialize(pg.RootPanel)";
[self._mytoastmessageshow1 _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 30;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"send_s";
[self._lbltitle setText:[self._library _getstringresourse:@"send_sms"]];
 //BA.debugLineNum = 31;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 32;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 34;BA.debugLine="txtname.HintText	= Library.GetStringResourse(\"sms";
[self._txtname setHintText:[self._library _getstringresourse:@"sms_name"]];
 //BA.debugLineNum = 35;BA.debugLine="txtcomment.Text = Library.GetStringResourse(\"sms_";
[self._txtcomment setText:[self._library _getstringresourse:@"sms_order_comment"]];
 //BA.debugLineNum = 37;BA.debugLine="btnsend.Text				= Library.GetStringResourse(\"send";
[self._btnsend setText:[self._library _getstringresourse:@"send_request"]];
 //BA.debugLineNum = 38;BA.debugLine="btnproduts.Text				= Library.GetStringResourse(\"m";
[self._btnproduts setText:[self._library _getstringresourse:@"my_product"]];
 //BA.debugLineNum = 39;BA.debugLine="txtname.TextAlignment		= Library.GetStringResours";
[self._txtname setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 40;BA.debugLine="txtcomment.TextAlignment	= Library.GetStringResou";
[self._txtcomment setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 41;BA.debugLine="lblphone.Text				= Library.GetStringResourse(\"sms";
[self._lblphone setText:[@[[self._library _getstringresourse:@"sms_contact"],@" ",[self._library _getstringresourse:@"shop_phone"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 42;BA.debugLine="lblcomment.Text				= Library.GetStringResourse(\"s";
[self._lblcomment setText:[self._library _getstringresourse:@"sms_help"]];
 //BA.debugLineNum = 44;BA.debugLine="btnsend.CustomLabel.Font = Library.GetFont(btnsen";
[[self._btnsend CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnsend CustomLabel] Font] Size])]];
 //BA.debugLineNum = 45;BA.debugLine="btnproduts.CustomLabel.Font = Library.GetFont(btn";
[[self._btnproduts CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnsend CustomLabel] Font] Size])]];
 //BA.debugLineNum = 47;BA.debugLine="btnsend.Color = Library.ConvertHex2Int(Library.Ge";
[self._btnsend setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 48;BA.debugLine="btnproduts.Color = Library.ConvertHex2Int(Library";
[self._btnproduts setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 50;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtcomment_click{
 //BA.debugLineNum = 103;BA.debugLine="Sub txtcomment_Click";
 //BA.debugLineNum = 104;BA.debugLine="txtcomment.RequestFocus";
[self._txtcomment RequestFocus];
 //BA.debugLineNum = 105;BA.debugLine="End Sub";
return @"";
}
@end
