
#import "b4i_actorderdetails.h"
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


@implementation b4i_actorderdetails 


+ (instancetype)new {
    static b4i_actorderdetails* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btncancelreturn_click{
 //BA.debugLineNum = 390;BA.debugLine="Sub btncancelreturn_Click";
 //BA.debugLineNum = 391;BA.debugLine="pnlreturn.Visible = False";
[self._pnlreturn setVisible:[self.__c False]];
 //BA.debugLineNum = 392;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 381;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 382;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 383;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnprint_click{
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 267;BA.debugLine="Sub btnprint_Click";
 //BA.debugLineNum = 269;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 270;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 272;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 273;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 274;BA.debugLine="op1.GetStore(Me,\"StoreDetails_receive\",\"0\")";
[_op1 _getstore:self :@"StoreDetails_receive" :@"0"];
 //BA.debugLineNum = 276;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnreturn_click{
 //BA.debugLineNum = 385;BA.debugLine="Sub btnreturn_Click";
 //BA.debugLineNum = 386;BA.debugLine="txtcomment.Text = \"\"";
[self._txtcomment setText:@""];
 //BA.debugLineNum = 387;BA.debugLine="pnlreturn.Visible = True";
[self._pnlreturn setVisible:[self.__c True]];
 //BA.debugLineNum = 388;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnreturn_product_click{
B4IButtonWrapper* _temp = nil;
B4IMap* _product = nil;
b4i_opencart* _opreturn = nil;
 //BA.debugLineNum = 394;BA.debugLine="Sub btnreturn_product_Click";
 //BA.debugLineNum = 396;BA.debugLine="Dim temp As Button";
_temp = [B4IButtonWrapper new];
 //BA.debugLineNum = 397;BA.debugLine="temp = Sender";
_temp.object = (UIButton*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 399;BA.debugLine="Dim product As Map";
_product = [B4IMap new];
 //BA.debugLineNum = 400;BA.debugLine="product = temp.Tag";
_product = (B4IMap*)([_temp Tag]);
 //BA.debugLineNum = 402;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 403;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 405;BA.debugLine="If rbyes.Value = True Then";
if ([self._rbyes Value]==[self.__c True]) { 
 //BA.debugLineNum = 406;BA.debugLine="user_details.Put(\"opened\",\"1\")";
[self._user_details Put:(NSObject*)(@"opened") :(NSObject*)(@"1")];
 }else {
 //BA.debugLineNum = 408;BA.debugLine="user_details.Put(\"opened\",\"0\")";
[self._user_details Put:(NSObject*)(@"opened") :(NSObject*)(@"0")];
 };
 //BA.debugLineNum = 411;BA.debugLine="user_details.Put(\"return_reason_id\",reason_id.Get";
[self._user_details Put:(NSObject*)(@"return_reason_id") :[self._reason_id Get:[self._spreason GetSelectedRow:(int) (0)]]];
 //BA.debugLineNum = 412;BA.debugLine="user_details.Put(\"comment\",txtcomment.Text)";
[self._user_details Put:(NSObject*)(@"comment") :(NSObject*)([self._txtcomment Text])];
 //BA.debugLineNum = 413;BA.debugLine="user_details.Put(\"product\",product.Get(\"name\"))";
[self._user_details Put:(NSObject*)(@"product") :[_product Get:(NSObject*)(@"name")]];
 //BA.debugLineNum = 414;BA.debugLine="user_details.Put(\"model\",product.Get(\"model\"))";
[self._user_details Put:(NSObject*)(@"model") :[_product Get:(NSObject*)(@"model")]];
 //BA.debugLineNum = 415;BA.debugLine="user_details.Put(\"quantity\",product.Get(\"quantity";
[self._user_details Put:(NSObject*)(@"quantity") :[_product Get:(NSObject*)(@"quantity")]];
 //BA.debugLineNum = 417;BA.debugLine="Dim opReturn As OpenCart";
_opreturn = [b4i_opencart new];
 //BA.debugLineNum = 418;BA.debugLine="opReturn.Initialize";
[_opreturn _initialize:self.bi];
 //BA.debugLineNum = 419;BA.debugLine="opReturn.RequestReturn(Me,\"return_receive\",user_d";
[_opreturn _requestreturn:self :@"return_receive" :self._user_details];
 //BA.debugLineNum = 421;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getreturnreason2spinner{
B4IList* _ls = nil;
B4IList* _ls2 = nil;
NSString* _temp = @"";
int _i = 0;
B4IMap* _m2 = nil;
 //BA.debugLineNum = 245;BA.debugLine="Sub GetReturnReason2Spinner";
 //BA.debugLineNum = 247;BA.debugLine="Dim ls,ls2 As List";
_ls = [B4IList new];
_ls2 = [B4IList new];
 //BA.debugLineNum = 248;BA.debugLine="Dim temp As String";
_temp = @"";
 //BA.debugLineNum = 249;BA.debugLine="temp = File.ReadString(CacheData.DirCache,\"return";
_temp = [[self.__c File] ReadString:self._cachedata._dircache :@"return_reasons"];
 //BA.debugLineNum = 250;BA.debugLine="ls = Library.String2List(temp)";
_ls = [self._library _string2list:_temp];
 //BA.debugLineNum = 252;BA.debugLine="ls2.Initialize";
[_ls2 Initialize];
 //BA.debugLineNum = 254;BA.debugLine="If ls.IsInitialized Then";
if ([_ls IsInitialized]) { 
 //BA.debugLineNum = 255;BA.debugLine="For i = 0 To ls.Size - 1";
{
const int step7 = 1;
const int limit7 = (int) ([_ls Size]-1);
_i = (int) (0) ;
for (;(step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7) ;_i = ((int)(0 + _i + step7))  ) {
 //BA.debugLineNum = 256;BA.debugLine="Dim m2 As Map";
_m2 = [B4IMap new];
 //BA.debugLineNum = 257;BA.debugLine="m2 = ls.Get(i)";
_m2 = (B4IMap*)([_ls Get:_i]);
 //BA.debugLineNum = 258;BA.debugLine="ls2.Add(m2.Get(\"name\"))";
[_ls2 Add:[_m2 Get:(NSObject*)(@"name")]];
 //BA.debugLineNum = 259;BA.debugLine="reason_id.Add(m2.Get(\"return_reason_id\"))";
[self._reason_id Add:[_m2 Get:(NSObject*)(@"return_reason_id")]];
 }
};
 };
 //BA.debugLineNum = 263;BA.debugLine="spreason.SetItems(0,ls2)";
[self._spreason SetItems:(int) (0) :_ls2];
 //BA.debugLineNum = 265;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _jobdone:(b4i_httpjob*) _job{
NSString* _filename = @"";
B4IOutputStream* _ou = nil;
 //BA.debugLineNum = 347;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 349;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 351;BA.debugLine="If Job.Success = False Then";
if (_job._success==[self.__c False]) { 
 //BA.debugLineNum = 352;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 355;BA.debugLine="Try";
@try { //BA.debugLineNum = 357;BA.debugLine="Dim filename As String";
_filename = @"";
 //BA.debugLineNum = 358;BA.debugLine="filename = $\"order_${details.Get(\"order_id\")}.pd";
_filename = ([@[@"order_",[self.__c SmartStringFormatter:@"" :[self._details Get:(NSObject*)(@"order_id")]],@".pdf"] componentsJoinedByString:@""]);
 //BA.debugLineNum = 360;BA.debugLine="File.Delete(File.DirDocuments,filename)";
[[self.__c File] Delete:[[self.__c File] DirDocuments] :_filename];
 //BA.debugLineNum = 361;BA.debugLine="Dim ou As OutputStream";
_ou = [B4IOutputStream new];
 //BA.debugLineNum = 362;BA.debugLine="ou = File.OpenOutput(File.DirDocuments,filename,";
_ou = [[self.__c File] OpenOutput:[[self.__c File] DirDocuments] :_filename :[self.__c False]];
 //BA.debugLineNum = 363;BA.debugLine="File.Copy2(Job.GetInputStream,ou)";
[[self.__c File] Copy2:[_job _getinputstream] :_ou];
 //BA.debugLineNum = 364;BA.debugLine="ou.Close";
[_ou Close];
 //BA.debugLineNum = 366;BA.debugLine="di.Initialize(\"\",File.DirDocuments,filename)";
[self._di Initialize:self.bi :@"" :[[self.__c File] DirDocuments] :_filename];
 //BA.debugLineNum = 367;BA.debugLine="di.OpenFile(pg.RootPanel)";
[self._di OpenFile:(NSObject*)(([self._pg RootPanel]).object)];
 } 
       @catch (NSException* e16) {
			[B4I SetException:e16]; };
 //BA.debugLineNum = 372;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loadattribute:(B4IList*) _attr{
B4ILabelWrapper* _lblheader = nil;
int _i = 0;
B4IMap* _temp = nil;
B4ILabelWrapper* _lblkey = nil;
NSString* _date = @"";
B4ILabelWrapper* _lblval = nil;
 //BA.debugLineNum = 185;BA.debugLine="Sub LoadAttribute(attr As List)";
 //BA.debugLineNum = 187;BA.debugLine="If attr.IsInitialized = False Then Return";
if ([_attr IsInitialized]==[self.__c False]) { 
if (true) return @"";};
 //BA.debugLineNum = 188;BA.debugLine="If attr.Size = 0 Then Return";
if ([_attr Size]==0) { 
if (true) return @"";};
 //BA.debugLineNum = 190;BA.debugLine="Dim lblHeader As Label";
_lblheader = [B4ILabelWrapper new];
 //BA.debugLineNum = 191;BA.debugLine="lblHeader.Initialize(\"\")";
[_lblheader Initialize:self.bi :@""];
 //BA.debugLineNum = 192;BA.debugLine="lblHeader.Color = Library.Theme_Background";
[_lblheader setColor:self._library._theme_background];
 //BA.debugLineNum = 193;BA.debugLine="lblHeader.Font = Library.GetFont(14)";
[_lblheader setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 194;BA.debugLine="lblHeader.TextColor = Colors.Gray";
[_lblheader setTextColor:[[self.__c Colors] Gray]];
 //BA.debugLineNum = 195;BA.debugLine="lblHeader.Text = Library.GetStringResourse(\"attri";
[_lblheader setText:[self._library _getstringresourse:@"attribute"]];
 //BA.debugLineNum = 196;BA.debugLine="lblHeader.TextAlignment = Library.GetStringResour";
[_lblheader setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 197;BA.debugLine="Library.PaddingLabel(lblHeader,10,0,10,0)";
[self._library _paddinglabel:_lblheader :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 198;BA.debugLine="sv1.Panel.AddView(lblHeader,sv1.Left,top,sv1.Widt";
[[self._sv1 Panel] AddView:(UIView*)((_lblheader).object) :[self._sv1 Left] :(float) (self._top) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 199;BA.debugLine="top = top + 40dip";
self._top = (int) (self._top+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 200;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 40dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 202;BA.debugLine="For i = 0 To attr.Size - 1";
{
const int step14 = 1;
const int limit14 = (int) ([_attr Size]-1);
_i = (int) (0) ;
for (;(step14 > 0 && _i <= limit14) || (step14 < 0 && _i >= limit14) ;_i = ((int)(0 + _i + step14))  ) {
 //BA.debugLineNum = 204;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 205;BA.debugLine="temp = attr.Get(i)";
_temp = (B4IMap*)([_attr Get:_i]);
 //BA.debugLineNum = 207;BA.debugLine="Dim lblKey As Label";
_lblkey = [B4ILabelWrapper new];
 //BA.debugLineNum = 208;BA.debugLine="lblKey.Initialize(\"\")";
[_lblkey Initialize:self.bi :@""];
 //BA.debugLineNum = 209;BA.debugLine="lblKey.Color = Library.Theme_Header";
[_lblkey setColor:self._library._theme_header];
 //BA.debugLineNum = 210;BA.debugLine="lblKey.Font = Library.GetFont(14)";
[_lblkey setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 211;BA.debugLine="lblKey.TextColor = Colors.White";
[_lblkey setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 213;BA.debugLine="Dim date As String";
_date = @"";
 //BA.debugLineNum = 214;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 215;BA.debugLine="date = Library.GetDate(temp.Get(\"date_added\"))";
_date = [self._library _getdate:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"date_added")]]];
 }else {
 //BA.debugLineNum = 217;BA.debugLine="date = temp.Get(\"date_added\")";
_date = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"date_added")]];
 };
 //BA.debugLineNum = 220;BA.debugLine="lblKey.Text = temp.Get(\"status\") & \" => \" & date";
[_lblkey setText:[@[[self.bi ObjectToString:[_temp Get:(NSObject*)(@"status")]],@" => ",_date] componentsJoinedByString:@""]];
 //BA.debugLineNum = 221;BA.debugLine="lblKey.TextAlignment = Library.GetStringResourse";
[_lblkey setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 222;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
[self._library _paddinglabel:_lblkey :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 224;BA.debugLine="sv1.Panel.AddView(lblKey,0,top,sv1.Width,40dip)";
[[self._sv1 Panel] AddView:(UIView*)((_lblkey).object) :(float) (0) :(float) (self._top) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 225;BA.debugLine="top = top + 40dip";
self._top = (int) (self._top+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 226;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 40dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 228;BA.debugLine="Dim lblVal As Label";
_lblval = [B4ILabelWrapper new];
 //BA.debugLineNum = 229;BA.debugLine="lblVal.Initialize(\"\")";
[_lblval Initialize:self.bi :@""];
 //BA.debugLineNum = 230;BA.debugLine="lblVal.Color = Colors.White";
[_lblval setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 231;BA.debugLine="lblVal.Font = Library.GetFont(12)";
[_lblval setFont:[self._library _getfont:(int) (12)]];
 //BA.debugLineNum = 232;BA.debugLine="lblVal.TextColor = Colors.Black";
[_lblval setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 233;BA.debugLine="lblVal.Text = temp.Get(\"comment\")";
[_lblval setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"comment")]]];
 //BA.debugLineNum = 234;BA.debugLine="lblVal.TextAlignment = Library.GetStringResourse";
[_lblval setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 235;BA.debugLine="Library.PaddingLabel(lblVal,10,0,10,0)";
[self._library _paddinglabel:_lblval :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 //BA.debugLineNum = 237;BA.debugLine="sv1.Panel.AddView(lblVal,sv1.Left,top,sv1.Width,";
[[self._sv1 Panel] AddView:(UIView*)((_lblval).object) :[self._sv1 Left] :(float) (self._top) :[self._sv1 Width] :(float) ([self.__c DipToCurrent:(int) (90)])];
 //BA.debugLineNum = 238;BA.debugLine="top = top + 90dip";
self._top = (int) (self._top+[self.__c DipToCurrent:(int) (90)]);
 //BA.debugLineNum = 239;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 90dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (90)])];
 }
};
 //BA.debugLineNum = 243;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _print{
B4IList* _l = nil;
B4IJSONGenerator* _js = nil;
B4IList* _products = nil;
int _i = 0;
B4IMap* _pr = nil;
B4IMap* _data = nil;
NSString* _addr = @"";
NSString* _vs = @"";
NSString* _tem = @"";
b4i_httpjob* _h = nil;
 //BA.debugLineNum = 278;BA.debugLine="Sub Print";
 //BA.debugLineNum = 280;BA.debugLine="Dim l As List";
_l = [B4IList new];
 //BA.debugLineNum = 281;BA.debugLine="l.Initialize";
[_l Initialize];
 //BA.debugLineNum = 283;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 285;BA.debugLine="Dim products As List";
_products = [B4IList new];
 //BA.debugLineNum = 286;BA.debugLine="products = details.Get(\"products\")";
_products.object = (NSArray*)([self._details Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 288;BA.debugLine="For i = 0 To products.Size - 1";
{
const int step6 = 1;
const int limit6 = (int) ([_products Size]-1);
_i = (int) (0) ;
for (;(step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6) ;_i = ((int)(0 + _i + step6))  ) {
 //BA.debugLineNum = 289;BA.debugLine="Dim pr As Map";
_pr = [B4IMap new];
 //BA.debugLineNum = 290;BA.debugLine="pr = products.Get(i)";
_pr = (B4IMap*)([_products Get:_i]);
 //BA.debugLineNum = 291;BA.debugLine="l.Add(CreateMap(\"title\":pr.Get(\"name\"),\"price\":p";
[_l Add:(NSObject*)([self.__c createMap:@[(NSObject*)(@"title"),[_pr Get:(NSObject*)(@"name")],(NSObject*)(@"price"),[_pr Get:(NSObject*)(@"price")],(NSObject*)(@"quantity"),[_pr Get:(NSObject*)(@"quantity")],(NSObject*)(@"total"),[_pr Get:(NSObject*)(@"total")]]])];
 }
};
 //BA.debugLineNum = 294;BA.debugLine="js.Initialize2(l)";
[_js Initialize2:_l];
 //BA.debugLineNum = 296;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 297;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 298;BA.debugLine="data.Put(\"invoice\",\"1\")";
[_data Put:(NSObject*)(@"invoice") :(NSObject*)(@"1")];
 //BA.debugLineNum = 299;BA.debugLine="data.Put(\"product\",l)";
[_data Put:(NSObject*)(@"product") :(NSObject*)((_l).object)];
 //BA.debugLineNum = 301;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 302;BA.debugLine="data.Put(\"date\",Library.GetDate(details.Get(\"dat";
[_data Put:(NSObject*)(@"date") :(NSObject*)([self._library _getdate:[self.bi ObjectToString:[self._details Get:(NSObject*)(@"date_added")]]])];
 }else {
 //BA.debugLineNum = 304;BA.debugLine="data.Put(\"date\",details.Get(\"date_added\"))";
[_data Put:(NSObject*)(@"date") :[self._details Get:(NSObject*)(@"date_added")]];
 };
 //BA.debugLineNum = 307;BA.debugLine="data.Put(\"id\",details.Get(\"order_id\"))";
[_data Put:(NSObject*)(@"id") :[self._details Get:(NSObject*)(@"order_id")]];
 //BA.debugLineNum = 308;BA.debugLine="data.Put(\"seller\",$\"${ShopInformation.Get(\"store_";
[_data Put:(NSObject*)(@"seller") :(NSObject*)(([@[@"",[self.__c SmartStringFormatter:@"" :[self._shopinformation Get:(NSObject*)(@"store_address")]],@" - ",[self.__c SmartStringFormatter:@"" :[self._shopinformation Get:(NSObject*)(@"store_name")]],@" - ",[self.__c SmartStringFormatter:@"" :[self._shopinformation Get:(NSObject*)(@"store_telephone")]],@")"] componentsJoinedByString:@""]))];
 //BA.debugLineNum = 309;BA.debugLine="data.Put(\"client_name\",details.Get(\"firstname\") &";
[_data Put:(NSObject*)(@"client_name") :(NSObject*)([@[[self.bi ObjectToString:[self._details Get:(NSObject*)(@"firstname")]],@" ",[self.bi ObjectToString:[self._details Get:(NSObject*)(@"lastname")]]] componentsJoinedByString:@""])];
 //BA.debugLineNum = 310;BA.debugLine="data.Put(\"client_phone\",details.Get(\"telephone\"))";
[_data Put:(NSObject*)(@"client_phone") :[self._details Get:(NSObject*)(@"telephone")]];
 //BA.debugLineNum = 311;BA.debugLine="data.Put(\"client_email\",details.Get(\"email\"))";
[_data Put:(NSObject*)(@"client_email") :[self._details Get:(NSObject*)(@"email")]];
 //BA.debugLineNum = 312;BA.debugLine="data.Put(\"client_site\",\"-\")";
[_data Put:(NSObject*)(@"client_site") :(NSObject*)(@"-")];
 //BA.debugLineNum = 314;BA.debugLine="Dim addr As String";
_addr = @"";
 //BA.debugLineNum = 315;BA.debugLine="addr = details.Get(\"shipping_address\")";
_addr = [self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_address")]];
 //BA.debugLineNum = 317;BA.debugLine="If addr.Length = 0 Then";
if ([_addr Length]==0) { 
 //BA.debugLineNum = 318;BA.debugLine="addr = details.Get(\"payment_address\")";
_addr = [self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_address")]];
 };
 //BA.debugLineNum = 321;BA.debugLine="data.Put(\"client_address\",addr)";
[_data Put:(NSObject*)(@"client_address") :(NSObject*)(_addr)];
 //BA.debugLineNum = 322;BA.debugLine="data.Put(\"client_comment\",details.Get(\"comment\"))";
[_data Put:(NSObject*)(@"client_comment") :[self._details Get:(NSObject*)(@"comment")]];
 //BA.debugLineNum = 323;BA.debugLine="data.Put(\"shop_site\",Library.GetStringResourse(\"u";
[_data Put:(NSObject*)(@"shop_site") :(NSObject*)([self._library _getstringresourse:@"url"])];
 //BA.debugLineNum = 324;BA.debugLine="data.Put(\"payment\",details.Get(\"payment_method\"))";
[_data Put:(NSObject*)(@"payment") :[self._details Get:(NSObject*)(@"payment_method")]];
 //BA.debugLineNum = 325;BA.debugLine="data.Put(\"ship\",details.Get(\"shipping_method\"))";
[_data Put:(NSObject*)(@"ship") :[self._details Get:(NSObject*)(@"shipping_method")]];
 //BA.debugLineNum = 327;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 328;BA.debugLine="data.Put(\"lang\",\"fa\")";
[_data Put:(NSObject*)(@"lang") :(NSObject*)(@"fa")];
 }else {
 //BA.debugLineNum = 330;BA.debugLine="data.Put(\"lang\",\"en\")";
[_data Put:(NSObject*)(@"lang") :(NSObject*)(@"en")];
 };
 //BA.debugLineNum = 333;BA.debugLine="For Each vs As String In data.Keys";
{
const id<B4IIterable> group42 = [_data Keys];
const int groupLen42 = group42.Size
;int index42 = 0;
;
for (; index42 < groupLen42;index42++){
_vs = [self.bi ObjectToString:[group42 Get:index42]];
 //BA.debugLineNum = 334;BA.debugLine="Dim tem As String";
_tem = @"";
 //BA.debugLineNum = 335;BA.debugLine="tem = data.Get(vs)";
_tem = [self.bi ObjectToString:[_data Get:(NSObject*)(_vs)]];
 //BA.debugLineNum = 336;BA.debugLine="If tem.Length = 0 Then data.Put(vs,\"-\")";
if ([_tem Length]==0) { 
[_data Put:(NSObject*)(_vs) :(NSObject*)(@"-")];};
 }
};
 //BA.debugLineNum = 339;BA.debugLine="js.Initialize(data)";
[_js Initialize:_data];
 //BA.debugLineNum = 341;BA.debugLine="Dim h As HttpJob";
_h = [b4i_httpjob new];
 //BA.debugLineNum = 342;BA.debugLine="h.Initialize(\"print\",Me)";
[_h _initialize:self.bi :@"print" :self];
 //BA.debugLineNum = 343;BA.debugLine="h.PostString(Library.GetStringResourse(\"url\") & \"";
[_h _poststring:[@[[self._library _getstringresourse:@"url"],@"/app/invoice/invoice.php"] componentsJoinedByString:@""] :[@[@"data=",[_js ToString]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 345;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 4;BA.debugLine="Private di As DocumentInteraction";
self._di = [B4IDocumentInteractionWrapper new];
 //BA.debugLineNum = 5;BA.debugLine="Private pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 6;BA.debugLine="Public details As Map";
self._details = [B4IMap new];
 //BA.debugLineNum = 7;BA.debugLine="Public user_details As Map";
self._user_details = [B4IMap new];
 //BA.debugLineNum = 8;BA.debugLine="Private ShopInformation As Map";
self._shopinformation = [B4IMap new];
 //BA.debugLineNum = 9;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 12;BA.debugLine="Private lblorder_payment_type_title As Label";
self._lblorder_payment_type_title = [B4ILabelWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private lblorderaddress1 As Label";
self._lblorderaddress1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private lblorderaddress2 As Label";
self._lblorderaddress2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private lblordercity1 As Label";
self._lblordercity1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private lblordercity2 As Label";
self._lblordercity2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private lblordercountry1 As Label";
self._lblordercountry1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private lblordercountry2 As Label";
self._lblordercountry2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private lblorderpayment_ship_type As Label";
self._lblorderpayment_ship_type = [B4ILabelWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Private lblorderpayment_type As Label";
self._lblorderpayment_type = [B4ILabelWrapper new];
 //BA.debugLineNum = 21;BA.debugLine="Private lblorderphone As Label";
self._lblorderphone = [B4ILabelWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private lblorderphone2 As Label";
self._lblorderphone2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private lblorderpostal1 As Label";
self._lblorderpostal1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 24;BA.debugLine="Private lblorderpostal2 As Label";
self._lblorderpostal2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private lblorderreceiver_name1 As Label";
self._lblorderreceiver_name1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 26;BA.debugLine="Private lblorderreceiver_name2 As Label";
self._lblorderreceiver_name2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 27;BA.debugLine="Private lblordership_type As Label";
self._lblordership_type = [B4ILabelWrapper new];
 //BA.debugLineNum = 28;BA.debugLine="Private lblordershop_name As Label";
self._lblordershop_name = [B4ILabelWrapper new];
 //BA.debugLineNum = 29;BA.debugLine="Private imgicon As ImageView";
self._imgicon = [B4IImageViewWrapper new];
 //BA.debugLineNum = 30;BA.debugLine="Private pnl_item_product As Panel";
self._pnl_item_product = [B4IPanelWrapper new];
 //BA.debugLineNum = 31;BA.debugLine="Private lblprice_quantity As Label";
self._lblprice_quantity = [B4ILabelWrapper new];
 //BA.debugLineNum = 32;BA.debugLine="Private lblname_product As Label";
self._lblname_product = [B4ILabelWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="Private lblproducts As Label";
self._lblproducts = [B4ILabelWrapper new];
 //BA.debugLineNum = 34;BA.debugLine="Private top As Int";
self._top = 0;
 //BA.debugLineNum = 35;BA.debugLine="Private btnreturn As Button";
self._btnreturn = [B4IButtonWrapper new];
 //BA.debugLineNum = 36;BA.debugLine="Private pnlreturn As Panel";
self._pnlreturn = [B4IPanelWrapper new];
 //BA.debugLineNum = 37;BA.debugLine="Private lblcomment As Label";
self._lblcomment = [B4ILabelWrapper new];
 //BA.debugLineNum = 38;BA.debugLine="Private lblopened As Label";
self._lblopened = [B4ILabelWrapper new];
 //BA.debugLineNum = 39;BA.debugLine="Private lblreason As Label";
self._lblreason = [B4ILabelWrapper new];
 //BA.debugLineNum = 40;BA.debugLine="Private rbyes As Switch";
self._rbyes = [B4ISwitchWrapper new];
 //BA.debugLineNum = 41;BA.debugLine="Private spreason As Picker";
self._spreason = [B4IPickerWrapper new];
 //BA.debugLineNum = 42;BA.debugLine="Private txtcomment As TextField";
self._txtcomment = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 43;BA.debugLine="Private btncancel As Button";
self._btncancel = [B4IButtonWrapper new];
 //BA.debugLineNum = 44;BA.debugLine="Private btncancelreturn As Button";
self._btncancelreturn = [B4IButtonWrapper new];
 //BA.debugLineNum = 45;BA.debugLine="Private btnreturn_product As Button";
self._btnreturn_product = [B4IButtonWrapper new];
 //BA.debugLineNum = 46;BA.debugLine="Private toast As MyToastMessageShow";
self._toast = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 47;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 48;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 49;BA.debugLine="Private reason_id As List";
self._reason_id = [B4IList new];
 //BA.debugLineNum = 50;BA.debugLine="Private btnprint As Button";
self._btnprint = [B4IButtonWrapper new];
 //BA.debugLineNum = 51;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 52;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _return_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 423;BA.debugLine="Sub return_receive(res As Map,cat As String)";
 //BA.debugLineNum = 425;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 427;BA.debugLine="If res.IsInitialized Then";
if ([_res IsInitialized]) { 
 //BA.debugLineNum = 428;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 429;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 430;BA.debugLine="pnlreturn.Visible = False";
[self._pnlreturn setVisible:[self.__c False]];
 //BA.debugLineNum = 431;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"return_success"] :(long long) (2) :[self.__c True]];
 };
 };
 };
 //BA.debugLineNum = 436;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IViewWrapper* _v1 = nil;
B4ILabelWrapper* _lb1 = nil;
B4IList* _l1 = nil;
int _i = 0;
B4IMap* _temp = nil;
B4IPanelWrapper* _p1 = nil;
NSString* _price = @"";
 //BA.debugLineNum = 54;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 57;BA.debugLine="pg.Initialize(\"\")";
[self._pg Initialize:self.bi :@""];
 //BA.debugLineNum = 59;BA.debugLine="pg.RootPanel.LoadLayout(\"frmorder_details_templat";
[[self._pg RootPanel] LoadLayout:@"frmorder_details_template" :self.bi];
 //BA.debugLineNum = 60;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 61;BA.debugLine="sv1.ContentWidth = Library.GetWidth";
[self._sv1 setContentWidth:[self._library _getwidth]];
 //BA.debugLineNum = 63;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 64;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 65;BA.debugLine="Library.SetFont(btnprint,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnprint).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 67;BA.debugLine="toast.Initialize(pg.RootPanel)";
[self._toast _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 68;BA.debugLine="reason_id.Initialize";
[self._reason_id Initialize];
 //BA.debugLineNum = 70;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 71;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"detail";
[self._lbltitle setText:[self._library _getstringresourse:@"details_user"]];
 //BA.debugLineNum = 73;BA.debugLine="sv1.Panel.Left = 5";
[[self._sv1 Panel] setLeft:(float) (5)];
 //BA.debugLineNum = 74;BA.debugLine="sv1.Panel.Width = sv1.Panel.Width - 10";
[[self._sv1 Panel] setWidth:(float) ([[self._sv1 Panel] Width]-10)];
 //BA.debugLineNum = 75;BA.debugLine="sv1.Panel.Top = 5";
[[self._sv1 Panel] setTop:(float) (5)];
 //BA.debugLineNum = 77;BA.debugLine="If Library.IsPersian = False Then";
if ([self._library _ispersian]==[self.__c False]) { 
 //BA.debugLineNum = 78;BA.debugLine="sv1.Panel.LoadLayout(\"frmorder_details_en\")";
[[self._sv1 Panel] LoadLayout:@"frmorder_details_en" :self.bi];
 }else {
 //BA.debugLineNum = 80;BA.debugLine="sv1.Panel.LoadLayout(\"frmorder_details\")";
[[self._sv1 Panel] LoadLayout:@"frmorder_details" :self.bi];
 };
 //BA.debugLineNum = 83;BA.debugLine="GetReturnReason2Spinner";
[self _getreturnreason2spinner];
 //BA.debugLineNum = 86;BA.debugLine="lblordershop_name.Text = \" \" & Library.GetStringR";
[self._lblordershop_name setText:[@[@" ",[[self._library _getstringresourse:@"lblordershop_name"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"store_name")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 87;BA.debugLine="lblordershop_name.TextAlignment = Library.GetStri";
[self._lblordershop_name setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 88;BA.debugLine="lblorderpayment_ship_type.Text = \" \" & Library.Ge";
[self._lblorderpayment_ship_type setText:[@[@" ",[self._library _getstringresourse:@"lblorder_payment_type_title"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 89;BA.debugLine="lblorderreceiver_name1.Text = \" \" & Library.GetSt";
[self._lblorderreceiver_name1 setText:[@[@" ",[[self._library _getstringresourse:@"lblorderreceiver_name"] Replace:@"0" :[@[[self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_firstname")]],@" ",[self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_lastname")]]] componentsJoinedByString:@""]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 90;BA.debugLine="lblordercountry1.Text = \" \" & Library.GetStringRe";
[self._lblordercountry1 setText:[@[@" ",[[self._library _getstringresourse:@"lblordercountry"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_country")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 91;BA.debugLine="lblordercity1.Text = \" \" & Library.GetStringResou";
[self._lblordercity1 setText:[@[@" ",[[self._library _getstringresourse:@"lblordercity"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_city")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 92;BA.debugLine="lblorderaddress1.Text = \" \" & Library.GetStringRe";
[self._lblorderaddress1 setText:[@[@" ",[[self._library _getstringresourse:@"lblorderaddress"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_address_1")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 93;BA.debugLine="lblorderpostal1.Text = \" \" & Library.GetStringRes";
[self._lblorderpostal1 setText:[@[@" ",[[self._library _getstringresourse:@"lblorderpostal"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_postcode")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 94;BA.debugLine="lblorderphone.Text = \" \" & Library.GetStringResou";
[self._lblorderphone setText:[@[@" ",[[self._library _getstringresourse:@"lblorderphone"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"telephone")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 95;BA.debugLine="lblorderpayment_type.Text = \" \" & details.Get(\"pa";
[self._lblorderpayment_type setText:[@[@" ",[self.bi ObjectToString:[self._details Get:(NSObject*)(@"payment_method")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 97;BA.debugLine="lblorder_payment_type_title.Text = \" \" & Library.";
[self._lblorder_payment_type_title setText:[@[@" ",[self._library _getstringresourse:@"lblordership_type_title"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 98;BA.debugLine="lblorderreceiver_name2.Text = \" \" & Library.GetSt";
[self._lblorderreceiver_name2 setText:[@[@" ",[[self._library _getstringresourse:@"lblorderreceiver_name"] Replace:@"0" :[@[[self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_firstname")]],@" ",[self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_lastname")]]] componentsJoinedByString:@""]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 99;BA.debugLine="lblordercountry2.Text = \" \" & Library.GetStringRe";
[self._lblordercountry2 setText:[@[@" ",[[self._library _getstringresourse:@"lblordercountry"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_country")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 100;BA.debugLine="lblordercity2.Text = \" \" & Library.GetStringResou";
[self._lblordercity2 setText:[@[@" ",[[self._library _getstringresourse:@"lblordercity"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_city")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 101;BA.debugLine="lblorderaddress2.Text = \" \" & Library.GetStringRe";
[self._lblorderaddress2 setText:[@[@" ",[[self._library _getstringresourse:@"lblorderaddress"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_address_1")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 102;BA.debugLine="lblorderpostal2.Text = \" \" & Library.GetStringRes";
[self._lblorderpostal2 setText:[@[@" ",[[self._library _getstringresourse:@"lblorderpostal"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_postcode")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 103;BA.debugLine="lblorderphone2.Text = \" \" & Library.GetStringReso";
[self._lblorderphone2 setText:[@[@" ",[[self._library _getstringresourse:@"lblorderphone"] Replace:@"0" :[self.bi ObjectToString:[self._details Get:(NSObject*)(@"telephone")]]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 104;BA.debugLine="lblordership_type.Text = \" \" & details.Get(\"shipp";
[self._lblordership_type setText:[@[@" ",[self.bi ObjectToString:[self._details Get:(NSObject*)(@"shipping_method")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 106;BA.debugLine="lblopened.Text =  \" \" & Library.GetStringResourse";
[self._lblopened setText:[@[@" ",[self._library _getstringresourse:@"return_opened"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 107;BA.debugLine="lblopened.TextAlignment  = Library.GetStringResou";
[self._lblopened setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 108;BA.debugLine="lblcomment.TextAlignment  = Library.GetStringReso";
[self._lblcomment setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 109;BA.debugLine="lblreason.TextAlignment  = Library.GetStringResou";
[self._lblreason setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 110;BA.debugLine="txtcomment.TextAlignment  = Library.GetStringReso";
[self._txtcomment setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 111;BA.debugLine="txtcomment.TextAlignment  = Library.GetStringReso";
[self._txtcomment setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 112;BA.debugLine="txtcomment.Color = Colors.ARGB(60,250,250,250)";
[self._txtcomment setColor:[[self.__c Colors] ARGB:(int) (60) :(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 114;BA.debugLine="lblcomment.Text =  \" \" & Library.GetStringResours";
[self._lblcomment setText:[@[@" ",[self._library _getstringresourse:@"return_comment"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 115;BA.debugLine="lblreason.Text =  \" \" & Library.GetStringResourse";
[self._lblreason setText:[@[@" ",[self._library _getstringresourse:@"return_reason"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 118;BA.debugLine="btnreturn_product.Text =  \" \" & Library.GetString";
[self._btnreturn_product setText:[@[@" ",[self._library _getstringresourse:@"return_button"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 119;BA.debugLine="btncancelreturn.Text =  \" \" & Library.GetStringRe";
[self._btncancelreturn setText:[@[@" ",[self._library _getstringresourse:@"cancel"]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 120;BA.debugLine="Library.GetButtonState(btnreturn_product)";
[self._library _getbuttonstate:self._btnreturn_product];
 //BA.debugLineNum = 121;BA.debugLine="Library.GetButtonState(btncancelreturn)";
[self._library _getbuttonstate:self._btncancelreturn];
 //BA.debugLineNum = 124;BA.debugLine="sv1.Panel.Height = lblproducts.Height + lblproduc";
[[self._sv1 Panel] setHeight:(float) ([self._lblproducts Height]+[self._lblproducts Top])];
 //BA.debugLineNum = 126;BA.debugLine="For Each v1 As View In sv1.Panel.GetAllViewsRecur";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group53 = [[self._sv1 Panel] GetAllViewsRecursive];
const int groupLen53 = group53.Size
;int index53 = 0;
;
for (; index53 < groupLen53;index53++){
_v1.object = (UIView*)([group53 Get:index53]);
 //BA.debugLineNum = 127;BA.debugLine="If v1 Is Label Then";
if ([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 128;BA.debugLine="Dim lb1 As Label";
_lb1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 129;BA.debugLine="lb1 = v1";
_lb1.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 130;BA.debugLine="Library.PaddingLabel(lb1,10,0,10,0)";
[self._library _paddinglabel:_lb1 :(int) (10) :(int) (0) :(int) (10) :(int) (0)];
 };
 }
};
 //BA.debugLineNum = 134;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 136;BA.debugLine="l1.Initialize";
[_l1 Initialize];
 //BA.debugLineNum = 137;BA.debugLine="top = sv1.Panel.Height + 10";
self._top = (int) ([[self._sv1 Panel] Height]+10);
 //BA.debugLineNum = 138;BA.debugLine="l1 = details.Get(\"products\")";
_l1.object = (NSArray*)([self._details Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 140;BA.debugLine="For i = 0 To l1.Size - 1";
{
const int step64 = 1;
const int limit64 = (int) ([_l1 Size]-1);
_i = (int) (0) ;
for (;(step64 > 0 && _i <= limit64) || (step64 < 0 && _i >= limit64) ;_i = ((int)(0 + _i + step64))  ) {
 //BA.debugLineNum = 142;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 143;BA.debugLine="temp = l1.Get(i)";
_temp = (B4IMap*)([_l1 Get:_i]);
 //BA.debugLineNum = 145;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 146;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 147;BA.debugLine="sv1.Panel.AddView(p1,0,top,sv1.Width,0)";
[[self._sv1 Panel] AddView:(UIView*)((_p1).object) :(float) (0) :(float) (self._top) :[self._sv1 Width] :(float) (0)];
 //BA.debugLineNum = 149;BA.debugLine="p1.LoadLayout(\"frmsimple_product\")";
[_p1 LoadLayout:@"frmsimple_product" :self.bi];
 //BA.debugLineNum = 151;BA.debugLine="p1.Height = pnl_item_product.Height";
[_p1 setHeight:[self._pnl_item_product Height]];
 //BA.debugLineNum = 153;BA.debugLine="top = top + p1.Height + 5dip";
self._top = (int) (self._top+[_p1 Height]+[self.__c DipToCurrent:(int) (5)]);
 //BA.debugLineNum = 155;BA.debugLine="lblname_product.Text = temp.Get(\"name\")";
[self._lblname_product setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]];
 //BA.debugLineNum = 156;BA.debugLine="Dim price As String";
_price = @"";
 //BA.debugLineNum = 157;BA.debugLine="price = temp.Get(\"price\")";
_price = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"price")]];
 //BA.debugLineNum = 159;BA.debugLine="lblname_product.TextAlignment = lblordershop_nam";
[self._lblname_product setTextAlignment:[self._lblordershop_name TextAlignment]];
 //BA.debugLineNum = 160;BA.debugLine="lblprice_quantity.TextAlignment = lblordershop_n";
[self._lblprice_quantity setTextAlignment:[self._lblordershop_name TextAlignment]];
 //BA.debugLineNum = 161;BA.debugLine="btnreturn_product.Tag = temp";
[self._btnreturn_product setTag:(NSObject*)(_temp)];
 //BA.debugLineNum = 162;BA.debugLine="Library.SetFont(btnreturn,\"icomoon\",btnreturn.Cu";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnreturn).object)] :@"icomoon" :(int) ([[[self._btnreturn CustomLabel] Font] Size])];
 //BA.debugLineNum = 164;BA.debugLine="lblname_product.Font = Library.GetFont(lblname_p";
[self._lblname_product setFont:[self._library _getfont:(int) ([[self._lblname_product Font] Size])]];
 //BA.debugLineNum = 165;BA.debugLine="lblprice_quantity.Font = Library.GetFont(lblpric";
[self._lblprice_quantity setFont:[self._library _getfont:(int) ([[self._lblprice_quantity Font] Size])]];
 //BA.debugLineNum = 167;BA.debugLine="lblprice_quantity.Text = price & \" [\" & temp.Get";
[self._lblprice_quantity setText:[@[_price,@" [",[self.bi ObjectToString:[_temp Get:(NSObject*)(@"quantity")]],@"]"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 169;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[_p1 Height])];
 }
};
 //BA.debugLineNum = 173;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[_p1 Height])];
 //BA.debugLineNum = 175;BA.debugLine="lblproducts.Text = Library.GetStringResourse(\"bas";
[self._lblproducts setText:[@[[self._library _getstringresourse:@"basket_total"],@" ",[self.bi ObjectToString:[self._details Get:(NSObject*)(@"total")]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 177;BA.debugLine="If details.ContainsKey(\"histories\") Then";
if ([self._details ContainsKey:(NSObject*)(@"histories")]) { 
 //BA.debugLineNum = 178;BA.debugLine="LoadAttribute(details.Get(\"histories\"))";
[self _loadattribute:(B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([self._details Get:(NSObject*)(@"histories")])]];
 };
 //BA.debugLineNum = 181;BA.debugLine="sv1.ContentHeight = top+30dip";
[self._sv1 setContentHeight:(int) (self._top+[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 183;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _storedetails_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 374;BA.debugLine="Sub StoreDetails_receive(res As Map,cat As String)";
 //BA.debugLineNum = 376;BA.debugLine="ShopInformation = res.Get(\"data\")";
self._shopinformation = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 377;BA.debugLine="Print";
[self _print];
 //BA.debugLineNum = 379;BA.debugLine="End Sub";
return @"";
}
@end
