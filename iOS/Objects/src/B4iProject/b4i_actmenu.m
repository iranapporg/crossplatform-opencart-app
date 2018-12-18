
#import "b4i_actmenu.h"
#import "b4i_main.h"
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
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_actmenu 


+ (instancetype)new {
    static b4i_actmenu* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _add2cart2_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _rs = nil;
 //BA.debugLineNum = 794;BA.debugLine="Sub Add2Cart2_receive(res As Map,cat As String)";
 //BA.debugLineNum = 796;BA.debugLine="Library.hud.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 798;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 800;BA.debugLine="Dim rs As Map";
_rs = [B4IMap new];
 //BA.debugLineNum = 802;BA.debugLine="rs = res.Get(\"error\")";
_rs = (B4IMap*)([_res Get:(NSObject*)(@"error")]);
 //BA.debugLineNum = 804;BA.debugLine="If rs.ContainsKey(\"option\") Then";
if ([_rs ContainsKey:(NSObject*)(@"option")]) { 
 //BA.debugLineNum = 805;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"cannot_add_cart"] :[self.__c True]];
 //BA.debugLineNum = 806;BA.debugLine="actProduct.product = CreateMap(\"product_id\":Lib";
self._actproduct._product = [self.__c createMap:@[(NSObject*)(@"product_id"),(NSObject*)(self._library._productchoosenid)]];
 //BA.debugLineNum = 807;BA.debugLine="Library.ProductChoosenID = 0";
self._library._productchoosenid = [self.bi NumberToString:@(0)];
 //BA.debugLineNum = 808;BA.debugLine="actProduct.StartActivity";
[self._actproduct _startactivity];
 //BA.debugLineNum = 809;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 814;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 815;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse2:@"add2cart"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 816;BA.debugLine="GetCart";
[self _getcart];
 };
 //BA.debugLineNum = 819;BA.debugLine="Library.ProductChoosenID = 0";
self._library._productchoosenid = [self.bi NumberToString:@(0)];
 //BA.debugLineNum = 821;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addbullet:(int) _size{
int _left = 0;
int _c1 = 0;
int _i = 0;
B4IPanelWrapper* _p1 = nil;
 //BA.debugLineNum = 578;BA.debugLine="Sub AddBullet(size As Int)";
 //BA.debugLineNum = 580;BA.debugLine="Dim left As Int";
_left = 0;
 //BA.debugLineNum = 581;BA.debugLine="left = 0";
_left = (int) (0);
 //BA.debugLineNum = 583;BA.debugLine="If bullet.IsInitialized = False Then bullet.Initi";
if ([self._bullet IsInitialized]==[self.__c False]) { 
[self._bullet Initialize];};
 //BA.debugLineNum = 585;BA.debugLine="pnlcircle.RemoveAllViews";
[self._pnlcircle RemoveAllViews];
 //BA.debugLineNum = 587;BA.debugLine="Dim c1 As Int";
_c1 = 0;
 //BA.debugLineNum = 588;BA.debugLine="c1 = Colors.RGB(191,191,191)";
_c1 = [[self.__c Colors] RGB:(int) (191) :(int) (191) :(int) (191)];
 //BA.debugLineNum = 590;BA.debugLine="pnlcircle.Width = 0";
[self._pnlcircle setWidth:(float) (0)];
 //BA.debugLineNum = 592;BA.debugLine="For i = 1 To size";
{
const int step8 = 1;
const int limit8 = _size;
_i = (int) (1) ;
for (;(step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8) ;_i = ((int)(0 + _i + step8))  ) {
 //BA.debugLineNum = 593;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 594;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 595;BA.debugLine="pnlcircle.AddView(p1,left,pnlcircle.Height /2,10";
[self._pnlcircle AddView:(UIView*)((_p1).object) :(float) (_left) :(float) ([self._pnlcircle Height]/(double)2) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) ([self.__c DipToCurrent:(int) (10)])];
 //BA.debugLineNum = 596;BA.debugLine="p1.Color = c1";
[_p1 setColor:_c1];
 //BA.debugLineNum = 597;BA.debugLine="p1.SetBorder(0,c1,5)";
[_p1 SetBorder:(float) (0) :_c1 :(float) (5)];
 //BA.debugLineNum = 598;BA.debugLine="left = left + 14dip";
_left = (int) (_left+[self.__c DipToCurrent:(int) (14)]);
 //BA.debugLineNum = 599;BA.debugLine="pnlcircle.Width = left";
[self._pnlcircle setWidth:(float) (_left)];
 //BA.debugLineNum = 600;BA.debugLine="p1.Tag = i";
[_p1 setTag:(NSObject*)(@(_i))];
 //BA.debugLineNum = 601;BA.debugLine="bullet.Add(p1)";
[self._bullet Add:(NSObject*)((_p1).object)];
 }
};
 //BA.debugLineNum = 604;BA.debugLine="Library.CenterView(pnlcircle,pnlads)";
[self._library _centerview:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._pnlcircle).object)] :(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._pnlads).object)]];
 //BA.debugLineNum = 606;BA.debugLine="End Sub";
