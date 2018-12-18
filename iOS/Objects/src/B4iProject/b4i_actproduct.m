
#import "b4i_actproduct.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
#import "b4i_actsearch.h"
#import "b4i_opencart.h"
#import "b4i_actregister.h"
#import "b4i_actaccount.h"
#import "b4i_actcontact.h"
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


@implementation b4i_actproduct 


+ (instancetype)new {
    static b4i_actproduct* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _add2cart_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _rs = nil;
NSString* _err = @"";
NSString* _v1 = @"";
NSString* _temp = @"";
 //BA.debugLineNum = 1133;BA.debugLine="Sub Add2Cart_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1135;BA.debugLine="Library.hud.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 1137;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 1139;BA.debugLine="Dim rs As Map";
_rs = [B4IMap new];
 //BA.debugLineNum = 1140;BA.debugLine="Dim err As String";
_err = @"";
 //BA.debugLineNum = 1142;BA.debugLine="rs = res.Get(\"error\")";
_rs = (B4IMap*)([_res Get:(NSObject*)(@"error")]);
 //BA.debugLineNum = 1144;BA.debugLine="If rs.ContainsKey(\"option\") Then";
if ([_rs ContainsKey:(NSObject*)(@"option")]) { 
 //BA.debugLineNum = 1145;BA.debugLine="Msgbox(Library.GetStringResourse(\"cannot_add_ca";
[self.__c Msgbox:[self._library _getstringresourse:@"cannot_add_cart"] :[self._library _getstringresourse:@"alert"]];
 //BA.debugLineNum = 1146;BA.debugLine="ShowOptionsPanel";
[self _showoptionspanel];
 //BA.debugLineNum = 1147;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1150;BA.debugLine="For Each v1 As String In rs.Values";
{
const id<B4IIterable> group11 = [_rs Values];
const int groupLen11 = group11.Size
;int index11 = 0;
;
for (; index11 < groupLen11;index11++){
_v1 = [self.bi ObjectToString:[group11 Get:index11]];
 //BA.debugLineNum = 1151;BA.debugLine="Dim temp As String";
_temp = @"";
 //BA.debugLineNum = 1152;BA.debugLine="temp = v1";
_temp = _v1;
 //BA.debugLineNum = 1153;BA.debugLine="temp = temp.Replace(\"{\",\"\").Replace(\"}\",\"\").Rep";
_temp = [[[_temp Replace:@"{" :@""] Replace:@"}" :@""] Replace:@"," :@""];
 //BA.debugLineNum = 1154;BA.debugLine="temp = Library.RegexReplace(\"\\d+=\",temp,CRLF)";
_temp = [self._library _regexreplace:@"\\d+=" :_temp :[self.__c CRLF]];
 //BA.debugLineNum = 1155;BA.debugLine="err = err & temp & CRLF";
_err = [@[_err,_temp,[self.__c CRLF]] componentsJoinedByString:@""];
 }
};
 //BA.debugLineNum = 1158;BA.debugLine="Msgbox(err,Library.GetStringResourse(\"alert\"))";
[self.__c Msgbox:_err :[self._library _getstringresourse:@"alert"]];
 //BA.debugLineNum = 1160;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1164;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 1165;BA.debugLine="sv1.ScrollOffsetY = 0";
[self._sv1 setScrollOffsetY:(int) (0)];
 //BA.debugLineNum = 1166;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"add2cart"] :(long long) (2) :[self.__c True]];
 };
 //BA.debugLineNum = 1169;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 1171;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _add2cart2_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _rs = nil;
 //BA.debugLineNum = 1750;BA.debugLine="Sub Add2Cart2_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1752;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 1754;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 1756;BA.debugLine="Dim rs As Map";
_rs = [B4IMap new];
 //BA.debugLineNum = 1758;BA.debugLine="rs = res.Get(\"error\")";
_rs = (B4IMap*)([_res Get:(NSObject*)(@"error")]);
 //BA.debugLineNum = 1760;BA.debugLine="If rs.ContainsKey(\"option\") Then";
if ([_rs ContainsKey:(NSObject*)(@"option")]) { 
 //BA.debugLineNum = 1761;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"cannot_add_cart"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 1762;BA.debugLine="product = CreateMap(\"product_id\":Library.Produc";
self._product = [self.__c createMap:@[(NSObject*)(@"product_id"),(NSObject*)(self._library._productchoosenid)]];
 //BA.debugLineNum = 1763;BA.debugLine="Library.ProductChoosenID = 0";
self._library._productchoosenid = [self.bi NumberToString:@(0)];
 //BA.debugLineNum = 1764;BA.debugLine="ShowOptionsPanel";
[self _showoptionspanel];
 //BA.debugLineNum = 1765;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 1770;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 1771;BA.debugLine="sv1.ScrollOffsetY = 0";
[self._sv1 setScrollOffsetY:(int) (0)];
 //BA.debugLineNum = 1772;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"add2cart"] :(long long) (2) :[self.__c True]];
 };
 //BA.debugLineNum = 1775;BA.debugLine="Library.ProductChoosenID = 0";
self._library._productchoosenid = [self.bi NumberToString:@(0)];
 //BA.debugLineNum = 1777;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addbullet:(int) _size{
int _left = 0;
int _c1 = 0;
int _i = 0;
B4IPanelWrapper* _p1 = nil;
 //BA.debugLineNum = 297;BA.debugLine="Sub AddBullet(size As Int)";
 //BA.debugLineNum = 299;BA.debugLine="Dim left As Int";
_left = 0;
 //BA.debugLineNum = 300;BA.debugLine="left = 0";
_left = (int) (0);
 //BA.debugLineNum = 302;BA.debugLine="If bullet.IsInitialized = False Then bullet.Initi";
if ([self._bullet IsInitialized]==[self.__c False]) { 
[self._bullet Initialize];};
 //BA.debugLineNum = 304;BA.debugLine="pnlcircle.RemoveAllViews";
[self._pnlcircle RemoveAllViews];
 //BA.debugLineNum = 306;BA.debugLine="Dim c1 As Int";
_c1 = 0;
 //BA.debugLineNum = 307;BA.debugLine="c1 = Colors.RGB(191,191,191)";
_c1 = [[self.__c Colors] RGB:(int) (191) :(int) (191) :(int) (191)];
 //BA.debugLineNum = 309;BA.debugLine="pnlcircle.Width = 0";
[self._pnlcircle setWidth:(float) (0)];
 //BA.debugLineNum = 311;BA.debugLine="For i = 1 To size";
{
const int step8 = 1;
const int limit8 = _size;
_i = (int) (1) ;
for (;(step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8) ;_i = ((int)(0 + _i + step8))  ) {
 //BA.debugLineNum = 312;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 313;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 314;BA.debugLine="pnlcircle.AddView(p1,left,pnlcircle.Height /2,10";
[self._pnlcircle AddView:(UIView*)((_p1).object) :(float) (_left) :(float) ([self._pnlcircle Height]/(double)2) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) ([self.__c DipToCurrent:(int) (10)])];
 //BA.debugLineNum = 315;BA.debugLine="p1.Color = c1";
[_p1 setColor:_c1];
 //BA.debugLineNum = 316;BA.debugLine="p1.SetBorder(0,c1,5)";
[_p1 SetBorder:(float) (0) :_c1 :(float) (5)];
 //BA.debugLineNum = 317;BA.debugLine="left = left + 14dip";
_left = (int) (_left+[self.__c DipToCurrent:(int) (14)]);
 //BA.debugLineNum = 318;BA.debugLine="p1.Tag = i";
[_p1 setTag:(NSObject*)(@(_i))];
 //BA.debugLineNum = 319;BA.debugLine="bullet.Add(p1)";
[self._bullet Add:(NSObject*)((_p1).object)];
 }
};
 //BA.debugLineNum = 322;BA.debugLine="pnlcircle.Width = (p1.Width + p1.Left) * size";
[self._pnlcircle setWidth:(float) (([_p1 Width]+[_p1 Left])*_size)];
 //BA.debugLineNum = 325;BA.debugLine="End Sub";
