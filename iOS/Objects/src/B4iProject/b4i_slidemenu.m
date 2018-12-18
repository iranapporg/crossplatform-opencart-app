
#import "b4i_slidemenu.h"
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


@implementation b4i_slidemenu 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_slidemenu) instance released.");
}
- (NSString*)  _addheader:(BOOL) _update{
b4i_opencart* _opinformation = nil;
 //BA.debugLineNum = 62;BA.debugLine="Public Sub AddHeader(Update As Boolean)";
 //BA.debugLineNum = 64;BA.debugLine="lsheader.Clear";
[self._lsheader _clear];
 //BA.debugLineNum = 66;BA.debugLine="AddItem(Library.GetStringResourse(\"home\"),\"\",\"ho";
[self _additem:[self._library _getstringresourse:@"home"] :@"" :@"home"];
 //BA.debugLineNum = 67;BA.debugLine="AddItem(Library.GetStringResourse(\"basket_title\")";
[self _additem:[self._library _getstringresourse:@"basket_title"] :@"" :@"basket"];
 //BA.debugLineNum = 68;BA.debugLine="AddItem(Library.GetStringResourse(\"category\"),\"\"";
[self _additem:[self._library _getstringresourse:@"category"] :@"" :@"catalog"];
 //BA.debugLineNum = 69;BA.debugLine="AddItem(Library.wishlist,\"\",\"bookmark\")";
[self _additem:self._library._wishlist :@"" :@"bookmark"];
 //BA.debugLineNum = 71;BA.debugLine="AddHeaderTitle(Library.GetStringResourse(\"users\")";
[self _addheadertitle:[self._library _getstringresourse:@"users"]];
 //BA.debugLineNum = 73;BA.debugLine="If Library.loginDetails.IsInitialized = False The";
if ([self._library._logindetails IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 74;BA.debugLine="AddItem(Library.GetStringResourse(\"login\"),\"\",\"";
[self _additem:[self._library _getstringresourse:@"login"] :@"" :@"login"];
 //BA.debugLineNum = 75;BA.debugLine="AddItem(Library.GetStringResourse(\"register\"),\"";
[self _additem:[self._library _getstringresourse:@"register"] :@"" :@"register"];
 }else {
 //BA.debugLineNum = 77;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ([[self._library._logindetails Get:(NSObject*)(@"login")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 78;BA.debugLine="AddItem(Library.GetStringResourse(\"account\"),\"";
[self _additem:[self._library _getstringresourse:@"account"] :@"" :@"account"];
 //BA.debugLineNum = 79;BA.debugLine="AddItem(Library.GetStringResourse(\"logout\"),\"\"";
[self _additem:[self._library _getstringresourse:@"logout"] :@"" :@"logout"];
 }else {
 //BA.debugLineNum = 81;BA.debugLine="AddItem(Library.GetStringResourse(\"login\"),\"\",";
[self _additem:[self._library _getstringresourse:@"login"] :@"" :@"login"];
 //BA.debugLineNum = 82;BA.debugLine="AddItem(Library.GetStringResourse(\"register\"),\"";
[self _additem:[self._library _getstringresourse:@"register"] :@"" :@"register"];
 };
 };
 //BA.debugLineNum = 86;BA.debugLine="AddHeaderTitle(Library.GetStringResourse(\"shops\")";
[self _addheadertitle:[self._library _getstringresourse:@"shops"]];
 //BA.debugLineNum = 87;BA.debugLine="AddItem(Library.GetStringResourse(\"newproduct\"),\"";
[self _additem:[self._library _getstringresourse:@"newproduct"] :@"" :@"new"];
 //BA.debugLineNum = 88;BA.debugLine="AddItem(Library.GetStringResourse(\"featureproduct";
[self _additem:[self._library _getstringresourse:@"featureproduct"] :@"" :@"feature"];
 //BA.debugLineNum = 89;BA.debugLine="AddItem(Library.GetStringResourse(\"bestproduct\"),";
[self _additem:[self._library _getstringresourse:@"bestproduct"] :@"" :@"best"];
 //BA.debugLineNum = 91;BA.debugLine="AddHeaderTitle(Library.GetStringResourse(\"contact";
[self _addheadertitle:[self._library _getstringresourse:@"contact_shop"]];
 //BA.debugLineNum = 92;BA.debugLine="AddItem(Library.GetStringResourse(\"contact\"),\"\",";
[self _additem:[self._library _getstringresourse:@"contact"] :@"" :@"contact"];
 //BA.debugLineNum = 93;BA.debugLine="AddItem(Library.GetStringResourse(\"about\"),\"\",\"a";
[self _additem:[self._library _getstringresourse:@"about"] :@"" :@"about"];
 //BA.debugLineNum = 94;BA.debugLine="AddItem(Library.GetStringResourse(\"setting\"),\"\",";
[self _additem:[self._library _getstringresourse:@"setting"] :@"" :@"setting"];
 //BA.debugLineNum = 95;BA.debugLine="AddItem(Library.GetStringResourse(\"again_update\")";
[self _additem:[self._library _getstringresourse:@"again_update"] :@"" :@"update_db"];
 //BA.debugLineNum = 97;BA.debugLine="If AddInformation = False Then";
if (self._addinformation==[self.__c False]) { 
 //BA.debugLineNum = 98;BA.debugLine="If Library.listInformation.IsInitialized = False";
if ([self._library._listinformation IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 99;BA.debugLine="Dim opInformation As OpenCart";
_opinformation = [b4i_opencart new];
 //BA.debugLineNum = 100;BA.debugLine="opInformation.Initialize";
[_opinformation _initialize:self.bi];
 //BA.debugLineNum = 101;BA.debugLine="opInformation.GetInformation(Me,\"information_re";
[_opinformation _getinformation:self :@"information_receive"];
 }else {
 //BA.debugLineNum = 103;BA.debugLine="ShowInformationLink(Library.listInformation)";
[self _showinformationlink:self._library._listinformation];
 };
 };
 //BA.debugLineNum = 107;BA.debugLine="AddItem(Library.GetStringResourse(\"share_app\"),\"";
[self _additem:[self._library _getstringresourse:@"share_app"] :@"" :@"shareme"];
 //BA.debugLineNum = 109;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addheadertitle:(NSString*) _title{
B4IPanelWrapper* _p = nil;
 //BA.debugLineNum = 137;BA.debugLine="Private Sub AddHeaderTitle(Title As String)";
 //BA.debugLineNum = 139;BA.debugLine="Dim p As Panel";
_p = [B4IPanelWrapper new];
 //BA.debugLineNum = 140;BA.debugLine="p.Initialize(\"\")";
[_p Initialize:self.bi :@""];
 //BA.debugLineNum = 141;BA.debugLine="p.LoadLayout(\"frmslidemenu_header\")";
[_p LoadLayout:@"frmslidemenu_header" :self.bi];
 //BA.debugLineNum = 143;BA.debugLine="lbltitle_header.Color = Library.ConvertHex2Int(Li";
[self._lbltitle_header setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"menubar_header"]]].intValue];
 //BA.debugLineNum = 144;BA.debugLine="lbltitle_header.TextColor = Library.ConvertHex2In";
