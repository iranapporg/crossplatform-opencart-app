
#import "b4i_actlogin.h"
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


@implementation b4i_actlogin 


+ (instancetype)new {
    static b4i_actlogin* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 85;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 86;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 87;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnguest_click{
 //BA.debugLineNum = 259;BA.debugLine="Sub btnguest_Click";
 //BA.debugLineNum = 260;BA.debugLine="actRegister.Guest = True";
self._actregister._guest = [self.__c True];
 //BA.debugLineNum = 261;BA.debugLine="actRegister.StartActivity";
[self._actregister _startactivity];
 //BA.debugLineNum = 262;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnlogin_click{
B4IMap* _data = nil;
 //BA.debugLineNum = 89;BA.debugLine="Sub btnlogin_Click";
 //BA.debugLineNum = 91;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 92;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 93;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 96;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 97;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 99;BA.debugLine="If txtpassword.Text.Length < 5 Then";
if ([[self._txtpassword Text] Length]<5) { 
 //BA.debugLineNum = 100;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_password"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 101;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 104;BA.debugLine="data.Put(\"password\",txtpassword.Text)";
[_data Put:(NSObject*)(@"password") :(NSObject*)([self._txtpassword Text])];
 //BA.debugLineNum = 106;BA.debugLine="If Library.ValidEmail(txtusername.Text) = False T";
if ([self._library _validemail:[self._txtusername Text]]==[self.__c False]) { 
 //BA.debugLineNum = 107;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_email"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 108;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 112;BA.debugLine="data.Put(\"email\",txtusername.Text)";
[_data Put:(NSObject*)(@"email") :(NSObject*)([self._txtusername Text])];
 //BA.debugLineNum = 114;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 116;BA.debugLine="op1.Login(Me,\"login_receive\",data.Get(\"email\"),da";
[self._op1 _login:self :@"login_receive" :[self.bi ObjectToString:[_data Get:(NSObject*)(@"email")]] :[self.bi ObjectToString:[_data Get:(NSObject*)(@"password")]]];
 //BA.debugLineNum = 118;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsms_click{
b4i_opencart* _op = nil;
 //BA.debugLineNum = 264;BA.debugLine="Sub btnsms_Click";
 //BA.debugLineNum = 266;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 268;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 269;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 270;BA.debugLine="op.GetCarts(Me,\"Carts_receive\")";
[_op _getcarts:self :@"Carts_receive"];
 //BA.debugLineNum = 272;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _carts_receive:(B4IMap*) _res :(NSString*) _cat{
B4IList* _l1 = nil;
B4IMap* _images = nil;
NSString* _rs = @"";
int _i = 0;
B4IMap* _temp = nil;
int _qu = 0;
 //BA.debugLineNum = 274;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 276;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 278;BA.debugLine="If res.IsInitialized = False Then";
if ([_res IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 279;BA.debugLine="Library.hud.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"no_cart"] :[self.__c False]];
 //BA.debugLineNum = 280;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 281;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 284;BA.debugLine="If res.ContainsKey(\"products\") Then";
if ([_res ContainsKey:(NSObject*)(@"products")]) { 
 //BA.debugLineNum = 286;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 287;BA.debugLine="l1.Initialize";
[_l1 Initialize];
 //BA.debugLineNum = 288;BA.debugLine="l1 = res.Get(\"products\")";
_l1.object = (NSArray*)([_res Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 290;BA.debugLine="Dim images As Map";
_images = [B4IMap new];
 //BA.debugLineNum = 291;BA.debugLine="images.Initialize";
[_images Initialize];
 //BA.debugLineNum = 293;BA.debugLine="Dim rs As String";
_rs = @"";
 //BA.debugLineNum = 294;BA.debugLine="rs = Library.GetStringResourse(\"order_title\").Re";
_rs = [@[[[[self._library _getstringresourse:@"order_title"] Replace:@"ها" :@""] Replace:@"s" :@""],[self.__c CRLF]] componentsJoinedByString:@""];
 //BA.debugLineNum = 296;BA.debugLine="For i = 0 To l1.Size - 1";
{
const int step15 = 1;
const int limit15 = (int) ([_l1 Size]-1);
_i = (int) (0) ;
for (;(step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15) ;_i = ((int)(0 + _i + step15))  ) {
 //BA.debugLineNum = 298;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 299;BA.debugLine="temp = l1.Get(i)";
_temp = (B4IMap*)([_l1 Get:_i]);
 //BA.debugLineNum = 301;BA.debugLine="Dim qu As Int";
_qu = 0;
 //BA.debugLineNum = 302;BA.debugLine="qu = temp.Get(\"quantity\")";
_qu = [self.bi ObjectToNumber:[_temp Get:(NSObject*)(@"quantity")]].intValue;
 //BA.debugLineNum = 304;BA.debugLine="rs = rs & temp.Get(\"name\") & \" ( \" & qu & \" \" &";
_rs = [@[_rs,[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]],@" ( ",[self.bi NumberToString:@(_qu)],@" ",[self._library _getstringresourse:@"adad"],@" )",[self.__c CRLF]] componentsJoinedByString:@""];
 }
};
 //BA.debugLineNum = 309;BA.debugLine="Basket = rs";
self._basket = _rs;
 //BA.debugLineNum = 312;BA.debugLine="Library.LastPage = pg";
self._library._lastpage = self._pg;
 //BA.debugLineNum = 313;BA.debugLine="actSMS.Basket = Basket";
self._actsms._basket = self._basket;
 //BA.debugLineNum = 314;BA.debugLine="actSMS.StartActivity";
[self._actsms _startactivity];
 };
 //BA.debugLineNum = 319;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _forgot_input:(NSString*) _email{
b4i_opencart* _op2 = nil;
 //BA.debugLineNum = 213;BA.debugLine="Sub Forgot_Input(Email As String)";
 //BA.debugLineNum = 215;BA.debugLine="If Library.ValidEmail(Email) Then";
if ([self._library _validemail:_email]) { 
 //BA.debugLineNum = 216;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_email"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 217;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 219;BA.debugLine="Dim op2 As OpenCart";
_op2 = [b4i_opencart new];
 //BA.debugLineNum = 220;BA.debugLine="op2.Initialize";
[_op2 _initialize:self.bi];
 //BA.debugLineNum = 221;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 222;BA.debugLine="op2.ForgotPassword(Me,\"forgot_receive\",Email)";
[_op2 _forgotpassword:self :@"forgot_receive" :_email];
 };
 //BA.debugLineNum = 225;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _forgot_receive:(B4IMap*) _res :(NSString*) _cat{
B4IList* _rs = nil;
NSString* _err = @"";
int _i = 0;
 //BA.debugLineNum = 227;BA.debugLine="Sub forgot_receive(res As Map,cat As String)";
 //BA.debugLineNum = 229;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 231;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 232;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 233;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"send_forgot"] :(long long) (1.5) :[self.__c True]];
 //BA.debugLineNum = 234;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 238;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 240;BA.debugLine="Dim rs As List";
_rs = [B4IList new];
 //BA.debugLineNum = 241;BA.debugLine="rs = res.Get(\"error\")";
_rs.object = (NSArray*)([_res Get:(NSObject*)(@"error")]);
 //BA.debugLineNum = 243;BA.debugLine="Dim err As String";
_err = @"";
 //BA.debugLineNum = 245;BA.debugLine="For i = 0 To rs.Size - 1";
{
const int step12 = 1;
const int limit12 = (int) ([_rs Size]-1);
_i = (int) (0) ;
for (;(step12 > 0 && _i <= limit12) || (step12 < 0 && _i >= limit12) ;_i = ((int)(0 + _i + step12))  ) {
 //BA.debugLineNum = 246;BA.debugLine="err = err & rs.Get(i) & CRLF";
_err = [@[_err,[self.bi ObjectToString:[_rs Get:_i]],[self.__c CRLF]] componentsJoinedByString:@""];
 }
};
 //BA.debugLineNum = 249;BA.debugLine="Msgbox(err,Library.GetStringResourse(\"alert\"))";
[self.__c Msgbox:_err :[self._library _getstringresourse:@"alert"]];
 };
 //BA.debugLineNum = 253;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _inputdialog:(NSString*) _input :(NSString*) _title :(NSString*) _message :(NSString*) _positive :(NSString*) _cancel :(int) _inputtype{
B4INativeObject* _no = nil;
 //BA.debugLineNum = 358;BA.debugLine="Sub InputDialog(Input As String, Title As String,";
 //BA.debugLineNum = 359;BA.debugLine="Dim no As NativeObject = Me";
_no = [B4INativeObject new];
_no.object = (NSObject*)(self);
 //BA.debugLineNum = 360;BA.debugLine="no.RunMethod(\"ShowInputDialog::::::\", Array(In";
[_no RunMethod:@"ShowInputDialog::::::" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(_input)],[B4I nilToNSNull:(NSObject*)(_title)],[B4I nilToNSNull:(NSObject*)(_message)],[B4I nilToNSNull:(NSObject*)(_positive)],[B4I nilToNSNull:(NSObject*)(_cancel)],[B4I nilToNSNull:(NSObject*)(@(_inputtype))]]]];
 //BA.debugLineNum = 361;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _inputdialog_result:(NSString*) _text{
 //BA.debugLineNum = 363;BA.debugLine="Sub InputDialog_Result(Text As String)";
 //BA.debugLineNum = 364;BA.debugLine="Forgot_Input(Text)";
[self _forgot_input:_text];
 //BA.debugLineNum = 365;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblforgot_click{
 //BA.debugLineNum = 207;BA.debugLine="Sub lblforgot_Click";
 //BA.debugLineNum = 209;BA.debugLine="InputDialog(\"\",Library.GetStringResourse(\"alert\")";
[self _inputdialog:@"" :[self._library _getstringresourse:@"alert"] :[self._library _getstringresourse:@"error_email"] :[self._library _getstringresourse:@"send_pass"] :[self._library _getstringresourse:@"cancel"] :(int) (7)];
 //BA.debugLineNum = 211;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lblregister_click{
 //BA.debugLineNum = 255;BA.debugLine="Sub lblregister_Click";
 //BA.debugLineNum = 256;BA.debugLine="actRegister.StartActivity";
[self._actregister _startactivity];
 //BA.debugLineNum = 257;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _login_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _rs = nil;
NSString* _err = @"";
NSString* _vs = @"";
B4IMap* _data = nil;
B4IMap* _t = nil;
 //BA.debugLineNum = 120;BA.debugLine="Sub login_receive(res As Map,cat As String)";
 //BA.debugLineNum = 122;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 124;BA.debugLine="If res = Null Then";
if (_res== nil) { 
 //BA.debugLineNum = 125;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 126;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 129;BA.debugLine="If res.IsInitialized = False Then";
if ([_res IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 130;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 131;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 134;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 136;BA.debugLine="If res.Get(\"error\") = \"User already is logged\" T";
if ([[_res Get:(NSObject*)(@"error")] isEqual:(NSObject*)(@"User already is logged")]) { 
 //BA.debugLineNum = 138;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 141;BA.debugLine="Dim rs As Map";
_rs = [B4IMap new];
 //BA.debugLineNum = 142;BA.debugLine="rs = res.Get(\"error\")";
_rs = (B4IMap*)([_res Get:(NSObject*)(@"error")]);
 //BA.debugLineNum = 144;BA.debugLine="Dim err As String";
_err = @"";
 //BA.debugLineNum = 146;BA.debugLine="For Each vs As String In rs.Values";
{
const id<B4IIterable> group17 = [_rs Values];
const int groupLen17 = group17.Size
;int index17 = 0;
;
for (; index17 < groupLen17;index17++){
_vs = [self.bi ObjectToString:[group17 Get:index17]];
 //BA.debugLineNum = 147;BA.debugLine="err = err & vs & CRLF";
_err = [@[_err,_vs,[self.__c CRLF]] componentsJoinedByString:@""];
 }
};
 //BA.debugLineNum = 150;BA.debugLine="Msgbox(err,Library.GetStringResourse(\"alert\"))";
[self.__c Msgbox:_err :[self._library _getstringresourse:@"alert"]];
 }else {
 //BA.debugLineNum = 153;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 154;BA.debugLine="data = res.Get(\"data\")";
_data = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 156;BA.debugLine="If res.ContainsKey(\"data\") = False Then";
if ([_res ContainsKey:(NSObject*)(@"data")]==[self.__c False]) { 
 //BA.debugLineNum = 157;BA.debugLine="Library.loginDetails.Initialize";
[self._library._logindetails Initialize];
 //BA.debugLineNum = 158;BA.debugLine="Library.loginDetails.Put(\"address_id\",\"1\")";
[self._library._logindetails Put:(NSObject*)(@"address_id") :(NSObject*)(@"1")];
 //BA.debugLineNum = 159;BA.debugLine="Library.loginDetails.Put(\"login\",True)";
[self._library._logindetails Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c True]))];
 //BA.debugLineNum = 161;BA.debugLine="Library.loginDetails.put(\"expire\",DateTime.Now";
[self._library._logindetails Put:(NSObject*)(@"expire") :(NSObject*)(@([[self.__c DateTime] Now]))];
 //BA.debugLineNum = 163;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if ([self._library._guestlogin IsInitialized]) { 
 //BA.debugLineNum = 164;BA.debugLine="Library.GuestLogin.Put(\"login\",False)";
[self._library._guestlogin Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c False]))];
 };
 //BA.debugLineNum = 167;BA.debugLine="Library.hud.ToastMessageShow(Library.GetString";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"login_success"] :[self.__c False]];
 //BA.debugLineNum = 168;BA.debugLine="CallSubDelayed(actMenu,\"UpdateUI\")";
[self.__c CallSubDelayed:self.bi :(NSObject*)((self._actmenu).object) :@"UpdateUI"];
 //BA.debugLineNum = 169;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 170;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 173;BA.debugLine="If Library.loginDetails.IsInitialized = False Th";
if ([self._library._logindetails IsInitialized]==[self.__c False]) { 
[self._library._logindetails Initialize];};
 //BA.debugLineNum = 175;BA.debugLine="Try";
@try { //BA.debugLineNum = 176;BA.debugLine="Dim t As Map";
_t = [B4IMap new];
 //BA.debugLineNum = 177;BA.debugLine="t.Initialize";
[_t Initialize];
 //BA.debugLineNum = 178;BA.debugLine="t.Put(\"address_id\",data.Get(\"address_id\"))";
[_t Put:(NSObject*)(@"address_id") :[_data Get:(NSObject*)(@"address_id")]];
 //BA.debugLineNum = 179;BA.debugLine="t.Put(\"login\",True)";
[_t Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c True]))];
 //BA.debugLineNum = 180;BA.debugLine="t.put(\"session\",data.Get(\"session\"))";