return @"";
}
- (int)  _addheader:(NSString*) _title :(NSString*) _tag :(int) _top{
B4IPanelWrapper* _p1 = nil;
int _c1 = 0;
 //BA.debugLineNum = 307;BA.debugLine="Sub AddHeader(Title As String,Tag As String,Top As";
 //BA.debugLineNum = 309;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 310;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 311;BA.debugLine="sv1.Panel.AddView(p1,0,Top,sv1.Width,0)";
[[self._sv1 Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (_top) :[self._sv1 Width] :(float) (0)];
 //BA.debugLineNum = 313;BA.debugLine="If Library.manager.GetString(\"lang\") = \"فارسی\" Th";
if ([[self._library._manager _getstring:@"lang"] isEqual:@"فارسی"]) { 
 //BA.debugLineNum = 314;BA.debugLine="p1.LoadLayout(\"frmheader_template\")";
[_p1 LoadLayout:@"frmheader_template" :self.bi];
 }else {
 //BA.debugLineNum = 316;BA.debugLine="p1.LoadLayout(\"frmheader_template_en\")";
[_p1 LoadLayout:@"frmheader_template_en" :self.bi];
 };
 //BA.debugLineNum = 319;BA.debugLine="p1.Height = pnlheadert.Height";
[_p1 setHeight:[self._pnlheadert Height]];
 //BA.debugLineNum = 320;BA.debugLine="lblheadername.Text = Title";
[self._lblheadername setText:_title];
 //BA.debugLineNum = 321;BA.debugLine="pnloverheader.Tag = Tag";
[self._pnloverheader setTag:(NSObject*)(_tag)];
 //BA.debugLineNum = 322;BA.debugLine="lblheadername.Font = Library.GetFont(lblheadernam";
[self._lblheadername setFont:[self._library _getfont:(int) ([[self._lblheadername Font] Size])]];
 //BA.debugLineNum = 323;BA.debugLine="Library.SetFont(lblnext,\"icomoon\",lblnext.Font.Si";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblnext).object)] :@"icomoon" :(int) ([[self._lblnext Font] Size])];
 //BA.debugLineNum = 324;BA.debugLine="Top = Top + p1.Height + 4dip";
_top = (int) (_top+[_p1 Height]+[self.__c DipToCurrent:(int) (4)]);
 //BA.debugLineNum = 326;BA.debugLine="Dim c1 As Int";
_c1 = 0;
 //BA.debugLineNum = 327;BA.debugLine="c1 = Library.Theme_Header";
_c1 = self._library._theme_header;
 //BA.debugLineNum = 328;BA.debugLine="pnlheaderproduct.Color = c1";
[self._pnlheaderproduct setColor:_c1];
 //BA.debugLineNum = 329;BA.debugLine="pnlheaderproduct.SetBorder(0,Colors.White,16dip)";
[self._pnlheaderproduct SetBorder:(float) (0) :[[self.__c Colors] White] :(float) ([self.__c DipToCurrent:(int) (16)])];
 //BA.debugLineNum = 331;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[_p1 Height])];
 //BA.debugLineNum = 333;BA.debugLine="Return Top";
if (true) return _top;
 //BA.debugLineNum = 335;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _addproduct2panel:(B4IScrollView*) _scrollview1 :(int) _left :(B4IArray*) _dimension :(B4IMap*) _temp{
B4IPanelWrapper* _pa = nil;
B4IImageViewWrapper* _imgtemp = nil;
B4ILabelWrapper* _templabel = nil;
B4ILabelWrapper* _labelprice = nil;
B4IPanelWrapper* _temppanel = nil;
B4IActivityIndicatorWrapper* _progress = nil;
B4IPanelWrapper* _parentpanel = nil;
NSString* _price = @"";
NSString* _special = @"";
NSString* _pathimage = @"";
B4IMap* _img = nil;
b4i_imagedownloader* _imgdownloader = nil;
 //BA.debugLineNum = 885;BA.debugLine="Sub AddProduct2Panel(ScrollView1 As ScrollView, Le";
 //BA.debugLineNum = 887;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 888;BA.debugLine="pa.Initialize(\"\")";
[_pa Initialize:self.bi :@""];
 //BA.debugLineNum = 889;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,0,Dimension(0)";
[[_scrollview1 Panel] AddView:(UIView*)((_pa).object) :(float) (_left) :(float) (0) :(float) (((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue) :(float) (0)];
 //BA.debugLineNum = 890;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
[_pa LoadLayout:@"frmproduct_template" :self.bi];
 //BA.debugLineNum = 891;BA.debugLine="pa.Height = Dimension(1)";
[_pa setHeight:(float) (((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 //BA.debugLineNum = 894;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = [B4IImageViewWrapper new];
 //BA.debugLineNum = 896;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = [B4ILabelWrapper new];
_labelprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 897;BA.debugLine="Dim TempPanel As Panel";
_temppanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 898;BA.debugLine="Dim progress As ActivityIndicator";
_progress = [B4IActivityIndicatorWrapper new];
 //BA.debugLineNum = 899;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = [B4IPanelWrapper new];
_parentpanel.object = (B4IPanelView*)(([_pa GetView:(int) (0)]).object);
 //BA.debugLineNum = 902;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.object = (UIImageView*)(([_parentpanel GetView:(int) (4)]).object);
 //BA.debugLineNum = 903;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.object = (UILabel*)(([_parentpanel GetView:(int) (1)]).object);
 //BA.debugLineNum = 904;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.object = (UILabel*)(([_parentpanel GetView:(int) (2)]).object);
 //BA.debugLineNum = 905;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.object = (B4IPanelView*)(([_parentpanel GetView:(int) (6)]).object);
 //BA.debugLineNum = 906;BA.debugLine="progress = ParentPanel.GetView(0)";
_progress.object = (UIActivityIndicatorView*)(([_parentpanel GetView:(int) (0)]).object);
 //BA.debugLineNum = 908;BA.debugLine="TempLabel.Text = temp.Get(\"name\")";
[_templabel setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 909;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
[_templabel setText:[[[_templabel Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 911;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 913;BA.debugLine="If temp.ContainsKey(\"price_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"price_formated")]) { 
 //BA.debugLineNum = 914;BA.debugLine="price   = temp.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price_formated")]];
 }else {
 //BA.debugLineNum = 916;BA.debugLine="price   = temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 };
 //BA.debugLineNum = 919;BA.debugLine="If temp.ContainsKey(\"special_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"special_formated")]) { 
 //BA.debugLineNum = 920;BA.debugLine="special = temp.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special_formated")]];
 }else if([_temp ContainsKey:(NSObject*)(@"special")]) { 
 //BA.debugLineNum = 922;BA.debugLine="special = temp.Get(\"special\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special")]];
 };
 //BA.debugLineNum = 925;BA.debugLine="If special = \"null\" Or special = \"false\" Or spec";
if ([_special isEqual:@"null"] || [_special isEqual:@"false"] || [_special isEqual:@"0"]) { 
_special = @"";};
 //BA.debugLineNum = 927;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 928;BA.debugLine="Library.SetFont(LabelPrice,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_labelprice).object)] :@"" :(int) (14)];
 //BA.debugLineNum = 929;BA.debugLine="Library.SetFont(TempLabel,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_templabel).object)] :@"" :(int) (14)];
 };
 //BA.debugLineNum = 932;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if ([_price Length]>0 && [_special Length]==0) { 
 //BA.debugLineNum = 933;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 }else if([_special Length]>0) { 
 //BA.debugLineNum = 935;BA.debugLine="Library.DiscountStyleLabel(price,special,LabelP";
[self._library _discountstylelabel:_price :_special :_labelprice];
 };
 //BA.debugLineNum = 938;BA.debugLine="Dim PathImage As String";
_pathimage = @"";
 //BA.debugLineNum = 940;BA.debugLine="If temp.ContainsKey(\"image\") Then";
if ([_temp ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 941;BA.debugLine="PathImage = temp.Get(\"image\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"image")]];
 }else if([_temp ContainsKey:(NSObject*)(@"thumb")]) { 
 //BA.debugLineNum = 943;BA.debugLine="PathImage = temp.Get(\"thumb\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 946;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ([[_pathimage ToLowerCase] isEqual:@"null"] || [_pathimage Length]==0) { 
 //BA.debugLineNum = 947;BA.debugLine="imgTemp.Bitmap = LoadBitmap(File.DirAssets,\"noi";
[_imgtemp setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"noimage.png"]];
 }else {
 //BA.debugLineNum = 949;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 950;BA.debugLine="img.Initialize";
[_img Initialize];
 //BA.debugLineNum = 951;BA.debugLine="img.Put(imgTemp,PathImage)";
[_img Put:(NSObject*)((_imgtemp).object) :(NSObject*)(_pathimage)];
 //BA.debugLineNum = 952;BA.debugLine="Dim imgdownloader As ImageDownloader";
_imgdownloader = [b4i_imagedownloader new];
 //BA.debugLineNum = 953;BA.debugLine="imgdownloader.Initialize";
[_imgdownloader _initialize:self.bi];
 //BA.debugLineNum = 954;BA.debugLine="imgdownloader.Download(img)";
[_imgdownloader _download:_img];
 };
 //BA.debugLineNum = 957;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ([[_temppanel Tag] isEqual:(NSObject*)(@"over")]) { 
 //BA.debugLineNum = 958;BA.debugLine="TempPanel.Tag = temp";
[_temppanel setTag:(NSObject*)(_temp)];
 }else if([[_temppanel Tag] isEqual:(NSObject*)(@"topbar")]) { 
 //BA.debugLineNum = 960;BA.debugLine="TempPanel.Color = Library.Theme_Header";
[_temppanel setColor:self._library._theme_header];
 };
 //BA.debugLineNum = 963;BA.debugLine="progress.RemoveViewFromParent";
[_progress RemoveViewFromParent];
 //BA.debugLineNum = 968;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _allproduct_receive:(B4IList*) _res :(NSString*) _category{
NSString* _t1 = @"";
 //BA.debugLineNum = 709;BA.debugLine="Sub allproduct_receive(res As List,category As Str";
 //BA.debugLineNum = 711;BA.debugLine="CacheData.AddProducts2Cache(res,category)";
[self._cachedata _addproducts2cache:_res :_category];
 //BA.debugLineNum = 713;BA.debugLine="pnlloading.SetAlphaAnimated(500,1)";
[self._pnlloading SetAlphaAnimated:(int) (500) :(float) (1)];
 //BA.debugLineNum = 715;BA.debugLine="actProducts.res = res";
self._actproducts._res = _res;
 //BA.debugLineNum = 717;BA.debugLine="Dim t1 As String";
_t1 = @"";
 //BA.debugLineNum = 719;BA.debugLine="If category = \"bestsellers\" Then";
if ([_category isEqual:@"bestsellers"]) { 
 //BA.debugLineNum = 720;BA.debugLine="t1 = Library.GetStringResourse(\"bestproduct\")";
_t1 = [self._library _getstringresourse:@"bestproduct"];
 }else if([_category isEqual:@"featured"]) { 
 //BA.debugLineNum = 722;BA.debugLine="t1 = Library.GetStringResourse(\"featureproduct\")";
_t1 = [self._library _getstringresourse:@"featureproduct"];
 }else if([_category isEqual:@"products"] || [_category isEqual:@"latest"]) { 
 //BA.debugLineNum = 724;BA.debugLine="t1 = Library.GetStringResourse(\"newproduct\")";
_t1 = [self._library _getstringresourse:@"newproduct"];
 }else {
 //BA.debugLineNum = 726;BA.debugLine="t1 = Library.GetStringResourse(\"relat_product\")";
_t1 = [self._library _getstringresourse:@"relat_product"];
 };
 //BA.debugLineNum = 729;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 730;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 731;BA.debugLine="actProducts.title = t1";
self._actproducts._title = _t1;
 //BA.debugLineNum = 732;BA.debugLine="actProducts.StartActivity";
[self._actproducts _startactivity];
 //BA.debugLineNum = 734;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _applysettingchanges{
B4ISettings* _se = nil;
 //BA.debugLineNum = 988;BA.debugLine="Sub ApplySettingChanges";
 //BA.debugLineNum = 990;BA.debugLine="Dim se As Settings";
_se = [B4ISettings new];
 //BA.debugLineNum = 991;BA.debugLine="se.Initialize";
[_se Initialize];
 //BA.debugLineNum = 993;BA.debugLine="If (Library.currLang.ToLowerCase <> se.GetString(";
if (([[self._library._currlang ToLowerCase] isEqual:[[_se GetString:@"lang"] ToLowerCase]] == false) || ([[self._library._currcurrency ToLowerCase] isEqual:[[_se GetString:@"curr"] ToLowerCase]] == false)) { 
 //BA.debugLineNum = 995;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if ([self._library._logindetails IsInitialized]) { 
 //BA.debugLineNum = 996;BA.debugLine="Library.loginDetails.Put(\"login\",False)";
[self._library._logindetails Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c False]))];
 };
 //BA.debugLineNum = 999;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_category2\"";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_category2"];
 //BA.debugLineNum = 1000;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_category_p";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_category_product2"];
 //BA.debugLineNum = 1001;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_string_fil";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_string_file"];
 //BA.debugLineNum = 1002;BA.debugLine="CacheData.DeleteCache";
[self._cachedata _deletecache];
 //BA.debugLineNum = 1004;BA.debugLine="Library.NavControl.ShowPage(Library.MainPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._mainpage).object)];
 //BA.debugLineNum = 1006;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1010;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _bestproduct_receive:(B4IList*) _res :(NSString*) _category{
B4IViewWrapper* _v = nil;
 //BA.debugLineNum = 233;BA.debugLine="Sub bestproduct_receive(Res As List,category As St";
 //BA.debugLineNum = 235;BA.debugLine="Library.BestProduct.Initialize";
[self._library._bestproduct Initialize];
 //BA.debugLineNum = 236;BA.debugLine="Library.BestProduct = Res";
self._library._bestproduct = _res;
 //BA.debugLineNum = 238;BA.debugLine="CacheData.AddProducts2Cache(Res,\"best\")";
[self._cachedata _addproducts2cache:_res :@"best"];
 //BA.debugLineNum = 239;BA.debugLine="CacheData.AddProducts2Cache(Library.NewProduct,\"n";
[self._cachedata _addproducts2cache:self._library._newproduct :@"new"];
 //BA.debugLineNum = 240;BA.debugLine="CacheData.AddProducts2Cache(Library.FeatureProduc";
[self._cachedata _addproducts2cache:self._library._featureproduct :@"feature"];
 //BA.debugLineNum = 242;BA.debugLine="If Res.Size > 0 Then";
if ([_res Size]>0) { 
 //BA.debugLineNum = 243;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"bes";
self._topsv = [self _addheader:[self._library _getstringresourse:@"bestproduct"] :@"bestproduct" :self._topsv];
 //BA.debugLineNum = 244;BA.debugLine="svhBestProduct.Initialize(0,sv1.Width,210dip)";
[self._svhbestproduct Initialize:self.bi :[self.bi NumberToString:@(0)] :(int) ([self._sv1 Width]) :[self.__c DipToCurrent:(int) (210)]];
 //BA.debugLineNum = 245;BA.debugLine="sv1.Panel.AddView(svhBestProduct,0,topSV,sv1.Wid";
[[self._sv1 Panel] AddView:(UIView*)((self._svhbestproduct).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (210)])];
 //BA.debugLineNum = 246;BA.debugLine="topSV = topSV + LoadProductHorizontalScroll(Libr";
self._topsv = (int) (self._topsv+[self _loadproducthorizontalscroll:self._library._bestproduct :self._svhbestproduct]+[self.__c DipToCurrent:(int) (70)]);
 //BA.debugLineNum = 247;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 180dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (180)])];
 //BA.debugLineNum = 248;BA.debugLine="Dim v As View";
_v = [B4IViewWrapper new];
 //BA.debugLineNum = 249;BA.debugLine="v = svhBestProduct.Panel.GetView(0)";
_v = [[self._svhbestproduct Panel] GetView:(int) (0)];
 //BA.debugLineNum = 250;BA.debugLine="v.Top = 0";
[_v setTop:(float) (0)];
 };
 //BA.debugLineNum = 253;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 180dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (180)])];
 //BA.debugLineNum = 254;BA.debugLine="sv1.ContentHeight = sv1.Panel.Height";
[self._sv1 setContentHeight:(int) ([[self._sv1 Panel] Height])];
 //BA.debugLineNum = 256;BA.debugLine="opManufacturers.GetManufacturers(Me,\"Manufacturer";
[self._opmanufacturers _getmanufacturers:self :@"Manufacturers_receive"];
 //BA.debugLineNum = 258;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnadd_2_cart_click{
B4IButtonWrapper* _b1 = nil;
 //BA.debugLineNum = 785;BA.debugLine="Sub btnadd_2_cart_Click";
 //BA.debugLineNum = 787;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 788;BA.debugLine="b1 = Sender";
_b1.object = (UIButton*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 790;BA.debugLine="Library.Add2Cart(b1.Tag,\"1\",Me)";
[self._library _add2cart:[self.bi ObjectToString:[_b1 Tag]] :@"1" :self];
 //BA.debugLineNum = 792;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnbasket_click{
 //BA.debugLineNum = 631;BA.debugLine="Sub btnbasket_Click";
 //BA.debugLineNum = 633;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 634;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse2:@"error_net_title"] :[self.__c False]];
 //BA.debugLineNum = 635;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 638;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 639;BA.debugLine="actBasket.StartActivity";
[self._actbasket _startactivity];
 //BA.debugLineNum = 641;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncat_click{
 //BA.debugLineNum = 754;BA.debugLine="Sub btncat_Click";
 //BA.debugLineNum = 755;BA.debugLine="actCategory.StartActivity";
[self._actcategory _startactivity];
 //BA.debugLineNum = 756;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnmenu_click{
 //BA.debugLineNum = 622;BA.debugLine="Sub btnmenu_Click";
 //BA.debugLineNum = 623;BA.debugLine="sm.OpenMenu";
[self._sm _openmenu];
 //BA.debugLineNum = 624;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsearch_click{
 //BA.debugLineNum = 626;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 627;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 628;BA.debugLine="actSearch.StartActivity";
[self._actsearch _startactivity];
 //BA.debugLineNum = 629;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _carts_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 742;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 744;BA.debugLine="If res = Null Then";
if (_res== nil) { 
 //BA.debugLineNum = 745;BA.debugLine="lblbasket.Visible = False";
[self._lblbasket setVisible:[self.__c False]];
 //BA.debugLineNum = 746;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 749;BA.debugLine="Library.CartDetails = res";
self._library._cartdetails = _res;
 //BA.debugLineNum = 750;BA.debugLine="Library.ShowCartLabel(lblbasket)";
[self._library _showcartlabel:self._lblbasket];
 //BA.debugLineNum = 752;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _choosebullet:(int) _i{
int _c1 = 0;
int _c2 = 0;
B4IViewWrapper* _v1 = nil;
B4IPanelWrapper* _p2 = nil;
 //BA.debugLineNum = 527;BA.debugLine="Sub ChooseBullet(i As Int)";
 //BA.debugLineNum = 531;BA.debugLine="Dim c1,c2 As Int";
_c1 = 0;
_c2 = 0;
 //BA.debugLineNum = 532;BA.debugLine="c1 = Colors.RGB(66,66,66)";
_c1 = [[self.__c Colors] RGB:(int) (66) :(int) (66) :(int) (66)];
 //BA.debugLineNum = 533;BA.debugLine="c2 = Colors.RGB(191,191,191)";
_c2 = [[self.__c Colors] RGB:(int) (191) :(int) (191) :(int) (191)];
 //BA.debugLineNum = 535;BA.debugLine="For Each v1 As View In pnlcircle.GetAllViewsRecur";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group4 = [self._pnlcircle GetAllViewsRecursive];
const int groupLen4 = group4.Size
;int index4 = 0;
;
for (; index4 < groupLen4;index4++){
_v1.object = (UIView*)([group4 Get:index4]);
 //BA.debugLineNum = 536;BA.debugLine="Dim p2 As Panel";
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 537;BA.debugLine="p2 = v1";
_p2.object = (B4IPanelView*)((_v1).object);
 //BA.debugLineNum = 538;BA.debugLine="p2.Color = c2";
[_p2 setColor:_c2];
 //BA.debugLineNum = 539;BA.debugLine="p2.SetBorder(0,c2,5)";
[_p2 SetBorder:(float) (0) :_c2 :(float) (5)];
 //BA.debugLineNum = 541;BA.debugLine="If p2.Tag = i Then";
if ([[_p2 Tag] isEqual:(NSObject*)(@(_i))]) { 
 //BA.debugLineNum = 542;BA.debugLine="p2.Color = c1";
[_p2 setColor:_c1];
 //BA.debugLineNum = 543;BA.debugLine="p2.SetBorder(0,c1,5)";
[_p2 SetBorder:(float) (0) :_c1 :(float) (5)];
 };
 }
};
 //BA.debugLineNum = 548;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _featureproduct_receive:(B4IList*) _res :(NSString*) _category{
B4IViewWrapper* _v = nil;
 //BA.debugLineNum = 209;BA.debugLine="Sub FeatureProduct_receive(Res As List,category As";
 //BA.debugLineNum = 211;BA.debugLine="Library.FeatureProduct.Initialize";
[self._library._featureproduct Initialize];
 //BA.debugLineNum = 212;BA.debugLine="Library.FeatureProduct = Res";
self._library._featureproduct = _res;
 //BA.debugLineNum = 215;BA.debugLine="If Res.Size > 0 Then";
if ([_res Size]>0) { 
 //BA.debugLineNum = 216;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"fea";
self._topsv = [self _addheader:[self._library _getstringresourse:@"featureproduct"] :@"featureproduct" :self._topsv];
 //BA.debugLineNum = 217;BA.debugLine="svhFeatureProduct.Initialize(0,sv1.Width,210)";
[self._svhfeatureproduct Initialize:self.bi :[self.bi NumberToString:@(0)] :(int) ([self._sv1 Width]) :(int) (210)];
 //BA.debugLineNum = 218;BA.debugLine="sv1.Panel.AddView(svhFeatureProduct,0,topSV,sv1.";
[[self._sv1 Panel] AddView:(UIView*)((self._svhfeatureproduct).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (210)])];
 //BA.debugLineNum = 219;BA.debugLine="topSV = topSV + LoadProductHorizontalScroll(Libr";
self._topsv = (int) (self._topsv+[self _loadproducthorizontalscroll:self._library._featureproduct :self._svhfeatureproduct]+[self.__c DipToCurrent:(int) (70)]);
 //BA.debugLineNum = 221;BA.debugLine="Dim v As View";
_v = [B4IViewWrapper new];
 //BA.debugLineNum = 222;BA.debugLine="v = svhFeatureProduct.Panel.GetView(0)";
_v = [[self._svhfeatureproduct Panel] GetView:(int) (0)];
 //BA.debugLineNum = 223;BA.debugLine="v.Top = 0";
[_v setTop:(float) (0)];
 };
 //BA.debugLineNum = 226;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 180dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (180)])];
 //BA.debugLineNum = 227;BA.debugLine="sv1.ContentHeight = sv1.Panel.Height";
[self._sv1 setContentHeight:(int) ([[self._sv1 Panel] Height])];
 //BA.debugLineNum = 229;BA.debugLine="BestProduct.GetSpecialProduct(\"bestsellers\",False";
[self._bestproduct _getspecialproduct:@"bestsellers" :[self.__c False] :[self._library _getlimitloaditem] :self :@"bestproduct_receive"];
 //BA.debugLineNum = 231;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getcart{
b4i_opencart* _cart = nil;
 //BA.debugLineNum = 736;BA.debugLine="Sub GetCart";
 //BA.debugLineNum = 737;BA.debugLine="Dim cart As OpenCart";
_cart = [b4i_opencart new];
 //BA.debugLineNum = 738;BA.debugLine="cart.Initialize";
[_cart _initialize:self.bi];
 //BA.debugLineNum = 739;BA.debugLine="cart.GetCarts(Me,\"Carts_receive\")";
[_cart _getcarts:self :@"Carts_receive"];
 //BA.debugLineNum = 740;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _imgads_click{
B4IImageViewWrapper* _im = nil;
B4IMap* _te = nil;
 //BA.debugLineNum = 501;BA.debugLine="Sub imgads_Click";
 //BA.debugLineNum = 503;BA.debugLine="Dim im As ImageView";
_im = [B4IImageViewWrapper new];
 //BA.debugLineNum = 504;BA.debugLine="im = Sender";
_im.object = (UIImageView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 505;BA.debugLine="Dim te As Map";
_te = [B4IMap new];
 //BA.debugLineNum = 506;BA.debugLine="te = im.Tag";
_te = (B4IMap*)([_im Tag]);
 //BA.debugLineNum = 507;BA.debugLine="ShowSlideContent(te)";
[self _showslidecontent:_te];
 //BA.debugLineNum = 509;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _imgmanufacturers_click{
B4IImageViewWrapper* _im = nil;
B4IList* _res = nil;
b4i_opencart* _op = nil;
 //BA.debugLineNum = 823;BA.debugLine="Sub imgmanufacturers_Click";
 //BA.debugLineNum = 825;BA.debugLine="Dim im As ImageView";
_im = [B4IImageViewWrapper new];
 //BA.debugLineNum = 826;BA.debugLine="im = Sender";
_im.object = (UIImageView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 828;BA.debugLine="If im.Tag = Null Or im.Tag = \"\" Then Return";
if ([_im Tag]== nil || [[_im Tag] isEqual:(NSObject*)(@"")]) { 
if (true) return @"";};
 //BA.debugLineNum = 830;BA.debugLine="Try";
@try { //BA.debugLineNum = 832;BA.debugLine="Dim res As List";
_res = [B4IList new];
 //BA.debugLineNum = 833;BA.debugLine="res = CacheData.GetProductsFromCache(\"products/m";
_res = [self._cachedata _getproductsfromcache:[@[@"products/manufacturer/",[self.bi ObjectToString:[_im Tag]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 835;BA.debugLine="If res.IsInitialized Then";
if ([_res IsInitialized]) { 
 //BA.debugLineNum = 836;BA.debugLine="If res.Size > 0 Then";
if ([_res Size]>0) { 
 //BA.debugLineNum = 837;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 838;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 839;BA.debugLine="actProducts.title = Library.GetStringResourse2";
self._actproducts._title = [self._library _getstringresourse2:@"relat_product"];
 //BA.debugLineNum = 840;BA.debugLine="actProducts.StartActivity";
[self._actproducts _startactivity];
 //BA.debugLineNum = 841;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 845;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 847;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 848;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 849;BA.debugLine="op.GetmanufactureProduct(im.Tag,Me,\"AllProduct_r";
[_op _getmanufactureproduct:[self.bi ObjectToString:[_im Tag]] :self :@"AllProduct_receive"];
 } 
       @catch (NSException* e21) {
			[B4I SetException:e21]; };
 //BA.debugLineNum = 854;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _jobdone:(b4i_httpjob*) _job{
 //BA.debugLineNum = 1032;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 1034;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 1035;BA.debugLine="If Job.JobName = \"push\" Then";
if ([_job._jobname isEqual:@"push"]) { 
 //BA.debugLineNum = 1036;BA.debugLine="Try";
@try { //BA.debugLineNum = 1037;BA.debugLine="PushNotification.CheckNewPushNotification(Job.";
[self._pushnotification _checknewpushnotification:[_job _getstring2:@"UTF8"]];
 } 
       @catch (NSException* e6) {
			[B4I SetException:e6]; };
 };
 };
 //BA.debugLineNum = 1043;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadmanufacturers:(B4IList*) _res{
int _left = 0;
B4IMap* _images = nil;
int _i = 0;
B4IMap* _temp = nil;
B4IImageViewWrapper* _img = nil;
b4i_imagedownloader* _imgd = nil;
 //BA.debugLineNum = 355;BA.debugLine="Sub LoadManufacturers(res As List)";
 //BA.debugLineNum = 357;BA.debugLine="If res.Size > 0 Then";
if ([_res Size]>0) { 
 //BA.debugLineNum = 359;BA.debugLine="If svH.IsInitialized Then";
if ([self._svh IsInitialized]) { 
 //BA.debugLineNum = 360;BA.debugLine="If svH.Panel.NumberOfViews > 0 Then Return";
if ([[self._svh Panel] NumberOfViews]>0) { 
if (true) return @"";};
 };
 //BA.debugLineNum = 363;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"man";
self._topsv = [self _addheader:[self._library _getstringresourse:@"manufacture"] :@"" :self._topsv];
 //BA.debugLineNum = 365;BA.debugLine="If Library.GetDevicePhysicalSize < 7 Then";
if ([self._library _getdevicephysicalsize]<7) { 
 //BA.debugLineNum = 366;BA.debugLine="svH.Initialize(\"svH\",res.Size * 83dip + 20dip,1";
[self._svh Initialize:self.bi :@"svH" :(int) ([_res Size]*[self.__c DipToCurrent:(int) (83)]+[self.__c DipToCurrent:(int) (20)]) :[self.__c DipToCurrent:(int) (120)]];
 //BA.debugLineNum = 367;BA.debugLine="sv1.Panel.AddView(svH,0,topSV,sv1.Width,75dip)";
[[self._sv1 Panel] AddView:(UIView*)((self._svh).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (75)])];
 }else {
 //BA.debugLineNum = 369;BA.debugLine="svH.Initialize(\"svH\",res.Size * 170dip + 20dip,";
[self._svh Initialize:self.bi :@"svH" :(int) ([_res Size]*[self.__c DipToCurrent:(int) (170)]+[self.__c DipToCurrent:(int) (20)]) :[self.__c DipToCurrent:(int) (120)]];
 //BA.debugLineNum = 370;BA.debugLine="sv1.Panel.AddView(svH,0,topSV,sv1.Width,155dip)";
[[self._sv1 Panel] AddView:(UIView*)((self._svh).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (155)])];
 };
 //BA.debugLineNum = 373;BA.debugLine="svH.Panel.Color = Colors.White";
[[self._svh Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 375;BA.debugLine="topSV = topSV + svH.Height";
self._topsv = (int) (self._topsv+[self._svh Height]);
 //BA.debugLineNum = 377;BA.debugLine="Dim left As Int = 0";
_left = (int) (0);
 //BA.debugLineNum = 378;BA.debugLine="Dim images As Map";
_images = [B4IMap new];
 //BA.debugLineNum = 379;BA.debugLine="images.Initialize";
[_images Initialize];
 //BA.debugLineNum = 381;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step18 = 1;
const int limit18 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step18 > 0 && _i <= limit18) || (step18 < 0 && _i >= limit18) ;_i = ((int)(0 + _i + step18))  ) {
 //BA.debugLineNum = 383;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 384;BA.debugLine="temp = res.Get(i)";
_temp = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 386;BA.debugLine="Dim img As ImageView";
_img = [B4IImageViewWrapper new];
 //BA.debugLineNum = 387;BA.debugLine="img.Initialize(\"imgmanufacturers\")";
[_img Initialize:self.bi :@"imgmanufacturers"];
 //BA.debugLineNum = 389;BA.debugLine="svH.Panel.AddView(img,left,5,svH.Height-10dip,s";
[[self._svh Panel] AddView:(UIView*)((_img).object) :(float) (_left) :(float) (5) :(float) ([self._svh Height]-[self.__c DipToCurrent:(int) (10)]) :(float) ([self._svh Height]-[self.__c DipToCurrent:(int) (10)])];
 //BA.debugLineNum = 390;BA.debugLine="left = left + svH.Height + 10dip";
_left = (int) (_left+[self._svh Height]+[self.__c DipToCurrent:(int) (10)]);
 //BA.debugLineNum = 392;BA.debugLine="img.ContentMode = img.MODE_FIT";
[_img setContentMode:[_img MODE_FIT]];
 //BA.debugLineNum = 393;BA.debugLine="images.Put(img,temp.Get(\"image\"))";
[_images Put:(NSObject*)((_img).object) :[_temp Get:(NSObject*)(@"image")]];
 //BA.debugLineNum = 395;BA.debugLine="img.Tag = temp.Get(\"manufacturer_id\")";
[_img setTag:[_temp Get:(NSObject*)(@"manufacturer_id")]];
 }
};
 //BA.debugLineNum = 399;BA.debugLine="Dim imgd As ImageDownloader";
_imgd = [b4i_imagedownloader new];
 //BA.debugLineNum = 400;BA.debugLine="imgd.Initialize";
[_imgd _initialize:self.bi];
 //BA.debugLineNum = 401;BA.debugLine="imgd.Download(images)";
[_imgd _download:_images];
 //BA.debugLineNum = 403;BA.debugLine="topSV = topSV + 12dip";
self._topsv = (int) (self._topsv+[self.__c DipToCurrent:(int) (12)]);
 //BA.debugLineNum = 404;BA.debugLine="svH.ContentWidth = left";
[self._svh setContentWidth:_left];
 //BA.debugLineNum = 405;BA.debugLine="svH.ContentHeight = svH.Height";
[self._svh setContentHeight:(int) ([self._svh Height])];
 //BA.debugLineNum = 407;BA.debugLine="sv1.Panel.Height = topSV + 30dip";
[[self._sv1 Panel] setHeight:(float) (self._topsv+[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 408;BA.debugLine="sv1.ContentHeight = sv1.Panel.Height + 30dip";
[self._sv1 setContentHeight:(int) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 409;BA.debugLine="svH.Color = Colors.White";
[self._svh setColor:[[self.__c Colors] White]];
 };
 //BA.debugLineNum = 413;BA.debugLine="End Sub";
return @"";
}
- (int)  _loadproducthorizontalscroll:(B4IList*) _res :(B4IScrollView*) _scrollview1{
int _left = 0;
B4IArray* _dimension = nil;
int _i = 0;
B4IMap* _temp = nil;
 //BA.debugLineNum = 860;BA.debugLine="Sub LoadProductHorizontalScroll(res As List,Scroll";
 //BA.debugLineNum = 862;BA.debugLine="Dim left As Int = 20";
_left = (int) (20);
 //BA.debugLineNum = 864;BA.debugLine="Dim Dimension() As Int";
_dimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
 //BA.debugLineNum = 865;BA.debugLine="Dimension = Library.GetParentPanelDimension(\"frmp";
_dimension = [self._library _getparentpaneldimension:@"frmproduct_template"];
 //BA.debugLineNum = 867;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step4 = 1;
const int limit4 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4) ;_i = ((int)(0 + _i + step4))  ) {
 //BA.debugLineNum = 869;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 870;BA.debugLine="temp = res.Get(i)";
_temp = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 872;BA.debugLine="AddProduct2Panel(ScrollView1,left,Dimension,temp";
[self _addproduct2panel:_scrollview1 :_left :_dimension :_temp];
 //BA.debugLineNum = 874;BA.debugLine="left = left + Dimension(0) + 10dip";
_left = (int) (_left+((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+[self.__c DipToCurrent:(int) (10)]);
 }
};
 //BA.debugLineNum = 878;BA.debugLine="ScrollView1.Panel.Width = left";
[[_scrollview1 Panel] setWidth:(float) (_left)];
 //BA.debugLineNum = 879;BA.debugLine="ScrollView1.ContentWidth = left";
[_scrollview1 setContentWidth:_left];
 //BA.debugLineNum = 881;BA.debugLine="Return Dimension(0)";
if (true) return ((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue;
 //BA.debugLineNum = 883;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _loadproductsplit:(NSString*) _pa{
b4i_opencart* _op = nil;
 //BA.debugLineNum = 689;BA.debugLine="Sub LoadProductSplit(pa As String)";
 //BA.debugLineNum = 691;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 692;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 694;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 696;BA.debugLine="If pa = \"bestproduct\" Then";
if ([_pa isEqual:@"bestproduct"]) { 
 //BA.debugLineNum = 697;BA.debugLine="op.GetSpecialProduct(\"bestsellers\",True,6,Me,\"al";
[_op _getspecialproduct:@"bestsellers" :[self.__c True] :(int) (6) :self :@"allproduct_receive"];
 }else if([_pa isEqual:@"featureproduct"]) { 
 //BA.debugLineNum = 700;BA.debugLine="op.GetSpecialProduct(\"featured\",True,12,Me,\"AllP";
[_op _getspecialproduct:@"featured" :[self.__c True] :(int) (12) :self :@"AllProduct_receive"];
 }else if([_pa isEqual:@"newproduct"]) { 
 //BA.debugLineNum = 703;BA.debugLine="op.GetSpecialProduct(\"latest\",True,12,Me,\"AllPro";
[_op _getspecialproduct:@"latest" :[self.__c True] :(int) (12) :self :@"AllProduct_receive"];
 };
 //BA.debugLineNum = 707;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadslideshow:(B4IList*) _res{
B4IMap* _im = nil;
B4IMap* _firstslide = nil;
B4IMap* _images = nil;
int _left = 0;
int _i = 0;
B4IPanelWrapper* _p1 = nil;
B4IMap* _m1 = nil;
B4IImageViewWrapper* _im1 = nil;
B4ILabelWrapper* _lbl = nil;
int _c1 = 0;
b4i_imagedownloader* _imagedownload1 = nil;
 //BA.debugLineNum = 430;BA.debugLine="Sub LoadSlideshow(res As List)";
 //BA.debugLineNum = 432;BA.debugLine="If offsetSlideshow >= res.Size Then offsetSlides";
if (self._offsetslideshow>=[_res Size]) { 
self._offsetslideshow = (int) (0);};
 //BA.debugLineNum = 434;BA.debugLine="Dim im,firstslide As Map";
_im = [B4IMap new];
_firstslide = [B4IMap new];
 //BA.debugLineNum = 435;BA.debugLine="im.Initialize";
[_im Initialize];
 //BA.debugLineNum = 436;BA.debugLine="firstslide.Initialize";
[_firstslide Initialize];
 //BA.debugLineNum = 437;BA.debugLine="firstslide = res.Get(offsetSlideshow)";
_firstslide = (B4IMap*)([_res Get:self._offsetslideshow]);
 //BA.debugLineNum = 439;BA.debugLine="slidepanel1.Initialize(\"slideshowsv\",pnlads.Width";
[self._slidepanel1 Initialize:self.bi :@"slideshowsv" :(int) ([self._pnlads Width]) :(int) ([self._pnlads Height])];
 //BA.debugLineNum = 441;BA.debugLine="Dim images As Map";
_images = [B4IMap new];
 //BA.debugLineNum = 442;BA.debugLine="images.Initialize";
[_images Initialize];
 //BA.debugLineNum = 444;BA.debugLine="Dim left As Int";
_left = 0;
 //BA.debugLineNum = 446;BA.debugLine="slidepanel1.PagingEnabled = True";
[self._slidepanel1 setPagingEnabled:[self.__c True]];
 //BA.debugLineNum = 448;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step11 = 1;
const int limit11 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step11 > 0 && _i <= limit11) || (step11 < 0 && _i >= limit11) ;_i = ((int)(0 + _i + step11))  ) {
 //BA.debugLineNum = 450;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 451;BA.debugLine="p1.Initialize(\"pnlImage\")";
[_p1 Initialize:self.bi :@"pnlImage"];
 //BA.debugLineNum = 452;BA.debugLine="p1.Color = Library.Theme_Background";
[_p1 setColor:self._library._theme_background];
 //BA.debugLineNum = 453;BA.debugLine="slidepanel1.Panel.AddView(p1,left,0,pnlads.Width";
[[self._slidepanel1 Panel] AddView:(UIView*)((_p1).object) :(float) (_left) :(float) (0) :[self._pnlads Width] :[self._pnlads Height]];
 //BA.debugLineNum = 455;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 456;BA.debugLine="m1 = res.Get(i)";
_m1 = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 458;BA.debugLine="Dim im1 As ImageView";
_im1 = [B4IImageViewWrapper new];
 //BA.debugLineNum = 459;BA.debugLine="im1.Initialize(\"imgads\")";
[_im1 Initialize:self.bi :@"imgads"];
 //BA.debugLineNum = 460;BA.debugLine="Library.imagesSlideshow.Add(im1)";
[self._library._imagesslideshow Add:(NSObject*)((_im1).object)];
 //BA.debugLineNum = 462;BA.debugLine="p1.AddView(im1,0,0,pnlads.Width,pnlads.Height)";
[_p1 AddView:(UIView*)((_im1).object) :(float) (0) :(float) (0) :[self._pnlads Width] :[self._pnlads Height]];
 //BA.debugLineNum = 463;BA.debugLine="im1.Tag = m1";
[_im1 setTag:(NSObject*)(_m1)];
 //BA.debugLineNum = 464;BA.debugLine="im1.ContentMode = im1.MODE_FILL";
[_im1 setContentMode:[_im1 MODE_FILL]];
 //BA.debugLineNum = 465;BA.debugLine="left = left + pnlads.Width";
_left = (int) (_left+[self._pnlads Width]);
 //BA.debugLineNum = 467;BA.debugLine="Dim lbl As Label";
_lbl = [B4ILabelWrapper new];
 //BA.debugLineNum = 468;BA.debugLine="lbl.Initialize(\"\")";
[_lbl Initialize:self.bi :@""];
 //BA.debugLineNum = 469;BA.debugLine="lbl.Text = m1.Get(\"title\")";
[_lbl setText:[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"title")]]];
 //BA.debugLineNum = 470;BA.debugLine="If Library.IsPersian Then Library.SetFont(lbl,\"\"";
if ([self._library _ispersian]) { 
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_lbl).object)] :@"" :(int) (17)];};
 //BA.debugLineNum = 471;BA.debugLine="lbl.TextColor = Colors.Black";
[_lbl setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 472;BA.debugLine="lbl.TextAlignment = lbl.ALIGNMENT_CENTER";
[_lbl setTextAlignment:[_lbl ALIGNMENT_CENTER]];
 //BA.debugLineNum = 474;BA.debugLine="Dim c1 As Int";
_c1 = 0;
 //BA.debugLineNum = 475;BA.debugLine="c1 = Colors.ARGB(60,230, 30, 30)";
_c1 = [[self.__c Colors] ARGB:(int) (60) :(int) (230) :(int) (30) :(int) (30)];
 //BA.debugLineNum = 477;BA.debugLine="lbl.Color = c1";
[_lbl setColor:_c1];
 //BA.debugLineNum = 478;BA.debugLine="p1.AddView(lbl,0,pnlads.Height - 50dip,pnlads.Wi";
[_p1 AddView:(UIView*)((_lbl).object) :(float) (0) :(float) ([self._pnlads Height]-[self.__c DipToCurrent:(int) (50)]) :[self._pnlads Width] :(float) ([self.__c DipToCurrent:(int) (50)])];
 //BA.debugLineNum = 479;BA.debugLine="lbl.BringToFront";
[_lbl BringToFront];
 //BA.debugLineNum = 481;BA.debugLine="images.Put(im1,m1.Get(\"image\"))";
[_images Put:(NSObject*)((_im1).object) :[_m1 Get:(NSObject*)(@"image")]];
 }
};
 //BA.debugLineNum = 485;BA.debugLine="Dim imagedownload1 As ImageDownloader";
_imagedownload1 = [b4i_imagedownloader new];
 //BA.debugLineNum = 486;BA.debugLine="imagedownload1.Initialize";
[_imagedownload1 _initialize:self.bi];
 //BA.debugLineNum = 487;BA.debugLine="imagedownload1.Download(images)";
[_imagedownload1 _download:_images];
 //BA.debugLineNum = 489;BA.debugLine="slidepanel1.ContentWidth = res.Size * pnlads.Widt";
[self._slidepanel1 setContentWidth:(int) ([_res Size]*[self._pnlads Width])];
 //BA.debugLineNum = 491;BA.debugLine="pnlads.AddView(slidepanel1,0,0,pnlads.Width,pnlad";
[self._pnlads AddView:(UIView*)((self._slidepanel1).object) :(float) (0) :(float) (0) :[self._pnlads Width] :[self._pnlads Height]];
 //BA.debugLineNum = 493;BA.debugLine="AddBullet(res.Size)";
[self _addbullet:[_res Size]];
 //BA.debugLineNum = 494;BA.debugLine="ChooseBullet(1)";
[self _choosebullet:(int) (1)];
 //BA.debugLineNum = 496;BA.debugLine="timerSlideshow.Initialize(\"tmrSlideshow\",3600)";
[self._timerslideshow Initialize:self.bi :@"tmrSlideshow" :(long long) (3600)];
 //BA.debugLineNum = 497;BA.debugLine="timerSlideshow.Enabled = True";
[self._timerslideshow setEnabled:[self.__c True]];
 //BA.debugLineNum = 499;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _logout{
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 758;BA.debugLine="Sub Logout";
 //BA.debugLineNum = 760;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 761;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 762;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 763;BA.debugLine="op1.Logout(Me,\"Logout_receive\")";
[_op1 _logout:self :@"Logout_receive"];
 //BA.debugLineNum = 765;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _logout_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 767;BA.debugLine="Sub Logout_receive(res As Map,cat As String)";
 //BA.debugLineNum = 769;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 771;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 772;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 773;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse2:@"success_logout"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 774;BA.debugLine="Library.loginDetails.Put(\"login\",False)";
[self._library._logindetails Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c False]))];
 //BA.debugLineNum = 775;BA.debugLine="lblbasket.Visible = False";
[self._lblbasket setVisible:[self.__c False]];
 //BA.debugLineNum = 776;BA.debugLine="UpdateUI";
[self _updateui];
 }else {
 //BA.debugLineNum = 778;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse2:@"error_net_title"] :(long long) (2) :[self.__c False]];
 };
 };
 //BA.debugLineNum = 783;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _manufacturers_receive:(B4IMap*) _res1 :(NSString*) _category{
B4IList* _res = nil;
 //BA.debugLineNum = 337;BA.debugLine="Sub Manufacturers_receive(res1 As Map,category As";
 //BA.debugLineNum = 339;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 341;BA.debugLine="Dim res As List";
_res = [B4IList new];
 //BA.debugLineNum = 342;BA.debugLine="res = res1.Get(\"data\")";
_res.object = (NSArray*)([_res1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 344;BA.debugLine="Library.listManufacturers.Initialize";
[self._library._listmanufacturers Initialize];
 //BA.debugLineNum = 345;BA.debugLine="Library.listManufacturers = res";
self._library._listmanufacturers = _res;
 //BA.debugLineNum = 347;BA.debugLine="CacheData.AddProducts2Cache(res,\"manufacturers\")";
[self._cachedata _addproducts2cache:_res :@"manufacturers"];
 //BA.debugLineNum = 349;BA.debugLine="LoadManufacturers(res)";
[self _loadmanufacturers:_res];
 //BA.debugLineNum = 351;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 100dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (100)])];
 //BA.debugLineNum = 353;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _menupage_appear{
 //BA.debugLineNum = 1016;BA.debugLine="Sub MenuPage_Appear";
 //BA.debugLineNum = 1017;BA.debugLine="UpdateUI";
[self _updateui];
 //BA.debugLineNum = 1018;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _menupage_resize:(int) _width :(int) _height{
 //BA.debugLineNum = 1012;BA.debugLine="Sub MenuPage_Resize(Width As Int,Height As Int)";
 //BA.debugLineNum = 1013;BA.debugLine="If sv1.ContentHeight < 1000 Then sv1.ContentHeigh";
if ([self._sv1 ContentHeight]<1000) { 
[self._sv1 setContentHeight:(int) (1300)];};
 //BA.debugLineNum = 1014;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _newproduct_receive:(B4IList*) _res :(NSString*) _category{
B4IViewWrapper* _v = nil;
 //BA.debugLineNum = 187;BA.debugLine="Sub NewProduct_receive(Res As List,category As Str";
 //BA.debugLineNum = 189;BA.debugLine="Library.NewProduct.Initialize";
[self._library._newproduct Initialize];
 //BA.debugLineNum = 190;BA.debugLine="Library.NewProduct = Res";
self._library._newproduct = _res;
 //BA.debugLineNum = 192;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"newp";
self._topsv = [self _addheader:[self._library _getstringresourse:@"newproduct"] :@"newproduct" :self._topsv];
 //BA.debugLineNum = 194;BA.debugLine="svhNewProduct.Initialize(0,sv1.Width,210dip)";
[self._svhnewproduct Initialize:self.bi :[self.bi NumberToString:@(0)] :(int) ([self._sv1 Width]) :[self.__c DipToCurrent:(int) (210)]];
 //BA.debugLineNum = 195;BA.debugLine="sv1.Panel.AddView(svhNewProduct,0,topSV,sv1.Width";
[[self._sv1 Panel] AddView:(UIView*)((self._svhnewproduct).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (210)])];
 //BA.debugLineNum = 196;BA.debugLine="topSV = topSV + LoadProductHorizontalScroll(Res,s";
self._topsv = (int) (self._topsv+[self _loadproducthorizontalscroll:_res :self._svhnewproduct]+[self.__c DipToCurrent:(int) (70)]);
 //BA.debugLineNum = 198;BA.debugLine="Dim v As View";
_v = [B4IViewWrapper new];
 //BA.debugLineNum = 199;BA.debugLine="v = svhNewProduct.Panel.GetView(0)";
_v = [[self._svhnewproduct Panel] GetView:(int) (0)];
 //BA.debugLineNum = 200;BA.debugLine="v.Top = 0";
[_v setTop:(float) (0)];
 //BA.debugLineNum = 202;BA.debugLine="FeatureProduct.GetSpecialProduct(\"featured\",False";
[self._featureproduct _getspecialproduct:@"featured" :[self.__c False] :[self._library _getlimitloaditem] :self :@"FeatureProduct_receive"];
 //BA.debugLineNum = 204;BA.debugLine="sv1.ScrollOffsetX = 0";
[self._sv1 setScrollOffsetX:(int) (0)];
 //BA.debugLineNum = 205;BA.debugLine="sv1.ContentHeight = topSV";
[self._sv1 setContentHeight:self._topsv];
 //BA.debugLineNum = 207;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnlover_click{
B4IPanelWrapper* _p1 = nil;
B4IMap* _temp = nil;
 //BA.debugLineNum = 643;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 645;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 646;BA.debugLine="p1 = Sender";
_p1.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 648;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 649;BA.debugLine="temp = p1.Tag";
_temp = (B4IMap*)([_p1 Tag]);
 //BA.debugLineNum = 651;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 652;BA.debugLine="actProduct.product = temp";
self._actproduct._product = _temp;
 //BA.debugLineNum = 653;BA.debugLine="actProduct.StartActivity";
[self._actproduct _startactivity];
 //BA.debugLineNum = 655;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnlover_longclick{
B4IPanelWrapper* _p1 = nil;
B4IPanelWrapper* _p2 = nil;
B4IMap* _temp = nil;
NSString* _sid = @"";
 //BA.debugLineNum = 657;BA.debugLine="Sub pnlover_LongClick";
 //BA.debugLineNum = 659;BA.debugLine="Dim p1,p2 As Panel";
_p1 = [B4IPanelWrapper new];
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 660;BA.debugLine="p1 = Sender";
_p1.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 662;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.object = (B4IPanelView*)(([self._library _getparent:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_p1).object)]]).object);
 //BA.debugLineNum = 663;BA.debugLine="p2.Visible = False";