[self._lbltitle_header setTextColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"menubar_textcolor"]]].intValue];
 //BA.debugLineNum = 145;BA.debugLine="lbltitle_header.Text = \"  \" & Title";
[self._lbltitle_header setText:[@[@"  ",_title] componentsJoinedByString:@""]];
 //BA.debugLineNum = 146;BA.debugLine="lbltitle_header.Font = Library.GetFont(14)";
[self._lbltitle_header setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 147;BA.debugLine="lsheader.Add(p,40dip,\"\")";
[self._lsheader _add:_p :[self.__c DipToCurrent:(int) (40)] :(NSObject*)(@"")];
 //BA.debugLineNum = 149;BA.debugLine="lbltitle_header.TextAlignment = Library.GetString";
[self._lbltitle_header setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 151;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _additem:(NSString*) _title :(NSString*) _icon :(NSString*) _svalue{
B4IPanelWrapper* _p1 = nil;
 //BA.debugLineNum = 111;BA.debugLine="Private Sub AddItem(Title As String,Icon As String";
 //BA.debugLineNum = 113;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 114;BA.debugLine="p1.Initialize(\"lsheader\")";
[_p1 Initialize:self.bi :@"lsheader"];
 //BA.debugLineNum = 116;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 117;BA.debugLine="p1.LoadLayout(\"frmslidemenu_item\")";
[_p1 LoadLayout:@"frmslidemenu_item" :self.bi];
 }else {
 //BA.debugLineNum = 119;BA.debugLine="p1.LoadLayout(\"frmslidemenu_item_en\")";
[_p1 LoadLayout:@"frmslidemenu_item_en" :self.bi];
 };
 //BA.debugLineNum = 122;BA.debugLine="lsheader.Add(p1,43dip,sValue)";
[self._lsheader _add:_p1 :[self.__c DipToCurrent:(int) (43)] :(NSObject*)(_svalue)];
 //BA.debugLineNum = 124;BA.debugLine="lbltitle.Text = \" \" & Title";
[self._lbltitle setText:[@[@" ",_title] componentsJoinedByString:@""]];
 //BA.debugLineNum = 125;BA.debugLine="lblicon.Text = Icon";
[self._lblicon setText:_icon];
 //BA.debugLineNum = 126;BA.debugLine="lbltitle.Font = Library.GetFont(13)";
[self._lbltitle setFont:[self._library _getfont:(int) (13)]];
 //BA.debugLineNum = 127;BA.debugLine="Library.SetFont(lblicon,\"icomoon\",19)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblicon).object)] :@"icomoon" :(int) (19)];
 //BA.debugLineNum = 128;BA.debugLine="lbltitle.TextColor = Library.ConvertHex2Int(Libra";
[self._lbltitle setTextColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"menubar_textcolor"]]].intValue];
 //BA.debugLineNum = 129;BA.debugLine="lblicon.TextColor = Library.Theme_Header";