[_t Put:(NSObject*)(@"session") :[_data Get:(NSObject*)(@"session")]];
 //BA.debugLineNum = 181;BA.debugLine="t.put(\"expire\",DateTime.Now)";
[_t Put:(NSObject*)(@"expire") :(NSObject*)(@([[self.__c DateTime] Now]))];
 //BA.debugLineNum = 183;BA.debugLine="For Each vs As String In data.Keys";
{
const id<B4IIterable> group45 = [_data Keys];
const int groupLen45 = group45.Size
;int index45 = 0;
;
for (; index45 < groupLen45;index45++){
_vs = [self.bi ObjectToString:[group45 Get:index45]];
 //BA.debugLineNum = 184;BA.debugLine="t.Put(vs,data.Get(vs))";
[_t Put:(NSObject*)(_vs) :[_data Get:(NSObject*)(_vs)]];
 }
};
 //BA.debugLineNum = 187;BA.debugLine="Library.loginDetails = t";
self._library._logindetails = _t;
 } 
       @catch (NSException* e50) {
			[B4I SetException:e50]; };
 //BA.debugLineNum = 193;BA.debugLine="Library.ChoosenAddress = 0";
self._library._choosenaddress = (int) (0);
 //BA.debugLineNum = 195;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if ([self._library._guestlogin IsInitialized]) { 
 //BA.debugLineNum = 196;BA.debugLine="Library.GuestLogin.Put(\"login\",False)";
