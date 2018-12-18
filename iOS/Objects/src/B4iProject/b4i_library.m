
#import "b4i_library.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
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

@implementation _responseadditem
-(void)Initialize{
self.IsInitialized = true;
self.View1 = [B4IViewWrapper new];
self.Top = 0;
self.Left = 0;
}
- (NSString*)description {
return [B4I TypeToString:self :false];}
@end

@implementation b4i_library 


+ (instancetype)new {
    static b4i_library* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _add2cart:(NSString*) _sid :(NSString*) _scount :(NSObject*) _smodule{
b4i_opencart* _details = nil;
 //BA.debugLineNum = 136;BA.debugLine="Public Sub Add2Cart(sID As String,sCount As String";
 //BA.debugLineNum = 138;BA.debugLine="If InternetState = False Then";
if ([self _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 139;BA.debugLine="HUD.ToastMessageShow(GetStringResourse(\"error_ne";
[self._hud ToastMessageShow:[self _getstringresourse:@"error_net_details"] :[self.__c False]];
 //BA.debugLineNum = 140;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 143;BA.debugLine="ProductChoosenID = sID";
self._productchoosenid = _sid;
 //BA.debugLineNum = 145;BA.debugLine="HUD.ProgressDialogShow(GetStringResourse2(\"apply\"";
[self._hud ProgressDialogShow:[self _getstringresourse2:@"apply"]];
 //BA.debugLineNum = 147;BA.debugLine="Dim details As OpenCart";
_details = [b4i_opencart new];
 //BA.debugLineNum = 148;BA.debugLine="details.Initialize";
[_details _initialize:self.bi];
 //BA.debugLineNum = 149;BA.debugLine="details.Add2Cart(sModule,\"Add2Cart2_receive\",sID,";
[_details _add2cart:_smodule :@"Add2Cart2_receive" :_sid :_scount :[self.__c createMap:@[(NSObject*)(@"test"),(NSObject*)(@"test")]]];
 //BA.debugLineNum = 151;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addhidekeyboardtoview:(NSObject*) _textfield1 :(B4IPanelWrapper*) _container{
B4INativeObject* _no = nil;
 //BA.debugLineNum = 1000;BA.debugLine="Sub AddHideKeyboardToView (TextField1 As Object,Co";
 //BA.debugLineNum = 1001;BA.debugLine="Dim no As NativeObject = TextField1";
_no = [B4INativeObject new];
_no.object = (NSObject*)(_textfield1);
 //BA.debugLineNum = 1002;BA.debugLine="no.SetField(\"inputAccessoryView\",Container)";
[_no SetField:@"inputAccessoryView" :(NSObject*)((_container).object)];
 //BA.debugLineNum = 1003;BA.debugLine="End Sub";
return @"";
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
 //BA.debugLineNum = 578;BA.debugLine="Sub AddProduct2Panel(ScrollView1 As ScrollView, Le";
 //BA.debugLineNum = 580;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 581;BA.debugLine="pa.Initialize(\"\")";
[_pa Initialize:self.bi :@""];
 //BA.debugLineNum = 582;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,0,Dimension(0)";
[[_scrollview1 Panel] AddView:(UIView*)((_pa).object) :(float) (_left) :(float) (0) :(float) (((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue) :(float) (0)];
 //BA.debugLineNum = 583;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
[_pa LoadLayout:@"frmproduct_template" :self.bi];
 //BA.debugLineNum = 584;BA.debugLine="pa.Height = Dimension(1)";
[_pa setHeight:(float) (((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 //BA.debugLineNum = 587;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = [B4IImageViewWrapper new];
 //BA.debugLineNum = 589;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = [B4ILabelWrapper new];
_labelprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 590;BA.debugLine="Dim TempPanel As Panel";
_temppanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 591;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = [B4IPanelWrapper new];
_parentpanel.object = (B4IPanelView*)(([_pa GetView:(int) (0)]).object);
 //BA.debugLineNum = 594;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.object = (UIImageView*)(([_parentpanel GetView:(int) (4)]).object);
 //BA.debugLineNum = 595;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.object = (UILabel*)(([_parentpanel GetView:(int) (1)]).object);
 //BA.debugLineNum = 596;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.object = (UILabel*)(([_parentpanel GetView:(int) (2)]).object);
 //BA.debugLineNum = 597;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.object = (B4IPanelView*)(([_parentpanel GetView:(int) (6)]).object);
 //BA.debugLineNum = 598;BA.debugLine="TempLabel.Text = temp.Get(\"name\")";
[_templabel setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 599;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
[_templabel setText:[[[_templabel Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 601;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 603;BA.debugLine="If temp.ContainsKey(\"price_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"price_formated")]) { 
 //BA.debugLineNum = 604;BA.debugLine="price   = temp.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price_formated")]];
 }else {
 //BA.debugLineNum = 606;BA.debugLine="price   = temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 };
 //BA.debugLineNum = 609;BA.debugLine="If temp.ContainsKey(\"special_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"special_formated")]) { 
 //BA.debugLineNum = 610;BA.debugLine="special = temp.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special_formated")]];
 }else if([_temp ContainsKey:(NSObject*)(@"special")]) { 
 //BA.debugLineNum = 612;BA.debugLine="special = temp.Get(\"special\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special")]];
 };
 //BA.debugLineNum = 615;BA.debugLine="If special = \"null\" Or special = \"false\" Or spec";
if ([_special isEqual:@"null"] || [_special isEqual:@"false"] || [_special isEqual:@"0"]) { 
_special = @"";};
 //BA.debugLineNum = 617;BA.debugLine="If IsPersian Then";
if ([self _ispersian]) { 
 //BA.debugLineNum = 618;BA.debugLine="SetFont(LabelPrice,\"\",14)";
[self _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_labelprice).object)] :@"" :(int) (14)];
 //BA.debugLineNum = 619;BA.debugLine="SetFont(TempLabel,\"\",14)";
[self _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_templabel).object)] :@"" :(int) (14)];
 };
 //BA.debugLineNum = 622;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if ([_price Length]>0 && [_special Length]==0) { 
 //BA.debugLineNum = 623;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 }else if([_special Length]>0) { 
 //BA.debugLineNum = 625;BA.debugLine="DiscountStyleLabel(price,special,LabelPrice)";
[self _discountstylelabel:_price :_special :_labelprice];
 };
 //BA.debugLineNum = 628;BA.debugLine="Dim PathImage As String";
_pathimage = @"";
 //BA.debugLineNum = 630;BA.debugLine="If temp.ContainsKey(\"image\") Then";
if ([_temp ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 631;BA.debugLine="PathImage = temp.Get(\"image\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"image")]];
 }else if([_temp ContainsKey:(NSObject*)(@"thumb")]) { 
 //BA.debugLineNum = 633;BA.debugLine="PathImage = temp.Get(\"thumb\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 636;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ([[_pathimage ToLowerCase] isEqual:@"null"] || [_pathimage Length]==0) { 
 //BA.debugLineNum = 637;BA.debugLine="imgTemp.Bitmap = LoadBitmap(File.DirAssets,\"noi";
[_imgtemp setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"noimage.png"]];
 }else {
 //BA.debugLineNum = 639;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 640;BA.debugLine="img.Initialize";
[_img Initialize];
 //BA.debugLineNum = 641;BA.debugLine="img.Put(imgTemp,PathImage)";
[_img Put:(NSObject*)((_imgtemp).object) :(NSObject*)(_pathimage)];
 //BA.debugLineNum = 642;BA.debugLine="Dim imgdownloader As ImageDownloader";
_imgdownloader = [b4i_imagedownloader new];
 //BA.debugLineNum = 643;BA.debugLine="imgdownloader.Initialize";
[_imgdownloader _initialize:self.bi];
 //BA.debugLineNum = 644;BA.debugLine="imgdownloader.Download(img)";
[_imgdownloader _download:_img];
 };
 //BA.debugLineNum = 647;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ([[_temppanel Tag] isEqual:(NSObject*)(@"over")]) { 
 //BA.debugLineNum = 648;BA.debugLine="TempPanel.Tag = temp";
[_temppanel setTag:(NSObject*)(_temp)];
 }else if([[_temppanel Tag] isEqual:(NSObject*)(@"topbar")]) { 
 //BA.debugLineNum = 650;BA.debugLine="TempPanel.Color = Theme_Header";
[_temppanel setColor:self._theme_header];
 };
 //BA.debugLineNum = 656;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addtabbar:(B4IPage*) _page{
B4ITabBarItemItemWrapper* _item = nil;
 //BA.debugLineNum = 993;BA.debugLine="Sub AddTabbar(page As Page)";
 //BA.debugLineNum = 995;BA.debugLine="Dim item As TabBarItem";
_item = [B4ITabBarItemItemWrapper new];
 //BA.debugLineNum = 996;BA.debugLine="item.Initialize(\"\",LoadBitmap(File.DirAssets,\"hom";
[_item Initialize:@"" :[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"home.png"] :[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"home.png"]];
 //BA.debugLineNum = 997;BA.debugLine="page.TabBarItem = item";
[_page setTabBarItem:_item];
 //BA.debugLineNum = 998;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _centerview:(B4IViewWrapper*) _v :(B4IViewWrapper*) _parent{
 //BA.debugLineNum = 153;BA.debugLine="Sub CenterView(v As View, parent As View)";
 //BA.debugLineNum = 154;BA.debugLine="v.Left = parent.Width / 2 - v.Width / 2";
[_v setLeft:(float) ([_parent Width]/(double)2-[_v Width]/(double)2)];
 //BA.debugLineNum = 155;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _centerview2:(B4IViewWrapper*) _v :(B4IViewWrapper*) _parent{
 //BA.debugLineNum = 39;BA.debugLine="Sub CenterView2(v As View, parent As View)";
 //BA.debugLineNum = 40;BA.debugLine="v.Left = parent.Width / 2 - v.Width / 2";
[_v setLeft:(float) ([_parent Width]/(double)2-[_v Width]/(double)2)];
 //BA.debugLineNum = 41;BA.debugLine="v.Top = parent.Height / 2 - v.Height / 2";
[_v setTop:(float) ([_parent Height]/(double)2-[_v Height]/(double)2)];
 //BA.debugLineNum = 42;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _changefont:(B4IPanelWrapper*) _root{
B4IViewWrapper* _v1 = nil;
B4IButtonWrapper* _b1 = nil;
B4ILabelWrapper* _l2 = nil;
 //BA.debugLineNum = 248;BA.debugLine="Sub ChangeFont(Root As Panel)";
 //BA.debugLineNum = 250;BA.debugLine="For Each v1 As View In Root.GetAllViewsRecursive";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group1 = [_root GetAllViewsRecursive];
const int groupLen1 = group1.Size
;int index1 = 0;
;
for (; index1 < groupLen1;index1++){
_v1.object = (UIView*)([group1 Get:index1]);
 //BA.debugLineNum = 251;BA.debugLine="If v1.Tag = \"icon\" Then";
if ([[_v1 Tag] isEqual:(NSObject*)(@"icon")]) { 
 //BA.debugLineNum = 252;BA.debugLine="If v1 Is Button Then";
if ([_v1.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 253;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 254;BA.debugLine="b1 = v1";
_b1.object = (UIButton*)((_v1).object);
 //BA.debugLineNum = 255;BA.debugLine="SetFont(b1.CustomLabel,\"icomoon\",b1.CustomLabe";
[self _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([_b1 CustomLabel]).object)] :@"icomoon" :(int) ([[[_b1 CustomLabel] Font] Size])];
 }else if([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 257;BA.debugLine="Dim l2 As Label";
_l2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 258;BA.debugLine="l2 = v1";
_l2.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 259;BA.debugLine="SetFont(l2,\"icomoon\",l2.Font.Size)";
[self _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_l2).object)] :@"icomoon" :(int) ([[_l2 Font] Size])];
 };
 }else {
 //BA.debugLineNum = 262;BA.debugLine="If v1 Is Button Then";
if ([_v1.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 263;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 264;BA.debugLine="b1 = v1";
_b1.object = (UIButton*)((_v1).object);
 //BA.debugLineNum = 265;BA.debugLine="b1.CustomLabel.Font = GetFont(b1.CustomLabel.F";
[[_b1 CustomLabel] setFont:[self _getfont:(int) ([[[_b1 CustomLabel] Font] Size])]];
 }else if([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 267;BA.debugLine="Dim l2 As Label";
_l2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 268;BA.debugLine="l2 = v1";
_l2.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 269;BA.debugLine="l2.Font = GetFont(l2.Font.Size)";
[_l2 setFont:[self _getfont:(int) ([[_l2 Font] Size])]];
 };
 };
 }
};
 //BA.debugLineNum = 274;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _changenavigationcolor{
B4INativeObject* _no = nil;
 //BA.debugLineNum = 298;BA.debugLine="Sub ChangeNavigationColor";
 //BA.debugLineNum = 299;BA.debugLine="Dim no As NativeObject = NavControl";
_no = [B4INativeObject new];
_no.object = (NSObject*)((self._navcontrol).object);
 //BA.debugLineNum = 300;BA.debugLine="no.GetField(\"navigationBar\").RunMethod(\"setBarTin";
[[_no GetField:@"navigationBar"] RunMethod:@"setBarTintColor:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)([_no ColorToUIColor:self._theme_header])]]]];
 //BA.debugLineNum = 301;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _converthex2int:(NSString*) _hex{
int _r = 0;
int _g = 0;
int _b = 0;
 //BA.debugLineNum = 169;BA.debugLine="Sub ConvertHex2Int(hex As String) As String";
 //BA.debugLineNum = 170;BA.debugLine="Dim R,G,b As Int";
_r = 0;
_g = 0;
_b = 0;
 //BA.debugLineNum = 171;BA.debugLine="R = Bit.ParseInt(hex.SubString2(1,3), 16)";
_r = [[self.__c Bit] ParseInt:[_hex SubString2:(int) (1) :(int) (3)] :(int) (16)];
 //BA.debugLineNum = 172;BA.debugLine="G = Bit.ParseInt(hex.SubString2(3,5), 16)";
_g = [[self.__c Bit] ParseInt:[_hex SubString2:(int) (3) :(int) (5)] :(int) (16)];
 //BA.debugLineNum = 173;BA.debugLine="b = Bit.ParseInt(hex.SubString2(5,7), 16)";
_b = [[self.__c Bit] ParseInt:[_hex SubString2:(int) (5) :(int) (7)] :(int) (16)];
 //BA.debugLineNum = 174;BA.debugLine="Return Colors.RGB(R, G, b)";
if (true) return [self.bi NumberToString:@([[self.__c Colors] RGB:_r :_g :_b])];
 //BA.debugLineNum = 175;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _decrypt:(NSString*) _encrypteddata{
B4ICipher* _c = nil;
iStringUtils* _su = nil;
NSString* _key = @"";
B4IArray* _b = nil;
NSString* _temp = @"";
 //BA.debugLineNum = 303;BA.debugLine="Sub Decrypt(encryptedData As String ) As String";
 //BA.debugLineNum = 305;BA.debugLine="Dim c As Cipher";
_c = [B4ICipher new];
 //BA.debugLineNum = 306;BA.debugLine="Dim su As StringUtils";
_su = [iStringUtils new];
 //BA.debugLineNum = 307;BA.debugLine="Dim key As String = KEY_APP";
_key = self._key_app;
 //BA.debugLineNum = 308;BA.debugLine="Dim b() As Byte = c.Decrypt(su.DecodeBase64(encry";
_b = [_c Decrypt:[_su DecodeBase64:_encrypteddata] :_key];
 //BA.debugLineNum = 310;BA.debugLine="Dim temp As String";
_temp = @"";
 //BA.debugLineNum = 311;BA.debugLine="temp = BytesToString(b, 0, b.Length, \"utf-8\")";
_temp = [self.__c BytesToString:_b :(int) (0) :_b.Length :@"utf-8"];
 //BA.debugLineNum = 312;BA.debugLine="temp = temp.SubString2(0,temp.IndexOf(Chr(0)))";
_temp = [_temp SubString2:(int) (0) :[_temp IndexOf:[self.bi CharToString:[self.__c Chr:(int) (0)]]]];
 //BA.debugLineNum = 313;BA.debugLine="Return temp";
if (true) return _temp;
 //BA.debugLineNum = 315;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _discountprice:(NSString*) _price :(B4ILabelWrapper*) _label1{
b4i_richstring* _rich = nil;
 //BA.debugLineNum = 828;BA.debugLine="Public Sub DiscountPrice(Price As String,Label1 As";
 //BA.debugLineNum = 830;BA.debugLine="Dim rich As RichString";
_rich = [b4i_richstring new];
 //BA.debugLineNum = 831;BA.debugLine="rich.Initialize(Price)";
[_rich _initialize:self.bi :_price];
 //BA.debugLineNum = 832;BA.debugLine="rich.Color(Colors.Red,0,Price.Length)";
[_rich _color:[[self.__c Colors] Red] :(int) (0) :[_price Length]];
 //BA.debugLineNum = 833;BA.debugLine="rich.Strikethrough(True,0,Price.Length)";
[_rich _strikethrough:[self.__c True] :(int) (0) :[_price Length]];
 //BA.debugLineNum = 835;BA.debugLine="rich.SetToLabel(Label1)";
[_rich _settolabel:_label1];
 //BA.debugLineNum = 837;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _discountstylelabel:(NSString*) _price :(NSString*) _finalprice :(B4ILabelWrapper*) _label1{
NSString* _style = @"";
b4i_richstring* _rich = nil;
 //BA.debugLineNum = 658;BA.debugLine="Public Sub DiscountStyleLabel(Price As String,Fina";
 //BA.debugLineNum = 660;BA.debugLine="Dim style As String";
_style = @"";
 //BA.debugLineNum = 661;BA.debugLine="style = FinalPrice";
_style = _finalprice;
 //BA.debugLineNum = 662;BA.debugLine="Label1.Text = style";
[_label1 setText:_style];
 //BA.debugLineNum = 664;BA.debugLine="Dim rich As RichString";
_rich = [b4i_richstring new];
 //BA.debugLineNum = 665;BA.debugLine="rich.Initialize(Label1.Text)";
[_rich _initialize:self.bi :[_label1 Text]];
 //BA.debugLineNum = 666;BA.debugLine="rich.Color(Colors.RGB(34,157,40),0,FinalPrice.Len";
[_rich _color:[[self.__c Colors] RGB:(int) (34) :(int) (157) :(int) (40)] :(int) (0) :[_finalprice Length]];
 //BA.debugLineNum = 667;BA.debugLine="rich.Underline(True,Colors.RGB(236,236,236),0,Fin";
[_rich _underline:[self.__c True] :[[self.__c Colors] RGB:(int) (236) :(int) (236) :(int) (236)] :(int) (0) :[_finalprice Length]];
 //BA.debugLineNum = 669;BA.debugLine="rich.SetToLabel(Label1)";
[_rich _settolabel:_label1];
 //BA.debugLineNum = 671;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _encrypt:(NSString*) _data :(NSString*) _password{
B4ICipher* _c = nil;
iStringUtils* _su = nil;
NSString* _key = @"";
B4IArray* _b = nil;
NSString* _temp = @"";
 //BA.debugLineNum = 317;BA.debugLine="Sub Encrypt(Data As String,Password As String)";
 //BA.debugLineNum = 319;BA.debugLine="Dim c As Cipher";
_c = [B4ICipher new];
 //BA.debugLineNum = 320;BA.debugLine="Dim su As StringUtils";
_su = [iStringUtils new];
 //BA.debugLineNum = 321;BA.debugLine="Dim key As String = KEY_APP";
_key = self._key_app;
 //BA.debugLineNum = 322;BA.debugLine="Dim b() As Byte = c.Encrypt(Data.GetBytes(\"UTF8\")";
_b = [_c Encrypt:[_data GetBytes:@"UTF8"] :_password];
 //BA.debugLineNum = 324;BA.debugLine="Dim temp As String";
_temp = @"";
 //BA.debugLineNum = 325;BA.debugLine="temp = BytesToString(b, 0, b.Length, \"utf-8\")";
_temp = [self.__c BytesToString:_b :(int) (0) :_b.Length :@"utf-8"];
 //BA.debugLineNum = 326;BA.debugLine="temp = temp.SubString2(0,temp.IndexOf(Chr(0)))";
_temp = [_temp SubString2:(int) (0) :[_temp IndexOf:[self.bi CharToString:[self.__c Chr:(int) (0)]]]];
 //BA.debugLineNum = 327;BA.debugLine="Return temp";
if (true) return _temp;
 //BA.debugLineNum = 329;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _fullscreenapp:(B4IApplicationWrapper*) _app1{
B4INativeObject* _no = nil;
 //BA.debugLineNum = 62;BA.debugLine="Sub FullScreenApp(App1 As Application)";
 //BA.debugLineNum = 63;BA.debugLine="Dim no As NativeObject = App1";
_no = [B4INativeObject new];
_no.object = (NSObject*)((_app1).object);
 //BA.debugLineNum = 64;BA.debugLine="no.RunMethod(\"setStatusBarHidden:animated:\", Arra";
[_no RunMethod:@"setStatusBarHidden:animated:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@([self.__c True]))],[B4I nilToNSNull:(NSObject*)(@([self.__c True]))]]]];
 //BA.debugLineNum = 65;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getbuttonstate:(B4IButtonWrapper*) _button1{
 //BA.debugLineNum = 985;BA.debugLine="Sub GetButtonState(Button1 As Button)";
 //BA.debugLineNum = 987;BA.debugLine="Button1.Color = ConvertHex2Int(GetStringResourse(";
[_button1 setColor:[self.bi ObjectToNumber:[self _converthex2int:[self _getstringresourse:@"button_active_color"]]].intValue];
 //BA.debugLineNum = 988;BA.debugLine="Button1.SetBorder(1,ConvertHex2Int(GetStringResou";
[_button1 SetBorder:(float) (1) :[self.bi ObjectToNumber:[self _converthex2int:[self _getstringresourse:@"button_active_color"]]].intValue :(float) (4)];
 //BA.debugLineNum = 989;BA.debugLine="Button1.CustomLabel.TextColor = Colors.White";
[[_button1 CustomLabel] setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 991;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getdate:(NSString*) _date1{
B4IArray* _res = nil;
NSString* _month = @"";
B4IArray* _perdate = nil;
B4IArray* _pp = nil;
 //BA.debugLineNum = 769;BA.debugLine="Public Sub GetDate(date1 As String) As String";
 //BA.debugLineNum = 771;BA.debugLine="Dim res(),month,perDate() As String";
_res = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
_month = @"";
_perdate = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
 //BA.debugLineNum = 773;BA.debugLine="Dim pp() As String";
_pp = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
 //BA.debugLineNum = 775;BA.debugLine="pp = Regex.Split(\" \",date1)";
_pp = [[self.__c Regex] Split:@" " :_date1];
 //BA.debugLineNum = 777;BA.debugLine="Try";
@try { //BA.debugLineNum = 779;BA.debugLine="If pp(0).IndexOf(\"-\") > -1 Then";
if ([((NSString*)[_pp getObjectFast:(int) (0)]) IndexOf:@"-"]>-1) { 
 //BA.debugLineNum = 780;BA.debugLine="res = Regex.Split(\"-\",pp(0))";
_res = [[self.__c Regex] Split:@"-" :((NSString*)[_pp getObjectFast:(int) (0)])];
 }else {
 //BA.debugLineNum = 782;BA.debugLine="res = Regex.Split(\"/\",pp(0))";
_res = [[self.__c Regex] Split:@"/" :((NSString*)[_pp getObjectFast:(int) (0)])];
 };
 //BA.debugLineNum = 785;BA.debugLine="month = res(1)";
_month = ((NSString*)[_res getObjectFast:(int) (1)]);
 //BA.debugLineNum = 787;BA.debugLine="perDate = Regex.Split(\"/\",Julian2Persian(res(0),";
_perdate = [[self.__c Regex] Split:@"/" :[self _julian2persian:[self.bi ObjectToNumber:((NSString*)[_res getObjectFast:(int) (0)])].intValue :[self.bi ObjectToNumber:_month].intValue :[self.bi ObjectToNumber:((NSString*)[_res getObjectFast:(int) (2)])].intValue :@"/"]];
 //BA.debugLineNum = 789;BA.debugLine="Select Case perDate(1)";
switch ([self.bi switchObjectToInt:((NSString*)[_perdate getObjectFast:(int) (1)]) :@[[self.bi NumberToString:@(1)],[self.bi NumberToString:@(2)],[self.bi NumberToString:@(3)],[self.bi NumberToString:@(4)],[self.bi NumberToString:@(5)],[self.bi NumberToString:@(6)],[self.bi NumberToString:@(7)],[self.bi NumberToString:@(8)],[self.bi NumberToString:@(9)],[self.bi NumberToString:@(10)],[self.bi NumberToString:@(11)],[self.bi NumberToString:@(12)]]]) {
case 0: {
 //BA.debugLineNum = 791;BA.debugLine="month = \"فروردین\"";
_month = @"فروردین";
 break; }
case 1: {
 //BA.debugLineNum = 793;BA.debugLine="month = \"اردیبهشت\"";
_month = @"اردیبهشت";
 break; }
case 2: {
 //BA.debugLineNum = 795;BA.debugLine="month = \"خرداد\"";
_month = @"خرداد";
 break; }
case 3: {
 //BA.debugLineNum = 797;BA.debugLine="month = \"تیر\"";
_month = @"تیر";
 break; }
case 4: {
 //BA.debugLineNum = 799;BA.debugLine="month = \"مرداد\"";
_month = @"مرداد";
 break; }
case 5: {
 //BA.debugLineNum = 801;BA.debugLine="month = \"شهریور\"";
_month = @"شهریور";
 break; }
case 6: {
 //BA.debugLineNum = 803;BA.debugLine="month = \"مهر\"";
_month = @"مهر";
 break; }
case 7: {
 //BA.debugLineNum = 805;BA.debugLine="month = \"آبان\"";
_month = @"آبان";
 break; }
case 8: {
 //BA.debugLineNum = 807;BA.debugLine="month = \"آذر\"";
_month = @"آذر";
 break; }
case 9: {
 //BA.debugLineNum = 809;BA.debugLine="month = \"دی\"";
_month = @"دی";
 break; }
case 10: {
 //BA.debugLineNum = 811;BA.debugLine="month = \"بهمن\"";
_month = @"بهمن";
 break; }
case 11: {
 //BA.debugLineNum = 813;BA.debugLine="month = \"اسفند\"";
_month = @"اسفند";
 break; }
}
;
 //BA.debugLineNum = 816;BA.debugLine="Return perDate(2) & \" \" & month & \" ماه \" & \" \"";
if (true) return [@[((NSString*)[_perdate getObjectFast:(int) (2)]),@" ",_month,@" ماه ",@" ",((NSString*)[_perdate getObjectFast:(int) (0)])] componentsJoinedByString:@""];
 } 
       @catch (NSException* e40) {
			[B4I SetException:e40]; //BA.debugLineNum = 819;BA.debugLine="Return date1";
if (true) return _date1;
 };
 //BA.debugLineNum = 822;BA.debugLine="End Sub";
return @"";
}
- (float)  _getdevicephysicalsize{
B4ILayoutValues* _lv = nil;
float _t = 0.0f;
 //BA.debugLineNum = 81;BA.debugLine="Sub GetDevicePhysicalSize As Float";
 //BA.debugLineNum = 82;BA.debugLine="Dim lv As LayoutValues";
_lv = [B4ILayoutValues new];
 //BA.debugLineNum = 83;BA.debugLine="lv = GetDeviceLayoutValues";
_lv = [self.__c GetDeviceLayoutValues];
 //BA.debugLineNum = 84;BA.debugLine="Dim t As Float";
_t = 0.0f;
 //BA.debugLineNum = 85;BA.debugLine="t = Sqrt(Power(lv.Height / lv.Scale / 160, 2)";
_t = (float) ([self.__c Sqrt:[self.__c Power:[_lv Height]/(double)[_lv Scale]/(double)160 :2]+[self.__c Power:[_lv Width]/(double)[_lv Scale]/(double)160 :2]]);
 //BA.debugLineNum = 86;BA.debugLine="Return t";
if (true) return _t;
 //BA.debugLineNum = 87;BA.debugLine="End Sub";
return 0.0f;
}
- (NSString*)  _getfilename:(NSString*) _fullpath{
 //BA.debugLineNum = 77;BA.debugLine="Sub GetFilename(fullpath As String) As String";
 //BA.debugLineNum = 78;BA.debugLine="Return fullpath.SubString(fullpath.LastIndexOf(";
if (true) return [_fullpath SubString:(int) ([_fullpath LastIndexOf:@"/"]+1)];
 //BA.debugLineNum = 79;BA.debugLine="End Sub";
return @"";
}
- (B4IFontWrapper*)  _getfont:(int) _fontsize{
 //BA.debugLineNum = 839;BA.debugLine="Sub GetFont(FontSize As Int) As Font";
 //BA.debugLineNum = 841;BA.debugLine="If IsPersian Then";
if ([self _ispersian]) { 
 //BA.debugLineNum = 843;BA.debugLine="Return Font.CreateNew2(\"iransans\",FontSize)";
if (true) return [[self.__c Font] CreateNew2:@"iransans" :(float) (_fontsize)];
 }else {
 //BA.debugLineNum = 845;BA.debugLine="Return Font.DEFAULT";
if (true) return [[self.__c Font] DEFAULT];
 };
 //BA.debugLineNum = 848;BA.debugLine="End Sub";
return nil;
}
- (int)  _getheight{
B4ILayoutValues* _lv = nil;
 //BA.debugLineNum = 95;BA.debugLine="Sub GetHeight As Int";
 //BA.debugLineNum = 96;BA.debugLine="Dim lv As LayoutValues";
_lv = [B4ILayoutValues new];
 //BA.debugLineNum = 97;BA.debugLine="lv = GetDeviceLayoutValues";
_lv = [self.__c GetDeviceLayoutValues];
 //BA.debugLineNum = 98;BA.debugLine="Return lv.Height";
if (true) return [_lv Height];
 //BA.debugLineNum = 99;BA.debugLine="End Sub";
return 0;
}
- (int)  _getlimitloaditem{
 //BA.debugLineNum = 67;BA.debugLine="Public Sub GetLimitLoadItem As Int";
 //BA.debugLineNum = 69;BA.debugLine="If GetDevicePhysicalSize > 6 Then";
if ([self _getdevicephysicalsize]>6) { 
 //BA.debugLineNum = 70;BA.debugLine="Return 12";
if (true) return (int) (12);
 }else {
 //BA.debugLineNum = 72;BA.debugLine="Return 7";
if (true) return (int) (7);
 };
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
return 0;
}
- (B4IViewWrapper*)  _getparent:(B4IViewWrapper*) _view1{
B4INativeObject* _no = nil;
B4IViewWrapper* _parent = nil;
 //BA.debugLineNum = 44;BA.debugLine="Sub GetParent(View1 As View) As View";
 //BA.debugLineNum = 46;BA.debugLine="Dim No As NativeObject = View1";
_no = [B4INativeObject new];
_no.object = (NSObject*)((_view1).object);
 //BA.debugLineNum = 47;BA.debugLine="Dim parent As View = No.GetField(\"superview\")";
_parent = [B4IViewWrapper new];
_parent.object = (UIView*)(([_no GetField:@"superview"]).object);
 //BA.debugLineNum = 49;BA.debugLine="Return parent";
if (true) return _parent;
 //BA.debugLineNum = 51;BA.debugLine="End Sub";
return nil;
}
- (B4IArray*)  _getparentpaneldimension:(NSString*) _layoutname{
B4IPanelWrapper* _p1 = nil;
B4IViewWrapper* _parent = nil;
B4IViewWrapper* _v1 = nil;
 //BA.debugLineNum = 406;BA.debugLine="Public Sub GetParentPanelDimension(LayoutName As S";
 //BA.debugLineNum = 408;BA.debugLine="If TempDimension.Length > 0 Then Return TempDimen";
if (self._tempdimension.Length>0) { 
if (true) return self._tempdimension;};
 //BA.debugLineNum = 410;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 411;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 412;BA.debugLine="p1.LoadLayout(LayoutName)";
[_p1 LoadLayout:_layoutname :self.bi];
 //BA.debugLineNum = 414;BA.debugLine="Dim parent As View";
_parent = [B4IViewWrapper new];
 //BA.debugLineNum = 415;BA.debugLine="Dim v1 As View";
_v1 = [B4IViewWrapper new];
 //BA.debugLineNum = 417;BA.debugLine="For Each v1 As View In p1.GetAllViewsRecursive";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group7 = [_p1 GetAllViewsRecursive];
const int groupLen7 = group7.Size
;int index7 = 0;
;
for (; index7 < groupLen7;index7++){
_v1.object = (UIView*)([group7 Get:index7]);
 //BA.debugLineNum = 418;BA.debugLine="If v1 Is Panel Then";
if ([_v1.objectOrNull isKindOfClass: [B4IPanelView class]]) { 
 //BA.debugLineNum = 419;BA.debugLine="parent = v1";
_parent = _v1;
 //BA.debugLineNum = 420;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 424;BA.debugLine="TempDimension = Array As Int(parent.Width,parent.";
self._tempdimension = [[B4IArray alloc]initObjectsWithData:@[@((int) ([_parent Width])),@((int) ([_parent Height]))]];
 //BA.debugLineNum = 426;BA.debugLine="Return Array As Int(parent.Width,parent.Height)";
if (true) return [[B4IArray alloc]initObjectsWithData:@[@((int) ([_parent Width])),@((int) ([_parent Height]))]];
 //BA.debugLineNum = 428;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _getstringresourse:(NSString*) _key{
NSString* _str = @"";
B4IMatcher* _match = nil;
B4IMatcher* _match1 = nil;
 //BA.debugLineNum = 214;BA.debugLine="Sub GetStringResourse(Key As String) As String";
 //BA.debugLineNum = 216;BA.debugLine="Dim str As String";
_str = @"";
 //BA.debugLineNum = 218;BA.debugLine="Dim match,match1 As Matcher";
_match = [B4IMatcher new];
_match1 = [B4IMatcher new];
 //BA.debugLineNum = 219;BA.debugLine="match = Regex.Matcher($\"<string name=\"${Key}\">(\\S";
_match = [[self.__c Regex] Matcher:([@[@"<string name=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)(_key)],@"\">(\\S+)</string>"] componentsJoinedByString:@""]) :self._stringresourse];
 //BA.debugLineNum = 221;BA.debugLine="If match.Find Then";
if ([_match Find]) { 
 //BA.debugLineNum = 222;BA.debugLine="str = match.Group(1)";
_str = [_match Group:(int) (1)];
 //BA.debugLineNum = 223;BA.debugLine="Return str";
if (true) return _str;
 }else {
 //BA.debugLineNum = 225;BA.debugLine="match1 = Regex.Matcher($\"<string name=\"${Key}\">(";
_match1 = [[self.__c Regex] Matcher:([@[@"<string name=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)(_key)],@"\">([^a-zA-Z0-9]+)</string>"] componentsJoinedByString:@""]) :self._stringresourse];
 //BA.debugLineNum = 226;BA.debugLine="If match1.Find Then";
if ([_match1 Find]) { 
 //BA.debugLineNum = 227;BA.debugLine="str = match1.Group(1)";
_str = [_match1 Group:(int) (1)];
 //BA.debugLineNum = 228;BA.debugLine="Return str";
if (true) return _str;
 }else {
 //BA.debugLineNum = 230;BA.debugLine="If Language.ContainsKey(Key) Then";
if ([self._language ContainsKey:(NSObject*)(_key)]) { 
 //BA.debugLineNum = 231;BA.debugLine="str = Language.Get(Key)";
_str = [self.bi ObjectToString:[self._language Get:(NSObject*)(_key)]];
 //BA.debugLineNum = 232;BA.debugLine="Return str";
if (true) return _str;
 }else {
 //BA.debugLineNum = 235;BA.debugLine="match1 = Regex.Matcher($\"<string name=\"${Key}\"";
_match1 = [[self.__c Regex] Matcher:([@[@"<string name=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)(_key)],@"\">(.*)</string>"] componentsJoinedByString:@""]) :self._stringresourse];
 //BA.debugLineNum = 236;BA.debugLine="If match1.Find Then";
if ([_match1 Find]) { 
 //BA.debugLineNum = 237;BA.debugLine="str = match1.Group(1)";
_str = [_match1 Group:(int) (1)];
 //BA.debugLineNum = 238;BA.debugLine="Return str";
if (true) return _str;
 }else {
 //BA.debugLineNum = 240;BA.debugLine="Return \"\"";
if (true) return @"";
 };
 };
 };
 };
 //BA.debugLineNum = 246;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getstringresourse2:(NSString*) _key{
 //BA.debugLineNum = 288;BA.debugLine="Sub GetStringResourse2(Key As String) As String";
 //BA.debugLineNum = 290;BA.debugLine="If Language.ContainsKey(Key) Then";
if ([self._language ContainsKey:(NSObject*)(_key)]) { 
 //BA.debugLineNum = 291;BA.debugLine="Return Language.Get(Key)";
if (true) return [self.bi ObjectToString:[self._language Get:(NSObject*)(_key)]];
 }else {
 //BA.debugLineNum = 293;BA.debugLine="Return \"\"";
if (true) return @"";
 };
 //BA.debugLineNum = 296;BA.debugLine="End Sub";
return @"";
}
- (int)  _getwidth{
B4ILayoutValues* _lv = nil;
 //BA.debugLineNum = 89;BA.debugLine="Sub GetWidth As Int";
 //BA.debugLineNum = 90;BA.debugLine="Dim lv As LayoutValues";
_lv = [B4ILayoutValues new];
 //BA.debugLineNum = 91;BA.debugLine="lv = GetDeviceLayoutValues";
_lv = [self.__c GetDeviceLayoutValues];
 //BA.debugLineNum = 92;BA.debugLine="Return lv.Width";
if (true) return [_lv Width];
 //BA.debugLineNum = 93;BA.debugLine="End Sub";
return 0;
}
- (BOOL)  _internetstate{
B4IServerSocketWrapper* _mylan = nil;
 //BA.debugLineNum = 360;BA.debugLine="Sub InternetState As Boolean";
 //BA.debugLineNum = 362;BA.debugLine="Dim myLAN As ServerSocket";
_mylan = [B4IServerSocketWrapper new];
 //BA.debugLineNum = 364;BA.debugLine="If myLAN.GetMyIP = \"127.0.0.1\" Then";
if ([[_mylan GetMyIP] isEqual:@"127.0.0.1"]) { 
 //BA.debugLineNum = 365;BA.debugLine="Return False";
if (true) return [self.__c False];
 }else {
 //BA.debugLineNum = 367;BA.debugLine="Return True";
if (true) return [self.__c True];
 };
 //BA.debugLineNum = 370;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _isenglish{
 //BA.debugLineNum = 870;BA.debugLine="Sub IsEnglish As Boolean";
 //BA.debugLineNum = 872;BA.debugLine="If setting.GetString(\"lang\").IndexOf(\"انگلیسی\") >";
if ([[self._setting GetString:@"lang"] IndexOf:@"انگلیسی"]>-1 || [[[self._setting GetString:@"lang"] ToLowerCase] IndexOf:@"english"]>-1) { 
 //BA.debugLineNum = 873;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 875;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 878;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _isenglish2:(NSString*) _lang{
 //BA.debugLineNum = 880;BA.debugLine="Sub IsEnglish2(Lang As String) As Boolean";
 //BA.debugLineNum = 882;BA.debugLine="If Lang.IndexOf(\"انگلیسی\") > -1 Or Lang.ToLowerCa";
if ([_lang IndexOf:@"انگلیسی"]>-1 || [[_lang ToLowerCase] IndexOf:@"english"]>-1) { 
 //BA.debugLineNum = 883;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 885;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 888;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _ispersian{
 //BA.debugLineNum = 850;BA.debugLine="Sub IsPersian As Boolean";
 //BA.debugLineNum = 852;BA.debugLine="If setting.GetString(\"lang\").IndexOf(\"فارسی\") > -";
if ([[self._setting GetString:@"lang"] IndexOf:@"فارسی"]>-1 || [[[self._setting GetString:@"lang"] ToLowerCase] IndexOf:@"persian"]>-1) { 
 //BA.debugLineNum = 853;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 855;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 858;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _ispersian2:(NSString*) _lang{
 //BA.debugLineNum = 860;BA.debugLine="Sub IsPersian2(Lang As String) As Boolean";
 //BA.debugLineNum = 862;BA.debugLine="If Lang.IndexOf(\"فارسی\") > -1 Or Lang.ToLowerCase";
if ([_lang IndexOf:@"فارسی"]>-1 || [[_lang ToLowerCase] IndexOf:@"persian"]>-1) { 
 //BA.debugLineNum = 863;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 865;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 868;BA.debugLine="End Sub";
return false;
}
- (NSString*)  _julian2persian:(int) _year :(int) _month :(int) _day :(NSString*) _seprator{
int _daynumber = 0;
unsigned char _kabiseh = 0;
NSString* _s = @"";
 //BA.debugLineNum = 673;BA.debugLine="Public Sub Julian2Persian(Year As Int,Month As Int";
 //BA.debugLineNum = 675;BA.debugLine="Dim DayNumber As Int";
_daynumber = 0;
 //BA.debugLineNum = 676;BA.debugLine="Dim Kabiseh As Byte";
_kabiseh = 0;
 //BA.debugLineNum = 677;BA.debugLine="Dim S As String";
_s = @"";
 //BA.debugLineNum = 679;BA.debugLine="If Year = 0 And Month = 0 And Day = 0 Then";
if (_year==0 && _month==0 && _day==0) { 
 //BA.debugLineNum = 680;BA.debugLine="Year = DateTime.GetYear(DateTime.Now)";
_year = [[self.__c DateTime] GetYear:[[self.__c DateTime] Now]];
 //BA.debugLineNum = 681;BA.debugLine="Month = DateTime.GetMonth(DateTime.Now)";
_month = [[self.__c DateTime] GetMonth:[[self.__c DateTime] Now]];
 //BA.debugLineNum = 682;BA.debugLine="Day   = DateTime.GetDayOfMonth(DateTime.Now)";
_day = [[self.__c DateTime] GetDayOfMonth:[[self.__c DateTime] Now]];
 };
 //BA.debugLineNum = 685;BA.debugLine="DayNumber = (Year - 622 Mod 1000) Mod 100";
_daynumber = (int) ((_year-622%1000)%100);
 //BA.debugLineNum = 687;BA.debugLine="If (((Year Mod 1000) Mod 100) = DayNumber) Or _";
if ((((_year%1000)%100)==_daynumber) || (((_year%1000)%100)==_daynumber+1)) { 
 //BA.debugLineNum = 689;BA.debugLine="Year = 1300 + ((Year Mod 1000) Mod 100)";
_year = (int) (1300+((_year%1000)%100));
 //BA.debugLineNum = 690;BA.debugLine="Return Year & seprator & Month & seprator & Day";
if (true) return [@[[self.bi NumberToString:@(_year)],_seprator,[self.bi NumberToString:@(_month)],_seprator,[self.bi NumberToString:@(_day)]] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 693;BA.debugLine="If Year Mod 4 = 0 Then Kabiseh = 1 Else Kabiseh =";
if (_year%4==0) { 
_kabiseh = (unsigned char) (1);}
else {
_kabiseh = (unsigned char) (0);};
 //BA.debugLineNum = 695;BA.debugLine="Select Month";
switch (_month) {
case 1: {
 //BA.debugLineNum = 696;BA.debugLine="Case 1: DayNumber = Day";
_daynumber = _day;
 break; }
case 2: {
 //BA.debugLineNum = 697;BA.debugLine="Case 2: DayNumber = 31 + Day";
_daynumber = (int) (31+_day);
 break; }
case 3: {
 //BA.debugLineNum = 698;BA.debugLine="Case 3: DayNumber = 31 + 28 + Kabiseh + Day";
_daynumber = (int) (31+28+_kabiseh+_day);
 break; }
case 4: {
 //BA.debugLineNum = 699;BA.debugLine="Case 4: DayNumber = 31 + 28 + Kabiseh + 31 + Day";
_daynumber = (int) (31+28+_kabiseh+31+_day);
 break; }
case 5: {
 //BA.debugLineNum = 700;BA.debugLine="Case 5: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+_day);
 break; }
case 6: {
 //BA.debugLineNum = 701;BA.debugLine="Case 6: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+31+_day);
 break; }
case 7: {
 //BA.debugLineNum = 702;BA.debugLine="Case 7: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+31+30+_day);
 break; }
case 8: {
 //BA.debugLineNum = 703;BA.debugLine="Case 8: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+31+30+31+_day);
 break; }
case 9: {
 //BA.debugLineNum = 704;BA.debugLine="Case 9: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+31+30+31+31+_day);
 break; }
case 10: {
 //BA.debugLineNum = 705;BA.debugLine="Case 10: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+31+30+31+31+30+_day);
 break; }
case 11: {
 //BA.debugLineNum = 706;BA.debugLine="Case 11: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+31+30+31+31+30+31+_day);
 break; }
case 12: {
 //BA.debugLineNum = 707;BA.debugLine="Case 12: DayNumber = 31 + 28 + Kabiseh + 31 + 30";
_daynumber = (int) (31+28+_kabiseh+31+30+31+30+31+31+30+31+30+_day);
 break; }
}
;
 //BA.debugLineNum = 710;BA.debugLine="Year = Year - 622";
_year = (int) (_year-622);
 //BA.debugLineNum = 711;BA.debugLine="Month = Month + 9";
_month = (int) (_month+9);
 //BA.debugLineNum = 713;BA.debugLine="If DayNumber > 79 Then";
if (_daynumber>79) { 
 //BA.debugLineNum = 714;BA.debugLine="DayNumber = DayNumber - (79 - Kabiseh)";
_daynumber = (int) (_daynumber-(79-_kabiseh));
 //BA.debugLineNum = 715;BA.debugLine="Year = Year + 1";
_year = (int) (_year+1);
 }else {
 //BA.debugLineNum = 717;BA.debugLine="DayNumber = DayNumber + (286 + Kabiseh)";
_daynumber = (int) (_daynumber+(286+_kabiseh));
 };
 //BA.debugLineNum = 720;BA.debugLine="If Month > 12 Then Month = Month - 11";
if (_month>12) { 
_month = (int) (_month-11);};
 //BA.debugLineNum = 722;BA.debugLine="If DayNumber <= 186 Then";
if (_daynumber<=186) { 
 //BA.debugLineNum = 723;BA.debugLine="Month = (DayNumber / 31) + 1";
_month = (int) ((_daynumber/(double)31)+1);
 //BA.debugLineNum = 724;BA.debugLine="If (DayNumber Mod 31) = 0 Then Month = Month -";
if ((_daynumber%31)==0) { 
_month = (int) (_month-1);};
 //BA.debugLineNum = 725;BA.debugLine="Day = (DayNumber Mod 31)";
_day = (int) ((_daynumber%31));
 //BA.debugLineNum = 726;BA.debugLine="If Day = 0 Then Day = 31";
if (_day==0) { 
_day = (int) (31);};
 }else {
 //BA.debugLineNum = 728;BA.debugLine="Month = 7 + ((DayNumber - 186) / 30)";
_month = (int) (7+((_daynumber-186)/(double)30));
 //BA.debugLineNum = 729;BA.debugLine="If Month > 12 Then Month = 12";
if (_month>12) { 
_month = (int) (12);};
 //BA.debugLineNum = 730;BA.debugLine="If ((DayNumber - 186) Mod 30) = 0 Then Month =";
if (((_daynumber-186)%30)==0) { 
_month = (int) (_month-1);};
 //BA.debugLineNum = 731;BA.debugLine="Day = (DayNumber - 186) Mod 30";
_day = (int) ((_daynumber-186)%30);
 //BA.debugLineNum = 732;BA.debugLine="If Day = 0 Then Day = 30";
if (_day==0) { 
_day = (int) (30);};
 };
 //BA.debugLineNum = 735;BA.debugLine="Return Year & seprator & Month & seprator & Day";
if (true) return [@[[self.bi NumberToString:@(_year)],_seprator,[self.bi NumberToString:@(_month)],_seprator,[self.bi NumberToString:@(_day)]] componentsJoinedByString:@""];
 //BA.debugLineNum = 737;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _labelspace:(B4IViewWrapper*) _view1 :(float) _space{
 //BA.debugLineNum = 824;BA.debugLine="Sub LabelSpace(view1 As View,Space As Float)";
 //BA.debugLineNum = 826;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadlanguage:(NSString*) _lang{
NSString* _langs = @"";
B4IMatcher* _match = nil;
 //BA.debugLineNum = 372;BA.debugLine="Sub LoadLanguage(Lang As String)";
 //BA.debugLineNum = 374;BA.debugLine="Dim Langs As String = File.ReadString(File.DirAss";
_langs = [[self.__c File] ReadString:[[self.__c File] DirAssets] :[@[_lang,@".xml"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 375;BA.debugLine="Language.Initialize";
[self._language Initialize];
 //BA.debugLineNum = 377;BA.debugLine="Dim match As Matcher";
_match = [B4IMatcher new];
 //BA.debugLineNum = 378;BA.debugLine="match = Regex.Matcher($\"<string name=\"(.*)\">(.*)<";
_match = [[self.__c Regex] Matcher:(@"<string name=\"(.*)\">(.*)</string>") :_langs];
 //BA.debugLineNum = 380;BA.debugLine="Do While match.Find";
while ([_match Find]) {
 //BA.debugLineNum = 381;BA.debugLine="Language.Put(match.Group(1),match.Group(2))";
[self._language Put:(NSObject*)([_match Group:(int) (1)]) :(NSObject*)([_match Group:(int) (2)])];
 }
;
 //BA.debugLineNum = 384;BA.debugLine="Language.Put(\"CurrLang\",Lang)";
[self._language Put:(NSObject*)(@"CurrLang") :(NSObject*)(_lang)];
 //BA.debugLineNum = 386;BA.debugLine="End Sub";
return @"";
}
- (int)  _loadproduct:(B4IList*) _res :(int) _defaulttop :(B4IScrollView*) _scrollview1{
B4IArray* _dimension = nil;
int _left = 0;
int _top = 0;
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
 //BA.debugLineNum = 430;BA.debugLine="Sub LoadProduct(res As List,DefaultTop As Int,Scro";
 //BA.debugLineNum = 432;BA.debugLine="Dim Dimension(),Left,Top As Int";
_dimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
_left = 0;
_top = 0;
 //BA.debugLineNum = 433;BA.debugLine="Dim countItem,AllSpace,SpaceUnit As Int";
_countitem = 0;
_allspace = 0;
_spaceunit = 0;
 //BA.debugLineNum = 435;BA.debugLine="Dimension = GetParentPanelDimension(\"frmproduct_t";
_dimension = [self _getparentpaneldimension:@"frmproduct_template"];
 //BA.debugLineNum = 437;BA.debugLine="countItem = GetWidth / Dimension(0)";
_countitem = (int) ([self _getwidth]/(double)((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 //BA.debugLineNum = 438;BA.debugLine="AllSpace = GetWidth - (countItem * Dimension(0))";
_allspace = (int) ([self _getwidth]-(_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue));
 //BA.debugLineNum = 440;BA.debugLine="SpaceUnit = AllSpace /(countItem + 1)";
_spaceunit = (int) (_allspace/(double)(_countitem+1));
 //BA.debugLineNum = 442;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0)";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 444;BA.debugLine="If GetDevicePhysicalSize > 5 Then Left = Left - (";
if ([self _getdevicephysicalsize]>5) { 
_left = (int) (_left-(_spaceunit*2));};
 //BA.debugLineNum = 447;BA.debugLine="Top = DefaultTop";
_top = _defaulttop;
 //BA.debugLineNum = 449;BA.debugLine="For i = 1 To res.Size";
{
const int step10 = 1;
const int limit10 = [_res Size];
_i = (int) (1) ;
for (;(step10 > 0 && _i <= limit10) || (step10 < 0 && _i >= limit10) ;_i = ((int)(0 + _i + step10))  ) {
 //BA.debugLineNum = 451;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 452;BA.debugLine="pa.Initialize(\"\")";
[_pa Initialize:self.bi :@""];
 //BA.debugLineNum = 453;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,Top,ScrollView";
[[_scrollview1 Panel] AddView:(UIView*)((_pa).object) :(float) (_left) :(float) (_top) :[_scrollview1 Width] :(float) (0)];
 //BA.debugLineNum = 454;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
[_pa LoadLayout:@"frmproduct_template" :self.bi];
 //BA.debugLineNum = 455;BA.debugLine="pa.Height = Dimension(1)";
[_pa setHeight:(float) (((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 //BA.debugLineNum = 457;BA.debugLine="Dim Temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 458;BA.debugLine="Temp = res.Get(i-1)";
_temp = (B4IMap*)([_res Get:(int) (_i-1)]);
 //BA.debugLineNum = 461;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = [B4IImageViewWrapper new];
 //BA.debugLineNum = 463;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = [B4ILabelWrapper new];
_labelprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 464;BA.debugLine="Dim TempPanel As Panel";
_temppanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 465;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = [B4IPanelWrapper new];
_parentpanel.object = (B4IPanelView*)(([_pa GetView:(int) (0)]).object);
 //BA.debugLineNum = 468;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.object = (UIImageView*)(([_parentpanel GetView:(int) (4)]).object);
 //BA.debugLineNum = 469;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.object = (UILabel*)(([_parentpanel GetView:(int) (1)]).object);
 //BA.debugLineNum = 470;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.object = (UILabel*)(([_parentpanel GetView:(int) (2)]).object);
 //BA.debugLineNum = 471;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.object = (B4IPanelView*)(([_parentpanel GetView:(int) (6)]).object);
 //BA.debugLineNum = 473;BA.debugLine="TempLabel.Text = Temp.Get(\"name\")";
[_templabel setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 474;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
[_templabel setText:[[[_templabel Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 476;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 478;BA.debugLine="If Temp.ContainsKey(\"price_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"price_formated")]) { 
 //BA.debugLineNum = 479;BA.debugLine="price   = Temp.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price_formated")]];
 }else {
 //BA.debugLineNum = 481;BA.debugLine="price   = Temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 };
 //BA.debugLineNum = 484;BA.debugLine="If Temp.ContainsKey(\"special_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"special_formated")]) { 
 //BA.debugLineNum = 485;BA.debugLine="special = Temp.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special_formated")]];
 }else if([_temp ContainsKey:(NSObject*)(@"special")]) { 
 //BA.debugLineNum = 487;BA.debugLine="special = Temp.Get(\"special\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special")]];
 };
 //BA.debugLineNum = 490;BA.debugLine="If special = \"null\" Or special = \"false\" Then sp";
if ([_special isEqual:@"null"] || [_special isEqual:@"false"]) { 
_special = @"";};
 //BA.debugLineNum = 492;BA.debugLine="TempLabel.Font = GetFont(LabelPrice.Font.Size)";
[_templabel setFont:[self _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 493;BA.debugLine="LabelPrice.Font = GetFont(LabelPrice.Font.Size)";
[_labelprice setFont:[self _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 495;BA.debugLine="Log(special <> 0)";
[self.__c Log:[self.bi BooleanToString:[_special isEqual:[self.bi NumberToString:@(0)]] == false]];
 //BA.debugLineNum = 497;BA.debugLine="If price.Length > 0 And (special <> 0) <> False";
if ([_price Length]>0 && ([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 498;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 }else if(([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 500;BA.debugLine="DiscountStyleLabel(price,special,LabelPrice)";
[self _discountstylelabel:_price :_special :_labelprice];
 }else {
 //BA.debugLineNum = 502;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 };
 //BA.debugLineNum = 505;BA.debugLine="Dim PathImage As String";
_pathimage = @"";
 //BA.debugLineNum = 507;BA.debugLine="If Temp.ContainsKey(\"image\") Then";
if ([_temp ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 508;BA.debugLine="PathImage = Temp.Get(\"image\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"image")]];
 }else if([_temp ContainsKey:(NSObject*)(@"thumb")]) { 
 //BA.debugLineNum = 510;BA.debugLine="PathImage = Temp.Get(\"thumb\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 513;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ([[_pathimage ToLowerCase] isEqual:@"null"] || [_pathimage Length]==0) { 
 //BA.debugLineNum = 514;BA.debugLine="imgTemp.Bitmap = LoadBitmap(File.DirAssets,\"noi";
[_imgtemp setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"noimage.png"]];
 }else {
 //BA.debugLineNum = 516;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 517;BA.debugLine="img.Initialize";
[_img Initialize];
 //BA.debugLineNum = 518;BA.debugLine="img.Put(imgTemp,PathImage)";
[_img Put:(NSObject*)((_imgtemp).object) :(NSObject*)(_pathimage)];
 //BA.debugLineNum = 519;BA.debugLine="Dim imgdownloader As ImageDownloader";
_imgdownloader = [b4i_imagedownloader new];
 //BA.debugLineNum = 520;BA.debugLine="imgdownloader.Initialize";
[_imgdownloader _initialize:self.bi];
 //BA.debugLineNum = 521;BA.debugLine="imgdownloader.Download(img)";
[_imgdownloader _download:_img];
 };
 //BA.debugLineNum = 524;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ([[_temppanel Tag] isEqual:(NSObject*)(@"over")]) { 
 //BA.debugLineNum = 525;BA.debugLine="TempPanel.Tag = Temp";
[_temppanel setTag:(NSObject*)(_temp)];
 }else if([[_temppanel Tag] isEqual:(NSObject*)(@"topbar")]) { 
 //BA.debugLineNum = 527;BA.debugLine="TempPanel.Color = Theme_Header";
[_temppanel setColor:self._theme_header];
 };
 //BA.debugLineNum = 532;BA.debugLine="If i Mod countItem = 0 Then";
if (_i%_countitem==0) { 
 //BA.debugLineNum = 533;BA.debugLine="Top = Top + pa.Height + 15dip";
_top = (int) (_top+[_pa Height]+[self.__c DipToCurrent:(int) (15)]);
 //BA.debugLineNum = 534;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.He";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+[_pa Height])];
 //BA.debugLineNum = 535;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 }else {
 //BA.debugLineNum = 538;BA.debugLine="Left = Left - SpaceUnit - Dimension(0)";
_left = (int) (_left-_spaceunit-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 };
 }
};
 //BA.debugLineNum = 544;BA.debugLine="If res.Size Mod countItem <> 0 Then";
if ([_res Size]%_countitem!=0) { 
 //BA.debugLineNum = 545;BA.debugLine="Top = Top + Dimension(1)";
_top = (int) (_top+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue);
 //BA.debugLineNum = 546;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.Hei";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 };
 //BA.debugLineNum = 549;BA.debugLine="Return Top";
if (true) return _top;
 //BA.debugLineNum = 551;BA.debugLine="End Sub";
return 0;
}
- (int)  _loadproducthorizontalscroll:(B4IList*) _res :(B4IScrollView*) _scrollview1{
int _left = 0;
B4IArray* _dimension = nil;
int _i = 0;
B4IMap* _temp = nil;
 //BA.debugLineNum = 553;BA.debugLine="Sub LoadProductHorizontalScroll(res As List,Scroll";
 //BA.debugLineNum = 555;BA.debugLine="Dim left As Int = 20";
_left = (int) (20);
 //BA.debugLineNum = 557;BA.debugLine="Dim Dimension() As Int";
_dimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
 //BA.debugLineNum = 558;BA.debugLine="Dimension = GetParentPanelDimension(\"frmproduct_t";
_dimension = [self _getparentpaneldimension:@"frmproduct_template"];
 //BA.debugLineNum = 560;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step4 = 1;
const int limit4 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4) ;_i = ((int)(0 + _i + step4))  ) {
 //BA.debugLineNum = 562;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 563;BA.debugLine="temp = res.Get(i)";
_temp = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 565;BA.debugLine="AddProduct2Panel(ScrollView1,left,Dimension,temp";
[self _addproduct2panel:_scrollview1 :_left :_dimension :_temp];
 //BA.debugLineNum = 567;BA.debugLine="left = left + Dimension(0) + 10dip";
_left = (int) (_left+((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+[self.__c DipToCurrent:(int) (10)]);
 }
};
 //BA.debugLineNum = 571;BA.debugLine="ScrollView1.Panel.Width = left";
[[_scrollview1 Panel] setWidth:(float) (_left)];
 //BA.debugLineNum = 572;BA.debugLine="ScrollView1.ContentWidth = left";
[_scrollview1 setContentWidth:_left];
 //BA.debugLineNum = 574;BA.debugLine="Return Dimension(0)";
if (true) return ((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue;
 //BA.debugLineNum = 576;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _loadtheme{
 //BA.debugLineNum = 186;BA.debugLine="Sub LoadTheme";
 //BA.debugLineNum = 187;BA.debugLine="Theme_Header = ConvertHex2Int(GetStringResourse(\"";
self._theme_header = [self.bi ObjectToNumber:[self _converthex2int:[self _getstringresourse:@"theme_header"]]].intValue;
 //BA.debugLineNum = 188;BA.debugLine="Theme_Footer = ConvertHex2Int(GetStringResourse(\"";
self._theme_footer = [self.bi ObjectToNumber:[self _converthex2int:[self _getstringresourse:@"theme_footer"]]].intValue;
 //BA.debugLineNum = 189;BA.debugLine="Theme_Background = ConvertHex2Int(GetStringResour";
self._theme_background = [self.bi ObjectToNumber:[self _converthex2int:[self _getstringresourse:@"theme_bg"]]].intValue;
 //BA.debugLineNum = 190;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _makedatedialog:(NSString*) _year :(NSString*) _month :(NSString*) _day :(B4IPanelWrapper*) _p1{
B4ILabelWrapper* _lblyear = nil;
B4ILabelWrapper* _lblmonth = nil;
B4ILabelWrapper* _lblday = nil;
B4IPickerWrapper* _spyear = nil;
B4IPickerWrapper* _spmonth = nil;
B4IPickerWrapper* _spday = nil;
NSString* _currday = @"";
NSString* _currmonth = @"";
NSString* _curryear = @"";
NSString* _date1 = @"";
B4IArray* _date2 = nil;
int _i = 0;
int _sfrom = 0;
int _j = 0;
int _s = 0;
 //BA.debugLineNum = 894;BA.debugLine="Public Sub MakeDateDialog(Year As String,Month As";
 //BA.debugLineNum = 896;BA.debugLine="Dim lblyear,lblmonth,lblday As Label";
_lblyear = [B4ILabelWrapper new];
_lblmonth = [B4ILabelWrapper new];
_lblday = [B4ILabelWrapper new];
 //BA.debugLineNum = 897;BA.debugLine="lblyear.Initialize(\"\")";
[_lblyear Initialize:self.bi :@""];
 //BA.debugLineNum = 898;BA.debugLine="lblmonth.Initialize(\"\")";
[_lblmonth Initialize:self.bi :@""];
 //BA.debugLineNum = 899;BA.debugLine="lblday.Initialize(\"\")";
[_lblday Initialize:self.bi :@""];
 //BA.debugLineNum = 901;BA.debugLine="Dim spyear,spmonth,spday As Picker";
_spyear = [B4IPickerWrapper new];
_spmonth = [B4IPickerWrapper new];
_spday = [B4IPickerWrapper new];
 //BA.debugLineNum = 902;BA.debugLine="spyear.Initialize(\"\")";
[_spyear Initialize:self.bi :@""];
 //BA.debugLineNum = 903;BA.debugLine="spmonth.Initialize(\"\")";
[_spmonth Initialize:self.bi :@""];
 //BA.debugLineNum = 904;BA.debugLine="spday.Initialize(\"\")";
[_spday Initialize:self.bi :@""];
 //BA.debugLineNum = 906;BA.debugLine="P1.AddView(lblyear,0,5,P1.Width,30dip)";
[_p1 AddView:(UIView*)((_lblyear).object) :(float) (0) :(float) (5) :[_p1 Width] :(float) ([self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 907;BA.debugLine="P1.AddView(spyear,0,32dip,P1.Width,30dip)";
[_p1 AddView:(UIView*)((_spyear).object) :(float) (0) :(float) ([self.__c DipToCurrent:(int) (32)]) :[_p1 Width] :(float) ([self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 908;BA.debugLine="P1.AddView(lblmonth,0,spyear.Height + spyear.Top";
[_p1 AddView:(UIView*)((_lblmonth).object) :(float) (0) :(float) ([_spyear Height]+[_spyear Top]+[self.__c DipToCurrent:(int) (4)]) :[_p1 Width] :(float) ([self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 909;BA.debugLine="P1.AddView(spmonth,0,spyear.Height + lblmonth.Top";
[_p1 AddView:(UIView*)((_spmonth).object) :(float) (0) :(float) ([_spyear Height]+[_lblmonth Top]+[self.__c DipToCurrent:(int) (4)]) :[_p1 Width] :(float) ([self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 910;BA.debugLine="P1.AddView(lblday,0,spyear.Height + spmonth.Top+";
[_p1 AddView:(UIView*)((_lblday).object) :(float) (0) :(float) ([_spyear Height]+[_spmonth Top]+[self.__c DipToCurrent:(int) (4)]) :[_p1 Width] :(float) ([self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 911;BA.debugLine="P1.AddView(spday,0,spyear.Height + lblday.Top+ 4d";
[_p1 AddView:(UIView*)((_spday).object) :(float) (0) :(float) ([_spyear Height]+[_lblday Top]+[self.__c DipToCurrent:(int) (4)]) :[_p1 Width] :(float) ([self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 913;BA.debugLine="lblyear.Text = GetStringResourse(\"year\")";
[_lblyear setText:[self _getstringresourse:@"year"]];
 //BA.debugLineNum = 914;BA.debugLine="lblmonth.Text = GetStringResourse(\"month\")";
[_lblmonth setText:[self _getstringresourse:@"month"]];
 //BA.debugLineNum = 915;BA.debugLine="lblday.Text = GetStringResourse(\"day\")";
[_lblday setText:[self _getstringresourse:@"day"]];
 //BA.debugLineNum = 916;BA.debugLine="lblyear.TextAlignment = GetStringResourse(\"direct";
[_lblyear setTextAlignment:[self.bi ObjectToNumber:[self _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 917;BA.debugLine="lblmonth.TextAlignment = GetStringResourse(\"direc";
[_lblmonth setTextAlignment:[self.bi ObjectToNumber:[self _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 918;BA.debugLine="lblday.TextAlignment = GetStringResourse(\"directi";
[_lblday setTextAlignment:[self.bi ObjectToNumber:[self _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 919;BA.debugLine="lblyear.Font = GetFont(14)";
[_lblyear setFont:[self _getfont:(int) (14)]];
 //BA.debugLineNum = 920;BA.debugLine="lblmonth.Font = GetFont(14)";
[_lblmonth setFont:[self _getfont:(int) (14)]];
 //BA.debugLineNum = 921;BA.debugLine="lblday.Font = GetFont(14)";
[_lblday setFont:[self _getfont:(int) (14)]];
 //BA.debugLineNum = 923;BA.debugLine="Dim currday,currmonth,curryear As String";
_currday = @"";
_currmonth = @"";
_curryear = @"";
 //BA.debugLineNum = 925;BA.debugLine="If IsPersian = False Then";
if ([self _ispersian]==[self.__c False]) { 
 //BA.debugLineNum = 926;BA.debugLine="currday = DateTime.GetDayOfMonth(DateTime.Now)";
_currday = [self.bi NumberToString:@([[self.__c DateTime] GetDayOfMonth:[[self.__c DateTime] Now]])];
 //BA.debugLineNum = 927;BA.debugLine="currmonth = DateTime.GetMonth(DateTime.Now)";
_currmonth = [self.bi NumberToString:@([[self.__c DateTime] GetMonth:[[self.__c DateTime] Now]])];
 //BA.debugLineNum = 928;BA.debugLine="curryear = DateTime.GetYear(DateTime.Now)";
_curryear = [self.bi NumberToString:@([[self.__c DateTime] GetYear:[[self.__c DateTime] Now]])];
 }else {
 //BA.debugLineNum = 930;BA.debugLine="Dim date1,date2() As String";
_date1 = @"";
_date2 = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
 //BA.debugLineNum = 931;BA.debugLine="date1 = Julian2Persian(DateTime.GetYear(DateTime";
_date1 = [self _julian2persian:[[self.__c DateTime] GetYear:[[self.__c DateTime] Now]] :[[self.__c DateTime] GetMonth:[[self.__c DateTime] Now]] :[[self.__c DateTime] GetDayOfMonth:[[self.__c DateTime] Now]] :@"/"];
 //BA.debugLineNum = 932;BA.debugLine="date2 = Regex.Split(\"/\",date1)";
_date2 = [[self.__c Regex] Split:@"/" :_date1];
 //BA.debugLineNum = 933;BA.debugLine="currday = date2(2)";
_currday = ((NSString*)[_date2 getObjectFast:(int) (2)]);
 //BA.debugLineNum = 934;BA.debugLine="currmonth = date2(1)";
_currmonth = ((NSString*)[_date2 getObjectFast:(int) (1)]);
 //BA.debugLineNum = 935;BA.debugLine="curryear = date2(0)";
_curryear = ((NSString*)[_date2 getObjectFast:(int) (0)]);
 };
 //BA.debugLineNum = 938;BA.debugLine="For i = 1 To 31";
{
const int step37 = 1;
const int limit37 = (int) (31);
_i = (int) (1) ;
for (;(step37 > 0 && _i <= limit37) || (step37 < 0 && _i >= limit37) ;_i = ((int)(0 + _i + step37))  ) {
 //BA.debugLineNum = 939;BA.debugLine="If i < 13 Then";
if (_i<13) { 
 //BA.debugLineNum = 941;BA.debugLine="spmonth.SetItems(0,Array(i))";
[_spmonth SetItems:(int) (0) :[self.bi ArrayToList:[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@(_i))]]]]];
 //BA.debugLineNum = 943;BA.debugLine="If i = Month And Month <> 0 Then";
if (_i==[self.bi ObjectToNumber:_month].doubleValue && [_month isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 944;BA.debugLine="spmonth.SelectRow(0,i-1,True)";
[_spmonth SelectRow:(int) (0) :(int) (_i-1) :[self.__c True]];
 }else if(_i==[self.bi ObjectToNumber:_currmonth].doubleValue) { 
 //BA.debugLineNum = 946;BA.debugLine="spmonth.SelectRow(0,i-1,True)";
[_spmonth SelectRow:(int) (0) :(int) (_i-1) :[self.__c True]];
 };
 };
 //BA.debugLineNum = 951;BA.debugLine="spday.SetItems(0,Array(i))";
[_spday SetItems:(int) (0) :[self.bi ArrayToList:[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@(_i))]]]]];
 //BA.debugLineNum = 953;BA.debugLine="If i = Day And Day <> 0 Then";
if (_i==[self.bi ObjectToNumber:_day].doubleValue && [_day isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 954;BA.debugLine="spday.SelectRow(0,i-1,True)";
[_spday SelectRow:(int) (0) :(int) (_i-1) :[self.__c True]];
 }else if(_i==[self.bi ObjectToNumber:_currday].doubleValue) { 
 //BA.debugLineNum = 956;BA.debugLine="spday.SelectRow(0,i-1,True)";
[_spday SelectRow:(int) (0) :(int) (_i-1) :[self.__c True]];
 };
 }
};
 //BA.debugLineNum = 961;BA.debugLine="Dim sFrom As Int = 1900";
_sfrom = (int) (1900);
 //BA.debugLineNum = 963;BA.debugLine="If IsPersian Then";
if ([self _ispersian]) { 
 //BA.debugLineNum = 964;BA.debugLine="sFrom = 1350";
_sfrom = (int) (1350);
 };
 //BA.debugLineNum = 967;BA.debugLine="For j = sFrom To sFrom + 100";
{
const int step57 = 1;
const int limit57 = (int) (_sfrom+100);
_j = _sfrom ;
for (;(step57 > 0 && _j <= limit57) || (step57 < 0 && _j >= limit57) ;_j = ((int)(0 + _j + step57))  ) {
 //BA.debugLineNum = 968;BA.debugLine="spyear.SetItems(0,Array(j))";
[_spyear SetItems:(int) (0) :[self.bi ArrayToList:[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@(_j))]]]]];
 }
};
 //BA.debugLineNum = 971;BA.debugLine="For s = 0 To spyear.GetItems(0).Size - 1";
{
const int step60 = 1;
const int limit60 = (int) ([[_spyear GetItems:(int) (0)] Size]-1);
_s = (int) (0) ;
for (;(step60 > 0 && _s <= limit60) || (step60 < 0 && _s >= limit60) ;_s = ((int)(0 + _s + step60))  ) {
 //BA.debugLineNum = 973;BA.debugLine="If spyear.GetSelectedRow(s) = Year And Year <> 0";
if ([_spyear GetSelectedRow:_s]==[self.bi ObjectToNumber:_year].doubleValue && [_year isEqual:[self.bi NumberToString:@(0)]] == false) { 
 //BA.debugLineNum = 974;BA.debugLine="spyear.SelectRow(0,s,True)";
[_spyear SelectRow:(int) (0) :_s :[self.__c True]];
 }else if([_spyear GetSelectedRow:_s]==[self.bi ObjectToNumber:_curryear].doubleValue) { 
 //BA.debugLineNum = 976;BA.debugLine="spyear.SelectRow(0,s,True)";
[_spyear SelectRow:(int) (0) :_s :[self.__c True]];
 };
 }
};
 //BA.debugLineNum = 981;BA.debugLine="Return $\"${spyear.GetSelectedRow(0)}/${spmonth.Ge";
if (true) return ([@[@"",[self.__c SmartStringFormatter:@"" :(NSObject*)(@([_spyear GetSelectedRow:(int) (0)]))],@"/",[self.__c SmartStringFormatter:@"" :(NSObject*)(@([_spmonth GetSelectedRow:(int) (0)]))],@"/",[self.__c SmartStringFormatter:@"" :(NSObject*)(@([_spday GetSelectedRow:(int) (0)]))],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 983;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _paddinglabel:(B4ILabelWrapper*) _lbl :(int) _left :(int) _top :(int) _right :(int) _bottom{
 //BA.debugLineNum = 739;BA.debugLine="Public Sub PaddingLabel(lbl As Label,Left As Int,T";
 //BA.debugLineNum = 741;BA.debugLine="End Sub";
return @"";
}
- (B4IArray*)  _parsedate:(NSString*) _date{
B4IArray* _ra = nil;
 //BA.debugLineNum = 743;BA.debugLine="Public Sub ParseDate(Date As String) As Int()";
 //BA.debugLineNum = 745;BA.debugLine="Dim ra() As String";
_ra = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
 //BA.debugLineNum = 746;BA.debugLine="ra = Regex.Split(\"/\",Date)";
_ra = [[self.__c Regex] Split:@"/" :_date];
 //BA.debugLineNum = 748;BA.debugLine="If ra.Length = 3 Then";
if (_ra.Length==3) { 
 //BA.debugLineNum = 749;BA.debugLine="Return Array As Int(ra(0),ra(1),ra(2))";
if (true) return [[B4IArray alloc]initObjectsWithData:@[@([self.bi ObjectToNumber:((NSString*)[_ra getObjectFast:(int) (0)])].intValue),@([self.bi ObjectToNumber:((NSString*)[_ra getObjectFast:(int) (1)])].intValue),@([self.bi ObjectToNumber:((NSString*)[_ra getObjectFast:(int) (2)])].intValue)]];
 }else {
 //BA.debugLineNum = 751;BA.debugLine="Return Array As Int(0,0,0)";
if (true) return [[B4IArray alloc]initObjectsWithData:@[@((int) (0)),@((int) (0)),@((int) (0))]];
 };
 //BA.debugLineNum = 754;BA.debugLine="End Sub";
return nil;
}
- (B4IArray*)  _parsetime:(NSString*) _time{
B4IArray* _ra = nil;
 //BA.debugLineNum = 756;BA.debugLine="Public Sub ParseTime(Time As String) As Int()";
 //BA.debugLineNum = 758;BA.debugLine="Dim ra() As String";
_ra = [[B4IArray alloc]initObjects:@[@((int) (0))] :@"" :nil];
 //BA.debugLineNum = 759;BA.debugLine="ra = Regex.Split(\":\",Time)";
_ra = [[self.__c Regex] Split:@":" :_time];
 //BA.debugLineNum = 761;BA.debugLine="If ra.Length = 3 Then";
if (_ra.Length==3) { 
 //BA.debugLineNum = 762;BA.debugLine="Return Array As Int(ra(0),ra(1),ra(2))";
if (true) return [[B4IArray alloc]initObjectsWithData:@[@([self.bi ObjectToNumber:((NSString*)[_ra getObjectFast:(int) (0)])].intValue),@([self.bi ObjectToNumber:((NSString*)[_ra getObjectFast:(int) (1)])].intValue),@([self.bi ObjectToNumber:((NSString*)[_ra getObjectFast:(int) (2)])].intValue)]];
 }else {
 //BA.debugLineNum = 764;BA.debugLine="Return Array As Int(DateTime.GetHour(DateTime.No";
if (true) return [[B4IArray alloc]initObjectsWithData:@[@([[self.__c DateTime] GetHour:[[self.__c DateTime] Now]]),@([[self.__c DateTime] GetMinute:[[self.__c DateTime] Now]]),@([[self.__c DateTime] GetSecond:[[self.__c DateTime] Now]])]];
 };
 //BA.debugLineNum = 767;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _process_globals{
self._main=[b4i_main new];
self._actmenu=[b4i_actmenu new];
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
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Public setting As Settings";
self._setting = [B4ISettings new];
 //BA.debugLineNum = 5;BA.debugLine="Type ResponseAddItem(View1 As View,Top As Int,Lef";
;
 //BA.debugLineNum = 6;BA.debugLine="Public StringResourse As String";
self._stringresourse = @"";
 //BA.debugLineNum = 7;BA.debugLine="Public RefererPage As Page";
self._refererpage = [B4IPage new];
 //BA.debugLineNum = 8;BA.debugLine="Public HUD As HUD";
self._hud = [iHUD new];
 //BA.debugLineNum = 9;BA.debugLine="Public PaymentSuccess As Boolean";
self._paymentsuccess = false;
 //BA.debugLineNum = 10;BA.debugLine="Public Application As Application";
self._application = [B4IApplicationWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private ln As Notification";
self._ln = [B4INotificationWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Public NavControl As NavigationController";
self._navcontrol = [B4INavigationControllerWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Public MainPage,ErrorNetPage,MenuPage,CategoryPag";
self._mainpage = [B4IPage new];
self._errornetpage = [B4IPage new];
self._menupage = [B4IPage new];
self._categorypage = [B4IPage new];
self._productpage = [B4IPage new];
self._pagebasket = [B4IPage new];
self._accountpage = [B4IPage new];
self._doorderpage = [B4IPage new];
 //BA.debugLineNum = 14;BA.debugLine="Public token,CartDetails As Map";
self._token = [B4IMap new];
self._cartdetails = [B4IMap new];
 //BA.debugLineNum = 15;BA.debugLine="Public currLang,currCurrency As String";
self._currlang = @"";
self._currcurrency = @"";
 //BA.debugLineNum = 16;BA.debugLine="Public StoreID As String";
self._storeid = @"";
 //BA.debugLineNum = 17;BA.debugLine="Public Manager As clsPreferenceManager";
self._manager = [b4i_clspreferencemanager new];
 //BA.debugLineNum = 18;BA.debugLine="Public FirstRun As Boolean";
self._firstrun = false;
 //BA.debugLineNum = 19;BA.debugLine="Public imagesSlideshow,imagesSlideshowProduct,Fea";
self._imagesslideshow = [B4IList new];
self._imagesslideshowproduct = [B4IList new];
self._featureproduct = [B4IList new];
self._bestproduct = [B4IList new];
self._newproduct = [B4IList new];
self._listslideshow = [B4IList new];
self._listmanufacturers = [B4IList new];
self._listinformation = [B4IList new];
 //BA.debugLineNum = 20;BA.debugLine="Public wishlist As String";
self._wishlist = @"";
 //BA.debugLineNum = 21;BA.debugLine="Public Theme_Header,Theme_Footer,Theme_Background";
self._theme_header = 0;
self._theme_footer = 0;
self._theme_background = 0;
 //BA.debugLineNum = 22;BA.debugLine="Public Coupons As List";
self._coupons = [B4IList new];
 //BA.debugLineNum = 23;BA.debugLine="Public Language As Map";
self._language = [B4IMap new];
 //BA.debugLineNum = 24;BA.debugLine="Public App As Application";
self._app = [B4IApplicationWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private TempDimension() As Int";
self._tempdimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
 //BA.debugLineNum = 26;BA.debugLine="Public ProductChoosenID As String";
self._productchoosenid = @"";
 //BA.debugLineNum = 27;BA.debugLine="Public loginDetails As Map";
self._logindetails = [B4IMap new];
 //BA.debugLineNum = 28;BA.debugLine="Public LastPage As Page";
self._lastpage = [B4IPage new];
 //BA.debugLineNum = 29;BA.debugLine="Dim POSITIVE As Int";
self._positive = 0;
 //BA.debugLineNum = 30;BA.debugLine="Dim NEGATIVE As Int";
self._negative = 0;
 //BA.debugLineNum = 31;BA.debugLine="Dim CANCEL As Int";
self._cancel = 0;
 //BA.debugLineNum = 32;BA.debugLine="Public GuestLogin As Map";
self._guestlogin = [B4IMap new];
 //BA.debugLineNum = 33;BA.debugLine="Public ChoosenAddress As Int";
self._choosenaddress = 0;
 //BA.debugLineNum = 34;BA.debugLine="Public PItemDefault As Panel";
self._pitemdefault = [B4IPanelWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="Private pnlcustomdialog As Panel";
self._pnlcustomdialog = [B4IPanelWrapper new];
 //BA.debugLineNum = 36;BA.debugLine="Public KEY_APP As String = \"OR5syFVZuTWHuYCV9Jf4e";
self._key_app = @"OR5syFVZuTWHuYCV9Jf4ecYqhRI=";
 //BA.debugLineNum = 37;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _redstring:(NSString*) _str :(B4ILabelWrapper*) _label{
b4i_richstring* _rich = nil;
 //BA.debugLineNum = 192;BA.debugLine="Public Sub RedString(Str As String,Label As Label)";
 //BA.debugLineNum = 194;BA.debugLine="Dim rich As RichString";
_rich = [b4i_richstring new];
 //BA.debugLineNum = 195;BA.debugLine="rich.Initialize(Str)";
[_rich _initialize:self.bi :_str];
 //BA.debugLineNum = 196;BA.debugLine="rich.Color(Colors.Red,0,Str.Length)";
[_rich _color:[[self.__c Colors] Red] :(int) (0) :[_str Length]];
 //BA.debugLineNum = 197;BA.debugLine="rich.SetToLabel(Label)";
[_rich _settolabel:_label];
 //BA.debugLineNum = 199;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _regexreplace:(NSString*) _pattern :(NSString*) _text :(NSString*) _replacement{
 //BA.debugLineNum = 890;BA.debugLine="Sub RegexReplace(Pattern As String, Text As String";
 //BA.debugLineNum = 891;BA.debugLine="Return Regex.Replace(Pattern,Text,Replacement)";
if (true) return [[self.__c Regex] Replace:_pattern :_text :_replacement];
 //BA.debugLineNum = 892;BA.debugLine="End Sub";
return @"";
}
- (B4IBitmap*)  _resizebitmap:(B4IBitmap*) _bmp :(float) _scale{
B4IImageViewWrapper* _img = nil;
B4ICanvas* _cvs = nil;
B4IBitmap* _res = nil;
 //BA.debugLineNum = 201;BA.debugLine="Sub ResizeBitmap(bmp As Bitmap, scale As Float) As";
 //BA.debugLineNum = 202;BA.debugLine="Dim img As ImageView";
_img = [B4IImageViewWrapper new];
 //BA.debugLineNum = 203;BA.debugLine="img.Initialize(\"\")";
[_img Initialize:self.bi :@""];
 //BA.debugLineNum = 204;BA.debugLine="img.Width = bmp.Width * scale";
[_img setWidth:(float) ([_bmp Width]*_scale)];
 //BA.debugLineNum = 205;BA.debugLine="img.Height = bmp.Height * scale";
[_img setHeight:(float) ([_bmp Height]*_scale)];
 //BA.debugLineNum = 206;BA.debugLine="Dim cvs As Canvas";
_cvs = [B4ICanvas new];
 //BA.debugLineNum = 207;BA.debugLine="cvs.Initialize(img)";
[_cvs Initialize:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_img).object)]];
 //BA.debugLineNum = 208;BA.debugLine="cvs.DrawBitmap(bmp, cvs.TargetRect)";
[_cvs DrawBitmap:_bmp :[_cvs TargetRect]];
 //BA.debugLineNum = 209;BA.debugLine="Dim res As Bitmap = cvs.CreateBitmap";
_res = [B4IBitmap new];
_res = [_cvs CreateBitmap];
 //BA.debugLineNum = 210;BA.debugLine="cvs.Release";
[_cvs Release];
 //BA.debugLineNum = 211;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 212;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _setfont:(B4IViewWrapper*) _views :(NSString*) _fontname :(int) _fontsize{
B4IButtonWrapper* _b1 = nil;
B4ILabelWrapper* _lb = nil;
 //BA.debugLineNum = 388;BA.debugLine="Sub SetFont(Views As View,FontName As String,FontS";
 //BA.debugLineNum = 391;BA.debugLine="If FontName = \"\" Then FontName = \"iransans\"";
if ([_fontname isEqual:@""]) { 
_fontname = @"iransans";};
 //BA.debugLineNum = 393;BA.debugLine="If Views Is Button Then";
if ([_views.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 394;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 395;BA.debugLine="b1 = Views";
_b1.object = (UIButton*)((_views).object);
 //BA.debugLineNum = 396;BA.debugLine="b1.CustomLabel.Font = Font.CreateNew2(FontName,F";
[[_b1 CustomLabel] setFont:[[self.__c Font] CreateNew2:_fontname :(float) (_fontsize)]];
 }else if([_views.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 399;BA.debugLine="Dim lb As Label";
_lb = [B4ILabelWrapper new];
 //BA.debugLineNum = 400;BA.debugLine="lb = Views";
_lb.object = (UILabel*)((_views).object);
 //BA.debugLineNum = 401;BA.debugLine="lb.Font = Font.CreateNew2(FontName,FontSize)";
[_lb setFont:[[self.__c Font] CreateNew2:_fontname :(float) (_fontsize)]];
 };
 //BA.debugLineNum = 404;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _showcartlabel:(B4ILabelWrapper*) _lbl{
b4i_opencart* _cart = nil;
int _countcart = 0;
int _c1 = 0;
 //BA.debugLineNum = 101;BA.debugLine="Sub ShowCartLabel(lbl As Label)";
 //BA.debugLineNum = 103;BA.debugLine="Dim cart As OpenCart";
_cart = [b4i_opencart new];
 //BA.debugLineNum = 104;BA.debugLine="cart.Initialize";
[_cart _initialize:self.bi];
 //BA.debugLineNum = 106;BA.debugLine="Dim countcart As Int";
_countcart = 0;
 //BA.debugLineNum = 107;BA.debugLine="countcart = cart.GetCartCount";
_countcart = [_cart _getcartcount];
 //BA.debugLineNum = 109;BA.debugLine="Dim c1 As Int";
_c1 = 0;
 //BA.debugLineNum = 110;BA.debugLine="c1 = Colors.RGB(178,34,34)";
_c1 = [[self.__c Colors] RGB:(int) (178) :(int) (34) :(int) (34)];
 //BA.debugLineNum = 111;BA.debugLine="lbl.Color = c1";
[_lbl setColor:_c1];
 //BA.debugLineNum = 112;BA.debugLine="lbl.SetBorder(0,Colors.White,10dip)";
[_lbl SetBorder:(float) (0) :[[self.__c Colors] White] :(float) ([self.__c DipToCurrent:(int) (10)])];
 //BA.debugLineNum = 114;BA.debugLine="If countcart > 0 Then";
if (_countcart>0) { 
 //BA.debugLineNum = 115;BA.debugLine="lbl.Text = countcart";
[_lbl setText:[self.bi NumberToString:@(_countcart)]];
 //BA.debugLineNum = 116;BA.debugLine="lbl.Visible = True";
[_lbl setVisible:[self.__c True]];
 }else {
 //BA.debugLineNum = 118;BA.debugLine="lbl.Text = \"0\"";
[_lbl setText:@"0"];
 //BA.debugLineNum = 119;BA.debugLine="lbl.Visible = False";
[_lbl setVisible:[self.__c False]];
 };
 //BA.debugLineNum = 122;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _showerrors:(B4IMap*) _rs{
NSString* _err = @"";
NSString* _v = @"";
 //BA.debugLineNum = 124;BA.debugLine="Sub ShowErrors(rs As Map)";
 //BA.debugLineNum = 126;BA.debugLine="Dim err As String";
_err = @"";
 //BA.debugLineNum = 128;BA.debugLine="For Each v As String In rs.Values";
{
const id<B4IIterable> group2 = [_rs Values];
const int groupLen2 = group2.Size
;int index2 = 0;
;
for (; index2 < groupLen2;index2++){
_v = [self.bi ObjectToString:[group2 Get:index2]];
 //BA.debugLineNum = 129;BA.debugLine="err = err & v & CRLF";
_err = [@[_err,_v,[self.__c CRLF]] componentsJoinedByString:@""];
 }
};
 //BA.debugLineNum = 132;BA.debugLine="Msgbox(err,GetStringResourse(\"alert\"))";
[self.__c Msgbox:_err :[self _getstringresourse:@"alert"]];
 //BA.debugLineNum = 134;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _shownotification:(NSString*) _info :(int) _badgenumber{
 //BA.debugLineNum = 331;BA.debugLine="Sub ShowNotification(Info As String,BadgeNumber As";
 //BA.debugLineNum = 332;BA.debugLine="ln.Initialize(DateTime.Now + 1 * DateTime.TicksPe";
[self._ln Initialize:(long long) ([[self.__c DateTime] Now]+1*[[self.__c DateTime] TicksPerSecond])];
 //BA.debugLineNum = 333;BA.debugLine="ln.IconBadgeNumber = 0";
[self._ln setIconBadgeNumber:(int) (0)];
 //BA.debugLineNum = 334;BA.debugLine="ln.IconBadgeNumber = BadgeNumber";
[self._ln setIconBadgeNumber:_badgenumber];
 //BA.debugLineNum = 335;BA.debugLine="ln.AlertBody = Info";
[self._ln setAlertBody:_info];
 //BA.debugLineNum = 336;BA.debugLine="ln.PlaySound = True";
[self._ln setPlaySound:[self.__c True]];
 //BA.debugLineNum = 337;BA.debugLine="ln.Register";
[self._ln Register];
 //BA.debugLineNum = 338;BA.debugLine="End Sub";
return @"";
}
- (B4IList*)  _string2list:(NSString*) _str{
B4IJSONParser* _js = nil;
 //BA.debugLineNum = 276;BA.debugLine="Sub String2List(str As String) As List";
 //BA.debugLineNum = 278;BA.debugLine="Try";
@try { //BA.debugLineNum = 279;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 280;BA.debugLine="js.Initialize(str)";
[_js Initialize:_str];
 //BA.debugLineNum = 281;BA.debugLine="Return js.NextArray";
if (true) return [_js NextArray];
 } 
       @catch (NSException* e6) {
			[B4I SetException:e6]; //BA.debugLineNum = 283;BA.debugLine="Return Null";
if (true) return (B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([self.__c Null])];
 };
 //BA.debugLineNum = 286;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _underline:(NSString*) _str :(B4ILabelWrapper*) _label{
b4i_richstring* _rich = nil;
 //BA.debugLineNum = 53;BA.debugLine="Public Sub UnderLine(str As String,label As Label)";
 //BA.debugLineNum = 55;BA.debugLine="Dim rich As RichString";
_rich = [b4i_richstring new];
 //BA.debugLineNum = 56;BA.debugLine="rich.Initialize(str)";
[_rich _initialize:self.bi :_str];
 //BA.debugLineNum = 57;BA.debugLine="rich.Underline(True,Colors.Black,0,str.Length)";
[_rich _underline:[self.__c True] :[[self.__c Colors] Black] :(int) (0) :[_str Length]];
 //BA.debugLineNum = 58;BA.debugLine="rich.SetToLabel(label)";
[_rich _settolabel:_label];
 //BA.debugLineNum = 60;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _underlinestring:(B4ILabelWrapper*) _label1{
b4i_richstring* _rs = nil;
 //BA.debugLineNum = 177;BA.debugLine="Sub UnderLineString(label1 As Label)";
 //BA.debugLineNum = 179;BA.debugLine="Dim rs As RichString";
_rs = [b4i_richstring new];
 //BA.debugLineNum = 180;BA.debugLine="rs.Initialize(label1.Text)";
[_rs _initialize:self.bi :[_label1 Text]];
 //BA.debugLineNum = 181;BA.debugLine="rs.Underline(True,Theme_Header,0,label1.Text.Leng";
[_rs _underline:[self.__c True] :self._theme_header :(int) (0) :[[_label1 Text] Length]];
 //BA.debugLineNum = 182;BA.debugLine="rs.SetToLabel(label1)";
[_rs _settolabel:_label1];
 //BA.debugLineNum = 184;BA.debugLine="End Sub";
return @"";
}
- (BOOL)  _validemail:(NSString*) _emailaddress{
B4IMatcher* _matchemail = nil;
 //BA.debugLineNum = 157;BA.debugLine="Public Sub ValidEmail(EmailAddress As String) As B";
 //BA.debugLineNum = 159;BA.debugLine="Dim MatchEmail As Matcher = Regex.Matcher(\"^(?i)[";
_matchemail = [[self.__c Regex] Matcher:@"^(?i)[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$" :_emailaddress];
 //BA.debugLineNum = 161;BA.debugLine="If MatchEmail.Find = True Then";
if ([_matchemail Find]==[self.__c True]) { 
 //BA.debugLineNum = 162;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 164;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 167;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _validphonenumber:(NSString*) _id1{
 //BA.debugLineNum = 350;BA.debugLine="Public Sub ValidPhoneNumber(id1 As String) As Bool";
 //BA.debugLineNum = 352;BA.debugLine="Try";
@try { //BA.debugLineNum = 353;BA.debugLine="Return Regex.IsMatch(\"^0[0-9]{10}$\",id1)";
if (true) return [[self.__c Regex] IsMatch:@"^0[0-9]{10}$" :_id1];
 } 
       @catch (NSException* e4) {
			[B4I SetException:e4]; //BA.debugLineNum = 355;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 358;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _validpostalcode:(NSString*) _code{
 //BA.debugLineNum = 340;BA.debugLine="Public Sub ValidPostalCode(Code As String) As Bool";
 //BA.debugLineNum = 342;BA.debugLine="Try";
@try { //BA.debugLineNum = 343;BA.debugLine="Return Regex.IsMatch(\"^[0-9]{2,10}$\",Code)";
if (true) return [[self.__c Regex] IsMatch:@"^[0-9]{2,10}$" :_code];
 } 
       @catch (NSException* e4) {
			[B4I SetException:e4]; //BA.debugLineNum = 345;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 348;BA.debugLine="End Sub";
return false;
}
@end