[self._lblicon setTextColor:self._library._theme_header];
 //BA.debugLineNum = 130;BA.debugLine="lbltitle.Tag = sValue";
[self._lbltitle setTag:(NSObject*)(_svalue)];
 //BA.debugLineNum = 131;BA.debugLine="lblicon.Tag = sValue";
[self._lblicon setTag:(NSObject*)(_svalue)];
 //BA.debugLineNum = 132;BA.debugLine="left = p1.Left";
self._left = (int) ([_p1 Left]);
 //BA.debugLineNum = 133;BA.debugLine="width = p1.Width";
self._width = (int) ([_p1 Width]);
 //BA.debugLineNum = 135;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _bookmark_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _temp = nil;
 //BA.debugLineNum = 171;BA.debugLine="Sub bookmark_receive(res As Map,cat As String)";
 //BA.debugLineNum = 173;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 175;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 176;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 177;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 178;BA.debugLine="temp = res.Get(\"data\")";
_temp = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 179;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 180;BA.debugLine="actProducts.res = temp.Get(\"products\")";
self._actproducts._res.object = (NSArray*)([_temp Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 181;BA.debugLine="actProducts.title = Library.GetStringResourse(\"";
self._actproducts._title = [self._library _getstringresourse:@"bookmark"];
 //BA.debugLineNum = 182;BA.debugLine="actProducts.StartActivity";
[self._actproducts _startactivity];
 };
 };
 //BA.debugLineNum = 186;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnitem_click{
B4IViewWrapper* _v1 = nil;
int _bg = 0;
 //BA.debugLineNum = 153;BA.debugLine="Sub btnitem_Click";
 //BA.debugLineNum = 155;BA.debugLine="Dim v1 As View";
_v1 = [B4IViewWrapper new];
 //BA.debugLineNum = 156;BA.debugLine="v1 = Sender";
