
#import "b4i_actabout.h"
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
#import "b4i_actshow.h"
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_actabout 


+ (instancetype)new {
    static b4i_actabout* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 95;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 96;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
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
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 5;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private imglogo As ImageView";
self._imglogo = [B4IImageViewWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private lbladdress As Label";
self._lbladdress = [B4ILabelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private lblemail As Label";
self._lblemail = [B4ILabelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private lblfax As Label";
self._lblfax = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private lblname As Label";
self._lblname = [B4ILabelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private lblowner As Label";
self._lblowner = [B4ILabelWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private lblphone As Label";
self._lblphone = [B4ILabelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private lblurl As Label";
self._lblurl = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private pnlsearch As Panel";
self._pnlsearch = [B4IPanelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private lblcomment As Label";
self._lblcomment = [B4ILabelWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private btnlist As Button";
self._btnlist = [B4IButtonWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IPage* _pg = nil;
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 22;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 24;BA.debugLine="Dim pg As Page";
_pg = [B4IPage new];
 //BA.debugLineNum = 25;BA.debugLine="pg.Initialize(\"\")";
[_pg Initialize:self.bi :@""];
 //BA.debugLineNum = 26;BA.debugLine="pg.RootPanel.LoadLayout(\"frmabout\")";
[[_pg RootPanel] LoadLayout:@"frmabout" :self.bi];
 //BA.debugLineNum = 27;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((_pg).object)];
 //BA.debugLineNum = 29;BA.debugLine="Library.ChangeFont(pg.RootPanel)";
[self._library _changefont:[_pg RootPanel]];
 //BA.debugLineNum = 31;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 32;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"about\"";
[self._lbltitle setText:[self._library _getstringresourse:@"about"]];
 //BA.debugLineNum = 33;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 34;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"shop_li";
[self._btnlist setText:[self._library _getstringresourse:@"shop_list"]];
 //BA.debugLineNum = 36;BA.debugLine="Library.PaddingLabel(lbladdress,16,16,16,16)";
[self._library _paddinglabel:self._lbladdress :(int) (16) :(int) (16) :(int) (16) :(int) (16)];
 //BA.debugLineNum = 37;BA.debugLine="Library.PaddingLabel(lblcomment,16,16,16,16)";
[self._library _paddinglabel:self._lblcomment :(int) (16) :(int) (16) :(int) (16) :(int) (16)];
 //BA.debugLineNum = 38;BA.debugLine="Library.PaddingLabel(lblname,20,0,20,0)";
[self._library _paddinglabel:self._lblname :(int) (20) :(int) (0) :(int) (20) :(int) (0)];
 //BA.debugLineNum = 39;BA.debugLine="Library.PaddingLabel(lblphone,20,0,20,0)";
[self._library _paddinglabel:self._lblphone :(int) (20) :(int) (0) :(int) (20) :(int) (0)];
 //BA.debugLineNum = 40;BA.debugLine="Library.PaddingLabel(lblfax,20,0,20,0)";
[self._library _paddinglabel:self._lblfax :(int) (20) :(int) (0) :(int) (20) :(int) (0)];
 //BA.debugLineNum = 41;BA.debugLine="Library.PaddingLabel(lblemail,20,0,20,0)";
[self._library _paddinglabel:self._lblemail :(int) (20) :(int) (0) :(int) (20) :(int) (0)];
 //BA.debugLineNum = 42;BA.debugLine="Library.PaddingLabel(lblowner,20,0,20,0)";
[self._library _paddinglabel:self._lblowner :(int) (20) :(int) (0) :(int) (20) :(int) (0)];
 //BA.debugLineNum = 43;BA.debugLine="Library.PaddingLabel(lblurl,20,0,20,0)";
[self._library _paddinglabel:self._lblurl :(int) (20) :(int) (0) :(int) (20) :(int) (0)];
 //BA.debugLineNum = 45;BA.debugLine="lblname.TextAlignment = Library.GetStringResourse";
[self._lblname setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 46;BA.debugLine="lblphone.TextAlignment = Library.GetStringResours";
[self._lblphone setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 47;BA.debugLine="lblfax.TextAlignment = Library.GetStringResourse(";
[self._lblfax setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 48;BA.debugLine="lblemail.TextAlignment = Library.GetStringResours";
[self._lblemail setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 49;BA.debugLine="lblurl.TextAlignment = Library.GetStringResourse(";
[self._lblurl setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 50;BA.debugLine="lblowner.TextAlignment = Library.GetStringResours";
[self._lblowner setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 51;BA.debugLine="lbladdress.TextAlignment = Library.GetStringResou";
[self._lbladdress setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 52;BA.debugLine="lblcomment.TextAlignment = Library.GetStringResou";
[self._lblcomment setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 54;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 55;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 56;BA.debugLine="op1.GetStore(Me,\"StoreDetails_receive\",\"0\")";
[_op1 _getstore:self :@"StoreDetails_receive" :@"0"];
 //BA.debugLineNum = 58;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _storedetails_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _data = nil;
NSString* _image = @"";
b4i_imagedownloader* _d1 = nil;
 //BA.debugLineNum = 60;BA.debugLine="Sub StoreDetails_receive(res As Map,cat As String)";
 //BA.debugLineNum = 62;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 64;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 65;BA.debugLine="data = res.Get(\"data\")";
_data = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 67;BA.debugLine="lblname.Text = data.Get(\"store_name\")";
[self._lblname setText:[self.bi ObjectToString:[_data Get:(NSObject*)(@"store_name")]]];
 //BA.debugLineNum = 68;BA.debugLine="lblphone.Text = data.Get(\"store_telephone\")";
[self._lblphone setText:[self.bi ObjectToString:[_data Get:(NSObject*)(@"store_telephone")]]];
 //BA.debugLineNum = 69;BA.debugLine="lblfax.Text = data.Get(\"store_fax\")";
[self._lblfax setText:[self.bi ObjectToString:[_data Get:(NSObject*)(@"store_fax")]]];
 //BA.debugLineNum = 71;BA.debugLine="If lblfax.Text.Length = 0 Then lblfax.Text = \"-\"";
if ([[self._lblfax Text] Length]==0) { 
[self._lblfax setText:@"-"];};
 //BA.debugLineNum = 73;BA.debugLine="lbladdress.Text = Library.GetStringResourse(\"shop";
[self._lbladdress setText:[@[[self._library _getstringresourse:@"shop_address"],[self.bi ObjectToString:[_data Get:(NSObject*)(@"store_address")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 74;BA.debugLine="lblemail.Text = Library.GetStringResourse(\"shop_e";
[self._lblemail setText:[@[[self._library _getstringresourse:@"shop_email"],[self.bi ObjectToString:[_data Get:(NSObject*)(@"store_email")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 75;BA.debugLine="lblowner.Text = Library.GetStringResourse(\"shop_o";
[self._lblowner setText:[@[[self._library _getstringresourse:@"shop_owner"],[self.bi ObjectToString:[_data Get:(NSObject*)(@"store_owner")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 76;BA.debugLine="lblurl.Text = Library.GetStringResourse(\"url\")";
[self._lblurl setText:[self._library _getstringresourse:@"url"]];
 //BA.debugLineNum = 77;BA.debugLine="lblcomment.Text = data.Get(\"store_comment\")";
[self._lblcomment setText:[self.bi ObjectToString:[_data Get:(NSObject*)(@"store_comment")]]];
 //BA.debugLineNum = 79;BA.debugLine="If lblcomment.Text.Length = 0 Then lblcomment.Tex";
if ([[self._lblcomment Text] Length]==0) { 
[self._lblcomment setText:[self._library _getstringresourse:@"no_comment"]];};
 //BA.debugLineNum = 81;BA.debugLine="Dim image As String";
_image = @"";
 //BA.debugLineNum = 82;BA.debugLine="image = data.Get(\"store_image\")";
_image = [self.bi ObjectToString:[_data Get:(NSObject*)(@"store_image")]];
 //BA.debugLineNum = 84;BA.debugLine="If image.Length = 0 Or image = Null Then";
if ([_image Length]==0 || _image== nil) { 
 //BA.debugLineNum = 85;BA.debugLine="If image.IndexOf(\"http\") = -1 Then image = Libra";
if ([_image IndexOf:@"http"]==-1) { 
_image = [@[[self._library _getstringresourse:@"url"],@"/",_image] componentsJoinedByString:@""];};
 //BA.debugLineNum = 86;BA.debugLine="image = data.Get(\"thumb\")";
_image = [self.bi ObjectToString:[_data Get:(NSObject*)(@"thumb")]];
 };
 //BA.debugLineNum = 89;BA.debugLine="Dim d1 As ImageDownloader";
_d1 = [b4i_imagedownloader new];
 //BA.debugLineNum = 90;BA.debugLine="d1.Initialize";
[_d1 _initialize:self.bi];
 //BA.debugLineNum = 91;BA.debugLine="d1.Download(CreateMap(imglogo:image))";
[_d1 _download:[self.__c createMap:@[(NSObject*)((self._imglogo).object),(NSObject*)(_image)]]];
 //BA.debugLineNum = 93;BA.debugLine="End Sub";
return @"";
}
@end
