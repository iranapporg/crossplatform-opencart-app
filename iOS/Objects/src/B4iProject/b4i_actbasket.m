
#import "b4i_actbasket.h"
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


@implementation b4i_actbasket 


+ (instancetype)new {
    static b4i_actbasket* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _addcoupon_receive:(BOOL) _state{
 //BA.debugLineNum = 391;BA.debugLine="Sub addcoupon_receive(state As Boolean)";
 //BA.debugLineNum = 393;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 395;BA.debugLine="txtcoupon_id.Text = \"\"";
[self._txtcoupon_id setText:@""];
 //BA.debugLineNum = 397;BA.debugLine="If state = True Then";
if (_state==[self.__c True]) { 
 //BA.debugLineNum = 398;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"add_coupon"] :(long long) (1.5) :[self.__c True]];
 //BA.debugLineNum = 399;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 400;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 402;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_coupon"] :(long long) (1.5) :[self.__c False]];
 };
 //BA.debugLineNum = 405;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addvoucher_receive:(BOOL) _state{
 //BA.debugLineNum = 421;BA.debugLine="Sub addvoucher_receive(state As Boolean)";
 //BA.debugLineNum = 423;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 425;BA.debugLine="txtvoucher_id.Text = \"\"";
[self._txtvoucher_id setText:@""];
 //BA.debugLineNum = 427;BA.debugLine="If state = True Then";
if (_state==[self.__c True]) { 
 //BA.debugLineNum = 428;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"add_voucher"] :(long long) (1.5) :[self.__c True]];
 //BA.debugLineNum = 429;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 430;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 432;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_voucher"] :(long long) (1.5) :[self.__c False]];
 };
 //BA.debugLineNum = 435;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclear_click{
 //BA.debugLineNum = 149;BA.debugLine="Sub btnclear_Click";
 //BA.debugLineNum = 150;BA.debugLine="op1.ClearCart(Me,\"ClearCart_receive\")";
[self._op1 _clearcart:self :@"ClearCart_receive"];
 //BA.debugLineNum = 151;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 109;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 111;BA.debugLine="If Library.pageBasket = Library.LastPage Then Lib";
if ([self._library._pagebasket isEqual:self._library._lastpage]) { 
self._library._lastpage = self._library._menupage;};
 //BA.debugLineNum = 112;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 114;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_me_click{
 //BA.debugLineNum = 497;BA.debugLine="Sub btnclose_me_Click";
 //BA.debugLineNum = 498;BA.debugLine="pnlcount.SetLayoutAnimated(600,1,0,Library.GetHei";
[self._pnlcount SetLayoutAnimated:(int) (600) :(float) (1) :(float) (0) :(float) ([self._library _getheight]+[self._pnlcount Height]) :[self._pnlcount Width] :[self._pnlcount Height]];
 //BA.debugLineNum = 499;BA.debugLine="sv1.ScrollTo(0,0,True)";
[self._sv1 ScrollTo:(int) (0) :(int) (0) :[self.__c True]];
 //BA.debugLineNum = 500;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncoupon_click{
b4i_opencart* _coupon = nil;
 //BA.debugLineNum = 377;BA.debugLine="Sub btncoupon_Click";
 //BA.debugLineNum = 379;BA.debugLine="If IsNumber(txtcoupon_id.Text) Then";
if ([self.__c IsNumber:[self._txtcoupon_id Text]]) { 
 //BA.debugLineNum = 380;BA.debugLine="Dim coupon As OpenCart";
_coupon = [b4i_opencart new];
 //BA.debugLineNum = 381;BA.debugLine="coupon.Initialize";
[_coupon _initialize:self.bi];
 //BA.debugLineNum = 382;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 383;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 384;BA.debugLine="coupon.AddCoupon(Me,\"addcoupon_receive\",txtcoupo";
[_coupon _addcoupon:self :@"addcoupon_receive" :[self._txtcoupon_id Text]];
 }else {
 //BA.debugLineNum = 386;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"enter_coupon"] :(long long) (1.5) :[self.__c False]];
 };
 //BA.debugLineNum = 389;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnpayment_click{
 //BA.debugLineNum = 116;BA.debugLine="Sub btnpayment_Click";
 //BA.debugLineNum = 118;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 119;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 120;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 123;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if ([self._library._logindetails IsInitialized]) { 
 //BA.debugLineNum = 124;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ([[self._library._logindetails Get:(NSObject*)(@"login")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 125;BA.debugLine="If DateTime.Now - Library.loginDetails.Get(\"exp";
if ([[self.__c DateTime] Now]-[self.bi ObjectToNumber:[self._library._logindetails Get:(NSObject*)(@"expire")]].doubleValue>1010020) { 
 //BA.debugLineNum = 126;BA.debugLine="Library.LastPage = Library.pageBasket";
self._library._lastpage = self._library._pagebasket;
 //BA.debugLineNum = 127;BA.debugLine="actLogin.StartActivity";
[self._actlogin _startactivity];
 //BA.debugLineNum = 128;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 130;BA.debugLine="Library.LastPage = Library.pageBasket";
self._library._lastpage = self._library._pagebasket;
 //BA.debugLineNum = 131;BA.debugLine="actDoOrder.StartActivity";
[self._actdoorder _startactivity];
 //BA.debugLineNum = 132;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 136;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if ([self._library._guestlogin IsInitialized]) { 
 //BA.debugLineNum = 137;BA.debugLine="If Library.GuestLogin.Get(\"login\") = True Then";
if ([[self._library._guestlogin Get:(NSObject*)(@"login")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 138;BA.debugLine="Library.LastPage = Library.pageBasket";
self._library._lastpage = self._library._pagebasket;
 //BA.debugLineNum = 139;BA.debugLine="actDoOrder.StartActivity";
[self._actdoorder _startactivity];
 //BA.debugLineNum = 140;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 144;BA.debugLine="Library.LastPage = Library.pageBasket";
self._library._lastpage = self._library._pagebasket;
 //BA.debugLineNum = 145;BA.debugLine="actLogin.StartActivity";
[self._actlogin _startactivity];
 //BA.debugLineNum = 147;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnvoucher_click{
b4i_opencart* _coupon = nil;
 //BA.debugLineNum = 407;BA.debugLine="Sub btnvoucher_Click";
 //BA.debugLineNum = 409;BA.debugLine="If IsNumber(txtvoucher_id.Text) Then";
if ([self.__c IsNumber:[self._txtvoucher_id Text]]) { 
 //BA.debugLineNum = 410;BA.debugLine="Dim coupon As OpenCart";
_coupon = [b4i_opencart new];
 //BA.debugLineNum = 411;BA.debugLine="coupon.Initialize";
[_coupon _initialize:self.bi];
 //BA.debugLineNum = 412;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 413;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 414;BA.debugLine="coupon.AddVoucher(Me,\"addvoucher_receive\",txtvou";
[_coupon _addvoucher:self :@"addvoucher_receive" :[self._txtvoucher_id Text]];
 }else {
 //BA.debugLineNum = 416;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"enter_voucher"] :(long long) (1.5) :[self.__c False]];
 };
 //BA.debugLineNum = 419;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _carts_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _total = nil;
B4IMap* _images = nil;
B4IList* _l1 = nil;
b4i_html* _html1 = nil;
int _i = 0;
B4IMap* _temp = nil;
B4IPanelWrapper* _p1 = nil;
int _qu = 0;
B4IList* _ls = nil;
int _j = 0;
B4IList* _options = nil;
int _topoption = 0;
int _k = 0;
B4IMap* _te = nil;
B4ILabelWrapper* _lblkey = nil;
b4i_imagedownloader* _down = nil;
 //BA.debugLineNum = 180;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 182;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 184;BA.debugLine="If res = Null Then";
if (_res== nil) { 
 //BA.debugLineNum = 185;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"no_cart"] :[self.__c False]];
 //BA.debugLineNum = 186;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 187;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 190;BA.debugLine="If res.IsInitialized = False Then";
if ([_res IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 191;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"no_cart"] :[self.__c False]];
 //BA.debugLineNum = 192;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 193;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 196;BA.debugLine="Library.CartDetails = res";
self._library._cartdetails = _res;
 //BA.debugLineNum = 197;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"basket";
[self._lbltitle setText:[@[[self._library _getstringresourse:@"basket_title"],[@" [0]" Replace:@"0" :[self.bi NumberToString:@([self._op1 _getcartcount])]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 199;BA.debugLine="Dim total As Map";
_total = [B4IMap new];
 //BA.debugLineNum = 200;BA.debugLine="total = op1.GetCartTotal(res.Get(\"totals\"))";
_total = [self._op1 _getcarttotal:(B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([_res Get:(NSObject*)(@"totals")])]];
 //BA.debugLineNum = 201;BA.debugLine="lbltotal.Text = total.Get(\"total\")";
[self._lbltotal setText:[self.bi ObjectToString:[_total Get:(NSObject*)(@"total")]]];
 //BA.debugLineNum = 203;BA.debugLine="Dim images As Map";
_images = [B4IMap new];
 //BA.debugLineNum = 204;BA.debugLine="images.Initialize";
[_images Initialize];
 //BA.debugLineNum = 206;BA.debugLine="If res.ContainsKey(\"products\") Then";
if ([_res ContainsKey:(NSObject*)(@"products")]) { 
 //BA.debugLineNum = 208;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 209;BA.debugLine="l1.Initialize";
[_l1 Initialize];
 //BA.debugLineNum = 210;BA.debugLine="l1 = res.Get(\"products\")";
_l1.object = (NSArray*)([_res Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 212;BA.debugLine="Dim images As Map";
_images = [B4IMap new];
 //BA.debugLineNum = 213;BA.debugLine="images.Initialize";
[_images Initialize];
 //BA.debugLineNum = 215;BA.debugLine="Dim html1 As Html";
_html1 = [b4i_html new];
 //BA.debugLineNum = 217;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 219;BA.debugLine="For i = 0 To l1.Size - 1";
{
const int step27 = 1;
const int limit27 = (int) ([_l1 Size]-1);
_i = (int) (0) ;
for (;(step27 > 0 && _i <= limit27) || (step27 < 0 && _i >= limit27) ;_i = ((int)(0 + _i + step27))  ) {
 //BA.debugLineNum = 221;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 222;BA.debugLine="temp = l1.Get(i)";
_temp = (B4IMap*)([_l1 Get:_i]);
 //BA.debugLineNum = 224;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 225;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 226;BA.debugLine="sv1.Panel.AddView(p1,0,Top,sv1.Width,0)";
[[self._sv1 Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (self._top) :[self._sv1 Width] :(float) (0)];
 //BA.debugLineNum = 228;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 229;BA.debugLine="p1.LoadLayout(\"frmtemplate_car\")";
[_p1 LoadLayout:@"frmtemplate_car" :self.bi];
 }else {
 //BA.debugLineNum = 231;BA.debugLine="p1.LoadLayout(\"frmtemplate_car_en\")";
[_p1 LoadLayout:@"frmtemplate_car_en" :self.bi];
 };
 //BA.debugLineNum = 234;BA.debugLine="lblcprice.Font = Library.GetFont(lblcprice.Font";
[self._lblcprice setFont:[self._library _getfont:(int) ([[self._lblcprice Font] Size])]];
 //BA.debugLineNum = 235;BA.debugLine="Library.SetFont(lblremove_product,\"icomoon\",lbl";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblremove_product).object)] :@"icomoon" :(int) ([[self._lblremove_product Font] Size])];
 //BA.debugLineNum = 237;BA.debugLine="p1.Height = pnlitemcart.Height + 10dip";
[_p1 setHeight:(float) ([self._pnlitemcart Height]+[self.__c DipToCurrent:(int) (10)])];
 //BA.debugLineNum = 239;BA.debugLine="lblcount.Text = Library.GetStringResourse(\"cart";
[self._lblcount setText:[self._library _getstringresourse:@"cart_product_count"]];
 //BA.debugLineNum = 241;BA.debugLine="Dim qu As Int";
_qu = 0;
 //BA.debugLineNum = 242;BA.debugLine="qu = temp.Get(\"quantity\")";
_qu = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"quantity")]].intValue;
 //BA.debugLineNum = 244;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 245;BA.debugLine="ls.Initialize";
[_ls Initialize];
 //BA.debugLineNum = 247;BA.debugLine="For j = 1 To 80";
{
const int step46 = 1;
const int limit46 = (int) (80);
_j = (int) (1) ;
for (;(step46 > 0 && _j <= limit46) || (step46 < 0 && _j >= limit46) ;_j = ((int)(0 + _j + step46))  ) {
 //BA.debugLineNum = 248;BA.debugLine="ls.Add(j)";
[_ls Add:(NSObject*)(@(_j))];
 }
};
 //BA.debugLineNum = 253;BA.debugLine="txtcartcount.Tag = temp.Get(\"key\")";
[self._txtcartcount setTag:[_temp Get:(NSObject*)(@"key")]];
 //BA.debugLineNum = 254;BA.debugLine="txtcartcount.Text = qu";
[self._txtcartcount setText:[self.bi NumberToString:@(_qu)]];
 //BA.debugLineNum = 255;BA.debugLine="lblremove_product.Tag = temp.Get(\"key\")";
[self._lblremove_product setTag:[_temp Get:(NSObject*)(@"key")]];
 //BA.debugLineNum = 257;BA.debugLine="lblctitle.Text = \" \" & temp.Get(\"name\") & \" \"";
[self._lblctitle setText:[@[@" ",[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]],@" "] componentsJoinedByString:@""]];
 //BA.debugLineNum = 258;BA.debugLine="lblctitle.Text = lblctitle.Text.Replace(\"&quot;";
[self._lblctitle setText:[[[self._lblctitle Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 259;BA.debugLine="lblctitle.TextAlignment = Library.GetStringReso";
[self._lblctitle setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 260;BA.debugLine="lblcprice.TextAlignment = Library.GetStringReso";
[self._lblcprice setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 261;BA.debugLine="lblcprice.Text = temp.Get(\"price\")";
[self._lblcprice setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]]];
 //BA.debugLineNum = 263;BA.debugLine="images.Put(imgicon,temp.Get(\"thumb\"))";
[_images Put:(NSObject*)((self._imgicon).object) :[_temp Get:(NSObject*)(@"thumb")]];
 //BA.debugLineNum = 265;BA.debugLine="Dim options As List";
_options = [B4IList new];
 //BA.debugLineNum = 266;BA.debugLine="options = temp.Get(\"option\")";
_options.object = (NSArray*)([_temp Get:(NSObject*)(@"option")]);
 //BA.debugLineNum = 268;BA.debugLine="Dim topOption As Int";
_topoption = 0;
 //BA.debugLineNum = 269;BA.debugLine="topOption = pnlitemcart.Height";
_topoption = (int) ([self._pnlitemcart Height]);
 //BA.debugLineNum = 271;BA.debugLine="If options.IsInitialized Then";
if ([_options IsInitialized]) { 
 //BA.debugLineNum = 272;BA.debugLine="For k = 0 To options.Size - 1";
{
const int step63 = 1;
const int limit63 = (int) ([_options Size]-1);
_k = (int) (0) ;
for (;(step63 > 0 && _k <= limit63) || (step63 < 0 && _k >= limit63) ;_k = ((int)(0 + _k + step63))  ) {
 //BA.debugLineNum = 273;BA.debugLine="Dim te As Map";
_te = [B4IMap new];
 //BA.debugLineNum = 274;BA.debugLine="te = options.Get(k)";
_te = (B4IMap*)([_options Get:_k]);
 //BA.debugLineNum = 275;BA.debugLine="Dim lblKey As Label";
_lblkey = [B4ILabelWrapper new];
 //BA.debugLineNum = 276;BA.debugLine="lblKey.Initialize(\"\")";
[_lblkey Initialize:self.bi :@""];
 //BA.debugLineNum = 277;BA.debugLine="lblKey.Color = Colors.White";
[_lblkey setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 278;BA.debugLine="lblKey.Font = Library.GetFont(14)";
[_lblkey setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 279;BA.debugLine="lblKey.TextColor = Colors.Black";
[_lblkey setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 280;BA.debugLine="Library.UnderLine(te.Get(\"name\") & \" : \" & te";
[self._library _underline:[@[[self.bi ObjectToString:[_te Get:(NSObject*)(@"name")]],@" : ",[self.bi ObjectToString:[_te Get:(NSObject*)(@"value")]]] componentsJoinedByString:@""] :_lblkey];
 //BA.debugLineNum = 281;BA.debugLine="lblKey.TextAlignment = Library.GetStringResou";
[_lblkey setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 282;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
[self._library _paddinglabel:_lblkey :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 283;BA.debugLine="pnlitemcart.AddView(lblKey,18,topOption,pnlit";
[self._pnlitemcart AddView:(UIView*)((_lblkey).object) :(float) (18) :(float) (_topoption) :(float) ([self._pnlitemcart Width]-20) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 284;BA.debugLine="pnlitemcart.Height = pnlitemcart.Height + 42d";
[self._pnlitemcart setHeight:(float) ([self._pnlitemcart Height]+[self.__c DipToCurrent:(int) (42)])];
 //BA.debugLineNum = 285;BA.debugLine="topOption = topOption + 35dip";
_topoption = (int) (_topoption+[self.__c DipToCurrent:(int) (35)]);
 //BA.debugLineNum = 286;BA.debugLine="p1.Height = pnlitemcart.Height";
[_p1 setHeight:[self._pnlitemcart Height]];
 }
};
 //BA.debugLineNum = 289;BA.debugLine="topOption = pnlitemcart.Height";
_topoption = (int) ([self._pnlitemcart Height]);
 };
 //BA.debugLineNum = 292;BA.debugLine="Top = Top + p1.Height + 1dip";
self._top = (int) (self._top+[_p1 Height]+[self.__c DipToCurrent:(int) (1)]);
 }
};
 //BA.debugLineNum = 296;BA.debugLine="Dim down As ImageDownloader";
_down = [b4i_imagedownloader new];
 //BA.debugLineNum = 297;BA.debugLine="down.Initialize";
[_down _initialize:self.bi];
 //BA.debugLineNum = 298;BA.debugLine="down.Download(images)";
[_down _download:_images];
 //BA.debugLineNum = 300;BA.debugLine="sv1.Panel.Height = Top";
[[self._sv1 Panel] setHeight:(float) (self._top)];
 //BA.debugLineNum = 301;BA.debugLine="sv1.ContentHeight = Top + 60dip";
[self._sv1 setContentHeight:(int) (self._top+[self.__c DipToCurrent:(int) (60)])];
 //BA.debugLineNum = 303;BA.debugLine="If l1.Size < 4 Then";
if ([_l1 Size]<4) { 
 //BA.debugLineNum = 304;BA.debugLine="sv1.ContentHeight = Top + 360dip";
[self._sv1 setContentHeight:(int) (self._top+[self.__c DipToCurrent:(int) (360)])];
 };
 };
 //BA.debugLineNum = 309;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _clearcart_receive:(B4IMap*) _res :(NSString*) _cat{
NSString* _r1 = @"";
 //BA.debugLineNum = 153;BA.debugLine="Sub ClearCart_receive(res As Map,cat As String)";
 //BA.debugLineNum = 155;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 157;BA.debugLine="Dim r1 As String";
_r1 = @"";
 //BA.debugLineNum = 158;BA.debugLine="r1 = res.Get(\"success\")";
_r1 = [self.bi ObjectToString:[_res Get:(NSObject*)(@"success")]];
 //BA.debugLineNum = 160;BA.debugLine="If r1.ToLowerCase = 1 Then";
if ([[_r1 ToLowerCase] isEqual:[self.bi NumberToString:@(1)]]) { 
 //BA.debugLineNum = 161;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"cleared"] :[self.__c False]];
 //BA.debugLineNum = 162;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 163;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 165;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 };
 };
 //BA.debugLineNum = 170;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _deleteitem_receive:(B4IMap*) _res :(NSString*) _cat{
NSString* _re = @"";
 //BA.debugLineNum = 326;BA.debugLine="Sub DeleteItem_receive(res As Map,cat As String)";
 //BA.debugLineNum = 328;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 330;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 331;BA.debugLine="Dim re As String";
_re = @"";
 //BA.debugLineNum = 332;BA.debugLine="re = res.Get(\"success\")";
_re = [self.bi ObjectToString:[_res Get:(NSObject*)(@"success")]];
 //BA.debugLineNum = 334;BA.debugLine="If re.ToLowerCase = \"false\" Then";
if ([[_re ToLowerCase] isEqual:@"false"]) { 
 //BA.debugLineNum = 335;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 }else {
 //BA.debugLineNum = 337;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"deleted_item"] :(long long) (1.5) :[self.__c True]];
 };
 };
 //BA.debugLineNum = 342;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getcart{
 //BA.debugLineNum = 172;BA.debugLine="Sub GetCart";
 //BA.debugLineNum = 173;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 174;BA.debugLine="sv1.Panel.RemoveAllViews";
[[self._sv1 Panel] RemoveAllViews];
 //BA.debugLineNum = 175;BA.debugLine="sv1.Panel.Height = 0";
[[self._sv1 Panel] setHeight:(float) (0)];
 //BA.debugLineNum = 176;BA.debugLine="Top = 0";
self._top = (int) (0);
 //BA.debugLineNum = 177;BA.debugLine="op1.GetCarts(Me,\"Carts_receive\")";
[self._op1 _getcarts:self :@"Carts_receive"];
 //BA.debugLineNum = 178;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblremove_product_click{
B4ILabelWrapper* _p1 = nil;
NSString* _product = @"";
 //BA.debugLineNum = 311;BA.debugLine="Sub lblremove_product_Click";
 //BA.debugLineNum = 313;BA.debugLine="Dim p1 As Label";
_p1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 314;BA.debugLine="p1 = Sender";
_p1.object = (UILabel*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 316;BA.debugLine="Dim product As String";
_product = @"";
 //BA.debugLineNum = 317;BA.debugLine="product = p1.Tag";
_product = [self.bi ObjectToString:[_p1 Tag]];
 //BA.debugLineNum = 320;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 321;BA.debugLine="op1.UpdateProductCart(Me,\"UpdateProduct_receive\"";
[self._op1 _updateproductcart:self :@"UpdateProduct_receive" :_product :@"0"];
 //BA.debugLineNum = 324;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pagebasket_keyboardstatechanged:(float) _height{
 //BA.debugLineNum = 481;BA.debugLine="Sub pageBasket_KeyboardStateChanged (Height As Flo";
 //BA.debugLineNum = 487;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 4;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 5;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private btnpayment As Button";
self._btnpayment = [B4IButtonWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private btnclear As Button";
self._btnclear = [B4IButtonWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private lbltotal As Label";
self._lbltotal = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private lblsabadtitle As Label";
self._lblsabadtitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private op1 As OpenCart";
self._op1 = [b4i_opencart new];
 //BA.debugLineNum = 13;BA.debugLine="Private txtcartcount As TextField";
self._txtcartcount = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private lblcprice As Label";
self._lblcprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private lblctitle As Label";
self._lblctitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private imgicon As ImageView";
self._imgicon = [B4IImageViewWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private pnlitemcart As Panel";
self._pnlitemcart = [B4IPanelWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 19;BA.debugLine="Private Top As Int = 0";
self._top = (int) (0);
 //BA.debugLineNum = 20;BA.debugLine="Private lblcount As Label";
self._lblcount = [B4ILabelWrapper new];
 //BA.debugLineNum = 21;BA.debugLine="Private btncoupon As Button";
self._btncoupon = [B4IButtonWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private lblremove_product As Label";
self._lblremove_product = [B4ILabelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private txtcoupon_id As TextField";
self._txtcoupon_id = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 24;BA.debugLine="Private txtvoucher_id As TextField";
self._txtvoucher_id = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private btnvoucher As Button";
self._btnvoucher = [B4IButtonWrapper new];
 //BA.debugLineNum = 26;BA.debugLine="Private BiggerSV,DoAnimateSV As Boolean";
self._biggersv = false;
self._doanimatesv = false;
 //BA.debugLineNum = 27;BA.debugLine="Private DefaultTopSV,DefaultHeightSV As Int";
self._defaulttopsv = 0;
self._defaultheightsv = 0;
 //BA.debugLineNum = 28;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 29;BA.debugLine="Private timerAnimation As Timer";
self._timeranimation = [B4ITimer new];
 //BA.debugLineNum = 31;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 32;BA.debugLine="Private txtcount_pk As Picker";
self._txtcount_pk = [B4IPickerWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="Private pnlcount As Panel";
self._pnlcount = [B4IPanelWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="Private currentKey As String";
self._currentkey = @"";
 //BA.debugLineNum = 37;BA.debugLine="Private btnclose_me As Button";
self._btnclose_me = [B4IButtonWrapper new];
 //BA.debugLineNum = 38;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IList* _lsitem = nil;
int _p = 0;
 //BA.debugLineNum = 40;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 42;BA.debugLine="Library.pageBasket.Initialize(\"pageBasket\")";
[self._library._pagebasket Initialize:self.bi :@"pageBasket"];
 //BA.debugLineNum = 44;BA.debugLine="Library.pageBasket.RootPanel.LoadLayout(\"frmbaske";
[[self._library._pagebasket RootPanel] LoadLayout:@"frmbasket" :self.bi];
 //BA.debugLineNum = 45;BA.debugLine="Library.NavControl.ShowPage(Library.pageBasket)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._pagebasket).object)];
 //BA.debugLineNum = 46;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 47;BA.debugLine="Library.SetFont(btnclose_me,\"icomoon\",btnclose_me";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose_me).object)] :@"icomoon" :(int) ([[[self._btnclose_me CustomLabel] Font] Size])];
 //BA.debugLineNum = 48;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 50;BA.debugLine="Dim lsitem As List";
_lsitem = [B4IList new];
 //BA.debugLineNum = 51;BA.debugLine="lsitem.Initialize";
[_lsitem Initialize];
 //BA.debugLineNum = 53;BA.debugLine="For P = 1 To 100";
{
const int step9 = 1;
const int limit9 = (int) (100);
_p = (int) (1) ;
for (;(step9 > 0 && _p <= limit9) || (step9 < 0 && _p >= limit9) ;_p = ((int)(0 + _p + step9))  ) {
 //BA.debugLineNum = 54;BA.debugLine="lsitem.Add(P)";
[_lsitem Add:(NSObject*)(@(_p))];
 }
};
 //BA.debugLineNum = 57;BA.debugLine="txtcount_pk.SetItems(0,lsitem)";
[self._txtcount_pk SetItems:(int) (0) :_lsitem];
 //BA.debugLineNum = 58;BA.debugLine="txtcount_pk.SelectRow(0,6,True)";
[self._txtcount_pk SelectRow:(int) (0) :(int) (6) :[self.__c True]];
 //BA.debugLineNum = 60;BA.debugLine="btnpayment.Top = Library.GetHeight-btnpayment.Hei";
[self._btnpayment setTop:(float) ([self._library _getheight]-[self._btnpayment Height]-[self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 62;BA.debugLine="btnclear.CustomLabel.Font = Library.GetFont(btncl";
[[self._btnclear CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnclear CustomLabel] Font] Size])]];
 //BA.debugLineNum = 63;BA.debugLine="btncoupon.CustomLabel.Font = Library.GetFont(btnc";
[[self._btncoupon CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btncoupon CustomLabel] Font] Size])]];
 //BA.debugLineNum = 64;BA.debugLine="btnvoucher.CustomLabel.Font = Library.GetFont(btn";
[[self._btnvoucher CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnvoucher CustomLabel] Font] Size])]];
 //BA.debugLineNum = 65;BA.debugLine="btnpayment.CustomLabel.Font = Library.GetFont(btn";
[[self._btnpayment CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnpayment CustomLabel] Font] Size])]];
 //BA.debugLineNum = 67;BA.debugLine="MyToastMessageShow1.Initialize(Library.pageBasket";
[self._mytoastmessageshow1 _initialize:self.bi :[self._library._pagebasket RootPanel]];
 //BA.debugLineNum = 69;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"basket";
[self._lbltitle setText:[self._library _getstringresourse:@"basket_title"]];
 //BA.debugLineNum = 70;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 71;BA.debugLine="btnclear.Text = Library.GetStringResourse(\"btncle";
[self._btnclear setText:[self._library _getstringresourse:@"btnclear"]];
 //BA.debugLineNum = 72;BA.debugLine="btnpayment.Text = Library.GetStringResourse(\"btnp";
[self._btnpayment setText:[self._library _getstringresourse:@"btnpayment"]];
 //BA.debugLineNum = 73;BA.debugLine="lblsabadtitle.Text = Library.GetStringResourse(\"b";
[self._lblsabadtitle setText:[self._library _getstringresourse:@"basket_total"]];
 //BA.debugLineNum = 74;BA.debugLine="lbltotal.Text = \"0\"";
[self._lbltotal setText:@"0"];
 //BA.debugLineNum = 76;BA.debugLine="btncoupon.Text = Library.GetStringResourse(\"new_c";
[self._btncoupon setText:[self._library _getstringresourse:@"new_coupon"]];
 //BA.debugLineNum = 77;BA.debugLine="txtcoupon_id.HintText = Library.GetStringResourse";
[self._txtcoupon_id setHintText:[self._library _getstringresourse:@"enter_coupon"]];
 //BA.debugLineNum = 78;BA.debugLine="txtvoucher_id.HintText = Library.GetStringResours";
[self._txtvoucher_id setHintText:[self._library _getstringresourse:@"enter_voucher"]];
 //BA.debugLineNum = 79;BA.debugLine="btnvoucher.Text = Library.GetStringResourse(\"new_";
[self._btnvoucher setText:[self._library _getstringresourse:@"new_voucher"]];
 //BA.debugLineNum = 83;BA.debugLine="btnpayment.Color =Library.ConvertHex2Int(Library.";
[self._btnpayment setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 84;BA.debugLine="btnclear.Color = Colors.Transparent";
[self._btnclear setColor:[[self.__c Colors] Transparent]];
 //BA.debugLineNum = 86;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 87;BA.debugLine="op1.Initialize";
[self._op1 _initialize:self.bi];
 //BA.debugLineNum = 89;BA.debugLine="sv1.Color = Colors.RGB(247, 244, 244)";
[self._sv1 setColor:[[self.__c Colors] RGB:(int) (247) :(int) (244) :(int) (244)]];
 //BA.debugLineNum = 90;BA.debugLine="sv1.Panel.Color = Colors.RGB(247, 244, 244)";
[[self._sv1 Panel] setColor:[[self.__c Colors] RGB:(int) (247) :(int) (244) :(int) (244)]];
 //BA.debugLineNum = 92;BA.debugLine="DefaultHeightSV = sv1.Height";
self._defaultheightsv = (int) ([self._sv1 Height]);
 //BA.debugLineNum = 93;BA.debugLine="DefaultTopSV = sv1.Top";
self._defaulttopsv = (int) ([self._sv1 Top]);
 //BA.debugLineNum = 95;BA.debugLine="timerAnimation.Initialize(\"tmrAnimation\",1000)";
[self._timeranimation Initialize:self.bi :@"tmrAnimation" :(long long) (1000)];
 //BA.debugLineNum = 97;BA.debugLine="If Library.IsEnglish Then";
if ([self._library _isenglish]) { 
 //BA.debugLineNum = 98;BA.debugLine="lbltotal.Font = Library.GetFont(lbltotal.Font.Si";
[self._lbltotal setFont:[self._library _getfont:(int) ([[self._lbltotal Font] Size])]];
 //BA.debugLineNum = 99;BA.debugLine="lblsabadtitle.Left = lbltotal.Left";
[self._lblsabadtitle setLeft:[self._lbltotal Left]];
 //BA.debugLineNum = 100;BA.debugLine="lbltotal.Left = lblsabadtitle.Left + lblsabadtit";
[self._lbltotal setLeft:(float) ([self._lblsabadtitle Left]+[self._lblsabadtitle Width])];
 //BA.debugLineNum = 101;BA.debugLine="lbltotal.TextAlignment = lbltotal.ALIGNMENT_LEFT";
[self._lbltotal setTextAlignment:[self._lbltotal ALIGNMENT_LEFT]];
 //BA.debugLineNum = 102;BA.debugLine="lblsabadtitle.TextAlignment = lbltotal.ALIGNMENT";
[self._lblsabadtitle setTextAlignment:[self._lbltotal ALIGNMENT_LEFT]];
 };
 //BA.debugLineNum = 105;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 107;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _sv1_scrollchanged:(int) _offsetx :(int) _offsety{
 //BA.debugLineNum = 437;BA.debugLine="Sub sv1_ScrollChanged(OffsetX As Int, OffsetY As I";
 //BA.debugLineNum = 439;BA.debugLine="If timerAnimation.Enabled = True Then Return";
if ([self._timeranimation Enabled]==[self.__c True]) { 
if (true) return @"";};
 //BA.debugLineNum = 441;BA.debugLine="If OffsetY < 1 And DoAnimateSV = True Then";
if (_offsety<1 && self._doanimatesv==[self.__c True]) { 
 //BA.debugLineNum = 442;BA.debugLine="DoAnimateSV = False";
self._doanimatesv = [self.__c False];
 //BA.debugLineNum = 443;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 446;BA.debugLine="If OffsetY > 0 And BiggerSV = False Then";
if (_offsety>0 && self._biggersv==[self.__c False]) { 
 //BA.debugLineNum = 447;BA.debugLine="sv1.SetLayoutAnimated(400,1,0,lbltotal.Top + lbl";
[self._sv1 SetLayoutAnimated:(int) (400) :(float) (1) :(float) (0) :(float) ([self._lbltotal Top]+[self._lbltotal Height]+[self._lbltotal Height]+[self.__c DipToCurrent:(int) (19)]) :[self._sv1 Width] :(float) ([self._library _getheight]-[self._lbltotal Height]-[self._pnlheader Height]-[self._btnclear Height]-[self._btnclear Height])];
 //BA.debugLineNum = 448;BA.debugLine="timerAnimation.Enabled = True";
[self._timeranimation setEnabled:[self.__c True]];
 //BA.debugLineNum = 449;BA.debugLine="DoAnimateSV = True";
self._doanimatesv = [self.__c True];
 //BA.debugLineNum = 450;BA.debugLine="BiggerSV = True";
self._biggersv = [self.__c True];
 //BA.debugLineNum = 451;BA.debugLine="sv1.ScrollTo(0,0,True)";
[self._sv1 ScrollTo:(int) (0) :(int) (0) :[self.__c True]];
 }else if(_offsety<1) { 
 //BA.debugLineNum = 455;BA.debugLine="If BiggerSV = True Then";
if (self._biggersv==[self.__c True]) { 
 //BA.debugLineNum = 456;BA.debugLine="sv1.SetLayoutAnimated(400,1,0,DefaultTopSV,sv1.";
[self._sv1 SetLayoutAnimated:(int) (400) :(float) (1) :(float) (0) :(float) (self._defaulttopsv) :[self._sv1 Width] :(float) (self._defaultheightsv)];
 //BA.debugLineNum = 457;BA.debugLine="timerAnimation.Enabled = True";
[self._timeranimation setEnabled:[self.__c True]];
 };
 //BA.debugLineNum = 460;BA.debugLine="BiggerSV = False";
self._biggersv = [self.__c False];
 };
 //BA.debugLineNum = 464;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmranimation_tick{
 //BA.debugLineNum = 466;BA.debugLine="Sub tmrAnimation_Tick";
 //BA.debugLineNum = 467;BA.debugLine="timerAnimation.Enabled = False";
[self._timeranimation setEnabled:[self.__c False]];
 //BA.debugLineNum = 468;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtcartcount_beginedit{
B4ITextFieldWrapper* _sp = nil;
 //BA.debugLineNum = 470;BA.debugLine="Sub txtcartcount_BeginEdit";
 //BA.debugLineNum = 472;BA.debugLine="Dim sp As TextField";
_sp = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 473;BA.debugLine="sp = Sender";
_sp.object = (UITextField*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 475;BA.debugLine="Library.pageBasket.ResignFocus";
[self._library._pagebasket ResignFocus];
 //BA.debugLineNum = 476;BA.debugLine="pnlcount.SetLayoutAnimated(600,1,0,Library.GetHei";
[self._pnlcount SetLayoutAnimated:(int) (600) :(float) (1) :(float) (0) :(float) ([self._library _getheight]-[self._pnlcount Height]) :[self._pnlcount Width] :[self._pnlcount Height]];
 //BA.debugLineNum = 477;BA.debugLine="currentKey = sp.Tag";
self._currentkey = [self.bi ObjectToString:[_sp Tag]];
 //BA.debugLineNum = 479;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtcartcount_itemselected:(int) _column :(int) _row{
B4IPickerWrapper* _sp = nil;
NSString* _id = @"";
 //BA.debugLineNum = 344;BA.debugLine="Sub txtcartcount_ItemSelected (Column As Int, Row";
 //BA.debugLineNum = 346;BA.debugLine="Dim sp As Picker";
_sp = [B4IPickerWrapper new];
 //BA.debugLineNum = 347;BA.debugLine="sp = Sender";
_sp.object = (UIPickerView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 349;BA.debugLine="Dim id As String";
_id = @"";
 //BA.debugLineNum = 350;BA.debugLine="id = sp.Tag";
_id = [self.bi ObjectToString:[_sp Tag]];
 //BA.debugLineNum = 352;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 353;BA.debugLine="op1.UpdateProductCart(Me,\"UpdateProduct_receive\",";
[self._op1 _updateproductcart:self :@"UpdateProduct_receive" :_id :[self._txtcartcount Text]];
 //BA.debugLineNum = 355;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtcount_pk_itemselected:(int) _column :(int) _row{
 //BA.debugLineNum = 489;BA.debugLine="Sub txtcount_pk_ItemSelected (Column As Int, Row A";
 //BA.debugLineNum = 491;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 492;BA.debugLine="op1.UpdateProductCart(Me,\"UpdateProduct_receive\",";
[self._op1 _updateproductcart:self :@"UpdateProduct_receive" :self._currentkey :[self.bi ObjectToString:[self._txtcount_pk GetSelectedItem:(int) (0)]]];
 //BA.debugLineNum = 493;BA.debugLine="pnlcount.SetLayoutAnimated(600,1,0,Library.GetHei";
[self._pnlcount SetLayoutAnimated:(int) (600) :(float) (1) :(float) (0) :(float) ([self._library _getheight]+[self._pnlcount Height]) :[self._pnlcount Width] :[self._pnlcount Height]];
 //BA.debugLineNum = 495;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _updateproduct_receive:(B4IMap*) _res :(NSString*) _cat{
NSString* _re = @"";
 //BA.debugLineNum = 357;BA.debugLine="Sub UpdateProduct_receive(res As Map,cat As String";
 //BA.debugLineNum = 359;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 361;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 362;BA.debugLine="Dim re As String";
_re = @"";
 //BA.debugLineNum = 363;BA.debugLine="re = res.Get(\"success\")";
_re = [self.bi ObjectToString:[_res Get:(NSObject*)(@"success")]];
 //BA.debugLineNum = 365;BA.debugLine="If re.ToLowerCase = \"false\" Then";
if ([[_re ToLowerCase] isEqual:@"false"]) { 
 //BA.debugLineNum = 366;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 }else {
 //BA.debugLineNum = 368;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"update_count_item"] :(long long) (1.5) :[self.__c True]];
 //BA.debugLineNum = 369;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 370;BA.debugLine="sv1.ScrollTo(0,0,True)";
[self._sv1 ScrollTo:(int) (0) :(int) (0) :[self.__c True]];
 };
 };
 //BA.debugLineNum = 375;BA.debugLine="End Sub";
return @"";
}
@end