return @"";
}
- (int)  _addheader:(NSString*) _title :(NSString*) _tag :(int) _tops{
B4IPanelWrapper* _p1 = nil;
 //BA.debugLineNum = 998;BA.debugLine="Sub AddHeader(Title As String,Tag As String,Tops A";
 //BA.debugLineNum = 1000;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 1001;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 1002;BA.debugLine="sv1.Panel.AddView(p1,0,Tops,sv1.Width,0)";
[[self._sv1 Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (_tops) :[self._sv1 Width] :(float) (0)];
 //BA.debugLineNum = 1004;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 1005;BA.debugLine="p1.LoadLayout(\"frmheader_template\")";
[_p1 LoadLayout:@"frmheader_template" :self.bi];
 }else {
 //BA.debugLineNum = 1007;BA.debugLine="p1.LoadLayout(\"frmheader_template_en\")";
[_p1 LoadLayout:@"frmheader_template_en" :self.bi];
 };
 //BA.debugLineNum = 1010;BA.debugLine="lblheadername.Font = Library.GetFont(lblheadernam";
[self._lblheadername setFont:[self._library _getfont:(int) ([[self._lblheadername Font] Size])]];
 //BA.debugLineNum = 1011;BA.debugLine="Library.SetFont(lblnext,\"icomoon\",lblnext.Font.Si";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblnext).object)] :@"icomoon" :(int) ([[self._lblnext Font] Size])];
 //BA.debugLineNum = 1013;BA.debugLine="p1.Height = pnlheadert.Height";
[_p1 setHeight:[self._pnlheadert Height]];
 //BA.debugLineNum = 1014;BA.debugLine="lblheadername.Text = Title";
[self._lblheadername setText:_title];
 //BA.debugLineNum = 1015;BA.debugLine="pnloverheader.Tag = Tag";
[self._pnloverheader setTag:(NSObject*)(_tag)];
 //BA.debugLineNum = 1017;BA.debugLine="Tops = Tops + p1.Height + 4dip";
_tops = (int) (_tops+[_p1 Height]+[self.__c DipToCurrent:(int) (4)]);
 //BA.debugLineNum = 1019;BA.debugLine="pnlheaderproduct.Color = Library.Theme_Header";
[self._pnlheaderproduct setColor:self._library._theme_header];
 //BA.debugLineNum = 1020;BA.debugLine="pnlheaderproduct.SetBorder(1,Library.Theme_Header";
[self._pnlheaderproduct SetBorder:(float) (1) :self._library._theme_header :(float) ([self.__c DipToCurrent:(int) (16)])];
 //BA.debugLineNum = 1022;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[_p1 Height])];
 //BA.debugLineNum = 1024;BA.debugLine="Return Tops";
if (true) return _tops;
 //BA.debugLineNum = 1026;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _addproduct2panel:(B4IScrollView*) _scrollview1 :(int) _left :(B4IArray*) _dimension :(B4IMap*) _temp{
B4IPanelWrapper* _pa = nil;
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
 //BA.debugLineNum = 1962;BA.debugLine="Sub AddProduct2Panel(ScrollView1 As ScrollView, Le";
 //BA.debugLineNum = 1964;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 1965;BA.debugLine="pa.Initialize(\"\")";
[_pa Initialize:self.bi :@""];
 //BA.debugLineNum = 1966;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,0,Dimension(0)";
[[_scrollview1 Panel] AddView:(UIView*)((_pa).object) :(float) (_left) :(float) (0) :(float) (((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue) :(float) (0)];
 //BA.debugLineNum = 1967;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
[_pa LoadLayout:@"frmproduct_template" :self.bi];
 //BA.debugLineNum = 1968;BA.debugLine="pa.Height = Dimension(1)";
[_pa setHeight:(float) (((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 //BA.debugLineNum = 1971;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = [B4IImageViewWrapper new];
 //BA.debugLineNum = 1973;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = [B4ILabelWrapper new];
_labelprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 1974;BA.debugLine="Dim TempPanel As Panel";
_temppanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 1975;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = [B4IPanelWrapper new];
_parentpanel.object = (B4IPanelView*)(([_pa GetView:(int) (0)]).object);
 //BA.debugLineNum = 1978;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.object = (UIImageView*)(([_parentpanel GetView:(int) (4)]).object);
 //BA.debugLineNum = 1979;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.object = (UILabel*)(([_parentpanel GetView:(int) (1)]).object);
 //BA.debugLineNum = 1980;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.object = (UILabel*)(([_parentpanel GetView:(int) (2)]).object);
 //BA.debugLineNum = 1981;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.object = (B4IPanelView*)(([_parentpanel GetView:(int) (6)]).object);
 //BA.debugLineNum = 1982;BA.debugLine="TempLabel.Text = temp.Get(\"name\")";
[_templabel setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 1983;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
[_templabel setText:[[[_templabel Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 1985;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 1987;BA.debugLine="If temp.ContainsKey(\"price_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"price_formated")]) { 
 //BA.debugLineNum = 1988;BA.debugLine="price   = temp.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price_formated")]];
 }else {
 //BA.debugLineNum = 1990;BA.debugLine="price   = temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 };
 //BA.debugLineNum = 1993;BA.debugLine="If temp.ContainsKey(\"special_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"special_formated")]) { 
 //BA.debugLineNum = 1994;BA.debugLine="special = temp.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special_formated")]];
 }else if([_temp ContainsKey:(NSObject*)(@"special")]) { 
 //BA.debugLineNum = 1996;BA.debugLine="special = temp.Get(\"special\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special")]];
 };
 //BA.debugLineNum = 1999;BA.debugLine="If special = \"null\" Or special = \"false\" Or spec";
if ([_special isEqual:@"null"] || [_special isEqual:@"false"] || [_special isEqual:@"0"]) { 
_special = @"";};
 //BA.debugLineNum = 2001;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 2002;BA.debugLine="Library.SetFont(LabelPrice,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_labelprice).object)] :@"" :(int) (14)];
 //BA.debugLineNum = 2003;BA.debugLine="Library.SetFont(TempLabel,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_templabel).object)] :@"" :(int) (14)];
 };
 //BA.debugLineNum = 2006;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if ([_price Length]>0 && [_special Length]==0) { 
 //BA.debugLineNum = 2007;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 }else if([_special Length]>0) { 
 //BA.debugLineNum = 2009;BA.debugLine="Library.DiscountStyleLabel(price,special,LabelP";
[self._library _discountstylelabel:_price :_special :_labelprice];
 };
 //BA.debugLineNum = 2012;BA.debugLine="Dim PathImage As String";
_pathimage = @"";
 //BA.debugLineNum = 2014;BA.debugLine="If temp.ContainsKey(\"image\") Then";
if ([_temp ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 2015;BA.debugLine="PathImage = temp.Get(\"image\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"image")]];
 }else if([_temp ContainsKey:(NSObject*)(@"thumb")]) { 
 //BA.debugLineNum = 2017;BA.debugLine="PathImage = temp.Get(\"thumb\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 2020;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ([[_pathimage ToLowerCase] isEqual:@"null"] || [_pathimage Length]==0) { 
 //BA.debugLineNum = 2021;BA.debugLine="imgTemp.Bitmap = LoadBitmap(File.DirAssets,\"noi";
[_imgtemp setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"noimage.png"]];
 }else {
 //BA.debugLineNum = 2023;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 2024;BA.debugLine="img.Initialize";
[_img Initialize];
 //BA.debugLineNum = 2025;BA.debugLine="img.Put(imgTemp,PathImage)";
[_img Put:(NSObject*)((_imgtemp).object) :(NSObject*)(_pathimage)];
 //BA.debugLineNum = 2026;BA.debugLine="Dim imgdownloader As ImageDownloader";
_imgdownloader = [b4i_imagedownloader new];
 //BA.debugLineNum = 2027;BA.debugLine="imgdownloader.Initialize";
[_imgdownloader _initialize:self.bi];
 //BA.debugLineNum = 2028;BA.debugLine="imgdownloader.Download(img)";
[_imgdownloader _download:_img];
 };
 //BA.debugLineNum = 2031;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ([[_temppanel Tag] isEqual:(NSObject*)(@"over")]) { 
 //BA.debugLineNum = 2032;BA.debugLine="TempPanel.Tag = temp";
[_temppanel setTag:(NSObject*)(_temp)];
 }else if([[_temppanel Tag] isEqual:(NSObject*)(@"topbar")]) { 
 //BA.debugLineNum = 2034;BA.debugLine="TempPanel.Color = Library.Theme_Header";
[_temppanel setColor:self._library._theme_header];
 };
 //BA.debugLineNum = 2040;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _bookmark_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 1080;BA.debugLine="Sub Bookmark_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1081;BA.debugLine="Log(res)";
[self.__c Log:[self.bi ObjectToString:_res]];
 //BA.debugLineNum = 1082;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnadd_2_cart_click{
B4IButtonWrapper* _b1 = nil;
 //BA.debugLineNum = 1741;BA.debugLine="Sub btnadd_2_cart_Click";
 //BA.debugLineNum = 1743;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 1744;BA.debugLine="b1 = Sender";
_b1.object = (UIButton*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 1746;BA.debugLine="Library.Add2Cart(b1.Tag,\"1\",Me)";
[self._library _add2cart:[self.bi ObjectToString:[_b1 Tag]] :@"1" :self];
 //BA.debugLineNum = 1748;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnback_click{
 //BA.debugLineNum = 1929;BA.debugLine="Sub btnback_Click";
 //BA.debugLineNum = 1930;BA.debugLine="timerSlideshow.Enabled = False";
[self._timerslideshow setEnabled:[self.__c False]];
 //BA.debugLineNum = 1931;BA.debugLine="pnltimer.Visible = False";
[self._pnltimer setVisible:[self.__c False]];
 //BA.debugLineNum = 1932;BA.debugLine="pnltimer.Visible = False";
[self._pnltimer setVisible:[self.__c False]];
 //BA.debugLineNum = 1933;BA.debugLine="timerSpecial.Enabled = False";
[self._timerspecial setEnabled:[self.__c False]];
 //BA.debugLineNum = 1934;BA.debugLine="Library.NavControl.ShowPage(Library.RefererPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._refererpage).object)];
 //BA.debugLineNum = 1935;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnback_options_click{
 //BA.debugLineNum = 1583;BA.debugLine="Sub btnback_options_Click";
 //BA.debugLineNum = 1584;BA.debugLine="pnlOptions.SetLayoutAnimated(500,1,0,pnlOptions.H";
[self._pnloptions SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :[self._pnloptions Height] :[self._pnloptions Width] :[self._pnloptions Height]];
 //BA.debugLineNum = 1585;BA.debugLine="btnoptions.SetLayoutAnimated(800,1,btnoptions.Lef";
[self._btnoptions SetLayoutAnimated:(int) (800) :(float) (1) :[self._btnoptions Left] :(float) ([self._library _getheight]-[self._btnoptions Height]-[self.__c DipToCurrent:(int) (40)]) :[self._btnoptions Width] :[self._btnoptions Height]];
 //BA.debugLineNum = 1586;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnbackattr_click{
 //BA.debugLineNum = 1302;BA.debugLine="Sub btnbackattr_Click";
 //BA.debugLineNum = 1303;BA.debugLine="pnlAttribute.SetLayoutAnimated(500,1,0,pnlAttribu";
[self._pnlattribute SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :[self._pnlattribute Height] :[self._pnlattribute Width] :[self._pnlattribute Height]];
 //BA.debugLineNum = 1304;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnbackreviews_click{
 //BA.debugLineNum = 947;BA.debugLine="Sub btnbackreviews_Click";
 //BA.debugLineNum = 948;BA.debugLine="pnlReviews.SetLayoutAnimated(500,1,0,pnlReviews.H";
[self._pnlreviews SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :[self._pnlreviews Height] :[self._pnlreviews Width] :[self._pnlreviews Height]];
 //BA.debugLineNum = 949;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnbasket_click{
 //BA.debugLineNum = 1128;BA.debugLine="Sub btnbasket_Click";
 //BA.debugLineNum = 1129;BA.debugLine="Library.LastPage = Library.ProductPage";
self._library._lastpage = self._library._productpage;
 //BA.debugLineNum = 1130;BA.debugLine="actBasket.StartActivity";
[self._actbasket _startactivity];
 //BA.debugLineNum = 1131;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnbookmark_click{
b4i_opencart* _op = nil;
 //BA.debugLineNum = 1063;BA.debugLine="Sub btnbookmark_Click";
 //BA.debugLineNum = 1065;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 1066;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 1068;BA.debugLine="If Bookmark.Bookmarks(product) = True Then";
if ([self._bookmark _bookmarks:self._product]==[self.__c True]) { 
 //BA.debugLineNum = 1069;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"add_bookmark"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 1070;BA.debugLine="btnbookmark.CustomLabel.TextColor = Colors.Red";
[[self._btnbookmark CustomLabel] setTextColor:[[self.__c Colors] Red]];
 //BA.debugLineNum = 1071;BA.debugLine="op.Wishlist(Me,\"Bookmark_receive\",product.Get(\"i";
[_op _wishlist:self :@"Bookmark_receive" :[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]];
 }else {
 //BA.debugLineNum = 1073;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"remove_bookmark"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 1074;BA.debugLine="btnbookmark.CustomLabel.TextColor = Colors.RGB(1";
[[self._btnbookmark CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (145) :(int) (145) :(int) (145)]];
 //BA.debugLineNum = 1075;BA.debugLine="op.Wishlist(Me,\"Bookmark_receive\",\"-\" & product.";
[_op _wishlist:self :@"Bookmark_receive" :[@[@"-",[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""]];
 };
 //BA.debugLineNum = 1078;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncancel_date_click{
 //BA.debugLineNum = 2156;BA.debugLine="Sub btncancel_date_Click";
 //BA.debugLineNum = 2157;BA.debugLine="pnlcustomdialog.RemoveAllViews";
[self._pnlcustomdialog RemoveAllViews];
 //BA.debugLineNum = 2158;BA.debugLine="pnlcustomdialog.Visible = False";
[self._pnlcustomdialog setVisible:[self.__c False]];
 //BA.debugLineNum = 2159;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncancel_time_click{
 //BA.debugLineNum = 2258;BA.debugLine="Sub btncancel_time_Click";
 //BA.debugLineNum = 2260;BA.debugLine="pnlcustomdialog.RemoveAllViews";
[self._pnlcustomdialog RemoveAllViews];
 //BA.debugLineNum = 2261;BA.debugLine="pnlcustomdialog.Visible = False";
[self._pnlcustomdialog setVisible:[self.__c False]];
 //BA.debugLineNum = 2262;BA.debugLine="IsDateTime = False";
self._isdatetime = [self.__c False];
 //BA.debugLineNum = 2264;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncategory_click{
 //BA.debugLineNum = 1860;BA.debugLine="Sub btncategory_Click";
 //BA.debugLineNum = 1861;BA.debugLine="actCategory.StartActivity";
[self._actcategory _startactivity];
 //BA.debugLineNum = 1862;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_wb_click{
 //BA.debugLineNum = 2303;BA.debugLine="Sub btnclose_wb_Click";
 //BA.debugLineNum = 2304;BA.debugLine="pnlwb.Visible = False";
[self._pnlwb setVisible:[self.__c False]];
 //BA.debugLineNum = 2305;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnmore_click{
NSString* _style = @"";
NSString* _ks = @"";
 //BA.debugLineNum = 2284;BA.debugLine="Sub btnmore_Click";
 //BA.debugLineNum = 2286;BA.debugLine="Dim style As String";
_style = @"";
 //BA.debugLineNum = 2287;BA.debugLine="style = \"<style>body {text-align:justify;line-hei";
_style = @"<style>body {text-align:justify;line-height:25px;";
 //BA.debugLineNum = 2289;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 2290;BA.debugLine="style = style & \"direction:rtl;}</style>\"";
_style = [@[_style,@"direction:rtl;}</style>"] componentsJoinedByString:@""];
 }else {
 //BA.debugLineNum = 2292;BA.debugLine="style = style & \"direction:ltr;}</style>\"";
_style = [@[_style,@"direction:ltr;}</style>"] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 2295;BA.debugLine="Dim ks As String";
_ks = @"";
 //BA.debugLineNum = 2296;BA.debugLine="ks = product.Get(\"description\")";
_ks = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"description")]];
 //BA.debugLineNum = 2297;BA.debugLine="wballdesc.LoadHtml(style & ks)";
[self._wballdesc LoadHtml:[@[_style,_ks] componentsJoinedByString:@""]];
 //BA.debugLineNum = 2299;BA.debugLine="pnlwb.Visible = True";
[self._pnlwb setVisible:[self.__c True]];
 //BA.debugLineNum = 2301;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnok_date_click{
 //BA.debugLineNum = 2161;BA.debugLine="Sub btnok_date_Click";
 //BA.debugLineNum = 2163;BA.debugLine="btncancel_date_Click";
[self _btncancel_date_click];
 //BA.debugLineNum = 2164;BA.debugLine="currentTextField.Text = $\"${txtyear.GetSelectedIt";
[self._currenttextfield setText:([@[@"",[self.__c SmartStringFormatter:@"" :[self._txtyear GetSelectedItem:(int) (0)]],@"/",[self.__c SmartStringFormatter:@"" :[self._txtmonth GetSelectedItem:(int) (0)]],@"/",[self.__c SmartStringFormatter:@"" :[self._txtday GetSelectedItem:(int) (0)]],@""] componentsJoinedByString:@""])];
 //BA.debugLineNum = 2166;BA.debugLine="If IsDateTime Then";
if (self._isdatetime) { 
 //BA.debugLineNum = 2167;BA.debugLine="MakeTimeDialog(0,0,0)";
[self _maketimedialog:[self.bi NumberToString:@(0)] :[self.bi NumberToString:@(0)] :[self.bi NumberToString:@(0)]];
 };
 //BA.debugLineNum = 2170;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnok_time_click{
 //BA.debugLineNum = 2266;BA.debugLine="Sub btnok_time_Click";
 //BA.debugLineNum = 2268;BA.debugLine="btncancel_date_Click";
[self _btncancel_date_click];
 //BA.debugLineNum = 2270;BA.debugLine="If IsDateTime Then";
if (self._isdatetime) { 
 //BA.debugLineNum = 2271;BA.debugLine="currentTextField.Text = currentTextField.Text &";
[self._currenttextfield setText:[@[[self._currenttextfield Text],@" ",([@[@"",[self.__c SmartStringFormatter:@"" :[self._txthour GetSelectedItem:(int) (0)]],@":",[self.__c SmartStringFormatter:@"" :[self._txtminute GetSelectedItem:(int) (0)]],@":",[self.__c SmartStringFormatter:@"" :[self._txtsecond GetSelectedItem:(int) (0)]],@""] componentsJoinedByString:@""])] componentsJoinedByString:@""]];
 }else {
 //BA.debugLineNum = 2273;BA.debugLine="currentTextField.Text = $\"${txthour.GetSelectedI";
[self._currenttextfield setText:([@[@"",[self.__c SmartStringFormatter:@"" :[self._txthour GetSelectedItem:(int) (0)]],@":",[self.__c SmartStringFormatter:@"" :[self._txtminute GetSelectedItem:(int) (0)]],@":",[self.__c SmartStringFormatter:@"" :[self._txtsecond GetSelectedItem:(int) (0)]],@""] componentsJoinedByString:@""])];
 };
 //BA.debugLineNum = 2276;BA.debugLine="IsDateTime = False";
self._isdatetime = [self.__c False];
 //BA.debugLineNum = 2278;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnoptions_click{
 //BA.debugLineNum = 2280;BA.debugLine="Sub btnoptions_Click";
 //BA.debugLineNum = 2281;BA.debugLine="ShowOptionsPanel";
[self _showoptionspanel];
 //BA.debugLineNum = 2282;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnqr_click{
B4IImageViewWrapper* _im = nil;
B4INativeObject* _nativeme = nil;
 //BA.debugLineNum = 1864;BA.debugLine="Sub btnqr_Click";
 //BA.debugLineNum = 1866;BA.debugLine="If pnlQR.IsInitialized = False Then";
if ([self._pnlqr IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 1868;BA.debugLine="pnlQR.Initialize(\"pnlqr\")";
[self._pnlqr Initialize:self.bi :@"pnlqr"];
 //BA.debugLineNum = 1869;BA.debugLine="pnlQR.Color = Colors.ARGB(210,72,72,72)";
[self._pnlqr setColor:[[self.__c Colors] ARGB:(int) (210) :(int) (72) :(int) (72) :(int) (72)]];
 //BA.debugLineNum = 1870;BA.debugLine="Library.ProductPage.RootPanel.AddView(pnlQR,0,0,";
[[self._library._productpage RootPanel] AddView:(UIView*)((self._pnlqr).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getheight])];
 //BA.debugLineNum = 1871;BA.debugLine="pnlQR.Visible = False";
[self._pnlqr setVisible:[self.__c False]];
 //BA.debugLineNum = 1873;BA.debugLine="Dim im As ImageView";
_im = [B4IImageViewWrapper new];
 //BA.debugLineNum = 1874;BA.debugLine="im.Initialize(\"\")";
[_im Initialize:self.bi :@""];
 //BA.debugLineNum = 1875;BA.debugLine="pnlQR.AddView(im,0,0,250,250)";
[self._pnlqr AddView:(UIView*)((_im).object) :(float) (0) :(float) (0) :(float) (250) :(float) (250)];
 //BA.debugLineNum = 1876;BA.debugLine="im.ContentMode = im.MODE_FILL";
[_im setContentMode:[_im MODE_FILL]];
 //BA.debugLineNum = 1877;BA.debugLine="Library.CenterView2(im,pnlQR)";
[self._library _centerview2:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_im).object)] :(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._pnlqr).object)]];
 //BA.debugLineNum = 1879;BA.debugLine="Dim NativeMe As NativeObject = Me";
_nativeme = [B4INativeObject new];
_nativeme.object = (NSObject*)(self);
 //BA.debugLineNum = 1880;BA.debugLine="NativeMe.RunMethod(\"createQRForString::\", Array (";
[_nativeme RunMethod:@"createQRForString::" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)([@[[self._library _getstringresourse:@"url"],@"/index.php?route=product/product&product_id=",[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""])],[B4I nilToNSNull:(NSObject*)((_im).object)]]]];
 //BA.debugLineNum = 1907;BA.debugLine="pnlQR.Visible = True";
[self._pnlqr setVisible:[self.__c True]];
 //BA.debugLineNum = 1909;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1913;BA.debugLine="If pnlQR.Visible = False Then";
if ([self._pnlqr Visible]==[self.__c False]) { 
 //BA.debugLineNum = 1914;BA.debugLine="pnlQR.Visible = True";
[self._pnlqr setVisible:[self.__c True]];
 }else {
 //BA.debugLineNum = 1916;BA.debugLine="pnlQR.Visible = False";
[self._pnlqr setVisible:[self.__c False]];
 };
 //BA.debugLineNum = 1919;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnreview_click{
 //BA.debugLineNum = 924;BA.debugLine="Sub btnreview_Click";
 //BA.debugLineNum = 925;BA.debugLine="btnbackreviews_Click";
[self _btnbackreviews_click];
 //BA.debugLineNum = 926;BA.debugLine="Library.LastPage = Library.ProductPage";
self._library._lastpage = self._library._productpage;
 //BA.debugLineNum = 927;BA.debugLine="actReview.id = product.Get(\"id\")";
self._actreview._id = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]];
 //BA.debugLineNum = 928;BA.debugLine="Library.LastPage = Library.ProductPage";
self._library._lastpage = self._library._productpage;
 //BA.debugLineNum = 929;BA.debugLine="actReview.StartActivity";
[self._actreview _startactivity];
 //BA.debugLineNum = 930;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnreviews_click{
 //BA.debugLineNum = 932;BA.debugLine="Sub btnreviews_Click";
 //BA.debugLineNum = 934;BA.debugLine="If svReviews.Panel.NumberOfViews = 0 Then";
if ([[self._svreviews Panel] NumberOfViews]==0) { 
 //BA.debugLineNum = 935;BA.debugLine="LoadReviews";
[self _loadreviews];
 };
 //BA.debugLineNum = 938;BA.debugLine="If svReviews.Panel.NumberOfViews = 0 Then Return";
if ([[self._svreviews Panel] NumberOfViews]==0) { 
if (true) return @"";};
 //BA.debugLineNum = 940;BA.debugLine="pnlReviews.top = pnlReviews.Height";
[self._pnlreviews setTop:[self._pnlreviews Height]];
 //BA.debugLineNum = 941;BA.debugLine="pnlReviews.Visible = True";
[self._pnlreviews setVisible:[self.__c True]];
 //BA.debugLineNum = 942;BA.debugLine="pnlReviews.SetLayoutAnimated(500,1,0,0,pnlReviews";
[self._pnlreviews SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :(float) (0) :[self._pnlreviews Width] :[self._pnlreviews Height]];
 //BA.debugLineNum = 943;BA.debugLine="pnlReviews.BringToFront";
[self._pnlreviews BringToFront];
 //BA.debugLineNum = 945;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsearch_click{
 //BA.debugLineNum = 1779;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 1780;BA.debugLine="Library.LastPage = Library.ProductPage";
self._library._lastpage = self._library._productpage;
 //BA.debugLineNum = 1781;BA.debugLine="actSearch.StartActivity";
[self._actsearch _startactivity];
 //BA.debugLineNum = 1782;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnshare_click{
NSString* _link = @"";
 //BA.debugLineNum = 1084;BA.debugLine="Sub btnshare_Click";
 //BA.debugLineNum = 1086;BA.debugLine="Dim link As String";
_link = @"";
 //BA.debugLineNum = 1087;BA.debugLine="link = details.GetURL & \"/index.php?route=product";
_link = [@[[self._details _geturl],@"/index.php?route=product/product&product_id=",[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""];
 //BA.debugLineNum = 1088;BA.debugLine="modShare.ShareToSocialMedia(Library.MenuPage, Lib";
[self._modshare _sharetosocialmedia:self._library._menupage :[self._library _getstringresourse:@"share"] :_link :(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)([self.__c Sender:self.bi])]];
 //BA.debugLineNum = 1090;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _carts_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 1179;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1180;BA.debugLine="Library.CartDetails = res";
self._library._cartdetails = _res;
 //BA.debugLineNum = 1181;BA.debugLine="Library.ShowCartLabel(lblbasket)";
[self._library _showcartlabel:self._lblbasket];
 //BA.debugLineNum = 1182;BA.debugLine="lblbasket.Font = Font.CreateNew(10)";
[self._lblbasket setFont:[[self.__c Font] CreateNew:(float) (10)]];
 //BA.debugLineNum = 1183;BA.debugLine="btnbasket.CustomLabel.TextColor = Colors.Red";
[[self._btnbasket CustomLabel] setTextColor:[[self.__c Colors] Red]];
 //BA.debugLineNum = 1184;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _choosebullet:(int) _i{
int _c1 = 0;
int _c2 = 0;
B4IViewWrapper* _v1 = nil;
B4IPanelWrapper* _p2 = nil;
 //BA.debugLineNum = 339;BA.debugLine="Sub ChooseBullet(i As Int)";
 //BA.debugLineNum = 343;BA.debugLine="Dim c1,c2 As Int";
_c1 = 0;
_c2 = 0;
 //BA.debugLineNum = 344;BA.debugLine="c1 = Colors.RGB(66,66,66)";
_c1 = [[self.__c Colors] RGB:(int) (66) :(int) (66) :(int) (66)];
 //BA.debugLineNum = 345;BA.debugLine="c2 = Colors.RGB(191,191,191)";
_c2 = [[self.__c Colors] RGB:(int) (191) :(int) (191) :(int) (191)];
 //BA.debugLineNum = 347;BA.debugLine="For Each v1 As View In pnlcircle.GetAllViewsRecur";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group4 = [self._pnlcircle GetAllViewsRecursive];
const int groupLen4 = group4.Size
;int index4 = 0;
;
for (; index4 < groupLen4;index4++){
_v1.object = (UIView*)([group4 Get:index4]);
 //BA.debugLineNum = 348;BA.debugLine="Dim p2 As Panel";
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 349;BA.debugLine="p2 = v1";
_p2.object = (B4IPanelView*)((_v1).object);
 //BA.debugLineNum = 350;BA.debugLine="p2.Color = c2";
[_p2 setColor:_c2];
 //BA.debugLineNum = 351;BA.debugLine="p2.SetBorder(0,c2,5)";
[_p2 SetBorder:(float) (0) :_c2 :(float) (5)];
 //BA.debugLineNum = 353;BA.debugLine="If p2.Tag = i Then";
if ([[_p2 Tag] isEqual:(NSObject*)(@(_i))]) { 
 //BA.debugLineNum = 354;BA.debugLine="p2.Color = c1";
[_p2 setColor:_c1];
 //BA.debugLineNum = 355;BA.debugLine="p2.SetBorder(0,c1,5)";
[_p2 SetBorder:(float) (0) :_c1 :(float) (5)];
 };
 }
};
 //BA.debugLineNum = 360;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _details_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 327;BA.debugLine="Sub Details_receive(res As Map,cat As String)";
 //BA.debugLineNum = 329;BA.debugLine="If res.IsInitialized Then";
if ([_res IsInitialized]) { 
 //BA.debugLineNum = 330;BA.debugLine="product = res";
self._product = _res;
 //BA.debugLineNum = 331;BA.debugLine="CacheData.AddProductDescription2Cache(res)";
[self._cachedata _addproductdescription2cache:_res];
 //BA.debugLineNum = 332;BA.debugLine="LoadItem";
[self _loaditem];
 };
 //BA.debugLineNum = 335;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 337;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _endtimerspecial{
 //BA.debugLineNum = 773;BA.debugLine="Sub EndTimerSpecial";
 //BA.debugLineNum = 774;BA.debugLine="timerSpecial.Enabled = False";
[self._timerspecial setEnabled:[self.__c False]];
 //BA.debugLineNum = 775;BA.debugLine="pnlprice.top = pnltimer.top - pnltimer.Height";
[self._pnlprice setTop:(float) ([self._pnltimer Top]-[self._pnltimer Height])];
 //BA.debugLineNum = 776;BA.debugLine="pnltimer.Visible = False";
[self._pnltimer setVisible:[self.__c False]];
 //BA.debugLineNum = 777;BA.debugLine="pnl2.top = pnlprice.top - pnlprice.Height";
[self._pnl2 setTop:(float) ([self._pnlprice Top]-[self._pnlprice Height])];
 //BA.debugLineNum = 778;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _finishme{
 //BA.debugLineNum = 1925;BA.debugLine="Sub FinishMe";
 //BA.debugLineNum = 1926;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 1927;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getcart{
b4i_opencart* _cart = nil;
 //BA.debugLineNum = 1173;BA.debugLine="Sub GetCart";
 //BA.debugLineNum = 1174;BA.debugLine="Dim cart As OpenCart";
_cart = [b4i_opencart new];
 //BA.debugLineNum = 1175;BA.debugLine="cart.Initialize";
[_cart _initialize:self.bi];
 //BA.debugLineNum = 1176;BA.debugLine="cart.GetCarts(Me,\"Carts_receive\")";
[_cart _getcarts:self :@"Carts_receive"];
 //BA.debugLineNum = 1177;BA.debugLine="End Sub";
return @"";
}
- (B4IMap*)  _getcartoptions{
B4IMap* _options = nil;
B4IMap* _vals = nil;
int _i = 0;
B4IViewWrapper* _v1 = nil;
B4IMap* _data = nil;
B4ITextFieldWrapper* _txt1 = nil;
B4ISwitchWrapper* _rb1 = nil;
B4IPickerWrapper* _sp1 = nil;
B4IList* _l1 = nil;
NSString* _choosen = @"";
int _t = 0;
B4IMap* _tempchoose = nil;
NSString* _price_format = @"";
B4ISwitchWrapper* _chk1 = nil;
NSString* _vv = @"";
NSString* _te = @"";
B4IArray* _s1 = nil;
B4IList* _valid_val = nil;
int _o = 0;
 //BA.debugLineNum = 1588;BA.debugLine="Sub GetCartOptions As Map";
 //BA.debugLineNum = 1590;BA.debugLine="Dim Options,vals As Map";
_options = [B4IMap new];
_vals = [B4IMap new];
 //BA.debugLineNum = 1591;BA.debugLine="Options.Initialize";
[_options Initialize];
 //BA.debugLineNum = 1592;BA.debugLine="vals.Initialize";
[_vals Initialize];
 //BA.debugLineNum = 1594;BA.debugLine="For i = 0 To ListOptions.Size - 1";
{
const int step4 = 1;
const int limit4 = (int) ([self._listoptions Size]-1);
_i = (int) (0) ;
for (;(step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4) ;_i = ((int)(0 + _i + step4))  ) {
 //BA.debugLineNum = 1596;BA.debugLine="Dim v1 As View";
_v1 = [B4IViewWrapper new];
 //BA.debugLineNum = 1597;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 1598;BA.debugLine="v1 = ListOptions.Get(i)";
_v1.object = (UIView*)([self._listoptions Get:_i]);
 //BA.debugLineNum = 1599;BA.debugLine="data = v1.Tag";
_data = (B4IMap*)([_v1 Tag]);
 //BA.debugLineNum = 1602;BA.debugLine="If v1 Is TextField Then";
if ([_v1.objectOrNull isKindOfClass: [UITextField class]]) { 
 //BA.debugLineNum = 1603;BA.debugLine="Dim txt1 As TextField";
_txt1 = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 1604;BA.debugLine="txt1 = v1";
_txt1.object = (UITextField*)((_v1).object);
 //BA.debugLineNum = 1605;BA.debugLine="vals.Put(data.Get(\"ID\"),txt1.Text)";
[_vals Put:[_data Get:(NSObject*)(@"ID")] :(NSObject*)([_txt1 Text])];
 }else if([_v1.objectOrNull isKindOfClass: [UISwitch class]]) { 
 //BA.debugLineNum = 1610;BA.debugLine="Dim rb1 As Switch";
_rb1 = [B4ISwitchWrapper new];
 //BA.debugLineNum = 1611;BA.debugLine="rb1 = v1";
_rb1.object = (UISwitch*)((_v1).object);
 //BA.debugLineNum = 1613;BA.debugLine="If rb1.Value = True Then";
if ([_rb1 Value]==[self.__c True]) { 
 //BA.debugLineNum = 1614;BA.debugLine="vals.Put(data.Get(\"ID\"),data.Get(\"Val\"))";
[_vals Put:[_data Get:(NSObject*)(@"ID")] :[_data Get:(NSObject*)(@"Val")]];
 };
 }else if([_v1.objectOrNull isKindOfClass: [UIPickerView class]]) { 
 //BA.debugLineNum = 1620;BA.debugLine="Dim sp1 As Picker";
_sp1 = [B4IPickerWrapper new];
 //BA.debugLineNum = 1621;BA.debugLine="sp1 = v1";
_sp1.object = (UIPickerView*)((_v1).object);
 //BA.debugLineNum = 1623;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 1624;BA.debugLine="l1 = data.Get(\"Vals\")";
_l1.object = (NSArray*)([_data Get:(NSObject*)(@"Vals")]);
 //BA.debugLineNum = 1626;BA.debugLine="Dim choosen As String";
_choosen = @"";
 //BA.debugLineNum = 1627;BA.debugLine="choosen = sp1.GetSelectedItem(0)";
_choosen = [self.bi ObjectToString:[_sp1 GetSelectedItem:(int) (0)]];
 //BA.debugLineNum = 1629;BA.debugLine="For t = 0 To l1.Size - 1";
{
const int step26 = 1;
const int limit26 = (int) ([_l1 Size]-1);
_t = (int) (0) ;
for (;(step26 > 0 && _t <= limit26) || (step26 < 0 && _t >= limit26) ;_t = ((int)(0 + _t + step26))  ) {
 //BA.debugLineNum = 1630;BA.debugLine="Dim tempChoose As Map";
_tempchoose = [B4IMap new];
 //BA.debugLineNum = 1631;BA.debugLine="tempChoose = l1.Get(t)";
_tempchoose = (B4IMap*)([_l1 Get:_t]);
 //BA.debugLineNum = 1633;BA.debugLine="Dim price_format As String";
_price_format = @"";
 //BA.debugLineNum = 1634;BA.debugLine="price_format = tempChoose.Get(\"price_formated\"";
_price_format = [self.bi ObjectToString:[_tempchoose Get:(NSObject*)(@"price_formated")]];
 //BA.debugLineNum = 1635;BA.debugLine="If price_format = \"false\" Then price_format =";
if ([_price_format isEqual:@"false"]) { 
_price_format = @" )";};
 //BA.debugLineNum = 1637;BA.debugLine="If tempChoose.Get(\"name\") & \" ( \" & tempChoose";
if ([[@[[self.bi ObjectToString:[_tempchoose Get:(NSObject*)(@"name")]],@" ( ",[self.bi ObjectToString:[_tempchoose Get:(NSObject*)(@"price_prefix")]],_price_format] componentsJoinedByString:@""] isEqual:_choosen] || [_choosen IndexOf:[self.bi ObjectToString:[_tempchoose Get:(NSObject*)(@"name")]]]>-1) { 
 //BA.debugLineNum = 1638;BA.debugLine="vals.Put(data.Get(\"id\"),tempChoose.Get(\"produ";
[_vals Put:[_data Get:(NSObject*)(@"id")] :[_tempchoose Get:(NSObject*)(@"product_option_value_id")]];
 //BA.debugLineNum = 1639;BA.debugLine="Continue";
if (true) continue;
 };
 }
};
 }else if([_v1.objectOrNull isKindOfClass: [UISwitch class]]) { 
 //BA.debugLineNum = 1648;BA.debugLine="Dim chk1 As Switch";
_chk1 = [B4ISwitchWrapper new];
 //BA.debugLineNum = 1649;BA.debugLine="chk1 = v1";
_chk1.object = (UISwitch*)((_v1).object);
 //BA.debugLineNum = 1651;BA.debugLine="If chk1.Value = True Then";
if ([_chk1 Value]==[self.__c True]) { 
 //BA.debugLineNum = 1652;BA.debugLine="If vals.ContainsKey(data.Get(\"ID\")) Then";
if ([_vals ContainsKey:[_data Get:(NSObject*)(@"ID")]]) { 
 //BA.debugLineNum = 1653;BA.debugLine="vals.Put(data.Get(\"ID\"),vals.Get(data.Get(\"ID";
[_vals Put:[_data Get:(NSObject*)(@"ID")] :(NSObject*)([@[[self.bi ObjectToString:[_vals Get:[_data Get:(NSObject*)(@"ID")]]],@"<!>",[self.bi ObjectToString:[_data Get:(NSObject*)(@"Val")]]] componentsJoinedByString:@""])];
 }else {
 //BA.debugLineNum = 1655;BA.debugLine="vals.Put(data.Get(\"ID\"),data.Get(\"Val\"))";
[_vals Put:[_data Get:(NSObject*)(@"ID")] :[_data Get:(NSObject*)(@"Val")]];
 };
 };
 };
 }
};
 //BA.debugLineNum = 1663;BA.debugLine="For Each vv As String In vals.Keys";
{
const id<B4IIterable> group49 = [_vals Keys];
const int groupLen49 = group49.Size
;int index49 = 0;
;
for (; index49 < groupLen49;index49++){
_vv = [self.bi ObjectToString:[group49 Get:index49]];
 //BA.debugLineNum = 1664;BA.debugLine="Dim te As String";
_te = @"";
 //BA.debugLineNum = 1665;BA.debugLine="te = vv";
_te = _vv;
 //BA.debugLineNum = 1666;BA.debugLine="If te.IndexOf(\"<!>\") > -1 Then";
if ([_te IndexOf:@"<!>"]>-1) { 
 //BA.debugLineNum = 1667;BA.debugLine="Dim s1() As String";
_s1 = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
 //BA.debugLineNum = 1668;BA.debugLine="s1 = Regex.Split(\"<!>\",te)";
_s1 = [[self.__c Regex] Split:@"<!>" :_te];
 //BA.debugLineNum = 1670;BA.debugLine="Dim valid_val As List";
_valid_val = [B4IList new];
 //BA.debugLineNum = 1671;BA.debugLine="valid_val.Initialize";
[_valid_val Initialize];
 //BA.debugLineNum = 1673;BA.debugLine="For o = 0 To s1.Length - 1";
{
const int step57 = 1;
const int limit57 = (int) (_s1.Length-1);
_o = (int) (0) ;
for (;(step57 > 0 && _o <= limit57) || (step57 < 0 && _o >= limit57) ;_o = ((int)(0 + _o + step57))  ) {
 //BA.debugLineNum = 1674;BA.debugLine="valid_val.Add(s1(o))";
[_valid_val Add:(NSObject*)(((NSString*)[_s1 getObjectFast:_o]))];
 }
};
 //BA.debugLineNum = 1677;BA.debugLine="vals.Put(vv,valid_val)";
[_vals Put:(NSObject*)(_vv) :(NSObject*)((_valid_val).object)];
 };
 }
};
 //BA.debugLineNum = 1681;BA.debugLine="Options.Put(\"options\",vals)";
[_options Put:(NSObject*)(@"options") :(NSObject*)(_vals)];
 //BA.debugLineNum = 1683;BA.debugLine="Return vals";
if (true) return _vals;
 //BA.debugLineNum = 1685;BA.debugLine="End Sub";
return nil;
}
- (BOOL)  _getdiscount{
NSString* _start_date = @"";
NSString* _end_date = @"";
B4IMap* _temp = nil;
B4IMap* _m = nil;
 //BA.debugLineNum = 629;BA.debugLine="Sub GetDiscount As Boolean";
 //BA.debugLineNum = 631;BA.debugLine="Dim start_date,end_date As String";
_start_date = @"";
_end_date = @"";
 //BA.debugLineNum = 632;BA.debugLine="start_date = product.Get(\"special_start_date\")";
_start_date = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"special_start_date")]];
 //BA.debugLineNum = 633;BA.debugLine="end_date   = product.Get(\"special_end_date\")";
_end_date = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"special_end_date")]];
 //BA.debugLineNum = 635;BA.debugLine="If start_date = \"0000-00-00\" Or end_date = \"0000-";
if ([_start_date isEqual:@"0000-00-00"] || [_end_date isEqual:@"0000-00-00"] || [_start_date Length]==0 || [_end_date Length]==0) { 
if (true) return [self.__c False];};
 //BA.debugLineNum = 637;BA.debugLine="If Regex.IsMatch(\"\\d{4}-\\d{1,2}-\\d{1,2}\",start_da";
if ([[self.__c Regex] IsMatch:@"\\d{4}-\\d{1,2}-\\d{1,2}" :_start_date] && [[self.__c Regex] IsMatch:@"\\d{4}-\\d{1,2}-\\d{1,2}" :_end_date]) { 
 //BA.debugLineNum = 639;BA.debugLine="Try";
@try { //BA.debugLineNum = 641;BA.debugLine="If File.Exists(File.DirLibrary,\"timeout_ids_\" &";
if ([[self.__c File] Exists:[[self.__c File] DirLibrary] :[@[@"timeout_ids_",[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""]]) { 
 //BA.debugLineNum = 642;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 643;BA.debugLine="temp = File.ReadMap(File.DirLibrary,\"timeout_i";
_temp = [[self.__c File] ReadMap:[[self.__c File] DirLibrary] :[@[@"timeout_ids_",[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 644;BA.debugLine="SpecialDateInformation.Days = temp.Get(\"Days\")";
self._specialdateinformation.Days = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"Days")]].intValue;
 //BA.debugLineNum = 645;BA.debugLine="SpecialDateInformation.Hours = temp.Get(\"Hours";
self._specialdateinformation.Hours = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"Hours")]].intValue;
 //BA.debugLineNum = 646;BA.debugLine="SpecialDateInformation.Minutes = temp.Get(\"Min";
self._specialdateinformation.Minutes = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"Minutes")]].intValue;
 //BA.debugLineNum = 647;BA.debugLine="SpecialDateInformation.Months = temp.Get(\"Mont";
self._specialdateinformation.Months = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"Months")]].intValue;
 //BA.debugLineNum = 648;BA.debugLine="SpecialDateInformation.Seconds = temp.Get(\"Sec";
self._specialdateinformation.Seconds = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"Seconds")]].intValue;
 //BA.debugLineNum = 649;BA.debugLine="SpecialDateInformation.Years = temp.Get(\"Years";
self._specialdateinformation.Years = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"Years")]].intValue;
 }else {
 //BA.debugLineNum = 651;BA.debugLine="DateTime.DateFormat = \"yyyy-mm-dd\"";
[[self.__c DateTime] setDateFormat:@"yyyy-mm-dd"];
 //BA.debugLineNum = 652;BA.debugLine="SpecialDateInformation = DateUtils.PeriodBetwe";
self._specialdateinformation = [self._dateutils _periodbetweenindays:[[self.__c DateTime] DateParse:_start_date] :[[self.__c DateTime] DateParse:_end_date]];
 //BA.debugLineNum = 654;BA.debugLine="If SpecialDateInformation.Months > 0 Then";
if (self._specialdateinformation.Months>0) { 
 //BA.debugLineNum = 655;BA.debugLine="SpecialDateInformation.Days = SpecialDateInfo";
self._specialdateinformation.Days = (int) (self._specialdateinformation.Days+(self._specialdateinformation.Months*30));
 };
 //BA.debugLineNum = 658;BA.debugLine="If SpecialDateInformation.Days > 0 Then";
if (self._specialdateinformation.Days>0) { 
 //BA.debugLineNum = 659;BA.debugLine="SpecialDateInformation.Days = SpecialDateInfo";
self._specialdateinformation.Days = (int) (self._specialdateinformation.Days-1);
 //BA.debugLineNum = 660;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInf";
self._specialdateinformation.Hours = (int) (self._specialdateinformation.Hours+24);
 //BA.debugLineNum = 661;BA.debugLine="If SpecialDateInformation.Hours > 24 Then";
if (self._specialdateinformation.Hours>24) { 
 //BA.debugLineNum = 662;BA.debugLine="SpecialDateInformation.Hours = SpecialDateIn";
self._specialdateinformation.Hours = (int) (self._specialdateinformation.Hours-24);
 //BA.debugLineNum = 663;BA.debugLine="SpecialDateInformation.Minutes = SpecialDate";
self._specialdateinformation.Minutes = (int) (self._specialdateinformation.Minutes+59);
 };
 };
 //BA.debugLineNum = 667;BA.debugLine="Dim m As Map";
_m = [B4IMap new];
 //BA.debugLineNum = 668;BA.debugLine="m.Initialize";
[_m Initialize];
 //BA.debugLineNum = 669;BA.debugLine="m.Put(\"Years\",SpecialDateInformation.Years)";
[_m Put:(NSObject*)(@"Years") :(NSObject*)(@(self._specialdateinformation.Years))];
 //BA.debugLineNum = 670;BA.debugLine="m.Put(\"Months\",SpecialDateInformation.Months)";
[_m Put:(NSObject*)(@"Months") :(NSObject*)(@(self._specialdateinformation.Months))];
 //BA.debugLineNum = 671;BA.debugLine="m.Put(\"Days\",SpecialDateInformation.Days)";
[_m Put:(NSObject*)(@"Days") :(NSObject*)(@(self._specialdateinformation.Days))];
 //BA.debugLineNum = 672;BA.debugLine="m.Put(\"Hours\",SpecialDateInformation.Hours)";
[_m Put:(NSObject*)(@"Hours") :(NSObject*)(@(self._specialdateinformation.Hours))];
 //BA.debugLineNum = 673;BA.debugLine="m.Put(\"Minutes\",SpecialDateInformation.Minutes";
[_m Put:(NSObject*)(@"Minutes") :(NSObject*)(@(self._specialdateinformation.Minutes))];
 //BA.debugLineNum = 674;BA.debugLine="m.Put(\"Seconds\",SpecialDateInformation.Seconds";
[_m Put:(NSObject*)(@"Seconds") :(NSObject*)(@(self._specialdateinformation.Seconds))];
 //BA.debugLineNum = 675;BA.debugLine="File.WriteMap(File.DirLibrary,\"timeout_ids_\" &";
[[self.__c File] WriteMap:[[self.__c File] DirLibrary] :[@[@"timeout_ids_",[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""] :_m];
 };
 //BA.debugLineNum = 679;BA.debugLine="Return True";
if (true) return [self.__c True];
 } 
       @catch (NSException* e42) {
			[B4I SetException:e42]; };
 };
 //BA.debugLineNum = 686;BA.debugLine="Return False";
if (true) return [self.__c False];
 //BA.debugLineNum = 688;BA.debugLine="End Sub";