[_p2 setVisible:[self.__c False]];
 //BA.debugLineNum = 664;BA.debugLine="p2.Visible = True";
[_p2 setVisible:[self.__c True]];
 //BA.debugLineNum = 666;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 667;BA.debugLine="temp = p1.Tag";
_temp = (B4IMap*)([_p1 Tag]);
 //BA.debugLineNum = 669;BA.debugLine="Dim sID As String";
_sid = @"";
 //BA.debugLineNum = 671;BA.debugLine="If temp.ContainsKey(\"id\") Then";
if ([_temp ContainsKey:(NSObject*)(@"id")]) { 
 //BA.debugLineNum = 672;BA.debugLine="sID = temp.Get(\"id\")";
_sid = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"id")]];
 }else {
 //BA.debugLineNum = 674;BA.debugLine="sID = temp.Get(\"product_id\")";
_sid = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"product_id")]];
 };
 //BA.debugLineNum = 677;BA.debugLine="Library.Add2Cart(sID,\"1\",Me)";
[self._library _add2cart:_sid :@"1" :self];
 //BA.debugLineNum = 679;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnloverheader_click{
B4IPanelWrapper* _pa = nil;
 //BA.debugLineNum = 681;BA.debugLine="Sub pnloverheader_Click";
 //BA.debugLineNum = 683;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 684;BA.debugLine="pa = Sender";