[self._library._guestlogin Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c False]))];
 };
 //BA.debugLineNum = 199;BA.debugLine="Library.hud.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"login_success"] :[self.__c False]];
 //BA.debugLineNum = 200;BA.debugLine="CallSubDelayed(actMenu,\"UpdateUI\")";
[self.__c CallSubDelayed:self.bi :(NSObject*)((self._actmenu).object) :@"UpdateUI"];
 //BA.debugLineNum = 201;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 };
 //BA.debugLineNum = 205;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _logout_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 66;BA.debugLine="Sub Logout_receive(res As Map,cat As String)";
 //BA.debugLineNum = 68;BA.debugLine="If res = Null Then Return";
if (_res== nil) { 
if (true) return @"";};
 //BA.debugLineNum = 69;BA.debugLine="If res.IsInitialized = False Then Return";
if ([_res IsInitialized]==[self.__c False]) { 
if (true) return @"";};
 //BA.debugLineNum = 71;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 73;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 74;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if ([self._library._logindetails IsInitialized]) { 
 //BA.debugLineNum = 75;BA.debugLine="Library.loginDetails.Put(\"login\",False)";
[self._library._logindetails Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c False]))];
 };
 }else {
 //BA.debugLineNum = 78;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 };
 };
 //BA.debugLineNum = 83;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 4;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 5;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 6;BA.debugLine="Private btnlogin As Button";
