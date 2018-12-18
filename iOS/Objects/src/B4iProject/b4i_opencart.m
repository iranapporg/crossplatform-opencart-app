
#import "b4i_opencart.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
#import "b4i_actsearch.h"
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


@implementation b4i_opencart 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_opencart) instance released.");
}
- (NSString*)  _add2cart:(NSObject*) _module :(NSString*) _event :(NSString*) _sid :(NSString*) _scount :(B4IMap*) _soptions{
B4IMap* _sproduct = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1555;BA.debugLine="Public Sub Add2Cart(Module As Object,Event As Stri";
 //BA.debugLineNum = 1557;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1558;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1559;BA.debugLine="currentCategory = \"cart\"";
self._currentcategory = @"cart";
 //BA.debugLineNum = 1561;BA.debugLine="Dim sProduct As Map";
_sproduct = [B4IMap new];
 //BA.debugLineNum = 1562;BA.debugLine="sProduct.Initialize";
[_sproduct Initialize];
 //BA.debugLineNum = 1563;BA.debugLine="sProduct.Put(\"product_id\",sID)";
[_sproduct Put:(NSObject*)(@"product_id") :(NSObject*)(_sid)];
 //BA.debugLineNum = 1564;BA.debugLine="sProduct.Put(\"quantity\",sCount)";
[_sproduct Put:(NSObject*)(@"quantity") :(NSObject*)(_scount)];
 //BA.debugLineNum = 1565;BA.debugLine="sProduct.Put(\"option\",sOptions)";
[_sproduct Put:(NSObject*)(@"option") :(NSObject*)(_soptions)];
 //BA.debugLineNum = 1567;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1568;BA.debugLine="js.Initialize(sProduct)";
[_js Initialize:_sproduct];
 //BA.debugLineNum = 1569;BA.debugLine="Log(js.ToString)";
[self.__c Log:[_js ToString]];
 //BA.debugLineNum = 1570;BA.debugLine="hu.Initialize(\"add2cart\",Me)";
[self._hu _initialize:self.bi :@"add2cart" :self];
 //BA.debugLineNum = 1571;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1573;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1574;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1576;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1578;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addaddress:(NSObject*) _module :(NSString*) _event :(B4IMap*) _sdata :(BOOL) _ispayment{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1261;BA.debugLine="Public Sub AddAddress(Module As Object,Event As St";
 //BA.debugLineNum = 1263;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1264;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1266;BA.debugLine="If IsPayment Then";
if (_ispayment) { 
 //BA.debugLineNum = 1267;BA.debugLine="currentCategory = \"paymentaddress\"";
self._currentcategory = @"paymentaddress";
 }else {
 //BA.debugLineNum = 1269;BA.debugLine="currentCategory = \"shippingaddress\"";
self._currentcategory = @"shippingaddress";
 };
 //BA.debugLineNum = 1272;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1273;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1275;BA.debugLine="hu.Initialize(\"addaddress\",Me)";
[self._hu _initialize:self.bi :@"addaddress" :self];
 //BA.debugLineNum = 1276;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1278;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1279;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1281;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1282;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1283;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1285;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addaddressuser:(NSObject*) _module :(NSString*) _event :(B4IMap*) _sdata{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1888;BA.debugLine="Public Sub AddAddressUser(Module As Object,Event A";
 //BA.debugLineNum = 1890;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1891;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1892;BA.debugLine="currentCategory = \"account/address\"";
self._currentcategory = @"account/address";
 //BA.debugLineNum = 1894;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1895;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1897;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1898;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1900;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1901;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1902;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1903;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1905;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addcoupon:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1404;BA.debugLine="Public Sub AddCoupon(Module As Object,Event As Str";
 //BA.debugLineNum = 1406;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1407;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1408;BA.debugLine="currentCategory = \"coupon\"";
self._currentcategory = @"coupon";
 //BA.debugLineNum = 1410;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1411;BA.debugLine="js.Initialize(CreateMap(\"coupon\" : sID))";
[_js Initialize:[self.__c createMap:@[(NSObject*)(@"coupon"),(NSObject*)(_sid)]]];
 //BA.debugLineNum = 1413;BA.debugLine="hu.Initialize(\"coupon\",Me)";
[self._hu _initialize:self.bi :@"coupon" :self];
 //BA.debugLineNum = 1414;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1416;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1417;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1419;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1420;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1421;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1423;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addreviewproduct:(NSObject*) _module :(NSString*) _event :(NSString*) _sid :(NSString*) _sname :(NSString*) _stext :(NSString*) _srating{
B4IMap* _sreview = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1044;BA.debugLine="Public Sub AddReviewProduct(Module As Object,Event";
 //BA.debugLineNum = 1046;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1047;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1048;BA.debugLine="currentCategory = $\"products/${sID}/review\"$";
self._currentcategory = ([@[@"products/",[self.__c SmartStringFormatter:@"" :(NSObject*)(_sid)],@"/review"] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1050;BA.debugLine="Dim sReview As Map";
_sreview = [B4IMap new];
 //BA.debugLineNum = 1051;BA.debugLine="sReview.Initialize";
[_sreview Initialize];
 //BA.debugLineNum = 1052;BA.debugLine="sReview.Put(\"name\",sName)";
[_sreview Put:(NSObject*)(@"name") :(NSObject*)(_sname)];
 //BA.debugLineNum = 1053;BA.debugLine="sReview.Put(\"text\",sText)";
[_sreview Put:(NSObject*)(@"text") :(NSObject*)(_stext)];
 //BA.debugLineNum = 1054;BA.debugLine="sReview.Put(\"rating\",sRating)";
[_sreview Put:(NSObject*)(@"rating") :(NSObject*)(_srating)];
 //BA.debugLineNum = 1056;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1057;BA.debugLine="js.Initialize(sReview)";
[_js Initialize:_sreview];
 //BA.debugLineNum = 1059;BA.debugLine="hu.Initialize(\"review\",Me)";
[self._hu _initialize:self.bi :@"review" :self];
 //BA.debugLineNum = 1060;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1062;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1063;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1065;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1067;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addreward:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1425;BA.debugLine="Public Sub AddReward(Module As Object,Event As Str";
 //BA.debugLineNum = 1427;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1428;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1429;BA.debugLine="currentCategory = \"reward\"";
self._currentcategory = @"reward";
 //BA.debugLineNum = 1431;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1432;BA.debugLine="js.Initialize(CreateMap(\"reward\" : sID))";
[_js Initialize:[self.__c createMap:@[(NSObject*)(@"reward"),(NSObject*)(_sid)]]];
 //BA.debugLineNum = 1434;BA.debugLine="hu.Initialize(\"reward\",Me)";
[self._hu _initialize:self.bi :@"reward" :self];
 //BA.debugLineNum = 1435;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1437;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1438;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1440;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1441;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1442;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1444;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addvoucher:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1446;BA.debugLine="Public Sub AddVoucher(Module As Object,Event As St";
 //BA.debugLineNum = 1448;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1449;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1450;BA.debugLine="currentCategory = \"voucher\"";
self._currentcategory = @"voucher";
 //BA.debugLineNum = 1452;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1453;BA.debugLine="js.Initialize(CreateMap(\"voucher\" : sID))";
[_js Initialize:[self.__c createMap:@[(NSObject*)(@"voucher"),(NSObject*)(_sid)]]];
 //BA.debugLineNum = 1455;BA.debugLine="hu.Initialize(\"voucher\",Me)";
[self._hu _initialize:self.bi :@"voucher" :self];
 //BA.debugLineNum = 1456;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1458;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1459;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1461;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1462;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1463;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1465;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _checksumlocal:(B4IList*) _data{
BOOL _blnchanged = false;
B4IList* _temp = nil;
int _i = 0;
B4IJSONParser* _js = nil;
B4IMap* _md = nil;
B4IMap* _md2 = nil;
NSString* _d1 = @"";
NSString* _d2 = @"";
NSString* _tbl = @"";
B4IList* _ls = nil;
int _o = 0;
NSString* _files = @"";
 //BA.debugLineNum = 47;BA.debugLine="Public Sub CheckSumLocal(Data As List)";
 //BA.debugLineNum = 49;BA.debugLine="Dim blnChanged As Boolean";
_blnchanged = false;
 //BA.debugLineNum = 51;BA.debugLine="If File.Exists(CacheData.DirCache,\"checksum\") = F";
if ([[self.__c File] Exists:self._cachedata._dircache :@"checksum"]==[self.__c False]) { 
 //BA.debugLineNum = 52;BA.debugLine="File.WriteList(CacheData.DirCache,\"checksum\",Dat";
[[self.__c File] WriteList:self._cachedata._dircache :@"checksum" :_data];
 }else {
 //BA.debugLineNum = 54;BA.debugLine="Dim temp As List";
_temp = [B4IList new];
 //BA.debugLineNum = 55;BA.debugLine="temp = File.ReadList(CacheData.DirCache,\"checksu";
_temp = [[self.__c File] ReadList:self._cachedata._dircache :@"checksum"];
 //BA.debugLineNum = 57;BA.debugLine="For i = 0 To temp.Size - 1";
{
const int step7 = 1;
const int limit7 = (int) ([_temp Size]-1);
_i = (int) (0) ;
for (;(step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7) ;_i = ((int)(0 + _i + step7))  ) {
 //BA.debugLineNum = 59;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 60;BA.debugLine="js.Initialize(temp.Get(i))";
[_js Initialize:[self.bi ObjectToString:[_temp Get:_i]]];
 //BA.debugLineNum = 62;BA.debugLine="Try";
@try { //BA.debugLineNum = 63;BA.debugLine="Dim md,md2 As Map";
_md = [B4IMap new];
_md2 = [B4IMap new];
 //BA.debugLineNum = 64;BA.debugLine="md = js.NextObject";
_md = [_js NextObject];
 //BA.debugLineNum = 65;BA.debugLine="md2 = Data.Get(i)";
_md2 = (B4IMap*)([_data Get:_i]);
 } 
       @catch (NSException* e15) {
			[B4I SetException:e15]; //BA.debugLineNum = 67;BA.debugLine="Continue";
if (true) continue;
 };
 //BA.debugLineNum = 70;BA.debugLine="Dim d1,d2 As String";
_d1 = @"";
_d2 = @"";
 //BA.debugLineNum = 71;BA.debugLine="d1 = md.Get(\"checksum\")";
_d1 = [self.bi ObjectToString:[_md Get:(NSObject*)(@"checksum")]];
 //BA.debugLineNum = 72;BA.debugLine="d2 = md2.Get(\"checksum\")";
_d2 = [self.bi ObjectToString:[_md2 Get:(NSObject*)(@"checksum")]];
 //BA.debugLineNum = 74;BA.debugLine="If d1 <> d2 Then";
if ([_d1 isEqual:_d2] == false) { 
 //BA.debugLineNum = 76;BA.debugLine="blnChanged = True";
_blnchanged = [self.__c True];
 //BA.debugLineNum = 78;BA.debugLine="Dim tbl As String";
_tbl = @"";
 //BA.debugLineNum = 79;BA.debugLine="tbl = md2.Get(\"table\")";
_tbl = [self.bi ObjectToString:[_md2 Get:(NSObject*)(@"table")]];
 //BA.debugLineNum = 81;BA.debugLine="If tbl.IndexOf(\"product_description\") > -1 The";
if ([_tbl IndexOf:@"product_description"]>-1) { 
 //BA.debugLineNum = 82;BA.debugLine="tbl = \"cache_string_files\"";
_tbl = @"cache_string_files";
 }else if([_tbl IndexOf:@"product_to_category"]>-1) { 
 //BA.debugLineNum = 84;BA.debugLine="tbl = \"cache_category_product2\"";
_tbl = @"cache_category_product2";
 }else if([_tbl IndexOf:@"category"]>-1) { 
 //BA.debugLineNum = 86;BA.debugLine="tbl = \"cache_category2\"";
_tbl = @"cache_category2";
 }else if([_tbl IndexOf:@"product"]>-1) { 
 //BA.debugLineNum = 88;BA.debugLine="tbl = \"cache_category_product2\"";
_tbl = @"cache_category_product2";
 };
 //BA.debugLineNum = 91;BA.debugLine="File.Delete(CacheData.DirCache,tbl)";
[[self.__c File] Delete:self._cachedata._dircache :_tbl];
 };
 }
};
 //BA.debugLineNum = 97;BA.debugLine="If blnChanged = True Then";
if (_blnchanged==[self.__c True]) { 
 //BA.debugLineNum = 99;BA.debugLine="Library.ShowNotification(Library.GetStringResou";
[self._library _shownotification:[self._library _getstringresourse:@"update_checksum"] :(int) (1)];
 //BA.debugLineNum = 100;BA.debugLine="File.WriteList(CacheData.DirCache,\"checksum\",Da";
[[self.__c File] WriteList:self._cachedata._dircache :@"checksum" :_data];
 //BA.debugLineNum = 102;BA.debugLine="Try";
@try { //BA.debugLineNum = 103;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 104;BA.debugLine="ls = File.ListFiles(File.DirLibrary)";
_ls = [[self.__c File] ListFiles:[[self.__c File] DirLibrary]];
 //BA.debugLineNum = 106;BA.debugLine="If ls.IsInitialized Then";
if ([_ls IsInitialized]) { 
 //BA.debugLineNum = 107;BA.debugLine="For o = 0 To ls.Size - 1";
{
const int step43 = 1;
const int limit43 = (int) ([_ls Size]-1);
_o = (int) (0) ;
for (;(step43 > 0 && _o <= limit43) || (step43 < 0 && _o >= limit43) ;_o = ((int)(0 + _o + step43))  ) {
 //BA.debugLineNum = 108;BA.debugLine="Dim files As String";
_files = @"";
 //BA.debugLineNum = 109;BA.debugLine="files = ls.Get(i)";
_files = [self.bi ObjectToString:[_ls Get:_i]];
 //BA.debugLineNum = 110;BA.debugLine="If files.StartsWith(\"timeout_ids_\") Then Fil";
if ([_files StartsWith:@"timeout_ids_"]) { 
[[self.__c File] Delete:[[self.__c File] DirLibrary] :_files];};
 }
};
 };
 } 
       @catch (NSException* e50) {
			[B4I SetException:e50]; //BA.debugLineNum = 115;BA.debugLine="Log(\"error in delete special timer file\")";
[self.__c Log:@"error in delete special timer file"];
 };
 };
 };
 //BA.debugLineNum = 122;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _checksumonline:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1961;BA.debugLine="Public Sub CheckSumOnline(Module As Object,Event A";
 //BA.debugLineNum = 1963;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1964;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1965;BA.debugLine="currentCategory = \"checksums\"";
self._currentcategory = @"checksums";
 //BA.debugLineNum = 1967;BA.debugLine="hu.Initialize(\"checksums\",Me)";
[self._hu _initialize:self.bi :@"checksums" :self];
 //BA.debugLineNum = 1968;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1970;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1971;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1972;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1974;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _class_globals{
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
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 2;BA.debugLine="Private Sub Class_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private hu As HttpJob";
self._hu = [b4i_httpjob new];
 //BA.debugLineNum = 4;BA.debugLine="Private su As StringUtils";
self._su = [iStringUtils new];
 //BA.debugLineNum = 5;BA.debugLine="Private my_url,api_url As String";
self._my_url = @"";
self._api_url = @"";
 //BA.debugLineNum = 6;BA.debugLine="Private EVT As String";
self._evt = @"";
 //BA.debugLineNum = 7;BA.debugLine="Private sModule As Object";
self._smodule = [NSObject new];
 //BA.debugLineNum = 8;BA.debugLine="Private currentCategory As String";
self._currentcategory = @"";
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _clearcart:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1719;BA.debugLine="Public Sub ClearCart(Module As Object,Event As Str";
 //BA.debugLineNum = 1721;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1722;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1723;BA.debugLine="currentCategory = \"cart/empty\"";
self._currentcategory = @"cart/empty";
 //BA.debugLineNum = 1725;BA.debugLine="hu.Initialize(\"clearcart\",Me)";
[self._hu _initialize:self.bi :@"clearcart" :self];
 //BA.debugLineNum = 1726;BA.debugLine="hu.PostString(api_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 1727;BA.debugLine="hu.GetRequest.InitializeDelete(api_url & currentC";
[[self._hu _getrequest] InitializeDelete:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1729;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1730;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1731;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1733;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _clearcartafterpayment:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1649;BA.debugLine="Public Sub ClearCartAfterPayment(Module As Object,";
 //BA.debugLineNum = 1651;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1652;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1653;BA.debugLine="currentCategory = \"confirm\"";
self._currentcategory = @"confirm";
 //BA.debugLineNum = 1655;BA.debugLine="hu.Initialize(\"clearcart_payment\",Me)";
[self._hu _initialize:self.bi :@"clearcart_payment" :self];
 //BA.debugLineNum = 1656;BA.debugLine="hu.PostString(api_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 1657;BA.debugLine="hu.GetRequest.InitializePut2(api_url & currentCat";
[[self._hu _getrequest] InitializePut2:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[@"" GetBytes:@"UTF8"]];
 //BA.debugLineNum = 1659;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1660;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1662;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1663;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1665;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _contactus:(NSObject*) _module :(NSString*) _event :(NSString*) _semail :(NSString*) _sname :(NSString*) _stext{
B4IMap* _sreview = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 806;BA.debugLine="Public Sub ContactUs(Module As Object,Event As Str";
 //BA.debugLineNum = 808;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 809;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 810;BA.debugLine="currentCategory = \"contact\"";
self._currentcategory = @"contact";
 //BA.debugLineNum = 812;BA.debugLine="Dim sReview As Map";
_sreview = [B4IMap new];
 //BA.debugLineNum = 813;BA.debugLine="sReview.Initialize";
[_sreview Initialize];
 //BA.debugLineNum = 814;BA.debugLine="sReview.Put(\"name\",sName)";
[_sreview Put:(NSObject*)(@"name") :(NSObject*)(_sname)];
 //BA.debugLineNum = 815;BA.debugLine="sReview.Put(\"email\",sEmail)";
[_sreview Put:(NSObject*)(@"email") :(NSObject*)(_semail)];
 //BA.debugLineNum = 816;BA.debugLine="sReview.Put(\"enquiry\",sText)";
[_sreview Put:(NSObject*)(@"enquiry") :(NSObject*)(_stext)];
 //BA.debugLineNum = 818;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 819;BA.debugLine="js.Initialize(sReview)";
[_js Initialize:_sreview];
 //BA.debugLineNum = 821;BA.debugLine="hu.Initialize(\"contact\",Me)";
[self._hu _initialize:self.bi :@"contact" :self];
 //BA.debugLineNum = 822;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 824;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 825;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 827;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 829;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _customsearchproduct:(NSObject*) _module :(NSString*) _event :(B4IMap*) _sfield :(int) _limit{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 962;BA.debugLine="Public Sub CustomSearchProduct(Module As Object,Ev";
 //BA.debugLineNum = 964;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 965;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 967;BA.debugLine="Dim su As StringUtils";
self._su = [iStringUtils new];
 //BA.debugLineNum = 968;BA.debugLine="currentCategory = \"products/custom_search/limit/\"";
self._currentcategory = [@[@"products/custom_search/limit/",[self.bi NumberToString:@(_limit)],@"/page/1"] componentsJoinedByString:@""];
 //BA.debugLineNum = 970;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 971;BA.debugLine="js.Initialize(sField)";
[_js Initialize:_sfield];
 //BA.debugLineNum = 973;BA.debugLine="hu.Initialize(\"product\",Me)";
[self._hu _initialize:self.bi :@"product" :self];
 //BA.debugLineNum = 974;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 976;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 977;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 979;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 980;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 981;BA.debugLine="hu.GetRequest.SetContentEncoding(\"utf-8\")";
[[self._hu _getrequest] SetContentEncoding:@"utf-8"];
 //BA.debugLineNum = 982;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 984;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _deleteaddressuser:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
B4IMap* _sproduct = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1863;BA.debugLine="Public Sub DeleteAddressUser(Module As Object,Even";
 //BA.debugLineNum = 1865;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1866;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1867;BA.debugLine="currentCategory = \"account/address/\" & sID";
self._currentcategory = [@[@"account/address/",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 1869;BA.debugLine="Dim sProduct As Map";
_sproduct = [B4IMap new];
 //BA.debugLineNum = 1870;BA.debugLine="sProduct.Initialize";
[_sproduct Initialize];
 //BA.debugLineNum = 1871;BA.debugLine="sProduct.Put(\"id\",sID)";
[_sproduct Put:(NSObject*)(@"id") :(NSObject*)(_sid)];
 //BA.debugLineNum = 1873;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1874;BA.debugLine="js.Initialize(sProduct)";
[_js Initialize:_sproduct];
 //BA.debugLineNum = 1876;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1877;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1878;BA.debugLine="hu.GetRequest.InitializeDelete(api_url & currentC";
[[self._hu _getrequest] InitializeDelete:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1880;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1881;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1883;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1884;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1886;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _deleteproductfromcart:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
B4IMap* _sproduct = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1667;BA.debugLine="Public Sub DeleteProductFromCart(Module As Object,";
 //BA.debugLineNum = 1669;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1670;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1671;BA.debugLine="currentCategory = \"cart\"";
self._currentcategory = @"cart";
 //BA.debugLineNum = 1673;BA.debugLine="Dim sProduct As Map";
_sproduct = [B4IMap new];
 //BA.debugLineNum = 1674;BA.debugLine="sProduct.Initialize";
[_sproduct Initialize];
 //BA.debugLineNum = 1675;BA.debugLine="sProduct.Put(\"key\",sID)";
[_sproduct Put:(NSObject*)(@"key") :(NSObject*)(_sid)];
 //BA.debugLineNum = 1677;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1678;BA.debugLine="js.Initialize(sProduct)";
[_js Initialize:_sproduct];
 //BA.debugLineNum = 1680;BA.debugLine="hu.Initialize(\"deletecartitem\",Me)";
[self._hu _initialize:self.bi :@"deletecartitem" :self];
 //BA.debugLineNum = 1681;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1682;BA.debugLine="hu.GetRequest.InitializeDelete(api_url & currentC";
[[self._hu _getrequest] InitializeDelete:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1684;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1685;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1687;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1688;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1690;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _editaddressuser:(NSObject*) _module :(NSString*) _event :(B4IMap*) _sdata :(NSString*) _sid{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1907;BA.debugLine="Public Sub EditAddressUser(Module As Object,Event";
 //BA.debugLineNum = 1909;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1910;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1911;BA.debugLine="currentCategory = \"account/address/\" & sID";
self._currentcategory = [@[@"account/address/",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 1913;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1914;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1916;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1917;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1918;BA.debugLine="hu.GetRequest.InitializePut2(api_url & currentCat";
[[self._hu _getrequest] InitializePut2:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[[_js ToString] GetBytes:@"UTF8"]];
 //BA.debugLineNum = 1920;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1921;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1922;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1923;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1924;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1925;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1927;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _forgotpassword:(NSObject*) _module :(NSString*) _event :(NSString*) _semail{
B4IMap* _data = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 831;BA.debugLine="Public Sub ForgotPassword(Module As Object,Event A";
 //BA.debugLineNum = 833;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 834;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 835;BA.debugLine="currentCategory = \"forgotten\"";
self._currentcategory = @"forgotten";
 //BA.debugLineNum = 837;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 838;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 839;BA.debugLine="data.Put(\"email\",sEmail)";
[_data Put:(NSObject*)(@"email") :(NSObject*)(_semail)];
 //BA.debugLineNum = 841;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 842;BA.debugLine="js.Initialize(data)";
[_js Initialize:_data];
 //BA.debugLineNum = 844;BA.debugLine="hu.Initialize(\"forgot\",Me)";
[self._hu _initialize:self.bi :@"forgot" :self];
 //BA.debugLineNum = 845;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 847;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 848;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 849;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 851;BA.debugLine="End Sub";
return @"";
}
- (int)  _getcartcount{
B4IList* _l1 = nil;
 //BA.debugLineNum = 1601;BA.debugLine="Public Sub GetCartCount As Int";
 //BA.debugLineNum = 1603;BA.debugLine="Try";
@try { //BA.debugLineNum = 1604;BA.debugLine="If Library.CartDetails = Null Then Return 0";
if (self._library._cartdetails== nil) { 
if (true) return (int) (0);};
 //BA.debugLineNum = 1605;BA.debugLine="If Library.CartDetails.IsInitialized = False The";
if ([self._library._cartdetails IsInitialized]==[self.__c False]) { 
if (true) return (int) (0);};
 //BA.debugLineNum = 1606;BA.debugLine="If Library.CartDetails.ContainsKey(\"products\") =";
if ([self._library._cartdetails ContainsKey:(NSObject*)(@"products")]==[self.__c False]) { 
if (true) return (int) (0);};
 //BA.debugLineNum = 1608;BA.debugLine="Try";
@try { //BA.debugLineNum = 1609;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 1610;BA.debugLine="l1 = Library.CartDetails.Get(\"products\")";
_l1.object = (NSArray*)([self._library._cartdetails Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 1611;BA.debugLine="Return l1.Size";
if (true) return [_l1 Size];
 } 
       @catch (NSException* e10) {
			[B4I SetException:e10]; //BA.debugLineNum = 1613;BA.debugLine="Return 0";
if (true) return (int) (0);
 };
 } 
       @catch (NSException* e13) {
			[B4I SetException:e13]; //BA.debugLineNum = 1616;BA.debugLine="Return 0";
if (true) return (int) (0);
 };
 //BA.debugLineNum = 1619;BA.debugLine="End Sub";
return 0;
}
- (NSString*)  _getcarts:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1580;BA.debugLine="Public Sub GetCarts(Module As Object,Event As Stri";
 //BA.debugLineNum = 1582;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1583;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1584;BA.debugLine="currentCategory = \"cart\"";
self._currentcategory = @"cart";
 //BA.debugLineNum = 1586;BA.debugLine="hu.Initialize(\"carts\",Me)";
[self._hu _initialize:self.bi :@"carts" :self];
 //BA.debugLineNum = 1588;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1590;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1592;BA.debugLine="If Library.token.IsInitialized Then";
if ([self._library._token IsInitialized]) { 
 //BA.debugLineNum = 1593;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Ge";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 };
 //BA.debugLineNum = 1596;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1597;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1599;BA.debugLine="End Sub";
return @"";
}
- (B4IMap*)  _getcarttotal:(B4IList*) _data{
B4IMap* _sdata = nil;
B4IMap* _tax = nil;
B4IMap* _afzodeh = nil;
B4IMap* _total = nil;
 //BA.debugLineNum = 1621;BA.debugLine="Public Sub GetCartTotal(Data As List) As Map";
 //BA.debugLineNum = 1623;BA.debugLine="Dim sdata,tax,afzodeh,total As Map";
_sdata = [B4IMap new];
_tax = [B4IMap new];
_afzodeh = [B4IMap new];
_total = [B4IMap new];
 //BA.debugLineNum = 1624;BA.debugLine="sdata.Initialize";
[_sdata Initialize];
 //BA.debugLineNum = 1625;BA.debugLine="tax.Initialize";
[_tax Initialize];
 //BA.debugLineNum = 1626;BA.debugLine="afzodeh.Initialize";
[_afzodeh Initialize];
 //BA.debugLineNum = 1628;BA.debugLine="afzodeh = Data.Get(1)";
_afzodeh = (B4IMap*)([_data Get:(int) (1)]);
 //BA.debugLineNum = 1630;BA.debugLine="If Data.Size > 2 Then";
if ([_data Size]>2) { 
 //BA.debugLineNum = 1631;BA.debugLine="tax		= Data.Get(2)";
_tax = (B4IMap*)([_data Get:(int) (2)]);
 //BA.debugLineNum = 1632;BA.debugLine="sdata.Put(\"tax\",tax.Get(\"text\"))";
[_sdata Put:(NSObject*)(@"tax") :[_tax Get:(NSObject*)(@"text")]];
 };
 //BA.debugLineNum = 1635;BA.debugLine="If Data.Size > 3 Then";
if ([_data Size]>3) { 
 //BA.debugLineNum = 1636;BA.debugLine="total	= Data.Get(3)";
_total = (B4IMap*)([_data Get:(int) (3)]);
 //BA.debugLineNum = 1637;BA.debugLine="sdata.Put(\"total\",total.Get(\"text\"))";
[_sdata Put:(NSObject*)(@"total") :[_total Get:(NSObject*)(@"text")]];
 }else {
 //BA.debugLineNum = 1639;BA.debugLine="total	= Data.Get(1)";
_total = (B4IMap*)([_data Get:(int) (1)]);
 //BA.debugLineNum = 1640;BA.debugLine="sdata.Put(\"total\",total.Get(\"text\"))";
[_sdata Put:(NSObject*)(@"total") :[_total Get:(NSObject*)(@"text")]];
 };
 //BA.debugLineNum = 1643;BA.debugLine="sdata.Put(\"afzodeh\",afzodeh.Get(\"text\"))";
[_sdata Put:(NSObject*)(@"afzodeh") :[_afzodeh Get:(NSObject*)(@"text")]];
 //BA.debugLineNum = 1645;BA.debugLine="Return sdata";
if (true) return _sdata;
 //BA.debugLineNum = 1647;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _getcategory:(NSObject*) _module :(NSString*) _event :(NSString*) _sparentid{
NSString* _auth = @"";
 //BA.debugLineNum = 898;BA.debugLine="Public Sub GetCategory(Module As Object,Event As S";
 //BA.debugLineNum = 900;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 901;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 903;BA.debugLine="If sParentID = \"\" Then";
if ([_sparentid isEqual:@""]) { 
 //BA.debugLineNum = 904;BA.debugLine="currentCategory = \"categories\"";
self._currentcategory = @"categories";
 }else {
 //BA.debugLineNum = 906;BA.debugLine="currentCategory = \"categories/parent/\" & sParent";
self._currentcategory = [@[@"categories/parent/",_sparentid] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 909;BA.debugLine="hu.Initialize(\"categories\",Me)";
[self._hu _initialize:self.bi :@"categories" :self];
 //BA.debugLineNum = 910;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 912;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 913;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 915;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 916;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 918;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getcategoryproducts:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 920;BA.debugLine="Public Sub GetCategoryProducts(Module As Object,Ev";
 //BA.debugLineNum = 922;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 923;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 925;BA.debugLine="If sID = \"0\" Then";
if ([_sid isEqual:@"0"]) { 
 //BA.debugLineNum = 926;BA.debugLine="currentCategory = \"products/category\"";
self._currentcategory = @"products/category";
 }else {
 //BA.debugLineNum = 928;BA.debugLine="currentCategory = \"products/category/\" & sID";
self._currentcategory = [@[@"products/category/",_sid] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 931;BA.debugLine="hu.Initialize(\"product\",Me)";
[self._hu _initialize:self.bi :@"product" :self];
 //BA.debugLineNum = 933;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 935;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 936;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 938;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 939;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 941;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getcity:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1071;BA.debugLine="Public Sub GetCity(Module As Object,Event As Strin";
 //BA.debugLineNum = 1073;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1074;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1075;BA.debugLine="currentCategory = \"countries/\" & sID";
self._currentcategory = [@[@"countries/",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 1077;BA.debugLine="hu.Initialize(\"city\",Me)";
[self._hu _initialize:self.bi :@"city" :self];
 //BA.debugLineNum = 1079;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1081;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1082;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1084;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1085;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1087;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getcountry:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1089;BA.debugLine="Public Sub GetCountry(Module As Object,Event As St";
 //BA.debugLineNum = 1091;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1092;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1093;BA.debugLine="currentCategory = \"countries\"";
self._currentcategory = @"countries";
 //BA.debugLineNum = 1095;BA.debugLine="hu.Initialize(\"country\",Me)";
[self._hu _initialize:self.bi :@"country" :self];
 //BA.debugLineNum = 1097;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1099;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1100;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1102;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1103;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1105;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getcurrenttoken{
NSString* _tok = @"";
 //BA.debugLineNum = 41;BA.debugLine="Public Sub GetCurrentToken As String";
 //BA.debugLineNum = 42;BA.debugLine="Dim tok As String";
_tok = @"";
 //BA.debugLineNum = 43;BA.debugLine="tok = Library.token.Get(\"access_token\")";
_tok = [self.bi ObjectToString:[self._library._token Get:(NSObject*)(@"access_token")]];
 //BA.debugLineNum = 44;BA.debugLine="Return tok";
if (true) return _tok;
 //BA.debugLineNum = 45;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getinformation:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1368;BA.debugLine="Public Sub GetInformation(Module As Object,Event A";
 //BA.debugLineNum = 1370;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1371;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1373;BA.debugLine="currentCategory = \"information\"";
self._currentcategory = @"information";
 //BA.debugLineNum = 1375;BA.debugLine="hu.Initialize(\"information\",Me)";
[self._hu _initialize:self.bi :@"information" :self];
 //BA.debugLineNum = 1376;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1378;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1379;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1380;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1381;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1383;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getinformationdetailsid:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1385;BA.debugLine="Public Sub GetInformationDetailsID(Module As Objec";
 //BA.debugLineNum = 1387;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1388;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1390;BA.debugLine="currentCategory = \"information/\" & sID";
self._currentcategory = [@[@"information/",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 1392;BA.debugLine="hu.Initialize(\"information\",Me)";
[self._hu _initialize:self.bi :@"information" :self];
 //BA.debugLineNum = 1393;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1395;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1396;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1397;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1398;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1400;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getlanguages:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1992;BA.debugLine="Public Sub GetLanguages(Module As Object,Event As";
 //BA.debugLineNum = 1994;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1995;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1996;BA.debugLine="currentCategory = \"languages\"";
self._currentcategory = @"languages";
 //BA.debugLineNum = 1998;BA.debugLine="hu.Initialize(\"languages\",Me)";
[self._hu _initialize:self.bi :@"languages" :self];
 //BA.debugLineNum = 1999;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 2001;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 2002;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 2004;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 2006;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getmanufactureproduct:(NSString*) _sid :(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 881;BA.debugLine="Public Sub GetmanufactureProduct(sID As String,Mod";
 //BA.debugLineNum = 883;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 884;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 885;BA.debugLine="currentCategory = \"/index.php?route=feed/rest_api";
self._currentcategory = [@[@"/index.php?route=feed/rest_api/products&manufacturer=",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 887;BA.debugLine="hu.Initialize(\"product\",Me)";
[self._hu _initialize:self.bi :@"product" :self];
 //BA.debugLineNum = 889;BA.debugLine="hu.Download(my_url & currentCategory)";
[self._hu _download:[@[self._my_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 891;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 892;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 893;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 894;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 896;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getmanufacturers:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1351;BA.debugLine="Public Sub GetManufacturers(Module As Object,Event";
 //BA.debugLineNum = 1353;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1354;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1356;BA.debugLine="currentCategory = \"manufacturers\"";
self._currentcategory = @"manufacturers";
 //BA.debugLineNum = 1358;BA.debugLine="hu.Initialize(\"manufacturers\",Me)";
[self._hu _initialize:self.bi :@"manufacturers" :self];
 //BA.debugLineNum = 1359;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1361;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1362;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1363;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1364;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1366;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getorders:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1287;BA.debugLine="Public Sub GetOrders(Module As Object,Event As Str";
 //BA.debugLineNum = 1289;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1290;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1292;BA.debugLine="If sID = \"\" Then";
if ([_sid isEqual:@""]) { 
 //BA.debugLineNum = 1293;BA.debugLine="currentCategory = \"customerorders\"";
self._currentcategory = @"customerorders";
 }else {
 //BA.debugLineNum = 1295;BA.debugLine="currentCategory = \"customerorders/\" & sID";
self._currentcategory = [@[@"customerorders/",_sid] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 1298;BA.debugLine="hu.Initialize(\"getothers\",Me)";
[self._hu _initialize:self.bi :@"getothers" :self];
 //BA.debugLineNum = 1299;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1301;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1302;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1303;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1304;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1306;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getpaymentmethods:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1164;BA.debugLine="Public Sub GetPaymentMethods(Module As Object,Even";
 //BA.debugLineNum = 1166;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1167;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1168;BA.debugLine="currentCategory = \"paymentmethods\"";
self._currentcategory = @"paymentmethods";
 //BA.debugLineNum = 1170;BA.debugLine="hu.Initialize(\"getpayments\",Me)";
[self._hu _initialize:self.bi :@"getpayments" :self];
 //BA.debugLineNum = 1171;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1173;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1174;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1175;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1176;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1178;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getproductclass:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1976;BA.debugLine="Public Sub GetProductClass(Module As Object,Event";
 //BA.debugLineNum = 1978;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1979;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1980;BA.debugLine="currentCategory = \"product_classes\"";
self._currentcategory = @"product_classes";
 //BA.debugLineNum = 1982;BA.debugLine="hu.Initialize(\"product_class\",Me)";
[self._hu _initialize:self.bi :@"product_class" :self];
 //BA.debugLineNum = 1983;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1985;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1986;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1987;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1988;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1990;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getreturns:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1308;BA.debugLine="Public Sub GetReturns(Module As Object,Event As St";
 //BA.debugLineNum = 1310;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1311;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1313;BA.debugLine="If sID = \"\" Then";
if ([_sid isEqual:@""]) { 
 //BA.debugLineNum = 1314;BA.debugLine="currentCategory = \"returns\"";
self._currentcategory = @"returns";
 }else {
 //BA.debugLineNum = 1316;BA.debugLine="currentCategory = \"returns/\" & sID";
self._currentcategory = [@[@"returns/",_sid] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 1319;BA.debugLine="hu.Initialize(\"getothers\",Me)";
[self._hu _initialize:self.bi :@"getothers" :self];
 //BA.debugLineNum = 1320;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1322;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1323;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1324;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1325;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1327;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getshipmethods:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1204;BA.debugLine="Public Sub GetShipMethods(Module As Object,Event A";
 //BA.debugLineNum = 1206;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1207;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1208;BA.debugLine="currentCategory = \"shippingmethods\"";
self._currentcategory = @"shippingmethods";
 //BA.debugLineNum = 1210;BA.debugLine="hu.Initialize(\"shippingmethods\",Me)";
[self._hu _initialize:self.bi :@"shippingmethods" :self];
 //BA.debugLineNum = 1211;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1213;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1214;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1215;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1216;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1218;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getslideshow:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 650;BA.debugLine="Public Sub GetSlideshow(Module As Object,Event As";
 //BA.debugLineNum = 652;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 653;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 654;BA.debugLine="currentCategory = \"slideshow\"";
self._currentcategory = @"slideshow";
 //BA.debugLineNum = 656;BA.debugLine="hu.Initialize(\"slideshow\",Me)";
[self._hu _initialize:self.bi :@"slideshow" :self];
 //BA.debugLineNum = 658;BA.debugLine="hu.Download(api_url & \"slideshows\")";
[self._hu _download:[@[self._api_url,@"slideshows"] componentsJoinedByString:@""]];
 //BA.debugLineNum = 660;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 661;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 663;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 664;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 666;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getspecialproduct:(NSString*) _category :(BOOL) _paging :(int) _limit :(NSObject*) _module :(NSString*) _event{
NSString* _link = @"";
NSString* _auth = @"";
 //BA.debugLineNum = 857;BA.debugLine="Public Sub GetSpecialProduct(Category As String,Pa";
 //BA.debugLineNum = 859;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 860;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 861;BA.debugLine="currentCategory = Category";
self._currentcategory = _category;
 //BA.debugLineNum = 863;BA.debugLine="hu.Initialize(\"product\",Me)";
[self._hu _initialize:self.bi :@"product" :self];
 //BA.debugLineNum = 865;BA.debugLine="Dim link As String";
_link = @"";
 //BA.debugLineNum = 866;BA.debugLine="link = $\"/${Category}/limit/${Limit}\"$";
_link = ([@[@"/",[self.__c SmartStringFormatter:@"" :(NSObject*)(_category)],@"/limit/",[self.__c SmartStringFormatter:@"" :(NSObject*)(@(_limit))],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 868;BA.debugLine="If Paging = True Then";
if (_paging==[self.__c True]) { 
 //BA.debugLineNum = 869;BA.debugLine="link = link & \"/page/1\"";
_link = [@[_link,@"/page/1"] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 872;BA.debugLine="hu.Download(api_url & link)";
[self._hu _download:[@[self._api_url,_link] componentsJoinedByString:@""]];
 //BA.debugLineNum = 874;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 875;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 876;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 877;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 879;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getstore:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1526;BA.debugLine="Public Sub GetStore(Module As Object,Event As Stri";
 //BA.debugLineNum = 1528;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1529;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1531;BA.debugLine="If sID = \"\" Then";
if ([_sid isEqual:@""]) { 
 //BA.debugLineNum = 1532;BA.debugLine="currentCategory = \"stores\"";
self._currentcategory = @"stores";
 }else {
 //BA.debugLineNum = 1534;BA.debugLine="currentCategory = \"stores/\" & sID";
self._currentcategory = [@[@"stores/",_sid] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 1537;BA.debugLine="hu.Initialize(\"store\",Me)";
[self._hu _initialize:self.bi :@"store" :self];
 //BA.debugLineNum = 1538;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1540;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1541;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1542;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1543;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1545;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _gettoken:(NSObject*) _module :(NSString*) _event{
NSString* _res = @"";
B4IByteConverter* _byte1 = nil;
 //BA.debugLineNum = 23;BA.debugLine="Public Sub GetToken(Module As Object,Event As Stri";
 //BA.debugLineNum = 25;BA.debugLine="Dim res As String";
_res = @"";
 //BA.debugLineNum = 26;BA.debugLine="Dim byte1 As ByteConverter";
_byte1 = [B4IByteConverter new];
 //BA.debugLineNum = 27;BA.debugLine="res = su.EncodeBase64(byte1.StringToBytes($\"${Lib";
_res = [self._su EncodeBase64:[_byte1 StringToBytes:([@[@"",[self.__c SmartStringFormatter:@"" :(NSObject*)([self._library _decrypt:[self._library _getstringresourse:@"client_id"]])],@":",[self.__c SmartStringFormatter:@"" :(NSObject*)([self._library _decrypt:[self._library _getstringresourse:@"client_secret"]])],@""] componentsJoinedByString:@""]) :@"UTF8"]];
 //BA.debugLineNum = 29;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 30;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 32;BA.debugLine="hu.Initialize(\"token\",Me)";
[self._hu _initialize:self.bi :@"token" :self];
 //BA.debugLineNum = 33;BA.debugLine="hu.PostString(my_url & \"/api/rest/oauth2/token/cl";
[self._hu _poststring:[@[self._my_url,@"/api/rest/oauth2/token/client_credentials"] componentsJoinedByString:@""] :@"grant_type=client_credentials"];
 //BA.debugLineNum = 34;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 35;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",\"Basic \"";
[[self._hu _getrequest] SetHeader:@"Authorization" :[@[@"Basic ",_res] componentsJoinedByString:@""]];
 //BA.debugLineNum = 36;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 37;BA.debugLine="setStoreID(hu.GetRequest)";
[self _setstoreid:[self._hu _getrequest]];
 //BA.debugLineNum = 39;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _geturl{
 //BA.debugLineNum = 1549;BA.debugLine="Public Sub GetURL As String";
 //BA.debugLineNum = 1550;BA.debugLine="Return my_url";
if (true) return self._my_url;
 //BA.debugLineNum = 1551;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba{
[self initializeClassModule];
 //BA.debugLineNum = 11;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 13;BA.debugLine="my_url	= Library.GetStringResourse(\"url\")";
self._my_url = [self._library _getstringresourse:@"url"];
 //BA.debugLineNum = 14;BA.debugLine="api_url = my_url & \"/api/rest/\"";
self._api_url = [@[self._my_url,@"/api/rest/"] componentsJoinedByString:@""];
 //BA.debugLineNum = 16;BA.debugLine="If Library.InternetState = False And CacheData.Ex";
if ([self._library _internetstate]==[self.__c False] && [self._cachedata _existcacheproducts]==[self.__c False]) { 
 //BA.debugLineNum = 17;BA.debugLine="actErrorInternet.module = Null'actMenu";
self._acterrorinternet._module = [self.__c Null];
 //BA.debugLineNum = 18;BA.debugLine="actErrorInternet.StartActivity";
[self._acterrorinternet _startactivity];
 };
 //BA.debugLineNum = 21;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _jobdone:(b4i_httpjob*) _job{
NSString* _rs = @"";
B4IJSONGenerator* _js1 = nil;
B4IJSONParser* _js = nil;
B4IMap* _res = nil;
B4IMap* _res1 = nil;
B4IList* _lslang = nil;
NSString* _val1 = @"";
B4IJSONGenerator* _jslang = nil;
B4IJSONGenerator* _jsg = nil;
NSString* _k1 = @"";
B4IMap* _m1 = nil;
B4IMap* _product = nil;
B4IList* _products = nil;
B4IMap* _temp2s = nil;
B4IList* _l1 = nil;
B4IList* _temp = nil;
B4IMap* _t1 = nil;
B4IMap* _ms = nil;
B4IMap* _temp1 = nil;
B4IList* _temp2 = nil;
B4IMap* _data1 = nil;
B4IMap* _data2 = nil;
B4IMap* _data3 = nil;
 //BA.debugLineNum = 124;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 126;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 128;BA.debugLine="Try";
@try { //BA.debugLineNum = 130;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 132;BA.debugLine="If Job.JobName = \"confirmorderpayment\" Then";
if ([_job._jobname isEqual:@"confirmorderpayment"]) { 
 //BA.debugLineNum = 133;BA.debugLine="CallSubDelayed2(sModule,EVT,Job.GetString)";
[self.__c CallSubDelayed2:self.bi :self._smodule :self._evt :(NSObject*)([_job _getstring])];
 //BA.debugLineNum = 134;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 137;BA.debugLine="Dim rs As String";
_rs = @"";
 //BA.debugLineNum = 138;BA.debugLine="rs = Job.GetString2(\"UTF8\")";
_rs = [_job _getstring2:@"UTF8"];
 //BA.debugLineNum = 140;BA.debugLine="If rs.StartsWith(\"<b>Warning\") Then";
if ([_rs StartsWith:@"<b>Warning"]) { 
 //BA.debugLineNum = 141;BA.debugLine="Dim js1 As JSONGenerator";
_js1 = [B4IJSONGenerator new];
 //BA.debugLineNum = 142;BA.debugLine="js1.Initialize(CreateMap(\"success\":True))";
[_js1 Initialize:[self.__c createMap:@[(NSObject*)(@"success"),(NSObject*)(@([self.__c True]))]]];
 //BA.debugLineNum = 143;BA.debugLine="rs = js1.ToString";
_rs = [_js1 ToString];
 };
 //BA.debugLineNum = 146;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 147;BA.debugLine="js.Initialize(rs)";
[_js Initialize:_rs];
 //BA.debugLineNum = 149;BA.debugLine="If Job.GetString2(\"UTF8\").IndexOf(\"Unauthorized";
if ([[_job _getstring2:@"UTF8"] IndexOf:@"Unauthorized"]>-1 && [[_job _getstring2:@"UTF8"] IndexOf:@"401"]>-1) { 
 //BA.debugLineNum = 150;BA.debugLine="If Library.InternetState = True Then";
if ([self._library _internetstate]==[self.__c True]) { 
 //BA.debugLineNum = 151;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStrin";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_title"] :[self.__c True]];
 //BA.debugLineNum = 152;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 156;BA.debugLine="If Job.GetString2(\"UTF8\").IndexOf(\"The client c";
if ([[_job _getstring2:@"UTF8"] IndexOf:@"The client credentials are invalid"]>-1) { 
 };
 //BA.debugLineNum = 163;BA.debugLine="If Job.JobName = \"token\" Then";
if ([_job._jobname isEqual:@"token"]) { 
 //BA.debugLineNum = 165;BA.debugLine="Try";
@try { //BA.debugLineNum = 167;BA.debugLine="Library.token = js.NextObject";
self._library._token = [_js NextObject];
 //BA.debugLineNum = 169;BA.debugLine="If SubExists(sModule,EVT,1) Or SubExists(sMod";
if ([self.__c SubExists:self._smodule :self._evt :(int) (1)] || [self.__c SubExists:self._smodule :self._evt :(int) (2)] || [self.__c SubExists:self._smodule :self._evt :(int) (3)]) { 
 //BA.debugLineNum = 170;BA.debugLine="CallSub2(sModule,EVT,Library.token)";
[self.__c CallSub2:self.bi :self._smodule :self._evt :(NSObject*)(self._library._token)];
 };
 } 
       @catch (NSException* e32) {
			[B4I SetException:e32]; };
 }else if([_job._jobname isEqual:@"subscribe"]) { 
 //BA.debugLineNum = 180;BA.debugLine="Dim res As Map";
_res = [B4IMap new];
 //BA.debugLineNum = 181;BA.debugLine="res = js.NextObject";
_res = [_js NextObject];
 //BA.debugLineNum = 183;BA.debugLine="CallSub3(sModule,EVT,res,\"subscribe\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_res) :(NSObject*)(@"subscribe")];
 }else if([_job._jobname isEqual:@"languages"]) { 
 //BA.debugLineNum = 188;BA.debugLine="Dim res,res1 As Map";
_res = [B4IMap new];
_res1 = [B4IMap new];
 //BA.debugLineNum = 189;BA.debugLine="res = js.NextObject";
_res = [_js NextObject];
 //BA.debugLineNum = 190;BA.debugLine="res1 = res.Get(\"data\")";
_res1 = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 192;BA.debugLine="Dim lsLang As List";
_lslang = [B4IList new];
 //BA.debugLineNum = 193;BA.debugLine="lsLang.Initialize";
[_lslang Initialize];
 //BA.debugLineNum = 195;BA.debugLine="For Each val1 As String In res1.Values";
{
const id<B4IIterable> group43 = [_res1 Values];
const int groupLen43 = group43.Size
;int index43 = 0;
;
for (; index43 < groupLen43;index43++){
_val1 = [self.bi ObjectToString:[group43 Get:index43]];
 //BA.debugLineNum = 196;BA.debugLine="lsLang.Add(val1)";
[_lslang Add:(NSObject*)(_val1)];
 }
};
 //BA.debugLineNum = 199;BA.debugLine="Dim jsLang As JSONGenerator";
_jslang = [B4IJSONGenerator new];
 //BA.debugLineNum = 200;BA.debugLine="jsLang.Initialize2(lsLang)";
[_jslang Initialize2:_lslang];
 //BA.debugLineNum = 202;BA.debugLine="File.WriteString(CacheData.DirCache,\"language\"";
[[self.__c File] WriteString:self._cachedata._dircache :@"language" :[_jslang ToString]];
 //BA.debugLineNum = 204;BA.debugLine="CallSub3(sModule,EVT,res,\"languages\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_res) :(NSObject*)(@"languages")];
 }else if([_job._jobname isEqual:@"product_class"]) { 
 //BA.debugLineNum = 209;BA.debugLine="Dim res,res1 As Map";
_res = [B4IMap new];
_res1 = [B4IMap new];
 //BA.debugLineNum = 210;BA.debugLine="res = js.NextObject";
_res = [_js NextObject];
 //BA.debugLineNum = 211;BA.debugLine="res1 = res.Get(\"data\")";
_res1 = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 213;BA.debugLine="Dim jsG As JSONGenerator";
_jsg = [B4IJSONGenerator new];
 //BA.debugLineNum = 214;BA.debugLine="jsG.Initialize2(res.Get(\"return_reasons\"))";
[_jsg Initialize2:(B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([_res Get:(NSObject*)(@"return_reasons")])]];
 //BA.debugLineNum = 215;BA.debugLine="File.WriteString(CacheData.DirCache,\"return_re";
[[self.__c File] WriteString:self._cachedata._dircache :@"return_reasons" :[_jsg ToString]];
 //BA.debugLineNum = 217;BA.debugLine="For Each k1 As String In res1.Keys";
{
const id<B4IIterable> group57 = [_res1 Keys];
const int groupLen57 = group57.Size
;int index57 = 0;
;
for (; index57 < groupLen57;index57++){
_k1 = [self.bi ObjectToString:[group57 Get:index57]];
 //BA.debugLineNum = 218;BA.debugLine="jsG.Initialize2(res1.Get(k1))";
[_jsg Initialize2:(B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([_res1 Get:(NSObject*)(_k1)])]];
 //BA.debugLineNum = 219;BA.debugLine="File.WriteString(CacheData.DirCache,k1,jsG.To";
[[self.__c File] WriteString:self._cachedata._dircache :_k1 :[_jsg ToString]];
 }
};
 //BA.debugLineNum = 222;BA.debugLine="File.WriteMap(CacheData.DirCache,\"product_clas";
[[self.__c File] WriteMap:self._cachedata._dircache :@"product_class2" :_res];
 //BA.debugLineNum = 223;BA.debugLine="CallSub3(sModule,EVT,res,\"product_class\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_res) :(NSObject*)(@"product_class")];
 }else if([_job._jobname isEqual:@"returns"]) { 
 //BA.debugLineNum = 229;BA.debugLine="Dim res As Map";
_res = [B4IMap new];
 //BA.debugLineNum = 230;BA.debugLine="res = js.NextObject";
_res = [_js NextObject];
 //BA.debugLineNum = 232;BA.debugLine="CallSub3(sModule,EVT,res,\"returns\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_res) :(NSObject*)(@"returns")];
 }else if([_job._jobname isEqual:@"checksums"]) { 
 //BA.debugLineNum = 237;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 238;BA.debugLine="m1 = js.NextObject";
_m1 = [_js NextObject];
 //BA.debugLineNum = 239;BA.debugLine="If m1.ContainsKey(\"success\") Then";
if ([_m1 ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 240;BA.debugLine="If m1.Get(\"success\") = True Then";
if ([[_m1 Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 241;BA.debugLine="CheckSumLocal(m1.Get(\"data\"))";
[self _checksumlocal:(B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([_m1 Get:(NSObject*)(@"data")])]];
 };
 };
 //BA.debugLineNum = 244;BA.debugLine="CallSubDelayed(sModule,EVT)";
[self.__c CallSubDelayed:self.bi :self._smodule :self._evt];
 }else if([_job._jobname isEqual:@"product"] || [_job._jobname isEqual:@"bestsellers"]) { 
 //BA.debugLineNum = 250;BA.debugLine="If currentCategory = \"bestsellers\" Then";
if ([self._currentcategory isEqual:@"bestsellers"]) { 
 //BA.debugLineNum = 252;BA.debugLine="Dim m1,product As Map";
_m1 = [B4IMap new];
_product = [B4IMap new];
 //BA.debugLineNum = 253;BA.debugLine="m1 = js.NextObject";
_m1 = [_js NextObject];
 //BA.debugLineNum = 255;BA.debugLine="Dim products As List";
_products = [B4IList new];
 //BA.debugLineNum = 256;BA.debugLine="Dim temp2s As Map";
_temp2s = [B4IMap new];
 //BA.debugLineNum = 257;BA.debugLine="products.Initialize";
[_products Initialize];
 //BA.debugLineNum = 258;BA.debugLine="temp2s = m1.Get(\"data\")";
_temp2s = (B4IMap*)([_m1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 260;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 261;BA.debugLine="l1 = temp2s.Get(\"products\")";
_l1.object = (NSArray*)([_temp2s Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 263;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,currentCategor";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_l1) :(NSObject*)(self._currentcategory)];
 //BA.debugLineNum = 265;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 269;BA.debugLine="If SubExists(sModule,EVT,1) Or SubExists(sModu";
if ([self.__c SubExists:self._smodule :self._evt :(int) (1)] || [self.__c SubExists:self._smodule :self._evt :(int) (2)] || [self.__c SubExists:self._smodule :self._evt :(int) (3)]) { 
 //BA.debugLineNum = 270;BA.debugLine="Try";
@try { //BA.debugLineNum = 271;BA.debugLine="Dim m1,product As Map";
_m1 = [B4IMap new];
_product = [B4IMap new];
 //BA.debugLineNum = 272;BA.debugLine="m1 = js.NextObject";
_m1 = [_js NextObject];
 //BA.debugLineNum = 274;BA.debugLine="Dim temp,products As List";
_temp = [B4IList new];
_products = [B4IList new];
 //BA.debugLineNum = 275;BA.debugLine="products.Initialize";
[_products Initialize];
 //BA.debugLineNum = 276;BA.debugLine="temp = m1.Get(\"data\")";
_temp.object = (NSArray*)([_m1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 278;BA.debugLine="If temp Is List Then";
if ([_temp.objectOrNull isKindOfClass: [NSArray class]]) { 
 //BA.debugLineNum = 280;BA.debugLine="If temp.Size = 0 Then";
if ([_temp Size]==0) { 
 //BA.debugLineNum = 281;BA.debugLine="CallSubDelayed3(sModule,EVT,temp,currentCa";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_temp) :(NSObject*)(self._currentcategory)];
 //BA.debugLineNum = 282;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 285;BA.debugLine="Dim t1 As Map";
_t1 = [B4IMap new];
 //BA.debugLineNum = 286;BA.debugLine="t1 = temp.Get(0)";
_t1 = (B4IMap*)([_temp Get:(int) (0)]);
 //BA.debugLineNum = 288;BA.debugLine="If t1.ContainsKey(\"products\") = False Then";
if ([_t1 ContainsKey:(NSObject*)(@"products")]==[self.__c False]) { 
 //BA.debugLineNum = 289;BA.debugLine="CallSubDelayed3(sModule,EVT,temp,currentCa";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_temp) :(NSObject*)(self._currentcategory)];
 //BA.debugLineNum = 290;BA.debugLine="Return";
if (true) return @"";
 };
 }else if([_temp.objectOrNull isKindOfClass: [B4IMap class]]) { 
 //BA.debugLineNum = 294;BA.debugLine="Dim ms As Map";
_ms = [B4IMap new];
 //BA.debugLineNum = 295;BA.debugLine="ms = temp";
_ms = (B4IMap*)((_temp).object);
 //BA.debugLineNum = 296;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 297;BA.debugLine="l1 = ms.Get(\"products\")";
_l1.object = (NSArray*)([_ms Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 299;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,currentCateg";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_l1) :(NSObject*)(self._currentcategory)];
 //BA.debugLineNum = 300;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 304;BA.debugLine="Try";
@try { //BA.debugLineNum = 305;BA.debugLine="product		= temp.Get(0)";
_product = (B4IMap*)([_temp Get:(int) (0)]);
 //BA.debugLineNum = 306;BA.debugLine="products	= product.Get(\"products\")";
_products.object = (NSArray*)([_product Get:(NSObject*)(@"products")]);
 //BA.debugLineNum = 307;BA.debugLine="CallSubDelayed3(sModule,EVT,products,curren";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_products) :(NSObject*)(self._currentcategory)];
 } 
       @catch (NSException* e120) {
			[B4I SetException:e120]; //BA.debugLineNum = 309;BA.debugLine="CallSubDelayed3(sModule,EVT,products,curren";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_products) :(NSObject*)(self._currentcategory)];
 };
 } 
       @catch (NSException* e123) {
			[B4I SetException:e123]; };
 };
 }else if([_job._jobname isEqual:@"product_details"]) { 
 //BA.debugLineNum = 321;BA.debugLine="If SubExists(sModule,EVT,1) Or SubExists(sModu";
if ([self.__c SubExists:self._smodule :self._evt :(int) (1)] || [self.__c SubExists:self._smodule :self._evt :(int) (2)] || [self.__c SubExists:self._smodule :self._evt :(int) (3)]) { 
 //BA.debugLineNum = 322;BA.debugLine="Try";
@try { //BA.debugLineNum = 323;BA.debugLine="Dim m1,product As Map";
_m1 = [B4IMap new];
_product = [B4IMap new];
 //BA.debugLineNum = 324;BA.debugLine="m1 = js.NextObject";
_m1 = [_js NextObject];
 //BA.debugLineNum = 326;BA.debugLine="Dim temp1 As Map";
_temp1 = [B4IMap new];
 //BA.debugLineNum = 327;BA.debugLine="temp1 = m1.Get(\"data\")";
_temp1 = (B4IMap*)([_m1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 329;BA.debugLine="CallSub3(sModule,EVT,temp1,currentCategory)";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_temp1) :(NSObject*)(self._currentcategory)];
 } 
       @catch (NSException* e134) {
			[B4I SetException:e134]; };
 };
 }else if([_job._jobname isEqual:@"slideshow"]) { 
 //BA.debugLineNum = 340;BA.debugLine="Dim temp1 As Map";
_temp1 = [B4IMap new];
 //BA.debugLineNum = 341;BA.debugLine="temp1 = js.NextObject";
_temp1 = [_js NextObject];
 //BA.debugLineNum = 343;BA.debugLine="Dim temp2 As List";
_temp2 = [B4IList new];
 //BA.debugLineNum = 344;BA.debugLine="temp2 = temp1.Get(\"data\")";
_temp2.object = (NSArray*)([_temp1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 345;BA.debugLine="temp1 = temp2.Get(0)";
_temp1 = (B4IMap*)([_temp2 Get:(int) (0)]);
 //BA.debugLineNum = 347;BA.debugLine="temp2 = temp1.Get(\"banners\")";
_temp2.object = (NSArray*)([_temp1 Get:(NSObject*)(@"banners")]);
 //BA.debugLineNum = 349;BA.debugLine="CallSub3(sModule,EVT,temp2,\"slideshow\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_temp2) :(NSObject*)(@"slideshow")];
 //BA.debugLineNum = 350;BA.debugLine="Return";
if (true) return @"";
 }else if([_job._jobname isEqual:@"categories"]) { 
 //BA.debugLineNum = 357;BA.debugLine="Dim temp1 As Map";
_temp1 = [B4IMap new];
 //BA.debugLineNum = 358;BA.debugLine="temp1 = js.NextObject";
_temp1 = [_js NextObject];
 //BA.debugLineNum = 360;BA.debugLine="Dim temp2 As List";
_temp2 = [B4IList new];
 //BA.debugLineNum = 361;BA.debugLine="temp2 = temp1.Get(\"data\")";
_temp2.object = (NSArray*)([_temp1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 363;BA.debugLine="CallSub3(sModule,EVT,temp2,\"categories\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_temp2) :(NSObject*)(@"categories")];
 }else if([_job._jobname isEqual:@"add2cart"]) { 
 //BA.debugLineNum = 370;BA.debugLine="Dim res As Map";
_res = [B4IMap new];
 //BA.debugLineNum = 371;BA.debugLine="res = js.NextObject";
_res = [_js NextObject];
 //BA.debugLineNum = 373;BA.debugLine="CallSub3(sModule,EVT,res,\"add2cart\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_res) :(NSObject*)(@"add2cart")];
 }else if([_job._jobname isEqual:@"carts"]) { 
 //BA.debugLineNum = 380;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 381;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 383;BA.debugLine="data2 = data1.Get(\"data\")";
_data2 = (B4IMap*)([_data1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 385;BA.debugLine="CallSub3(sModule,EVT,data2,\"carts\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data2) :(NSObject*)(@"carts")];
 }else if([_job._jobname isEqual:@"clearcart"]) { 
 //BA.debugLineNum = 392;BA.debugLine="Dim data3 As Map";
_data3 = [B4IMap new];
 //BA.debugLineNum = 393;BA.debugLine="data3 = js.NextObject";
_data3 = [_js NextObject];
 //BA.debugLineNum = 394;BA.debugLine="CallSub3(sModule,EVT,data3,\"carts\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data3) :(NSObject*)(@"carts")];
 }else if([_job._jobname isEqual:@"updatecart"]) { 
 //BA.debugLineNum = 401;BA.debugLine="Dim data3 As Map";
_data3 = [B4IMap new];
 //BA.debugLineNum = 402;BA.debugLine="data3 = js.NextObject";
_data3 = [_js NextObject];
 //BA.debugLineNum = 403;BA.debugLine="CallSub3(sModule,EVT,data3,\"update\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data3) :(NSObject*)(@"update")];
 }else if([_job._jobname isEqual:@"review"]) { 
 //BA.debugLineNum = 410;BA.debugLine="Dim res1 As Map";
_res1 = [B4IMap new];
 //BA.debugLineNum = 411;BA.debugLine="res1 = js.NextObject";
_res1 = [_js NextObject];
 //BA.debugLineNum = 412;BA.debugLine="CallSub3(sModule,EVT,res1,\"review\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_res1) :(NSObject*)(@"review")];
 }else if([_job._jobname isEqual:@"contact"]) { 
 //BA.debugLineNum = 419;BA.debugLine="Dim res1 As Map";
_res1 = [B4IMap new];
 //BA.debugLineNum = 420;BA.debugLine="res1 = js.NextObject";
_res1 = [_js NextObject];
 //BA.debugLineNum = 421;BA.debugLine="CallSub3(sModule,EVT,res1,\"contact\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_res1) :(NSObject*)(@"contact")];
 }else if([_job._jobname isEqual:@"deletecartitem"]) { 
 //BA.debugLineNum = 428;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 429;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 431;BA.debugLine="CallSub3(sModule,EVT,data1,\"deletecartitem\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"deletecartitem")];
 }else if([_job._jobname isEqual:@"register"]) { 
 //BA.debugLineNum = 438;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 439;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 441;BA.debugLine="CallSub3(sModule,EVT,data1,\"register\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"register")];
 }else if([_job._jobname isEqual:@"login"]) { 
 //BA.debugLineNum = 448;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 449;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 451;BA.debugLine="CallSub3(sModule,EVT,data1,\"login\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"login")];
 }else if([_job._jobname isEqual:@"logout"]) { 
 //BA.debugLineNum = 458;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 459;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 461;BA.debugLine="CallSub3(sModule,EVT,data1,\"logout\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"logout")];
 }else if([_job._jobname isEqual:@"forgot"]) { 
 //BA.debugLineNum = 468;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 469;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 471;BA.debugLine="CallSub3(sModule,EVT,data1,\"forgot\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"forgot")];
 }else if([_job._jobname isEqual:@"coupon"] || [_job._jobname isEqual:@"voucher"] || [_job._jobname isEqual:@"reward"]) { 
 //BA.debugLineNum = 478;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 479;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 481;BA.debugLine="If data1.ContainsKey(\"success\") Then";
if ([_data1 ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 482;BA.debugLine="If data1.Get(\"success\") = True Then";
if ([[_data1 Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 483;BA.debugLine="CallSubDelayed2(sModule,EVT,True)";
[self.__c CallSubDelayed2:self.bi :self._smodule :self._evt :(NSObject*)(@([self.__c True]))];
 }else {
 //BA.debugLineNum = 485;BA.debugLine="CallSubDelayed2(sModule,EVT,False)";
[self.__c CallSubDelayed2:self.bi :self._smodule :self._evt :(NSObject*)(@([self.__c False]))];
 };
 }else {
 //BA.debugLineNum = 488;BA.debugLine="CallSubDelayed2(sModule,EVT,False)";
[self.__c CallSubDelayed2:self.bi :self._smodule :self._evt :(NSObject*)(@([self.__c False]))];
 };
 }else if([_job._jobname isEqual:@"country"]) { 
 //BA.debugLineNum = 496;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 497;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 498;BA.debugLine="m1 = js.NextObject";
_m1 = [_js NextObject];
 //BA.debugLineNum = 499;BA.debugLine="l1 = m1.Get(\"data\")";
_l1.object = (NSArray*)([_m1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 501;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,\"city\")";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_l1) :(NSObject*)(@"city")];
 }else if([_job._jobname isEqual:@"city"]) { 
 //BA.debugLineNum = 508;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 509;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 510;BA.debugLine="m1 = js.NextObject";
_m1 = [_js NextObject];
 //BA.debugLineNum = 511;BA.debugLine="m1 = m1.Get(\"data\")";
_m1 = (B4IMap*)([_m1 Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 512;BA.debugLine="l1 = m1.Get(\"zone\")";
_l1.object = (NSArray*)([_m1 Get:(NSObject*)(@"zone")]);
 //BA.debugLineNum = 514;BA.debugLine="CallSubDelayed3(sModule,EVT,l1,\"city\")";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_l1) :(NSObject*)(@"city")];
 }else if([_job._jobname isEqual:@"order"] || [_job._jobname isEqual:@"confirmorder"] || [_job._jobname isEqual:@"pay"]) { 
 //BA.debugLineNum = 521;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 522;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 524;BA.debugLine="CallSub3(sModule,EVT,data1,\"order\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"order")];
 }else if([_job._jobname isEqual:@"ordersimple"]) { 
 //BA.debugLineNum = 530;BA.debugLine="CallSub2(sModule,EVT,Job.GetString)";
[self.__c CallSub2:self.bi :self._smodule :self._evt :(NSObject*)([_job _getstring])];
 }else if([_job._jobname isEqual:@"getpayments"] || [_job._jobname isEqual:@"setpayments"]) { 
 //BA.debugLineNum = 536;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 537;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 539;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"payments\")";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"payments")];
 }else if([_job._jobname isEqual:@"shippingmethods"]) { 
 //BA.debugLineNum = 545;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 546;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 548;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"shippingmet";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"shippingmethods")];
 }else if([_job._jobname isEqual:@"addaddress"]) { 
 //BA.debugLineNum = 554;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 555;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 557;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"addaddress\"";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"addaddress")];
 }else if([_job._jobname isEqual:@"clearcart_payment"]) { 
 //BA.debugLineNum = 562;BA.debugLine="CallSub(sModule,EVT)";
[self.__c CallSub:self.bi :self._smodule :self._evt];
 }else if([_job._jobname isEqual:@"account_user"]) { 
 //BA.debugLineNum = 568;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 569;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 571;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"account_det";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"account_details")];
 }else if([_job._jobname isEqual:@"getothers"]) { 
 //BA.debugLineNum = 578;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 579;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 581;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"orders\")";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"orders")];
 }else if([_job._jobname isEqual:@"manufacturers"] || [_job._jobname isEqual:@"information"]) { 
 //BA.debugLineNum = 587;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 588;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 590;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,Job.JobName)";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(_job._jobname)];
 }else if([_job._jobname isEqual:@"store"]) { 
 //BA.debugLineNum = 597;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 598;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 600;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"store\")";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"store")];
 }else if([_job._jobname isEqual:@"wishlist"]) { 
 //BA.debugLineNum = 606;BA.debugLine="Dim data1,data2 As Map";
_data1 = [B4IMap new];
_data2 = [B4IMap new];
 //BA.debugLineNum = 607;BA.debugLine="data1 = js.NextObject";
_data1 = [_js NextObject];
 //BA.debugLineNum = 609;BA.debugLine="CallSubDelayed3(sModule,EVT,data1,\"wishlist\")";
[self.__c CallSubDelayed3:self.bi :self._smodule :self._evt :(NSObject*)(_data1) :(NSObject*)(@"wishlist")];
 };
 }else {
 //BA.debugLineNum = 616;BA.debugLine="If Job.ErrorMessage.ToLowerCase.IndexOf(\"servic";
if ([[_job._errormessage ToLowerCase] IndexOf:@"service unavailable"]>-1) { 
 //BA.debugLineNum = 617;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetString";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"shop_disable"] :[self.__c True]];
 //BA.debugLineNum = 618;BA.debugLine="actErrorInternet.module = sModule";
self._acterrorinternet._module = self._smodule;
 //BA.debugLineNum = 619;BA.debugLine="actErrorInternet.NoShop = Library.GetStringRes";
self._acterrorinternet._noshop = [self._library _getstringresourse:@"shop_disable"];
 //BA.debugLineNum = 620;BA.debugLine="actErrorInternet.StartActivity";
[self._acterrorinternet _startactivity];
 //BA.debugLineNum = 621;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 624;BA.debugLine="If CacheData.ExistCacheProducts = True And Libr";
if ([self._cachedata _existcacheproducts]==[self.__c True] && [self._library _internetstate]==[self.__c False]) { 
 }else {
 //BA.debugLineNum = 627;BA.debugLine="Log(Job.JobName)";
[self.__c Log:_job._jobname];
 //BA.debugLineNum = 628;BA.debugLine="actErrorInternet.module = sModule";
self._acterrorinternet._module = self._smodule;
 //BA.debugLineNum = 629;BA.debugLine="actErrorInternet.StartActivity";
[self._acterrorinternet _startactivity];
 };
 };
 } 
       @catch (NSException* e278) {
			[B4I SetException:e278]; //BA.debugLineNum = 636;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringRe";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"error_net_title"] :[self.__c False]];
 //BA.debugLineNum = 638;BA.debugLine="If SubExists(sModule,EVT,1) Or SubExists(sModule";
if ([self.__c SubExists:self._smodule :self._evt :(int) (1)] || [self.__c SubExists:self._smodule :self._evt :(int) (2)] || [self.__c SubExists:self._smodule :self._evt :(int) (3)]) { 
 //BA.debugLineNum = 639;BA.debugLine="CallSub3(sModule,EVT,Null,\"\")";
[self.__c CallSub3:self.bi :self._smodule :self._evt :[self.__c Null] :(NSObject*)(@"")];
 };
 };
 //BA.debugLineNum = 646;BA.debugLine="Job.Release";
[_job _release];
 //BA.debugLineNum = 648;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _listaddressuser:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1847;BA.debugLine="Public Sub ListAddressUser(Module As Object,Event";
 //BA.debugLineNum = 1849;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1850;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1851;BA.debugLine="currentCategory = \"account/address\"";
self._currentcategory = @"account/address";
 //BA.debugLineNum = 1853;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1854;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1856;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1857;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1858;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1859;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1861;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _login:(NSObject*) _module :(NSString*) _event :(NSString*) _semail :(NSString*) _spassword{
B4IMap* _data = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 710;BA.debugLine="Public Sub Login(Module As Object,Event As String,";
 //BA.debugLineNum = 712;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 713;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 714;BA.debugLine="currentCategory = \"login\"";
self._currentcategory = @"login";
 //BA.debugLineNum = 716;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 717;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 718;BA.debugLine="data.Put(\"email\",sEmail)";
[_data Put:(NSObject*)(@"email") :(NSObject*)(_semail)];
 //BA.debugLineNum = 719;BA.debugLine="data.Put(\"password\",sPassword)";
[_data Put:(NSObject*)(@"password") :(NSObject*)(_spassword)];
 //BA.debugLineNum = 721;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 722;BA.debugLine="js.Initialize(data)";
[_js Initialize:_data];
 //BA.debugLineNum = 724;BA.debugLine="hu.Initialize(\"login\",Me)";
[self._hu _initialize:self.bi :@"login" :self];
 //BA.debugLineNum = 725;BA.debugLine="hu.PostString(api_url & \"login\",js.ToString)";
[self._hu _poststring:[@[self._api_url,@"login"] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 727;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 728;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 730;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 731;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 733;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loginuser:(NSObject*) _module :(NSString*) _event :(NSString*) _semail :(NSString*) _spassword{
NSString* _auth = @"";
B4IMap* _sdata = nil;
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 753;BA.debugLine="Public Sub LoginUser(Module As Object,Event As Str";
 //BA.debugLineNum = 755;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 756;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 757;BA.debugLine="currentCategory = \"login\"";
self._currentcategory = @"login";
 //BA.debugLineNum = 759;BA.debugLine="hu.Initialize(\"login\",Me)";
[self._hu _initialize:self.bi :@"login" :self];
 //BA.debugLineNum = 761;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 763;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 764;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 766;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 768;BA.debugLine="Dim sData As Map";
_sdata = [B4IMap new];
 //BA.debugLineNum = 769;BA.debugLine="sData.Initialize";
[_sdata Initialize];
 //BA.debugLineNum = 770;BA.debugLine="sData.Put(\"email\",sEMail)";
[_sdata Put:(NSObject*)(@"email") :(NSObject*)(_semail)];
 //BA.debugLineNum = 771;BA.debugLine="sData.Put(\"password\",sPassword)";
[_sdata Put:(NSObject*)(@"password") :(NSObject*)(_spassword)];
 //BA.debugLineNum = 773;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 774;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 775;BA.debugLine="hu.GetRequest.SetHeader(\"Login object\",js.ToStrin";
[[self._hu _getrequest] SetHeader:@"Login object" :[_js ToString]];
 //BA.debugLineNum = 777;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _loginusersocial:(NSObject*) _module :(NSString*) _event :(NSString*) _semail :(NSString*) _saccesstoken :(NSString*) _sprovider{
NSString* _auth = @"";
B4IMap* _sdata = nil;
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 779;BA.debugLine="Public Sub LoginUserSocial(Module As Object,Event";
 //BA.debugLineNum = 781;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 782;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 783;BA.debugLine="currentCategory = \"sociallogin\"";
self._currentcategory = @"sociallogin";
 //BA.debugLineNum = 785;BA.debugLine="hu.Initialize(\"login\",Me)";
[self._hu _initialize:self.bi :@"login" :self];
 //BA.debugLineNum = 787;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 789;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 790;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 792;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 794;BA.debugLine="Dim sData As Map";
_sdata = [B4IMap new];
 //BA.debugLineNum = 795;BA.debugLine="sData.Initialize";
[_sdata Initialize];
 //BA.debugLineNum = 796;BA.debugLine="sData.Put(\"email\",sEMail)";
[_sdata Put:(NSObject*)(@"email") :(NSObject*)(_semail)];
 //BA.debugLineNum = 797;BA.debugLine="sData.Put(\"access_token\",sAccessToken)";
[_sdata Put:(NSObject*)(@"access_token") :(NSObject*)(_saccesstoken)];
 //BA.debugLineNum = 798;BA.debugLine="sData.Put(\"provider\",sProvider)";
[_sdata Put:(NSObject*)(@"provider") :(NSObject*)(_sprovider)];
 //BA.debugLineNum = 800;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 801;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 802;BA.debugLine="hu.GetRequest.SetHeader(\"Login object\",js.ToStrin";
[[self._hu _getrequest] SetHeader:@"Login object" :[_js ToString]];
 //BA.debugLineNum = 804;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _logout:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 735;BA.debugLine="Public Sub Logout(Module As Object,Event As String";
 //BA.debugLineNum = 737;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 738;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 739;BA.debugLine="currentCategory = \"logout\"";
self._currentcategory = @"logout";
 //BA.debugLineNum = 741;BA.debugLine="hu.Initialize(\"logout\",Me)";
[self._hu _initialize:self.bi :@"logout" :self];
 //BA.debugLineNum = 743;BA.debugLine="hu.PostString(api_url & \"logout\",\"\")";
[self._hu _poststring:[@[self._api_url,@"logout"] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 745;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 746;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 748;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 749;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 751;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _paymentorder:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1149;BA.debugLine="Public Sub PaymentOrder(Module As Object,Event As";
 //BA.debugLineNum = 1151;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1152;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1153;BA.debugLine="currentCategory = \"pay\"";
self._currentcategory = @"pay";
 //BA.debugLineNum = 1155;BA.debugLine="hu.Initialize(\"confirmorderpayment\",Me)";
[self._hu _initialize:self.bi :@"confirmorderpayment" :self];
 //BA.debugLineNum = 1156;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1158;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1159;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1160;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1162;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _productdetails:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1026;BA.debugLine="Public Sub ProductDetails(Module As Object,Event A";
 //BA.debugLineNum = 1028;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1029;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1030;BA.debugLine="currentCategory = \"products/\" & sID";
self._currentcategory = [@[@"products/",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 1032;BA.debugLine="hu.Initialize(\"product_details\",Me)";
[self._hu _initialize:self.bi :@"product_details" :self];
 //BA.debugLineNum = 1034;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1036;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1037;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1039;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1040;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1042;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _register:(NSObject*) _module :(NSString*) _event :(B4IMap*) _data :(BOOL) _isguest{
NSString* _auth = @"";
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 670;BA.debugLine="Public Sub Register(Module As Object,Event As Stri";
 //BA.debugLineNum = 672;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 673;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 674;BA.debugLine="currentCategory = \"register\"";
self._currentcategory = @"register";
 //BA.debugLineNum = 676;BA.debugLine="hu.Initialize(\"register\",Me)";
[self._hu _initialize:self.bi :@"register" :self];
 //BA.debugLineNum = 678;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 679;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 681;BA.debugLine="If isGuest = True Then";
if (_isguest==[self.__c True]) { 
 //BA.debugLineNum = 682;BA.debugLine="data.Put(\"address_2\",\"android\")";
[_data Put:(NSObject*)(@"address_2") :(NSObject*)(@"android")];
 //BA.debugLineNum = 683;BA.debugLine="data.Put(\"company_id\",\"1\")";
[_data Put:(NSObject*)(@"company_id") :(NSObject*)(@"1")];
 //BA.debugLineNum = 684;BA.debugLine="data.Put(\"company\",\"guest\")";
[_data Put:(NSObject*)(@"company") :(NSObject*)(@"guest")];
 //BA.debugLineNum = 685;BA.debugLine="data.Put(\"password\",\"12345\")";
[_data Put:(NSObject*)(@"password") :(NSObject*)(@"12345")];
 //BA.debugLineNum = 686;BA.debugLine="data.Put(\"confirm\",\"12345\")";
[_data Put:(NSObject*)(@"confirm") :(NSObject*)(@"12345")];
 //BA.debugLineNum = 687;BA.debugLine="data.Put(\"fax\",\"1\")";
[_data Put:(NSObject*)(@"fax") :(NSObject*)(@"1")];
 //BA.debugLineNum = 688;BA.debugLine="data.Put(\"tax_id\",\"\")";
[_data Put:(NSObject*)(@"tax_id") :(NSObject*)(@"")];
 //BA.debugLineNum = 689;BA.debugLine="data.Put(\"agree\",\"1\")";
[_data Put:(NSObject*)(@"agree") :(NSObject*)(@"1")];
 //BA.debugLineNum = 690;BA.debugLine="currentCategory = \"guest\"";
self._currentcategory = @"guest";
 }else {
 //BA.debugLineNum = 692;BA.debugLine="data.Put(\"company\",\"company\")";
[_data Put:(NSObject*)(@"company") :(NSObject*)(@"company")];
 //BA.debugLineNum = 693;BA.debugLine="data.Put(\"address_2\",\"test\")";
[_data Put:(NSObject*)(@"address_2") :(NSObject*)(@"test")];
 //BA.debugLineNum = 694;BA.debugLine="data.Put(\"company_id\",\"company\")";
[_data Put:(NSObject*)(@"company_id") :(NSObject*)(@"company")];
 //BA.debugLineNum = 695;BA.debugLine="data.Put(\"confirm\",data.Get(\"password\"))";
[_data Put:(NSObject*)(@"confirm") :[_data Get:(NSObject*)(@"password")]];
 //BA.debugLineNum = 696;BA.debugLine="data.Put(\"agree\",\"1\")";
[_data Put:(NSObject*)(@"agree") :(NSObject*)(@"1")];
 //BA.debugLineNum = 697;BA.debugLine="data.Put(\"tax_id\",\"1\")";
[_data Put:(NSObject*)(@"tax_id") :(NSObject*)(@"1")];
 //BA.debugLineNum = 698;BA.debugLine="currentCategory = \"register\"";
self._currentcategory = @"register";
 };
 //BA.debugLineNum = 701;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 702;BA.debugLine="js.Initialize(data)";
[_js Initialize:_data];
 //BA.debugLineNum = 704;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 705;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 706;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 708;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _relatedproduct:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1006;BA.debugLine="Public Sub RelatedProduct(Module As Object,Event A";
 //BA.debugLineNum = 1008;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1009;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1011;BA.debugLine="Dim su As StringUtils";
self._su = [iStringUtils new];
 //BA.debugLineNum = 1012;BA.debugLine="currentCategory = \"related/\" & sID";
self._currentcategory = [@[@"related/",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 1014;BA.debugLine="hu.Initialize(\"product\",Me)";
[self._hu _initialize:self.bi :@"product" :self];
 //BA.debugLineNum = 1016;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1018;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1019;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1021;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1022;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1024;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _requestreturn:(NSObject*) _module :(NSString*) _event :(B4IMap*) _sdata{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1329;BA.debugLine="Public Sub RequestReturn(Module As Object,Event As";
 //BA.debugLineNum = 1331;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1332;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1333;BA.debugLine="currentCategory = \"returns\"";
self._currentcategory = @"returns";
 //BA.debugLineNum = 1335;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1336;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1338;BA.debugLine="hu.Initialize(\"returns\",Me)";
[self._hu _initialize:self.bi :@"returns" :self];
 //BA.debugLineNum = 1339;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1341;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1342;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1344;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1345;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1346;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1348;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _saveorder:(NSObject*) _module :(NSString*) _event :(BOOL) _isonlysave{
NSString* _auth = @"";
 //BA.debugLineNum = 1109;BA.debugLine="Public Sub SaveOrder(Module As Object,Event As Str";
 //BA.debugLineNum = 1111;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1112;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1113;BA.debugLine="currentCategory = \"confirm\" 'this is method name";
self._currentcategory = @"confirm";
 //BA.debugLineNum = 1115;BA.debugLine="hu.Initialize(\"order\",Me)";
[self._hu _initialize:self.bi :@"order" :self];
 //BA.debugLineNum = 1116;BA.debugLine="hu.PostString(api_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 1118;BA.debugLine="If isOnlySave = True Then";
if (_isonlysave==[self.__c True]) { 
 //BA.debugLineNum = 1119;BA.debugLine="hu.GetRequest.InitializePut2(api_url & currentCa";
[[self._hu _getrequest] InitializePut2:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[@"" GetBytes:@"UTF8"]];
 };
 //BA.debugLineNum = 1122;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1123;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1124;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1127;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _saveordersimple:(NSObject*) _module :(NSString*) _event :(BOOL) _isonlysave{
NSString* _auth = @"";
 //BA.debugLineNum = 1129;BA.debugLine="Public Sub SaveOrderSimple(Module As Object,Event";
 //BA.debugLineNum = 1131;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1132;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1133;BA.debugLine="currentCategory = \"simpleconfirm\" 'this is method";
self._currentcategory = @"simpleconfirm";
 //BA.debugLineNum = 1135;BA.debugLine="hu.Initialize(\"ordersimple\",Me)";
[self._hu _initialize:self.bi :@"ordersimple" :self];
 //BA.debugLineNum = 1136;BA.debugLine="hu.PostString(api_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 1138;BA.debugLine="If isOnlySave = True Then";
if (_isonlysave==[self.__c True]) { 
 //BA.debugLineNum = 1139;BA.debugLine="hu.GetRequest.InitializePut2(api_url & currentCa";
[[self._hu _getrequest] InitializePut2:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[@"" GetBytes:@"UTF8"]];
 };
 //BA.debugLineNum = 1142;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1143;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1144;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1147;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _searchproduct:(NSObject*) _module :(NSString*) _event :(NSString*) _sfield{
NSString* _auth = @"";
 //BA.debugLineNum = 943;BA.debugLine="Public Sub SearchProduct(Module As Object,Event As";
 //BA.debugLineNum = 945;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 946;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 948;BA.debugLine="Dim su As StringUtils";
self._su = [iStringUtils new];
 //BA.debugLineNum = 949;BA.debugLine="currentCategory = \"products/search/\" & su.EncodeU";
self._currentcategory = [@[@"products/search/",[self._su EncodeUrl:_sfield :@"UTF8"]] componentsJoinedByString:@""];
 //BA.debugLineNum = 951;BA.debugLine="hu.Initialize(\"product\",Me)";
[self._hu _initialize:self.bi :@"product" :self];
 //BA.debugLineNum = 952;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 954;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 955;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 957;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 958;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 960;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _searchproduct2:(NSObject*) _module :(NSString*) _event :(NSString*) _sfield{
NSString* _auth = @"";
 //BA.debugLineNum = 986;BA.debugLine="Public Sub SearchProduct2(Module As Object,Event A";
 //BA.debugLineNum = 988;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 989;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 991;BA.debugLine="Dim su As StringUtils";
self._su = [iStringUtils new];
 //BA.debugLineNum = 992;BA.debugLine="currentCategory = \"products/search/\" & su.EncodeU";
self._currentcategory = [@[@"products/search/",[self._su EncodeUrl:_sfield :@"UTF8"]] componentsJoinedByString:@""];
 //BA.debugLineNum = 994;BA.debugLine="hu.Initialize(\"product\",Me)";
[self._hu _initialize:self.bi :@"product" :self];
 //BA.debugLineNum = 996;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 998;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 999;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1001;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1002;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1004;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setdefaultx_oc:(B4IHttpRequest*) _request{
NSString* _curr = @"";
B4IList* _ls = nil;
B4IList* _listcurr = nil;
NSString* _temp = @"";
int _i = 0;
B4IMap* _m2 = nil;
 //BA.debugLineNum = 1469;BA.debugLine="Private Sub setDefaultX_OC(Request As HttpRequest)";
 //BA.debugLineNum = 1471;BA.debugLine="If Library.currLang = \"فارسی\" Then";
if ([self._library._currlang isEqual:@"فارسی"]) { 
 //BA.debugLineNum = 1472;BA.debugLine="Request.SetHeader(\"X-Oc-Merchant-Language\",\"fa\")";
[_request SetHeader:@"X-Oc-Merchant-Language" :@"fa"];
 }else if([[self._library._currlang ToLowerCase] isEqual:@"english"]) { 
 //BA.debugLineNum = 1474;BA.debugLine="Request.SetHeader(\"X-Oc-Merchant-Language\",\"en\")";
[_request SetHeader:@"X-Oc-Merchant-Language" :@"en"];
 };
 //BA.debugLineNum = 1478;BA.debugLine="Dim curr As String";
_curr = @"";
 //BA.debugLineNum = 1479;BA.debugLine="curr = Library.manager.GetString(\"curr\")";
_curr = [self._library._manager _getstring:@"curr"];
 //BA.debugLineNum = 1481;BA.debugLine="Dim ls,listCurr As List";
_ls = [B4IList new];
_listcurr = [B4IList new];
 //BA.debugLineNum = 1482;BA.debugLine="Dim temp As String";
_temp = @"";
 //BA.debugLineNum = 1484;BA.debugLine="If File.Exists(CacheData.DirCache,\"currencies\") T";
if ([[self.__c File] Exists:self._cachedata._dircache :@"currencies"]) { 
 //BA.debugLineNum = 1486;BA.debugLine="temp = File.ReadString(CacheData.DirCache,\"curre";
_temp = [[self.__c File] ReadString:self._cachedata._dircache :@"currencies"];
 //BA.debugLineNum = 1488;BA.debugLine="ls = Library.String2List(temp)";
_ls = [self._library _string2list:_temp];
 //BA.debugLineNum = 1489;BA.debugLine="listCurr.Initialize";
[_listcurr Initialize];
 //BA.debugLineNum = 1491;BA.debugLine="If ls.IsInitialized Then";
if ([_ls IsInitialized]) { 
 //BA.debugLineNum = 1492;BA.debugLine="For i = 0 To ls.Size - 1";
{
const int step15 = 1;
const int limit15 = (int) ([_ls Size]-1);
_i = (int) (0) ;
for (;(step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15) ;_i = ((int)(0 + _i + step15))  ) {
 //BA.debugLineNum = 1494;BA.debugLine="Dim m2 As Map";
_m2 = [B4IMap new];
 //BA.debugLineNum = 1495;BA.debugLine="m2 = ls.Get(i)";
_m2 = (B4IMap*)([_ls Get:_i]);
 //BA.debugLineNum = 1497;BA.debugLine="If m2.Get(\"title\") = curr Then";
if ([[_m2 Get:(NSObject*)(@"title")] isEqual:(NSObject*)(_curr)]) { 
 //BA.debugLineNum = 1498;BA.debugLine="curr = m2.Get(\"code\")";
_curr = [self.bi ObjectToString:[_m2 Get:(NSObject*)(@"code")]];
 //BA.debugLineNum = 1499;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 };
 }else {
 //BA.debugLineNum = 1506;BA.debugLine="curr = \"RLS\"";
_curr = @"RLS";
 };
 //BA.debugLineNum = 1510;BA.debugLine="If curr.Length = 0 Then curr = \"USD\"";
if ([_curr Length]==0) { 
_curr = @"USD";};
 //BA.debugLineNum = 1512;BA.debugLine="Request.SetHeader(\"X-Oc-Currency\",curr)";
[_request SetHeader:@"X-Oc-Currency" :_curr];
 //BA.debugLineNum = 1516;BA.debugLine="Request.SetHeader(\"X-Oc-Image-Dimension\",$\"${100%";
[_request SetHeader:@"X-Oc-Image-Dimension" :([@[@"",[self.__c SmartStringFormatter:@"" :(NSObject*)(@([self.__c PerXToCurrent:(float) (100)]))],@"x",[self.__c SmartStringFormatter:@"" :(NSObject*)(@([self.__c PerXToCurrent:(float) (100)]))],@""] componentsJoinedByString:@""])];
 //BA.debugLineNum = 1518;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setguestshipmethods:(NSObject*) _module :(NSString*) _event :(B4IMap*) _sdata{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1243;BA.debugLine="Public Sub SetGuestShipMethods(Module As Object,Ev";
 //BA.debugLineNum = 1245;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1246;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1247;BA.debugLine="currentCategory = \"guestshipping\"";
self._currentcategory = @"guestshipping";
 //BA.debugLineNum = 1249;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1250;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1252;BA.debugLine="hu.Initialize(\"shippingmethods\",Me)";
[self._hu _initialize:self.bi :@"shippingmethods" :self];
 //BA.debugLineNum = 1253;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1255;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1256;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1257;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1259;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setpaymentmethods:(NSObject*) _module :(NSString*) _event :(NSString*) _sid :(NSString*) _comment{
B4IMap* _sdata = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1180;BA.debugLine="Public Sub SetPaymentMethods(Module As Object,Even";
 //BA.debugLineNum = 1182;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1183;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1184;BA.debugLine="currentCategory = \"paymentmethods\"";
self._currentcategory = @"paymentmethods";
 //BA.debugLineNum = 1186;BA.debugLine="Dim sData As Map";
_sdata = [B4IMap new];
 //BA.debugLineNum = 1187;BA.debugLine="sData.Initialize";
[_sdata Initialize];
 //BA.debugLineNum = 1188;BA.debugLine="sData.Put(\"payment_method\",sID)";
[_sdata Put:(NSObject*)(@"payment_method") :(NSObject*)(_sid)];
 //BA.debugLineNum = 1189;BA.debugLine="sData.Put(\"agree\",\"1\")";
[_sdata Put:(NSObject*)(@"agree") :(NSObject*)(@"1")];
 //BA.debugLineNum = 1190;BA.debugLine="sData.Put(\"comment\",Comment)";
[_sdata Put:(NSObject*)(@"comment") :(NSObject*)(_comment)];
 //BA.debugLineNum = 1192;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1193;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1195;BA.debugLine="hu.Initialize(\"setpayments\",Me)";
[self._hu _initialize:self.bi :@"setpayments" :self];
 //BA.debugLineNum = 1196;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1198;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1199;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1200;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1202;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setshipmethods:(NSObject*) _module :(NSString*) _event :(NSString*) _sid :(NSString*) _comment{
B4IMap* _sdata = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1220;BA.debugLine="Public Sub SetShipMethods(Module As Object,Event A";
 //BA.debugLineNum = 1222;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1223;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1224;BA.debugLine="currentCategory = \"shippingmethods\"";
self._currentcategory = @"shippingmethods";
 //BA.debugLineNum = 1226;BA.debugLine="Dim sData As Map";
_sdata = [B4IMap new];
 //BA.debugLineNum = 1227;BA.debugLine="sData.Initialize";
[_sdata Initialize];
 //BA.debugLineNum = 1228;BA.debugLine="sData.Put(\"shipping_method\",sID)";
[_sdata Put:(NSObject*)(@"shipping_method") :(NSObject*)(_sid)];
 //BA.debugLineNum = 1229;BA.debugLine="sData.Put(\"comment\",Comment)";
[_sdata Put:(NSObject*)(@"comment") :(NSObject*)(_comment)];
 //BA.debugLineNum = 1231;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1232;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1234;BA.debugLine="hu.Initialize(\"shippingmethods\",Me)";
[self._hu _initialize:self.bi :@"shippingmethods" :self];
 //BA.debugLineNum = 1235;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1237;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1238;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1239;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1241;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setstoreid:(B4IHttpRequest*) _request{
 //BA.debugLineNum = 1522;BA.debugLine="Public Sub setStoreID(Request As HttpRequest)";
 //BA.debugLineNum = 1523;BA.debugLine="Request.SetHeader(\"X-Oc-Store-Id\",Library.StoreID";
[_request SetHeader:@"X-Oc-Store-Id" :self._library._storeid];
 //BA.debugLineNum = 1524;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _subscribe:(NSObject*) _module :(NSString*) _event :(BOOL) _subscribes{
NSString* _auth = @"";
 //BA.debugLineNum = 1769;BA.debugLine="Public Sub SubScribe(Module As Object,Event As Str";
 //BA.debugLineNum = 1771;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1772;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1774;BA.debugLine="If SubScribes Then";
if (_subscribes) { 
 //BA.debugLineNum = 1775;BA.debugLine="currentCategory = \"/index.php?route=rest/account";
self._currentcategory = @"/index.php?route=rest/account/newsletter&subscribe=1";
 }else {
 //BA.debugLineNum = 1777;BA.debugLine="currentCategory = \"/index.php?route=rest/account";
self._currentcategory = @"/index.php?route=rest/account/newsletter&subscribe=0";
 };
 //BA.debugLineNum = 1780;BA.debugLine="hu.Initialize(\"subscribe\",Me)";
[self._hu _initialize:self.bi :@"subscribe" :self];
 //BA.debugLineNum = 1781;BA.debugLine="hu.PostString(my_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._my_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 1782;BA.debugLine="hu.GetRequest.InitializePut2(my_url & currentCate";
[[self._hu _getrequest] InitializePut2:[@[self._my_url,self._currentcategory] componentsJoinedByString:@""] :[@"" GetBytes:@"UTF8"]];
 //BA.debugLineNum = 1784;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1785;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1786;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1788;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _updatepassworduser:(NSObject*) _module :(NSString*) _event :(NSString*) _spassword{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1825;BA.debugLine="Public Sub UpdatePasswordUser(Module As Object,Eve";
 //BA.debugLineNum = 1827;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1828;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1829;BA.debugLine="currentCategory = \"account/password\"";
self._currentcategory = @"account/password";
 //BA.debugLineNum = 1831;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1832;BA.debugLine="js.Initialize(CreateMap(\"password\":sPassword,\"con";
[_js Initialize:[self.__c createMap:@[(NSObject*)(@"password"),(NSObject*)(_spassword),(NSObject*)(@"confirm"),(NSObject*)(_spassword)]]];
 //BA.debugLineNum = 1834;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1835;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1836;BA.debugLine="hu.GetRequest.InitializePut2(api_url & currentCat";
[[self._hu _getrequest] InitializePut2:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[[_js ToString] GetBytes:@"UTF8"]];
 //BA.debugLineNum = 1838;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1839;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1841;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1842;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1843;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1845;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _updateproductcart:(NSObject*) _module :(NSString*) _event :(NSString*) _sid :(NSString*) _scount{
B4IMap* _sproduct = nil;
B4IMap* _id = nil;
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1692;BA.debugLine="Public Sub UpdateProductCart(Module As Object,Even";
 //BA.debugLineNum = 1694;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1695;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1696;BA.debugLine="currentCategory = \"cart\"";
self._currentcategory = @"cart";
 //BA.debugLineNum = 1698;BA.debugLine="Dim sProduct,id As Map";
_sproduct = [B4IMap new];
_id = [B4IMap new];
 //BA.debugLineNum = 1699;BA.debugLine="sProduct.Initialize";
[_sproduct Initialize];
 //BA.debugLineNum = 1700;BA.debugLine="id.Initialize";
[_id Initialize];
 //BA.debugLineNum = 1701;BA.debugLine="sProduct.Put(\"quantity\",CreateMap(sID:sCount))";
[_sproduct Put:(NSObject*)(@"quantity") :(NSObject*)([self.__c createMap:@[(NSObject*)(_sid),(NSObject*)(_scount)]])];
 //BA.debugLineNum = 1703;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1704;BA.debugLine="js.Initialize(sProduct)";
[_js Initialize:_sproduct];
 //BA.debugLineNum = 1706;BA.debugLine="hu.Initialize(\"updatecart\",Me)";
[self._hu _initialize:self.bi :@"updatecart" :self];
 //BA.debugLineNum = 1707;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1708;BA.debugLine="hu.GetRequest.InitializePut2(api_url & currentCat";
[[self._hu _getrequest] InitializePut2:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[[_js ToString] GetBytes:@"UTF8"]];
 //BA.debugLineNum = 1710;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1711;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1713;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1714;BA.debugLine="hu.GetRequest.SetHeader(\"body\",js.ToString)";
[[self._hu _getrequest] SetHeader:@"body" :[_js ToString]];
 //BA.debugLineNum = 1715;BA.debugLine="hu.GetRequest.SetContentType(\"application/json\")";
[[self._hu _getrequest] SetContentType:@"application/json"];
 //BA.debugLineNum = 1717;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _updateuserdetails:(NSObject*) _module :(NSString*) _event :(B4IMap*) _sdata{
B4IJSONGenerator* _js = nil;
NSString* _auth = @"";
 //BA.debugLineNum = 1806;BA.debugLine="Public Sub UpdateUserDetails(Module As Object,Even";
 //BA.debugLineNum = 1808;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1809;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1810;BA.debugLine="currentCategory = \"account\"";
self._currentcategory = @"account";
 //BA.debugLineNum = 1812;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 1813;BA.debugLine="js.Initialize(sData)";
[_js Initialize:_sdata];
 //BA.debugLineNum = 1815;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1816;BA.debugLine="hu.PostString(api_url & currentCategory,js.ToStri";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :[_js ToString]];
 //BA.debugLineNum = 1818;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1819;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1820;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1821;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1823;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _userdetails:(NSObject*) _module :(NSString*) _event{
NSString* _auth = @"";
 //BA.debugLineNum = 1790;BA.debugLine="Public Sub UserDetails(Module As Object,Event As S";
 //BA.debugLineNum = 1792;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1793;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1794;BA.debugLine="currentCategory = \"account\"";
self._currentcategory = @"account";
 //BA.debugLineNum = 1796;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1797;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1799;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1800;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1801;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1802;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1804;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _userorders:(NSObject*) _module :(NSString*) _event :(NSString*) _sid :(BOOL) _isrecorder{
NSString* _auth = @"";
 //BA.debugLineNum = 1931;BA.debugLine="Public Sub UserOrders(Module As Object,Event As St";
 //BA.debugLineNum = 1933;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1934;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1936;BA.debugLine="If sID = \"0\" And isRecorder = False Then";
if ([_sid isEqual:@"0"] && _isrecorder==[self.__c False]) { 
 //BA.debugLineNum = 1937;BA.debugLine="currentCategory = \"customerorders\"";
self._currentcategory = @"customerorders";
 }else {
 //BA.debugLineNum = 1939;BA.debugLine="currentCategory = \"customerorders/\" & sID";
self._currentcategory = [@[@"customerorders/",_sid] componentsJoinedByString:@""];
 };
 //BA.debugLineNum = 1942;BA.debugLine="hu.Initialize(\"account_user\",Me)";
[self._hu _initialize:self.bi :@"account_user" :self];
 //BA.debugLineNum = 1944;BA.debugLine="If isRecorder = False Then";
if (_isrecorder==[self.__c False]) { 
 //BA.debugLineNum = 1945;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 }else {
 //BA.debugLineNum = 1947;BA.debugLine="hu.PostString(api_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 };
 //BA.debugLineNum = 1950;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1951;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1952;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1953;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1955;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _wishlist:(NSObject*) _module :(NSString*) _event :(NSString*) _sid{
NSString* _auth = @"";
 //BA.debugLineNum = 1739;BA.debugLine="Public Sub Wishlist(Module As Object,Event As Stri";
 //BA.debugLineNum = 1741;BA.debugLine="sModule = Module";
self._smodule = _module;
 //BA.debugLineNum = 1742;BA.debugLine="EVT = Event";
self._evt = _event;
 //BA.debugLineNum = 1744;BA.debugLine="hu.Initialize(\"wishlist\",Me)";
[self._hu _initialize:self.bi :@"wishlist" :self];
 //BA.debugLineNum = 1746;BA.debugLine="If sID = \"\" Then";
if ([_sid isEqual:@""]) { 
 //BA.debugLineNum = 1747;BA.debugLine="currentCategory = \"wishlist\"";
self._currentcategory = @"wishlist";
 //BA.debugLineNum = 1748;BA.debugLine="hu.Download(api_url & currentCategory)";
[self._hu _download:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 }else if([_sid StartsWith:@"-"]) { 
 //BA.debugLineNum = 1750;BA.debugLine="currentCategory = \"wishlist/\" & sID.Replace(\"-\",";
self._currentcategory = [@[@"wishlist/",[_sid Replace:@"-" :@""]] componentsJoinedByString:@""];
 //BA.debugLineNum = 1751;BA.debugLine="hu.PostString(api_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 1752;BA.debugLine="hu.GetRequest.InitializeDelete(api_url & current";
[[self._hu _getrequest] InitializeDelete:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""]];
 }else {
 //BA.debugLineNum = 1754;BA.debugLine="currentCategory = \"wishlist/\" & sID";
self._currentcategory = [@[@"wishlist/",_sid] componentsJoinedByString:@""];
 //BA.debugLineNum = 1755;BA.debugLine="hu.PostString(api_url & currentCategory,\"\")";
[self._hu _poststring:[@[self._api_url,self._currentcategory] componentsJoinedByString:@""] :@""];
 };
 //BA.debugLineNum = 1758;BA.debugLine="Dim auth As String";
_auth = @"";
 //BA.debugLineNum = 1759;BA.debugLine="auth = $\"${Library.token.Get(\"token_type\")} ${Get";
_auth = ([@[@"",[self.__c SmartStringFormatter:@"" :[self._library._token Get:(NSObject*)(@"token_type")]],@" ",[self.__c SmartStringFormatter:@"" :(NSObject*)([self _getcurrenttoken])],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 1760;BA.debugLine="hu.GetRequest.SetHeader(\"Authorization\",auth)";
[[self._hu _getrequest] SetHeader:@"Authorization" :_auth];
 //BA.debugLineNum = 1761;BA.debugLine="setDefaultX_OC(hu.GetRequest)";
[self _setdefaultx_oc:[self._hu _getrequest]];
 //BA.debugLineNum = 1763;BA.debugLine="End Sub";
return @"";
}
@end
