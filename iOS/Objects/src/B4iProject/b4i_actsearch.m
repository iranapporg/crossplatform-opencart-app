
#import "b4i_actsearch.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
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
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_actsearch 


+ (instancetype)new {
    static b4i_actsearch* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _add2cart2_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _rs = nil;
 //BA.debugLineNum = 171;BA.debugLine="Sub Add2Cart2_receive(res As Map,cat As String)";
 //BA.debugLineNum = 173;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 175;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 177;BA.debugLine="Dim rs As Map";
_rs = [B4IMap new];
 //BA.debugLineNum = 179;BA.debugLine="rs = res.Get(\"error\")";
_rs = (B4IMap*)([_res Get:(NSObject*)(@"error")]);
 //BA.debugLineNum = 181;BA.debugLine="If rs.ContainsKey(\"option\") Then";
if ([_rs ContainsKey:(NSObject*)(@"option")]) { 
 //BA.debugLineNum = 182;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"cannot_add_cart"] :[self.__c True]];
 //BA.debugLineNum = 183;BA.debugLine="actProduct.product = CreateMap(\"product_id\":Lib";
self._actproduct._product = [self.__c createMap:@[(NSObject*)(@"product_id"),(NSObject*)(self._library._productchoosenid)]];
 //BA.debugLineNum = 184;BA.debugLine="Library.ProductChoosenID = 0";
self._library._productchoosenid = [self.bi NumberToString:@(0)];
 //BA.debugLineNum = 185;BA.debugLine="actProduct.StartActivity";
[self._actproduct _startactivity];
 //BA.debugLineNum = 186;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 191;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 192;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"add2cart"] :(long long) (1.5) :[self.__c True]];
 };
 //BA.debugLineNum = 195;BA.debugLine="Library.ProductChoosenID = 0";
self._library._productchoosenid = [self.bi NumberToString:@(0)];
 //BA.debugLineNum = 197;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnadd_2_cart_click{
B4IButtonWrapper* _b1 = nil;
 //BA.debugLineNum = 162;BA.debugLine="Sub btnadd_2_cart_Click";
 //BA.debugLineNum = 164;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 165;BA.debugLine="b1 = Sender";
_b1.object = (UIButton*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 167;BA.debugLine="Library.Add2Cart(b1.Tag,\"1\",Me)";
[self._library _add2cart:[self.bi ObjectToString:[_b1 Tag]] :@"1" :self];
 //BA.debugLineNum = 169;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnadd_click{
NSString* _order = @"";
B4ILabelWrapper* _lbl = nil;
B4ILabelWrapper* _lbl1 = nil;
B4ILabelWrapper* _sdivider = nil;
 //BA.debugLineNum = 199;BA.debugLine="Sub btnadd_Click";
 //BA.debugLineNum = 201;BA.debugLine="Dim order As String";
_order = @"";
 //BA.debugLineNum = 203;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 205;BA.debugLine="If listCondition.Size = 0 Then";
if ([self._listcondition Size]==0) { 
 //BA.debugLineNum = 207;BA.debugLine="If rbasc.Value = True Then";
if ([self._rbasc Value]==[self.__c True]) { 
 //BA.debugLineNum = 208;BA.debugLine="order = \"asc\"";
_order = @"asc";
 }else {
 //BA.debugLineNum = 210;BA.debugLine="order = \"desc\"";
_order = @"desc";
 };
 //BA.debugLineNum = 213;BA.debugLine="Filter.Put(\"sort\",listSortFields.Get(txtsort_ite";
[self._filter Put:(NSObject*)(@"sort") :[self._listsortfields Get:[self._txtsort_item GetSelectedRow:(int) (0)]]];
 //BA.debugLineNum = 214;BA.debugLine="Filter.Put(\"order\",order)";
[self._filter Put:(NSObject*)(@"order") :(NSObject*)(_order)];
 };
 //BA.debugLineNum = 218;BA.debugLine="If txtval.Text.Length = 0 Then";
if ([[self._txtval Text] Length]==0) { 
 //BA.debugLineNum = 219;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"filter_error_val"] :(long long) (1.8) :[self.__c False]];
 //BA.debugLineNum = 220;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 223;BA.debugLine="listCondition.Add(CreateMap(\"field\":listFields.Ge";
[self._listcondition Add:(NSObject*)([self.__c createMap:@[(NSObject*)(@"field"),[self._listfields Get:[self._txtfields GetSelectedRow:(int) (0)]],(NSObject*)(@"operand"),[self._txtcampare GetSelectedItem:(int) (0)],(NSObject*)(@"value"),(NSObject*)([self._txtval Text])]])];
 //BA.debugLineNum = 225;BA.debugLine="Dim lbl As Label";
_lbl = [B4ILabelWrapper new];
 //BA.debugLineNum = 226;BA.debugLine="lbl.Initialize(\"\")";
[_lbl Initialize:self.bi :@""];
 //BA.debugLineNum = 227;BA.debugLine="lbl.TextColor = Colors.Black";
[_lbl setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 228;BA.debugLine="lbl.Font = Library.GetFont(14)";
[_lbl setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 229;BA.debugLine="lbl.TextAlignment = Library.GetStringResourse(\"di";
[_lbl setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 230;BA.debugLine="lbl.Text = \"   [ \" & Library.GetStringResourse(\"f";
[_lbl setText:[@[@"   [ ",[self._library _getstringresourse:@"filter_show_field"],[self.bi ObjectToString:[self._txtfields GetSelectedItem:(int) (0)]],@" ] , [ ",[self.bi ObjectToString:[self._txtcampare GetSelectedItem:(int) (0)]],@" ]"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 231;BA.debugLine="svfilter.Panel.AddView(lbl,0,topFilter,svfilter.W";
[[self._svfilter Panel] AddView:(UIView*)((_lbl).object) :(float) (0) :(float) (self._topfilter) :[self._svfilter Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 232;BA.debugLine="svfilter.Panel.Height = svfilter.Panel.Height + 4";
[[self._svfilter Panel] setHeight:(float) ([[self._svfilter Panel] Height]+[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 233;BA.debugLine="svfilter.ContentHeight = svfilter.Panel.Height";
[self._svfilter setContentHeight:(int) ([[self._svfilter Panel] Height])];
 //BA.debugLineNum = 234;BA.debugLine="listConditionView.Add(lbl)";
[self._listconditionview Add:(NSObject*)((_lbl).object)];
 //BA.debugLineNum = 236;BA.debugLine="topFilter = topFilter + 40dip";
self._topfilter = (int) (self._topfilter+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 238;BA.debugLine="Dim lbl1 As Label";
_lbl1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 239;BA.debugLine="lbl1.Initialize(\"\")";
[_lbl1 Initialize:self.bi :@""];
 //BA.debugLineNum = 240;BA.debugLine="lbl1.TextColor = Colors.Black";
[_lbl1 setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 241;BA.debugLine="lbl1.Font = Library.GetFont(14)";
[_lbl1 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 242;BA.debugLine="lbl1.TextAlignment = Library.GetStringResourse(\"d";
[_lbl1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 243;BA.debugLine="lbl1.Text = \"   \" & Library.GetStringResourse(\"fi";
[_lbl1 setText:[@[@"   ",[self._library _getstringresourse:@"filter_show_val"],[self._txtval Text]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 244;BA.debugLine="svfilter.Panel.AddView(lbl1,0,topFilter,svfilter.";
[[self._svfilter Panel] AddView:(UIView*)((_lbl1).object) :(float) (0) :(float) (self._topfilter) :[self._svfilter Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 245;BA.debugLine="listConditionView.Add(lbl1)";
[self._listconditionview Add:(NSObject*)((_lbl1).object)];
 //BA.debugLineNum = 247;BA.debugLine="topFilter = topFilter + 45dip";
self._topfilter = (int) (self._topfilter+[self.__c DipToCurrent:(int) (45)]);
 //BA.debugLineNum = 248;BA.debugLine="svfilter.Panel.Height = svfilter.Panel.Height + 4";
[[self._svfilter Panel] setHeight:(float) ([[self._svfilter Panel] Height]+[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 250;BA.debugLine="Dim sdivider As Label";
_sdivider = [B4ILabelWrapper new];
 //BA.debugLineNum = 251;BA.debugLine="sdivider.Initialize(\"\")";
[_sdivider Initialize:self.bi :@""];
 //BA.debugLineNum = 252;BA.debugLine="sdivider.Color = Colors.Gray";
[_sdivider setColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 253;BA.debugLine="svfilter.Panel.AddView(sdivider,10,topFilter,svfi";
[[self._svfilter Panel] AddView:(UIView*)((_sdivider).object) :(float) (10) :(float) (self._topfilter) :(float) ([self._svfilter Width]-20) :(float) ([self.__c DipToCurrent:(int) (1)])];
 //BA.debugLineNum = 254;BA.debugLine="listConditionView.Add(sdivider)";
[self._listconditionview Add:(NSObject*)((_sdivider).object)];
 //BA.debugLineNum = 255;BA.debugLine="topFilter = topFilter + 5dip";
self._topfilter = (int) (self._topfilter+[self.__c DipToCurrent:(int) (5)]);
 //BA.debugLineNum = 256;BA.debugLine="svfilter.Panel.Height = svfilter.Panel.Height + 1";
[[self._svfilter Panel] setHeight:(float) ([[self._svfilter Panel] Height]+[self.__c DipToCurrent:(int) (12)])];
 //BA.debugLineNum = 258;BA.debugLine="If listCondition.Size = 1 Then svfilter.ScrollTo(";
if ([self._listcondition Size]==1) { 
[self._svfilter ScrollTo:(int) (0) :(int) ([_sdivider Top]) :[self.__c True]];};
 //BA.debugLineNum = 260;BA.debugLine="txtval.Text = \"\"";
[self._txtval setText:@""];
 //BA.debugLineNum = 262;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 140;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 141;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 142;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnlist_click{
int _i = 0;
B4IViewWrapper* _v1 = nil;
 //BA.debugLineNum = 290;BA.debugLine="Sub btnlist_Click";
 //BA.debugLineNum = 292;BA.debugLine="If svfilter.Visible = False Then";
if ([self._svfilter Visible]==[self.__c False]) { 
 //BA.debugLineNum = 293;BA.debugLine="svfilter.Visible = True";
[self._svfilter setVisible:[self.__c True]];
 //BA.debugLineNum = 294;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"filter";
[self._btnlist setText:[self._library _getstringresourse:@"filter_search"]];
 //BA.debugLineNum = 295;BA.debugLine="svfilter.BringToFront";
[self._svfilter BringToFront];
 //BA.debugLineNum = 296;BA.debugLine="listCondition.Clear";
[self._listcondition Clear];
 //BA.debugLineNum = 297;BA.debugLine="Filter.Clear";
[self._filter Clear];
 }else {
 //BA.debugLineNum = 300;BA.debugLine="svfilter.ScrollTo(0,0,True)";
[self._svfilter ScrollTo:(int) (0) :(int) (0) :[self.__c True]];
 //BA.debugLineNum = 301;BA.debugLine="topFilter = btnadd.top + btnadd.Height + 30dip";
self._topfilter = (int) ([self._btnadd Top]+[self._btnadd Height]+[self.__c DipToCurrent:(int) (30)]);
 //BA.debugLineNum = 303;BA.debugLine="For i = 0 To listConditionView.Size - 1";
{
const int step10 = 1;
const int limit10 = (int) ([self._listconditionview Size]-1);
_i = (int) (0) ;
for (;(step10 > 0 && _i <= limit10) || (step10 < 0 && _i >= limit10) ;_i = ((int)(0 + _i + step10))  ) {
 //BA.debugLineNum = 304;BA.debugLine="Dim v1 As View";
_v1 = [B4IViewWrapper new];
 //BA.debugLineNum = 305;BA.debugLine="v1 = listConditionView.Get(i)";
_v1.object = (UIView*)([self._listconditionview Get:_i]);
 //BA.debugLineNum = 306;BA.debugLine="v1.RemoveViewFromParent";
[_v1 RemoveViewFromParent];
 }
};
 //BA.debugLineNum = 309;BA.debugLine="svfilter.Visible = False";
[self._svfilter setVisible:[self.__c False]];
 //BA.debugLineNum = 310;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"filter";
[self._btnlist setText:[self._library _getstringresourse:@"filter_button"]];
 };
 //BA.debugLineNum = 314;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsearch_click{
b4i_opencart* _op = nil;
 //BA.debugLineNum = 264;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 266;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 268;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 269;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 270;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 273;BA.debugLine="If listCondition.Size = 0 Then";
if ([self._listcondition Size]==0) { 
 //BA.debugLineNum = 274;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_filter"] :(long long) (1.8) :[self.__c False]];
 //BA.debugLineNum = 275;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 278;BA.debugLine="Filter.Put(\"filters\",listCondition)";
[self._filter Put:(NSObject*)(@"filters") :(NSObject*)((self._listcondition).object)];
 //BA.debugLineNum = 280;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 282;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 283;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 284;BA.debugLine="op.CustomSearchProduct(Me,\"product_receive\",Filte";
[_op _customsearchproduct:self :@"product_receive" :self._filter :(int) (1000)];
 //BA.debugLineNum = 286;BA.debugLine="btnlist_Click";
[self _btnlist_click];
 //BA.debugLineNum = 288;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _endsearch_load:(int) _lasttop{
 //BA.debugLineNum = 136;BA.debugLine="Sub EndSearch_Load(LastTop As Int)";
 //BA.debugLineNum = 137;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 500";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+500)];
 //BA.debugLineNum = 138;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadfilterpanel{
B4IViewWrapper* _v1 = nil;
B4ILabelWrapper* _l2 = nil;
B4IList* _t1 = nil;
int _i = 0;
 //BA.debugLineNum = 316;BA.debugLine="Sub LoadFilterPanel";
 //BA.debugLineNum = 318;BA.debugLine="svfilter.Panel.Width = svfilter.Width";
[[self._svfilter Panel] setWidth:[self._svfilter Width]];
 //BA.debugLineNum = 319;BA.debugLine="svfilter.ContentHeight = 1000";
[self._svfilter setContentHeight:(int) (1000)];
 //BA.debugLineNum = 320;BA.debugLine="svfilter.Panel.LoadLayout(\"frmtemplate_filter\")";
[[self._svfilter Panel] LoadLayout:@"frmtemplate_filter" :self.bi];
 //BA.debugLineNum = 321;BA.debugLine="svfilter.ContentWidth = Library.GetWidth";
[self._svfilter setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 323;BA.debugLine="For Each v1 As View In svfilter.Panel.GetAllViews";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group5 = [[self._svfilter Panel] GetAllViewsRecursive];
const int groupLen5 = group5.Size
;int index5 = 0;
;
for (; index5 < groupLen5;index5++){
_v1.object = (UIView*)([group5 Get:index5]);
 //BA.debugLineNum = 324;BA.debugLine="If v1 Is Label Then";
if ([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 325;BA.debugLine="Dim l2 As Label";
_l2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 326;BA.debugLine="l2 = v1";
_l2.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 327;BA.debugLine="l2.Font = Library.GetFont(l2.Font.Size)";
[_l2 setFont:[self._library _getfont:(int) ([[_l2 Font] Size])]];
 //BA.debugLineNum = 328;BA.debugLine="l2.TextAlignment = Library.GetStringResourse(\"d";
[_l2 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 };
 }
};
 //BA.debugLineNum = 332;BA.debugLine="pnlfilter.Width = Library.GetWidth";
[self._pnlfilter setWidth:(float) ([self._library _getwidth])];
 //BA.debugLineNum = 333;BA.debugLine="svfilter.Width = Library.GetWidth";
[self._svfilter setWidth:(float) ([self._library _getwidth])];
 //BA.debugLineNum = 335;BA.debugLine="svfilter.Visible = False";
[self._svfilter setVisible:[self.__c False]];
 //BA.debugLineNum = 336;BA.debugLine="svfilter.Panel.Height = btnadd.top + btnadd.Heigh";
[[self._svfilter Panel] setHeight:(float) ([self._btnadd Top]+[self._btnadd Height]+[self.__c DipToCurrent:(int) (200)])];
 //BA.debugLineNum = 337;BA.debugLine="topFilter = btnadd.top + btnadd.Height + 30dip";
self._topfilter = (int) ([self._btnadd Top]+[self._btnadd Height]+[self.__c DipToCurrent:(int) (30)]);
 //BA.debugLineNum = 338;BA.debugLine="Library.GetButtonState(btnsearch)";
[self._library _getbuttonstate:self._btnsearch];
 //BA.debugLineNum = 339;BA.debugLine="Library.GetButtonState(btnadd)";
[self._library _getbuttonstate:self._btnadd];
 //BA.debugLineNum = 340;BA.debugLine="svfilter.Color = Colors.White";
[self._svfilter setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 341;BA.debugLine="svfilter.Panel.Color = Colors.White";
[[self._svfilter Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 343;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"filter_";
[self._btnlist setText:[self._library _getstringresourse:@"filter_button"]];
 //BA.debugLineNum = 344;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"filter_a";
[self._btnadd setText:[self._library _getstringresourse:@"filter_add"]];
 //BA.debugLineNum = 345;BA.debugLine="btnsearch.Text = Library.GetStringResourse(\"filte";
[self._btnsearch setText:[self._library _getstringresourse:@"filter_search"]];
 //BA.debugLineNum = 346;BA.debugLine="lblsort_item.Text = Library.GetStringResourse(\"fi";
[self._lblsort_item setText:[self._library _getstringresourse:@"filter_sort_item"]];
 //BA.debugLineNum = 347;BA.debugLine="lblsort_type.Text =Library.GetStringResourse(\"fil";
[self._lblsort_type setText:[self._library _getstringresourse:@"filter_sort_type"]];
 //BA.debugLineNum = 348;BA.debugLine="lbldesc.Text = Library.GetStringResourse(\"filter_";
[self._lbldesc setText:[self._library _getstringresourse:@"filter_desc"]];
 //BA.debugLineNum = 349;BA.debugLine="lblasc.Text = Library.GetStringResourse(\"filter_a";
[self._lblasc setText:[self._library _getstringresourse:@"filter_asc"]];
 //BA.debugLineNum = 350;BA.debugLine="lblfield.Text = Library.GetStringResourse(\"filter";
[self._lblfield setText:[self._library _getstringresourse:@"filter_choose_field"]];
 //BA.debugLineNum = 351;BA.debugLine="lblcompare.Text = Library.GetStringResourse(\"filt";
[self._lblcompare setText:[self._library _getstringresourse:@"filter_comapre"]];
 //BA.debugLineNum = 352;BA.debugLine="lbllogical.Text = Library.GetStringResourse(\"filt";
[self._lbllogical setText:[self._library _getstringresourse:@"filter_logic"]];
 //BA.debugLineNum = 353;BA.debugLine="lblval.Text = Library.GetStringResourse(\"filter_v";
[self._lblval setText:[self._library _getstringresourse:@"filter_val"]];
 //BA.debugLineNum = 355;BA.debugLine="listFields.Initialize";
[self._listfields Initialize];
 //BA.debugLineNum = 356;BA.debugLine="listSortFields.Initialize";
[self._listsortfields Initialize];
 //BA.debugLineNum = 358;BA.debugLine="listFields.Add(\"category\")";
[self._listfields Add:(NSObject*)(@"category")];
 //BA.debugLineNum = 359;BA.debugLine="listFields.Add(\"quantity\")";
[self._listfields Add:(NSObject*)(@"quantity")];
 //BA.debugLineNum = 360;BA.debugLine="listFields.Add(\"model\")";
[self._listfields Add:(NSObject*)(@"model")];
 //BA.debugLineNum = 361;BA.debugLine="listFields.Add(\"upc\")";
[self._listfields Add:(NSObject*)(@"upc")];
 //BA.debugLineNum = 362;BA.debugLine="listFields.Add(\"name\")";
[self._listfields Add:(NSObject*)(@"name")];
 //BA.debugLineNum = 363;BA.debugLine="listFields.Add(\"date_start\")";
[self._listfields Add:(NSObject*)(@"date_start")];
 //BA.debugLineNum = 364;BA.debugLine="listFields.Add(\"date_end\")";
[self._listfields Add:(NSObject*)(@"date_end")];
 //BA.debugLineNum = 365;BA.debugLine="listFields.Add(\"product_id\")";
[self._listfields Add:(NSObject*)(@"product_id")];
 //BA.debugLineNum = 366;BA.debugLine="listFields.Add(\"price\")";
[self._listfields Add:(NSObject*)(@"price")];
 //BA.debugLineNum = 371;BA.debugLine="Dim t1 As List";
_t1 = [B4IList new];
 //BA.debugLineNum = 372;BA.debugLine="t1.Initialize";
[_t1 Initialize];
 //BA.debugLineNum = 374;BA.debugLine="For i = 0 To listFields.Size - 1";
{
const int step46 = 1;
const int limit46 = (int) ([self._listfields Size]-1);
_i = (int) (0) ;
for (;(step46 > 0 && _i <= limit46) || (step46 < 0 && _i >= limit46) ;_i = ((int)(0 + _i + step46))  ) {
 //BA.debugLineNum = 375;BA.debugLine="t1.Add(Library.GetStringResourse(\"filter_field_\"";
[_t1 Add:(NSObject*)([self._library _getstringresourse:[@[@"filter_field_",[self.bi ObjectToString:[self._listfields Get:_i]]] componentsJoinedByString:@""]])];
 }
};
 //BA.debugLineNum = 377;BA.debugLine="txtfields.SetItems(0,t1)";
[self._txtfields SetItems:(int) (0) :_t1];
 //BA.debugLineNum = 379;BA.debugLine="listSortFields.Add(\"quantity\")";
[self._listsortfields Add:(NSObject*)(@"quantity")];
 //BA.debugLineNum = 380;BA.debugLine="listSortFields.Add(\"rating\")";
[self._listsortfields Add:(NSObject*)(@"rating")];
 //BA.debugLineNum = 381;BA.debugLine="listSortFields.Add(\"sort_order\")";
[self._listsortfields Add:(NSObject*)(@"sort_order")];
 //BA.debugLineNum = 382;BA.debugLine="listSortFields.Add(\"model\")";
[self._listsortfields Add:(NSObject*)(@"model")];
 //BA.debugLineNum = 383;BA.debugLine="listSortFields.Add(\"date_added\")";
[self._listsortfields Add:(NSObject*)(@"date_added")];
 //BA.debugLineNum = 384;BA.debugLine="listSortFields.Add(\"name\")";
[self._listsortfields Add:(NSObject*)(@"name")];
 //BA.debugLineNum = 385;BA.debugLine="listSortFields.Add(\"price\")";
[self._listsortfields Add:(NSObject*)(@"price")];
 //BA.debugLineNum = 387;BA.debugLine="t1.Clear";
[_t1 Clear];
 //BA.debugLineNum = 388;BA.debugLine="For i = 0 To listSortFields.Size - 1";
{
const int step58 = 1;
const int limit58 = (int) ([self._listsortfields Size]-1);
_i = (int) (0) ;
for (;(step58 > 0 && _i <= limit58) || (step58 < 0 && _i >= limit58) ;_i = ((int)(0 + _i + step58))  ) {
 //BA.debugLineNum = 389;BA.debugLine="t1.Add(Library.GetStringResourse(\"filter_field_\"";
[_t1 Add:(NSObject*)([self._library _getstringresourse:[@[@"filter_field_",[self.bi ObjectToString:[self._listsortfields Get:_i]]] componentsJoinedByString:@""]])];
 }
};
 //BA.debugLineNum = 391;BA.debugLine="txtsort_item.SetItems(0,t1)";
[self._txtsort_item SetItems:(int) (0) :_t1];
 //BA.debugLineNum = 393;BA.debugLine="t1.Clear";
[_t1 Clear];
 //BA.debugLineNum = 394;BA.debugLine="t1.Add(\"=\")";
[_t1 Add:(NSObject*)(@"=")];
 //BA.debugLineNum = 395;BA.debugLine="t1.Add(\"!=\")";
[_t1 Add:(NSObject*)(@"!=")];
 //BA.debugLineNum = 396;BA.debugLine="t1.Add(\"<>\")";
[_t1 Add:(NSObject*)(@"<>")];
 //BA.debugLineNum = 397;BA.debugLine="t1.Add(\">\")";
[_t1 Add:(NSObject*)(@">")];
 //BA.debugLineNum = 398;BA.debugLine="t1.Add(\"<\")";
[_t1 Add:(NSObject*)(@"<")];
 //BA.debugLineNum = 399;BA.debugLine="t1.Add(\">=\")";
[_t1 Add:(NSObject*)(@">=")];
 //BA.debugLineNum = 400;BA.debugLine="t1.Add(\"<=\")";
[_t1 Add:(NSObject*)(@"<=")];
 //BA.debugLineNum = 401;BA.debugLine="t1.Add(\"!<\")";
[_t1 Add:(NSObject*)(@"!<")];
 //BA.debugLineNum = 402;BA.debugLine="t1.Add(\"!>\")";
[_t1 Add:(NSObject*)(@"!>")];
 //BA.debugLineNum = 403;BA.debugLine="t1.Add(\"like\")";
[_t1 Add:(NSObject*)(@"like")];
 //BA.debugLineNum = 404;BA.debugLine="txtcampare.SetItems(0,t1)";
[self._txtcampare SetItems:(int) (0) :_t1];
 //BA.debugLineNum = 410;BA.debugLine="txtval.Color = Colors.ARGB(10,0,0,0)";
[self._txtval setColor:[[self.__c Colors] ARGB:(int) (10) :(int) (0) :(int) (0) :(int) (0)]];
 //BA.debugLineNum = 412;BA.debugLine="End Sub";
return @"";
}
- (int)  _loadproduct:(B4IList*) _res1 :(int) _defaulttop :(B4IScrollView*) _scrollview1{
B4IArray* _dimension = nil;
int _left = 0;
int _countitem = 0;
int _allspace = 0;
int _spaceunit = 0;
int _i = 0;
B4IPanelWrapper* _pa = nil;
B4IMap* _temp = nil;
B4IImageViewWrapper* _imgtemp = nil;
B4ILabelWrapper* _templabel = nil;
B4ILabelWrapper* _labelprice = nil;
B4IPanelWrapper* _temppanel = nil;
B4IPanelWrapper* _parentpanel = nil;
NSString* _price = @"";
NSString* _special = @"";
NSString* _pathimage = @"";
B4IMap* _img = nil;
b4i_imagedownloader* _imgdownloader = nil;
 //BA.debugLineNum = 429;BA.debugLine="Sub LoadProduct(res1 As List,DefaultTop As Int,Scr";
 //BA.debugLineNum = 431;BA.debugLine="Dim Dimension(),Left,top As Int";
_dimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
_left = 0;
self._top = 0;
 //BA.debugLineNum = 432;BA.debugLine="Dim countItem,AllSpace,SpaceUnit As Int";
_countitem = 0;
_allspace = 0;
_spaceunit = 0;
 //BA.debugLineNum = 434;BA.debugLine="Dimension = Library.GetParentPanelDimension(\"frmp";
_dimension = [self._library _getparentpaneldimension:@"frmproduct_template"];
 //BA.debugLineNum = 436;BA.debugLine="countItem = Library.GetWidth / Dimension(0)";
_countitem = (int) ([self._library _getwidth]/(double)((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 //BA.debugLineNum = 437;BA.debugLine="AllSpace = Library.GetWidth - (countItem * Dimens";
_allspace = (int) ([self._library _getwidth]-(_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue));
 //BA.debugLineNum = 439;BA.debugLine="SpaceUnit = AllSpace /(countItem + 1)";
_spaceunit = (int) (_allspace/(double)(_countitem+1));
 //BA.debugLineNum = 441;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0)";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 446;BA.debugLine="top = DefaultTop";
self._top = _defaulttop;
 //BA.debugLineNum = 448;BA.debugLine="For i = 1 To res1.Size";
{
const int step9 = 1;
const int limit9 = [_res1 Size];
_i = (int) (1) ;
for (;(step9 > 0 && _i <= limit9) || (step9 < 0 && _i >= limit9) ;_i = ((int)(0 + _i + step9))  ) {
 //BA.debugLineNum = 450;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 451;BA.debugLine="pa.Initialize(\"\")";
[_pa Initialize:self.bi :@""];
 //BA.debugLineNum = 452;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,top,Dimension(";
[[_scrollview1 Panel] AddView:(UIView*)((_pa).object) :(float) (_left) :(float) (self._top) :(float) (((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue) :(float) (0)];
 //BA.debugLineNum = 453;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
[_pa LoadLayout:@"frmproduct_template" :self.bi];
 //BA.debugLineNum = 454;BA.debugLine="pa.Height = Dimension(1)";
[_pa setHeight:(float) (((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 //BA.debugLineNum = 456;BA.debugLine="Dim Temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 457;BA.debugLine="Temp = res1.Get(i-1)";
_temp = (B4IMap*)([_res1 Get:(int) (_i-1)]);
 //BA.debugLineNum = 460;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = [B4IImageViewWrapper new];
 //BA.debugLineNum = 462;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = [B4ILabelWrapper new];
_labelprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 463;BA.debugLine="Dim TempPanel As Panel";
_temppanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 464;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = [B4IPanelWrapper new];
_parentpanel.object = (B4IPanelView*)(([_pa GetView:(int) (0)]).object);
 //BA.debugLineNum = 467;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.object = (UIImageView*)(([_parentpanel GetView:(int) (4)]).object);
 //BA.debugLineNum = 468;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.object = (UILabel*)(([_parentpanel GetView:(int) (1)]).object);
 //BA.debugLineNum = 469;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.object = (UILabel*)(([_parentpanel GetView:(int) (2)]).object);
 //BA.debugLineNum = 470;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.object = (B4IPanelView*)(([_parentpanel GetView:(int) (6)]).object);
 //BA.debugLineNum = 472;BA.debugLine="TempLabel.Text = Temp.Get(\"name\")";
[_templabel setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 473;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
[_templabel setText:[[[_templabel Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 475;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 477;BA.debugLine="If Temp.ContainsKey(\"price_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"price_formated")]) { 
 //BA.debugLineNum = 478;BA.debugLine="price   = Temp.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price_formated")]];
 }else {
 //BA.debugLineNum = 480;BA.debugLine="price   = Temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 };
 //BA.debugLineNum = 483;BA.debugLine="If Temp.ContainsKey(\"special_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"special_formated")]) { 
 //BA.debugLineNum = 484;BA.debugLine="special = Temp.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special_formated")]];
 }else if([_temp ContainsKey:(NSObject*)(@"special")]) { 
 //BA.debugLineNum = 486;BA.debugLine="special = Temp.Get(\"special\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special")]];
 };
 //BA.debugLineNum = 489;BA.debugLine="If special = \"null\" Or special = \"false\" Then sp";
if ([_special isEqual:@"null"] || [_special isEqual:@"false"]) { 
_special = @"";};
 //BA.debugLineNum = 491;BA.debugLine="TempLabel.Font = Library.GetFont(LabelPrice.Font";
[_templabel setFont:[self._library _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 492;BA.debugLine="LabelPrice.Font = Library.GetFont(LabelPrice.Fon";
[_labelprice setFont:[self._library _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 494;BA.debugLine="Log(special <> 0)";
[self.__c Log:[self.bi BooleanToString:[_special isEqual:[self.bi NumberToString:@(0)]] == false]];
 //BA.debugLineNum = 496;BA.debugLine="If price.Length > 0 And (special <> 0) <> False";
if ([_price Length]>0 && ([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 497;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 }else if(([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 499;BA.debugLine="Library.DiscountStyleLabel(price,special,LabelP";
[self._library _discountstylelabel:_price :_special :_labelprice];
 }else {
 //BA.debugLineNum = 501;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 };
 //BA.debugLineNum = 504;BA.debugLine="Dim PathImage As String";
_pathimage = @"";
 //BA.debugLineNum = 506;BA.debugLine="If Temp.ContainsKey(\"image\") Then";
if ([_temp ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 507;BA.debugLine="PathImage = Temp.Get(\"image\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"image")]];
 }else if([_temp ContainsKey:(NSObject*)(@"thumb")]) { 
 //BA.debugLineNum = 509;BA.debugLine="PathImage = Temp.Get(\"thumb\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 512;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ([[_pathimage ToLowerCase] isEqual:@"null"] || [_pathimage Length]==0) { 
 //BA.debugLineNum = 513;BA.debugLine="imgTemp.Bitmap = LoadBitmap(File.DirAssets,\"noi";
[_imgtemp setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"noimage.png"]];
 }else {
 //BA.debugLineNum = 515;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 516;BA.debugLine="img.Initialize";
[_img Initialize];
 //BA.debugLineNum = 517;BA.debugLine="img.Put(imgTemp,PathImage)";
[_img Put:(NSObject*)((_imgtemp).object) :(NSObject*)(_pathimage)];
 //BA.debugLineNum = 518;BA.debugLine="Dim imgdownloader As ImageDownloader";
_imgdownloader = [b4i_imagedownloader new];
 //BA.debugLineNum = 519;BA.debugLine="imgdownloader.Initialize";
[_imgdownloader _initialize:self.bi];
 //BA.debugLineNum = 520;BA.debugLine="imgdownloader.Download(img)";
[_imgdownloader _download:_img];
 };
 //BA.debugLineNum = 523;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ([[_temppanel Tag] isEqual:(NSObject*)(@"over")]) { 
 //BA.debugLineNum = 524;BA.debugLine="TempPanel.Tag = Temp";
[_temppanel setTag:(NSObject*)(_temp)];
 }else if([[_temppanel Tag] isEqual:(NSObject*)(@"topbar")]) { 
 //BA.debugLineNum = 526;BA.debugLine="TempPanel.Color = Library.Theme_Header";
[_temppanel setColor:self._library._theme_header];
 };
 //BA.debugLineNum = 531;BA.debugLine="If i Mod countItem = 0 Then";
if (_i%_countitem==0) { 
 //BA.debugLineNum = 532;BA.debugLine="top = top + pa.Height + 15dip";
self._top = (int) (self._top+[_pa Height]+[self.__c DipToCurrent:(int) (15)]);
 //BA.debugLineNum = 533;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.He";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+[_pa Height])];
 //BA.debugLineNum = 534;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 }else {
 //BA.debugLineNum = 537;BA.debugLine="Left = Left - SpaceUnit - Dimension(0)";
_left = (int) (_left-_spaceunit-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 };
 }
};
 //BA.debugLineNum = 543;BA.debugLine="If res1.Size Mod countItem <> 0 Then";
if ([_res1 Size]%_countitem!=0) { 
 //BA.debugLineNum = 544;BA.debugLine="top = top + Dimension(1)";
self._top = (int) (self._top+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue);
 //BA.debugLineNum = 545;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.Hei";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 };
 //BA.debugLineNum = 548;BA.debugLine="Return top";
if (true) return self._top;
 //BA.debugLineNum = 550;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _page1_resize:(int) _width :(int) _height{
 //BA.debugLineNum = 81;BA.debugLine="Private Sub Page1_Resize(Width As Int, Height As I";
 //BA.debugLineNum = 82;BA.debugLine="Log(\"resize\")";
[self.__c Log:@"resize"];
 //BA.debugLineNum = 86;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnlover_click{
B4IPanelWrapper* _p1 = nil;
B4IPanelWrapper* _p2 = nil;
B4IMap* _temp = nil;
 //BA.debugLineNum = 144;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 146;BA.debugLine="Dim p1,p2 As Panel";
_p1 = [B4IPanelWrapper new];
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 147;BA.debugLine="p1 = Sender";
_p1.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 149;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 151;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.object = (B4IPanelView*)(([self._library _getparent:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_p1).object)]]).object);
 //BA.debugLineNum = 152;BA.debugLine="p2.Visible = False";
[_p2 setVisible:[self.__c False]];
 //BA.debugLineNum = 153;BA.debugLine="p2.Visible = True";
[_p2 setVisible:[self.__c True]];
 //BA.debugLineNum = 155;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 156;BA.debugLine="temp = p1.Tag";
_temp = (B4IMap*)([_p1 Tag]);
 //BA.debugLineNum = 157;BA.debugLine="actProduct.product = temp";
self._actproduct._product = _temp;
 //BA.debugLineNum = 158;BA.debugLine="actProduct.StartActivity";
[self._actproduct _startactivity];
 //BA.debugLineNum = 160;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _process_globals{
self._main=[b4i_main new];
self._actmenu=[b4i_actmenu new];
self._library=[b4i_library new];
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
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 5;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private txtsearch As TextField";
self._txtsearch = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 9;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private searchmodule As OpenCart";
self._searchmodule = [b4i_opencart new];
 //BA.debugLineNum = 12;BA.debugLine="Private top As Int = 10";
self._top = (int) (10);
 //BA.debugLineNum = 13;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 16;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private btnlist As Button";
self._btnlist = [B4IButtonWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private btnsearch As Button";
self._btnsearch = [B4IButtonWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private divider As ImageView";
self._divider = [B4IImageViewWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Private Label2 As Label";
self._label2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 21;BA.debugLine="Private Label3 As Label";
self._label3 = [B4ILabelWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private lblcompare As Label";
self._lblcompare = [B4ILabelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private lbldivider1 As Label";
self._lbldivider1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 24;BA.debugLine="Private lbldivier2 As Label";
self._lbldivier2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private lblfield As Label";
self._lblfield = [B4ILabelWrapper new];
 //BA.debugLineNum = 26;BA.debugLine="Private lbllogical As Label";
self._lbllogical = [B4ILabelWrapper new];
 //BA.debugLineNum = 27;BA.debugLine="Private lblsearch As Button";
self._lblsearch = [B4IButtonWrapper new];
 //BA.debugLineNum = 28;BA.debugLine="Private lblsort_item As Label";
self._lblsort_item = [B4ILabelWrapper new];
 //BA.debugLineNum = 29;BA.debugLine="Private lblsort_type As Label";
self._lblsort_type = [B4ILabelWrapper new];
 //BA.debugLineNum = 30;BA.debugLine="Private lblval As Label";
self._lblval = [B4ILabelWrapper new];
 //BA.debugLineNum = 31;BA.debugLine="Private pnlfilter As Panel";
self._pnlfilter = [B4IPanelWrapper new];
 //BA.debugLineNum = 32;BA.debugLine="Private pnlloading1 As Panel";
self._pnlloading1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="Private pnlsearch As Panel";
self._pnlsearch = [B4IPanelWrapper new];
 //BA.debugLineNum = 34;BA.debugLine="Private rbasc As Switch";
self._rbasc = [B4ISwitchWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="Private rbdesc As Switch";
self._rbdesc = [B4ISwitchWrapper new];
 //BA.debugLineNum = 36;BA.debugLine="Private txtcampare As Picker";
self._txtcampare = [B4IPickerWrapper new];
 //BA.debugLineNum = 37;BA.debugLine="Private txtfields As Picker";
self._txtfields = [B4IPickerWrapper new];
 //BA.debugLineNum = 38;BA.debugLine="Private txtlogic As Picker";
self._txtlogic = [B4IPickerWrapper new];
 //BA.debugLineNum = 39;BA.debugLine="Private txtsort_item As Picker";
self._txtsort_item = [B4IPickerWrapper new];
 //BA.debugLineNum = 40;BA.debugLine="Private txtval As TextField";
self._txtval = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 41;BA.debugLine="Private svfilter As ScrollView";
self._svfilter = [B4IScrollView new];
 //BA.debugLineNum = 42;BA.debugLine="Private btnadd As Button";
self._btnadd = [B4IButtonWrapper new];
 //BA.debugLineNum = 44;BA.debugLine="Private listCondition,listConditionView As List";
self._listcondition = [B4IList new];
self._listconditionview = [B4IList new];
 //BA.debugLineNum = 45;BA.debugLine="Private Filter As Map";
self._filter = [B4IMap new];
 //BA.debugLineNum = 46;BA.debugLine="Private topFilter As Int";
self._topfilter = 0;
 //BA.debugLineNum = 48;BA.debugLine="Dim listFields,listSortFields As List";
self._listfields = [B4IList new];
self._listsortfields = [B4IList new];
 //BA.debugLineNum = 49;BA.debugLine="Private lbldesc As Label";
self._lbldesc = [B4ILabelWrapper new];
 //BA.debugLineNum = 50;BA.debugLine="Private lblasc As Label";
self._lblasc = [B4ILabelWrapper new];
 //BA.debugLineNum = 51;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _product_receive:(B4IList*) _res :(NSString*) _scategory{
 //BA.debugLineNum = 105;BA.debugLine="Sub product_receive(res As List,sCategory As Strin";
 //BA.debugLineNum = 107;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 108;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 110;BA.debugLine="If res.IsInitialized = False Then";
if ([_res IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 111;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_exist_product"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 112;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 115;BA.debugLine="If res.Size = 0 Then";
if ([_res Size]==0) { 
 //BA.debugLineNum = 116;BA.debugLine="sv1.Panel.RemoveAllViews";
[[self._sv1 Panel] RemoveAllViews];
 //BA.debugLineNum = 117;BA.debugLine="sv1.Panel.Height = 0";
[[self._sv1 Panel] setHeight:(float) (0)];
 //BA.debugLineNum = 118;BA.debugLine="top = 10";
self._top = (int) (10);
 //BA.debugLineNum = 119;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_exist_product"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 120;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 123;BA.debugLine="sv1.Panel.RemoveAllViews";
[[self._sv1 Panel] RemoveAllViews];
 //BA.debugLineNum = 124;BA.debugLine="sv1.Panel.Height = 0";
[[self._sv1 Panel] setHeight:(float) (0)];
 //BA.debugLineNum = 125;BA.debugLine="top = 10";
self._top = (int) (10);
 //BA.debugLineNum = 126;BA.debugLine="sv1.Visible = False";
[self._sv1 setVisible:[self.__c False]];
 //BA.debugLineNum = 127;BA.debugLine="top = LoadProduct(res,top,sv1)";
self._top = [self _loadproduct:_res :self._top :self._sv1];
 //BA.debugLineNum = 129;BA.debugLine="sv1.Visible = True";
[self._sv1 setVisible:[self.__c True]];
 //BA.debugLineNum = 130;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 300dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (300)])];
 //BA.debugLineNum = 131;BA.debugLine="sv1.ContentHeight = top";
[self._sv1 setContentHeight:self._top];
 //BA.debugLineNum = 132;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 134;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _rbasc_valuechanged:(BOOL) _value{
 //BA.debugLineNum = 425;BA.debugLine="Sub rbasc_ValueChanged (Value As Boolean)";
 //BA.debugLineNum = 426;BA.debugLine="If Value Then rbdesc.Value = False";
if (_value) { 
[self._rbdesc setValue:[self.__c False]];};
 //BA.debugLineNum = 427;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _rbdesc_valuechanged:(BOOL) _value{
 //BA.debugLineNum = 421;BA.debugLine="Sub rbdesc_ValueChanged (Value As Boolean)";
 //BA.debugLineNum = 422;BA.debugLine="If Value Then rbasc.Value = False";
if (_value) { 
[self._rbasc setValue:[self.__c False]];};
 //BA.debugLineNum = 423;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 53;BA.debugLine="Public Sub StartActivity";
 //BA.debugLineNum = 55;BA.debugLine="pg.Initialize(\"Page1\")";
[self._pg Initialize:self.bi :@"Page1"];
 //BA.debugLineNum = 56;BA.debugLine="pg.RootPanel.LoadLayout(\"frmsearch\")";
[[self._pg RootPanel] LoadLayout:@"frmsearch" :self.bi];
 //BA.debugLineNum = 57;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 58;BA.debugLine="sv1.ContentWidth = pg.RootPanel.Width";
[self._sv1 setContentWidth:(int) ([[self._pg RootPanel] Width])];
 //BA.debugLineNum = 60;BA.debugLine="MyToastMessageShow1.Initialize(pg.RootPanel)";
[self._mytoastmessageshow1 _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 62;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"search";
[self._lbltitle setText:[self._library _getstringresourse:@"search_title"]];
 //BA.debugLineNum = 63;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 64;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 65;BA.debugLine="searchmodule.Initialize";
[self._searchmodule _initialize:self.bi];
 //BA.debugLineNum = 66;BA.debugLine="txtsearch.Color = Colors.White";
[self._txtsearch setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 68;BA.debugLine="sv1.Panel.Color = Colors.Transparent";
[[self._sv1 Panel] setColor:[[self.__c Colors] Transparent]];
 //BA.debugLineNum = 69;BA.debugLine="sv1.Color = Colors.Transparent";
[self._sv1 setColor:[[self.__c Colors] Transparent]];
 //BA.debugLineNum = 71;BA.debugLine="listCondition.Initialize";
[self._listcondition Initialize];
 //BA.debugLineNum = 72;BA.debugLine="Filter.Initialize";
[self._filter Initialize];
 //BA.debugLineNum = 73;BA.debugLine="listConditionView.Initialize";
[self._listconditionview Initialize];
 //BA.debugLineNum = 75;BA.debugLine="LoadFilterPanel";
[self _loadfilterpanel];
 //BA.debugLineNum = 76;BA.debugLine="Library.ChangeFont(pg.RootPanel)";
[self._library _changefont:[self._pg RootPanel]];
 //BA.debugLineNum = 77;BA.debugLine="txtsearch.TextAlignment = Library.GetStringResour";
[self._txtsearch setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 79;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtsearch_enterpressed{
 //BA.debugLineNum = 88;BA.debugLine="Sub txtsearch_EnterPressed";
 //BA.debugLineNum = 90;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 92;BA.debugLine="If txtsearch.Text.Length = 0 Then Return";
if ([[self._txtsearch Text] Length]==0) { 
if (true) return @"";};
 //BA.debugLineNum = 94;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 95;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 96;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 99;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 101;BA.debugLine="searchmodule.SearchProduct2(Me,\"product_receive\",";
[self._searchmodule _searchproduct2:self :@"product_receive" :[[[[self._txtsearch Text] Replace:@"ي" :@"ی"] Replace:@"ك" :@"ک"] Replace:@"" :@""]];
 //BA.debugLineNum = 103;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtval_focuschanged:(BOOL) _hasfocus{
 //BA.debugLineNum = 414;BA.debugLine="Sub txtval_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 415;BA.debugLine="If HasFocus Then";
if (_hasfocus) { 
 //BA.debugLineNum = 416;BA.debugLine="svfilter.ScrollTo(0,txtval.top + txtval.Height,T";
[self._svfilter ScrollTo:(int) (0) :(int) ([self._txtval Top]+[self._txtval Height]) :[self.__c True]];
 //BA.debugLineNum = 417;BA.debugLine="txtval.SelectAll";
[self._txtval SelectAll];
 };
 //BA.debugLineNum = 419;BA.debugLine="End Sub";
return @"";
}
@end
