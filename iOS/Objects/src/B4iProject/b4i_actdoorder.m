
#import "b4i_actdoorder.h"
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


@implementation b4i_actdoorder 


+ (instancetype)new {
    static b4i_actdoorder* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _addaddress_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 180;BA.debugLine="Sub AddAddress_receive(res As Map,cat As String)";
 //BA.debugLineNum = 182;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 184;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 186;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 187;BA.debugLine="LoadData";
[self _loaddata];
 }else {
 //BA.debugLineNum = 191;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 193;BA.debugLine="If res.Get(\"error\") = \"User is not logged in\"";
if ([[_res Get:(NSObject*)(@"error")] isEqual:(NSObject*)(@"User is not logged in")]) { 
 //BA.debugLineNum = 194;BA.debugLine="Library.LastPage = Library.DoOrderPage";
self._library._lastpage = self._library._doorderpage;
 //BA.debugLineNum = 195;BA.debugLine="actLogin.StartActivity";
[self._actlogin _startactivity];
 //BA.debugLineNum = 196;BA.debugLine="Return";
if (true) return @"";
 }else if([[_res Get:(NSObject*)(@"error")] isKindOfClass: [B4IMap class]]) { 
 //BA.debugLineNum = 198;BA.debugLine="Library.ShowErrors(res.Get(\"error\"))";
[self._library _showerrors:(B4IMap*)([_res Get:(NSObject*)(@"error")])];
 }else if([[_res Get:(NSObject*)(@"error")] isEqual:(NSObject*)(@"Validate cart has products and has stock failed")]) { 
 //BA.debugLineNum = 200;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStrin";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"no_valid_cart"] :[self.__c True]];
 //BA.debugLineNum = 201;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 202;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 205;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 }else {
 //BA.debugLineNum = 208;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Libra";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 };
 };
 }else {
 //BA.debugLineNum = 214;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 };
 //BA.debugLineNum = 217;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addaddressship_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 176;BA.debugLine="Sub AddAddressShip_receive(res As Map,cat As Strin";
 //BA.debugLineNum = 178;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 330;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 332;BA.debugLine="If pnlpreview.Visible = True Then";
if ([self._pnlpreview Visible]==[self.__c True]) { 
 //BA.debugLineNum = 333;BA.debugLine="pnlpreview.Visible = False";
[self._pnlpreview setVisible:[self.__c False]];
 //BA.debugLineNum = 334;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 337;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 339;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncontinue_click{
b4i_opencart* _opconfirm = nil;
 //BA.debugLineNum = 600;BA.debugLine="Sub btncontinue_Click";
 //BA.debugLineNum = 602;BA.debugLine="pnlpreview.Visible = False";
[self._pnlpreview setVisible:[self.__c False]];
 //BA.debugLineNum = 604;BA.debugLine="If currentPaymentCode = \"cod\" Or currentPaymentCo";
if ([self._currentpaymentcode isEqual:@"cod"] || [self._currentpaymentcode isEqual:@"cheque"] || [self._currentpaymentcode isEqual:@"bank_transfer"]) { 
 //BA.debugLineNum = 605;BA.debugLine="Dim opConfirm As OpenCart";
_opconfirm = [b4i_opencart new];
 //BA.debugLineNum = 606;BA.debugLine="opConfirm.Initialize";
[_opconfirm _initialize:self.bi];
 //BA.debugLineNum = 607;BA.debugLine="opConfirm.SaveOrder(Me,\"SaveOrder_receive\",True)";
[_opconfirm _saveorder:self :@"SaveOrder_receive" :[self.__c True]];
 }else {
 //BA.debugLineNum = 609;BA.debugLine="actPayment.Data = order_id";
self._actpayment._data = self._order_id;
 //BA.debugLineNum = 610;BA.debugLine="actPayment.StartActivity";
[self._actpayment _startactivity];
 //BA.debugLineNum = 611;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 614;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnpayment_click{
b4i_opencart* _opconfirm = nil;
 //BA.debugLineNum = 401;BA.debugLine="Sub btnpayment_Click";
 //BA.debugLineNum = 403;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 404;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 405;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 408;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 410;BA.debugLine="Dim opConfirm As OpenCart";
_opconfirm = [b4i_opencart new];
 //BA.debugLineNum = 411;BA.debugLine="opConfirm.Initialize";
[_opconfirm _initialize:self.bi];
 //BA.debugLineNum = 412;BA.debugLine="opConfirm.SaveOrder(Me,\"ConfirmOrder_receive\",Fal";
[_opconfirm _saveorder:self :@"ConfirmOrder_receive" :[self.__c False]];
 //BA.debugLineNum = 414;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _confirmorder_receive:(B4IMap*) _res :(NSString*) _cat{
NSString* _err = @"";
B4IList* _l1 = nil;
B4IMap* _temp = nil;
int _top = 0;
int _i = 0;
B4IMap* _temp1 = nil;
B4IPanelWrapper* _p1 = nil;
B4IList* _l2 = nil;
int _j = 0;
B4IMap* _tm = nil;
B4ILabelWrapper* _lbl1 = nil;
B4IWebViewWrapper* _v = nil;
b4i_html* _html1 = nil;
NSString* _style = @"";
NSString* _extra = @"";
 //BA.debugLineNum = 416;BA.debugLine="Sub ConfirmOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 418;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 420;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 422;BA.debugLine="Dim err As String";
_err = @"";
 //BA.debugLineNum = 423;BA.debugLine="err = res.Get(\"error\")";
_err = [self.bi ObjectToString:[_res Get:(NSObject*)(@"error")]];
 //BA.debugLineNum = 424;BA.debugLine="err = err.ToLowerCase";
_err = [_err ToLowerCase];
 //BA.debugLineNum = 426;BA.debugLine="If err.StartsWith(\"empty payment method\") Then";
if ([_err StartsWith:@"empty payment method"]) { 
 //BA.debugLineNum = 427;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_payment_select"] :(long long) (1.5) :[self.__c False]];
 }else if([_err StartsWith:@"validate if shipping method has been set failed"]) { 
 //BA.debugLineNum = 429;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_ships_select"] :(long long) (1.5) :[self.__c False]];
 };
 //BA.debugLineNum = 432;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 438;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 439;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 440;BA.debugLine="pnlpreview.Visible = True";
[self._pnlpreview setVisible:[self.__c True]];
 //BA.debugLineNum = 442;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 443;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 444;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 446;BA.debugLine="l1.Initialize";
[_l1 Initialize];
 //BA.debugLineNum = 448;BA.debugLine="timerScroll.Initialize(\"tmrScroll\",1300)";
[self._timerscroll Initialize:self.bi :@"tmrScroll" :(long long) (1300)];
 //BA.debugLineNum = 450;BA.debugLine="svpreview.Panel.Height = 0";
[[self._svpreview Panel] setHeight:(float) (0)];
 //BA.debugLineNum = 451;BA.debugLine="svpreview.ScrollOffsetY = 0";
[self._svpreview setScrollOffsetY:(int) (0)];
 //BA.debugLineNum = 452;BA.debugLine="svpreview.Panel.RemoveAllViews";
[[self._svpreview Panel] RemoveAllViews];
 //BA.debugLineNum = 454;BA.debugLine="temp = res.Get(\"data\")";
_temp = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 455;BA.debugLine="order_id = temp.Get(\"order_id\")";
self._order_id = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"order_id")]];
 //BA.debugLineNum = 457;BA.debugLine="top = 0";
