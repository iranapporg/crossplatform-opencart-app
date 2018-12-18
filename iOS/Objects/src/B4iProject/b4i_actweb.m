
#import "b4i_actweb.h"
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
#import "b4i_customlistview.h"
#import "b4i_dateutils.h"
#import "b4i_bookmark.h"
#import "b4i_actabout.h"
#import "b4i_actshow.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_actweb 


+ (instancetype)new {
    static b4i_actweb* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 45;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 46;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 47;BA.debugLine="End Sub";
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
self._acterrorinternet=[b4i_acterrorinternet new];
self._httputils2service=[b4i_httputils2service new];
self._cachedata=[b4i_cachedata new];
self._dateutils=[b4i_dateutils new];
self._bookmark=[b4i_bookmark new];
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private wb1 As WebView";
self._wb1 = [B4IWebViewWrapper new];
 //BA.debugLineNum = 5;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Public title,link,data As String";
self._title = @"";
self._link = @"";
self._data = @"";
 //BA.debugLineNum = 8;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IPage* _pg = nil;
B4INativeObject* _no = nil;
NSString* _style = @"";
 //BA.debugLineNum = 11;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 13;BA.debugLine="Dim pg As Page";
_pg = [B4IPage new];
 //BA.debugLineNum = 14;BA.debugLine="pg.Initialize(\"\")";
[_pg Initialize:self.bi :@""];
 //BA.debugLineNum = 15;BA.debugLine="pg.RootPanel.LoadLayout(\"frmweb\")";
[[_pg RootPanel] LoadLayout:@"frmweb" :self.bi];
 //BA.debugLineNum = 16;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((_pg).object)];
 //BA.debugLineNum = 17;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 19;BA.debugLine="lbltitle.Text = title";
[self._lbltitle setText:self._title];
 //BA.debugLineNum = 20;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 21;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 23;BA.debugLine="Dim no As NativeObject = wb1";
_no = [B4INativeObject new];
_no.object = (NSObject*)((self._wb1).object);
 //BA.debugLineNum = 24;BA.debugLine="no.RunMethod(\"stringByEvaluatingJavaScriptFromStr";
[_no RunMethod:@"stringByEvaluatingJavaScriptFromString:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@"document.body.style.fontSize = '20px';")]]]];
 //BA.debugLineNum = 26;BA.debugLine="Dim style As String";
_style = @"";
 //BA.debugLineNum = 28;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 29;BA.debugLine="style = \"<body style=\"\"font-size:18px;direction:";
_style = @"<body style=\"font-size:18px;direction:rtl;text-align:right !important;line-height:35px\">";
 }else {
 //BA.debugLineNum = 31;BA.debugLine="style = \"<body style=\"\"font-size:18px;direction:";
_style = @"<body style=\"font-size:18px;direction:ltr;text-align:left !important\">";
 };
 //BA.debugLineNum = 34;BA.debugLine="If data.Length > 0 Then";
if ([self._data Length]>0) { 
 //BA.debugLineNum = 35;BA.debugLine="data = data.Replace(\"&gt;\",\">\").Replace(\"&lt;\",\"";
self._data = [[[[self._data Replace:@"&gt;" :@">"] Replace:@"&lt;" :@"<"] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"];
 //BA.debugLineNum = 36;BA.debugLine="wb1.LoadHtml(style & data & \"</p>\")";
[self._wb1 LoadHtml:[@[_style,self._data,@"</p>"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 37;BA.debugLine="data = \"\"";
self._data = @"";
 }else {
 //BA.debugLineNum = 39;BA.debugLine="wb1.LoadUrl(link)";
[self._wb1 LoadUrl:self._link];
 //BA.debugLineNum = 40;BA.debugLine="link = \"\"";
self._link = @"";
 };
 //BA.debugLineNum = 43;BA.debugLine="End Sub";
return @"";
}
@end