_v1.object = (UIView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 158;BA.debugLine="v2 = v1";
self._v2 = _v1;
 //BA.debugLineNum = 160;BA.debugLine="side.CloseMenu";
[self._side CloseMenu];
 //BA.debugLineNum = 162;BA.debugLine="Dim bg As Int";
_bg = 0;
 //BA.debugLineNum = 163;BA.debugLine="bg = Library.GetParent(v1).Color";
_bg = [[self._library _getparent:_v1] Color];
 //BA.debugLineNum = 164;BA.debugLine="Library.GetParent(v1).Color = Colors.Rgb(233, 234";
[[self._library _getparent:_v1] setColor:[[self.__c Colors] RGB:(int) (233) :(int) (234) :(int) (238)]];
 //BA.debugLineNum = 165;BA.debugLine="Library.GetParent(v1).SetColorAnimated(600,bg)";
[[self._library _getparent:_v1] SetColorAnimated:(int) (600) :_bg];
 //BA.debugLineNum = 166;BA.debugLine="value = v1.Tag";
self._value = [self.bi ObjectToString:[_v1 Tag]];
 //BA.debugLineNum = 167;BA.debugLine="DoAction";
[self _doaction];
 //BA.debugLineNum = 169;BA.debugLine="End Sub";
return @"";
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
 //BA.debugLineNum = 3;BA.debugLine="Private AddInformation As Boolean";
self._addinformation = false;
 //BA.debugLineNum = 4;BA.debugLine="Private lsheader As CustomListView";
self._lsheader = [b4i_customlistview new];
 //BA.debugLineNum = 5;BA.debugLine="Private meModule As Object";
self._memodule = [NSObject new];
 //BA.debugLineNum = 6;BA.debugLine="Private SubscribeState As String";
self._subscribestate = @"";
 //BA.debugLineNum = 7;BA.debugLine="Private tmrdelay As Timer";
self._tmrdelay = [B4ITimer new];
 //BA.debugLineNum = 8;BA.debugLine="Private value As String";
self._value = @"";
 //BA.debugLineNum = 9;BA.debugLine="Private pageSide As Page";
self._pageside = [B4IPage new];
 //BA.debugLineNum = 10;BA.debugLine="Private side As SideMenuController";
self._side = [B4ISideMenuController new];
 //BA.debugLineNum = 11;BA.debugLine="Private pnlslide As Panel";
self._pnlslide = [B4IPanelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private imglogo As ImageView";
self._imglogo = [B4IImageViewWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private left,width As Int";
self._left = 0;
self._width = 0;
 //BA.debugLineNum = 15;BA.debugLine="Private lblicon As Label";
self._lblicon = [B4ILabelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private lbltitle_header As Label";
self._lbltitle_header = [B4ILabelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private v2 As View";
self._v2 = [B4IViewWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _detailsinformation_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _temp = nil;
 //BA.debugLineNum = 238;BA.debugLine="Sub DetailsInformation_receive(res As Map,cat As S";
 //BA.debugLineNum = 240;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 242;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 243;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 244;BA.debugLine="Dim	temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 245;BA.debugLine="temp = res.Get(\"data\")";
_temp = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 246;BA.debugLine="actWeb.title	= temp.Get(\"title\")";
self._actweb._title = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"title")]];
 //BA.debugLineNum = 247;BA.debugLine="actWeb.title = actWeb.title.Replace(\"&quot;\",QU";
self._actweb._title = [[self._actweb._title Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"];
 //BA.debugLineNum = 248;BA.debugLine="actWeb.data		= temp.Get(\"description\")";
self._actweb._data = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"description")]];
 //BA.debugLineNum = 249;BA.debugLine="actWeb.StartActivity";
[self._actweb _startactivity];
 };
 };
 //BA.debugLineNum = 253;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _doaction{
b4i_opencart* _op = nil;
NSString* _link = @"";
 //BA.debugLineNum = 255;BA.debugLine="Private Sub DoAction";
 //BA.debugLineNum = 257;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 258;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 260;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 262;BA.debugLine="If value = \"catalog\" Then";
