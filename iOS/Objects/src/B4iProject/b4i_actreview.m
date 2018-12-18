
#import "b4i_actreview.h"
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
#import "b4i_actabout.h"
#import "b4i_actshow.h"
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_actreview 


+ (instancetype)new {
    static b4i_actreview* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 89;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 90;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 91;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsend_click{
b4i_opencart* _op = nil;
 //BA.debugLineNum = 93;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 95;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 96;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 97;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 100;BA.debugLine="If txtname.Text.Length < 2 Or txttext.Text.Length";
if ([[self._txtname Text] Length]<2 || [[self._txttext Text] Length]<25) { 
 //BA.debugLineNum = 101;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[[self._library _getstringresourse:@"error_data"] Replace:@"\\n" :[self.__c CRLF]] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 102;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 105;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 106;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 107;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 108;BA.debugLine="op.AddReviewProduct(Me,\"SendReview_receive\",id,tx";
[_op _addreviewproduct:self :@"SendReview_receive" :self._id :[self._txtname Text] :[self._txttext Text] :self._rate];
 //BA.debugLineNum = 110;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _changestar{
 //BA.debugLineNum = 154;BA.debugLine="Sub ChangeStar";
 //BA.debugLineNum = 156;BA.debugLine="If Rate = \"1\" Then";
if ([self._rate isEqual:@"1"]) { 
 //BA.debugLineNum = 157;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 158;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 159;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 160;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 161;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([self._rate isEqual:@"2"]) { 
 //BA.debugLineNum = 164;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 165;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 166;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 167;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 168;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([self._rate isEqual:@"3"]) { 
 //BA.debugLineNum = 171;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 172;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 173;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 174;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 175;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([self._rate isEqual:@"4"]) { 
 //BA.debugLineNum = 178;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 179;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 180;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 181;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 182;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 }else if([self._rate isEqual:@"5"] || [self.bi ObjectToNumber:self._rate].doubleValue>5) { 
 //BA.debugLineNum = 185;BA.debugLine="lbls1.Text = \"\"";
[self._lbls1 setText:@""];
 //BA.debugLineNum = 186;BA.debugLine="lbls2.Text = \"\"";
[self._lbls2 setText:@""];
 //BA.debugLineNum = 187;BA.debugLine="lbls3.Text = \"\"";
[self._lbls3 setText:@""];
 //BA.debugLineNum = 188;BA.debugLine="lbls4.Text = \"\"";
[self._lbls4 setText:@""];
 //BA.debugLineNum = 189;BA.debugLine="lbls5.Text = \"\"";
[self._lbls5 setText:@""];
 };
 //BA.debugLineNum = 192;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbls1_click{
 //BA.debugLineNum = 149;BA.debugLine="Sub lbls1_Click";
 //BA.debugLineNum = 150;BA.debugLine="Rate = \"1\"";
self._rate = @"1";
 //BA.debugLineNum = 151;BA.debugLine="ChangeStar";
[self _changestar];
 //BA.debugLineNum = 152;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbls2_click{
 //BA.debugLineNum = 144;BA.debugLine="Sub lbls2_Click";
 //BA.debugLineNum = 145;BA.debugLine="Rate = \"2\"";
self._rate = @"2";
 //BA.debugLineNum = 146;BA.debugLine="ChangeStar";
[self _changestar];
 //BA.debugLineNum = 147;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbls3_click{
 //BA.debugLineNum = 139;BA.debugLine="Sub lbls3_Click";
 //BA.debugLineNum = 140;BA.debugLine="Rate = \"3\"";
self._rate = @"3";
 //BA.debugLineNum = 141;BA.debugLine="ChangeStar";
[self _changestar];
 //BA.debugLineNum = 142;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbls4_click{
 //BA.debugLineNum = 134;BA.debugLine="Sub lbls4_Click";
 //BA.debugLineNum = 135;BA.debugLine="Rate = \"4\"";
self._rate = @"4";
 //BA.debugLineNum = 136;BA.debugLine="ChangeStar";
[self _changestar];
 //BA.debugLineNum = 137;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbls5_click{
 //BA.debugLineNum = 129;BA.debugLine="Sub lbls5_Click";
 //BA.debugLineNum = 130;BA.debugLine="Rate = \"5\"";
self._rate = @"5";
 //BA.debugLineNum = 131;BA.debugLine="ChangeStar";
[self _changestar];
 //BA.debugLineNum = 132;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pnlreviews_click{
 //BA.debugLineNum = 199;BA.debugLine="Sub pnlreviews_Click";
 //BA.debugLineNum = 200;BA.debugLine="pg.ResignFocus";
[self._pg ResignFocus];
 //BA.debugLineNum = 201;BA.debugLine="End Sub";
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
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 5;BA.debugLine="Public id As String";
self._id = @"";
 //BA.debugLineNum = 6;BA.debugLine="Private Rate As String = \"1\"";
self._rate = @"1";
 //BA.debugLineNum = 7;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private lblname As Label";
self._lblname = [B4ILabelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private txtname As TextField";
self._txtname = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private lblrate As Label";
self._lblrate = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private lbltext As Label";
self._lbltext = [B4ILabelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private txttext As TextView";
self._txttext = [B4ITextViewWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private btnsend As Button";
self._btnsend = [B4IButtonWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 18;BA.debugLine="Private lbls5 As Label";
self._lbls5 = [B4ILabelWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private lbls4 As Label";
self._lbls4 = [B4ILabelWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Private lbls3 As Label";
self._lbls3 = [B4ILabelWrapper new];
 //BA.debugLineNum = 21;BA.debugLine="Private lbls2 As Label";
self._lbls2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private lbls1 As Label";
self._lbls1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private pnlreviews As Panel";
self._pnlreviews = [B4IPanelWrapper new];
 //BA.debugLineNum = 24;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Dim pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 26;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _sendreview_receive:(B4IMap*) _res :(NSString*) _cat{
NSString* _res1 = @"";
 //BA.debugLineNum = 112;BA.debugLine="Sub SendReview_receive(res As Map,cat As String)";
 //BA.debugLineNum = 114;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 116;BA.debugLine="Dim res1 As String";
_res1 = @"";
 //BA.debugLineNum = 117;BA.debugLine="res1 = res.Get(\"success\")";
_res1 = [self.bi ObjectToString:[_res Get:(NSObject*)(@"success")]];
 //BA.debugLineNum = 119;BA.debugLine="If res1.ToLowerCase = \"true\" Then";
if ([[_res1 ToLowerCase] isEqual:@"true"]) { 
 //BA.debugLineNum = 120;BA.debugLine="txtname.Text = \"\"";
[self._txtname setText:@""];
 //BA.debugLineNum = 121;BA.debugLine="txttext.Text = \"\"";
[self._txttext setText:@""];
 //BA.debugLineNum = 122;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"success_send"] :(long long) (1.5) :[self.__c True]];
 }else {
 //BA.debugLineNum = 124;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[[self._library _getstringresourse:@"error_data"] Replace:@"\\n" :[self.__c CRLF]] :(long long) (2) :[self.__c False]];
 };
 //BA.debugLineNum = 127;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IViewWrapper* _v1 = nil;
B4ILabelWrapper* _lb2 = nil;
 //BA.debugLineNum = 28;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 30;BA.debugLine="sv1.Initialize(\"sv1\",Library.GetWidth,Library.Get";
[self._sv1 Initialize:self.bi :@"sv1" :[self._library _getwidth] :[self._library _getheight]];
 //BA.debugLineNum = 31;BA.debugLine="sv1.ContentHeight = Library.GetHeight";
[self._sv1 setContentHeight:[self._library _getheight]];
 //BA.debugLineNum = 32;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 33;BA.debugLine="sv1.Color = Colors.White";
[self._sv1 setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 34;BA.debugLine="sv1.Panel.Color = Colors.White";
[[self._sv1 Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 37;BA.debugLine="pg.Initialize(\"\")";
[self._pg Initialize:self.bi :@""];
 //BA.debugLineNum = 39;BA.debugLine="pg.RootPanel.AddView(sv1,0,0,Library.GetWidth,Lib";
[[self._pg RootPanel] AddView:(UIView*)((self._sv1).object) :(float) (0) :(float) (0) :(float) ([self._library _getwidth]) :(float) ([self._library _getheight])];
 //BA.debugLineNum = 40;BA.debugLine="sv1.Panel.LoadLayout(\"frmreview\")";
[[self._sv1 Panel] LoadLayout:@"frmreview" :self.bi];
 //BA.debugLineNum = 41;BA.debugLine="sv1.ContentHeight = Library.GetHeight+300dip";
[self._sv1 setContentHeight:(int) ([self._library _getheight]+[self.__c DipToCurrent:(int) (300)])];
 //BA.debugLineNum = 42;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 43;BA.debugLine="MyToastMessageShow1.Initialize(pg.RootPanel)";
[self._mytoastmessageshow1 _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 45;BA.debugLine="lbls1.TextColor = Library.Theme_Header";
[self._lbls1 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 47;BA.debugLine="lbls2.TextColor = Library.Theme_Header";
[self._lbls2 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 48;BA.debugLine="lbls3.TextColor = Library.Theme_Header";
[self._lbls3 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 49;BA.debugLine="lbls4.TextColor = Library.Theme_Header";
[self._lbls4 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 50;BA.debugLine="lbls5.TextColor = Library.Theme_Header";
[self._lbls5 setTextColor:self._library._theme_header];
 //BA.debugLineNum = 52;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"review";
[self._lbltitle setText:[self._library _getstringresourse:@"reviews"]];
 //BA.debugLineNum = 53;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 54;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 56;BA.debugLine="lblname.Text = Library.GetStringResourse(\"tname\")";
[self._lblname setText:[self._library _getstringresourse:@"tname"]];
 //BA.debugLineNum = 57;BA.debugLine="lblrate.Text = Library.GetStringResourse(\"trate\")";
[self._lblrate setText:[self._library _getstringresourse:@"trate"]];
 //BA.debugLineNum = 58;BA.debugLine="lbltext.Text = Library.GetStringResourse(\"ttext\")";
[self._lbltext setText:[self._library _getstringresourse:@"ttext"]];
 //BA.debugLineNum = 59;BA.debugLine="btnsend.Text = Library.GetStringResourse(\"send\")";
[self._btnsend setText:[self._library _getstringresourse:@"send"]];
 //BA.debugLineNum = 60;BA.debugLine="Library.GetButtonState(btnsend)";
[self._library _getbuttonstate:self._btnsend];
 //BA.debugLineNum = 61;BA.debugLine="Library.SetFont(btnsend,\"icomoon\",btnsend.CustomL";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnsend).object)] :@"icomoon" :(int) ([[[self._btnsend CustomLabel] Font] Size])];
 //BA.debugLineNum = 62;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 63;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 64;BA.debugLine="btnsend.CustomLabel.Font = Library.GetFont(14)";
[[self._btnsend CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 66;BA.debugLine="For Each v1 As View In pnlreviews.GetAllViewsRecu";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group29 = [self._pnlreviews GetAllViewsRecursive];
const int groupLen29 = group29.Size
;int index29 = 0;
;
for (; index29 < groupLen29;index29++){
_v1.object = (UIView*)([group29 Get:index29]);
 //BA.debugLineNum = 67;BA.debugLine="If v1 Is Label Then";
if ([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 68;BA.debugLine="Dim lb2 As Label";
_lb2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 69;BA.debugLine="lb2 = v1";
_lb2.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 70;BA.debugLine="If lb2.Tag <> \"icon\" Then";
if ([[_lb2 Tag] isEqual:(NSObject*)(@"icon")] == false) { 
 //BA.debugLineNum = 71;BA.debugLine="lb2.Font = Library.GetFont(lb2.Font.Size)";
[_lb2 setFont:[self._library _getfont:(int) ([[_lb2 Font] Size])]];
 }else {
 //BA.debugLineNum = 73;BA.debugLine="Library.SetFont(lb2,\"icomoon\",lb2.Font.Size)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_lb2).object)] :@"icomoon" :(int) ([[_lb2 Font] Size])];
 };
 };
 }
};
 //BA.debugLineNum = 78;BA.debugLine="txtname.Color = Colors.RGB(250,250,250)";
[self._txtname setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 79;BA.debugLine="txttext.Color = Colors.RGB(250,250,250)";
[self._txttext setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 81;BA.debugLine="lblname.TextAlignment = Library.GetStringResourse";
[self._lblname setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 82;BA.debugLine="txtname.TextAlignment = Library.GetStringResourse";
[self._txtname setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 83;BA.debugLine="lblrate.TextAlignment = Library.GetStringResourse";
[self._lblrate setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 84;BA.debugLine="lbltext.TextAlignment = Library.GetStringResourse";
[self._lbltext setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 85;BA.debugLine="txttext.TextAlignment = Library.GetStringResourse";
[self._txttext setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 87;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txttext_click{
 //BA.debugLineNum = 194;BA.debugLine="Sub txttext_Click";
 //BA.debugLineNum = 195;BA.debugLine="txttext.RequestFocus";
[self._txttext RequestFocus];
 //BA.debugLineNum = 196;BA.debugLine="sv1.ScrollTo(0,txttext.Top,True)";
[self._sv1 ScrollTo:(int) (0) :(int) ([self._txttext Top]) :[self.__c True]];
 //BA.debugLineNum = 197;BA.debugLine="End Sub";
return @"";
}
@end
