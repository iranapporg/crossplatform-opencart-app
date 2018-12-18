
#import "b4i_actproducts.h"
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


@implementation b4i_actproducts 


+ (instancetype)new {
    static b4i_actproducts* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnbasket_click{
 //BA.debugLineNum = 82;BA.debugLine="Sub btnbasket_Click";
 //BA.debugLineNum = 83;BA.debugLine="Library.LastPage = pg";
self._library._lastpage = self._pg;
 //BA.debugLineNum = 84;BA.debugLine="actBasket.StartActivity";
[self._actbasket _startactivity];
 //BA.debugLineNum = 85;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 87;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 88;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsearch_click{
 //BA.debugLineNum = 77;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 78;BA.debugLine="Library.LastPage = pg";
self._library._lastpage = self._pg;
 //BA.debugLineNum = 79;BA.debugLine="actSearch.StartActivity";
[self._actsearch _startactivity];
 //BA.debugLineNum = 80;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 91;BA.debugLine="Sub LoadProduct(res1 As List,DefaultTop As Int,Scr";
 //BA.debugLineNum = 93;BA.debugLine="Dim Dimension(),Left,top As Int";
_dimension = [[B4IArray alloc]initObjects:@[@((int) (0))] :@0 :nil];
_left = 0;
self._top = 0;
 //BA.debugLineNum = 94;BA.debugLine="Dim countItem,AllSpace,SpaceUnit As Int";
_countitem = 0;
_allspace = 0;
_spaceunit = 0;
 //BA.debugLineNum = 96;BA.debugLine="Dimension = Library.GetParentPanelDimension(\"frmp";
_dimension = [self._library _getparentpaneldimension:@"frmproduct_template"];
 //BA.debugLineNum = 98;BA.debugLine="countItem = Library.GetWidth / Dimension(0)";
_countitem = (int) ([self._library _getwidth]/(double)((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 //BA.debugLineNum = 99;BA.debugLine="AllSpace = Library.GetWidth - (countItem * Dimens";
_allspace = (int) ([self._library _getwidth]-(_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue));
 //BA.debugLineNum = 101;BA.debugLine="SpaceUnit = AllSpace /(countItem + 1)";
_spaceunit = (int) (_allspace/(double)(_countitem+1));
 //BA.debugLineNum = 103;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(0)";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 //BA.debugLineNum = 108;BA.debugLine="top = DefaultTop";
self._top = _defaulttop;
 //BA.debugLineNum = 110;BA.debugLine="For i = 1 To res1.Size";
{
const int step9 = 1;
const int limit9 = [_res1 Size];
_i = (int) (1) ;
for (;(step9 > 0 && _i <= limit9) || (step9 < 0 && _i >= limit9) ;_i = ((int)(0 + _i + step9))  ) {
 //BA.debugLineNum = 112;BA.debugLine="Dim pa As Panel";
_pa = [B4IPanelWrapper new];
 //BA.debugLineNum = 113;BA.debugLine="pa.Initialize(\"\")";
[_pa Initialize:self.bi :@""];
 //BA.debugLineNum = 114;BA.debugLine="ScrollView1.Panel.AddView(pa,Left,top,Dimension(";
[[_scrollview1 Panel] AddView:(UIView*)((_pa).object) :(float) (_left) :(float) (self._top) :(float) (((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue) :(float) (0)];
 //BA.debugLineNum = 115;BA.debugLine="pa.LoadLayout(\"frmproduct_template\")";
[_pa LoadLayout:@"frmproduct_template" :self.bi];
 //BA.debugLineNum = 116;BA.debugLine="pa.Height = Dimension(1)";
[_pa setHeight:(float) (((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 //BA.debugLineNum = 118;BA.debugLine="Dim Temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 119;BA.debugLine="Temp = res1.Get(i-1)";
_temp = (B4IMap*)([_res1 Get:(int) (_i-1)]);
 //BA.debugLineNum = 122;BA.debugLine="Dim imgTemp As ImageView";
_imgtemp = [B4IImageViewWrapper new];
 //BA.debugLineNum = 124;BA.debugLine="Dim TempLabel,LabelPrice As Label";
_templabel = [B4ILabelWrapper new];
_labelprice = [B4ILabelWrapper new];
 //BA.debugLineNum = 125;BA.debugLine="Dim TempPanel As Panel";
_temppanel = [B4IPanelWrapper new];
 //BA.debugLineNum = 126;BA.debugLine="Dim ParentPanel As Panel = pa.GetView(0)";
_parentpanel = [B4IPanelWrapper new];
_parentpanel.object = (B4IPanelView*)(([_pa GetView:(int) (0)]).object);
 //BA.debugLineNum = 129;BA.debugLine="imgTemp = ParentPanel.GetView(4)";
_imgtemp.object = (UIImageView*)(([_parentpanel GetView:(int) (4)]).object);
 //BA.debugLineNum = 130;BA.debugLine="TempLabel = ParentPanel.GetView(1)";
_templabel.object = (UILabel*)(([_parentpanel GetView:(int) (1)]).object);
 //BA.debugLineNum = 131;BA.debugLine="LabelPrice = ParentPanel.GetView(2)";
_labelprice.object = (UILabel*)(([_parentpanel GetView:(int) (2)]).object);
 //BA.debugLineNum = 132;BA.debugLine="TempPanel = ParentPanel.GetView(6)";
_temppanel.object = (B4IPanelView*)(([_parentpanel GetView:(int) (6)]).object);
 //BA.debugLineNum = 134;BA.debugLine="TempLabel.Text = Temp.Get(\"name\")";
[_templabel setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 135;BA.debugLine="TempLabel.Text = TempLabel.Text.Replace(\"&quot;\"";
[_templabel setText:[[[_templabel Text] Replace:@"&quot;" :[self.__c QUOTE]] Replace:@"&amp;" :@"&"]];
 //BA.debugLineNum = 137;BA.debugLine="Dim price,special As String";
_price = @"";
_special = @"";
 //BA.debugLineNum = 139;BA.debugLine="If Temp.ContainsKey(\"price_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"price_formated")]) { 
 //BA.debugLineNum = 140;BA.debugLine="price   = Temp.Get(\"price_formated\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price_formated")]];
 }else {
 //BA.debugLineNum = 142;BA.debugLine="price   = Temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 };
 //BA.debugLineNum = 145;BA.debugLine="If Temp.ContainsKey(\"special_formated\") Then";
if ([_temp ContainsKey:(NSObject*)(@"special_formated")]) { 
 //BA.debugLineNum = 146;BA.debugLine="special = Temp.Get(\"special_formated\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special_formated")]];
 }else if([_temp ContainsKey:(NSObject*)(@"special")]) { 
 //BA.debugLineNum = 148;BA.debugLine="special = Temp.Get(\"special\")";
_special = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"special")]];
 };
 //BA.debugLineNum = 151;BA.debugLine="If special = \"null\" Or special = \"false\" Then sp";
if ([_special isEqual:@"null"] || [_special isEqual:@"false"]) { 
_special = @"";};
 //BA.debugLineNum = 153;BA.debugLine="TempLabel.Font = Library.GetFont(LabelPrice.Font";
[_templabel setFont:[self._library _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 154;BA.debugLine="LabelPrice.Font = Library.GetFont(LabelPrice.Fon";
[_labelprice setFont:[self._library _getfont:(int) ([[_labelprice Font] Size])]];
 //BA.debugLineNum = 156;BA.debugLine="If price.Length > 0 And (special <> 0) <> False";
if ([_price Length]>0 && ([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 157;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 }else if(([_special isEqual:[self.bi NumberToString:@(0)]] == false)!=[self.__c False]) { 
 //BA.debugLineNum = 159;BA.debugLine="Library.DiscountStyleLabel(price,special,LabelP";
[self._library _discountstylelabel:_price :_special :_labelprice];
 }else {
 //BA.debugLineNum = 161;BA.debugLine="LabelPrice.Text = price";
[_labelprice setText:_price];
 };
 //BA.debugLineNum = 164;BA.debugLine="Dim PathImage As String";
_pathimage = @"";
 //BA.debugLineNum = 166;BA.debugLine="If Temp.ContainsKey(\"image\") Then";
if ([_temp ContainsKey:(NSObject*)(@"image")]) { 
 //BA.debugLineNum = 167;BA.debugLine="PathImage = Temp.Get(\"image\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"image")]];
 }else if([_temp ContainsKey:(NSObject*)(@"thumb")]) { 
 //BA.debugLineNum = 169;BA.debugLine="PathImage = Temp.Get(\"thumb\")";
_pathimage = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 172;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ([[_pathimage ToLowerCase] isEqual:@"null"] || [_pathimage Length]==0) { 
 //BA.debugLineNum = 173;BA.debugLine="imgTemp.Bitmap = LoadBitmap(File.DirAssets,\"noi";
[_imgtemp setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"noimage.png"]];
 }else {
 //BA.debugLineNum = 175;BA.debugLine="Dim img As Map";
_img = [B4IMap new];
 //BA.debugLineNum = 176;BA.debugLine="img.Initialize";
[_img Initialize];
 //BA.debugLineNum = 177;BA.debugLine="img.Put(imgTemp,PathImage)";
[_img Put:(NSObject*)((_imgtemp).object) :(NSObject*)(_pathimage)];
 //BA.debugLineNum = 178;BA.debugLine="Dim imgdownloader As ImageDownloader";
_imgdownloader = [b4i_imagedownloader new];
 //BA.debugLineNum = 179;BA.debugLine="imgdownloader.Initialize";
[_imgdownloader _initialize:self.bi];
 //BA.debugLineNum = 180;BA.debugLine="imgdownloader.Download(img)";
[_imgdownloader _download:_img];
 };
 //BA.debugLineNum = 183;BA.debugLine="If TempPanel.Tag = \"over\" Then";
if ([[_temppanel Tag] isEqual:(NSObject*)(@"over")]) { 
 //BA.debugLineNum = 184;BA.debugLine="TempPanel.Tag = Temp";
[_temppanel setTag:(NSObject*)(_temp)];
 }else if([[_temppanel Tag] isEqual:(NSObject*)(@"topbar")]) { 
 //BA.debugLineNum = 186;BA.debugLine="TempPanel.Color = Library.Theme_Header";
[_temppanel setColor:self._library._theme_header];
 };
 //BA.debugLineNum = 191;BA.debugLine="If i Mod countItem = 0 Then";
if (_i%_countitem==0) { 
 //BA.debugLineNum = 192;BA.debugLine="top = top + pa.Height + 15dip";
self._top = (int) (self._top+[_pa Height]+[self.__c DipToCurrent:(int) (15)]);
 //BA.debugLineNum = 193;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.He";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+[_pa Height])];
 //BA.debugLineNum = 194;BA.debugLine="Left = ( countItem * Dimension(0)) - Dimension(";
_left = (int) ((_countitem*((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue)-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue+_allspace/(double)_countitem+_spaceunit/(double)_countitem);
 }else {
 //BA.debugLineNum = 197;BA.debugLine="Left = Left - SpaceUnit - Dimension(0)";
_left = (int) (_left-_spaceunit-((NSNumber*)[_dimension getObjectFastN:(int) (0)]).intValue);
 };
 }
};
 //BA.debugLineNum = 203;BA.debugLine="If res1.Size Mod countItem <> 0 Then";
if ([_res1 Size]%_countitem!=0) { 
 //BA.debugLineNum = 204;BA.debugLine="top = top + Dimension(1)";
self._top = (int) (self._top+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue);
 //BA.debugLineNum = 205;BA.debugLine="ScrollView1.Panel.Height = ScrollView1.Panel.Hei";
[[_scrollview1 Panel] setHeight:(float) ([[_scrollview1 Panel] Height]+((NSNumber*)[_dimension getObjectFastN:(int) (1)]).intValue)];
 };
 //BA.debugLineNum = 208;BA.debugLine="Return top";
if (true) return self._top;
 //BA.debugLineNum = 210;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _pnlover_click{
B4IPanelWrapper* _p1 = nil;
B4IPanelWrapper* _p2 = nil;
B4IMap* _temp = nil;
 //BA.debugLineNum = 60;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 62;BA.debugLine="Dim p1,p2 As Panel";
_p1 = [B4IPanelWrapper new];
_p2 = [B4IPanelWrapper new];
 //BA.debugLineNum = 63;BA.debugLine="p1 = Sender";
_p1.object = (B4IPanelView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 65;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.object = (B4IPanelView*)(([self._library _getparent:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_p1).object)]]).object);
 //BA.debugLineNum = 66;BA.debugLine="p2.Visible = False";
[_p2 setVisible:[self.__c False]];
 //BA.debugLineNum = 67;BA.debugLine="p2.Visible = True";
[_p2 setVisible:[self.__c True]];
 //BA.debugLineNum = 69;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 70;BA.debugLine="temp = p1.Tag";
_temp = (B4IMap*)([_p1 Tag]);
 //BA.debugLineNum = 71;BA.debugLine="Library.LastPage = pg";
self._library._lastpage = self._pg;
 //BA.debugLineNum = 72;BA.debugLine="actProduct.product = temp";
self._actproduct._product = _temp;
 //BA.debugLineNum = 73;BA.debugLine="actProduct.StartActivity";
[self._actproduct _startactivity];
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 4;BA.debugLine="Public title As String";
self._title = @"";
 //BA.debugLineNum = 5;BA.debugLine="Public res As List";
self._res = [B4IList new];
 //BA.debugLineNum = 6;BA.debugLine="Private pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 7;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 12;BA.debugLine="Private top As Int = 30";
self._top = (int) (30);
 //BA.debugLineNum = 13;BA.debugLine="Private lblbasket As Label";
self._lblbasket = [B4ILabelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Dim MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 15;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private btnsearch As Button";
self._btnsearch = [B4IButtonWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private btnbasket As Button";
self._btnbasket = [B4IButtonWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 20;BA.debugLine="Public Sub StartActivity";
 //BA.debugLineNum = 22;BA.debugLine="pg.Initialize(\"\")";
[self._pg Initialize:self.bi :@""];
 //BA.debugLineNum = 23;BA.debugLine="pg.RootPanel.LoadLayout(\"frmcategory\")";
[[self._pg RootPanel] LoadLayout:@"frmcategory" :self.bi];
 //BA.debugLineNum = 24;BA.debugLine="MyToastMessageShow1.Initialize(pg.RootPanel)";
[self._mytoastmessageshow1 _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 26;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 27;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 28;BA.debugLine="Library.SetFont(btnbasket,\"icomoon\",btnclose.Cust";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnbasket).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 29;BA.debugLine="Library.SetFont(btnsearch,\"icomoon\",btnclose.Cust";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnsearch).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 30;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 32;BA.debugLine="lbltitle.Text = title";
[self._lbltitle setText:self._title];
 //BA.debugLineNum = 33;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 34;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 36;BA.debugLine="If res.Size = 0 Then";
if ([self._res Size]==0) { 
 //BA.debugLineNum = 37;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"no_exist_product"] :[self.__c False]];
 //BA.debugLineNum = 38;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 39;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 42;BA.debugLine="top = 10dip";
self._top = [self.__c DipToCurrent:(int) (10)];
 //BA.debugLineNum = 44;BA.debugLine="sv1.Visible = False";
[self._sv1 setVisible:[self.__c False]];
 //BA.debugLineNum = 45;BA.debugLine="top =  LoadProduct(res,top,sv1)";
self._top = [self _loadproduct:self._res :self._top :self._sv1];
 //BA.debugLineNum = 47;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 290dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (290)])];
 //BA.debugLineNum = 48;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 49;BA.debugLine="sv1.ContentHeight = sv1.panel.Height";
[self._sv1 setContentHeight:(int) ([[self._sv1 Panel] Height])];
 //BA.debugLineNum = 51;BA.debugLine="sv1.Visible = True";
[self._sv1 setVisible:[self.__c True]];
 //BA.debugLineNum = 52;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 53;BA.debugLine="sv1.Panel.Color = Library.Theme_Background";
[[self._sv1 Panel] setColor:self._library._theme_background];
 //BA.debugLineNum = 54;BA.debugLine="pg.RootPanel.Color = Library.Theme_Background";
[[self._pg RootPanel] setColor:self._library._theme_background];
 //BA.debugLineNum = 56;BA.debugLine="Library.ShowCartLabel(lblbasket)";
[self._library _showcartlabel:self._lblbasket];
 //BA.debugLineNum = 58;BA.debugLine="End Sub";
return @"";
}
@end