if ([self._value isEqual:@"catalog"]) { 
 //BA.debugLineNum = 263;BA.debugLine="actCategory.StartActivity";
[self._actcategory _startactivity];
 }else if([self._value isEqual:@"home"]) { 
 //BA.debugLineNum = 266;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 }else if([self._value isEqual:@"new"]) { 
 //BA.debugLineNum = 270;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 271;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 272;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 275;BA.debugLine="CallSubDelayed2(actMenu,\"LoadProductSplit\",\"newp";
[self.__c CallSubDelayed2:self.bi :(NSObject*)((self._actmenu).object) :@"LoadProductSplit" :(NSObject*)(@"newproduct")];
 }else if([self._value isEqual:@"feature"]) { 
 //BA.debugLineNum = 279;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 280;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 281;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 284;BA.debugLine="CallSubDelayed2(actMenu,\"LoadProductSplit\",\"feat";
[self.__c CallSubDelayed2:self.bi :(NSObject*)((self._actmenu).object) :@"LoadProductSplit" :(NSObject*)(@"featureproduct")];
 }else if([self._value isEqual:@"best"]) { 
 //BA.debugLineNum = 288;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 289;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 290;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 293;BA.debugLine="CallSubDelayed2(actMenu,\"LoadProductSplit\",\"best";
[self.__c CallSubDelayed2:self.bi :(NSObject*)((self._actmenu).object) :@"LoadProductSplit" :(NSObject*)(@"bestproduct")];
 }else if([self._value isEqual:@"finish_product"]) { 
 //BA.debugLineNum = 296;BA.debugLine="CallSubDelayed(actProduct,\"FinishMe\")";
[self.__c CallSubDelayed:self.bi :(NSObject*)((self._actproduct).object) :@"FinishMe"];
 }else if([self._value isEqual:@"register"]) { 
 //BA.debugLineNum = 300;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 301;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 302;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 305;BA.debugLine="actRegister.StartActivity";
[self._actregister _startactivity];
 }else if([self._value isEqual:@"login"]) { 
 //BA.debugLineNum = 308;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 309;BA.debugLine="actLogin.StartActivity";
[self._actlogin _startactivity];
 }else if([self._value isEqual:@"about"]) { 
 //BA.debugLineNum = 313;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 314;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 315;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 318;BA.debugLine="actAbout.StartActivity";
[self._actabout _startactivity];
 }else if([self._value isEqual:@"contact"]) { 
 //BA.debugLineNum = 321;BA.debugLine="actContact.StartActivity";
[self._actcontact _startactivity];
 }else if([self._value isEqual:@"setting"]) { 
 //BA.debugLineNum = 324;BA.debugLine="SettingMenu";
[self _settingmenu];
 }else if([self._value isEqual:@"account"]) { 
 //BA.debugLineNum = 328;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 329;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 330;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 333;BA.debugLine="actAccount.StartActivity";
[self._actaccount _startactivity];
 }else if([self._value isEqual:@"basket"]) { 
 //BA.debugLineNum = 337;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 338;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 339;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 342;BA.debugLine="actBasket.StartActivity";
[self._actbasket _startactivity];
 }else if([self._value isEqual:@"bookmark"]) { 
 //BA.debugLineNum = 346;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 347;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 348;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 351;BA.debugLine="Library.HUD.ProgressDialogShow(Library.GetString";
[self._library._hud ProgressDialogShow:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 353;BA.debugLine="op.Wishlist(Me,\"bookmark_receive\",\"\")";
[_op _wishlist:self :@"bookmark_receive" :@""];
 }else if([self._value isEqual:@"logout"]) { 
 //BA.debugLineNum = 357;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 358;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 359;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 362;BA.debugLine="CallSubDelayed(actMenu,\"Logout\")";
[self.__c CallSubDelayed:self.bi :(NSObject*)((self._actmenu).object) :@"Logout"];
 }else if([self.__c IsNumber:self._value]) { 
 //BA.debugLineNum = 366;BA.debugLine="Library.HUD.ProgressDialogShow(Library.GetString";
[self._library._hud ProgressDialogShow:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 367;BA.debugLine="op.GetInformationDetailsID(Me,\"DetailsInformatio";
[_op _getinformationdetailsid:self :@"DetailsInformation_receive" :self._value];
 }else if([self._value isEqual:@"update_db"]) { 
 //BA.debugLineNum = 370;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_category2\"";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_category2"];
 //BA.debugLineNum = 371;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_category_p";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_category_product2"];
 //BA.debugLineNum = 372;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_string_fil";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_string_file"];
 //BA.debugLineNum = 373;BA.debugLine="File.Delete(CacheData.DirCache,\"caches\")";
[[self.__c File] Delete:self._cachedata._dircache :@"caches"];
 //BA.debugLineNum = 374;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_string_fil";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_string_files"];
 //BA.debugLineNum = 375;BA.debugLine="CallSubDelayed(actMenu,\"ReRunApp\")";
[self.__c CallSubDelayed:self.bi :(NSObject*)((self._actmenu).object) :@"ReRunApp"];
 }else if([self._value isEqual:@"shareme"]) { 
 //BA.debugLineNum = 378;BA.debugLine="Dim link As String";
_link = @"";
 //BA.debugLineNum = 379;BA.debugLine="link = Library.GetStringResourse(\"url\")";
_link = [self._library _getstringresourse:@"url"];
 //BA.debugLineNum = 380;BA.debugLine="modShare.ShareToSocialMedia(Library.MenuPage, Li";
[self._modshare _sharetosocialmedia:self._library._menupage :[self._library _getstringresourse:@"share"] :_link :self._v2];
 };
 //BA.debugLineNum = 384;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _information_receive:(B4IMap*) _res :(NSString*) _cat{
B4IList* _ls = nil;
 //BA.debugLineNum = 198;BA.debugLine="Sub information_receive(res As Map,cat As String)";
 //BA.debugLineNum = 200;BA.debugLine="If res.ContainsKey(\"data\") Then";
if ([_res ContainsKey:(NSObject*)(@"data")]) { 
 //BA.debugLineNum = 202;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 203;BA.debugLine="ls = res.Get(\"data\")";
_ls.object = (NSArray*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 205;BA.debugLine="If ls.Size = 0 Then Return";
if ([_ls Size]==0) { 
if (true) return @"";};
 //BA.debugLineNum = 207;BA.debugLine="Library.listInformation = ls";
self._library._listinformation = _ls;
 //BA.debugLineNum = 209;BA.debugLine="ShowInformationLink(ls)";
[self _showinformationlink:_ls];
 };
 //BA.debugLineNum = 213;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba :(int) _titlebarheight :(NSObject*) _module{
[self initializeClassModule];
 //BA.debugLineNum = 20;BA.debugLine="Public Sub Initialize(titlebarHeight As Int,Module";
 //BA.debugLineNum = 22;BA.debugLine="Library.NavControl.Initialize(\"nc\")";
[self._library._navcontrol Initialize:self.bi :@"nc"];
 //BA.debugLineNum = 24;BA.debugLine="pageSide.Initialize(\"pageside\")";
[self._pageside Initialize:self.bi :@"pageside"];
 //BA.debugLineNum = 25;BA.debugLine="pageSide.RootPanel.SizeToFit";
[[self._pageside RootPanel] SizeToFit];
 //BA.debugLineNum = 26;BA.debugLine="pageSide.RootPanel.LoadLayout(\"frmslidemenu\")";
[[self._pageside RootPanel] LoadLayout:@"frmslidemenu" :self.bi];
 //BA.debugLineNum = 27;BA.debugLine="pageSide.HideBackButton = True";
[self._pageside setHideBackButton:[self.__c True]];
 //BA.debugLineNum = 29;BA.debugLine="lsheader.Initialize(Me,\"lsheader\",pnlslide.Width)";
[self._lsheader _initialize:self.bi :self :@"lsheader" :(int) ([self._pnlslide Width])];
 //BA.debugLineNum = 30;BA.debugLine="pnlslide.AddView(lsheader.AsView,0,imglogo.Height";
[self._pnlslide AddView:(UIView*)(([self._lsheader _asview]).object) :(float) (0) :(float) ([self._imglogo Height]-25) :[self.__c PerXToCurrent:(float) (100)] :(float) ([self._pnlslide Height]-([self._imglogo Top]+[self._imglogo Height]))];
 //BA.debugLineNum = 32;BA.debugLine="pnlslide.Color = Library.ConvertHex2Int(Library.G";
[self._pnlslide setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"menubar_color"]]].intValue];
 //BA.debugLineNum = 33;BA.debugLine="pageSide.RootPanel.Color = Library.ConvertHex2Int";