return false;
}
- (NSString*)  _imgads_click{
B4IImageViewWrapper* _im = nil;
 //BA.debugLineNum = 953;BA.debugLine="Sub imgADs_Click";
 //BA.debugLineNum = 955;BA.debugLine="Dim im As ImageView";
_im = [B4IImageViewWrapper new];
 //BA.debugLineNum = 956;BA.debugLine="im = Sender";
_im.object = (UIImageView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 958;BA.debugLine="Library.LastPage = Library.ProductPage";
self._library._lastpage = self._library._productpage;
 //BA.debugLineNum = 960;BA.debugLine="actPicture.link = im.Tag";
self._actpicture._link = [self.bi ObjectToString:[_im Tag]];
 //BA.debugLineNum = 961;BA.debugLine="actPicture.images = product.Get(\"images\")";
self._actpicture._images.object = (NSArray*)([self._product Get:(NSObject*)(@"images")]);
 //BA.debugLineNum = 962;BA.debugLine="actPicture.StartActivity";
[self._actpicture _startactivity];
 //BA.debugLineNum = 964;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbladd2cart_click{
NSString* _qus = @"";
int _smin = 0;
B4IMap* _options = nil;
 //BA.debugLineNum = 1094;BA.debugLine="Sub lbladd2cart_Click";
 //BA.debugLineNum = 1096;BA.debugLine="pnlOptions.SetLayoutAnimated(500,1,0,pnlOptions.H";
[self._pnloptions SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :[self._pnloptions Height] :[self._pnloptions Width] :[self._pnloptions Height]];
 //BA.debugLineNum = 1097;BA.debugLine="btnoptions.SetLayoutAnimated(800,1,btnoptions.Lef";
[self._btnoptions SetLayoutAnimated:(int) (800) :(float) (1) :[self._btnoptions Left] :(float) ([self._library _getheight]-[self._btnoptions Height]-[self.__c DipToCurrent:(int) (40)]) :[self._btnoptions Width] :[self._btnoptions Height]];
 //BA.debugLineNum = 1099;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 1100;BA.debugLine="MyToastMessageShow1.Initialize(Library.ProductPa";
[self._mytoastmessageshow1 _initialize:self.bi :[self._library._productpage RootPanel]];
 //BA.debugLineNum = 1101;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 1102;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1105;BA.debugLine="Dim qus As String";
_qus = @"";
 //BA.debugLineNum = 1106;BA.debugLine="qus = product.Get(\"stock_status\")";
_qus = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"stock_status")]];
 //BA.debugLineNum = 1108;BA.debugLine="If product.Get(\"quantity\") = 0 Then 'Or qus = \"نا";
