
#import "b4i_actcategory.h"
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


@implementation b4i_actcategory 


+ (instancetype)new {
    static b4i_actcategory* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _addreturnpanel{
B4IPanelWrapper* _p1 = nil;
 //BA.debugLineNum = 199;BA.debugLine="Sub AddReturnPanel";
 //BA.debugLineNum = 201;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 202;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 203;BA.debugLine="sv1.Panel.AddView(p1,0,0,sv1.Width,0)";
[[self._sv1 Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (0) :[self._sv1 Width] :(float) (0)];
 //BA.debugLineNum = 205;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 206;BA.debugLine="p1.LoadLayout(\"frmreturn_template\")";
[_p1 LoadLayout:@"frmreturn_template" :self.bi];
 }else {
 //BA.debugLineNum = 208;BA.debugLine="p1.LoadLayout(\"frmreturn_template_en\")";
[_p1 LoadLayout:@"frmreturn_template_en" :self.bi];
 };
 //BA.debugLineNum = 211;BA.debugLine="Library.SetFont(btnopen.CustomLabel,\"icomoon\",btn";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._btnopen CustomLabel]).object)] :@"icomoon" :(int) ([[[self._btnopen CustomLabel] Font] Size])];
 //BA.debugLineNum = 212;BA.debugLine="p1.Height = pnlreturn.Height";
[_p1 setHeight:[self._pnlreturn Height]];
 //BA.debugLineNum = 213;BA.debugLine="top = top + p1.Height";
self._top = (int) (self._top+[_p1 Height]);
 //BA.debugLineNum = 215;BA.debugLine="pnloverreturn.Tag = historyCategory.Get(historyCa";
[self._pnloverreturn setTag:[self._historycategory Get:(int) ([self._historycategory Size]-1)]];
 //BA.debugLineNum = 216;BA.debugLine="lblrtitle.Text = Library.GetStringResourse(\"retur";
[self._lblrtitle setText:[self._library _getstringresourse:@"return_category"]];
 //BA.debugLineNum = 218;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnbasket_click{
 //BA.debugLineNum = 330;BA.debugLine="Sub btnbasket_Click";
 //BA.debugLineNum = 332;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 333;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse2:@"error_net_title"] :[self.__c False]];
 //BA.debugLineNum = 334;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 337;BA.debugLine="Library.LastPage = Library.CategoryPage";
self._library._lastpage = self._library._categorypage;
 //BA.debugLineNum = 338;BA.debugLine="actBasket.StartActivity";
[self._actbasket _startactivity];
 //BA.debugLineNum = 340;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 342;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 343;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 344;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsearch_click{
 //BA.debugLineNum = 325;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 326;BA.debugLine="Library.LastPage = Library.CategoryPage";
self._library._lastpage = self._library._categorypage;
 //BA.debugLineNum = 327;BA.debugLine="actSearch.StartActivity";
[self._actsearch _startactivity];
 //BA.debugLineNum = 328;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _category_receive:(B4IList*) _res :(NSString*) _scategory{
 //BA.debugLineNum = 79;BA.debugLine="Sub Category_receive(res As List,scategory As Stri";
 //BA.debugLineNum = 81;BA.debugLine="If res.IsInitialized = False Then";
if ([_res IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 83;BA.debugLine="If historyCategory.Size > 0 Then";
if ([self._historycategory Size]>0) { 
 //BA.debugLineNum = 84;BA.debugLine="sv1.Panel.RemoveAllViews";
[[self._sv1 Panel] RemoveAllViews];
 //BA.debugLineNum = 85;BA.debugLine="sv1.ScrollOffsetY = 0";
[self._sv1 setScrollOffsetY:(int) (0)];
 //BA.debugLineNum = 86;BA.debugLine="AddReturnPanel";
[self _addreturnpanel];
 //BA.debugLineNum = 87;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 };
 //BA.debugLineNum = 90;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 94;BA.debugLine="CacheData.AddCategory2Cache(res,\"cats_\" & current";
[self._cachedata _addcategory2cache:_res :[@[@"cats_",self._currentcategoryid] componentsJoinedByString:@""]];
 //BA.debugLineNum = 95;BA.debugLine="LoadCategory2Panel(res)";
[self _loadcategory2panel:_res];
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadcategory2panel:(B4IList*) _res{
B4IMap* _im = nil;
int _i = 0;
B4IPanelWrapper* _p1 = nil;
B4IMap* _m1 = nil;
NSString* _image = @"";
b4i_imagedownloader* _download = nil;
 //BA.debugLineNum = 101;BA.debugLine="Sub LoadCategory2Panel(res As List)";
 //BA.debugLineNum = 103;BA.debugLine="top = 0";
self._top = (int) (0);
 //BA.debugLineNum = 104;BA.debugLine="sv1.Panel.RemoveAllViews";
[[self._sv1 Panel] RemoveAllViews];
 //BA.debugLineNum = 105;BA.debugLine="sv1.Panel.Height = sv1.Height";
[[self._sv1 Panel] setHeight:[self._sv1 Height]];
 //BA.debugLineNum = 106;BA.debugLine="sv1.Panel.Color = Colors.White";
[[self._sv1 Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 108;BA.debugLine="If historyCategory.Size > 1 Then";
if ([self._historycategory Size]>1) { 
 //BA.debugLineNum = 109;BA.debugLine="AddReturnPanel";
[self _addreturnpanel];
 };
 //BA.debugLineNum = 113;BA.debugLine="Dim im As Map";
_im = [B4IMap new];
 //BA.debugLineNum = 114;BA.debugLine="im.Initialize";
[_im Initialize];
 //BA.debugLineNum = 116;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step10 = 1;
const int limit10 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step10 > 0 && _i <= limit10) || (step10 < 0 && _i >= limit10) ;_i = ((int)(0 + _i + step10))  ) {
 //BA.debugLineNum = 118;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 119;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 120;BA.debugLine="sv1.Panel.AddView(p1,0,top,sv1.Width,0)";
[[self._sv1 Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (self._top) :[self._sv1 Width] :(float) (0)];
 //BA.debugLineNum = 122;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 123;BA.debugLine="p1.LoadLayout(\"frmtemplage_category\")";
[_p1 LoadLayout:@"frmtemplage_category" :self.bi];
 }else {
 //BA.debugLineNum = 125;BA.debugLine="p1.LoadLayout(\"frmtemplage_category_en\")";
[_p1 LoadLayout:@"frmtemplage_category_en" :self.bi];
 };
 //BA.debugLineNum = 128;BA.debugLine="p1.Height = pncategory.Height";
[_p1 setHeight:[self._pncategory Height]];
 //BA.debugLineNum = 130;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 131;BA.debugLine="m1 = res.Get(i)";
_m1 = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 133;BA.debugLine="lblctitle.Text = m1.Get(\"name\")";
[self._lblctitle setText:[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 134;BA.debugLine="lblctitle.Text = lblctitle.Text.Replace(\"&quot;\"";
[self._lblctitle setText:[[[self._lblctitle Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 135;BA.debugLine="Library.SetFont(btnopen.CustomLabel,\"icomoon\",bt";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._btnopen CustomLabel]).object)] :@"icomoon" :(int) ([[[self._btnopen CustomLabel] Font] Size])];
 //BA.debugLineNum = 136;BA.debugLine="lblctitle.Font = Library.GetFont(lblctitle.Font.";
[self._lblctitle setFont:[self._library _getfont:(int) ([[self._lblctitle Font] Size])]];
 //BA.debugLineNum = 138;BA.debugLine="Dim image As String";
_image = @"";
 //BA.debugLineNum = 139;BA.debugLine="image = m1.Get(\"image\")";
_image = [self.bi ObjectToString:[_m1 Get:(NSObject*)(@"image")]];
 //BA.debugLineNum = 141;BA.debugLine="If image.Length > 0 And image <> \"null\" Then";
if ([_image Length]>0 && [_image isEqual:@"null"] == false) { 
 //BA.debugLineNum = 142;BA.debugLine="im.Put(imgiconcat,m1.Get(\"image\"))";
[_im Put:(NSObject*)((self._imgiconcat).object) :[_m1 Get:(NSObject*)(@"image")]];
 };
 //BA.debugLineNum = 145;BA.debugLine="pnlovercat.Tag = m1";
[self._pnlovercat setTag:(NSObject*)(_m1)];
 //BA.debugLineNum = 147;BA.debugLine="top = top + p1.Height '+ 30dip";
self._top = (int) (self._top+[_p1 Height]);
 //BA.debugLineNum = 149;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[_p1 Height])];
 }
};
 //BA.debugLineNum = 156;BA.debugLine="sv1.ContentHeight = top";
[self._sv1 setContentHeight:self._top];
 //BA.debugLineNum = 157;BA.debugLine="sv1.Panel.Width = Library.GetWidth";
[[self._sv1 Panel] setWidth:(float) ([self._library _getwidth])];
 //BA.debugLineNum = 158;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 160;BA.debugLine="If im.Size > 0 Then";
if ([_im Size]>0) { 
 //BA.debugLineNum = 161;BA.debugLine="Dim download As ImageDownloader";
_download = [b4i_imagedownloader new];
 //BA.debugLineNum = 162;BA.debugLine="download.Initialize";
[_download _initialize:self.bi];
 //BA.debugLineNum = 163;BA.debugLine="download.Download(im)";
[_download _download:_im];
 };
 //BA.debugLineNum = 166;BA.debugLine="sv1.ScrollOffsetY = 0";
[self._sv1 setScrollOffsetY:(int) (0)];
 //BA.debugLineNum = 170;BA.debugLine="If historyCategory.Size = 0 Then";
if ([self._historycategory Size]==0) { 
 //BA.debugLineNum = 171;BA.debugLine="historyCategory.Add(\"0\")";
[self._historycategory Add:(NSObject*)(@"0")];
 };
 //BA.debugLineNum = 174;BA.debugLine="If historyCategory.Get(historyCategory.Size-1) <>";
if ([[self._historycategory Get:(int) ([self._historycategory Size]-1)] isEqual:(NSObject*)(@"0")] == false) { 
 }else {
 //BA.debugLineNum = 177;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 };
 //BA.debugLineNum = 180;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 348;BA.debugLine="Sub LoadProduct(res1 As List,DefaultTop As Int,Scr";
 //BA.debugLineNum = 350;BA.debugLine="Dim Dimension(),Left,top As Int";
_dimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
_left = 0;
self._top = 0;
 //BA.debugLineNum = 351;BA.debugLine="Dim countItem,AllSpace,SpaceUnit As Int";
_countitem = 0;
_allspace = 0;
_spaceunit = 0;
 //BA.debugLineNum = 353;BA.debugLine="Dimension = Library.GetParentPanelDimension(\"frmp";
_dimension = [self._library _getparentpaneldimension:@"frmproduct_template"];
 //BA.debugLineNum = 355;BA.debugLine="countItem = Library.GetWidth / Dimension(0)";
_countitem = (int) ([self._library _getwidth]/(double)((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 //BA.debugLineNum = 356;BA.debugLine="AllSpace = Library.GetWidth - (countItem * Dimens";
_allspace = (int) ([self._library _getwidth]-(_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue));
 //BA.debugLineNum = 358;BA.debugLine="SpaceUnit = AllSpace /(countItem + 1)";
_spaceunit = (int) (_allspace/(double)(_countitem+1));
 //BA.debugLineNum = 359;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0)";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 361;BA.debugLine="top = DefaultTop";
self._top = _defaulttop;
 //BA.debugLineNum = 363;BA.debugLine="For i = 1 To res1.Size";
{
const int step9 = 1;
const int limit9 = [_res1 Size];
_i = (int) (1) ;
for (;(step9 > 0 && _i <= limit9) || (step9 < 0 && _i >= limit9) ;_i = ((int)(0 + _i + step9))  ) {
 //BA.debugLineNum = 365;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 366;BA.debugLine="pa.Initialize(\"\")";
[_pa Initialize:self.bi :@""];
 //BA.debugLineNum = 367;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,top,Dimension(";
[[_scrollview1 Panel] AddView:(UIView*)((_pa).object) :(float) (_left) :(float) (self._top) :(float) (((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue) :(float) (0)];
 //BA.debugLineNum = 368;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
[_pa LoadLayout:@"frmproduct_template" :self.bi];
 //BA.debugLineNum = 369;BA.debugLine="pa.Height = Dimension(1)";
[_pa setHeight:(float) (((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 //BA.debugLineNum = 371;BA.debugLine="Dim Temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 372;BA.debugLine="Temp = res1.Get(i-1)";
_temp = (B4IMap*)([_res1 Get:(int) (_i-1)]);
 //BA.debugLineNum = 375;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = [B4IImageViewWrapper new];
 //BA.debugLineNum = 376;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = [B4ILabelWrapper new];
_labelprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 377;BA.debugLine="Dim TempPanel As Panel";
_temppanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 378;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = [B4IPanelWrapper new];
_parentpanel.object = (B4IPanelView*)(([_pa GetView:(int) (0)]).object);
 //BA.debugLineNum = 380;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.object = (UIImageView*)(([_parentpanel GetView:(int) (4)]).object);
 //BA.debugLineNum = 381;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.object = (UILabel*)(([_parentpanel GetView:(int) (1)]).object);
 //BA.debugLineNum = 382;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.object = (UILabel*)(([_parentpanel GetView:(int) (2)]).object);
 //BA.debugLineNum = 383;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.object = (B4IPanelView*)(([_parentpanel GetView:(int) (6)]).object);
 //BA.debugLineNum = 385;BA.debugLine="TempLabel.Text = Temp.Get(\"name\")";
[_templabel setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 386;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
[_templabel setText:[[[_templabel Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 388;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 390;BA.debugLine="If Temp.ContainsKey(\"price_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"price_formated")]) { 
 //BA.debugLineNum = 391;BA.debugLine="price   = Temp.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price_formated")]];
 }else {
 //BA.debugLineNum = 393;BA.debugLine="price   = Temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 };
 //BA.debugLineNum = 396;BA.debugLine="If Temp.ContainsKey(\"special_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"special_formated")]) { 
 //BA.debugLineNum = 397;BA.debugLine="special = Temp.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special_formated")]];
 }else if([_temp ContainsKey:(NSObject*)(@"special")]) { 
 //BA.debugLineNum = 399;BA.debugLine="special = Temp.Get(\"special\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special")]];
 };
 //BA.debugLineNum = 402;BA.debugLine="If special = \"null\" Or special = \"false\" Then sp";
if ([_special isEqual:@"null"] || [_special isEqual:@"false"]) { 
_special = @"";};
 //BA.debugLineNum = 404;BA.debugLine="TempLabel.Font = Library.GetFont(LabelPrice.Font";
[_templabel setFont:[self._library _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 405;BA.debugLine="LabelPrice.Font = Library.GetFont(LabelPrice.Fon";
[_labelprice setFont:[self._library _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 407;BA.debugLine="If price.Length > 0 And (special <> 0) <> False";
if ([_price Length]>0 && ([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 408;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 }else if(([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 410;BA.debugLine="Library.DiscountStyleLabel(price,special,LabelP";
[self._library _discountstylelabel:_price :_special :_labelprice];
 }else {
 //BA.debugLineNum = 412;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 };
 //BA.debugLineNum = 415;BA.debugLine="Dim PathImage As String";
_pathimage = @"";
 //BA.debugLineNum = 417;BA.debugLine="If Temp.ContainsKey(\"image\") Then";
if ([_temp ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 418;BA.debugLine="PathImage = Temp.Get(\"image\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"image")]];
 }else if([_temp ContainsKey:(NSObject*)(@"thumb")]) { 
 //BA.debugLineNum = 420;BA.debugLine="PathImage = Temp.Get(\"thumb\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 423;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ([[_pathimage ToLowerCase] isEqual:@"null"] || [_pathimage Length]==0) { 
 //BA.debugLineNum = 424;BA.debugLine="imgTemp.Bitmap = LoadBitmap(File.DirAssets,\"noi";
[_imgtemp setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"noimage.png"]];
 }else {
 //BA.debugLineNum = 426;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 427;BA.debugLine="img.Initialize";
[_img Initialize];
 //BA.debugLineNum = 428;BA.debugLine="img.Put(imgTemp,PathImage)";
[_img Put:(NSObject*)((_imgtemp).object) :(NSObject*)(_pathimage)];
 //BA.debugLineNum = 429;BA.debugLine="Dim imgdownloader As ImageDownloader";
_imgdownloader = [b4i_imagedownloader new];
 //BA.debugLineNum = 430;BA.debugLine="imgdownloader.Initialize";
[_imgdownloader _initialize:self.bi];
 //BA.debugLineNum = 431;BA.debugLine="imgdownloader.Download(img)";
[_imgdownloader _download:_img];
 };
 //BA.debugLineNum = 434;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ([[_temppanel Tag] isEqual:(NSObject*)(@"over")]) { 
 //BA.debugLineNum = 435;BA.debugLine="TempPanel.Tag = Temp";
[_temppanel setTag:(NSObject*)(_temp)];
 }else if([[_temppanel Tag] isEqual:(NSObject*)(@"topbar")]) { 
 //BA.debugLineNum = 437;BA.debugLine="TempPanel.Color = Library.Theme_Header";
[_temppanel setColor:self._library._theme_header];
 };
 //BA.debugLineNum = 442;BA.debugLine="If i Mod countItem = 0 Then";
if (_i%_countitem==0) { 
 //BA.debugLineNum = 443;BA.debugLine="top = top + pa.Height + 15dip";
self._top = (int) (self._top+[_pa Height]+[self.__c DipToCurrent:(int) (15)]);
 //BA.debugLineNum = 444;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.He";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+[_pa Height])];
 //BA.debugLineNum = 445;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 }else {
 //BA.debugLineNum = 447;BA.debugLine="Left = Left - SpaceUnit - Dimension(0)";
_left = (int) (_left-_spaceunit-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 };
 }
};
 //BA.debugLineNum = 452;BA.debugLine="If res1.Size Mod countItem <> 0 Then";
if ([_res1 Size]%_countitem!=0) { 
 //BA.debugLineNum = 453;BA.debugLine="top = top + Dimension(1)";
self._top = (int) (self._top+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue);
 //BA.debugLineNum = 454;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.Hei";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 };
 //BA.debugLineNum = 457;BA.debugLine="Return top";
if (true) return self._top;
 //BA.debugLineNum = 459;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _pnlover_click{
B4IPanelWrapper* _p1 = nil;
B4IPanelWrapper* _p2 = nil;
B4IMap* _temp = nil;
 //BA.debugLineNum = 301;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 303;BA.debugLine="Dim p1,p2 As Panel";
_p1 = [B4IPanelWrapper new];
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 304;BA.debugLine="p1 = Sender";
_p1.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 306;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.object = (B4IPanelView*)(([self._library _getparent:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_p1).object)]]).object);
 //BA.debugLineNum = 307;BA.debugLine="p2.Visible = False";
[_p2 setVisible:[self.__c False]];
 //BA.debugLineNum = 308;BA.debugLine="p2.Visible = True";
[_p2 setVisible:[self.__c True]];
 //BA.debugLineNum = 310;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 311;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_title"] :[self.__c False]];
 //BA.debugLineNum = 312;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 315;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 316;BA.debugLine="temp = p1.Tag";
_temp = (B4IMap*)([_p1 Tag]);
 //BA.debugLineNum = 317;BA.debugLine="actProduct.product = temp";
self._actproduct._product = _temp;
 //BA.debugLineNum = 318;BA.debugLine="Library.LastPage = Library.CategoryPage";
self._library._lastpage = self._library._categorypage;
 //BA.debugLineNum = 319;BA.debugLine="actProduct.StartActivity";
[self._actproduct _startactivity];
 //BA.debugLineNum = 321;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnlovercat_click{
B4IPanelWrapper* _p1 = nil;
B4IMap* _data = nil;
NSString* _sid = @"";
B4IList* _lscache = nil;
b4i_opencart* _listproduct = nil;
 //BA.debugLineNum = 220;BA.debugLine="Sub pnlovercat_Click";
 //BA.debugLineNum = 222;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 223;BA.debugLine="p1 = Sender";
_p1.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 225;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 226;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 227;BA.debugLine="data = p1.Tag";
_data = (B4IMap*)([_p1 Tag]);
 //BA.debugLineNum = 229;BA.debugLine="Dim sID As String";
_sid = @"";
 //BA.debugLineNum = 230;BA.debugLine="sID = data.Get(\"category_id\")";
_sid = [self.bi ObjectToString:[_data Get:(NSObject*)(@"category_id")]];
 //BA.debugLineNum = 231;BA.debugLine="currentCategoryID = sID";
self._currentcategoryid = _sid;
 //BA.debugLineNum = 233;BA.debugLine="p1 = Library.GetParent(p1)";
_p1.object = (B4IPanelView*)(([self._library _getparent:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_p1).object)]]).object);
 //BA.debugLineNum = 234;BA.debugLine="p1.SetLayoutAnimated(500,1,-p1.Width,p1.top,p1.Wi";
[_p1 SetLayoutAnimated:(int) (500) :(float) (1) :(float) (-[_p1 Width]) :[_p1 Top] :[_p1 Width] :[_p1 Height]];
 //BA.debugLineNum = 235;BA.debugLine="historyCategory.Add(data.Get(\"category_id\"))";
[self._historycategory Add:[_data Get:(NSObject*)(@"category_id")]];
 //BA.debugLineNum = 237;BA.debugLine="Dim lsCache As List";
_lscache = [B4IList new];
 //BA.debugLineNum = 238;BA.debugLine="lsCache = CacheData.GetCategoryFromCache(\"cats_\"";
_lscache = [self._cachedata _getcategoryfromcache:[@[@"cats_",self._currentcategoryid] componentsJoinedByString:@""]];
 //BA.debugLineNum = 240;BA.debugLine="If lsCache <> Null And lsCache.IsInitialized Then";
if (_lscache!= nil && [_lscache IsInitialized]) { 
 //BA.debugLineNum = 242;BA.debugLine="LoadCategory2Panel(lsCache)";
[self _loadcategory2panel:_lscache];
 //BA.debugLineNum = 244;BA.debugLine="Dim lsCache As List";
_lscache = [B4IList new];
 //BA.debugLineNum = 245;BA.debugLine="lsCache = CacheData.GetProductsFromCache(\"cats_\"";
_lscache = [self._cachedata _getproductsfromcache:[@[@"cats_",self._currentcategoryid] componentsJoinedByString:@""]];
 //BA.debugLineNum = 247;BA.debugLine="If lsCache <> Null And lsCache.IsInitialized The";
if (_lscache!= nil && [_lscache IsInitialized]) { 
 //BA.debugLineNum = 248;BA.debugLine="top = LoadProduct(lsCache,top + 10dip,sv1)";
self._top = [self _loadproduct:_lscache :(int) (self._top+[self.__c DipToCurrent:(int) (10)]) :self._sv1];
 //BA.debugLineNum = 249;BA.debugLine="sv1.ContentHeight = top + 30dip";
[self._sv1 setContentHeight:(int) (self._top+[self.__c DipToCurrent:(int) (30)])];
 };
 //BA.debugLineNum = 252;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 255;BA.debugLine="Dim listProduct As OpenCart";
_listproduct = [b4i_opencart new];
 //BA.debugLineNum = 256;BA.debugLine="listProduct.Initialize";
[_listproduct _initialize:self.bi];
 //BA.debugLineNum = 257;BA.debugLine="listProduct.GetCategoryProducts(Me,\"Products_rec";
[_listproduct _getcategoryproducts:self :@"Products_receive" :[self.bi ObjectToString:[_data Get:(NSObject*)(@"category_id")]]];
 };
 //BA.debugLineNum = 260;BA.debugLine="sv1.Panel.RemoveAllViews";
[[self._sv1 Panel] RemoveAllViews];
 //BA.debugLineNum = 262;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 263;BA.debugLine="category.Initialize";
[self._category _initialize:self.bi];
 //BA.debugLineNum = 264;BA.debugLine="category.GetCategory(Me,\"Category_receive\",sID)";
[self._category _getcategory:self :@"Category_receive" :_sid];
 //BA.debugLineNum = 266;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnloverreturn_click{
NSString* _sid = @"";
B4IList* _lscache = nil;
 //BA.debugLineNum = 268;BA.debugLine="Sub pnloverreturn_Click";
 //BA.debugLineNum = 270;BA.debugLine="Dim sID As String";
_sid = @"";
 //BA.debugLineNum = 272;BA.debugLine="historyCategory.RemoveAt(historyCategory.Size-1)";
[self._historycategory RemoveAt:(int) ([self._historycategory Size]-1)];
 //BA.debugLineNum = 273;BA.debugLine="sID = historyCategory.Get(historyCategory.Size-1)";
_sid = [self.bi ObjectToString:[self._historycategory Get:(int) ([self._historycategory Size]-1)]];
 //BA.debugLineNum = 274;BA.debugLine="currentCategoryID = sID";
self._currentcategoryid = _sid;
 //BA.debugLineNum = 276;BA.debugLine="Dim lsCache As List";
_lscache = [B4IList new];
 //BA.debugLineNum = 277;BA.debugLine="lsCache = CacheData.GetCategoryFromCache(\"cats_\"";
_lscache = [self._cachedata _getcategoryfromcache:[@[@"cats_",self._currentcategoryid] componentsJoinedByString:@""]];
 //BA.debugLineNum = 279;BA.debugLine="If lsCache <> Null And lsCache.IsInitialized Then";
if (_lscache!= nil && [_lscache IsInitialized]) { 
 //BA.debugLineNum = 281;BA.debugLine="LoadCategory2Panel(lsCache)";
[self _loadcategory2panel:_lscache];
 //BA.debugLineNum = 283;BA.debugLine="Dim lsCache As List";
_lscache = [B4IList new];
 //BA.debugLineNum = 284;BA.debugLine="lsCache = CacheData.GetProductsFromCache(\"cats_\"";
_lscache = [self._cachedata _getproductsfromcache:[@[@"cats_",self._currentcategoryid] componentsJoinedByString:@""]];
 //BA.debugLineNum = 286;BA.debugLine="If lsCache <> Null And lsCache.IsInitialized The";
if (_lscache!= nil && [_lscache IsInitialized]) { 
 //BA.debugLineNum = 287;BA.debugLine="top = LoadProduct(lsCache,top + 10dip,sv1)";
self._top = [self _loadproduct:_lscache :(int) (self._top+[self.__c DipToCurrent:(int) (10)]) :self._sv1];
 //BA.debugLineNum = 288;BA.debugLine="sv1.ContentHeight = top + 30dip";
[self._sv1 setContentHeight:(int) (self._top+[self.__c DipToCurrent:(int) (30)])];
 };
 //BA.debugLineNum = 291;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 295;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 296;BA.debugLine="category.GetCategory(Me,\"Category_receive\",sID)";
[self._category _getcategory:self :@"Category_receive" :_sid];
 //BA.debugLineNum = 299;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 5;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 8;BA.debugLine="Dim category As OpenCart";
self._category = [b4i_opencart new];
 //BA.debugLineNum = 9;BA.debugLine="Private lblctitle As Label";
self._lblctitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private imgicon As ImageView";
self._imgicon = [B4IImageViewWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private pncategory As Panel";
self._pncategory = [B4IPanelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private historyCategory As List";
self._historycategory = [B4IList new];
 //BA.debugLineNum = 16;BA.debugLine="Private pnloverreturn As Panel";
self._pnloverreturn = [B4IPanelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private lblrtitle As Label";
self._lblrtitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private pnlreturn As Panel";
self._pnlreturn = [B4IPanelWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Dim top As Int = 0";
self._top = (int) (0);
 //BA.debugLineNum = 21;BA.debugLine="Private imgiconcat As ImageView";
self._imgiconcat = [B4IImageViewWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private pnlovercat As Panel";
self._pnlovercat = [B4IPanelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private lblbasket As Label";
self._lblbasket = [B4ILabelWrapper new];
 //BA.debugLineNum = 24;BA.debugLine="Private currentCategoryID As String";
self._currentcategoryid = @"";
 //BA.debugLineNum = 25;BA.debugLine="Dim MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 26;BA.debugLine="Private btnopen As Button";
self._btnopen = [B4IButtonWrapper new];
 //BA.debugLineNum = 27;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 28;BA.debugLine="Private btnsearch As Button";
self._btnsearch = [B4IButtonWrapper new];
 //BA.debugLineNum = 29;BA.debugLine="Private btnbasket As Button";
self._btnbasket = [B4IButtonWrapper new];
 //BA.debugLineNum = 31;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _products_receive:(B4IList*) _res :(NSString*) _scategory{
 //BA.debugLineNum = 182;BA.debugLine="Sub Products_receive(res As List,sCategory As Stri";
 //BA.debugLineNum = 184;BA.debugLine="CacheData.AddProducts2Cache(res,\"cats_\" & current";
[self._cachedata _addproducts2cache:_res :[@[@"cats_",self._currentcategoryid] componentsJoinedByString:@""]];
 //BA.debugLineNum = 186;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 188;BA.debugLine="If res.Size > 0 Then";
if ([_res Size]>0) { 
 //BA.debugLineNum = 189;BA.debugLine="top = LoadProduct(res,top + 10dip,sv1)";
self._top = [self _loadproduct:_res :(int) (self._top+[self.__c DipToCurrent:(int) (10)]) :self._sv1];
 //BA.debugLineNum = 190;BA.debugLine="sv1.ContentHeight = top + 130dip";
[self._sv1 setContentHeight:(int) (self._top+[self.__c DipToCurrent:(int) (130)])];
 }else {
 //BA.debugLineNum = 192;BA.debugLine="sv1.ContentHeight = sv1.ContentHeight + 130dip";
[self._sv1 setContentHeight:(int) ([self._sv1 ContentHeight]+[self.__c DipToCurrent:(int) (130)])];
 };
 //BA.debugLineNum = 195;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IList* _lscache = nil;
 //BA.debugLineNum = 33;BA.debugLine="public Sub StartActivity";
 //BA.debugLineNum = 35;BA.debugLine="Library.CategoryPage.Initialize(\"pageCat\")";
[self._library._categorypage Initialize:self.bi :@"pageCat"];
 //BA.debugLineNum = 36;BA.debugLine="Library.CategoryPage.RootPanel.LoadLayout(\"frmcat";
[[self._library._categorypage RootPanel] LoadLayout:@"frmcategory" :self.bi];
 //BA.debugLineNum = 37;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 39;BA.debugLine="Library.SetFont(btnbasket.CustomLabel,\"icomoon\",b";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._btnbasket CustomLabel]).object)] :@"icomoon" :(int) ([[[self._btnbasket CustomLabel] Font] Size])];
 //BA.debugLineNum = 40;BA.debugLine="Library.SetFont(btnsearch.CustomLabel,\"icomoon\",b";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._btnsearch CustomLabel]).object)] :@"icomoon" :(int) ([[[self._btnsearch CustomLabel] Font] Size])];
 //BA.debugLineNum = 41;BA.debugLine="Library.SetFont(btnclose.CustomLabel,\"icomoon\",bt";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._btnclose CustomLabel]).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 43;BA.debugLine="Library.NavControl.ShowPage(Library.CategoryPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._categorypage).object)];
 //BA.debugLineNum = 45;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 46;BA.debugLine="Library.CategoryPage.RootPanel.Color  = Library.T";
[[self._library._categorypage RootPanel] setColor:self._library._theme_background];
 //BA.debugLineNum = 48;BA.debugLine="MyToastMessageShow1.Initialize(Library.CategoryPa";
[self._mytoastmessageshow1 _initialize:self.bi :[self._library._categorypage RootPanel]];
 //BA.debugLineNum = 50;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"catego";
[self._lbltitle setText:[self._library _getstringresourse:@"category"]];
 //BA.debugLineNum = 51;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 52;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 54;BA.debugLine="currentCategoryID = \"0\"";
self._currentcategoryid = @"0";
 //BA.debugLineNum = 56;BA.debugLine="historyCategory.Initialize";
[self._historycategory Initialize];
 //BA.debugLineNum = 58;BA.debugLine="Dim lsCache As List";
_lscache = [B4IList new];
 //BA.debugLineNum = 59;BA.debugLine="lsCache = CacheData.GetCategoryFromCache(\"cats_\"";
_lscache = [self._cachedata _getcategoryfromcache:[@[@"cats_",self._currentcategoryid] componentsJoinedByString:@""]];
 //BA.debugLineNum = 61;BA.debugLine="If lsCache <> Null And lsCache.IsInitialized Then";
if (_lscache!= nil && [_lscache IsInitialized]) { 
 //BA.debugLineNum = 62;BA.debugLine="LoadCategory2Panel(lsCache)";
[self _loadcategory2panel:_lscache];
 //BA.debugLineNum = 63;BA.debugLine="sv1.ContentHeight = sv1.ContentHeight + 130dip";
[self._sv1 setContentHeight:(int) ([self._sv1 ContentHeight]+[self.__c DipToCurrent:(int) (130)])];
 //BA.debugLineNum = 64;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 66;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 67;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 68;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 72;BA.debugLine="category.Initialize";
[self._category _initialize:self.bi];
 //BA.debugLineNum = 73;BA.debugLine="category.GetCategory(Me,\"Category_receive\",\"\")";
[self._category _getcategory:self :@"Category_receive" :@""];
 //BA.debugLineNum = 75;BA.debugLine="Library.ShowCartLabel(lblbasket)";
[self._library _showcartlabel:self._lblbasket];
 //BA.debugLineNum = 77;BA.debugLine="End Sub";
return @"";
}
@end