_top = (int) (0);
 //BA.debugLineNum = 458;BA.debugLine="l1 = temp.Get(\"products\")";
_l1.object = (NSArray*)([_temp Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 460;BA.debugLine="For i = 0 To l1.Size - 1";
{
const int step28 = 1;
const int limit28 = (int) ([_l1 Size]-1);
_i = (int) (0) ;
for (;(step28 > 0 && _i <= limit28) || (step28 < 0 && _i >= limit28) ;_i = ((int)(0 + _i + step28))  ) {
 //BA.debugLineNum = 462;BA.debugLine="Dim temp1 As Map";
_temp1 = [B4IMap new];
 //BA.debugLineNum = 463;BA.debugLine="temp1 = l1.Get(i)";
_temp1 = (B4IMap*)([_l1 Get:_i]);
 //BA.debugLineNum = 465;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 466;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 467;BA.debugLine="svpreview.Panel.AddView(p1,0,top,svpreview.Wid";
[[self._svpreview Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (_top) :[self._svpreview Width] :(float) (0)];
 //BA.debugLineNum = 469;BA.debugLine="p1.LoadLayout(\"frmsimple_product\")";
[_p1 LoadLayout:@"frmsimple_product" :self.bi];
 //BA.debugLineNum = 470;BA.debugLine="btnreturn.Enabled = False";
[self._btnreturn setEnabled:[self.__c False]];
 //BA.debugLineNum = 471;BA.debugLine="btnreturn.Text = \"\"";
[self._btnreturn setText:@""];
 //BA.debugLineNum = 472;BA.debugLine="Library.SetFont(btnreturn.CustomLabel,\"icomoon";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._btnreturn CustomLabel]).object)] :@"icomoon" :(int) ([[[self._btnreturn CustomLabel] Font] Size])];
 //BA.debugLineNum = 473;BA.debugLine="btnreturn.CustomLabel.TextColor = Colors.Green";
[[self._btnreturn CustomLabel] setTextColor:[[self.__c Colors] Green]];
 //BA.debugLineNum = 474;BA.debugLine="p1.Height = pnl_item_product.Height";
[_p1 setHeight:[self._pnl_item_product Height]];
 //BA.debugLineNum = 476;BA.debugLine="top = top + p1.Height + 5dip";
_top = (int) (_top+[_p1 Height]+[self.__c DipToCurrent:(int) (5)]);
 //BA.debugLineNum = 478;BA.debugLine="lblname_product.Text = temp1.Get(\"name\")";
[self._lblname_product setText:[self.bi ObjectToString:[_temp1 Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 479;BA.debugLine="lblname_product.Text = lblname_product.Text.Re";
[self._lblname_product setText:[[[self._lblname_product Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 480;BA.debugLine="lblprice_quantity.Text = temp1.Get(\"price\") &";
[self._lblprice_quantity setText:[@[[self.bi ObjectToString:[_temp1 Get:(NSObject*)(@"price")]],@" ",[self._library _getstringresourse:@"cart_product_count"],@" ",[self.bi ObjectToString:[_temp1 Get:(NSObject*)(@"quantity")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 481;BA.debugLine="lblname_product.TextAlignment = Library.GetStr";
[self._lblname_product setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 482;BA.debugLine="lblprice_quantity.TextAlignment = Library.GetS";
[self._lblprice_quantity setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 483;BA.debugLine="lblprice_quantity.Font = Library.GetFont(lblpr";
[self._lblprice_quantity setFont:[self._library _getfont:(int) ([[self._lblprice_quantity Font] Size])]];
 //BA.debugLineNum = 484;BA.debugLine="lblprice_quantity.Font = Library.GetFont(lblpr";
[self._lblprice_quantity setFont:[self._library _getfont:(int) ([[self._lblprice_quantity Font] Size])]];
 //BA.debugLineNum = 485;BA.debugLine="lblname_product.Font = Library.GetFont(lblpric";
[self._lblname_product setFont:[self._library _getfont:(int) ([[self._lblprice_quantity Font] Size])]];
 //BA.debugLineNum = 487;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Heigh";
[[self._svpreview Panel] setHeight:(float) ([[self._svpreview Panel] Height]+[_p1 Height])];
 }
};
 //BA.debugLineNum = 491;BA.debugLine="top = top + 5dip";
_top = (int) (_top+[self.__c DipToCurrent:(int) (5)]);
 //BA.debugLineNum = 500;BA.debugLine="top = top + 100dip";
_top = (int) (_top+[self.__c DipToCurrent:(int) (100)]);
 //BA.debugLineNum = 502;BA.debugLine="If temp.ContainsKey(\"totals\") Then";
if ([_temp ContainsKey:(NSObject*)(@"totals")]) { 
 //BA.debugLineNum = 503;BA.debugLine="Dim l2 As List";
_l2 = [B4IList new];
 //BA.debugLineNum = 504;BA.debugLine="l2 = temp.Get(\"totals\")";
_l2.object = (NSArray*)([_temp Get:(NSObject*)(@"totals")]);
 //BA.debugLineNum = 506;BA.debugLine="For j = 0 To l2.Size - 1";
{
const int step56 = 1;
const int limit56 = (int) ([_l2 Size]-1);
_j = (int) (0) ;
for (;(step56 > 0 && _j <= limit56) || (step56 < 0 && _j >= limit56) ;_j = ((int)(0 + _j + step56))  ) {
 //BA.debugLineNum = 508;BA.debugLine="Dim tm As Map";
_tm = [B4IMap new];
 //BA.debugLineNum = 509;BA.debugLine="tm = l2.Get(j)";
_tm = (B4IMap*)([_l2 Get:_j]);
 //BA.debugLineNum = 511;BA.debugLine="Dim lbl1 As Label";
_lbl1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 512;BA.debugLine="lbl1.Initialize(\"\")";
[_lbl1 Initialize:self.bi :@""];
 //BA.debugLineNum = 513;BA.debugLine="lbl1.TextColor = Colors.Black";
[_lbl1 setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 514;BA.debugLine="lbl1.Font = Library.GetFont(14)";
[_lbl1 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 515;BA.debugLine="lbl1.TextAlignment = Library.GetStringResours";
[_lbl1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 516;BA.debugLine="lbl1.Text = tm.Get(\"title\") & \" : \" & tm.Get(";
[_lbl1 setText:[@[[self.bi ObjectToString:[_tm Get:(NSObject*)(@"title")]],@" : ",[self.bi ObjectToString:[_tm Get:(NSObject*)(@"text")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 518;BA.debugLine="svpreview.Panel.AddView(lbl1,10dip,top,svprev";
[[self._svpreview Panel] AddView:(UIView*)((_lbl1).object) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) (_top) :(float) ([self._svpreview Width]-[self.__c DipToCurrent:(int) (30)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 519;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Heig";
[[self._svpreview Panel] setHeight:(float) ([[self._svpreview Panel] Height]+[_lbl1 Height])];
 //BA.debugLineNum = 521;BA.debugLine="top = top + lbl1.Height + 5dip";
_top = (int) (_top+[_lbl1 Height]+[self.__c DipToCurrent:(int) (5)]);
 }
};
 };
 //BA.debugLineNum = 527;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Height";
[[self._svpreview Panel] setHeight:(float) ([[self._svpreview Panel] Height]+100)];
 //BA.debugLineNum = 528;BA.debugLine="top = svpreview.Panel.Height";
_top = (int) ([[self._svpreview Panel] Height]);
 //BA.debugLineNum = 530;BA.debugLine="Dim v As WebView";
_v = [B4IWebViewWrapper new];
 //BA.debugLineNum = 531;BA.debugLine="Dim html1 As Html";
_html1 = [b4i_html new];
 //BA.debugLineNum = 532;BA.debugLine="html1.Initialize";
[_html1 _initialize:self.bi];
 //BA.debugLineNum = 533;BA.debugLine="v.Initialize(\"\")";
[_v Initialize:self.bi :@""];
 //BA.debugLineNum = 534;BA.debugLine="svpreview.Panel.AddView(v,10dip,top,svpreview.W";
[[self._svpreview Panel] AddView:(UIView*)((_v).object) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) (_top) :(float) ([self._svpreview Width]-[self.__c DipToCurrent:(int) (10)]) :(float) ([self.__c DipToCurrent:(int) (200)])];
 //BA.debugLineNum = 536;BA.debugLine="Dim style As String";
_style = @"";
 //BA.debugLineNum = 537;BA.debugLine="style = $\"<body style=\"background-color:#F7F4F4";
_style = (@"<body style=\"background-color:#F7F4F4;line-height:25px;font-family:tahoma;");
 //BA.debugLineNum = 539;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 540;BA.debugLine="style = style & $\"direction:rtl\">\"$";
_style = [@[_style,(@"direction:rtl\">")] componentsJoinedByString:@""];
 }else {
 //BA.debugLineNum = 542;BA.debugLine="style = style & $\"direction:ltr\">\"$";
_style = [@[_style,(@"direction:ltr\">")] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 545;BA.debugLine="Dim extra As String";
_extra = @"";
 //BA.debugLineNum = 546;BA.debugLine="extra = temp.Get(\"payment\")";
_extra = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"payment")]];
 //BA.debugLineNum = 548;BA.debugLine="extra = extra.Replace(\"[]\",\"\").Replace(\"{}\",\"\")";
_extra = [[_extra Replace:@"[]" :@""] Replace:@"{}" :@""];
 //BA.debugLineNum = 550;BA.debugLine="v.LoadHtml(style & html1.FromHtml(extra))";
[_v LoadHtml:[@[_style,[_html1 _fromhtml:_extra]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 552;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Height";
[[self._svpreview Panel] setHeight:(float) ([[self._svpreview Panel] Height]+[self.__c DipToCurrent:(int) (310)])];
 //BA.debugLineNum = 556;BA.debugLine="svpreview.ContentHeight = svpreview.Panel.Heigh";
[self._svpreview setContentHeight:(int) ([[self._svpreview Panel] Height])];
 //BA.debugLineNum = 557;BA.debugLine="svpreview.ContentWidth = Library.GetWidth";
[self._svpreview setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 559;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 566;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library.";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 568;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getways_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _methods = nil;
B4IList* _ls = nil;
NSString* _vs = @"";
B4IMap* _temp = nil;
 //BA.debugLineNum = 221;BA.debugLine="Sub Getways_receive(res As Map,cat As String)";
 //BA.debugLineNum = 223;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 225;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 226;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 228;BA.debugLine="Dim methods As Map";
_methods = [B4IMap new];
 //BA.debugLineNum = 229;BA.debugLine="methods = res.Get(\"data\")";
_methods = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 230;BA.debugLine="methods = methods.Get(\"payment_methods\")";
_methods = (B4IMap*)([_methods Get:(NSObject*)(@"payment_methods")]);
 //BA.debugLineNum = 231;BA.debugLine="lsPayment.Initialize";
[self._lspayment Initialize];
 //BA.debugLineNum = 233;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 234;BA.debugLine="ls.Initialize";
[_ls Initialize];
 //BA.debugLineNum = 236;BA.debugLine="ls.Add(Library.GetStringResourse(\"choose_one\"))";
[_ls Add:(NSObject*)([self._library _getstringresourse:@"choose_one"])];
 //BA.debugLineNum = 238;BA.debugLine="For Each vs As String In methods.Keys";
{
const id<B4IIterable> group11 = [_methods Keys];
const int groupLen11 = group11.Size
;int index11 = 0;
;
for (; index11 < groupLen11;index11++){
_vs = [self.bi ObjectToString:[group11 Get:index11]];
 //BA.debugLineNum = 239;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 240;BA.debugLine="temp = methods.Get(vs)";
_temp = (B4IMap*)([_methods Get:(NSObject*)(_vs)]);
 //BA.debugLineNum = 241;BA.debugLine="ls.Add(temp.Get(\"title\"))";
[_ls Add:[_temp Get:(NSObject*)(@"title")]];
 //BA.debugLineNum = 242;BA.debugLine="lsPayment.Add(temp.Get(\"code\"))";
[self._lspayment Add:[_temp Get:(NSObject*)(@"code")]];
 }
};
 //BA.debugLineNum = 245;BA.debugLine="pickerGetway.SetItems(0,ls)";
[self._pickergetway SetItems:(int) (0) :_ls];
 //BA.debugLineNum = 246;BA.debugLine="pickerGetway.SelectRow(0,0,True)";
[self._pickergetway SelectRow:(int) (0) :(int) (0) :[self.__c True]];
 //BA.debugLineNum = 248;BA.debugLine="btnpayment.InitializeCustom(\"btnpayment\",Colors";
[self._btnpayment InitializeCustom:@"btnpayment" :self.bi :[[self.__c Colors] White] :[[self.__c Colors] Gray]];
 //BA.debugLineNum = 249;BA.debugLine="btnpayment.Text = Library.GetStringResourse(\"pr";
[self._btnpayment setText:[self._library _getstringresourse:@"preview_finish"]];
 //BA.debugLineNum = 250;BA.debugLine="btnpayment.CustomLabel.Font = Library.GetFont(1";
[[self._btnpayment CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 252;BA.debugLine="btnpayment.Color = btncontinue.Color";
[self._btnpayment setColor:[self._btncontinue Color]];
 //BA.debugLineNum = 253;BA.debugLine="btnpayment.SetBorder(1,Colors.Gray,6)";
[self._btnpayment SetBorder:(float) (1) :[[self.__c Colors] Gray] :(float) (6)];
 //BA.debugLineNum = 255;BA.debugLine="pickerGetway.Top = lblpayment.Top + lblpayment.";
[self._pickergetway setTop:(float) ([self._lblpayment Top]+[self._lblpayment Height])];
 //BA.debugLineNum = 256;BA.debugLine="sv1.Panel.AddView(btnpayment,btncontinue.Left,t";
[[self._sv1 Panel] AddView:(UIView*)((self._btnpayment).object) :[self._btncontinue Left] :(float) (self._topsv) :[self._btncontinue Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 258;BA.debugLine="btnpayment.Top = pickerGetway.Top + pickerGetwa";
[self._btnpayment setTop:(float) ([self._pickergetway Top]+[self._pickergetway Height]+[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 260;BA.debugLine="topSv = topSv + pickerGetway.Top";
self._topsv = (int) (self._topsv+[self._pickergetway Top]);
 //BA.debugLineNum = 261;BA.debugLine="sv1.ContentHeight = topSv";
[self._sv1 setContentHeight:self._topsv];
 //BA.debugLineNum = 263;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 265;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 270;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _listaddress_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _d1 = nil;
B4IList* _lsaddressexist = nil;
B4IMap* _temp = nil;
 //BA.debugLineNum = 143;BA.debugLine="Sub ListAddress_receive(res As Map,cat As String)";
 //BA.debugLineNum = 145;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 147;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 148;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 150;BA.debugLine="Dim d1 As Map";
_d1 = [B4IMap new];
 //BA.debugLineNum = 151;BA.debugLine="d1 = res.Get(\"data\")";
_d1 = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 152;BA.debugLine="d1 = d1.Get(\"addresses\")";
_d1 = (B4IMap*)([_d1 Get:(NSObject*)(@"addresses")]);
 //BA.debugLineNum = 154;BA.debugLine="Dim lsAddressExist As List";
_lsaddressexist = [B4IList new];
 //BA.debugLineNum = 155;BA.debugLine="lsAddressExist.Initialize";
[_lsaddressexist Initialize];
 //BA.debugLineNum = 156;BA.debugLine="lsAddressIDs.Initialize";
[self._lsaddressids Initialize];
 //BA.debugLineNum = 158;BA.debugLine="For Each temp As Map In d1.Values";
{
const id<B4IIterable> group10 = [_d1 Values];
const int groupLen10 = group10.Size
;int index10 = 0;
;
for (; index10 < groupLen10;index10++){
_temp = (B4IMap*)([group10 Get:index10]);
 //BA.debugLineNum = 159;BA.debugLine="lsAddressExist.Add($\"${temp.Get(\"country\")} ${";
[_lsaddressexist Add:(NSObject*)(([@[@"",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"country")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"city")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"address_1")]],@""] componentsJoinedByString:@""]))];
 //BA.debugLineNum = 160;BA.debugLine="lsAddressIDs.Add(temp.Get(\"address_id\"))";
[self._lsaddressids Add:[_temp Get:(NSObject*)(@"address_id")]];
 //BA.debugLineNum = 161;BA.debugLine="lsaddr.AddTextItem($\"${temp.Get(\"country\")} ${";
[self._lsaddr _addtextitem:([@[@"",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"country")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"city")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"address_1")]],@""] componentsJoinedByString:@""]) :[_temp Get:(NSObject*)(@"address_id")]];
 }
};
 //BA.debugLineNum = 166;BA.debugLine="pnladdr.BringToFront";
[self._pnladdr BringToFront];
 //BA.debugLineNum = 167;BA.debugLine="pnladdr.Visible = True";
[self._pnladdr setVisible:[self.__c True]];
 //BA.debugLineNum = 169;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 174;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loaddata{
b4i_opencart* _o = nil;
 //BA.debugLineNum = 133;BA.debugLine="Sub LoadData";
 //BA.debugLineNum = 135;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 137;BA.debugLine="Dim o As OpenCart";
_o = [b4i_opencart new];
 //BA.debugLineNum = 138;BA.debugLine="o.Initialize";
[_o _initialize:self.bi];
 //BA.debugLineNum = 139;BA.debugLine="o.GetShipMethods(Me,\"ship_receive\")";
[_o _getshipmethods:self :@"ship_receive"];
 //BA.debugLineNum = 141;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lsaddr_itemclick:(int) _index :(NSObject*) _value{
b4i_opencart* _opaddresspayment = nil;
 //BA.debugLineNum = 628;BA.debugLine="Sub lsaddr_ItemClick (Index As Int, Value As Objec";
 //BA.debugLineNum = 630;BA.debugLine="If txtcomment.Text.Length = 0 Then";
if ([[self._txtcomment Text] Length]==0) { 
 //BA.debugLineNum = 631;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"order_comment"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 632;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 635;BA.debugLine="pnlloading.BringToFront";
[self._pnlloading BringToFront];
 //BA.debugLineNum = 636;BA.debugLine="pnladdr.Visible = False";
[self._pnladdr setVisible:[self.__c False]];
 //BA.debugLineNum = 637;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 639;BA.debugLine="Dim opAddressPayment As OpenCart";
_opaddresspayment = [b4i_opencart new];
 //BA.debugLineNum = 640;BA.debugLine="opAddressPayment.Initialize";
[_opaddresspayment _initialize:self.bi];
 //BA.debugLineNum = 641;BA.debugLine="opAddressPayment.AddAddress(Me,\"AddAddress_receiv";
[_opaddresspayment _addaddress:self :@"AddAddress_receive" :[self.__c createMap:@[(NSObject*)(@"payment_address"),(NSObject*)(@"existing"),(NSObject*)(@"address_id"),_value]] :[self.__c True]];
 //BA.debugLineNum = 643;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lsaddr_itemselected:(int) _column :(int) _row{
b4i_opencart* _opaddresspayment = nil;
 //BA.debugLineNum = 616;BA.debugLine="Sub lsaddr_ItemSelected (Column As Int, Row As Int";
 //BA.debugLineNum = 618;BA.debugLine="pnlloading.BringToFront";
[self._pnlloading BringToFront];
 //BA.debugLineNum = 619;BA.debugLine="pnladdr.Visible = False";
[self._pnladdr setVisible:[self.__c False]];
 //BA.debugLineNum = 620;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 622;BA.debugLine="Dim opAddressPayment As OpenCart";
_opaddresspayment = [b4i_opencart new];
 //BA.debugLineNum = 623;BA.debugLine="opAddressPayment.Initialize";
[_opaddresspayment _initialize:self.bi];
 //BA.debugLineNum = 624;BA.debugLine="opAddressPayment.AddAddress(Me,\"AddAddress_receiv";
[_opaddresspayment _addaddress:self :@"AddAddress_receive" :[self.__c createMap:@[(NSObject*)(@"payment_address"),(NSObject*)(@"existing"),(NSObject*)(@"address_id"),[self._lsaddressids Get:_row]]] :[self.__c True]];
 //BA.debugLineNum = 626;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _payment_itemselected:(int) _column :(int) _row{
b4i_opencart* _opship = nil;
 //BA.debugLineNum = 387;BA.debugLine="Sub payment_ItemSelected (Column As Int, Row As In";
 //BA.debugLineNum = 389;BA.debugLine="If Row = 0 Then Return";
if (_row==0) { 
if (true) return @"";};
 //BA.debugLineNum = 391;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 393;BA.debugLine="currentPaymentCode = lsPayment.Get(Row-1)";
self._currentpaymentcode = [self.bi ObjectToString:[self._lspayment Get:(int) (_row-1)]];
 //BA.debugLineNum = 395;BA.debugLine="Dim opShip As OpenCart";
_opship = [b4i_opencart new];
 //BA.debugLineNum = 396;BA.debugLine="opShip.Initialize";
[_opship _initialize:self.bi];
 //BA.debugLineNum = 397;BA.debugLine="opShip.SetPaymentMethods(Me,\"setPaymentMethod_rec";
[_opship _setpaymentmethods:self :@"setPaymentMethod_receive" :[self.bi ObjectToString:[self._lspayment Get:(int) (_row-1)]] :[@[[self._library _getstringresourse:@"inapp_buy"],[self.__c CRLF],[self._txtcomment Text]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 399;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 5;BA.debugLine="Private lsShips,lsPayment,lsAddressIDs As List";
self._lsships = [B4IList new];
self._lspayment = [B4IList new];
self._lsaddressids = [B4IList new];
 //BA.debugLineNum = 6;BA.debugLine="Private lblship As Label";
self._lblship = [B4ILabelWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private lblpayment As Label";
self._lblpayment = [B4ILabelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private btnpayment As Button";
self._btnpayment = [B4IButtonWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private currentPaymentCode As String";
self._currentpaymentcode = @"";
 //BA.debugLineNum = 14;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 15;BA.debugLine="Private topSv As Int = 0";
self._topsv = (int) (0);
 //BA.debugLineNum = 16;BA.debugLine="Private svpreview As ScrollView";
self._svpreview = [B4IScrollView new];
 //BA.debugLineNum = 17;BA.debugLine="Private btncontinue As Button";
self._btncontinue = [B4IButtonWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private pnlpreview As Panel";
self._pnlpreview = [B4IPanelWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private lblname_product As Label";
self._lblname_product = [B4ILabelWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Private lblprice_quantity As Label";
self._lblprice_quantity = [B4ILabelWrapper new];
 //BA.debugLineNum = 21;BA.debugLine="Private pnl_item_product As Panel";
self._pnl_item_product = [B4IPanelWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private order_id As String";
self._order_id = @"";
 //BA.debugLineNum = 23;BA.debugLine="Dim MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 24;BA.debugLine="Private btnreturn As Button";
self._btnreturn = [B4IButtonWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private timerScroll As Timer";
self._timerscroll = [B4ITimer new];
 //BA.debugLineNum = 26;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 27;BA.debugLine="Dim pickerGetway As Picker";
self._pickergetway = [B4IPickerWrapper new];
 //BA.debugLineNum = 28;BA.debugLine="Dim pickerShip As Picker";
self._pickership = [B4IPickerWrapper new];
 //BA.debugLineNum = 29;BA.debugLine="Private lbladdr As Label";
self._lbladdr = [B4ILabelWrapper new];
 //BA.debugLineNum = 30;BA.debugLine="Private lsaddr As CustomListView";
self._lsaddr = [b4i_customlistview new];
 //BA.debugLineNum = 31;BA.debugLine="Private pnladdr As Panel";
self._pnladdr = [B4IPanelWrapper new];
 //BA.debugLineNum = 32;BA.debugLine="Private lblcomment As Label";
self._lblcomment = [B4ILabelWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="Private txtcomment As TextField";
self._txtcomment = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 34;BA.debugLine="Private pnlinaddress As Panel";
self._pnlinaddress = [B4IPanelWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _saveorder_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 581;BA.debugLine="Sub SaveOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 583;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 585;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 586;BA.debugLine="Msgbox(Library.GetStringResourse(\"success_payme";
[self.__c Msgbox:[self._library _getstringresourse:@"success_payment"] :[self._library _getstringresourse:@"alert"]];
 //BA.debugLineNum = 587;BA.debugLine="actAccount.ChoosenTab = \"order\"";
self._actaccount._choosentab = @"order";
 //BA.debugLineNum = 588;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 589;BA.debugLine="actAccount.StartActivity";
[self._actaccount _startactivity];
 //BA.debugLineNum = 590;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 595;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 596;BA.debugLine="Msgbox(Library.GetStringResourse(\"error_payment\")";
[self.__c Msgbox:[self._library _getstringresourse:@"error_payment"] :[self._library _getstringresourse:@"alert"]];
 //BA.debugLineNum = 598;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setpaymentmethod_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 358;BA.debugLine="Sub setPaymentMethod_receive(res As Map,cat As Str";
 //BA.debugLineNum = 360;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 362;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 363;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 364;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"setting_saved"] :(long long) (1.5) :[self.__c True]];
 //BA.debugLineNum = 365;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 369;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library.";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 371;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setshipmethod_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 343;BA.debugLine="Sub setshipmethod_receive(res As Map,cat As String";
 //BA.debugLineNum = 345;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 347;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 348;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 349;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"setting_saved"] :(long long) (1.5) :[self.__c True]];
 //BA.debugLineNum = 350;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 354;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library.";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 356;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _ship_itemselected:(int) _column :(int) _row{
b4i_opencart* _opmethod = nil;
 //BA.debugLineNum = 375;BA.debugLine="Sub ship_ItemSelected (Column As Int, Row As Int)";
 //BA.debugLineNum = 377;BA.debugLine="If Row = 0 Then Return";
if (_row==0) { 
if (true) return @"";};
 //BA.debugLineNum = 379;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 381;BA.debugLine="Dim opMethod As OpenCart";
_opmethod = [b4i_opencart new];
 //BA.debugLineNum = 382;BA.debugLine="opMethod.Initialize";
[_opmethod _initialize:self.bi];
 //BA.debugLineNum = 383;BA.debugLine="opMethod.SetShipMethods(Me,\"setShipMethod_receive";
[_opmethod _setshipmethods:self :@"setShipMethod_receive" :[self.bi ObjectToString:[self._lsships Get:(int) (_row-1)]] :[@[[self._library _getstringresourse:@"inapp_buy"],[self.__c CRLF],[self._txtcomment Text]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 385;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _ship_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _ref = nil;
B4IMap* _ships = nil;
B4IList* _l1 = nil;
NSString* _vs = @"";
B4IMap* _temp = nil;
B4IMap* _temp1 = nil;
NSString* _p = @"";
B4IMap* _pt = nil;
b4i_opencart* _payments = nil;
 //BA.debugLineNum = 272;BA.debugLine="Sub ship_receive(res As Map,cat As String)";
 //BA.debugLineNum = 274;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 276;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 278;BA.debugLine="Dim ref As Map";
_ref = [B4IMap new];
 //BA.debugLineNum = 279;BA.debugLine="Dim ships As Map";
_ships = [B4IMap new];
 //BA.debugLineNum = 281;BA.debugLine="ref = res.Get(\"data\")";
_ref = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 282;BA.debugLine="ships = ref.Get(\"shipping_methods\")";
_ships = (B4IMap*)([_ref Get:(NSObject*)(@"shipping_methods")]);
 //BA.debugLineNum = 284;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 285;BA.debugLine="l1.Initialize";
[_l1 Initialize];
 //BA.debugLineNum = 287;BA.debugLine="lsShips.Initialize";
[self._lsships Initialize];
 //BA.debugLineNum = 289;BA.debugLine="l1.Add(Library.GetStringResourse(\"choose_one\"))";
[_l1 Add:(NSObject*)([self._library _getstringresourse:@"choose_one"])];
 //BA.debugLineNum = 291;BA.debugLine="For Each vs As String In ships.Keys";
{
const id<B4IIterable> group11 = [_ships Keys];
const int groupLen11 = group11.Size
;int index11 = 0;
;
for (; index11 < groupLen11;index11++){
_vs = [self.bi ObjectToString:[group11 Get:index11]];
 //BA.debugLineNum = 292;BA.debugLine="Dim temp,temp1 As Map";
_temp = [B4IMap new];
_temp1 = [B4IMap new];
 //BA.debugLineNum = 293;BA.debugLine="temp = ships.Get(vs)";
_temp = (B4IMap*)([_ships Get:(NSObject*)(_vs)]);
 //BA.debugLineNum = 294;BA.debugLine="temp1 = temp.Get(\"quote\")";
_temp1 = (B4IMap*)([_temp Get:(NSObject*)(@"quote")]);
 //BA.debugLineNum = 296;BA.debugLine="For Each p As String In temp1.Keys";
{
const id<B4IIterable> group15 = [_temp1 Keys];
const int groupLen15 = group15.Size
;int index15 = 0;
;
for (; index15 < groupLen15;index15++){
_p = [self.bi ObjectToString:[group15 Get:index15]];
 //BA.debugLineNum = 297;BA.debugLine="Dim pt As Map";
_pt = [B4IMap new];
 //BA.debugLineNum = 298;BA.debugLine="pt = temp1.Get(p)";
_pt = (B4IMap*)([_temp1 Get:(NSObject*)(_p)]);
 //BA.debugLineNum = 299;BA.debugLine="lsShips.Add(pt.Get(\"code\"))";
[self._lsships Add:[_pt Get:(NSObject*)(@"code")]];
 //BA.debugLineNum = 300;BA.debugLine="l1.Add(pt.Get(\"title\") & \" \" & pt.Get(\"text\")";
[_l1 Add:(NSObject*)([@[[self.bi ObjectToString:[_pt Get:(NSObject*)(@"title")]],@" ",[self.bi ObjectToString:[_pt Get:(NSObject*)(@"text")]]] componentsJoinedByString:@""])];
 }
};
 }
};
 //BA.debugLineNum = 305;BA.debugLine="pickerShip.SetItems(0,l1)";
[self._pickership SetItems:(int) (0) :_l1];
 //BA.debugLineNum = 307;BA.debugLine="lblpayment.Top = topSv";
[self._lblpayment setTop:(float) (self._topsv)];
 //BA.debugLineNum = 308;BA.debugLine="topSv = topSv + lblpayment.Height + 100dip";
self._topsv = (int) (self._topsv+[self._lblpayment Height]+[self.__c DipToCurrent:(int) (100)]);
 //BA.debugLineNum = 310;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 312;BA.debugLine="sv1.ContentHeight = topSv";
[self._sv1 setContentHeight:self._topsv];
 //BA.debugLineNum = 314;BA.debugLine="Dim payments As OpenCart";
_payments = [b4i_opencart new];
 //BA.debugLineNum = 315;BA.debugLine="payments.Initialize";
[_payments _initialize:self.bi];
 //BA.debugLineNum = 316;BA.debugLine="payments.GetPaymentMethods(Me,\"Getways_receive\"";
[_payments _getpaymentmethods:self :@"Getways_receive"];
 }else {
 //BA.debugLineNum = 319;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 };
 }else {
 //BA.debugLineNum = 323;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 };
 //BA.debugLineNum = 326;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
int _address_id = 0;
b4i_opencart* _opaddress = nil;
 //BA.debugLineNum = 37;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 39;BA.debugLine="Library.DoOrderPage.Initialize(\"\")";
[self._library._doorderpage Initialize:self.bi :@""];
 //BA.debugLineNum = 40;BA.debugLine="Library.DoOrderPage.RootPanel.LoadLayout(\"frmdoor";
[[self._library._doorderpage RootPanel] LoadLayout:@"frmdoorder" :self.bi];
 //BA.debugLineNum = 41;BA.debugLine="MyToastMessageShow1.Initialize(Library.DoOrderPag";
[self._mytoastmessageshow1 _initialize:self.bi :[self._library._doorderpage RootPanel]];
 //BA.debugLineNum = 43;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 45;BA.debugLine="lsaddr.Initialize(Me,\"lsaddr\",Library.GetWidth)";
[self._lsaddr _initialize:self.bi :self :@"lsaddr" :[self._library _getwidth]];
 //BA.debugLineNum = 46;BA.debugLine="pnlinaddress.AddView(lsaddr.AsView,0,0,pnlinaddre";
[self._pnlinaddress AddView:(UIView*)(([self._lsaddr _asview]).object) :(float) (0) :(float) (0) :[self._pnlinaddress Width] :[self._pnlinaddress Height]];
 //BA.debugLineNum = 48;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 49;BA.debugLine="lbladdr.Font = Library.GetFont(12)";
[self._lbladdr setFont:[self._library _getfont:(int) (12)]];
 //BA.debugLineNum = 50;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 52;BA.debugLine="lblcomment.Font = Library.getfont(12)";
[self._lblcomment setFont:[self._library _getfont:(int) (12)]];
 //BA.debugLineNum = 53;BA.debugLine="lblcomment.Text = Library.GetStringResourse(\"orde";
[self._lblcomment setText:[self._library _getstringresourse:@"order_comment"]];
 //BA.debugLineNum = 54;BA.debugLine="lblcomment.TextColor = Colors.Black";
[self._lblcomment setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 55;BA.debugLine="Library.NavControl.ShowPage(Library.DoOrderPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._doorderpage).object)];
 //BA.debugLineNum = 57;BA.debugLine="lbladdr.TextAlignment = lbladdr.ALIGNMENT_CENTER";
[self._lbladdr setTextAlignment:[self._lbladdr ALIGNMENT_CENTER]];
 //BA.debugLineNum = 59;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"paymen";
[self._lbltitle setText:[self._library _getstringresourse:@"payment"]];
 //BA.debugLineNum = 60;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 61;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 63;BA.debugLine="btncontinue.Text = Library.GetStringResourse(\"con";
[self._btncontinue setText:[self._library _getstringresourse:@"continues"]];
 //BA.debugLineNum = 64;BA.debugLine="btncontinue.CustomLabel.Font = Library.GetFont(bt";
[[self._btncontinue CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btncontinue CustomLabel] Font] Size])]];
 //BA.debugLineNum = 65;BA.debugLine="Library.GetButtonState(btncontinue)";
[self._library _getbuttonstate:self._btncontinue];
 //BA.debugLineNum = 66;BA.debugLine="btncontinue.CustomLabel.TextColor = Colors.White";
[[self._btncontinue CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 67;BA.debugLine="lbladdr.Text	 = \"  \" & Library.GetStringResourse(";
[self._lbladdr setText:[@[@"  ",[self._library _getstringresourse:@"choose_address"],@"  "] componentsJoinedByString:@""]];
 //BA.debugLineNum = 69;BA.debugLine="topSv = 0";
self._topsv = (int) (0);
 //BA.debugLineNum = 72;BA.debugLine="lblship.Initialize(\"\")";
[self._lblship Initialize:self.bi :@""];
 //BA.debugLineNum = 73;BA.debugLine="lblship.Font = Library.GetFont(14)";
[self._lblship setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 74;BA.debugLine="lblship.TextAlignment = Library.GetStringResourse";
[self._lblship setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 75;BA.debugLine="lblship.Color = Library.Theme_Footer";
[self._lblship setColor:self._library._theme_footer];
 //BA.debugLineNum = 76;BA.debugLine="lblship.TextColor = Colors.White";
[self._lblship setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 77;BA.debugLine="lblship.Text = \" \" & Library.GetStringResourse(\"s";
[self._lblship setText:[@[@" ",[self._library _getstringresourse:@"ship_title"],@" :"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 78;BA.debugLine="sv1.Panel.AddView(lblship,0,topSv,Library.GetWidt";
[[self._sv1 Panel] AddView:(UIView*)((self._lblship).object) :(float) (0) :(float) (self._topsv) :(float) ([self._library _getwidth]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 79;BA.debugLine="topSv = topSv + 40dip";
self._topsv = (int) (self._topsv+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 81;BA.debugLine="pickerShip.Initialize(\"ship\")";
[self._pickership Initialize:self.bi :@"ship"];
 //BA.debugLineNum = 82;BA.debugLine="sv1.Panel.AddView(pickerShip,10dip,60dip,Library.";
[[self._sv1 Panel] AddView:(UIView*)((self._pickership).object) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) ([self.__c DipToCurrent:(int) (60)]) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (30)]) :(float) ([self.__c DipToCurrent:(int) (60)])];
 //BA.debugLineNum = 83;BA.debugLine="topSv = topSv + 60dip";
self._topsv = (int) (self._topsv+[self.__c DipToCurrent:(int) (60)]);
 //BA.debugLineNum = 87;BA.debugLine="lblpayment.Initialize(\"\")";
[self._lblpayment Initialize:self.bi :@""];
 //BA.debugLineNum = 88;BA.debugLine="lblpayment.Font = Library.GetFont(14)";
[self._lblpayment setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 89;BA.debugLine="lblpayment.TextAlignment = Library.GetStringResou";
[self._lblpayment setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 90;BA.debugLine="lblpayment.Color = Library.Theme_Footer";
[self._lblpayment setColor:self._library._theme_footer];
 //BA.debugLineNum = 91;BA.debugLine="lblpayment.TextColor = Colors.White";
[self._lblpayment setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 92;BA.debugLine="lblpayment.Text = \" \" & Library.GetStringResourse";
[self._lblpayment setText:[@[@" ",[self._library _getstringresourse:@"payment_title"],@" :"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 93;BA.debugLine="sv1.Panel.AddView(lblpayment,0,pickerShip.Height";
[[self._sv1 Panel] AddView:(UIView*)((self._lblpayment).object) :(float) (0) :(float) ([self._pickership Height]+[self._pickership Top]) :(float) ([self._library _getwidth]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 94;BA.debugLine="topSv = topSv + 40dip";
self._topsv = (int) (self._topsv+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 96;BA.debugLine="pickerGetway.Initialize(\"payment\")";
[self._pickergetway Initialize:self.bi :@"payment"];
 //BA.debugLineNum = 97;BA.debugLine="sv1.Panel.AddView(pickerGetway,10dip,topSv,Librar";
[[self._sv1 Panel] AddView:(UIView*)((self._pickergetway).object) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) (self._topsv) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (30)]) :(float) ([self.__c DipToCurrent:(int) (90)])];
 //BA.debugLineNum = 98;BA.debugLine="topSv = topSv + 90dip";
self._topsv = (int) (self._topsv+[self.__c DipToCurrent:(int) (90)]);
 //BA.debugLineNum = 101;BA.debugLine="If Library.loginDetails.IsInitialized = False And";
if ([self._library._logindetails IsInitialized]==[self.__c False] && [self._library._guestlogin IsInitialized]) { 
 //BA.debugLineNum = 102;BA.debugLine="LoadData";
[self _loaddata];
 //BA.debugLineNum = 103;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 106;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ([[self._library._logindetails Get:(NSObject*)(@"login")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 108;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 110;BA.debugLine="Dim address_id As Int";
_address_id = 0;
 //BA.debugLineNum = 111;BA.debugLine="address_id = Library.loginDetails.Get(\"address_i";
_address_id = [self.bi ObjectToNumber:[self._library._logindetails Get:(NSObject*)(@"address_id")]].intValue;
 //BA.debugLineNum = 113;BA.debugLine="If Library.ChoosenAddress > 0 Then";
if (self._library._choosenaddress>0) { 
 //BA.debugLineNum = 114;BA.debugLine="address_id = Library.ChoosenAddress";
_address_id = self._library._choosenaddress;
 };
 //BA.debugLineNum = 117;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = [b4i_opencart new];
 //BA.debugLineNum = 118;BA.debugLine="opAddress.Initialize";
[_opaddress _initialize:self.bi];
 //BA.debugLineNum = 119;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_receiv";
[_opaddress _listaddressuser:self :@"ListAddress_receive"];
 }else {
 //BA.debugLineNum = 122;BA.debugLine="If Library.GuestLogin.Get(\"login\") = True Then";
if ([[self._library._guestlogin Get:(NSObject*)(@"login")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 123;BA.debugLine="LoadData";
[self _loaddata];
 }else {
 //BA.debugLineNum = 125;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"login_force"] :[self.__c False]];
 //BA.debugLineNum = 126;BA.debugLine="Library.LastPage = Library.DoOrderPage";
self._library._lastpage = self._library._doorderpage;
 //BA.debugLineNum = 127;BA.debugLine="actLogin.StartActivity";
[self._actlogin _startactivity];
 };
 };
 //BA.debugLineNum = 131;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmrscroll_tick{
 //BA.debugLineNum = 570;BA.debugLine="Sub tmrScroll_Tick";
 //BA.debugLineNum = 572;BA.debugLine="If svpreview.ScrollOffsetY = 0 Then";
if ([self._svpreview ScrollOffsetY]==0) { 
 //BA.debugLineNum = 573;BA.debugLine="svpreview.ScrollTo(0,svpreview.ContentHeight,Tru";
[self._svpreview ScrollTo:(int) (0) :[self._svpreview ContentHeight] :[self.__c True]];
 }else {
 //BA.debugLineNum = 575;BA.debugLine="svpreview.ScrollTo(0,0,True)";
[self._svpreview ScrollTo:(int) (0) :(int) (0) :[self.__c True]];
 //BA.debugLineNum = 576;BA.debugLine="timerScroll.Enabled = False";
[self._timerscroll setEnabled:[self.__c False]];
 };
 //BA.debugLineNum = 579;BA.debugLine="End Sub";
return @"";
}
@end