if ([[self._product Get:(NSObject*)(@"quantity")] isEqual:(NSObject*)(@(0))]) { 
 //BA.debugLineNum = 1109;BA.debugLine="MyToastMessageShow1.Initialize(Library.ProductPa";
[self._mytoastmessageshow1 _initialize:self.bi :[self._library._productpage RootPanel]];
 //BA.debugLineNum = 1110;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_product"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 1111;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1114;BA.debugLine="Dim sMin As Int";
_smin = 0;
 //BA.debugLineNum = 1115;BA.debugLine="If product.ContainsKey(\"minimum\") Then";
if ([self._product ContainsKey:(NSObject*)(@"minimum")]) { 
 //BA.debugLineNum = 1116;BA.debugLine="sMin = product.Get(\"minimum\")";
_smin = [self.bi ObjectToNumber:[self._product Get:(NSObject*)(@"minimum")]].intValue;
 }else {
 //BA.debugLineNum = 1118;BA.debugLine="sMin = 1";
_smin = (int) (1);
 };
 //BA.debugLineNum = 1121;BA.debugLine="Dim options As Map";
_options = [B4IMap new];
 //BA.debugLineNum = 1122;BA.debugLine="options = GetCartOptions";
_options = [self _getcartoptions];
 //BA.debugLineNum = 1123;BA.debugLine="Library.HUD.ProgressDialogShow(Library.GetStringR";
[self._library._hud ProgressDialogShow:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 1124;BA.debugLine="details.Add2Cart(Me,\"Add2Cart_receive\",product.Ge";
[self._details _add2cart:self :@"Add2Cart_receive" :[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]] :[self.bi NumberToString:@(_smin)] :_options];
 //BA.debugLineNum = 1126;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblattr_click{
 //BA.debugLineNum = 1737;BA.debugLine="Sub lblattr_Click";
 //BA.debugLineNum = 1738;BA.debugLine="sv1.ScrollTo(0,topAttr,True)";
[self._sv1 ScrollTo:(int) (0) :self._topattr :[self.__c True]];
 //BA.debugLineNum = 1739;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblattributes_click{
 //BA.debugLineNum = 1287;BA.debugLine="Sub lblattributes_Click";
 //BA.debugLineNum = 1289;BA.debugLine="If svAttribute.Panel.NumberOfViews = 0 Then";
if ([[self._svattribute Panel] NumberOfViews]==0) { 
 //BA.debugLineNum = 1290;BA.debugLine="LoadAttribute";
[self _loadattribute];
 };
 //BA.debugLineNum = 1293;BA.debugLine="If svAttribute.Panel.NumberOfViews = 0 Then Retur";
if ([[self._svattribute Panel] NumberOfViews]==0) { 
if (true) return @"";};
 //BA.debugLineNum = 1295;BA.debugLine="pnlAttribute.top = pnlAttribute.Height";
[self._pnlattribute setTop:[self._pnlattribute Height]];
 //BA.debugLineNum = 1296;BA.debugLine="pnlAttribute.Visible = True";
[self._pnlattribute setVisible:[self.__c True]];
 //BA.debugLineNum = 1297;BA.debugLine="pnlAttribute.SetLayoutAnimated(500,1,0,0,pnlAttri";
[self._pnlattribute SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :(float) (0) :[self._pnlattribute Width] :[self._pnlattribute Height]];
 //BA.debugLineNum = 1298;BA.debugLine="pnlAttribute.BringToFront";
[self._pnlattribute BringToFront];
 //BA.debugLineNum = 1300;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbloptions_click{
 //BA.debugLineNum = 1733;BA.debugLine="Sub lbloptions_Click";
 //BA.debugLineNum = 1734;BA.debugLine="sv1.ScrollTo(0,topOptions,True)";
[self._sv1 ScrollTo:(int) (0) :self._topoptions :[self.__c True]];
 //BA.debugLineNum = 1735;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblpayment_click{
 //BA.debugLineNum = 1784;BA.debugLine="Sub lblpayment_Click";
 //BA.debugLineNum = 1786;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 1787;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 1788;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1791;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if ([self._library._logindetails IsInitialized]) { 
 //BA.debugLineNum = 1792;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ([[self._library._logindetails Get:(NSObject*)(@"login")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 1793;BA.debugLine="If DateTime.Now - Library.loginDetails.Get(\"exp";
if ([[self.__c DateTime] Now]-[self.bi ObjectToNumber:[self._library._logindetails Get:(NSObject*)(@"expire")]].doubleValue>1010020) { 
 //BA.debugLineNum = 1796;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1799;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 1803;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if ([self._library._guestlogin IsInitialized]) { 
 //BA.debugLineNum = 1804;BA.debugLine="If Library.GuestLogin.Get(\"login\") = True Then";
if ([[self._library._guestlogin Get:(NSObject*)(@"login")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 1806;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 1810;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadattribute{
B4IList* _attr = nil;
int _topattribute = 0;
B4ILabelWrapper* _lblheader = nil;
int _i = 0;
B4IMap* _temp = nil;
B4ILabelWrapper* _lblkey = nil;
B4IList* _vals = nil;
int _j = 0;
B4IMap* _attrs = nil;
B4ILabelWrapper* _lblval = nil;
 //BA.debugLineNum = 1190;BA.debugLine="Sub LoadAttribute";
 //BA.debugLineNum = 1192;BA.debugLine="Dim attr As List";
_attr = [B4IList new];
 //BA.debugLineNum = 1194;BA.debugLine="If product.ContainsKey(\"attribute_groups\") Then";
if ([self._product ContainsKey:(NSObject*)(@"attribute_groups")]) { 
 //BA.debugLineNum = 1195;BA.debugLine="attr = product.Get(\"attribute_groups\")";
_attr.object = (NSArray*)([self._product Get:(NSObject*)(@"attribute_groups")]);
 };
 //BA.debugLineNum = 1198;BA.debugLine="If attr.IsInitialized = False Then";
if ([_attr IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 1199;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_attribute"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 1200;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1203;BA.debugLine="If attr.Size = 0 Then";
if ([_attr Size]==0) { 
 //BA.debugLineNum = 1204;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"no_attribute"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 1205;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 1208;BA.debugLine="Dim topAttribute As Int";
_topattribute = 0;
 //BA.debugLineNum = 1210;BA.debugLine="Dim lblHeader As Label";
_lblheader = [B4ILabelWrapper new];
 //BA.debugLineNum = 1211;BA.debugLine="lblHeader.Initialize(\"\")";
[_lblheader Initialize:self.bi :@""];
 //BA.debugLineNum = 1212;BA.debugLine="lblHeader.Color = Library.Theme_Background";
[_lblheader setColor:self._library._theme_background];
 //BA.debugLineNum = 1214;BA.debugLine="lblHeader.Font = Library.GetFont(14)";
[_lblheader setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1216;BA.debugLine="lblHeader.TextColor = Colors.Gray";
[_lblheader setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1217;BA.debugLine="lblHeader.Text = Library.GetStringResourse(\"attri";
[_lblheader setText:[self._library _getstringresourse:@"attribute"]];
 //BA.debugLineNum = 1218;BA.debugLine="lblHeader.TextAlignment = lblHeader.ALIGNMENT_CEN";
[_lblheader setTextAlignment:[_lblheader ALIGNMENT_CENTER]];
 //BA.debugLineNum = 1219;BA.debugLine="Library.PaddingLabel(lblHeader,10,0,10,0)";
[self._library _paddinglabel:_lblheader :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 1220;BA.debugLine="svAttribute.Panel.AddView(lblHeader,pnl2.Left,top";
[[self._svattribute Panel] AddView:(UIView*)((_lblheader).object) :[self._pnl2 Left] :(float) (_topattribute) :[self._pnl2 Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1221;BA.debugLine="topAttribute = topAttribute + 40dip";
_topattribute = (int) (_topattribute+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1222;BA.debugLine="svAttribute.Panel.Height = svAttribute.Panel.Heig";
[[self._svattribute Panel] setHeight:(float) ([[self._svattribute Panel] Height]+[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1224;BA.debugLine="For i = 0 To attr.Size - 1";
{
const int step25 = 1;
const int limit25 = (int) ([_attr Size]-1);
_i = (int) (0) ;
for (;(step25 > 0 && _i <= limit25) || (step25 < 0 && _i >= limit25) ;_i = ((int)(0 + _i + step25))  ) {
 //BA.debugLineNum = 1226;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 1227;BA.debugLine="temp = attr.Get(i)";
_temp = (B4IMap*)([_attr Get:_i]);
 //BA.debugLineNum = 1229;BA.debugLine="Dim lblKey As Label";
_lblkey = [B4ILabelWrapper new];
 //BA.debugLineNum = 1230;BA.debugLine="lblKey.Initialize(\"\")";
[_lblkey Initialize:self.bi :@""];
 //BA.debugLineNum = 1231;BA.debugLine="lblKey.Color = Library.Theme_Header";
[_lblkey setColor:self._library._theme_header];
 //BA.debugLineNum = 1232;BA.debugLine="lblKey.Font = Library.GetFont(14)";
[_lblkey setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1233;BA.debugLine="lblKey.TextColor = Colors.White";
[_lblkey setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1234;BA.debugLine="lblKey.Text = \"  \" & temp.Get(\"name\") & \"  \"";
[_lblkey setText:[@[@"  ",[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]],@"  "] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1235;BA.debugLine="lblKey.TextAlignment = Library.GetStringResourse";
[_lblkey setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1236;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
[self._library _paddinglabel:_lblkey :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 1238;BA.debugLine="svAttribute.Panel.AddView(lblKey,pnl2.Left,topAt";
[[self._svattribute Panel] AddView:(UIView*)((_lblkey).object) :[self._pnl2 Left] :(float) (_topattribute) :[self._pnl2 Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1239;BA.debugLine="topAttribute = topAttribute + 40dip";
_topattribute = (int) (_topattribute+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1240;BA.debugLine="svAttribute.Panel.Height = svAttribute.Panel.Hei";
[[self._svattribute Panel] setHeight:(float) ([[self._svattribute Panel] Height]+[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1242;BA.debugLine="Dim vals As List";
_vals = [B4IList new];
 //BA.debugLineNum = 1243;BA.debugLine="vals = temp.Get(\"attribute\")";
_vals.object = (NSArray*)([_temp Get:(NSObject*)(@"attribute")]);
 //BA.debugLineNum = 1245;BA.debugLine="For j = 0 To vals.Size - 1";
{
const int step41 = 1;
const int limit41 = (int) ([_vals Size]-1);
_j = (int) (0) ;
for (;(step41 > 0 && _j <= limit41) || (step41 < 0 && _j >= limit41) ;_j = ((int)(0 + _j + step41))  ) {
 //BA.debugLineNum = 1247;BA.debugLine="Dim attrs As Map";
_attrs = [B4IMap new];
 //BA.debugLineNum = 1248;BA.debugLine="attrs = vals.Get(j)";
_attrs = (B4IMap*)([_vals Get:_j]);
 //BA.debugLineNum = 1250;BA.debugLine="Dim lblVal As Label";
_lblval = [B4ILabelWrapper new];
 //BA.debugLineNum = 1251;BA.debugLine="lblVal.Initialize(\"\")";
[_lblval Initialize:self.bi :@""];
 //BA.debugLineNum = 1252;BA.debugLine="lblVal.Color = Colors.White";
[_lblval setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1253;BA.debugLine="lblVal.Font =  Library.GetFont(12)";
[_lblval setFont:[self._library _getfont:(int) (12)]];
 //BA.debugLineNum = 1254;BA.debugLine="lblVal.TextColor = Colors.Black";
[_lblval setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 1255;BA.debugLine="lblVal.Text = \"  \" & attrs.Get(\"name\") & \" : \"";
[_lblval setText:[@[@"  ",[self.bi ObjectToString:[_attrs Get:(NSObject*)(@"name")]],@" : ",[self.bi ObjectToString:[_attrs Get:(NSObject*)(@"text")]],@"  "] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1256;BA.debugLine="lblVal.TextAlignment = Library.GetStringResours";
[_lblval setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1257;BA.debugLine="Library.PaddingLabel(lblVal,10,0,10,0)";
[self._library _paddinglabel:_lblval :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 1259;BA.debugLine="svAttribute.Panel.AddView(lblVal,pnl2.Left,topA";
[[self._svattribute Panel] AddView:(UIView*)((_lblval).object) :[self._pnl2 Left] :(float) (_topattribute) :[self._pnl2 Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1260;BA.debugLine="topAttribute = topAttribute + 40dip";
_topattribute = (int) (_topattribute+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1261;BA.debugLine="svAttribute.Panel.Height = svAttribute.Panel.He";
[[self._svattribute Panel] setHeight:(float) ([[self._svattribute Panel] Height]+[self.__c DipToCurrent:(int) (40)])];
 }
};
 }
};
 //BA.debugLineNum = 1267;BA.debugLine="Dim btnback As Button";
self._btnback = [B4IButtonWrapper new];
 //BA.debugLineNum = 1268;BA.debugLine="btnback.InitializeCustom(\"btnbackattr\",Colors.Whi";
[self._btnback InitializeCustom:@"btnbackattr" :self.bi :[[self.__c Colors] White] :[[self.__c Colors] DarkGray]];
 //BA.debugLineNum = 1270;BA.debugLine="topAttribute = topAttribute + 15";
_topattribute = (int) (_topattribute+15);
 //BA.debugLineNum = 1272;BA.debugLine="svAttribute.Panel.AddView(btnback,0,topAttribute,";
[[self._svattribute Panel] AddView:(UIView*)((self._btnback).object) :(float) (0) :(float) (_topattribute) :(float) ([self.__c DipToCurrent:(int) (120)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1274;BA.debugLine="btnback.Color = Library.ConvertHex2Int(Library.Ge";
[self._btnback setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 1275;BA.debugLine="btnback.SetBorder(1,Colors.Gray,5)";
[self._btnback SetBorder:(float) (1) :[[self.__c Colors] Gray] :(float) (5)];
 //BA.debugLineNum = 1276;BA.debugLine="btnback.Text = Library.GetStringResourse(\"back\")";
[self._btnback setText:[self._library _getstringresourse:@"back"]];
 //BA.debugLineNum = 1277;BA.debugLine="btnback.CustomLabel.TextColor = Colors.White";
[[self._btnback CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1278;BA.debugLine="btnback.CustomLabel.Font = Library.GetFont(14)";
[[self._btnback CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1279;BA.debugLine="Library.CenterView(btnback,Library.ProductPage.Ro";
[self._library _centerview:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnback).object)] :(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._library._productpage RootPanel]).object)]];
 //BA.debugLineNum = 1281;BA.debugLine="svAttribute.Panel.height = topAttribute + 55dip";
[[self._svattribute Panel] setHeight:(float) (_topattribute+[self.__c DipToCurrent:(int) (55)])];
 //BA.debugLineNum = 1282;BA.debugLine="svAttribute.ContentHeight = topAttribute + 55dip";
[self._svattribute setContentHeight:(int) (_topattribute+[self.__c DipToCurrent:(int) (55)])];
 //BA.debugLineNum = 1283;BA.debugLine="svAttribute.ContentWidth = svAttribute.Width";
[self._svattribute setContentWidth:(int) ([self._svattribute Width])];
 //BA.debugLineNum = 1285;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loaditem{
NSString* _product_name = @"";
B4IMap* _pr = nil;
NSString* _vvs = @"";
NSObject* _s1 = nil;
NSString* _price = @"";
NSString* _special = @"";
NSString* _qus = @"";
B4IList* _listoption = nil;
B4IMap* _review = nil;
NSString* _rating = @"";
B4IMap* _images = nil;
int _left = 0;
int _i = 0;
B4IPanelWrapper* _p1 = nil;
B4IImageViewWrapper* _im1 = nil;
b4i_imagedownloader* _imagedownload1 = nil;
NSString* _style = @"";
NSString* _ks = @"";
b4i_opencart* _oprelat = nil;
 //BA.debugLineNum = 362;BA.debugLine="Sub LoadItem";
 //BA.debugLineNum = 364;BA.debugLine="Dim product_name As String";
_product_name = @"";
 //BA.debugLineNum = 365;BA.debugLine="product_name = product.Get(\"name\")";
_product_name = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"name")]];
 //BA.debugLineNum = 367;BA.debugLine="Dim pr As Map";
_pr = [B4IMap new];
 //BA.debugLineNum = 368;BA.debugLine="pr.Initialize";
[_pr Initialize];
 //BA.debugLineNum = 370;BA.debugLine="For Each vvs As String In product.Keys";
{
const id<B4IIterable> group5 = [self._product Keys];
const int groupLen5 = group5.Size
;int index5 = 0;
;
for (; index5 < groupLen5;index5++){
_vvs = [self.bi ObjectToString:[group5 Get:index5]];
 //BA.debugLineNum = 372;BA.debugLine="Dim s1 As Object";
_s1 = [NSObject new];
 //BA.debugLineNum = 373;BA.debugLine="s1 = product.Get(vvs)";
_s1 = [self._product Get:(NSObject*)(_vvs)];
 //BA.debugLineNum = 375;BA.debugLine="If s1 = Null Or s1 = \"<null>\" Or s1 = \"null\" The";
if (_s1== nil || [_s1 isEqual:(NSObject*)(@"<null>")] || [_s1 isEqual:(NSObject*)(@"null")]) { 
 //BA.debugLineNum = 376;BA.debugLine="pr.Put(vvs,\"-\")";
[_pr Put:(NSObject*)(_vvs) :(NSObject*)(@"-")];
 }else {
 //BA.debugLineNum = 378;BA.debugLine="pr.Put(vvs,s1)";
[_pr Put:(NSObject*)(_vvs) :_s1];
 };
 }
};
 //BA.debugLineNum = 383;BA.debugLine="product = pr";
self._product = _pr;
 //BA.debugLineNum = 385;BA.debugLine="lbltitle.Text = product_name";
[self._lbltitle setText:_product_name];
 //BA.debugLineNum = 386;BA.debugLine="lbltitle.Text = lbltitle.Text.Replace(\"&quot;\",QU";
[self._lbltitle setText:[[[self._lbltitle Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 388;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 389;BA.debugLine="price = product.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"price_formated")]];
 //BA.debugLineNum = 390;BA.debugLine="special = product.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"special_formated")]];
 //BA.debugLineNum = 392;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if ([_price Length]>0 && [_special Length]==0) { 
 //BA.debugLineNum = 393;BA.debugLine="lbladd2cart.Text = \" \" & price";
[self._lbladd2cart setText:[@[@" ",_price] componentsJoinedByString:@""]];
 //BA.debugLineNum = 395;BA.debugLine="btnreviews.CustomLabel.Font= Library.GetFont(btn";
[[self._btnreviews CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnreviews CustomLabel] Font] Size])]];
 //BA.debugLineNum = 396;BA.debugLine="btnattributes.CustomLabel.Font= Library.GetFont(";
[[self._btnattributes CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnattributes CustomLabel] Font] Size])]];
 }else if([_special Length]>0) { 
 //BA.debugLineNum = 399;BA.debugLine="lbladd2cart.Text = \" \" &special";
[self._lbladd2cart setText:[@[@" ",_special] componentsJoinedByString:@""]];
 //BA.debugLineNum = 400;BA.debugLine="Library.DiscountPrice(price,lblpre_price)";
[self._library _discountprice:_price :self._lblpre_price];
 //BA.debugLineNum = 402;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 403;BA.debugLine="imgspecial.Bitmap = LoadBitmap(File.DirAssets,\"";
[self._imgspecial setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"special_fa.png"]];
 }else {
 //BA.debugLineNum = 405;BA.debugLine="imgspecial.Bitmap = LoadBitmap(File.DirAssets,\"";
[self._imgspecial setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"special_en.png"]];
 };
 //BA.debugLineNum = 408;BA.debugLine="imgspecial.Visible = True";
[self._imgspecial setVisible:[self.__c True]];
 };
 //BA.debugLineNum = 412;BA.debugLine="If product_name.Length > 17 Then product_name = p";
if ([_product_name Length]>17) { 
_product_name = [@[[_product_name SubString2:(int) (0) :(int) (13)],@"..."] componentsJoinedByString:@""];};
 //BA.debugLineNum = 414;BA.debugLine="Dim qus As String";
_qus = @"";
 //BA.debugLineNum = 415;BA.debugLine="qus = product.Get(\"stock_status\")";
_qus = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"stock_status")]];
 //BA.debugLineNum = 417;BA.debugLine="If product.Get(\"quantity\") = 0 Then 'Or qus = \"نا";
if ([[self._product Get:(NSObject*)(@"quantity")] isEqual:(NSObject*)(@(0))]) { 
 //BA.debugLineNum = 418;BA.debugLine="lblstate.Text = Library.GetStringResourse(\"no_st";
[self._lblstate setText:[self._library _getstringresourse:@"no_stock"]];
 //BA.debugLineNum = 419;BA.debugLine="lbladd2cart.Font = Font.DEFAULT";
[self._lbladd2cart setFont:[[self.__c Font] DEFAULT]];
 //BA.debugLineNum = 420;BA.debugLine="lbladd2cart.Text = Library.GetStringResourse(\"no";
[self._lbladd2cart setText:[self._library _getstringresourse:@"no_stock"]];
 //BA.debugLineNum = 421;BA.debugLine="pnlBasket.Visible = False";
[self._pnlbasket setVisible:[self.__c False]];
 //BA.debugLineNum = 422;BA.debugLine="pnl2.top = pnlprice.top + pnlprice.Height-2";
[self._pnl2 setTop:(float) ([self._pnlprice Top]+[self._pnlprice Height]-2)];
 //BA.debugLineNum = 423;BA.debugLine="lbladd2cart.Color = Colors.RGB(253,77,90)";
[self._lbladd2cart setColor:[[self.__c Colors] RGB:(int) (253) :(int) (77) :(int) (90)]];
 //BA.debugLineNum = 424;BA.debugLine="lbladd2cart.SetBorder(1,Colors.RGB(253,77,90),9)";
[self._lbladd2cart SetBorder:(float) (1) :[[self.__c Colors] RGB:(int) (253) :(int) (77) :(int) (90)] :(float) (9)];
 //BA.debugLineNum = 425;BA.debugLine="lbladd2cart.UserInteractionEnabled = False";
[self._lbladd2cart setUserInteractionEnabled:[self.__c False]];
 }else {
 //BA.debugLineNum = 427;BA.debugLine="lblstate.Text = Library.GetStringResourse(\"yes_s";
[self._lblstate setText:[self._library _getstringresourse:@"yes_stock"]];
 };
 //BA.debugLineNum = 430;BA.debugLine="lblproducer.Text = product.Get(\"manufacturer\")";
[self._lblproducer setText:[self.bi ObjectToString:[self._product Get:(NSObject*)(@"manufacturer")]]];
 //BA.debugLineNum = 431;BA.debugLine="If lblproducer.Text.IndexOf(\"null\") <> -1 Then lb";
if ([[self._lblproducer Text] IndexOf:@"null"]!=-1) { 
[self._lblproducer setText:@"-"];};
 //BA.debugLineNum = 433;BA.debugLine="lblmodel.Text = product.Get(\"model\")";
[self._lblmodel setText:[self.bi ObjectToString:[self._product Get:(NSObject*)(@"model")]]];
 //BA.debugLineNum = 434;BA.debugLine="If lblmodel.Text.IndexOf(\"null\") <> -1 Then lblmo";
if ([[self._lblmodel Text] IndexOf:@"null"]!=-1) { 
[self._lblmodel setText:@"-"];};
 //BA.debugLineNum = 436;BA.debugLine="lblvisit.Text = product.Get(\"viewed\")";
[self._lblvisit setText:[self.bi ObjectToString:[self._product Get:(NSObject*)(@"viewed")]]];
 //BA.debugLineNum = 438;BA.debugLine="Dim listoption As List";
_listoption = [B4IList new];
 //BA.debugLineNum = 439;BA.debugLine="listoption = product.Get(\"options\")";
_listoption.object = (NSArray*)([self._product Get:(NSObject*)(@"options")]);
 //BA.debugLineNum = 441;BA.debugLine="top = lbldescription.top";
self._top = (int) ([self._lbldescription Top]);
 //BA.debugLineNum = 443;BA.debugLine="If listoption.Size > 0 Then";
if ([_listoption Size]>0) { 
 //BA.debugLineNum = 444;BA.debugLine="LoadOptions(listoption)";
[self _loadoptions:_listoption];
 };
 //BA.debugLineNum = 451;BA.debugLine="Dim review As Map";
_review = [B4IMap new];
 //BA.debugLineNum = 452;BA.debugLine="review.Initialize";
[_review Initialize];
 //BA.debugLineNum = 453;BA.debugLine="review = product.Get(\"reviews\")";
_review = (B4IMap*)([self._product Get:(NSObject*)(@"reviews")]);
 //BA.debugLineNum = 455;BA.debugLine="If review.IsInitialized Then";
if ([_review IsInitialized]) { 
 //BA.debugLineNum = 456;BA.debugLine="btnreviews.Text = Library.GetStringResourse(\"rev";
[self._btnreviews setText:[@[[self._library _getstringresourse:@"reviews"],@" [ ",[self.bi ObjectToString:[_review Get:(NSObject*)(@"review_total")]],@" ]"] componentsJoinedByString:@""]];
 }else {
 //BA.debugLineNum = 458;BA.debugLine="btnreviews.Text = Library.GetStringResourse(\"rev";
[self._btnreviews setText:[self._library _getstringresourse:@"reviews"]];
 };
 //BA.debugLineNum = 462;BA.debugLine="If product.ContainsKey(\"rating\") Then";
if ([self._product ContainsKey:(NSObject*)(@"rating")]) { 
 //BA.debugLineNum = 464;BA.debugLine="Dim rating As String";
_rating = @"";
 //BA.debugLineNum = 465;BA.debugLine="rating = product.Get(\"rating\")";
_rating = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"rating")]];
 //BA.debugLineNum = 467;BA.debugLine="If rating = \"0\" Then";
if ([_rating isEqual:@"0"]) { 
 //BA.debugLineNum = 468;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 469;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 470;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 471;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 472;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([_rating isEqual:@"1"]) { 
 //BA.debugLineNum = 475;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 476;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 477;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 478;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 479;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([_rating isEqual:@"2"]) { 
 //BA.debugLineNum = 482;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 483;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 484;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 485;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 486;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([_rating isEqual:@"3"]) { 
 //BA.debugLineNum = 489;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 490;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 491;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 492;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 493;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([_rating isEqual:@"4"]) { 
 //BA.debugLineNum = 496;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 497;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 498;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 499;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 500;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([_rating isEqual:@"5"] || [self.bi ObjectToNumber:_rating].doubleValue>5) { 
 //BA.debugLineNum = 503;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 504;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 505;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 506;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 507;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 };
 };
 //BA.debugLineNum = 515;BA.debugLine="If product.ContainsKey(\"images\") Then";
if ([self._product ContainsKey:(NSObject*)(@"images")]) { 
 //BA.debugLineNum = 517;BA.debugLine="listSlideshow = product.Get(\"images\")";
self._listslideshow.object = (NSArray*)([self._product Get:(NSObject*)(@"images")]);
 //BA.debugLineNum = 519;BA.debugLine="If product.ContainsKey(\"image\") Then";
if ([self._product ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 520;BA.debugLine="listSlideshow.InsertAt(0,product.Get(\"image\"))";
[self._listslideshow InsertAt:(int) (0) :[self._product Get:(NSObject*)(@"image")]];
 };
 //BA.debugLineNum = 523;BA.debugLine="Library.imagesSlideshowProduct.Initialize";
[self._library._imagesslideshowproduct Initialize];
 //BA.debugLineNum = 525;BA.debugLine="If listSlideshow.Size > 0 Then";
if ([self._listslideshow Size]>0) { 
 //BA.debugLineNum = 527;BA.debugLine="slidepanel1.Initialize(\"slideshowsv\",Library.Ge";
[self._slidepanel1 Initialize:self.bi :@"slideshowsv" :[self._library _getwidth] :(int) ([self._pnlads Height])];
 //BA.debugLineNum = 529;BA.debugLine="Dim images As Map";
_images = [B4IMap new];
 //BA.debugLineNum = 530;BA.debugLine="images.Initialize";
[_images Initialize];
 //BA.debugLineNum = 532;BA.debugLine="Dim left As Int";
_left = 0;
 //BA.debugLineNum = 534;BA.debugLine="For i = 0 To listSlideshow.Size - 1";
{
const int step120 = 1;
const int limit120 = (int) ([self._listslideshow Size]-1);
_i = (int) (0) ;
for (;(step120 > 0 && _i <= limit120) || (step120 < 0 && _i >= limit120) ;_i = ((int)(0 + _i + step120))  ) {
 //BA.debugLineNum = 536;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 537;BA.debugLine="p1.Initialize(\"pnlImage\")";
[_p1 Initialize:self.bi :@"pnlImage"];
 //BA.debugLineNum = 538;BA.debugLine="slidepanel1.Panel.AddView(p1,left,0,Library.Ge";
[[self._slidepanel1 Panel] AddView:(UIView*)((_p1).object) :(float) (_left) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getwidth])];
 //BA.debugLineNum = 540;BA.debugLine="Dim im1 As ImageView";
_im1 = [B4IImageViewWrapper new];
 //BA.debugLineNum = 541;BA.debugLine="im1.Initialize(\"imgADs\")";
[_im1 Initialize:self.bi :@"imgADs"];
 //BA.debugLineNum = 542;BA.debugLine="im1.ContentMode = im1.MODE_FIT";
[_im1 setContentMode:[_im1 MODE_FIT]];
 //BA.debugLineNum = 543;BA.debugLine="Library.imagesSlideshowProduct.Add(im1)";
[self._library._imagesslideshowproduct Add:(NSObject*)((_im1).object)];
 //BA.debugLineNum = 545;BA.debugLine="If Library.GetDevicePhysicalSize > 5 Then";
if ([self._library _getdevicephysicalsize]>5) { 
 //BA.debugLineNum = 546;BA.debugLine="p1.AddView(im1,0,0,Library.GetWidth-20dip,Lib";
[_p1 AddView:(UIView*)((_im1).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (160)])];
 }else {
 //BA.debugLineNum = 548;BA.debugLine="p1.AddView(im1,0,0,Library.GetWidth-20dip,Lib";
[_p1 AddView:(UIView*)((_im1).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (140)])];
 };
 //BA.debugLineNum = 551;BA.debugLine="im1.Tag = listSlideshow.Get(i)";
[_im1 setTag:[self._listslideshow Get:_i]];
 //BA.debugLineNum = 552;BA.debugLine="left = left + Library.GetWidth";
_left = (int) (_left+[self._library _getwidth]);
 //BA.debugLineNum = 554;BA.debugLine="images.Put(im1,listSlideshow.Get(i))";
[_images Put:(NSObject*)((_im1).object) :[self._listslideshow Get:_i]];
 }
};
 //BA.debugLineNum = 558;BA.debugLine="Dim imagedownload1 As ImageDownloader";
_imagedownload1 = [b4i_imagedownloader new];
 //BA.debugLineNum = 559;BA.debugLine="imagedownload1.Initialize";
[_imagedownload1 _initialize:self.bi];
 //BA.debugLineNum = 560;BA.debugLine="imagedownload1.Download(images)";
[_imagedownload1 _download:_images];
 //BA.debugLineNum = 562;BA.debugLine="slidepanel1.ContentWidth = listSlideshow.Size *";
[self._slidepanel1 setContentWidth:(int) ([self._listslideshow Size]*[self._library _getwidth])];
 //BA.debugLineNum = 563;BA.debugLine="pnlads.AddView(slidepanel1,0,0,Library.GetWidth";
[self._pnlads AddView:(UIView*)((self._slidepanel1).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :[self._pnlads Height]];
 //BA.debugLineNum = 565;BA.debugLine="AddBullet(listSlideshow.Size)";
[self _addbullet:[self._listslideshow Size]];
 //BA.debugLineNum = 566;BA.debugLine="ChooseBullet(0)";
[self _choosebullet:(int) (0)];
 //BA.debugLineNum = 568;BA.debugLine="timerSlideshow.Initialize(\"tmrSlideshow\",2500)";
[self._timerslideshow Initialize:self.bi :@"tmrSlideshow" :(long long) (2500)];
 //BA.debugLineNum = 569;BA.debugLine="timerSlideshow.Enabled = True";
[self._timerslideshow setEnabled:[self.__c True]];
 };
 };
 //BA.debugLineNum = 577;BA.debugLine="Dim style As String";
_style = @"";
 //BA.debugLineNum = 578;BA.debugLine="style = \"<style>body {text-align:justify;line-hei";
_style = @"<style>body {text-align:justify;line-height:25px;";
 //BA.debugLineNum = 580;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + lbldescript";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self._lbldescription Height]-[self.__c DipToCurrent:(int) (340)])];
 //BA.debugLineNum = 581;BA.debugLine="pnl2.Height = pnl2.Height + lbldescription.Height";
[self._pnl2 setHeight:(float) ([self._pnl2 Height]+[self._lbldescription Height]-[self.__c DipToCurrent:(int) (270)])];
 //BA.debugLineNum = 583;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 584;BA.debugLine="lbldate.Text = Library.GetDate(product.Get(\"date";
[self._lbldate setText:[self._library _getdate:[self.bi ObjectToString:[self._product Get:(NSObject*)(@"date_added")]]]];
 //BA.debugLineNum = 585;BA.debugLine="style = style & \"direction:rtl;}</style>\"";
_style = [@[_style,@"direction:rtl;}</style>"] componentsJoinedByString:@""];
 }else {
 //BA.debugLineNum = 587;BA.debugLine="lbldate.Text = product.Get(\"date_added\")";
[self._lbldate setText:[self.bi ObjectToString:[self._product Get:(NSObject*)(@"date_added")]]];
 //BA.debugLineNum = 588;BA.debugLine="style = style & \"direction:ltr;}</style>\"";
_style = [@[_style,@"direction:ltr;}</style>"] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 591;BA.debugLine="Dim ks As String";
_ks = @"";
 //BA.debugLineNum = 592;BA.debugLine="ks = product.Get(\"description\")";
_ks = [self.bi ObjectToString:[self._product Get:(NSObject*)(@"description")]];
 //BA.debugLineNum = 594;BA.debugLine="If ks.Length < 601 Then btnmore.Visible = False";
if ([_ks Length]<601) { 
[self._btnmore setVisible:[self.__c False]];};
 //BA.debugLineNum = 596;BA.debugLine="If ks.Length > 600 Then";
if ([_ks Length]>600) { 
 //BA.debugLineNum = 597;BA.debugLine="ks = ks.SubString2(0,600) & \"....\"";
_ks = [@[[_ks SubString2:(int) (0) :(int) (600)],@"...."] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 600;BA.debugLine="lbldescription.LoadHtml(style & ks)";
[self._lbldescription LoadHtml:[@[_style,_ks] componentsJoinedByString:@""]];
 //BA.debugLineNum = 602;BA.debugLine="top = sv1.Panel.height + 2dip";
self._top = (int) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (2)]);
 //BA.debugLineNum = 603;BA.debugLine="sv1.ContentHeight = top";
[self._sv1 setContentHeight:self._top];
 //BA.debugLineNum = 605;BA.debugLine="Dim opRelat As OpenCart";
_oprelat = [b4i_opencart new];
 //BA.debugLineNum = 606;BA.debugLine="opRelat.Initialize";
[_oprelat _initialize:self.bi];
 //BA.debugLineNum = 607;BA.debugLine="opRelat.RelatedProduct(Me,\"RelatedProduct_receive";
[_oprelat _relatedproduct:self :@"RelatedProduct_receive" :[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]];
 //BA.debugLineNum = 609;BA.debugLine="lbladd2cart.Text = lbladd2cart.Text";
[self._lbladd2cart setText:[self._lbladd2cart Text]];
 //BA.debugLineNum = 610;BA.debugLine="lblfloat_basket.Text = \" \" & Library.GetStringRe";
[self._lblfloat_basket setText:[@[@" ",[self._library _getstringresourse:@"add2cartbtn"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 612;BA.debugLine="If GetDiscount = True Then";
if ([self _getdiscount]==[self.__c True]) { 
 //BA.debugLineNum = 613;BA.debugLine="timerSpecial.Initialize(\"timerSpecial\",1000)";
[self._timerspecial Initialize:self.bi :@"timerSpecial" :(long long) (1000)];
 //BA.debugLineNum = 614;BA.debugLine="timerSpecial.Enabled = True";
[self._timerspecial setEnabled:[self.__c True]];
 };
 //BA.debugLineNum = 617;BA.debugLine="tmrCicle.Initialize(\"tmrCircles\",2000)";
[self._tmrcicle Initialize:self.bi :@"tmrCircles" :(long long) (2000)];
 //BA.debugLineNum = 618;BA.debugLine="tmrCicle.Enabled = True";
[self._tmrcicle setEnabled:[self.__c True]];
 //BA.debugLineNum = 620;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadoptions:(B4IList*) _attr{
B4ILabelWrapper* _lblheader = nil;
int _i = 0;
B4IMap* _optiontype = nil;
B4IList* _optionvalue = nil;
B4ILabelWrapper* _lblkey = nil;
B4IPickerWrapper* _sp1 = nil;
B4IList* _lsdata = nil;
B4IPanelWrapper* _pdefault = nil;
BOOL _blnaddpanel = false;
int _toprb = 0;
B4ITextFieldWrapper* _txt1 = nil;
int _j = 0;
B4IMap* _attrs = nil;
B4ISwitchWrapper* _rb1 = nil;
NSString* _price_format = @"";
B4ILabelWrapper* _lb2 = nil;
B4ISwitchWrapper* _ck1 = nil;
NSString* _pr = @"";
B4ILabelWrapper* _lb21 = nil;
B4IMap* _attrs1 = nil;
B4IMap* _imagemap = nil;
B4IMap* _img = nil;
B4ISwitchWrapper* _rbimage = nil;
B4IImageViewWrapper* _image = nil;
B4ILabelWrapper* _lblimage = nil;
b4i_imagedownloader* _imdown = nil;
B4ILabelWrapper* _divid = nil;
B4IButtonWrapper* _bt = nil;
B4IButtonWrapper* _btcancel = nil;
 //BA.debugLineNum = 1318;BA.debugLine="Sub LoadOptions(attr As List)";
 //BA.debugLineNum = 1320;BA.debugLine="If attr.IsInitialized = False Then Return";
if ([_attr IsInitialized]==[self.__c False]) { 
if (true) return @"";};
 //BA.debugLineNum = 1321;BA.debugLine="If attr.Size = 0 Then Return";
if ([_attr Size]==0) { 
if (true) return @"";};
 //BA.debugLineNum = 1323;BA.debugLine="btnoptions.Visible = True";
[self._btnoptions setVisible:[self.__c True]];
 //BA.debugLineNum = 1324;BA.debugLine="btnoptions.BringToFront";
[self._btnoptions BringToFront];
 //BA.debugLineNum = 1326;BA.debugLine="pnlOptions.SetLayoutAnimated(500,1,0,pnlOptions.H";
[self._pnloptions SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :[self._pnloptions Height] :[self._pnloptions Width] :[self._pnloptions Height]];
 //BA.debugLineNum = 1327;BA.debugLine="btnoptions.SetLayoutAnimated(800,1,btnoptions.Lef";
[self._btnoptions SetLayoutAnimated:(int) (800) :(float) (1) :[self._btnoptions Left] :(float) ([self._library _getheight]-[self._btnoptions Height]-[self.__c DipToCurrent:(int) (40)]) :[self._btnoptions Width] :[self._btnoptions Height]];
 //BA.debugLineNum = 1329;BA.debugLine="topOptions = 3dip";
self._topoptions = [self.__c DipToCurrent:(int) (3)];
 //BA.debugLineNum = 1331;BA.debugLine="Dim lblHeader As Label";
_lblheader = [B4ILabelWrapper new];
 //BA.debugLineNum = 1332;BA.debugLine="lblHeader.Initialize(\"\")";
[_lblheader Initialize:self.bi :@""];
 //BA.debugLineNum = 1333;BA.debugLine="lblHeader.Color = Colors.White";
[_lblheader setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1335;BA.debugLine="lblHeader.Font = Library.GetFont(14)";
[_lblheader setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1336;BA.debugLine="lblHeader.TextColor = Colors.Gray";
[_lblheader setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1337;BA.debugLine="lblHeader.Text = Library.GetStringResourse(\"optio";
[_lblheader setText:[self._library _getstringresourse:@"options"]];
 //BA.debugLineNum = 1338;BA.debugLine="lblHeader.TextAlignment = Library.GetStringResour";
[_lblheader setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1339;BA.debugLine="Library.PaddingLabel(lblHeader,10,0,10,0)";
[self._library _paddinglabel:_lblheader :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 1340;BA.debugLine="svOptions.Panel.AddView(lblHeader,0,topOptions +";
[[self._svoptions Panel] AddView:(UIView*)((_lblheader).object) :(float) (0) :(float) (self._topoptions+20) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1341;BA.debugLine="topOptions = topOptions + lblHeader.Height+13dip";
self._topoptions = (int) (self._topoptions+[_lblheader Height]+[self.__c DipToCurrent:(int) (13)]);
 //BA.debugLineNum = 1342;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Height +";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (60)])];
 //BA.debugLineNum = 1344;BA.debugLine="For i = 0 To attr.Size - 1";
{
const int step19 = 1;
const int limit19 = (int) ([_attr Size]-1);
_i = (int) (0) ;
for (;(step19 > 0 && _i <= limit19) || (step19 < 0 && _i >= limit19) ;_i = ((int)(0 + _i + step19))  ) {
 //BA.debugLineNum = 1346;BA.debugLine="Dim OptionType As Map";
_optiontype = [B4IMap new];
 //BA.debugLineNum = 1347;BA.debugLine="Dim OptionValue As List";
_optionvalue = [B4IList new];
 //BA.debugLineNum = 1349;BA.debugLine="OptionType = attr.Get(i)";
_optiontype = (B4IMap*)([_attr Get:_i]);
 //BA.debugLineNum = 1350;BA.debugLine="OptionValue = OptionType.Get(\"option_value\")";
_optionvalue.object = (NSArray*)([_optiontype Get:(NSObject*)(@"option_value")]);
 //BA.debugLineNum = 1352;BA.debugLine="Dim lblKey As Label";
_lblkey = [B4ILabelWrapper new];
 //BA.debugLineNum = 1353;BA.debugLine="lblKey.Initialize(\"\")";
[_lblkey Initialize:self.bi :@""];
 //BA.debugLineNum = 1354;BA.debugLine="lblKey.Color = Library.Theme_Header";
[_lblkey setColor:self._library._theme_header];
 //BA.debugLineNum = 1355;BA.debugLine="lblKey.Font = Library.GetFont(14)";
[_lblkey setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1356;BA.debugLine="lblKey.TextColor = Colors.White";
[_lblkey setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1357;BA.debugLine="lblKey.Text = \"  \" & OptionType.Get(\"name\") & \"";
[_lblkey setText:[@[@"  ",[self.bi ObjectToString:[_optiontype Get:(NSObject*)(@"name")]],@" ",[self._library _getstringresourse:[@[@"request_state_",[self.bi ObjectToString:[_optiontype Get:(NSObject*)(@"required")]]] componentsJoinedByString:@""]],@"  "] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1358;BA.debugLine="lblKey.Text = lblKey.Text.Replace(\"&amp;\",\"&\")";
[_lblkey setText:[[_lblkey Text] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 1359;BA.debugLine="lblKey.TextAlignment = Library.GetStringResourse";
[_lblkey setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1360;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
[self._library _paddinglabel:_lblkey :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 1362;BA.debugLine="svOptions.Panel.AddView(lblKey,0,topOptions+10di";
[[self._svoptions Panel] AddView:(UIView*)((_lblkey).object) :(float) (0) :(float) (self._topoptions+[self.__c DipToCurrent:(int) (10)]) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1364;BA.debugLine="topOptions = topOptions + 55dip";
self._topoptions = (int) (self._topoptions+[self.__c DipToCurrent:(int) (55)]);
 //BA.debugLineNum = 1365;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Height";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (43)])];
 //BA.debugLineNum = 1367;BA.debugLine="Dim sp1 As Picker";
_sp1 = [B4IPickerWrapper new];
 //BA.debugLineNum = 1368;BA.debugLine="sp1.Initialize(\"\")";
[_sp1 Initialize:self.bi :@""];
 //BA.debugLineNum = 1370;BA.debugLine="Dim lsData As List";
_lsdata = [B4IList new];
 //BA.debugLineNum = 1371;BA.debugLine="lsData.Initialize";
[_lsdata Initialize];
 //BA.debugLineNum = 1373;BA.debugLine="Dim pDefault As Panel";
_pdefault = [B4IPanelWrapper new];
 //BA.debugLineNum = 1374;BA.debugLine="Dim blnAddPanel As Boolean";
_blnaddpanel = false;
 //BA.debugLineNum = 1375;BA.debugLine="Dim TopRB As Int = 0";
_toprb = (int) (0);
 //BA.debugLineNum = 1376;BA.debugLine="pDefault.Initialize(\"\")";
[_pdefault Initialize:self.bi :@""];
 //BA.debugLineNum = 1378;BA.debugLine="If OptionType.Get(\"type\") = \"text\" Or OptionType";
if ([[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"text")] || [[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"file")] || [[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"textarea")] || [[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"time")] || [[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"date")] || [[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"datetime")]) { 
 //BA.debugLineNum = 1380;BA.debugLine="Dim txt1 As TextField";
_txt1 = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 1381;BA.debugLine="txt1.Initialize(\"txtoption\")";
[_txt1 Initialize:self.bi :@"txtoption"];
 //BA.debugLineNum = 1382;BA.debugLine="txt1.Font = Library.GetFont(14)";
[_txt1 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1383;BA.debugLine="txt1.Color = Colors.White";
[_txt1 setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1384;BA.debugLine="txt1.SetBorder(1,Colors.Gray,5)";
[_txt1 SetBorder:(float) (1) :[[self.__c Colors] Gray] :(float) (5)];
 //BA.debugLineNum = 1385;BA.debugLine="txt1.Tag = CreateMap(\"ID\":OptionType.Get(\"produ";
[_txt1 setTag:(NSObject*)([self.__c createMap:@[(NSObject*)(@"ID"),[_optiontype Get:(NSObject*)(@"product_option_id")],(NSObject*)(@"Val"),(NSObject*)(@""),(NSObject*)(@"Type"),[_optiontype Get:(NSObject*)(@"type")],(NSObject*)(@"Index"),(NSObject*)(@([self._listoptions Size]-1))]])];
 //BA.debugLineNum = 1386;BA.debugLine="ListOptions.Add(txt1)";
[self._listoptions Add:(NSObject*)((_txt1).object)];
 //BA.debugLineNum = 1388;BA.debugLine="If OptionType.Get(\"type\") = \"textarea\" Then";
if ([[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"textarea")]) { 
 //BA.debugLineNum = 1389;BA.debugLine="svOptions.Panel.AddView(txt1,10,topOptions,Lib";
[[self._svoptions Panel] AddView:(UIView*)((_txt1).object) :(float) (10) :(float) (self._topoptions) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-20) :(float) ([self.__c DipToCurrent:(int) (120)])];
 //BA.debugLineNum = 1390;BA.debugLine="topOptions = topOptions + 128dip";
self._topoptions = (int) (self._topoptions+[self.__c DipToCurrent:(int) (128)]);
 //BA.debugLineNum = 1391;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Heigh";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (128)])];
 //BA.debugLineNum = 1393;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 1394;BA.debugLine="txt1.TextAlignment = txt1.ALIGNMENT_RIGHT";
[_txt1 setTextAlignment:[_txt1 ALIGNMENT_RIGHT]];
 }else {
 //BA.debugLineNum = 1396;BA.debugLine="txt1.TextAlignment = txt1.ALIGNMENT_LEFT";
[_txt1 setTextAlignment:[_txt1 ALIGNMENT_LEFT]];
 };
 }else {
 //BA.debugLineNum = 1399;BA.debugLine="svOptions.Panel.AddView(txt1,10,topOptions,Lib";
[[self._svoptions Panel] AddView:(UIView*)((_txt1).object) :(float) (10) :(float) (self._topoptions) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-20) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1400;BA.debugLine="topOptions = topOptions + 48dip";
self._topoptions = (int) (self._topoptions+[self.__c DipToCurrent:(int) (48)]);
 //BA.debugLineNum = 1401;BA.debugLine="txt1.TextAlignment = Library.GetStringResourse";
[_txt1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1402;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Heigh";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (48)])];
 };
 //BA.debugLineNum = 1405;BA.debugLine="Continue";
if (true) continue;
 };
 //BA.debugLineNum = 1409;BA.debugLine="For j = 0 To OptionValue.Size - 1";
{
const int step69 = 1;
const int limit69 = (int) ([_optionvalue Size]-1);
_j = (int) (0) ;
for (;(step69 > 0 && _j <= limit69) || (step69 < 0 && _j >= limit69) ;_j = ((int)(0 + _j + step69))  ) {
 //BA.debugLineNum = 1410;BA.debugLine="Dim attrs As Map";
_attrs = [B4IMap new];
 //BA.debugLineNum = 1411;BA.debugLine="attrs = OptionValue.Get(j)";
_attrs = (B4IMap*)([_optionvalue Get:_j]);
 //BA.debugLineNum = 1413;BA.debugLine="If OptionType.Get(\"type\") = \"radio\" Then";
if ([[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"radio")]) { 
 //BA.debugLineNum = 1415;BA.debugLine="Dim rb1 As Switch";
_rb1 = [B4ISwitchWrapper new];
 //BA.debugLineNum = 1416;BA.debugLine="rb1.Initialize(\"\")";
[_rb1 Initialize:self.bi :@""];
 //BA.debugLineNum = 1418;BA.debugLine="Dim price_format As String";
_price_format = @"";
 //BA.debugLineNum = 1419;BA.debugLine="price_format = attrs.Get(\"price_formated\")";
_price_format = [self.bi ObjectToString:[_attrs Get:(NSObject*)(@"price_formated")]];
 //BA.debugLineNum = 1420;BA.debugLine="If price_format = \"false\" Then price_format =";
if ([_price_format isEqual:@"false"]) { 
_price_format = @"";};
 //BA.debugLineNum = 1422;BA.debugLine="rb1.Tag = CreateMap(\"ID\":OptionType.Get(\"produ";
[_rb1 setTag:(NSObject*)([self.__c createMap:@[(NSObject*)(@"ID"),[_optiontype Get:(NSObject*)(@"product_option_id")],(NSObject*)(@"Val"),[_attrs Get:(NSObject*)(@"product_option_value_id")]]])];
 //BA.debugLineNum = 1424;BA.debugLine="ListOptions.Add(rb1)";
[self._listoptions Add:(NSObject*)((_rb1).object)];
 //BA.debugLineNum = 1426;BA.debugLine="If blnAddPanel = False Then";
if (_blnaddpanel==[self.__c False]) { 
 //BA.debugLineNum = 1427;BA.debugLine="svOptions.Panel.AddView(pDefault,0,topOptions";
[[self._svoptions Panel] AddView:(UIView*)((_pdefault).object) :(float) (0) :(float) (self._topoptions) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 };
 //BA.debugLineNum = 1430;BA.debugLine="blnAddPanel = True";
_blnaddpanel = [self.__c True];
 //BA.debugLineNum = 1432;BA.debugLine="Dim lb2 As Label";
_lb2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 1433;BA.debugLine="lb2.Initialize(\"\")";
[_lb2 Initialize:self.bi :@""];
 //BA.debugLineNum = 1434;BA.debugLine="lb2.Text = \"  \" & attrs.Get(\"name\") & \" ( \" &";
[_lb2 setText:[@[@"  ",[self.bi ObjectToString:[_attrs Get:(NSObject*)(@"name")]],@" ( ",[self.bi ObjectToString:[_attrs Get:(NSObject*)(@"price_prefix")]],_price_format,@" )"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1435;BA.debugLine="lb2.TextColor = Colors.Black";
[_lb2 setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 1436;BA.debugLine="lb2.Font = Library.GetFont(14)";
[_lb2 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1437;BA.debugLine="lb2.TextAlignment = Library.GetStringResourse(";
[_lb2 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1439;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 1440;BA.debugLine="pDefault.AddView(lb2,0,TopRB,Library.GetWidth";
[_pdefault AddView:(UIView*)((_lb2).object) :(float) (0) :(float) (_toprb) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[self.__c DipToCurrent:(int) (60)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1441;BA.debugLine="pDefault.AddView(rb1,Library.GetWidth-20dip-6";
[_pdefault AddView:(UIView*)((_rb1).object) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[self.__c DipToCurrent:(int) (60)]) :(float) (_toprb) :(float) ([self.__c DipToCurrent:(int) (40)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 }else {
 //BA.debugLineNum = 1443;BA.debugLine="pDefault.AddView(lb2,70dip,TopRB-4,Library.Ge";
[_pdefault AddView:(UIView*)((_lb2).object) :(float) ([self.__c DipToCurrent:(int) (70)]) :(float) (_toprb-4) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[self.__c DipToCurrent:(int) (60)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1444;BA.debugLine="pDefault.AddView(rb1,10,TopRB,Library.GetWidt";
[_pdefault AddView:(UIView*)((_rb1).object) :(float) (10) :(float) (_toprb) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-20) :(float) ([self.__c DipToCurrent:(int) (40)])];
 };
 //BA.debugLineNum = 1447;BA.debugLine="topOptions = topOptions + 40dip";
self._topoptions = (int) (self._topoptions+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1448;BA.debugLine="TopRB = TopRB + 40dip";
_toprb = (int) (_toprb+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1449;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Heigh";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (48)])];
 //BA.debugLineNum = 1450;BA.debugLine="pDefault.Height = pDefault.Height + 48dip";
[_pdefault setHeight:(float) ([_pdefault Height]+[self.__c DipToCurrent:(int) (48)])];
 }else if([[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"checkbox")]) { 
 //BA.debugLineNum = 1454;BA.debugLine="Dim ck1 As Switch";
_ck1 = [B4ISwitchWrapper new];
 //BA.debugLineNum = 1455;BA.debugLine="ck1.Initialize(\"\")";
[_ck1 Initialize:self.bi :@""];
 //BA.debugLineNum = 1456;BA.debugLine="ck1.Tag = CreateMap(\"ID\":OptionType.Get(\"produ";
[_ck1 setTag:(NSObject*)([self.__c createMap:@[(NSObject*)(@"ID"),[_optiontype Get:(NSObject*)(@"product_option_id")],(NSObject*)(@"Val"),[_attrs Get:(NSObject*)(@"product_option_value_id")]]])];
 //BA.debugLineNum = 1457;BA.debugLine="ListOptions.Add(ck1)";
[self._listoptions Add:(NSObject*)((_ck1).object)];
 //BA.debugLineNum = 1459;BA.debugLine="Dim pr As String";
_pr = @"";
 //BA.debugLineNum = 1460;BA.debugLine="pr = attrs.Get(\"price_formated\")";
_pr = [self.bi ObjectToString:[_attrs Get:(NSObject*)(@"price_formated")]];
 //BA.debugLineNum = 1461;BA.debugLine="If pr = \"false\" Then pr = \" \"";
if ([_pr isEqual:@"false"]) { 
_pr = @" ";};
 //BA.debugLineNum = 1463;BA.debugLine="Dim lb21 As Label";
_lb21 = [B4ILabelWrapper new];
 //BA.debugLineNum = 1464;BA.debugLine="lb21.Initialize(\"\")";
[_lb21 Initialize:self.bi :@""];
 //BA.debugLineNum = 1465;BA.debugLine="lb21.Text = \"  \" & attrs.Get(\"name\") & \" ( \" &";
[_lb21 setText:[@[@"  ",[self.bi ObjectToString:[_attrs Get:(NSObject*)(@"name")]],@" ( ",[self.bi ObjectToString:[_attrs Get:(NSObject*)(@"price_prefix")]],[self.bi ObjectToString:[_attrs Get:(NSObject*)(@"price_formated")]],@" )"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1466;BA.debugLine="lb21.TextColor = Colors.Black";
[_lb21 setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 1467;BA.debugLine="lb21.Font= Library.GetFont(14)";
[_lb21 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1469;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 1470;BA.debugLine="lb21.TextAlignment = lb21.ALIGNMENT_RIGHT";
[_lb21 setTextAlignment:[_lb21 ALIGNMENT_RIGHT]];
 //BA.debugLineNum = 1471;BA.debugLine="svOptions.Panel.AddView(lb21,0,topOptions,Lib";
[[self._svoptions Panel] AddView:(UIView*)((_lb21).object) :(float) (0) :(float) (self._topoptions) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (38)]-[self.__c DipToCurrent:(int) (40)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1472;BA.debugLine="svOptions.Panel.AddView(ck1,Library.GetWidth-";
[[self._svoptions Panel] AddView:(UIView*)((_ck1).object) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[self.__c DipToCurrent:(int) (60)]) :(float) (self._topoptions) :(float) ([self.__c DipToCurrent:(int) (40)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 }else {
 //BA.debugLineNum = 1474;BA.debugLine="lb21.TextAlignment = lb21.ALIGNMENT_LEFT";
[_lb21 setTextAlignment:[_lb21 ALIGNMENT_LEFT]];
 //BA.debugLineNum = 1475;BA.debugLine="svOptions.Panel.AddView(lb21,70dip,topOptions";
[[self._svoptions Panel] AddView:(UIView*)((_lb21).object) :(float) ([self.__c DipToCurrent:(int) (70)]) :(float) (self._topoptions-5) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (38)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1476;BA.debugLine="svOptions.Panel.AddView(ck1,10,topOptions,Lib";
[[self._svoptions Panel] AddView:(UIView*)((_ck1).object) :(float) (10) :(float) (self._topoptions) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-20) :(float) ([self.__c DipToCurrent:(int) (40)])];
 };
 //BA.debugLineNum = 1479;BA.debugLine="topOptions = topOptions + 40dip";
self._topoptions = (int) (self._topoptions+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1480;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Heigh";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (58)])];
 }else if([[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"select")]) { 
 //BA.debugLineNum = 1484;BA.debugLine="Dim attrs1 As Map";
_attrs1 = [B4IMap new];
 //BA.debugLineNum = 1485;BA.debugLine="attrs1 = OptionValue.Get(j)";
_attrs1 = (B4IMap*)([_optionvalue Get:_j]);
 //BA.debugLineNum = 1487;BA.debugLine="Dim pr As String";
_pr = @"";
 //BA.debugLineNum = 1488;BA.debugLine="pr = attrs1.Get(\"price_formated\")";
_pr = [self.bi ObjectToString:[_attrs1 Get:(NSObject*)(@"price_formated")]];
 //BA.debugLineNum = 1489;BA.debugLine="If pr = \"false\" Then pr = \" )\"";
if ([_pr isEqual:@"false"]) { 
_pr = @" )";};
 //BA.debugLineNum = 1491;BA.debugLine="lsData.Add(attrs1.Get(\"name\") & \" ( \" & attrs1";
[_lsdata Add:(NSObject*)([@[[self.bi ObjectToString:[_attrs1 Get:(NSObject*)(@"name")]],@" ( ",[self.bi ObjectToString:[_attrs1 Get:(NSObject*)(@"price_prefix")]],_pr,@" )"] componentsJoinedByString:@""])];
 //BA.debugLineNum = 1497;BA.debugLine="sp1.Tag = CreateMap(\"Vals\" : OptionValue,\"id\"";
[_sp1 setTag:(NSObject*)([self.__c createMap:@[(NSObject*)(@"Vals"),(NSObject*)((_optionvalue).object),(NSObject*)(@"id"),[_optiontype Get:(NSObject*)(@"product_option_id")],(NSObject*)(@"Val"),[_attrs Get:(NSObject*)(@"product_option_value_id")]]])];
 //BA.debugLineNum = 1498;BA.debugLine="ListOptions.Add(sp1)";
[self._listoptions Add:(NSObject*)((_sp1).object)];
 //BA.debugLineNum = 1499;BA.debugLine="svOptions.Panel.AddView(sp1,10,lblKey.Height";
[[self._svoptions Panel] AddView:(UIView*)((_sp1).object) :(float) (10) :(float) ([_lblkey Height]+[_lblkey Top]+[self.__c DipToCurrent:(int) (20)]) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-20) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1500;BA.debugLine="topOptions = topOptions + 40dip";
self._topoptions = (int) (self._topoptions+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1501;BA.debugLine="topOptions = topOptions";
self._topoptions = self._topoptions;
 //BA.debugLineNum = 1502;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Heig";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (48)])];
 }else if([[_optiontype Get:(NSObject*)(@"type")] isEqual:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 1507;BA.debugLine="Dim imageMap As Map";
_imagemap = [B4IMap new];
 //BA.debugLineNum = 1508;BA.debugLine="imageMap.Initialize";
[_imagemap Initialize];
 //BA.debugLineNum = 1510;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 1511;BA.debugLine="img = OptionValue.Get(j)";
_img = (B4IMap*)([_optionvalue Get:_j]);
 //BA.debugLineNum = 1513;BA.debugLine="Dim rbimage As Switch";
_rbimage = [B4ISwitchWrapper new];
 //BA.debugLineNum = 1514;BA.debugLine="rbimage.Initialize(\"\")";
[_rbimage Initialize:self.bi :@""];
 //BA.debugLineNum = 1515;BA.debugLine="rbimage.Tag = CreateMap(\"ID\":OptionType.Get(\"p";
[_rbimage setTag:(NSObject*)([self.__c createMap:@[(NSObject*)(@"ID"),[_optiontype Get:(NSObject*)(@"product_option_id")],(NSObject*)(@"Val"),[_attrs Get:(NSObject*)(@"product_option_value_id")]]])];
 //BA.debugLineNum = 1517;BA.debugLine="Dim image As ImageView";
_image = [B4IImageViewWrapper new];
 //BA.debugLineNum = 1518;BA.debugLine="image.Initialize(\"\")";
[_image Initialize:self.bi :@""];
 //BA.debugLineNum = 1520;BA.debugLine="Dim lblImage As Label";
_lblimage = [B4ILabelWrapper new];
 //BA.debugLineNum = 1521;BA.debugLine="lblImage.Initialize(\"\")";
[_lblimage Initialize:self.bi :@""];
 //BA.debugLineNum = 1522;BA.debugLine="lblImage.Font = Library.GetFont(14)";
[_lblimage setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1523;BA.debugLine="lblImage.TextColor = Colors.Black";
[_lblimage setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 1524;BA.debugLine="lblImage.Text = \"  \" & img.Get(\"name\") & \" ( \"";
[_lblimage setText:[@[@"  ",[self.bi ObjectToString:[_img Get:(NSObject*)(@"name")]],@" ( ",[self.bi ObjectToString:[_img Get:(NSObject*)(@"price_prefix")]],@" )"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1526;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 1527;BA.debugLine="svOptions.Panel.AddView(rbimage,Library.GetWi";
[[self._svoptions Panel] AddView:(UIView*)((_rbimage).object) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[self.__c DipToCurrent:(int) (58)]) :(float) (self._topoptions) :(float) ([self.__c DipToCurrent:(int) (34)]) :(float) ([self.__c DipToCurrent:(int) (34)])];
 //BA.debugLineNum = 1528;BA.debugLine="svOptions.Panel.AddView(image,Library.GetWidt";
[[self._svoptions Panel] AddView:(UIView*)((_image).object) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[self.__c DipToCurrent:(int) (58)]-[self.__c DipToCurrent:(int) (38)]) :(float) (self._topoptions) :(float) ([self.__c DipToCurrent:(int) (34)]) :(float) ([self.__c DipToCurrent:(int) (34)])];
 //BA.debugLineNum = 1529;BA.debugLine="svOptions.Panel.AddView(lblImage,0,topOptions";
[[self._svoptions Panel] AddView:(UIView*)((_lblimage).object) :(float) (0) :(float) (self._topoptions) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[self.__c DipToCurrent:(int) (58)]-[self.__c DipToCurrent:(int) (38)]) :(float) ([self.__c DipToCurrent:(int) (43)])];
 //BA.debugLineNum = 1530;BA.debugLine="lblImage.TextAlignment = lblImage.ALIGNMENT_R";
[_lblimage setTextAlignment:[_lblimage ALIGNMENT_RIGHT]];
 }else {
 //BA.debugLineNum = 1532;BA.debugLine="svOptions.Panel.AddView(rbimage,10,topOptions";
[[self._svoptions Panel] AddView:(UIView*)((_rbimage).object) :(float) (10) :(float) (self._topoptions) :(float) ([self.__c DipToCurrent:(int) (34)]) :(float) ([self.__c DipToCurrent:(int) (34)])];
 //BA.debugLineNum = 1533;BA.debugLine="svOptions.Panel.AddView(image,rbimage.Left +";
[[self._svoptions Panel] AddView:(UIView*)((_image).object) :(float) ([_rbimage Left]+[_rbimage Width]) :(float) (self._topoptions) :(float) ([self.__c DipToCurrent:(int) (34)]) :(float) ([self.__c DipToCurrent:(int) (34)])];
 //BA.debugLineNum = 1534;BA.debugLine="svOptions.Panel.AddView(lblImage,image.Left +";
[[self._svoptions Panel] AddView:(UIView*)((_lblimage).object) :(float) ([_image Left]+[_image Width]) :(float) (self._topoptions) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-[_image Width]-([_image Width])-14) :(float) ([self.__c DipToCurrent:(int) (43)])];
 };
 //BA.debugLineNum = 1539;BA.debugLine="Dim imdown As ImageDownloader";
_imdown = [b4i_imagedownloader new];
 //BA.debugLineNum = 1540;BA.debugLine="imdown.Initialize";
[_imdown _initialize:self.bi];
 //BA.debugLineNum = 1541;BA.debugLine="imdown.Download(CreateMap(image:img.Get(\"image";
[_imdown _download:[self.__c createMap:@[(NSObject*)((_image).object),[_img Get:(NSObject*)(@"image")]]]];
 //BA.debugLineNum = 1543;BA.debugLine="ListOptions.Add(rbimage)";
[self._listoptions Add:(NSObject*)((_rbimage).object)];
 //BA.debugLineNum = 1545;BA.debugLine="topOptions = topOptions + 37dip";
self._topoptions = (int) (self._topoptions+[self.__c DipToCurrent:(int) (37)]);
 //BA.debugLineNum = 1546;BA.debugLine="topOptions = topOptions";
self._topoptions = self._topoptions;
 //BA.debugLineNum = 1547;BA.debugLine="svOptions.Panel.Height = svOptions.Panel.Heigh";
[[self._svoptions Panel] setHeight:(float) ([[self._svoptions Panel] Height]+[self.__c DipToCurrent:(int) (48)])];
 };
 }
};
 //BA.debugLineNum = 1553;BA.debugLine="sp1.SetItems(0,lsData)";
[_sp1 SetItems:(int) (0) :_lsdata];
 }
};
 //BA.debugLineNum = 1557;BA.debugLine="Dim divid As Label";
_divid = [B4ILabelWrapper new];
 //BA.debugLineNum = 1558;BA.debugLine="divid.Initialize(\"\")";
[_divid Initialize:self.bi :@""];
 //BA.debugLineNum = 1559;BA.debugLine="divid.Color = Colors.RGB(212,212,212)";
[_divid setColor:[[self.__c Colors] RGB:(int) (212) :(int) (212) :(int) (212)]];
 //BA.debugLineNum = 1561;BA.debugLine="Dim bt As Button";
_bt = [B4IButtonWrapper new];
 //BA.debugLineNum = 1562;BA.debugLine="bt.InitializeCustom(\"lbladd2cart\",Colors.White,Co";
[_bt InitializeCustom:@"lbladd2cart" :self.bi :[[self.__c Colors] White] :[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1563;BA.debugLine="Library.GetButtonState(bt)";
[self._library _getbuttonstate:_bt];
 //BA.debugLineNum = 1564;BA.debugLine="bt.Text = Library.GetStringResourse(\"add2cartbtn\"";
[_bt setText:[self._library _getstringresourse:@"add2cartbtn"]];
 //BA.debugLineNum = 1565;BA.debugLine="bt.CustomLabel.Font = Library.GetFont(14)";
[[_bt CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1567;BA.debugLine="Dim btcancel As Button";
_btcancel = [B4IButtonWrapper new];
 //BA.debugLineNum = 1568;BA.debugLine="btcancel.InitializeCustom(\"btnback_options\",Color";
[_btcancel InitializeCustom:@"btnback_options" :self.bi :[[self.__c Colors] White] :[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1569;BA.debugLine="Library.GetButtonState(btcancel)";
[self._library _getbuttonstate:_btcancel];
 //BA.debugLineNum = 1570;BA.debugLine="btcancel.Text = Library.GetStringResourse(\"cancel";
[_btcancel setText:[self._library _getstringresourse:@"cancel"]];
 //BA.debugLineNum = 1571;BA.debugLine="btcancel.CustomLabel.Font = Library.GetFont(14)";
[[_btcancel CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1573;BA.debugLine="svOptions.Panel.AddView(divid,10,topOptions + 4,L";
[[self._svoptions Panel] AddView:(UIView*)((_divid).object) :(float) (10) :(float) (self._topoptions+4) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]-20) :(float) (1)];
 //BA.debugLineNum = 1574;BA.debugLine="svOptions.Panel.AddView(bt,0,topOptions+30dip,120";
[[self._svoptions Panel] AddView:(UIView*)((_bt).object) :(float) (0) :(float) (self._topoptions+[self.__c DipToCurrent:(int) (30)]) :(float) ([self.__c DipToCurrent:(int) (120)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1575;BA.debugLine="svOptions.Panel.AddView(btcancel,svOptions.Panel.";
[[self._svoptions Panel] AddView:(UIView*)((_btcancel).object) :(float) ([[self._svoptions Panel] Width]-[self.__c DipToCurrent:(int) (140)]) :(float) (self._topoptions+[self.__c DipToCurrent:(int) (30)]) :(float) ([self.__c DipToCurrent:(int) (120)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1578;BA.debugLine="svOptions.ContentWidth = svOptions.Width";
[self._svoptions setContentWidth:(int) ([self._svoptions Width])];
 //BA.debugLineNum = 1579;BA.debugLine="svOptions.ContentHeight = topOptions+300";
[self._svoptions setContentHeight:(int) (self._topoptions+300)];
 //BA.debugLineNum = 1581;BA.debugLine="End Sub";
return @"";
}
- (int)  _loadproducthorizontalscroll:(B4IList*) _res :(B4IScrollView*) _scrollview1{
int _left = 0;
B4IArray* _dimension = nil;
int _i = 0;
B4IMap* _temp = nil;
 //BA.debugLineNum = 1937;BA.debugLine="Sub LoadProductHorizontalScroll(res As List,Scroll";
 //BA.debugLineNum = 1939;BA.debugLine="Dim left As Int = 20";
_left = (int) (20);
 //BA.debugLineNum = 1941;BA.debugLine="Dim Dimension() As Int";
_dimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
 //BA.debugLineNum = 1942;BA.debugLine="Dimension = Library.GetParentPanelDimension(\"frmp";
_dimension = [self._library _getparentpaneldimension:@"frmproduct_template"];
 //BA.debugLineNum = 1944;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step4 = 1;
const int limit4 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4) ;_i = ((int)(0 + _i + step4))  ) {
 //BA.debugLineNum = 1946;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 1947;BA.debugLine="temp = res.Get(i)";
_temp = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 1949;BA.debugLine="AddProduct2Panel(ScrollView1,left,Dimension,temp";
[self _addproduct2panel:_scrollview1 :_left :_dimension :_temp];
 //BA.debugLineNum = 1951;BA.debugLine="left = left + Dimension(0) + 10dip";
_left = (int) (_left+((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+[self.__c DipToCurrent:(int) (10)]);
 }
};
 //BA.debugLineNum = 1955;BA.debugLine="ScrollView1.Panel.Width = left";
[[_scrollview1 Panel] setWidth:(float) (_left)];
 //BA.debugLineNum = 1956;BA.debugLine="ScrollView1.ContentWidth = left";
[_scrollview1 setContentWidth:_left];
 //BA.debugLineNum = 1958;BA.debugLine="Return Dimension(0)";
if (true) return ((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue;
 //BA.debugLineNum = 1960;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _loadreviews{
B4IMap* _reviewsmap = nil;
B4IList* _reviews = nil;
int _topreviews = 0;
b4i_html* _html1 = nil;
int _j = 0;
B4IMap* _m1 = nil;
B4IPanelWrapper* _p1 = nil;
int _rating1 = 0;
B4IButtonWrapper* _btnbackre = nil;
 //BA.debugLineNum = 782;BA.debugLine="Sub LoadReviews";
 //BA.debugLineNum = 785;BA.debugLine="If product.ContainsKey(\"reviews\") Then";
if ([self._product ContainsKey:(NSObject*)(@"reviews")]) { 
 //BA.debugLineNum = 787;BA.debugLine="Dim reviewsMap As Map = product.Get(\"reviews\")";
_reviewsmap = (B4IMap*)([self._product Get:(NSObject*)(@"reviews")]);
 //BA.debugLineNum = 788;BA.debugLine="Dim reviews As List";
_reviews = [B4IList new];
 //BA.debugLineNum = 789;BA.debugLine="reviews = reviewsMap.Get(\"reviews\")";
_reviews.object = (NSArray*)([_reviewsmap Get:(NSObject*)(@"reviews")]);
 //BA.debugLineNum = 791;BA.debugLine="If reviews.IsInitialized Then";
if ([_reviews IsInitialized]) { 
 //BA.debugLineNum = 793;BA.debugLine="Dim topReviews As Int";
_topreviews = 0;
 //BA.debugLineNum = 794;BA.debugLine="Dim html1 As Html";
_html1 = [b4i_html new];
 //BA.debugLineNum = 795;BA.debugLine="html1.Initialize";
[_html1 _initialize:self.bi];
 //BA.debugLineNum = 797;BA.debugLine="For j = 0 To reviews.Size - 1";
{
const int step9 = 1;
const int limit9 = (int) ([_reviews Size]-1);
_j = (int) (0) ;
for (;(step9 > 0 && _j <= limit9) || (step9 < 0 && _j >= limit9) ;_j = ((int)(0 + _j + step9))  ) {
 //BA.debugLineNum = 799;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 800;BA.debugLine="m1 = reviews.Get(j)";
_m1 = (B4IMap*)([_reviews Get:_j]);
 //BA.debugLineNum = 802;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 803;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 805;BA.debugLine="svReviews.Panel.AddView(p1,0,topReviews,svRevi";
[[self._svreviews Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (_topreviews) :[self._svreviews Width] :(float) (0)];
 //BA.debugLineNum = 806;BA.debugLine="p1.LoadLayout(\"frmtemplate_comment\")";
[_p1 LoadLayout:@"frmtemplate_comment" :self.bi];
 //BA.debugLineNum = 807;BA.debugLine="p1.height = pnlitem_comment.height + 4";
[_p1 setHeight:(float) ([self._pnlitem_comment Height]+4)];
 //BA.debugLineNum = 809;BA.debugLine="Library.LabelSpace(lblcomment_review,1.5)";
[self._library _labelspace:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblcomment_review).object)] :(float) (1.5)];
 //BA.debugLineNum = 811;BA.debugLine="lblauthor.Text = m1.Get(\"author\")";
[self._lblauthor setText:[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"author")]]];
 //BA.debugLineNum = 813;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 814;BA.debugLine="lbldate_comment.Text = Library.GetDate(m1.Get";
[self._lbldate_comment setText:[self._library _getdate:[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"date_added")]]]];
 //BA.debugLineNum = 815;BA.debugLine="lblcomment_review.TextAlignment = lblcomment_";
[self._lblcomment_review setTextAlignment:[self._lblcomment_review ALIGNMENT_RIGHT]];
 }else {
 //BA.debugLineNum = 817;BA.debugLine="lbldate_comment.Text = m1.Get(\"date_added\")";
[self._lbldate_comment setText:[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"date_added")]]];
 //BA.debugLineNum = 818;BA.debugLine="lblcomment_review.TextAlignment = lblcomment_";
[self._lblcomment_review setTextAlignment:[self._lblcomment_review ALIGNMENT_LEFT]];
 };
 //BA.debugLineNum = 821;BA.debugLine="lblcomment_review.Text = html1.FromHtml(m1.Get";
[self._lblcomment_review setText:[_html1 _fromhtml:[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"text")]]]];
 //BA.debugLineNum = 822;BA.debugLine="lblnumber.Text = j + 1";
[self._lblnumber setText:[self.bi NumberToString:@(_j+1)]];
 //BA.debugLineNum = 824;BA.debugLine="topReviews = topReviews + p1.height";
_topreviews = (int) (_topreviews+[_p1 Height]);
 //BA.debugLineNum = 826;BA.debugLine="If j = 0 Then topReview = topReviews - p1.heig";
if (_j==0) { 
self._topreview = (int) (_topreviews-[_p1 Height]);};
 //BA.debugLineNum = 830;BA.debugLine="Dim rating1 As Int";
_rating1 = 0;
 //BA.debugLineNum = 831;BA.debugLine="rating1 = m1.Get(\"rating\")";
_rating1 = [self.bi ObjectToNumber:[_m1 Get:(NSObject*)(@"rating")]].intValue;
 //BA.debugLineNum = 833;BA.debugLine="Library.SetFont(lblcommentstar1,\"icomoon\",lblc";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblcommentstar1).object)] :@"icomoon" :(int) ([[self._lblcommentstar1 Font] Size])];
 //BA.debugLineNum = 834;BA.debugLine="Library.SetFont(lblcommentstar2,\"icomoon\",lblc";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblcommentstar2).object)] :@"icomoon" :(int) ([[self._lblcommentstar1 Font] Size])];
 //BA.debugLineNum = 835;BA.debugLine="Library.SetFont(lblcommentstar3,\"icomoon\",lblc";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblcommentstar3).object)] :@"icomoon" :(int) ([[self._lblcommentstar1 Font] Size])];
 //BA.debugLineNum = 836;BA.debugLine="Library.SetFont(lblcommentstar4,\"icomoon\",lblc";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblcommentstar4).object)] :@"icomoon" :(int) ([[self._lblcommentstar1 Font] Size])];
 //BA.debugLineNum = 837;BA.debugLine="Library.SetFont(lblcommentstar5,\"icomoon\",lblc";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblcommentstar5).object)] :@"icomoon" :(int) ([[self._lblcommentstar1 Font] Size])];
 //BA.debugLineNum = 839;BA.debugLine="If rating1 = \"0\" Then";
if (_rating1==[self.bi ObjectToNumber:@"0"].doubleValue) { 
 //BA.debugLineNum = 840;BA.debugLine="lblcommentstar1.Text = \"\"";
[self._lblcommentstar1 setText:@""];
 //BA.debugLineNum = 841;BA.debugLine="lblcommentstar2.Text = \"\"";
[self._lblcommentstar2 setText:@""];
 //BA.debugLineNum = 842;BA.debugLine="lblcommentstar3.Text = \"\"";
[self._lblcommentstar3 setText:@""];
 //BA.debugLineNum = 843;BA.debugLine="lblcommentstar4.Text = \"\"";
[self._lblcommentstar4 setText:@""];
 //BA.debugLineNum = 844;BA.debugLine="lblcommentstar5.Text = \"\"";
[self._lblcommentstar5 setText:@""];
 }else if(_rating1==[self.bi ObjectToNumber:@"1"].doubleValue) { 
 //BA.debugLineNum = 847;BA.debugLine="lblcommentstar1.Text = \"\"";
[self._lblcommentstar1 setText:@""];
 //BA.debugLineNum = 848;BA.debugLine="lblcommentstar2.Text = \"\"";
[self._lblcommentstar2 setText:@""];
 //BA.debugLineNum = 849;BA.debugLine="lblcommentstar3.Text = \"\"";
[self._lblcommentstar3 setText:@""];
 //BA.debugLineNum = 850;BA.debugLine="lblcommentstar4.Text = \"\"";
[self._lblcommentstar4 setText:@""];
 //BA.debugLineNum = 851;BA.debugLine="lblcommentstar5.Text = \"\"";
[self._lblcommentstar5 setText:@""];
 }else if(_rating1==[self.bi ObjectToNumber:@"2"].doubleValue) { 
 //BA.debugLineNum = 854;BA.debugLine="lblcommentstar1.Text = \"\"";
[self._lblcommentstar1 setText:@""];
 //BA.debugLineNum = 855;BA.debugLine="lblcommentstar2.Text = \"\"";
[self._lblcommentstar2 setText:@""];
 //BA.debugLineNum = 856;BA.debugLine="lblcommentstar3.Text = \"\"";
[self._lblcommentstar3 setText:@""];
 //BA.debugLineNum = 857;BA.debugLine="lblcommentstar4.Text = \"\"";
[self._lblcommentstar4 setText:@""];
 //BA.debugLineNum = 858;BA.debugLine="lblcommentstar5.Text = \"\"";
[self._lblcommentstar5 setText:@""];
 }else if(_rating1==[self.bi ObjectToNumber:@"3"].doubleValue) { 
 //BA.debugLineNum = 861;BA.debugLine="lblcommentstar1.Text = \"\"";
[self._lblcommentstar1 setText:@""];
 //BA.debugLineNum = 862;BA.debugLine="lblcommentstar2.Text = \"\"";
[self._lblcommentstar2 setText:@""];
 //BA.debugLineNum = 863;BA.debugLine="lblcommentstar3.Text = \"\"";
[self._lblcommentstar3 setText:@""];
 //BA.debugLineNum = 864;BA.debugLine="lblcommentstar4.Text = \"\"";
[self._lblcommentstar4 setText:@""];
 //BA.debugLineNum = 865;BA.debugLine="lblcommentstar5.Text = \"\"";
[self._lblcommentstar5 setText:@""];
 }else if(_rating1==[self.bi ObjectToNumber:@"4"].doubleValue) { 
 //BA.debugLineNum = 868;BA.debugLine="lblcommentstar1.Text = \"\"";
[self._lblcommentstar1 setText:@""];
 //BA.debugLineNum = 869;BA.debugLine="lblcommentstar2.Text = \"\"";
[self._lblcommentstar2 setText:@""];
 //BA.debugLineNum = 870;BA.debugLine="lblcommentstar3.Text = \"\"";
[self._lblcommentstar3 setText:@""];
 //BA.debugLineNum = 871;BA.debugLine="lblcommentstar4.Text = \"\"";
[self._lblcommentstar4 setText:@""];
 //BA.debugLineNum = 872;BA.debugLine="lblcommentstar5.Text = \"\"";
[self._lblcommentstar5 setText:@""];
 }else if(_rating1==[self.bi ObjectToNumber:@"5"].doubleValue || _rating1>5) { 
 //BA.debugLineNum = 875;BA.debugLine="lblcommentstar1.Text = \"\"";
[self._lblcommentstar1 setText:@""];
 //BA.debugLineNum = 876;BA.debugLine="lblcommentstar2.Text = \"\"";
[self._lblcommentstar2 setText:@""];
 //BA.debugLineNum = 877;BA.debugLine="lblcommentstar3.Text = \"\"";
[self._lblcommentstar3 setText:@""];
 //BA.debugLineNum = 878;BA.debugLine="lblcommentstar4.Text = \"\"";
[self._lblcommentstar4 setText:@""];
 //BA.debugLineNum = 879;BA.debugLine="lblcommentstar5.Text = \"\"";
[self._lblcommentstar5 setText:@""];
 };
 }
};
 };
 //BA.debugLineNum = 888;BA.debugLine="Dim btnbackre As Button";
_btnbackre = [B4IButtonWrapper new];
 //BA.debugLineNum = 889;BA.debugLine="btnbackre.InitializeCustom(\"btnbackreviews\",Colo";
[_btnbackre InitializeCustom:@"btnbackreviews" :self.bi :[[self.__c Colors] White] :[[self.__c Colors] Gray]];
 //BA.debugLineNum = 890;BA.debugLine="btnreview.InitializeCustom(\"btnreview\",Colors.Wh";
[self._btnreview InitializeCustom:@"btnreview" :self.bi :[[self.__c Colors] White] :[[self.__c Colors] Gray]];
 //BA.debugLineNum = 892;BA.debugLine="topReviews = topReviews + 15";
_topreviews = (int) (_topreviews+15);
 //BA.debugLineNum = 894;BA.debugLine="svReviews.Panel.AddView(btnbackre,0,topReviews,1";
[[self._svreviews Panel] AddView:(UIView*)((_btnbackre).object) :(float) (0) :(float) (_topreviews) :(float) ([self.__c DipToCurrent:(int) (120)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 895;BA.debugLine="topReviews = topReviews + 45dip";
_topreviews = (int) (_topreviews+[self.__c DipToCurrent:(int) (45)]);
 //BA.debugLineNum = 896;BA.debugLine="svReviews.Panel.AddView(btnreview,0,topReviews,1";
[[self._svreviews Panel] AddView:(UIView*)((self._btnreview).object) :(float) (0) :(float) (_topreviews) :(float) ([self.__c DipToCurrent:(int) (120)]) :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 898;BA.debugLine="btnbackre.Color = Library.ConvertHex2Int(Library";
[_btnbackre setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 899;BA.debugLine="btnbackre.SetBorder(1,Colors.Gray,5)";
[_btnbackre SetBorder:(float) (1) :[[self.__c Colors] Gray] :(float) (5)];
 //BA.debugLineNum = 901;BA.debugLine="btnbackre.Color = Library.ConvertHex2Int(Library";
[_btnbackre setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 902;BA.debugLine="btnbackre.SetBorder(1,Library.ConvertHex2Int(Lib";
[_btnbackre SetBorder:(float) (1) :[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue :(float) (5)];
 //BA.debugLineNum = 903;BA.debugLine="btnbackre.Text = Library.GetStringResourse(\"back";
[_btnbackre setText:[self._library _getstringresourse:@"back"]];
 //BA.debugLineNum = 904;BA.debugLine="btnbackre.CustomLabel.TextColor = Colors.White";
[[_btnbackre CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 905;BA.debugLine="btnbackre.CustomLabel.Font = Library.GetFont(14)";
[[_btnbackre CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 906;BA.debugLine="Library.CenterView(btnbackre,Library.ProductPage";
[self._library _centerview:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_btnbackre).object)] :(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._library._productpage RootPanel]).object)]];
 //BA.debugLineNum = 908;BA.debugLine="btnreview.Color = Library.ConvertHex2Int(Library";
[self._btnreview setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 909;BA.debugLine="btnreview.SetBorder(1,Library.ConvertHex2Int(Lib";
[self._btnreview SetBorder:(float) (1) :[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue :(float) (5)];
 //BA.debugLineNum = 910;BA.debugLine="btnreview.Text = Library.GetStringResourse(\"revi";
[self._btnreview setText:[[self._library _getstringresourse:@"review"] Replace:@"[0]" :@""]];
 //BA.debugLineNum = 911;BA.debugLine="btnreview.CustomLabel.TextColor = Colors.White";
[[self._btnreview CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 912;BA.debugLine="btnreview.CustomLabel.Font = Library.GetFont(14)";
[[self._btnreview CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 913;BA.debugLine="Library.CenterView(btnreview,Library.ProductPage";
[self._library _centerview:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnreview).object)] :(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._library._productpage RootPanel]).object)]];
 //BA.debugLineNum = 915;BA.debugLine="svReviews.Panel.height = topReviews + 75dip";
[[self._svreviews Panel] setHeight:(float) (_topreviews+[self.__c DipToCurrent:(int) (75)])];
 //BA.debugLineNum = 916;BA.debugLine="svReviews.ContentHeight = topReviews + 75dip";
[self._svreviews setContentHeight:(int) (_topreviews+[self.__c DipToCurrent:(int) (75)])];
 //BA.debugLineNum = 917;BA.debugLine="svReviews.ContentWidth = Library.GetWidth";
[self._svreviews setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 918;BA.debugLine="svReviews.Height = Library.GetHeight";
[self._svreviews setHeight:(float) ([self._library _getheight])];
 };
 //BA.debugLineNum = 922;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _makedatedialog:(NSString*) _year :(NSString*) _month :(NSString*) _day{
NSString* _currday = @"";
NSString* _currmonth = @"";
NSString* _curryear = @"";
NSString* _date1 = @"";
B4IArray* _date2 = nil;
B4IList* _lsyear = nil;
B4IList* _lsmonth = nil;
B4IList* _lsday = nil;
int _month_index = 0;
int _day_index = 0;
int _year_index = 0;
int _i = 0;
int _sfrom = 0;
int _sto = 0;
int _j = 0;
int _s = 0;
NSString* _tem = @"";
 //BA.debugLineNum = 2042;BA.debugLine="Sub MakeDateDialog(Year As String,Month As String,";
 //BA.debugLineNum = 2044;BA.debugLine="pnlcustomdialog.LoadLayout(\"frmdatetime\")";
[self._pnlcustomdialog LoadLayout:@"frmdatetime" :self.bi];
 //BA.debugLineNum = 2046;BA.debugLine="Dim currday,currmonth,curryear As String";
_currday = @"";
_currmonth = @"";
_curryear = @"";
 //BA.debugLineNum = 2048;BA.debugLine="lblyear.Text = Library.GetStringResourse(\"year\")";
[self._lblyear setText:[self._library _getstringresourse:@"year"]];
 //BA.debugLineNum = 2049;BA.debugLine="lblmonth.Text = Library.GetStringResourse(\"month\"";
[self._lblmonth setText:[self._library _getstringresourse:@"month"]];
 //BA.debugLineNum = 2050;BA.debugLine="lblday.Text = Library.GetStringResourse(\"day\")";
[self._lblday setText:[self._library _getstringresourse:@"day"]];
 //BA.debugLineNum = 2052;BA.debugLine="lblyear.TextAlignment = Library.GetStringResourse";
[self._lblyear setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 2053;BA.debugLine="lblmonth.TextAlignment = Library.GetStringResours";
[self._lblmonth setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 2054;BA.debugLine="lblday.TextAlignment = Library.GetStringResourse(";
[self._lblday setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 2056;BA.debugLine="btnok_date.Text = Library.GetStringResourse(\"ok\")";
[self._btnok_date setText:[self._library _getstringresourse:@"ok"]];
 //BA.debugLineNum = 2057;BA.debugLine="btncancel_date.Text = Library.GetStringResourse(\"";
[self._btncancel_date setText:[self._library _getstringresourse:@"cancel"]];
 //BA.debugLineNum = 2058;BA.debugLine="Library.GetButtonState(btncancel_date)";
[self._library _getbuttonstate:self._btncancel_date];
 //BA.debugLineNum = 2059;BA.debugLine="Library.GetButtonState(btnok_date)";
[self._library _getbuttonstate:self._btnok_date];
 //BA.debugLineNum = 2061;BA.debugLine="lblyear.Font = Library.GetFont(14)";
[self._lblyear setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 2062;BA.debugLine="lblmonth.Font = Library.GetFont(14)";
[self._lblmonth setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 2063;BA.debugLine="lblday.Font = Library.GetFont(14)";
[self._lblday setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 2065;BA.debugLine="If Year = 0 And Month = 0 And Day = 0 Then";
if ([_year isEqual:[self.bi NumberToString:@(0)]] && [_month isEqual:[self.bi NumberToString:@(0)]] && [_day isEqual:[self.bi NumberToString:@(0)]]) { 
 //BA.debugLineNum = 2066;BA.debugLine="If Library.IsPersian = False Then";
if ([self._library _ispersian]==[self.__c False]) { 
 //BA.debugLineNum = 2067;BA.debugLine="currday = DateTime.GetDayOfMonth(DateTime.Now)";
_currday = [self.bi NumberToString:@([[self.__c DateTime] GetDayOfMonth:[[self.__c DateTime] Now]])];
 //BA.debugLineNum = 2068;BA.debugLine="currmonth = DateTime.GetMonth(DateTime.Now)";
_currmonth = [self.bi NumberToString:@([[self.__c DateTime] GetMonth:[[self.__c DateTime] Now]])];
 //BA.debugLineNum = 2069;BA.debugLine="curryear = DateTime.GetYear(DateTime.Now)";
_curryear = [self.bi NumberToString:@([[self.__c DateTime] GetYear:[[self.__c DateTime] Now]])];
 }else {
 //BA.debugLineNum = 2071;BA.debugLine="Dim date1,date2() As String";
_date1 = @"";
_date2 = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
 //BA.debugLineNum = 2072;BA.debugLine="date1 = Library.Julian2Persian(DateTime.GetYear";
_date1 = [self._library _julian2persian:[[self.__c DateTime] GetYear:[[self.__c DateTime] Now]] :[[self.__c DateTime] GetMonth:[[self.__c DateTime] Now]] :[[self.__c DateTime] GetDayOfMonth:[[self.__c DateTime] Now]] :@"/"];
 //BA.debugLineNum = 2073;BA.debugLine="date2 = Regex.Split(\"/\",date1)";
_date2 = [[self.__c Regex] Split:@"/" :_date1];
 //BA.debugLineNum = 2074;BA.debugLine="currday = date2(2)";
_currday = ((NSString*)[_date2 getObjectFast:(int) (2)]);
 //BA.debugLineNum = 2075;BA.debugLine="currmonth = date2(1)";
_currmonth = ((NSString*)[_date2 getObjectFast:(int) (1)]);
 //BA.debugLineNum = 2076;BA.debugLine="curryear = date2(0)";
_curryear = ((NSString*)[_date2 getObjectFast:(int) (0)]);
 };
 }else {
 //BA.debugLineNum = 2079;BA.debugLine="currday = Day";
_currday = _day;
 //BA.debugLineNum = 2080;BA.debugLine="currmonth = Month";
_currmonth = _month;
 //BA.debugLineNum = 2081;BA.debugLine="curryear = Year";
_curryear = _year;
 };
 //BA.debugLineNum = 2084;BA.debugLine="Dim lsyear,lsmonth,lsday As List";
_lsyear = [B4IList new];
_lsmonth = [B4IList new];
_lsday = [B4IList new];
 //BA.debugLineNum = 2085;BA.debugLine="lsyear.Initialize";
[_lsyear Initialize];
 //BA.debugLineNum = 2086;BA.debugLine="lsmonth.Initialize";
[_lsmonth Initialize];
 //BA.debugLineNum = 2087;BA.debugLine="lsday.Initialize";
[_lsday Initialize];
 //BA.debugLineNum = 2089;BA.debugLine="Dim month_index,day_index,year_index As Int";
_month_index = 0;
_day_index = 0;
_year_index = 0;
 //BA.debugLineNum = 2091;BA.debugLine="For i = 1 To 31";
{
const int step39 = 1;
const int limit39 = (int) (31);
_i = (int) (1) ;
for (;(step39 > 0 && _i <= limit39) || (step39 < 0 && _i >= limit39) ;_i = ((int)(0 + _i + step39))  ) {
 //BA.debugLineNum = 2092;BA.debugLine="If i < 13 Then";
if (_i<13) { 
 //BA.debugLineNum = 2094;BA.debugLine="lsmonth.Add(i)";
[_lsmonth Add:(NSObject*)(@(_i))];
 //BA.debugLineNum = 2096;BA.debugLine="If i = currmonth And currmonth <> 0 Then";
if (_i==[self.bi ObjectToNumber:_currmonth].doubleValue && [_currmonth isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 2097;BA.debugLine="month_index = i-1";
_month_index = (int) (_i-1);
 }else if(_i==[self.bi ObjectToNumber:_currmonth].doubleValue) { 
 //BA.debugLineNum = 2099;BA.debugLine="month_index = i-1";
_month_index = (int) (_i-1);
 };
 };
 //BA.debugLineNum = 2104;BA.debugLine="lsday.Add(i)";
[_lsday Add:(NSObject*)(@(_i))];
 //BA.debugLineNum = 2106;BA.debugLine="If i = currday And currday <> 0 Then";
if (_i==[self.bi ObjectToNumber:_currday].doubleValue && [_currday isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 2107;BA.debugLine="day_index = i-1";
_day_index = (int) (_i-1);
 }else if(_i==[self.bi ObjectToNumber:_currday].doubleValue) { 
 //BA.debugLineNum = 2109;BA.debugLine="day_index = i-1";
_day_index = (int) (_i-1);
 };
 }
};
 //BA.debugLineNum = 2114;BA.debugLine="Dim sFrom As Int = 1900";
_sfrom = (int) (1900);
 //BA.debugLineNum = 2115;BA.debugLine="Dim sTo As Int = 2090";
_sto = (int) (2090);
 //BA.debugLineNum = 2117;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 2118;BA.debugLine="sFrom = 1350";
_sfrom = (int) (1350);
 //BA.debugLineNum = 2119;BA.debugLine="sTo = 1900";
_sto = (int) (1900);
 };
 //BA.debugLineNum = 2122;BA.debugLine="For j = sFrom To sTo";
{
const int step61 = 1;
const int limit61 = _sto;
_j = _sfrom ;
for (;(step61 > 0 && _j <= limit61) || (step61 < 0 && _j >= limit61) ;_j = ((int)(0 + _j + step61))  ) {
 //BA.debugLineNum = 2123;BA.debugLine="lsyear.Add(j)";
[_lsyear Add:(NSObject*)(@(_j))];
 }
};
 //BA.debugLineNum = 2126;BA.debugLine="txtyear.SetItems(0,lsyear)";
[self._txtyear SetItems:(int) (0) :_lsyear];
 //BA.debugLineNum = 2128;BA.debugLine="txtmonth.SetItems(0,lsmonth)";
[self._txtmonth SetItems:(int) (0) :_lsmonth];
 //BA.debugLineNum = 2129;BA.debugLine="txtmonth.SelectRow(0,month_index,True)";
[self._txtmonth SelectRow:(int) (0) :_month_index :[self.__c True]];
 //BA.debugLineNum = 2131;BA.debugLine="txtday.SetItems(0,lsday)";
[self._txtday SetItems:(int) (0) :_lsday];
 //BA.debugLineNum = 2132;BA.debugLine="txtday.SelectRow(0,day_index,True)";
[self._txtday SelectRow:(int) (0) :_day_index :[self.__c True]];
 //BA.debugLineNum = 2134;BA.debugLine="For s = 0 To txtyear.GetItems(0).Size - 1";
{
const int step69 = 1;
const int limit69 = (int) ([[self._txtyear GetItems:(int) (0)] Size]-1);
_s = (int) (0) ;
for (;(step69 > 0 && _s <= limit69) || (step69 < 0 && _s >= limit69) ;_s = ((int)(0 + _s + step69))  ) {
 //BA.debugLineNum = 2136;BA.debugLine="Dim tem As String";
_tem = @"";
 //BA.debugLineNum = 2137;BA.debugLine="tem = txtyear.GetItems(0).Get(s)";
_tem = [self.bi ObjectToString:[[self._txtyear GetItems:(int) (0)] Get:_s]];
 //BA.debugLineNum = 2139;BA.debugLine="If tem = curryear Then";
if ([_tem isEqual:_curryear]) { 
 //BA.debugLineNum = 2140;BA.debugLine="year_index = s";
_year_index = _s;
 }else if([[[self._txtyear GetItems:(int) (0)] Get:_s] isEqual:(NSObject*)(_curryear)]) { 
 //BA.debugLineNum = 2142;BA.debugLine="year_index = s";
_year_index = _s;
 };
 }
};
 //BA.debugLineNum = 2147;BA.debugLine="txtyear.SelectRow(0,year_index,True)";
[self._txtyear SelectRow:(int) (0) :_year_index :[self.__c True]];
 //BA.debugLineNum = 2149;BA.debugLine="pnlcustomdialog.BringToFront";
[self._pnlcustomdialog BringToFront];
 //BA.debugLineNum = 2150;BA.debugLine="pnlcustomdialog.Visible = True";
[self._pnlcustomdialog setVisible:[self.__c True]];
 //BA.debugLineNum = 2152;BA.debugLine="Library.ProductPage.ResignFocus";
[self._library._productpage ResignFocus];
 //BA.debugLineNum = 2154;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _maketimedialog:(NSString*) _hour :(NSString*) _minute :(NSString*) _second{
NSString* _currsecond = @"";
NSString* _currminute = @"";
NSString* _currhour = @"";
B4IList* _lshour = nil;
B4IList* _lsminute = nil;
B4IList* _lssecond = nil;
int _hour_index = 0;
int _minute_index = 0;
int _second_index = 0;
int _i = 0;
 //BA.debugLineNum = 2172;BA.debugLine="Sub MakeTimeDialog(Hour As String,Minute As String";
 //BA.debugLineNum = 2174;BA.debugLine="pnlcustomdialog.LoadLayout(\"frmtime\")";
[self._pnlcustomdialog LoadLayout:@"frmtime" :self.bi];
 //BA.debugLineNum = 2176;BA.debugLine="Dim currsecond,currminute,currhour As String";
_currsecond = @"";
_currminute = @"";
_currhour = @"";
 //BA.debugLineNum = 2178;BA.debugLine="lblhour.Text = Library.GetStringResourse(\"hour\")";
[self._lblhour setText:[self._library _getstringresourse:@"hour"]];
 //BA.debugLineNum = 2179;BA.debugLine="lblminute.Text = Library.GetStringResourse(\"minut";
[self._lblminute setText:[self._library _getstringresourse:@"minute"]];
 //BA.debugLineNum = 2180;BA.debugLine="lblsecond.Text = Library.GetStringResourse(\"secon";
[self._lblsecond setText:[self._library _getstringresourse:@"second"]];
 //BA.debugLineNum = 2182;BA.debugLine="lblhour.TextAlignment = Library.GetStringResourse";
[self._lblhour setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 2183;BA.debugLine="lblminute.TextAlignment = Library.GetStringResour";
[self._lblminute setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 2184;BA.debugLine="lblsecond.TextAlignment = Library.GetStringResour";
[self._lblsecond setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 2186;BA.debugLine="btnok_time.Text = Library.GetStringResourse(\"ok\")";
[self._btnok_time setText:[self._library _getstringresourse:@"ok"]];
 //BA.debugLineNum = 2187;BA.debugLine="btncancel_time.Text = Library.GetStringResourse(\"";
[self._btncancel_time setText:[self._library _getstringresourse:@"cancel"]];
 //BA.debugLineNum = 2188;BA.debugLine="Library.GetButtonState(btncancel_time)";
[self._library _getbuttonstate:self._btncancel_time];
 //BA.debugLineNum = 2189;BA.debugLine="Library.GetButtonState(btnok_time)";
[self._library _getbuttonstate:self._btnok_time];
 //BA.debugLineNum = 2191;BA.debugLine="lblhour.Font = Library.GetFont(14)";
[self._lblhour setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 2192;BA.debugLine="lblminute.Font = Library.GetFont(14)";
[self._lblminute setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 2193;BA.debugLine="lblsecond.Font = Library.GetFont(14)";
[self._lblsecond setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 2195;BA.debugLine="If Hour = 0 And Minute = 0 And Second = 0 Then";
if ([_hour isEqual:[self.bi NumberToString:@(0)]] && [_minute isEqual:[self.bi NumberToString:@(0)]] && [_second isEqual:[self.bi NumberToString:@(0)]]) { 
 //BA.debugLineNum = 2196;BA.debugLine="currhour = DateTime.GetHour(DateTime.Now)";
_currhour = [self.bi NumberToString:@([[self.__c DateTime] GetHour:[[self.__c DateTime] Now]])];
 //BA.debugLineNum = 2197;BA.debugLine="currminute = DateTime.GetMinute(DateTime.Now)";
_currminute = [self.bi NumberToString:@([[self.__c DateTime] GetMinute:[[self.__c DateTime] Now]])];
 //BA.debugLineNum = 2198;BA.debugLine="currsecond = DateTime.GetSecond(DateTime.Now)";
_currsecond = [self.bi NumberToString:@([[self.__c DateTime] GetSecond:[[self.__c DateTime] Now]])];
 }else {
 //BA.debugLineNum = 2200;BA.debugLine="currhour = Hour";
_currhour = _hour;
 //BA.debugLineNum = 2201;BA.debugLine="currminute = Minute";
_currminute = _minute;
 //BA.debugLineNum = 2202;BA.debugLine="currsecond = Second";
_currsecond = _second;
 };
 //BA.debugLineNum = 2205;BA.debugLine="Dim lshour,lsminute,lssecond As List";
_lshour = [B4IList new];
_lsminute = [B4IList new];
_lssecond = [B4IList new];
 //BA.debugLineNum = 2206;BA.debugLine="lshour.Initialize";
[_lshour Initialize];
 //BA.debugLineNum = 2207;BA.debugLine="lsminute.Initialize";
[_lsminute Initialize];
 //BA.debugLineNum = 2208;BA.debugLine="lssecond.Initialize";
[_lssecond Initialize];
 //BA.debugLineNum = 2210;BA.debugLine="Dim hour_index,minute_index,second_index As Int";
_hour_index = 0;
_minute_index = 0;
_second_index = 0;
 //BA.debugLineNum = 2212;BA.debugLine="For i = 1 To 59";
{
const int step30 = 1;
const int limit30 = (int) (59);
_i = (int) (1) ;
for (;(step30 > 0 && _i <= limit30) || (step30 < 0 && _i >= limit30) ;_i = ((int)(0 + _i + step30))  ) {
 //BA.debugLineNum = 2214;BA.debugLine="If i < 13 Then";
if (_i<13) { 
 //BA.debugLineNum = 2216;BA.debugLine="lshour.Add(i)";
[_lshour Add:(NSObject*)(@(_i))];
 //BA.debugLineNum = 2218;BA.debugLine="If i = currhour And currhour <> 0 Then";
if (_i==[self.bi ObjectToNumber:_currhour].doubleValue && [_currhour isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 2219;BA.debugLine="hour_index = i-1";
_hour_index = (int) (_i-1);
 }else if(_i==[self.bi ObjectToNumber:_currhour].doubleValue) { 
 //BA.debugLineNum = 2221;BA.debugLine="hour_index = i-1";
_hour_index = (int) (_i-1);
 };
 };
 //BA.debugLineNum = 2226;BA.debugLine="lsminute.Add(i)";
[_lsminute Add:(NSObject*)(@(_i))];
 //BA.debugLineNum = 2227;BA.debugLine="lssecond.Add(i)";
[_lssecond Add:(NSObject*)(@(_i))];
 //BA.debugLineNum = 2229;BA.debugLine="If i = currsecond And currsecond <> 0 Then";
if (_i==[self.bi ObjectToNumber:_currsecond].doubleValue && [_currsecond isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 2230;BA.debugLine="second_index = i-1";
_second_index = (int) (_i-1);
 }else if(_i==[self.bi ObjectToNumber:_currsecond].doubleValue) { 
 //BA.debugLineNum = 2232;BA.debugLine="second_index = i-1";
_second_index = (int) (_i-1);
 };
 //BA.debugLineNum = 2235;BA.debugLine="If i = currminute And currminute <> 0 Then";
if (_i==[self.bi ObjectToNumber:_currminute].doubleValue && [_currminute isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 2236;BA.debugLine="minute_index = i-1";
_minute_index = (int) (_i-1);
 }else if(_i==[self.bi ObjectToNumber:_currsecond].doubleValue) { 
 //BA.debugLineNum = 2238;BA.debugLine="minute_index = i-1";
_minute_index = (int) (_i-1);
 };
 }
};
 //BA.debugLineNum = 2243;BA.debugLine="txthour.SetItems(0,lshour)";
[self._txthour SetItems:(int) (0) :_lshour];
 //BA.debugLineNum = 2244;BA.debugLine="txthour.SelectRow(0,hour_index,True)";
[self._txthour SelectRow:(int) (0) :_hour_index :[self.__c True]];
 //BA.debugLineNum = 2246;BA.debugLine="txtminute.SetItems(0,lsminute)";
[self._txtminute SetItems:(int) (0) :_lsminute];
 //BA.debugLineNum = 2247;BA.debugLine="txtminute.SelectRow(0,minute_index,True)";
[self._txtminute SelectRow:(int) (0) :_minute_index :[self.__c True]];
 //BA.debugLineNum = 2249;BA.debugLine="txtsecond.SetItems(0,lssecond)";
[self._txtsecond SetItems:(int) (0) :_lssecond];
 //BA.debugLineNum = 2250;BA.debugLine="txtsecond.SelectRow(0,second_index,True)";
[self._txtsecond SelectRow:(int) (0) :_second_index :[self.__c True]];
 //BA.debugLineNum = 2252;BA.debugLine="pnlcustomdialog.BringToFront";
[self._pnlcustomdialog BringToFront];
 //BA.debugLineNum = 2253;BA.debugLine="pnlcustomdialog.Visible = True";
[self._pnlcustomdialog setVisible:[self.__c True]];
 //BA.debugLineNum = 2254;BA.debugLine="Library.ProductPage.ResignFocus";
[self._library._productpage ResignFocus];
 //BA.debugLineNum = 2256;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pageproduct_appear{
 //BA.debugLineNum = 285;BA.debugLine="Sub pageProduct_Appear";
 //BA.debugLineNum = 286;BA.debugLine="GetCart";
[self _getcart];
 //BA.debugLineNum = 287;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pageproduct_disappear{
 //BA.debugLineNum = 289;BA.debugLine="Sub pageProduct_Disappear";
 //BA.debugLineNum = 290;BA.debugLine="offsetSlideshow = 1";
self._offsetslideshow = (int) (1);
 //BA.debugLineNum = 291;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pageproduct_resize:(int) _width :(int) _height{
 //BA.debugLineNum = 293;BA.debugLine="Sub pageProduct_Resize(Width As Int,Height As Int)";
 //BA.debugLineNum = 295;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnlover_click{
B4IPanelWrapper* _p1 = nil;
B4IPanelWrapper* _p2 = nil;
B4IMap* _temp = nil;
 //BA.debugLineNum = 1028;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 1030;BA.debugLine="Dim p1,p2 As Panel";
_p1 = [B4IPanelWrapper new];
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 1031;BA.debugLine="p1 = Sender";
_p1.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 1033;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.object = (B4IPanelView*)(([self._library _getparent:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_p1).object)]]).object);
 //BA.debugLineNum = 1034;BA.debugLine="p2.Visible = False";
[_p2 setVisible:[self.__c False]];
 //BA.debugLineNum = 1035;BA.debugLine="p2.Visible = True";
[_p2 setVisible:[self.__c True]];
 //BA.debugLineNum = 1037;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 1038;BA.debugLine="temp = p1.Tag";
_temp = (B4IMap*)([_p1 Tag]);
 //BA.debugLineNum = 1039;BA.debugLine="product = temp";
self._product = _temp;
 //BA.debugLineNum = 1040;BA.debugLine="top = 0";
self._top = (int) (0);
 //BA.debugLineNum = 1041;BA.debugLine="sv1.Panel.RemoveAllViews";
[[self._sv1 Panel] RemoveAllViews];
 //BA.debugLineNum = 1043;BA.debugLine="StartActivity";
[self _startactivity];
 //BA.debugLineNum = 1045;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnlqr_click{
 //BA.debugLineNum = 1921;BA.debugLine="Sub pnlqr_Click";
 //BA.debugLineNum = 1922;BA.debugLine="pnlQR.Visible = False";
[self._pnlqr setVisible:[self.__c False]];
 //BA.debugLineNum = 1923;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 5;BA.debugLine="Private tmrCicle As Timer";
self._tmrcicle = [B4ITimer new];
 //BA.debugLineNum = 6;BA.debugLine="Private IsDateTime As Boolean";
self._isdatetime = false;
 //BA.debugLineNum = 7;BA.debugLine="Public product As Map";
self._product = [B4IMap new];
 //BA.debugLineNum = 8;BA.debugLine="Private timerSlideshow As Timer";
self._timerslideshow = [B4ITimer new];
 //BA.debugLineNum = 9;BA.debugLine="Public IsOpenProduct As Boolean";
self._isopenproduct = false;
 //BA.debugLineNum = 11;BA.debugLine="Private btnqr As Button";
self._btnqr = [B4IButtonWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Dim progress As Panel";
self._progress = [B4IPanelWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private bullet As List";
self._bullet = [B4IList new];
 //BA.debugLineNum = 14;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private lblprice As Label";
self._lblprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private lbls1 As Label";
self._lbls1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private lbls2 As Label";
self._lbls2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private lbls3 As Label";
self._lbls3 = [B4ILabelWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private lbls4 As Label";
self._lbls4 = [B4ILabelWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Private lbls5 As Label";
self._lbls5 = [B4ILabelWrapper new];
 //BA.debugLineNum = 21;BA.debugLine="Private lblstate As Label";
self._lblstate = [B4ILabelWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private lblproducer As Label";
self._lblproducer = [B4ILabelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private lbldate As Label";
self._lbldate = [B4ILabelWrapper new];
 //BA.debugLineNum = 24;BA.debugLine="Private lblmodel As Label";
self._lblmodel = [B4ILabelWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private lblvisit As Label";
self._lblvisit = [B4ILabelWrapper new];
 //BA.debugLineNum = 26;BA.debugLine="Private btnreview As Button";
self._btnreview = [B4IButtonWrapper new];
 //BA.debugLineNum = 27;BA.debugLine="Private pnl2 As Panel";
self._pnl2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 28;BA.debugLine="Private pnl1 As Panel";
self._pnl1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 29;BA.debugLine="Dim listSlideshow As List";
self._listslideshow = [B4IList new];
 //BA.debugLineNum = 30;BA.debugLine="Dim offsetSlideshow As Int";
self._offsetslideshow = 0;
 //BA.debugLineNum = 31;BA.debugLine="Private lblratetitle As Label";
self._lblratetitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 32;BA.debugLine="Private lblstatetitle As Label";
self._lblstatetitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="Private lblproducertitle As Label";
self._lblproducertitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 34;BA.debugLine="Private lbldatetitle As Label";
self._lbldatetitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="Private lblmodeltitle As Label";
self._lblmodeltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 36;BA.debugLine="Private lblvisitcount As Label";
self._lblvisitcount = [B4ILabelWrapper new];
 //BA.debugLineNum = 37;BA.debugLine="Dim sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 38;BA.debugLine="Private lbldivider2 As Label";
self._lbldivider2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 39;BA.debugLine="Private lbldescription As WebView";
self._lbldescription = [B4IWebViewWrapper new];
 //BA.debugLineNum = 40;BA.debugLine="Dim details As OpenCart";
self._details = [b4i_opencart new];
 //BA.debugLineNum = 41;BA.debugLine="Private btnbookmark As Button";
self._btnbookmark = [B4IButtonWrapper new];
 //BA.debugLineNum = 42;BA.debugLine="Private lblbasket As Label";
self._lblbasket = [B4ILabelWrapper new];
 //BA.debugLineNum = 43;BA.debugLine="Private lblauthor As Label";
self._lblauthor = [B4ILabelWrapper new];
 //BA.debugLineNum = 44;BA.debugLine="Private lbldate_comment As Label";
self._lbldate_comment = [B4ILabelWrapper new];
 //BA.debugLineNum = 45;BA.debugLine="Private lblcomment_review As Label";
self._lblcomment_review = [B4ILabelWrapper new];
 //BA.debugLineNum = 46;BA.debugLine="Private pnlitem_comment As Panel";
self._pnlitem_comment = [B4IPanelWrapper new];
 //BA.debugLineNum = 47;BA.debugLine="Private lblcommentstar1 As Label";
self._lblcommentstar1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 48;BA.debugLine="Private lblcommentstar2 As Label";
self._lblcommentstar2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 49;BA.debugLine="Private lblcommentstar3 As Label";
self._lblcommentstar3 = [B4ILabelWrapper new];
 //BA.debugLineNum = 50;BA.debugLine="Private lblcommentstar4 As Label";
self._lblcommentstar4 = [B4ILabelWrapper new];
 //BA.debugLineNum = 51;BA.debugLine="Private lblcommentstar5 As Label";
self._lblcommentstar5 = [B4ILabelWrapper new];
 //BA.debugLineNum = 52;BA.debugLine="Private btnreviews As Button";
self._btnreviews = [B4IButtonWrapper new];
 //BA.debugLineNum = 53;BA.debugLine="Private topReview,topOptions,topAttr As Int";
self._topreview = 0;
self._topoptions = 0;
self._topattr = 0;
 //BA.debugLineNum = 54;BA.debugLine="Private lblnumber As Label";
self._lblnumber = [B4ILabelWrapper new];
 //BA.debugLineNum = 55;BA.debugLine="Private pnloverheader As Panel";
self._pnloverheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 56;BA.debugLine="Private lblheadername As Label";
self._lblheadername = [B4ILabelWrapper new];
 //BA.debugLineNum = 57;BA.debugLine="Private pnlheadert As Panel";
self._pnlheadert = [B4IPanelWrapper new];
 //BA.debugLineNum = 58;BA.debugLine="Dim top As Int";
self._top = 0;
 //BA.debugLineNum = 59;BA.debugLine="Private pnlheaderproduct As Panel";
self._pnlheaderproduct = [B4IPanelWrapper new];
 //BA.debugLineNum = 60;BA.debugLine="Private pnlads As Panel";
self._pnlads = [B4IPanelWrapper new];
 //BA.debugLineNum = 61;BA.debugLine="Private ListOptions As List";
self._listoptions = [B4IList new];
 //BA.debugLineNum = 62;BA.debugLine="Private lblattr As Label";
self._lblattr = [B4ILabelWrapper new];
 //BA.debugLineNum = 63;BA.debugLine="Private lbloptions As Label";
self._lbloptions = [B4ILabelWrapper new];
 //BA.debugLineNum = 64;BA.debugLine="Private slidemenu1 As SlideMenu";
self._slidemenu1 = [b4i_slidemenu new];
 //BA.debugLineNum = 65;BA.debugLine="Private lbladd2cart As Label";
self._lbladd2cart = [B4ILabelWrapper new];
 //BA.debugLineNum = 66;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 67;BA.debugLine="Private listBanner As List";
self._listbanner = [B4IList new];
 //BA.debugLineNum = 68;BA.debugLine="Private imgspecial As ImageView";
self._imgspecial = [B4IImageViewWrapper new];
 //BA.debugLineNum = 69;BA.debugLine="Private txtfocus As TextField";
self._txtfocus = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 70;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 71;BA.debugLine="Private FixPanelHeader As Boolean";
self._fixpanelheader = false;
 //BA.debugLineNum = 72;BA.debugLine="Dim pnlReviews,pnlAttribute,pnlBasket,pnlOptions";
self._pnlreviews = [B4IPanelWrapper new];
self._pnlattribute = [B4IPanelWrapper new];
self._pnlbasket = [B4IPanelWrapper new];
self._pnloptions = [B4IPanelWrapper new];
 //BA.debugLineNum = 73;BA.debugLine="Private svReviews,svAttribute,svOptions As Scroll";
self._svreviews = [B4IScrollView new];
self._svattribute = [B4IScrollView new];
self._svoptions = [B4IScrollView new];
 //BA.debugLineNum = 74;BA.debugLine="Private btnattributes As Button";
self._btnattributes = [B4IButtonWrapper new];
 //BA.debugLineNum = 75;BA.debugLine="Dim lblfloat_basket As Label";
self._lblfloat_basket = [B4ILabelWrapper new];
 //BA.debugLineNum = 76;BA.debugLine="Private TipTag,titleHelp As String";
self._tiptag = @"";
self._titlehelp = @"";
 //BA.debugLineNum = 77;BA.debugLine="Private btnshare As Button";
self._btnshare = [B4IButtonWrapper new];
 //BA.debugLineNum = 78;BA.debugLine="Private btnbasket As Button";
self._btnbasket = [B4IButtonWrapper new];
 //BA.debugLineNum = 80;BA.debugLine="Private btnsearch As Button";
self._btnsearch = [B4IButtonWrapper new];
 //BA.debugLineNum = 81;BA.debugLine="Private btnback As Button";
self._btnback = [B4IButtonWrapper new];
 //BA.debugLineNum = 82;BA.debugLine="Private pnlcircle As Panel";
self._pnlcircle = [B4IPanelWrapper new];
 //BA.debugLineNum = 83;BA.debugLine="Private lblpre_price As Label";
self._lblpre_price = [B4ILabelWrapper new];
 //BA.debugLineNum = 84;BA.debugLine="Private pnltimer As Panel";
self._pnltimer = [B4IPanelWrapper new];
 //BA.debugLineNum = 85;BA.debugLine="Private lblnum1 As Label";
self._lblnum1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 86;BA.debugLine="Private lblnum2 As Label";
self._lblnum2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 87;BA.debugLine="Private lblnum3 As Label";
self._lblnum3 = [B4ILabelWrapper new];
 //BA.debugLineNum = 88;BA.debugLine="Private pnlprice As Panel";
self._pnlprice = [B4IPanelWrapper new];
 //BA.debugLineNum = 90;BA.debugLine="Private timerSpecial As Timer";
self._timerspecial = [B4ITimer new];
 //BA.debugLineNum = 91;BA.debugLine="Dim SpecialDateInformation As Period";
self._specialdateinformation = [_period new];
 //BA.debugLineNum = 92;BA.debugLine="Private CurrentTimerSpecialWidth As Int";
self._currenttimerspecialwidth = 0;
 //BA.debugLineNum = 94;BA.debugLine="Private lblline2 As Label";
self._lblline2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 95;BA.debugLine="Private lblline1 As Label";
self._lblline1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 96;BA.debugLine="Private lblwonderfull As Label";
self._lblwonderfull = [B4ILabelWrapper new];
 //BA.debugLineNum = 97;BA.debugLine="Private lblnum4 As Label";
self._lblnum4 = [B4ILabelWrapper new];
 //BA.debugLineNum = 98;BA.debugLine="Private pnllistnumb As Panel";
self._pnllistnumb = [B4IPanelWrapper new];
 //BA.debugLineNum = 99;BA.debugLine="Private pnlQR As Panel";
self._pnlqr = [B4IPanelWrapper new];
 //BA.debugLineNum = 100;BA.debugLine="Dim slidepanel1 As ScrollView";
self._slidepanel1 = [B4IScrollView new];
 //BA.debugLineNum = 101;BA.debugLine="Private lblnext As Label";
self._lblnext = [B4ILabelWrapper new];
 //BA.debugLineNum = 102;BA.debugLine="Private pnlcustomdialog As Panel";
self._pnlcustomdialog = [B4IPanelWrapper new];
 //BA.debugLineNum = 103;BA.debugLine="Private lblmonth As Label";
self._lblmonth = [B4ILabelWrapper new];
 //BA.debugLineNum = 104;BA.debugLine="Private lblday As Label";
self._lblday = [B4ILabelWrapper new];
 //BA.debugLineNum = 105;BA.debugLine="Private lblyear As Label";
self._lblyear = [B4ILabelWrapper new];
 //BA.debugLineNum = 106;BA.debugLine="Private btnok_date As Button";
self._btnok_date = [B4IButtonWrapper new];
 //BA.debugLineNum = 107;BA.debugLine="Private btncancel_date As Button";
self._btncancel_date = [B4IButtonWrapper new];
 //BA.debugLineNum = 108;BA.debugLine="Private txtyear As Picker";
self._txtyear = [B4IPickerWrapper new];
 //BA.debugLineNum = 109;BA.debugLine="Private txtmonth As Picker";
self._txtmonth = [B4IPickerWrapper new];
 //BA.debugLineNum = 110;BA.debugLine="Private txtday As Picker";
self._txtday = [B4IPickerWrapper new];
 //BA.debugLineNum = 111;BA.debugLine="Private currentTextField As TextField";
self._currenttextfield = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 112;BA.debugLine="Private lblhour As Label";
self._lblhour = [B4ILabelWrapper new];
 //BA.debugLineNum = 113;BA.debugLine="Private lblminute As Label";
self._lblminute = [B4ILabelWrapper new];
 //BA.debugLineNum = 114;BA.debugLine="Private lblsecond As Label";
self._lblsecond = [B4ILabelWrapper new];
 //BA.debugLineNum = 115;BA.debugLine="Private pnldate_time As Panel";
self._pnldate_time = [B4IPanelWrapper new];
 //BA.debugLineNum = 116;BA.debugLine="Private pnldatetime As Panel";
self._pnldatetime = [B4IPanelWrapper new];
 //BA.debugLineNum = 117;BA.debugLine="Private txthour As Picker";
self._txthour = [B4IPickerWrapper new];
 //BA.debugLineNum = 118;BA.debugLine="Private txtminute As Picker";
self._txtminute = [B4IPickerWrapper new];
 //BA.debugLineNum = 119;BA.debugLine="Private txtsecond As Picker";
self._txtsecond = [B4IPickerWrapper new];
 //BA.debugLineNum = 120;BA.debugLine="Private btncancel_time As Button";
self._btncancel_time = [B4IButtonWrapper new];
 //BA.debugLineNum = 121;BA.debugLine="Private btnok_time As Button";
self._btnok_time = [B4IButtonWrapper new];
 //BA.debugLineNum = 122;BA.debugLine="Private btnoptions As Button";
self._btnoptions = [B4IButtonWrapper new];
 //BA.debugLineNum = 123;BA.debugLine="Private btnmore As Button";
self._btnmore = [B4IButtonWrapper new];
 //BA.debugLineNum = 124;BA.debugLine="Private wballdesc As WebView";
self._wballdesc = [B4IWebViewWrapper new];
 //BA.debugLineNum = 125;BA.debugLine="Private btnclose_wb As Button";
self._btnclose_wb = [B4IButtonWrapper new];
 //BA.debugLineNum = 126;BA.debugLine="Private pnlwb As Panel";
self._pnlwb = [B4IPanelWrapper new];
 //BA.debugLineNum = 127;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _relatedproduct_receive:(B4IList*) _res :(NSString*) _cat{
B4IList* _listoption = nil;
B4IScrollView* _svhproduct = nil;
 //BA.debugLineNum = 966;BA.debugLine="Sub RelatedProduct_receive(res As List,cat As Stri";
 //BA.debugLineNum = 968;BA.debugLine="Dim listoption As List";
_listoption = [B4IList new];
 //BA.debugLineNum = 969;BA.debugLine="listoption = product.Get(\"options\")";
_listoption.object = (NSArray*)([self._product Get:(NSObject*)(@"options")]);
 //BA.debugLineNum = 971;BA.debugLine="If listoption.IsInitialized Then";
if ([_listoption IsInitialized]) { 
 //BA.debugLineNum = 973;BA.debugLine="If listoption.Size > 0 Then";
if ([_listoption Size]>0) { 
 //BA.debugLineNum = 974;BA.debugLine="pnl2.Height = pnl2.Height - 660dip";
[self._pnl2 setHeight:(float) ([self._pnl2 Height]-[self.__c DipToCurrent:(int) (660)])];
 };
 //BA.debugLineNum = 977;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 20dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 981;BA.debugLine="If res.Size > 0 Then";
if ([_res Size]>0) { 
 //BA.debugLineNum = 982;BA.debugLine="Dim svhProduct As ScrollView";
_svhproduct = [B4IScrollView new];
 //BA.debugLineNum = 983;BA.debugLine="top = AddHeader(Library.GetStringResourse(\"rela";
self._top = [self _addheader:[self._library _getstringresourse:@"relat_product"] :@"newproduct" :(int) ([self._lbldescription Top]+[self._lbldescription Height]+[self._lbldescription Height]+[self.__c DipToCurrent:(int) (290)])];
 //BA.debugLineNum = 984;BA.debugLine="svhProduct.Initialize(\"\",Library.GetWidth,210di";
[_svhproduct Initialize:self.bi :@"" :[self._library _getwidth] :[self.__c DipToCurrent:(int) (210)]];
 //BA.debugLineNum = 985;BA.debugLine="svhProduct.ContentWidth = 1000";
[_svhproduct setContentWidth:(int) (1000)];
 //BA.debugLineNum = 986;BA.debugLine="svhProduct.ContentHeight = 210dip";
[_svhproduct setContentHeight:[self.__c DipToCurrent:(int) (210)]];
 //BA.debugLineNum = 987;BA.debugLine="sv1.Panel.AddView(svhProduct,0,top,sv1.Width,21";
[[self._sv1 Panel] AddView:(UIView*)((_svhproduct).object) :(float) (0) :(float) (self._top) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (210)])];
 //BA.debugLineNum = 988;BA.debugLine="top = top + LoadProductHorizontalScroll(res,svh";
self._top = (int) (self._top+[self _loadproducthorizontalscroll:_res :_svhproduct]+[self.__c DipToCurrent:(int) (70)]);
 };
 };
 //BA.debugLineNum = 993;BA.debugLine="sv1.Panel.Color = Colors.White";
[[self._sv1 Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 994;BA.debugLine="sv1.ContentHeight = sv1.Panel.GetView(sv1.Panel.N";
[self._sv1 setContentHeight:(int) ([[[self._sv1 Panel] GetView:(int) ([[self._sv1 Panel] NumberOfViews]-1)] Top]+[self.__c DipToCurrent:(int) (310)])];
 //BA.debugLineNum = 996;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _showoptionspanel{
 //BA.debugLineNum = 1308;BA.debugLine="Sub ShowOptionsPanel";
 //BA.debugLineNum = 1310;BA.debugLine="pnlOptions.Visible = True";
[self._pnloptions setVisible:[self.__c True]];
 //BA.debugLineNum = 1311;BA.debugLine="pnlOptions.top = pnlOptions.Height";
[self._pnloptions setTop:[self._pnloptions Height]];
 //BA.debugLineNum = 1312;BA.debugLine="pnlOptions.SetLayoutAnimated(500,1,0,0,pnlOptions";
[self._pnloptions SetLayoutAnimated:(int) (500) :(float) (1) :(float) (0) :(float) (0) :[self._pnloptions Width] :[self._pnloptions Height]];
 //BA.debugLineNum = 1313;BA.debugLine="btnoptions.SetLayoutAnimated(600,1,btnoptions.Lef";
[self._btnoptions SetLayoutAnimated:(int) (600) :(float) (1) :[self._btnoptions Left] :(float) ([self._library _getheight]+[self._btnoptions Height]) :[self._btnoptions Width] :[self._btnoptions Height]];
 //BA.debugLineNum = 1314;BA.debugLine="Library.ProductPage.ResignFocus";
[self._library._productpage ResignFocus];
 //BA.debugLineNum = 1316;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IViewWrapper* _v1 = nil;
B4IButtonWrapper* _b1 = nil;
B4ILabelWrapper* _l2 = nil;
B4IMap* _detailstemp = nil;
 //BA.debugLineNum = 129;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 131;BA.debugLine="ListOptions.Initialize";
[self._listoptions Initialize];
 //BA.debugLineNum = 132;BA.debugLine="Library.ProductPage.Initialize(\"pageProduct\")";
[self._library._productpage Initialize:self.bi :@"pageProduct"];
 //BA.debugLineNum = 133;BA.debugLine="Library.ProductPage.RootPanel.LoadLayout(\"frmprod";
[[self._library._productpage RootPanel] LoadLayout:@"frmproduct_sv" :self.bi];
 //BA.debugLineNum = 135;BA.debugLine="Library.SetFont(btnclose_wb,\"icomoon\",btnclose_wb";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose_wb).object)] :@"icomoon" :(int) ([[[self._btnclose_wb CustomLabel] Font] Size])];
 //BA.debugLineNum = 137;BA.debugLine="Library.RefererPage = Library.LastPage";
self._library._refererpage = self._library._lastpage;
 //BA.debugLineNum = 139;BA.debugLine="sv1.PagingEnabled = True";
[self._sv1 setPagingEnabled:[self.__c True]];
 //BA.debugLineNum = 140;BA.debugLine="sv1.SizeToFit";
[self._sv1 SizeToFit];
 //BA.debugLineNum = 142;BA.debugLine="If Library.IsEnglish Then";
if ([self._library _isenglish]) { 
 //BA.debugLineNum = 143;BA.debugLine="sv1.Panel.LoadLayout(\"frmproduct_en\")";
[[self._sv1 Panel] LoadLayout:@"frmproduct_en" :self.bi];
 //BA.debugLineNum = 144;BA.debugLine="btnback.Text = \"\"";
[self._btnback setText:@""];
 }else {
 //BA.debugLineNum = 146;BA.debugLine="sv1.Panel.LoadLayout(\"frmproduct\")";
[[self._sv1 Panel] LoadLayout:@"frmproduct" :self.bi];
 };
 //BA.debugLineNum = 149;BA.debugLine="Library.NavControl.ShowPage(Library.ProductPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._productpage).object)];
 //BA.debugLineNum = 151;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 152;BA.debugLine="sv1.Panel.Width = Library.GetWidth";
[[self._sv1 Panel] setWidth:(float) ([self._library _getwidth])];
 //BA.debugLineNum = 154;BA.debugLine="For Each v1 As View In sv1.Panel.GetAllViewsRecur";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group17 = [[self._sv1 Panel] GetAllViewsRecursive];
const int groupLen17 = group17.Size
;int index17 = 0;
;
for (; index17 < groupLen17;index17++){
_v1.object = (UIView*)([group17 Get:index17]);
 //BA.debugLineNum = 155;BA.debugLine="If v1.Tag = \"icon\" Then";
if ([[_v1 Tag] isEqual:(NSObject*)(@"icon")]) { 
 //BA.debugLineNum = 156;BA.debugLine="If v1 Is Button Then";
if ([_v1.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 157;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 158;BA.debugLine="b1 = v1";
_b1.object = (UIButton*)((_v1).object);
 //BA.debugLineNum = 159;BA.debugLine="Library.SetFont(b1.CustomLabel,\"icomoon\",b1.Cu";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([_b1 CustomLabel]).object)] :@"icomoon" :(int) ([[[_b1 CustomLabel] Font] Size])];
 }else if([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 161;BA.debugLine="Dim l2 As Label";
_l2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 162;BA.debugLine="l2 = v1";
_l2.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 163;BA.debugLine="Library.SetFont(l2,\"icomoon\",l2.Font.Size)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_l2).object)] :@"icomoon" :(int) ([[_l2 Font] Size])];
 };
 }else {
 //BA.debugLineNum = 166;BA.debugLine="If v1 Is Button Then";
if ([_v1.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 167;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 168;BA.debugLine="b1 = v1";
_b1.object = (UIButton*)((_v1).object);
 //BA.debugLineNum = 169;BA.debugLine="b1.CustomLabel.Font = Library.GetFont(b1.Custo";
[[_b1 CustomLabel] setFont:[self._library _getfont:(int) ([[[_b1 CustomLabel] Font] Size])]];
 }else if([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 171;BA.debugLine="Dim l2 As Label";
_l2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 172;BA.debugLine="l2 = v1";
_l2.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 173;BA.debugLine="l2.Font = Library.GetFont(l2.Font.Size)";
[_l2 setFont:[self._library _getfont:(int) ([[_l2 Font] Size])]];
 };
 };
 }
};
 //BA.debugLineNum = 178;BA.debugLine="btnmore.Text = Library.GetStringResourse(\"more\")";
[self._btnmore setText:[self._library _getstringresourse:@"more"]];
 //BA.debugLineNum = 179;BA.debugLine="btnmore.CustomLabel.Font = Library.Getfont(14)";
[[self._btnmore CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 181;BA.debugLine="btnoptions.Text = Library.GetStringResourse(\"opti";
[self._btnoptions setText:[self._library _getstringresourse:@"options"]];
 //BA.debugLineNum = 182;BA.debugLine="btnoptions.CustomLabel.Font = Library.Getfont(14)";
[[self._btnoptions CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 183;BA.debugLine="btnoptions.Color = Library.Theme_Header";
[self._btnoptions setColor:self._library._theme_header];
 //BA.debugLineNum = 184;BA.debugLine="btnoptions.SetBorder(1,Colors.White,31)";
[self._btnoptions SetBorder:(float) (1) :[[self.__c Colors] White] :(float) (31)];
 //BA.debugLineNum = 185;BA.debugLine="btnoptions.Top = Library.GetHeight-btnoptions.Hei";
[self._btnoptions setTop:(float) ([self._library _getheight]-[self._btnoptions Height]-[self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 186;BA.debugLine="btnoptions.Top = Library.GetHeight - btnoptions.H";
[self._btnoptions setTop:(float) ([self._library _getheight]-[self._btnoptions Height]-[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 188;BA.debugLine="pnlReviews.Initialize(\"\")";
[self._pnlreviews Initialize:self.bi :@""];
 //BA.debugLineNum = 189;BA.debugLine="Library.ProductPage.RootPanel.AddView(pnlReviews,";
[[self._library._productpage RootPanel] AddView:(UIView*)((self._pnlreviews).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getheight])];
 //BA.debugLineNum = 190;BA.debugLine="pnlReviews.Visible = False";
[self._pnlreviews setVisible:[self.__c False]];
 //BA.debugLineNum = 191;BA.debugLine="pnlReviews.Color = Colors.RGB(238, 238, 238)";
[self._pnlreviews setColor:[[self.__c Colors] RGB:(int) (238) :(int) (238) :(int) (238)]];
 //BA.debugLineNum = 192;BA.debugLine="svReviews.Initialize(\"\",Library.GetWidth,Library.";
[self._svreviews Initialize:self.bi :@"" :[self._library _getwidth] :[self._library _getheight]];
 //BA.debugLineNum = 193;BA.debugLine="pnlReviews.AddView(svReviews,0,0,Library.GetWidth";
[self._pnlreviews AddView:(UIView*)((self._svreviews).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :[self.__c PerYToCurrent:(float) (100)]];
 //BA.debugLineNum = 195;BA.debugLine="pnlOptions.Initialize(\"\")";
[self._pnloptions Initialize:self.bi :@""];
 //BA.debugLineNum = 196;BA.debugLine="Library.ProductPage.RootPanel.AddView(pnlOptions,";
[[self._library._productpage RootPanel] AddView:(UIView*)((self._pnloptions).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getheight])];
 //BA.debugLineNum = 197;BA.debugLine="svOptions.Initialize(\"\",Library.GetWidth,Library.";
[self._svoptions Initialize:self.bi :@"" :[self._library _getwidth] :[self._library _getheight]];
 //BA.debugLineNum = 198;BA.debugLine="pnlOptions.Visible = False";
[self._pnloptions setVisible:[self.__c False]];
 //BA.debugLineNum = 199;BA.debugLine="svOptions.Color = Colors.White";
[self._svoptions setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 200;BA.debugLine="svOptions.Panel.Color = Colors.White";
[[self._svoptions Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 201;BA.debugLine="pnlOptions.Color = Colors.White";
[self._pnloptions setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 202;BA.debugLine="pnlOptions.AddView(svOptions,10dip,10dip,Library.";
[self._pnloptions AddView:(UIView*)((self._svoptions).object) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) ([self.__c DipToCurrent:(int) (10)]) :(float) ([self._library _getwidth]-[self.__c DipToCurrent:(int) (20)]) :(float) ([self._library _getheight]-[self.__c DipToCurrent:(int) (10)])];
 //BA.debugLineNum = 204;BA.debugLine="pnlAttribute.Initialize(\"\")";
[self._pnlattribute Initialize:self.bi :@""];
 //BA.debugLineNum = 205;BA.debugLine="Library.ProductPage.RootPanel.AddView(pnlAttribut";
[[self._library._productpage RootPanel] AddView:(UIView*)((self._pnlattribute).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getheight])];
 //BA.debugLineNum = 206;BA.debugLine="pnlAttribute.Visible = False";
[self._pnlattribute setVisible:[self.__c False]];
 //BA.debugLineNum = 207;BA.debugLine="pnlAttribute.Color = Colors.RGB(238, 238, 238)";
[self._pnlattribute setColor:[[self.__c Colors] RGB:(int) (238) :(int) (238) :(int) (238)]];
 //BA.debugLineNum = 208;BA.debugLine="svAttribute.Initialize(\"\",Library.GetWidth,Librar";
[self._svattribute Initialize:self.bi :@"" :[self._library _getwidth] :[self._library _getheight]];
 //BA.debugLineNum = 209;BA.debugLine="pnlAttribute.AddView(svAttribute,0,0,Library.GetW";
[self._pnlattribute AddView:(UIView*)((self._svattribute).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getheight])];
 //BA.debugLineNum = 211;BA.debugLine="pnlBasket.Initialize(\"\")";
[self._pnlbasket Initialize:self.bi :@""];
 //BA.debugLineNum = 212;BA.debugLine="Library.ProductPage.RootPanel.AddView(pnlBasket,0";
[[self._library._productpage RootPanel] AddView:(UIView*)((self._pnlbasket).object) :(float) (0) :(float) ([self._library _getheight]-[self.__c DipToCurrent:(int) (70)]) :(float) ([self._library _getwidth]) :(float) ([self.__c DipToCurrent:(int) (50)])];
 //BA.debugLineNum = 214;BA.debugLine="pnlBasket.Color = Library.ConvertHex2Int(Library.";
[self._pnlbasket setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 216;BA.debugLine="lblfloat_basket.Initialize(\"lbladd2cart\")";
[self._lblfloat_basket Initialize:self.bi :@"lbladd2cart"];
 //BA.debugLineNum = 217;BA.debugLine="lblfloat_basket.TextColor = Colors.White";
[self._lblfloat_basket setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 218;BA.debugLine="lblfloat_basket.TextAlignment = lblfloat_basket.A";
[self._lblfloat_basket setTextAlignment:[self._lblfloat_basket ALIGNMENT_CENTER]];
 //BA.debugLineNum = 219;BA.debugLine="Library.SetFont(lblfloat_basket,\"icomoon\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblfloat_basket).object)] :@"icomoon" :(int) (14)];
 //BA.debugLineNum = 221;BA.debugLine="pnlBasket.AddView(lblfloat_basket,0,0,Library.Get";
[self._pnlbasket AddView:(UIView*)((self._lblfloat_basket).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :[self._pnlbasket Height]];
 //BA.debugLineNum = 222;BA.debugLine="pnlBasket.Visible = False";
[self._pnlbasket setVisible:[self.__c False]];
 //BA.debugLineNum = 223;BA.debugLine="lblfloat_basket.Left = 0";
[self._lblfloat_basket setLeft:(float) (0)];
 //BA.debugLineNum = 225;BA.debugLine="MyToastMessageShow1.Initialize(Library.ProductPag";
[self._mytoastmessageshow1 _initialize:self.bi :[self._library._productpage RootPanel]];
 //BA.debugLineNum = 230;BA.debugLine="CurrentTimerSpecialWidth = pnllistnumb.Width";
self._currenttimerspecialwidth = (int) ([self._pnllistnumb Width]);
 //BA.debugLineNum = 232;BA.debugLine="sv1.ScrollOffsetY = 0";
[self._sv1 setScrollOffsetY:(int) (0)];
 //BA.debugLineNum = 234;BA.debugLine="details.Initialize";
[self._details _initialize:self.bi];
 //BA.debugLineNum = 235;BA.debugLine="listBanner.Initialize";
[self._listbanner Initialize];
 //BA.debugLineNum = 237;BA.debugLine="lblratetitle.Text = Library.GetStringResourse(\"ra";
[self._lblratetitle setText:[self._library _getstringresourse:@"ratetitle"]];
 //BA.debugLineNum = 238;BA.debugLine="lbldatetitle.Text = Library.GetStringResourse(\"da";
[self._lbldatetitle setText:[self._library _getstringresourse:@"datetitle"]];
 //BA.debugLineNum = 239;BA.debugLine="lblmodeltitle.Text = Library.GetStringResourse(\"m";
[self._lblmodeltitle setText:[self._library _getstringresourse:@"modeltitle"]];
 //BA.debugLineNum = 240;BA.debugLine="lblproducertitle.Text = Library.GetStringResourse";
[self._lblproducertitle setText:[self._library _getstringresourse:@"producertitle"]];
 //BA.debugLineNum = 241;BA.debugLine="lblstatetitle.Text = Library.GetStringResourse(\"s";
[self._lblstatetitle setText:[self._library _getstringresourse:@"statetitle"]];
 //BA.debugLineNum = 242;BA.debugLine="lblvisitcount.Text = Library.GetStringResourse(\"v";
[self._lblvisitcount setText:[self._library _getstringresourse:@"visitcount"]];
 //BA.debugLineNum = 243;BA.debugLine="lbloptions.Text  = Library.GetStringResourse(\"opt";
[self._lbloptions setText:[self._library _getstringresourse:@"options"]];
 //BA.debugLineNum = 244;BA.debugLine="lblattr.Text  = Library.GetStringResourse(\"attrib";
[self._lblattr setText:[self._library _getstringresourse:@"attribute"]];
 //BA.debugLineNum = 245;BA.debugLine="btnattributes.Text = Library.GetStringResourse(\"a";
[self._btnattributes setText:[self._library _getstringresourse:@"attribute"]];
 //BA.debugLineNum = 246;BA.debugLine="btnreviews.Text = Library.GetStringResourse(\"revi";
[self._btnreviews setText:[self._library _getstringresourse:@"reviews"]];
 //BA.debugLineNum = 248;BA.debugLine="IsOpenProduct = True";
self._isopenproduct = [self.__c True];
 //BA.debugLineNum = 250;BA.debugLine="lbls1.TextColor = Library.Theme_Header";
[self._lbls1 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 251;BA.debugLine="lbls2.TextColor = Library.Theme_Header";
[self._lbls2 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 252;BA.debugLine="lbls3.TextColor = Library.Theme_Header";
[self._lbls3 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 253;BA.debugLine="lbls4.TextColor = Library.Theme_Header";
[self._lbls4 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 254;BA.debugLine="lbls5.TextColor = Library.Theme_Header";
[self._lbls5 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 256;BA.debugLine="lbladd2cart.Color = Library.ConvertHex2Int(Librar";
[self._lbladd2cart setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 257;BA.debugLine="lbladd2cart.SetBorder(1,Library.ConvertHex2Int(Li";
[self._lbladd2cart SetBorder:(float) (1) :[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue :(float) (9)];
 //BA.debugLineNum = 259;BA.debugLine="If product.ContainsKey(\"product_id\") = False Then";
if ([self._product ContainsKey:(NSObject*)(@"product_id")]==[self.__c False]) { 
 //BA.debugLineNum = 260;BA.debugLine="LoadItem";
[self _loaditem];
 }else {
 //BA.debugLineNum = 263;BA.debugLine="Dim detailsTemp As Map";
_detailstemp = [B4IMap new];
 //BA.debugLineNum = 264;BA.debugLine="detailsTemp = CacheData.GetProductDescriptionFro";
_detailstemp = [self._cachedata _getproductdescriptionfromcache:[self.bi ObjectToString:[self._product Get:(NSObject*)(@"product_id")]]];
 //BA.debugLineNum = 266;BA.debugLine="If detailsTemp <> Null And detailsTemp.IsInitial";
if (_detailstemp!= nil && [_detailstemp IsInitialized]) { 
 //BA.debugLineNum = 267;BA.debugLine="Details_receive(detailsTemp,\"\")";
[self _details_receive:_detailstemp :@""];
 }else {
 //BA.debugLineNum = 269;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 270;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetString";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_title"] :[self.__c False]];
 //BA.debugLineNum = 271;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 272;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 275;BA.debugLine="Library.HUD.ProgressDialogShow(Library.GetStrin";
[self._library._hud ProgressDialogShow:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 276;BA.debugLine="details.ProductDetails(Me,\"Details_receive\",pro";
[self._details _productdetails:self :@"Details_receive" :[self.bi ObjectToString:[self._product Get:(NSObject*)(@"product_id")]]];
 };
 };
 //BA.debugLineNum = 281;BA.debugLine="sv1.ContentHeight = 1900";
[self._sv1 setContentHeight:(int) (1900)];
 //BA.debugLineNum = 283;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _sv1_scrollchanged:(int) _offsetx :(int) _offsety{
B4IPanelWrapper* _pnl = nil;
int _w = 0;
int _h = 0;
 //BA.debugLineNum = 1812;BA.debugLine="Sub sv1_ScrollChanged (OffsetX As Int, OffsetY As";
 //BA.debugLineNum = 1814;BA.debugLine="If OffsetY > pnlads.top + pnlads.Height And FixPa";
if (_offsety>[self._pnlads Top]+[self._pnlads Height] && self._fixpanelheader==[self.__c False]) { 
 //BA.debugLineNum = 1816;BA.debugLine="FixPanelHeader = True";
self._fixpanelheader = [self.__c True];
 //BA.debugLineNum = 1818;BA.debugLine="Dim pnl As Panel";
_pnl = [B4IPanelWrapper new];
 //BA.debugLineNum = 1819;BA.debugLine="pnl = pnlheader";
_pnl = self._pnlheader;
 //BA.debugLineNum = 1820;BA.debugLine="Dim w,h As Int";
_w = 0;
_h = 0;
 //BA.debugLineNum = 1821;BA.debugLine="w = pnlheader.Width";
_w = (int) ([self._pnlheader Width]);
 //BA.debugLineNum = 1822;BA.debugLine="h = pnlheader.Height";
_h = (int) ([self._pnlheader Height]);
 //BA.debugLineNum = 1823;BA.debugLine="pnlheader.RemoveViewFromParent";
[self._pnlheader RemoveViewFromParent];
 //BA.debugLineNum = 1824;BA.debugLine="Library.ProductPage.RootPanel.AddView(pnl,0,0,w,";
[[self._library._productpage RootPanel] AddView:(UIView*)((_pnl).object) :(float) (0) :(float) (0) :(float) (_w) :(float) (_h)];
 //BA.debugLineNum = 1825;BA.debugLine="pnl.Color = Library.Theme_Header";
[_pnl setColor:self._library._theme_header];
 //BA.debugLineNum = 1826;BA.debugLine="btnbasket.CustomLabel.TextColor = Colors.White";
[[self._btnbasket CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1827;BA.debugLine="btnbookmark.CustomLabel.TextColor = Colors.White";
[[self._btnbookmark CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1828;BA.debugLine="btnshare.CustomLabel.TextColor = Colors.White";
[[self._btnshare CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1829;BA.debugLine="btnsearch.CustomLabel.TextColor = Colors.White";
[[self._btnsearch CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1830;BA.debugLine="btnback.CustomLabel.TextColor = Colors.White";
[[self._btnback CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1831;BA.debugLine="btnqr.CustomLabel.TextColor = Colors.White";
[[self._btnqr CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1832;BA.debugLine="btnback.CustomLabel.TextColor = Colors.White";
[[self._btnback CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1833;BA.debugLine="If product.Get(\"quantity\") > 0 Then pnlBasket.Vi";
if ([self.bi ObjectToNumber:[self._product Get:(NSObject*)(@"quantity")]].doubleValue>0) { 
[self._pnlbasket setVisible:[self.__c True]];};
 //BA.debugLineNum = 1834;BA.debugLine="pnl.Visible = False";
[_pnl setVisible:[self.__c False]];
 //BA.debugLineNum = 1835;BA.debugLine="pnl.Visible = True";
[_pnl setVisible:[self.__c True]];
 }else if(_offsety<[self._pnlads Top]+[self._pnlads Height] && self._fixpanelheader==[self.__c True]) { 
 //BA.debugLineNum = 1838;BA.debugLine="FixPanelHeader = False";
self._fixpanelheader = [self.__c False];
 //BA.debugLineNum = 1839;BA.debugLine="Dim pnl As Panel";
_pnl = [B4IPanelWrapper new];
 //BA.debugLineNum = 1840;BA.debugLine="pnl = pnlheader";
_pnl = self._pnlheader;
 //BA.debugLineNum = 1841;BA.debugLine="Dim w,h As Int";
_w = 0;
_h = 0;
 //BA.debugLineNum = 1842;BA.debugLine="w = pnlheader.Width";
_w = (int) ([self._pnlheader Width]);
 //BA.debugLineNum = 1843;BA.debugLine="h = pnlheader.Height";
_h = (int) ([self._pnlheader Height]);
 //BA.debugLineNum = 1844;BA.debugLine="pnlheader.RemoveViewFromParent";
[self._pnlheader RemoveViewFromParent];
 //BA.debugLineNum = 1845;BA.debugLine="pnlBasket.Visible = False";
[self._pnlbasket setVisible:[self.__c False]];
 //BA.debugLineNum = 1846;BA.debugLine="sv1.Panel.AddView(pnl,0,0,w,h)";
[[self._sv1 Panel] AddView:(UIView*)((_pnl).object) :(float) (0) :(float) (0) :(float) (_w) :(float) (_h)];
 //BA.debugLineNum = 1847;BA.debugLine="pnl.Color = Colors.White";
[_pnl setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1848;BA.debugLine="btnbasket.CustomLabel.TextColor = Colors.Gray";
[[self._btnbasket CustomLabel] setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1849;BA.debugLine="btnbookmark.CustomLabel.TextColor = Colors.Gray";
[[self._btnbookmark CustomLabel] setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1850;BA.debugLine="btnshare.CustomLabel.TextColor = Colors.Gray";
[[self._btnshare CustomLabel] setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1851;BA.debugLine="btnsearch.CustomLabel.TextColor = Colors.Gray";
[[self._btnsearch CustomLabel] setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1852;BA.debugLine="btnback.CustomLabel.TextColor = Colors.Gray";
[[self._btnback CustomLabel] setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1853;BA.debugLine="btnqr.CustomLabel.TextColor = Colors.Gray";
[[self._btnqr CustomLabel] setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 1854;BA.debugLine="btnback.CustomLabel.TextColor = Colors.Gray";
[[self._btnback CustomLabel] setTextColor:[[self.__c Colors] Gray]];
 };
 //BA.debugLineNum = 1858;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _timerspecial_tick{
B4IMap* _m = nil;
 //BA.debugLineNum = 690;BA.debugLine="Sub timerSpecial_Tick";
 //BA.debugLineNum = 692;BA.debugLine="If pnltimer.Visible = False Then";
if ([self._pnltimer Visible]==[self.__c False]) { 
 //BA.debugLineNum = 693;BA.debugLine="pnltimer.Visible = True";
[self._pnltimer setVisible:[self.__c True]];
 //BA.debugLineNum = 694;BA.debugLine="pnltimer.BringToFront";
[self._pnltimer BringToFront];
 //BA.debugLineNum = 695;BA.debugLine="Library.RedString(Library.GetStringResourse(\"spe";
[self._library _redstring:[[self._library _getstringresourse:@"special_wonderful"] Replace:@"{r}" :@""] :self._lblwonderfull];
 //BA.debugLineNum = 696;BA.debugLine="pnlprice.top = pnltimer.top + pnltimer.Height";
[self._pnlprice setTop:(float) ([self._pnltimer Top]+[self._pnltimer Height])];
 //BA.debugLineNum = 697;BA.debugLine="pnlprice.BringToFront";
[self._pnlprice BringToFront];
 //BA.debugLineNum = 698;BA.debugLine="pnl2.top = pnlprice.top + pnlprice.Height-2";
[self._pnl2 setTop:(float) ([self._pnlprice Top]+[self._pnlprice Height]-2)];
 //BA.debugLineNum = 699;BA.debugLine="timerSpecial.Initialize(\"timerSpecial\",1000)";
[self._timerspecial Initialize:self.bi :@"timerSpecial" :(long long) (1000)];
 //BA.debugLineNum = 700;BA.debugLine="timerSpecial.Enabled = True";
[self._timerspecial setEnabled:[self.__c True]];
 //BA.debugLineNum = 701;BA.debugLine="lblline2.Color = Colors.Black";
[self._lblline2 setColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 702;BA.debugLine="lblline1.Color = Colors.Transparent";
[self._lblline1 setColor:[[self.__c Colors] Transparent]];
 };
 //BA.debugLineNum = 705;BA.debugLine="If SpecialDateInformation.Seconds = 0 Then";
if (self._specialdateinformation.Seconds==0) { 
 //BA.debugLineNum = 707;BA.debugLine="SpecialDateInformation.Seconds = 59";
self._specialdateinformation.Seconds = (int) (59);
 //BA.debugLineNum = 709;BA.debugLine="If SpecialDateInformation.Minutes = 0 And Specia";
if (self._specialdateinformation.Minutes==0 && self._specialdateinformation.Hours>0) { 
 //BA.debugLineNum = 710;BA.debugLine="SpecialDateInformation.Minutes = 59";
self._specialdateinformation.Minutes = (int) (59);
 }else if(self._specialdateinformation.Minutes==0 && self._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 712;BA.debugLine="EndTimerSpecial";
[self _endtimerspecial];
 //BA.debugLineNum = 713;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 715;BA.debugLine="SpecialDateInformation.Minutes = SpecialDateInf";
self._specialdateinformation.Minutes = (int) (self._specialdateinformation.Minutes-1);
 };
 }else {
 //BA.debugLineNum = 719;BA.debugLine="SpecialDateInformation.Seconds = SpecialDateInfo";
self._specialdateinformation.Seconds = (int) (self._specialdateinformation.Seconds-1);
 };
 //BA.debugLineNum = 722;BA.debugLine="If SpecialDateInformation.Minutes = 0 Then";
if (self._specialdateinformation.Minutes==0) { 
 //BA.debugLineNum = 723;BA.debugLine="If SpecialDateInformation.Minutes = 0 And Specia";
if (self._specialdateinformation.Minutes==0 && self._specialdateinformation.Hours>0) { 
 //BA.debugLineNum = 724;BA.debugLine="SpecialDateInformation.Minutes = 59";
self._specialdateinformation.Minutes = (int) (59);
 //BA.debugLineNum = 725;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInfor";
self._specialdateinformation.Hours = (int) (self._specialdateinformation.Hours-1);
 }else if(self._specialdateinformation.Minutes==0 && self._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 727;BA.debugLine="EndTimerSpecial";
[self _endtimerspecial];
 //BA.debugLineNum = 728;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 730;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInfor";
self._specialdateinformation.Hours = (int) (self._specialdateinformation.Hours-1);
 };
 }else if(self._specialdateinformation.Minutes>59) { 
 //BA.debugLineNum = 733;BA.debugLine="SpecialDateInformation.Minutes = SpecialDateInfo";
self._specialdateinformation.Minutes = (int) (self._specialdateinformation.Minutes-59);
 //BA.debugLineNum = 734;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInform";
self._specialdateinformation.Hours = (int) (self._specialdateinformation.Hours+1);
 };
 //BA.debugLineNum = 737;BA.debugLine="If SpecialDateInformation.Hours = 0 Then";
if (self._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 738;BA.debugLine="If SpecialDateInformation.Hours = 0 And SpecialD";
if (self._specialdateinformation.Hours==0 && self._specialdateinformation.Days>0) { 
 //BA.debugLineNum = 739;BA.debugLine="SpecialDateInformation.Hours = 24";
self._specialdateinformation.Hours = (int) (24);
 //BA.debugLineNum = 740;BA.debugLine="SpecialDateInformation.Days = SpecialDateInform";
self._specialdateinformation.Days = (int) (self._specialdateinformation.Days-1);
 }else if(self._specialdateinformation.Hours==0 && self._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 742;BA.debugLine="EndTimerSpecial";
[self _endtimerspecial];
 //BA.debugLineNum = 743;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 745;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInfor";
self._specialdateinformation.Hours = (int) (self._specialdateinformation.Hours-1);
 };
 }else {
 };
 //BA.debugLineNum = 752;BA.debugLine="Dim m As Map";
_m = [B4IMap new];
 //BA.debugLineNum = 753;BA.debugLine="m.Initialize";
[_m Initialize];
 //BA.debugLineNum = 754;BA.debugLine="m.Put(\"Years\",SpecialDateInformation.Years)";
[_m Put:(NSObject*)(@"Years") :(NSObject*)(@(self._specialdateinformation.Years))];
 //BA.debugLineNum = 755;BA.debugLine="m.Put(\"Months\",SpecialDateInformation.Months)";
[_m Put:(NSObject*)(@"Months") :(NSObject*)(@(self._specialdateinformation.Months))];
 //BA.debugLineNum = 756;BA.debugLine="m.Put(\"Days\",SpecialDateInformation.Days)";
[_m Put:(NSObject*)(@"Days") :(NSObject*)(@(self._specialdateinformation.Days))];
 //BA.debugLineNum = 757;BA.debugLine="m.Put(\"Hours\",SpecialDateInformation.Hours)";
[_m Put:(NSObject*)(@"Hours") :(NSObject*)(@(self._specialdateinformation.Hours))];
 //BA.debugLineNum = 758;BA.debugLine="m.Put(\"Minutes\",SpecialDateInformation.Minutes)";
[_m Put:(NSObject*)(@"Minutes") :(NSObject*)(@(self._specialdateinformation.Minutes))];
 //BA.debugLineNum = 759;BA.debugLine="m.Put(\"Seconds\",SpecialDateInformation.Seconds)";
[_m Put:(NSObject*)(@"Seconds") :(NSObject*)(@(self._specialdateinformation.Seconds))];
 //BA.debugLineNum = 760;BA.debugLine="File.WriteMap(File.DirLibrary,\"timeout_ids_\" & pr";
[[self.__c File] WriteMap:[[self.__c File] DirLibrary] :[@[@"timeout_ids_",[self.bi ObjectToString:[self._product Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""] :_m];
 //BA.debugLineNum = 762;BA.debugLine="lblnum1.Text = SpecialDateInformation.Days";
[self._lblnum1 setText:[self.bi NumberToString:@(self._specialdateinformation.Days)]];
 //BA.debugLineNum = 763;BA.debugLine="lblnum2.Text = SpecialDateInformation.Hours";
[self._lblnum2 setText:[self.bi NumberToString:@(self._specialdateinformation.Hours)]];
 //BA.debugLineNum = 764;BA.debugLine="lblnum3.Text = SpecialDateInformation.Minutes";
[self._lblnum3 setText:[self.bi NumberToString:@(self._specialdateinformation.Minutes)]];
 //BA.debugLineNum = 765;BA.debugLine="lblnum4.Text = SpecialDateInformation.Seconds";
[self._lblnum4 setText:[self.bi NumberToString:@(self._specialdateinformation.Seconds)]];
 //BA.debugLineNum = 767;BA.debugLine="If SpecialDateInformation.Days > 99 Then";
if (self._specialdateinformation.Days>99) { 
 //BA.debugLineNum = 768;BA.debugLine="lblnum1.Font = Library.GetFont(14)";
[self._lblnum1 setFont:[self._library _getfont:(int) (14)]];
 };
 //BA.debugLineNum = 771;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmrcircles_tick{
 //BA.debugLineNum = 622;BA.debugLine="Sub tmrCircles_Tick";
 //BA.debugLineNum = 623;BA.debugLine="pnlcircle.Visible = True";
[self._pnlcircle setVisible:[self.__c True]];
 //BA.debugLineNum = 624;BA.debugLine="tmrCicle.Enabled = False";
[self._tmrcicle setEnabled:[self.__c False]];
 //BA.debugLineNum = 625;BA.debugLine="pnlcircle.Width = (10dip + 4dip) * listSlideshow.";
[self._pnlcircle setWidth:(float) (([self.__c DipToCurrent:(int) (10)]+[self.__c DipToCurrent:(int) (4)])*[self._listslideshow Size])];
 //BA.debugLineNum = 626;BA.debugLine="pnlcircle.SetLayoutAnimated(500,1,Library.GetWidt";
[self._pnlcircle SetLayoutAnimated:(int) (500) :(float) (1) :(float) ([self._library _getwidth]/(double)2-[self._pnlcircle Width]/(double)2) :[self._pnlcircle Top] :(float) ([self._pnlcircle Width]+[self.__c DipToCurrent:(int) (32)]) :[self._pnlcircle Height]];
 //BA.debugLineNum = 627;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmrslideshow_tick{
 //BA.debugLineNum = 1047;BA.debugLine="Sub tmrSlideshow_Tick";
 //BA.debugLineNum = 1049;BA.debugLine="If Library.imagesSlideshowProduct.IsInitialized =";
if ([self._library._imagesslideshowproduct IsInitialized]==[self.__c False]) { 
if (true) return @"";};
 //BA.debugLineNum = 1051;BA.debugLine="If offsetSlideshow >= Library.imagesSlideshowProd";
if (self._offsetslideshow>=[self._library._imagesslideshowproduct Size]) { 
 //BA.debugLineNum = 1052;BA.debugLine="offsetSlideshow = 1";
self._offsetslideshow = (int) (1);
 //BA.debugLineNum = 1053;BA.debugLine="slidepanel1.ScrollTo(0,slidepanel1.Top,True)";
[self._slidepanel1 ScrollTo:(int) (0) :(int) ([self._slidepanel1 Top]) :[self.__c True]];
 //BA.debugLineNum = 1054;BA.debugLine="ChooseBullet(offsetSlideshow)";
[self _choosebullet:self._offsetslideshow];
 }else {
 //BA.debugLineNum = 1056;BA.debugLine="slidepanel1.ScrollTo(Library.GetWidth * offsetSl";
[self._slidepanel1 ScrollTo:(int) ([self._library _getwidth]*self._offsetslideshow) :(int) ([self._slidepanel1 Top]) :[self.__c True]];
 //BA.debugLineNum = 1057;BA.debugLine="offsetSlideshow = offsetSlideshow + 1";
self._offsetslideshow = (int) (self._offsetslideshow+1);
 //BA.debugLineNum = 1058;BA.debugLine="ChooseBullet(offsetSlideshow)";
[self _choosebullet:self._offsetslideshow];
 };
 //BA.debugLineNum = 1061;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtoption_beginedit{
BOOL _hasfocus = false;
B4ITextFieldWrapper* _ed = nil;
B4IMap* _data = nil;
NSString* _stype = @"";
B4IArray* _arrdate = nil;
B4IArray* _arrtime = nil;
 //BA.debugLineNum = 1687;BA.debugLine="Sub txtoption_BeginEdit";
 //BA.debugLineNum = 1689;BA.debugLine="Dim hasfocus As Boolean";
_hasfocus = false;
 //BA.debugLineNum = 1690;BA.debugLine="hasfocus = True";
_hasfocus = [self.__c True];
 //BA.debugLineNum = 1692;BA.debugLine="If hasfocus Then";
if (_hasfocus) { 
 //BA.debugLineNum = 1694;BA.debugLine="Dim ed As TextField";
_ed = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 1695;BA.debugLine="ed = Sender";
_ed.object = (UITextField*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 1697;BA.debugLine="If ed.IsInitialized = False Then Return";
if ([_ed IsInitialized]==[self.__c False]) { 
if (true) return @"";};
 //BA.debugLineNum = 1699;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 1700;BA.debugLine="data = ed.Tag";
_data = (B4IMap*)([_ed Tag]);
 //BA.debugLineNum = 1702;BA.debugLine="Dim sType As String";
_stype = @"";
 //BA.debugLineNum = 1703;BA.debugLine="sType = data.Get(\"Type\")";
_stype = [self.bi ObjectToString:[_data Get:(NSObject*)(@"Type")]];
 //BA.debugLineNum = 1705;BA.debugLine="If sType = \"date\" Then";
if ([_stype isEqual:@"date"]) { 
 //BA.debugLineNum = 1707;BA.debugLine="Dim Arrdate() As Int";
_arrdate = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
 //BA.debugLineNum = 1708;BA.debugLine="Arrdate = Library.ParseDate(ed.Text)";
_arrdate = [self._library _parsedate:[_ed Text]];
 //BA.debugLineNum = 1710;BA.debugLine="currentTextField = ed";
self._currenttextfield = _ed;
 //BA.debugLineNum = 1712;BA.debugLine="MakeDateDialog(Arrdate(0),Arrdate(1),Arrdate(2)";
[self _makedatedialog:[self.bi NumberToString:@(((NSNumber*)[_arrdate getObjectFastN:(int) (0)]).intValue)] :[self.bi NumberToString:@(((NSNumber*)[_arrdate getObjectFastN:(int) (1)]).intValue)] :[self.bi NumberToString:@(((NSNumber*)[_arrdate getObjectFastN:(int) (2)]).intValue)]];
 }else if([_stype isEqual:@"time"]) { 
 //BA.debugLineNum = 1716;BA.debugLine="Dim Arrtime() As Int";
_arrtime = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
 //BA.debugLineNum = 1717;BA.debugLine="Arrtime = Library.ParseTime(ed.Text)";
_arrtime = [self._library _parsetime:[_ed Text]];
 //BA.debugLineNum = 1718;BA.debugLine="currentTextField = ed";
self._currenttextfield = _ed;
 //BA.debugLineNum = 1719;BA.debugLine="MakeTimeDialog(Arrtime(0),Arrtime(1),Arrtime(2)";
[self _maketimedialog:[self.bi NumberToString:@(((NSNumber*)[_arrtime getObjectFastN:(int) (0)]).intValue)] :[self.bi NumberToString:@(((NSNumber*)[_arrtime getObjectFastN:(int) (1)]).intValue)] :[self.bi NumberToString:@(((NSNumber*)[_arrtime getObjectFastN:(int) (2)]).intValue)]];
 }else if([_stype isEqual:@"datetime"]) { 
 //BA.debugLineNum = 1723;BA.debugLine="currentTextField = ed";
self._currenttextfield = _ed;
 //BA.debugLineNum = 1724;BA.debugLine="IsDateTime = True";
self._isdatetime = [self.__c True];
 //BA.debugLineNum = 1725;BA.debugLine="MakeDateDialog(Arrdate(0),Arrdate(1),Arrdate(2)";
[self _makedatedialog:[self.bi NumberToString:@(((NSNumber*)[_arrdate getObjectFastN:(int) (0)]).intValue)] :[self.bi NumberToString:@(((NSNumber*)[_arrdate getObjectFastN:(int) (1)]).intValue)] :[self.bi NumberToString:@(((NSNumber*)[_arrdate getObjectFastN:(int) (2)]).intValue)]];
 };
 };
 //BA.debugLineNum = 1731;BA.debugLine="End Sub";
return @"";
}
	- (void)createQRForString:(NSString *)qrString :(UIImageView *)qrImageView
	{
	  // Need To convert the string To a UTF-8 encoded NSData object
	  NSData *stringData = [qrString dataUsingEncoding: NSISOLatin1StringEncoding];

	  // Create the filter
	  CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
	  // Set the message content And error-correction level
	  [qrFilter setValue:stringData forKey:@"inputMessage"];
	  [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
	 
	   // Remove blur effect with scaling
	   CGAffineTransform transform = CGAffineTransformMakeScale(100.0f,100.0f);
	   CIImage *qrOutput = [qrFilter.outputImage imageByApplyingTransform: transform];

	   //Convert CIImage to UIImage
	   UIImage *qrImage = [[UIImage alloc] initWithCIImage:qrOutput];
	 
	   //Set Image to ImageView
	   [qrImageView setImage:qrImage];
	}
@end