[[self._pageside RootPanel] setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"menubar_color"]]].intValue];
 //BA.debugLineNum = 35;BA.debugLine="imglogo.Top = -23";
[self._imglogo setTop:(float) (-23)];
 //BA.debugLineNum = 37;BA.debugLine="Library.NavControl.NavigationBarVisible = False";
[self._library._navcontrol setNavigationBarVisible:[self.__c False]];
 //BA.debugLineNum = 38;BA.debugLine="Library.NavControl.ToolBarVisible = False";
[self._library._navcontrol setToolBarVisible:[self.__c False]];
 //BA.debugLineNum = 40;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 41;BA.debugLine="side.Initialize(Null,Library.NavControl,pageSide";
[self._side Initialize:(B4IPage*) [B4IObjectWrapper createWrapper:[B4IPage new] object:(UIViewController*)([self.__c Null])] :self._library._navcontrol :self._pageside];
 }else {
 //BA.debugLineNum = 43;BA.debugLine="side.Initialize(pageSide,Library.NavControl,Null";
[self._side Initialize:self._pageside :self._library._navcontrol :(B4IPage*) [B4IObjectWrapper createWrapper:[B4IPage new] object:(UIViewController*)([self.__c Null])]];
 };
 //BA.debugLineNum = 46;BA.debugLine="Library.APP.KeyController = side";