_pa.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 685;BA.debugLine="LoadProductSplit(pa.Tag)";
[self _loadproductsplit:[self.bi ObjectToString:[_pa Tag]]];
 //BA.debugLineNum = 687;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _process_globals{
self._main=[b4i_main new];
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
 //BA.debugLineNum = 1;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private TimerPush As Timer";
self._timerpush = [B4ITimer new];
 //BA.debugLineNum = 5;BA.debugLine="Dim slidepanel1 As ScrollView";
self._slidepanel1 = [B4IScrollView new];
 //BA.debugLineNum = 6;BA.debugLine="Private timerSlideshow As Timer";
self._timerslideshow = [B4ITimer new];
 //BA.debugLineNum = 7;BA.debugLine="Private isOffline As Boolean";
self._isoffline = false;
 //BA.debugLineNum = 8;BA.debugLine="Private svhNewProduct,svhFeatureProduct,svhBestPr";
self._svhnewproduct = [B4IScrollView new];
self._svhfeatureproduct = [B4IScrollView new];
self._svhbestproduct = [B4IScrollView new];
 //BA.debugLineNum = 9;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 10;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private btnbasket As Button";
self._btnbasket = [B4IButtonWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private lblheadername As Label";
self._lblheadername = [B4ILabelWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private lblnext As Label";
self._lblnext = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Dim FeatureProduct,NewProduct,BestProduct,Slidesh";
self._featureproduct = [b4i_opencart new];
self._newproduct = [b4i_opencart new];
self._bestproduct = [b4i_opencart new];
self._slideshow = [b4i_opencart new];
self._opmanufacturers = [b4i_opencart new];
 //BA.debugLineNum = 16;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private offsetSlideshow As Int = 0";
self._offsetslideshow = (int) (0);
 //BA.debugLineNum = 20;BA.debugLine="Private lblslidetitle As Label";
self._lblslidetitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private pnlheadert As Panel";
self._pnlheadert = [B4IPanelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private pnlheaderproduct As Panel";
self._pnlheaderproduct = [B4IPanelWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 27;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 29;BA.debugLine="Private pnlads As Panel";
self._pnlads = [B4IPanelWrapper new];
 //BA.debugLineNum = 31;BA.debugLine="Private pbslideshow As ProgressView";
self._pbslideshow = [B4IProgressWrapper new];
 //BA.debugLineNum = 32;BA.debugLine="Private pnloverheader As Panel";
self._pnloverheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="Private lblbasket As Label";
self._lblbasket = [B4ILabelWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="Private pnlcircle As Panel";
self._pnlcircle = [B4IPanelWrapper new];
 //BA.debugLineNum = 36;BA.debugLine="Private bullet As List";
self._bullet = [B4IList new];
 //BA.debugLineNum = 38;BA.debugLine="Dim svH As ScrollView";
self._svh = [B4IScrollView new];
 //BA.debugLineNum = 39;BA.debugLine="Dim MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 41;BA.debugLine="Private btnsearch As Button";
self._btnsearch = [B4IButtonWrapper new];
 //BA.debugLineNum = 42;BA.debugLine="Private btnmenu As Button";
self._btnmenu = [B4IButtonWrapper new];
 //BA.debugLineNum = 44;BA.debugLine="Dim btncat As Button";
self._btncat = [B4IButtonWrapper new];
 //BA.debugLineNum = 46;BA.debugLine="Dim topSV As Int";
self._topsv = 0;
 //BA.debugLineNum = 47;BA.debugLine="Dim sm As SlideMenu";
self._sm = [b4i_slidemenu new];
 //BA.debugLineNum = 49;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _rerunapp{
 //BA.debugLineNum = 856;BA.debugLine="Sub ReRunApp";
 //BA.debugLineNum = 857;BA.debugLine="Main.StartActivity";
[self._main _startactivity];
 //BA.debugLineNum = 858;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _resumeapp{
b4i_opencart* _opwish = nil;
 //BA.debugLineNum = 262;BA.debugLine="Sub ResumeApp";
 //BA.debugLineNum = 264;BA.debugLine="If timerSlideshow.IsInitialized Then";
if ([self._timerslideshow IsInitialized]) { 
 //BA.debugLineNum = 265;BA.debugLine="timerSlideshow.Enabled = True";
[self._timerslideshow setEnabled:[self.__c True]];
 };
 //BA.debugLineNum = 268;BA.debugLine="If Library.currLang.ToLowerCase <> Library.manage";
if ([[self._library._currlang ToLowerCase] isEqual:[[self._library._manager _getstring:@"lang"] ToLowerCase]] == false) { 
 //BA.debugLineNum = 270;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if ([self._library._logindetails IsInitialized]) { 
 //BA.debugLineNum = 271;BA.debugLine="Library.loginDetails.Put(\"login\",False)";
[self._library._logindetails Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c False]))];
 };
 //BA.debugLineNum = 274;BA.debugLine="File.Delete(File.DirLibrary,\"cache_category2\")";
[[self.__c File] Delete:[[self.__c File] DirLibrary] :@"cache_category2"];
 //BA.debugLineNum = 275;BA.debugLine="File.Delete(File.DirLibrary,\"cache_category_prod";
[[self.__c File] Delete:[[self.__c File] DirLibrary] :@"cache_category_product2"];
 //BA.debugLineNum = 276;BA.debugLine="File.Delete(File.DirLibrary,\"cache_string_file\")";
[[self.__c File] Delete:[[self.__c File] DirLibrary] :@"cache_string_file"];
 //BA.debugLineNum = 278;BA.debugLine="Library.NavControl.ShowPage(Library.MainPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._mainpage).object)];
 //BA.debugLineNum = 279;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 283;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 285;BA.debugLine="Dim opWish As OpenCart";
_opwish = [b4i_opencart new];
 //BA.debugLineNum = 286;BA.debugLine="opWish.Initialize";
[_opwish _initialize:self.bi];
 //BA.debugLineNum = 287;BA.debugLine="opWish.Wishlist(Me,\"WishList_receive\",\"\")";
[_opwish _wishlist:self :@"WishList_receive" :@""];
 //BA.debugLineNum = 289;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _showslidecontent:(B4IMap*) _data{
NSString* _link = @"";
B4IMatcher* _ma = nil;
B4IMap* _m1 = nil;
 //BA.debugLineNum = 550;BA.debugLine="Sub ShowSlideContent(data As Map)";
 //BA.debugLineNum = 552;BA.debugLine="Try";
@try { //BA.debugLineNum = 554;BA.debugLine="Dim link As String";
_link = @"";
 //BA.debugLineNum = 555;BA.debugLine="link = data.Get(\"link\")";
_link = [self.bi ObjectToString:[_data Get:(NSObject*)(@"link")]];
 //BA.debugLineNum = 556;BA.debugLine="link = link.Replace(\"&amp;\",\"&\")";
_link = [_link Replace:@"&amp;" :@"&"];
 //BA.debugLineNum = 558;BA.debugLine="Dim ma As Matcher";
_ma = [B4IMatcher new];
 //BA.debugLineNum = 559;BA.debugLine="ma = Regex.Matcher(\"product_id=(\\d+)\",link)";
_ma = [[self.__c Regex] Matcher:@"product_id=(\\d+)" :_link];
 //BA.debugLineNum = 561;BA.debugLine="If ma.Find Then";
if ([_ma Find]) { 
 //BA.debugLineNum = 562;BA.debugLine="link = ma.Group(1)";
_link = [_ma Group:(int) (1)];
 //BA.debugLineNum = 563;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 564;BA.debugLine="m1.Initialize";
[_m1 Initialize];
 //BA.debugLineNum = 565;BA.debugLine="m1.Put(\"product_id\",link)";
[_m1 Put:(NSObject*)(@"product_id") :(NSObject*)(_link)];
 //BA.debugLineNum = 566;BA.debugLine="actProduct.product = m1";
self._actproduct._product = _m1;
 //BA.debugLineNum = 567;BA.debugLine="actProduct.StartActivity";
[self._actproduct _startactivity];
 }else {
 //BA.debugLineNum = 570;BA.debugLine="Library.App.OpenURL(link)";
[self._library._app OpenURL:_link];
 };
 } 
       @catch (NSException* e18) {
			[B4I SetException:e18]; };
 //BA.debugLineNum = 576;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _slideshow_receive:(B4IList*) _res :(NSString*) _category{
 //BA.debugLineNum = 417;BA.debugLine="Sub slideshow_receive(res As List,category As Stri";
 //BA.debugLineNum = 419;BA.debugLine="Library.listSlideshow.Initialize";
[self._library._listslideshow Initialize];
 //BA.debugLineNum = 420;BA.debugLine="Library.imagesSlideshow.Initialize";
[self._library._imagesslideshow Initialize];
 //BA.debugLineNum = 421;BA.debugLine="Library.listSlideshow = res";
self._library._listslideshow = _res;
 //BA.debugLineNum = 422;BA.debugLine="bullet.Initialize";
[self._bullet Initialize];
 //BA.debugLineNum = 424;BA.debugLine="CacheData.AddProducts2Cache(res,\"slideshow\")";
[self._cachedata _addproducts2cache:_res :@"slideshow"];
 //BA.debugLineNum = 426;BA.debugLine="LoadSlideshow(res)";
[self _loadslideshow:_res];
 //BA.debugLineNum = 428;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _slideshowsv_scrollchanged:(int) _offsetx :(int) _offsety{
int _i = 0;
 //BA.debugLineNum = 608;BA.debugLine="Sub slideshowsv_ScrollChanged (OffsetX As Int, Off";
 //BA.debugLineNum = 610;BA.debugLine="Dim i As Int";
_i = 0;
 //BA.debugLineNum = 611;BA.debugLine="i = OffsetX / pnlads.Width";
_i = (int) (_offsetx/(double)[self._pnlads Width]);
 //BA.debugLineNum = 613;BA.debugLine="Try";
@try { //BA.debugLineNum = 614;BA.debugLine="ChooseBullet(i+1)";
[self _choosebullet:(int) (_i+1)];
 } 
       @catch (NSException* e6) {
			[B4I SetException:e6]; };
 //BA.debugLineNum = 618;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IPanelWrapper* _slide = nil;
B4IViewWrapper* _v = nil;
 //BA.debugLineNum = 51;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 53;BA.debugLine="Library.MenuPage.Initialize(\"MenuPage\")";
[self._library._menupage Initialize:self.bi :@"MenuPage"];
 //BA.debugLineNum = 55;BA.debugLine="TimerPush.Initialize(\"tmrPush\",9000)";
[self._timerpush Initialize:self.bi :@"tmrPush" :(long long) (9000)];
 //BA.debugLineNum = 56;BA.debugLine="TimerPush.Enabled = True";
[self._timerpush setEnabled:[self.__c True]];
 //BA.debugLineNum = 58;BA.debugLine="Library.AddTabbar(Library.MenuPage)";
[self._library _addtabbar:self._library._menupage];
 //BA.debugLineNum = 60;BA.debugLine="If Library.currLang = \"فارسی\" Then";
if ([self._library._currlang isEqual:@"فارسی"]) { 
 //BA.debugLineNum = 61;BA.debugLine="Library.MenuPage.RootPanel.LoadLayout(\"frmmenu\")";
[[self._library._menupage RootPanel] LoadLayout:@"frmmenu" :self.bi];
 }else {
 //BA.debugLineNum = 63;BA.debugLine="Library.MenuPage.RootPanel.LoadLayout(\"frmmenu_e";
[[self._library._menupage RootPanel] LoadLayout:@"frmmenu_en" :self.bi];
 };
 //BA.debugLineNum = 66;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 68;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 70;BA.debugLine="MyToastMessageShow1.Initialize(Library.MenuPage.R";
[self._mytoastmessageshow1 _initialize:self.bi :[self._library._menupage RootPanel]];
 //BA.debugLineNum = 72;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 73;BA.debugLine="Library.MenuPage.RootPanel.Color  = Library.Theme";
[[self._library._menupage RootPanel] setColor:self._library._theme_background];
 //BA.debugLineNum = 74;BA.debugLine="sv1.Panel.Color = Library.Theme_Background";
[[self._sv1 Panel] setColor:self._library._theme_background];
 //BA.debugLineNum = 75;BA.debugLine="Library.SetFont(btnmenu,\"icomoon\",btnmenu.CustomL";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnmenu).object)] :@"icomoon" :(int) ([[[self._btnmenu CustomLabel] Font] Size])];
 //BA.debugLineNum = 76;BA.debugLine="Library.SetFont(btnbasket,\"icomoon\",btnbasket.Cus";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnbasket).object)] :@"icomoon" :(int) ([[[self._btnbasket CustomLabel] Font] Size])];
 //BA.debugLineNum = 77;BA.debugLine="Library.SetFont(btnsearch,\"icomoon\",btnsearch.Cus";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnsearch).object)] :@"icomoon" :(int) ([[[self._btnsearch CustomLabel] Font] Size])];
 //BA.debugLineNum = 78;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 79;BA.debugLine="lbltitle.Text = \"\"";
[self._lbltitle setText:@""];
 //BA.debugLineNum = 80;BA.debugLine="topSV = 0";
self._topsv = (int) (0);
 //BA.debugLineNum = 83;BA.debugLine="Dim slide As Panel";
_slide = [B4IPanelWrapper new];
 //BA.debugLineNum = 84;BA.debugLine="slide.Initialize(\"\")";
[_slide Initialize:self.bi :@""];
 //BA.debugLineNum = 85;BA.debugLine="sv1.Panel.AddView(slide,0,0,sv1.Width,0)";
[[self._sv1 Panel] AddView:(UIView*)((_slide).object) :(float) (0) :(float) (0) :[self._sv1 Width] :(float) (0)];
 //BA.debugLineNum = 86;BA.debugLine="slide.LoadLayout(\"frmslideshow_panels\")";
[_slide LoadLayout:@"frmslideshow_panels" :self.bi];
 //BA.debugLineNum = 87;BA.debugLine="slide.Height = pnlads.Height + pnlcircle.Height";
[_slide setHeight:(float) ([self._pnlads Height]+[self._pnlcircle Height])];
 //BA.debugLineNum = 88;BA.debugLine="slide.Color = Colors.Transparent";
[_slide setColor:[[self.__c Colors] Transparent]];
 //BA.debugLineNum = 89;BA.debugLine="topSV = slide.Height + pnlcircle.Height - 10dip";
self._topsv = (int) ([_slide Height]+[self._pnlcircle Height]-[self.__c DipToCurrent:(int) (10)]);
 //BA.debugLineNum = 90;BA.debugLine="sv1.Panel.Height = topSV";
[[self._sv1 Panel] setHeight:(float) (self._topsv)];
 //BA.debugLineNum = 93;BA.debugLine="btncat.Initialize(\"btncat\",btncat.STYLE_SYSTEM)";
[self._btncat Initialize:@"btncat" :self.bi :[self._btncat STYLE_SYSTEM]];
 //BA.debugLineNum = 95;BA.debugLine="topSV = topSV + 5";
self._topsv = (int) (self._topsv+5);
 //BA.debugLineNum = 96;BA.debugLine="sv1.Panel.AddView(btncat,0,topSV,80%x,40dip)";
[[self._sv1 Panel] AddView:(UIView*)((self._btncat).object) :(float) (0) :(float) (self._topsv) :[self.__c PerXToCurrent:(float) (80)] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 98;BA.debugLine="btncat.Color = Library.ConvertHex2Int(Library.Get";
[self._btncat setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 99;BA.debugLine="btncat.Text = Library.GetStringResourse(\"category";
[self._btncat setText:[self._library _getstringresourse:@"category"]];
 //BA.debugLineNum = 100;BA.debugLine="btncat.CustomLabel.TextColor = Colors.White";
[[self._btncat CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 101;BA.debugLine="btncat.TintColor = Colors.White";
[self._btncat setTintColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 102;BA.debugLine="btncat.CustomLabel.Font = Library.GetFont(14)";
[[self._btncat CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 103;BA.debugLine="Library.CenterView(btncat,sv1)";
[self._library _centerview:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btncat).object)] :(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._sv1).object)]];
 //BA.debugLineNum = 105;BA.debugLine="topSV = topSV + 60dip";
self._topsv = (int) (self._topsv+[self.__c DipToCurrent:(int) (60)]);
 //BA.debugLineNum = 107;BA.debugLine="FeatureProduct.Initialize";
[self._featureproduct _initialize:self.bi];
 //BA.debugLineNum = 108;BA.debugLine="NewProduct.Initialize";
[self._newproduct _initialize:self.bi];
 //BA.debugLineNum = 109;BA.debugLine="BestProduct.Initialize";
[self._bestproduct _initialize:self.bi];
 //BA.debugLineNum = 110;BA.debugLine="Slideshow.Initialize";
[self._slideshow _initialize:self.bi];
 //BA.debugLineNum = 112;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 113;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"app_ti";
[self._lbltitle setText:[self._library _getstringresourse:@"app_title"]];
 //BA.debugLineNum = 117;BA.debugLine="If Library.listSlideshow.IsInitialized Then";
if ([self._library._listslideshow IsInitialized]) { 
 //BA.debugLineNum = 118;BA.debugLine="LoadSlideshow(Library.listSlideshow)";
[self _loadslideshow:self._library._listslideshow];
 }else {
 //BA.debugLineNum = 120;BA.debugLine="Slideshow.GetSlideshow(Me,\"slideshow_receive\")";
[self._slideshow _getslideshow:self :@"slideshow_receive"];
 };
 //BA.debugLineNum = 123;BA.debugLine="If Library.NewProduct.IsInitialized Then";
if ([self._library._newproduct IsInitialized]) { 
 //BA.debugLineNum = 124;BA.debugLine="isOffline = True";
self._isoffline = [self.__c True];
 //BA.debugLineNum = 125;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"new";
self._topsv = [self _addheader:[self._library _getstringresourse:@"newproduct"] :@"newproduct" :self._topsv];
 //BA.debugLineNum = 126;BA.debugLine="svhNewProduct.Initialize(0,sv1.Width,210dip)";
[self._svhnewproduct Initialize:self.bi :[self.bi NumberToString:@(0)] :(int) ([self._sv1 Width]) :[self.__c DipToCurrent:(int) (210)]];
 //BA.debugLineNum = 127;BA.debugLine="sv1.Panel.AddView(svhNewProduct,0,topSV,sv1.Widt";
[[self._sv1 Panel] AddView:(UIView*)((self._svhnewproduct).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (210)])];
 //BA.debugLineNum = 128;BA.debugLine="topSV = topSV + LoadProductHorizontalScroll(Libr";
self._topsv = (int) (self._topsv+[self _loadproducthorizontalscroll:self._library._newproduct :self._svhnewproduct]+[self.__c DipToCurrent:(int) (70)]);
 //BA.debugLineNum = 129;BA.debugLine="Dim v As View";
_v = [B4IViewWrapper new];
 //BA.debugLineNum = 130;BA.debugLine="v = svhNewProduct.Panel.GetView(0)";
_v = [[self._svhnewproduct Panel] GetView:(int) (0)];
 //BA.debugLineNum = 131;BA.debugLine="v.Top = 0";
[_v setTop:(float) (0)];
 }else {
 //BA.debugLineNum = 133;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 134;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 }else {
 //BA.debugLineNum = 136;BA.debugLine="NewProduct.GetSpecialProduct(\"latest\",True,Libr";
[self._newproduct _getspecialproduct:@"latest" :[self.__c True] :[self._library _getlimitloaditem] :self :@"NewProduct_receive"];
 };
 };
 //BA.debugLineNum = 140;BA.debugLine="If Library.FeatureProduct.IsInitialized Then";
if ([self._library._featureproduct IsInitialized]) { 
 //BA.debugLineNum = 141;BA.debugLine="If Library.FeatureProduct.Size > 0 Then";
if ([self._library._featureproduct Size]>0) { 
 //BA.debugLineNum = 142;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"fe";
self._topsv = [self _addheader:[self._library _getstringresourse:@"featureproduct"] :@"featureproduct" :self._topsv];
 //BA.debugLineNum = 143;BA.debugLine="svhFeatureProduct.Initialize(0,sv1.Width,210dip";
[self._svhfeatureproduct Initialize:self.bi :[self.bi NumberToString:@(0)] :(int) ([self._sv1 Width]) :[self.__c DipToCurrent:(int) (210)]];
 //BA.debugLineNum = 144;BA.debugLine="sv1.Panel.AddView(svhFeatureProduct,0,topSV,sv1";
[[self._sv1 Panel] AddView:(UIView*)((self._svhfeatureproduct).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (210)])];
 //BA.debugLineNum = 145;BA.debugLine="topSV = topSV + LoadProductHorizontalScroll(Lib";
self._topsv = (int) (self._topsv+[self _loadproducthorizontalscroll:self._library._featureproduct :self._svhfeatureproduct]+[self.__c DipToCurrent:(int) (70)]);
 //BA.debugLineNum = 147;BA.debugLine="Dim v As View";
_v = [B4IViewWrapper new];
 //BA.debugLineNum = 148;BA.debugLine="v = svhFeatureProduct.Panel.GetView(0)";
_v = [[self._svhfeatureproduct Panel] GetView:(int) (0)];
 //BA.debugLineNum = 149;BA.debugLine="If v.IsInitialized Then v.Top = 0";
if ([_v IsInitialized]) { 
[_v setTop:(float) (0)];};
 };
 };
 //BA.debugLineNum = 153;BA.debugLine="If Library.BestProduct.IsInitialized Then";
if ([self._library._bestproduct IsInitialized]) { 
 //BA.debugLineNum = 154;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height - 180dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]-[self.__c DipToCurrent:(int) (180)])];
 //BA.debugLineNum = 155;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"bes";
self._topsv = [self _addheader:[self._library _getstringresourse:@"bestproduct"] :@"bestproduct" :self._topsv];
 //BA.debugLineNum = 156;BA.debugLine="svhBestProduct.Initialize(0,sv1.Width,210dip)";
[self._svhbestproduct Initialize:self.bi :[self.bi NumberToString:@(0)] :(int) ([self._sv1 Width]) :[self.__c DipToCurrent:(int) (210)]];
 //BA.debugLineNum = 157;BA.debugLine="sv1.Panel.AddView(svhBestProduct,0,topSV,sv1.Wid";
[[self._sv1 Panel] AddView:(UIView*)((self._svhbestproduct).object) :(float) (0) :(float) (self._topsv) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (210)])];
 //BA.debugLineNum = 158;BA.debugLine="topSV = topSV + LoadProductHorizontalScroll(Libr";