self._btnlogin = [B4IButtonWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private op1 As OpenCart";
self._op1 = [b4i_opencart new];
 //BA.debugLineNum = 10;BA.debugLine="Private lblforgot As Label";
self._lblforgot = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 12;BA.debugLine="Private txtusername As TextField";
self._txtusername = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private txtpassword As TextField";
self._txtpassword = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private lblregister As Label";
self._lblregister = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private btnguest As Button";
self._btnguest = [B4IButtonWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private btnsms As Button";
self._btnsms = [B4IButtonWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private Basket As String";
self._basket = @"";
 //BA.debugLineNum = 18;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 20;BA.debugLine="Public RegisteredUsername,RegisteredPassword As S";
self._registeredusername = @"";
self._registeredpassword = @"";
 //BA.debugLineNum = 21;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 23;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 25;BA.debugLine="pg.Initialize(\"\")";
[self._pg Initialize:self.bi :@""];
 //BA.debugLineNum = 26;BA.debugLine="pg.RootPanel.LoadLayout(\"frmlogin\")";
[[self._pg RootPanel] LoadLayout:@"frmlogin" :self.bi];
 //BA.debugLineNum = 27;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 29;BA.debugLine="Library.ChangeFont(pg.RootPanel)";
[self._library _changefont:[self._pg RootPanel]];
 //BA.debugLineNum = 31;BA.debugLine="MyToastMessageShow1.Initialize(pg.RootPanel)";
[self._mytoastmessageshow1 _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 33;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"login\"";
[self._lbltitle setText:[self._library _getstringresourse:@"login"]];
 //BA.debugLineNum = 34;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 35;BA.debugLine="lblforgot.Text = Library.GetStringResourse(\"forgo";
[self._lblforgot setText:[self._library _getstringresourse:@"forgot"]];
 //BA.debugLineNum = 36;BA.debugLine="btnlogin.Text = Library.GetStringResourse(\"reques";
[self._btnlogin setText:[self._library _getstringresourse:@"request_login"]];
 //BA.debugLineNum = 37;BA.debugLine="btnsms.Text = Library.GetStringResourse(\"send_sms";
[self._btnsms setText:[self._library _getstringresourse:@"send_sms"]];
 //BA.debugLineNum = 38;BA.debugLine="lblregister.Text = Library.GetStringResourse(\"req";
[self._lblregister setText:[@[[self._library _getstringresourse:@"request_register"],@" ",[self._library _getstringresourse:@"app_title"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 39;BA.debugLine="btnguest.Text  = Library.GetStringResourse(\"reuqu";
[self._btnguest setText:[self._library _getstringresourse:@"reuquest_guest"]];
 //BA.debugLineNum = 40;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 41;BA.debugLine="Library.GetButtonState(btnlogin)";
[self._library _getbuttonstate:self._btnlogin];
 //BA.debugLineNum = 42;BA.debugLine="txtusername.HintText = Library.GetStringResourse(";
[self._txtusername setHintText:[[self._library _getstringresourse:@"lblemail"] Replace:@":" :@""]];
 //BA.debugLineNum = 43;BA.debugLine="txtpassword.HintText = Library.GetStringResourse(";
[self._txtpassword setHintText:[[self._library _getstringresourse:@"lblpassword"] Replace:@":" :@""]];
 //BA.debugLineNum = 47;BA.debugLine="txtusername.Text = RegisteredUsername";
[self._txtusername setText:self._registeredusername];
 //BA.debugLineNum = 48;BA.debugLine="txtpassword.Text = RegisteredPassword";
[self._txtpassword setText:self._registeredpassword];
 //BA.debugLineNum = 49;BA.debugLine="txtusername.KeyboardType = txtusername.TYPE_EMAIL";
[self._txtusername setKeyboardType:[self._txtusername TYPE_EMAIL_ADDRESS]];
 //BA.debugLineNum = 53;BA.debugLine="op1.Initialize";
[self._op1 _initialize:self.bi];
 //BA.debugLineNum = 55;BA.debugLine="Library.GetButtonState(btnsms)";
[self._library _getbuttonstate:self._btnsms];
 //BA.debugLineNum = 56;BA.debugLine="btnsms.Top = Library.GetHeight-btnsms.Height-20di";
[self._btnsms setTop:(float) ([self._library _getheight]-[self._btnsms Height]-[self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 58;BA.debugLine="btnlogin.Color = Library.ConvertHex2Int(Library.G";
[self._btnlogin setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 60;BA.debugLine="Dim op1 As OpenCart";
self._op1 = [b4i_opencart new];
 //BA.debugLineNum = 61;BA.debugLine="op1.Initialize";
[self._op1 _initialize:self.bi];
 //BA.debugLineNum = 62;BA.debugLine="op1.Logout(Me,\"Logout_receive\")";
[self._op1 _logout:self :@"Logout_receive"];
 //BA.debugLineNum = 64;BA.debugLine="End Sub";
return @"";
}
- (void)ShowInputDialog:(NSString*)Input :(NSString*)Title :(NSString*)Message :(NSString*)OK :(NSString*)Cancel :(int)KeybardType
{
  UIAlertView * alert = [[UIAlertView alloc] initWithTitle:Title
    message:Message delegate:self cancelButtonTitle:Cancel otherButtonTitles:OK, nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;

    UITextField * alertTextField = [alert textFieldAtIndex:0];
    alertTextField.keyboardType = KeybardType;
   
    alertTextField.text = Input;
    alert.delegate = self;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self.bi raiseEvent:nil event:@"inputdialog_result:" params:@[[[alertView textFieldAtIndex:0] text]]];
    }
}
@end