[self._library._app setKeyController:(UIViewController*)((self._side).object)];
 //BA.debugLineNum = 47;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 48;BA.debugLine="AddHeader(False)";
[self _addheader:[self.__c False]];
 //BA.debugLineNum = 50;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _openmenu{
 //BA.debugLineNum = 52;BA.debugLine="Sub OpenMenu";
 //BA.debugLineNum = 54;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 55;BA.debugLine="side.OpenRightMenu";
[self._side OpenRightMenu];
 }else {
 //BA.debugLineNum = 57;BA.debugLine="side.OpenLeftMenu";
[self._side OpenLeftMenu];
 };
 //BA.debugLineNum = 60;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _settingmenu{
 //BA.debugLineNum = 188;BA.debugLine="Private Sub SettingMenu";
 //BA.debugLineNum = 190;BA.debugLine="If Library.Application.OSVersion >= 8 Then";
if ([self.bi ObjectToNumber:[self._library._application OSVersion]].doubleValue>=8) { 
 //BA.debugLineNum = 191;BA.debugLine="Library.App.OpenURL(\"app-settings:\")";
[self._library._app OpenURL:@"app-settings:"];
 }else {
 //BA.debugLineNum = 193;BA.debugLine="Msgbox(Library.GetStringResourse2(\"error_net_det";
[self.__c Msgbox:[self._library _getstringresourse2:@"error_net_details"] :[self._library _getstringresourse2:@"alert"]];
 };
 //BA.debugLineNum = 196;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _showinformationlink:(B4IList*) _ls{
int _i = 0;
B4IMap* _te = nil;
NSString* _sname = @"";
 //BA.debugLineNum = 215;BA.debugLine="Sub ShowInformationLink(ls As List)";
 //BA.debugLineNum = 217;BA.debugLine="If AddInformation = True Then Return";
if (self._addinformation==[self.__c True]) { 
if (true) return @"";};
 //BA.debugLineNum = 219;BA.debugLine="AddHeaderTitle(Library.GetStringResourse(\"shop_in";
[self _addheadertitle:[self._library _getstringresourse:@"shop_inf"]];
 //BA.debugLineNum = 221;BA.debugLine="For i = 0 To ls.Size - 1";
{
const int step3 = 1;
const int limit3 = (int) ([_ls Size]-1);
_i = (int) (0) ;
for (;(step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3) ;_i = ((int)(0 + _i + step3))  ) {
 //BA.debugLineNum = 223;BA.debugLine="Dim te As Map";
_te = [B4IMap new];
 //BA.debugLineNum = 224;BA.debugLine="te = ls.Get(i)";
_te = (B4IMap*)([_ls Get:_i]);
 //BA.debugLineNum = 225;BA.debugLine="Dim sname As String";
_sname = @"";
 //BA.debugLineNum = 226;BA.debugLine="sname = te.Get(\"title\")";
_sname = [self.bi ObjectToString:[_te Get:(NSObject*)(@"title")]];
 //BA.debugLineNum = 227;BA.debugLine="sname = sname.Replace(\"&quot;\",QUOTE).Replace(\"&";
_sname = [[_sname Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"];
 //BA.debugLineNum = 228;BA.debugLine="AddItem(sname,\"\",te.Get(\"id\"))";
[self _additem:_sname :@"" :[self.bi ObjectToString:[_te Get:(NSObject*)(@"id")]]];
 }
};
 //BA.debugLineNum = 234;BA.debugLine="AddInformation = True";
self._addinformation = [self.__c True];
 //BA.debugLineNum = 236;BA.debugLine="End Sub";
return @"";
}
@end