self._topsv = (int) (self._topsv+[self _loadproducthorizontalscroll:self._library._bestproduct :self._svhbestproduct]+[self.__c DipToCurrent:(int) (70)]);
 //BA.debugLineNum = 159;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 180dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (180)])];
 //BA.debugLineNum = 160;BA.debugLine="sv1.ContentHeight = sv1.Panel.Height";
[self._sv1 setContentHeight:(int) ([[self._sv1 Panel] Height])];
 }else {
 //BA.debugLineNum = 165;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 100dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (100)])];
 //BA.debugLineNum = 166;BA.debugLine="sv1.ContentHeight = sv1.Panel.Height";
[self._sv1 setContentHeight:(int) ([[self._sv1 Panel] Height])];
 };
 //BA.debugLineNum = 169;BA.debugLine="opManufacturers.Initialize";
[self._opmanufacturers _initialize:self.bi];
 //BA.debugLineNum = 171;BA.debugLine="If Library.listManufacturers.IsInitialized Then";
if ([self._library._listmanufacturers IsInitialized]) { 
 //BA.debugLineNum = 172;BA.debugLine="LoadManufacturers(Library.listManufacturers)";
[self _loadmanufacturers:self._library._listmanufacturers];
 };
 //BA.debugLineNum = 177;BA.debugLine="If isOffline = True Then";
if (self._isoffline==[self.__c True]) { 
 //BA.debugLineNum = 178;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 };
 //BA.debugLineNum = 181;BA.debugLine="sm.Initialize(100dip,Me)";
[self._sm _initialize:self.bi :[self.__c DipToCurrent:(int) (100)] :self];
 //BA.debugLineNum = 183;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 185;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmrpush_tick{
b4i_httpjob* _hu = nil;
 //BA.debugLineNum = 1020;BA.debugLine="Sub tmrPush_Tick";
 //BA.debugLineNum = 1022;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 1023;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1026;BA.debugLine="Dim hu As HttpJob";
_hu = [b4i_httpjob new];
 //BA.debugLineNum = 1027;BA.debugLine="hu.Initialize(\"push\",Me)";
[_hu _initialize:self.bi :@"push" :self];
 //BA.debugLineNum = 1028;BA.debugLine="hu.Download(Library.GetStringResourse(\"url\") & \"/";
[_hu _download:[@[[self._library _getstringresourse:@"url"],@"/app/push/new_push.php"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1030;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmrslideshow_tick{
 //BA.debugLineNum = 511;BA.debugLine="Sub tmrSlideshow_Tick";
 //BA.debugLineNum = 513;BA.debugLine="If Library.imagesSlideshow.IsInitialized = False";
if ([self._library._imagesslideshow IsInitialized]==[self.__c False]) { 
if (true) return @"";};
 //BA.debugLineNum = 515;BA.debugLine="If offsetSlideshow = Library.imagesSlideshow.Size";
if (self._offsetslideshow==[self._library._imagesslideshow Size]) { 
 //BA.debugLineNum = 516;BA.debugLine="offsetSlideshow = 1";
self._offsetslideshow = (int) (1);
 //BA.debugLineNum = 517;BA.debugLine="slidepanel1.ScrollTo(0,slidepanel1.Top,True)";
[self._slidepanel1 ScrollTo:(int) (0) :(int) ([self._slidepanel1 Top]) :[self.__c True]];
 //BA.debugLineNum = 518;BA.debugLine="ChooseBullet(offsetSlideshow)";
[self _choosebullet:self._offsetslideshow];
 }else {
 //BA.debugLineNum = 520;BA.debugLine="slidepanel1.ScrollTo(pnlads.Width * offsetSlides";
[self._slidepanel1 ScrollTo:(int) ([self._pnlads Width]*self._offsetslideshow) :(int) ([self._slidepanel1 Top]) :[self.__c True]];
 //BA.debugLineNum = 521;BA.debugLine="offsetSlideshow = offsetSlideshow + 1";
self._offsetslideshow = (int) (self._offsetslideshow+1);
 //BA.debugLineNum = 522;BA.debugLine="ChooseBullet(offsetSlideshow)";
[self _choosebullet:self._offsetslideshow];
 };
 //BA.debugLineNum = 525;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _updateui{
b4i_opencart* _opwish = nil;
 //BA.debugLineNum = 970;BA.debugLine="Sub UpdateUI";
 //BA.debugLineNum = 972;BA.debugLine="If timerSlideshow.IsInitialized Then";
if ([self._timerslideshow IsInitialized]) { 
 //BA.debugLineNum = 973;BA.debugLine="timerSlideshow.Enabled = True";
[self._timerslideshow setEnabled:[self.__c True]];
 };
 //BA.debugLineNum = 976;BA.debugLine="ApplySettingChanges";
[self _applysettingchanges];
 //BA.debugLineNum = 978;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 980;BA.debugLine="Dim opWish As OpenCart";
_opwish = [b4i_opencart new];
 //BA.debugLineNum = 981;BA.debugLine="opWish.Initialize";
[_opwish _initialize:self.bi];
 //BA.debugLineNum = 982;BA.debugLine="opWish.Wishlist(Me,\"WishList_receive\",\"\")";
[_opwish _wishlist:self :@"WishList_receive" :@""];
 //BA.debugLineNum = 984;BA.debugLine="sm.AddHeader(True)";
[self._sm _addheader:[self.__c True]];
 //BA.debugLineNum = 986;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _wishlist_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _m1 = nil;
B4IList* _ls = nil;
 //BA.debugLineNum = 291;BA.debugLine="Sub WishList_receive(res As Map,cat As String)";
 //BA.debugLineNum = 293;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 294;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 295;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 296;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 297;BA.debugLine="m1 = res.Get(\"data\")";
_m1 = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 298;BA.debugLine="ls = m1.Get(\"products\")";
_ls.object = (NSArray*)([_m1 Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 299;BA.debugLine="Library.wishlist = Library.GetStringResourse(\"b";
self._library._wishlist = [@[[self._library _getstringresourse:@"bookmark"],([@[@" ( ",[self.__c SmartStringFormatter:@"" :(NSObject*)(@([_ls Size]))],@" )"] componentsJoinedByString:@""])] componentsJoinedByString:@""];
 };
 };
 //BA.debugLineNum = 303;BA.debugLine="End Sub";
return @"";
}
@end
