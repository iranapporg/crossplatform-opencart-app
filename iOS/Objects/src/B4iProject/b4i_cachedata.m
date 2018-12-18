
#import "b4i_cachedata.h"
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


@implementation b4i_cachedata 


+ (instancetype)new {
    static b4i_cachedata* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _addcategory2cache:(B4IList*) _category :(NSString*) _sid{
B4IMap* _cache = nil;
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 46;BA.debugLine="Public Sub AddCategory2Cache(Category As List,sID";
 //BA.debugLineNum = 48;BA.debugLine="Dim Cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 49;BA.debugLine="Cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 51;BA.debugLine="If File.Exists(DirCache,\"cache_category2\") Then";
if ([[self.__c File] Exists:self._dircache :@"cache_category2"]) { 
 //BA.debugLineNum = 52;BA.debugLine="Cache = File.ReadMap(DirCache,\"cache_category2\")";
_cache = [[self.__c File] ReadMap:self._dircache :@"cache_category2"];
 };
 //BA.debugLineNum = 55;BA.debugLine="If Cache.ContainsKey(sID) = False Then";
if ([_cache ContainsKey:(NSObject*)(_sid)]==[self.__c False]) { 
 //BA.debugLineNum = 56;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 57;BA.debugLine="js.Initialize2(Category)";
[_js Initialize2:_category];
 //BA.debugLineNum = 58;BA.debugLine="Cache.Put(sID,js.ToString)";
[_cache Put:(NSObject*)(_sid) :(NSObject*)([_js ToString])];
 };
 //BA.debugLineNum = 61;BA.debugLine="File.WriteMap(DirCache,\"cache_category2\",Cache)";
[[self.__c File] WriteMap:self._dircache :@"cache_category2" :_cache];
 //BA.debugLineNum = 63;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addmap2cache:(B4IMap*) _data :(NSString*) _sid{
B4IMap* _cache = nil;
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 132;BA.debugLine="Public Sub AddMap2Cache(Data As Map,sID As String)";
 //BA.debugLineNum = 134;BA.debugLine="Dim cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 135;BA.debugLine="cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 137;BA.debugLine="If File.Exists(DirCache,\"cache_string_file\") Then";
if ([[self.__c File] Exists:self._dircache :@"cache_string_file"]) { 
 //BA.debugLineNum = 138;BA.debugLine="cache = File.ReadMap(DirCache,\"cache_string_file";
_cache = [[self.__c File] ReadMap:self._dircache :@"cache_string_files"];
 };
 //BA.debugLineNum = 141;BA.debugLine="If cache.ContainsKey(sID) = False Then";
if ([_cache ContainsKey:(NSObject*)(_sid)]==[self.__c False]) { 
 //BA.debugLineNum = 142;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 143;BA.debugLine="js.Initialize(Data)";
[_js Initialize:_data];
 //BA.debugLineNum = 144;BA.debugLine="cache.Put(sID,js.ToString)";
[_cache Put:(NSObject*)(_sid) :(NSObject*)([_js ToString])];
 };
 //BA.debugLineNum = 147;BA.debugLine="File.WriteMap(DirCache,\"cache_string_files\",cache";
[[self.__c File] WriteMap:self._dircache :@"cache_string_files" :_cache];
 //BA.debugLineNum = 149;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addproductdescription2cache:(B4IMap*) _product{
B4IMap* _cache = nil;
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 6;BA.debugLine="Public Sub AddProductDescription2Cache(Product As";
 //BA.debugLineNum = 8;BA.debugLine="Dim Cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 9;BA.debugLine="Cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 11;BA.debugLine="If File.Exists(DirCache,\"caches\") Then";
if ([[self.__c File] Exists:self._dircache :@"caches"]) { 
 //BA.debugLineNum = 12;BA.debugLine="Cache = File.ReadMap(DirCache,\"caches\")";
_cache = [[self.__c File] ReadMap:self._dircache :@"caches"];
 };
 //BA.debugLineNum = 15;BA.debugLine="If Cache.ContainsKey(Product.Get(\"id\")) = False T";
if ([_cache ContainsKey:[_product Get:(NSObject*)(@"id")]]==[self.__c False]) { 
 //BA.debugLineNum = 16;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 17;BA.debugLine="js.Initialize(Product)";
[_js Initialize:_product];
 //BA.debugLineNum = 18;BA.debugLine="Cache.Put(Product.Get(\"id\"),js.ToString)";
[_cache Put:[_product Get:(NSObject*)(@"id")] :(NSObject*)([_js ToString])];
 };
 //BA.debugLineNum = 21;BA.debugLine="File.WriteMap(DirCache,\"caches\",Cache)";
[[self.__c File] WriteMap:self._dircache :@"caches" :_cache];
 //BA.debugLineNum = 23;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _addproducts2cache:(B4IList*) _products :(NSString*) _sid{
B4IMap* _cache = nil;
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 86;BA.debugLine="Public Sub AddProducts2Cache(Products As List,sID";
 //BA.debugLineNum = 88;BA.debugLine="If Products = Null Then Return";
if (_products== nil) { 
if (true) return @"";};
 //BA.debugLineNum = 90;BA.debugLine="Dim Cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 91;BA.debugLine="Cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 93;BA.debugLine="If File.Exists(DirCache,\"cache_category_product2\"";
if ([[self.__c File] Exists:self._dircache :@"cache_category_product2"]) { 
 //BA.debugLineNum = 94;BA.debugLine="Cache = File.ReadMap(DirCache,\"cache_category_pr";
_cache = [[self.__c File] ReadMap:self._dircache :@"cache_category_product2"];
 };
 //BA.debugLineNum = 97;BA.debugLine="If Cache.ContainsKey(sID) = False Then";
if ([_cache ContainsKey:(NSObject*)(_sid)]==[self.__c False]) { 
 //BA.debugLineNum = 98;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 99;BA.debugLine="js.Initialize2(Products)";
[_js Initialize2:_products];
 //BA.debugLineNum = 100;BA.debugLine="Cache.Put(sID,js.ToString)";
[_cache Put:(NSObject*)(_sid) :(NSObject*)([_js ToString])];
 };
 //BA.debugLineNum = 103;BA.debugLine="File.WriteMap(DirCache,\"cache_category_product2\",";
[[self.__c File] WriteMap:self._dircache :@"cache_category_product2" :_cache];
 //BA.debugLineNum = 105;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _deletecache{
B4IList* _ls = nil;
int _i = 0;
 //BA.debugLineNum = 172;BA.debugLine="Public Sub DeleteCache";
 //BA.debugLineNum = 174;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 175;BA.debugLine="ls = File.ListFiles(DirCache)";
_ls = [[self.__c File] ListFiles:self._dircache];
 //BA.debugLineNum = 177;BA.debugLine="If ls.IsInitialized = False Then Return";
if ([_ls IsInitialized]==[self.__c False]) { 
if (true) return @"";};
 //BA.debugLineNum = 179;BA.debugLine="For i = 0 To ls.Size - 1";
{
const int step4 = 1;
const int limit4 = (int) ([_ls Size]-1);
_i = (int) (0) ;
for (;(step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4) ;_i = ((int)(0 + _i + step4))  ) {
 //BA.debugLineNum = 180;BA.debugLine="Try";
@try { //BA.debugLineNum = 181;BA.debugLine="File.Delete(DirCache,ls.Get(i))";
[[self.__c File] Delete:self._dircache :[self.bi ObjectToString:[_ls Get:_i]]];
 } 
       @catch (NSException* e8) {
			[B4I SetException:e8]; };
 }
};
 //BA.debugLineNum = 186;BA.debugLine="End Sub";
return @"";
}
- (BOOL)  _existcacheproducts{
 //BA.debugLineNum = 128;BA.debugLine="Public Sub ExistCacheProducts As Boolean";
 //BA.debugLineNum = 129;BA.debugLine="Return File.Exists(DirCache,\"cache_category_produ";
if (true) return [[self.__c File] Exists:self._dircache :@"cache_category_product2"];
 //BA.debugLineNum = 130;BA.debugLine="End Sub";
return false;
}
- (B4IList*)  _getcategoryfromcache:(NSString*) _sid{
B4IMap* _cache = nil;
B4IJSONParser* _js = nil;
 //BA.debugLineNum = 65;BA.debugLine="Public Sub GetCategoryFromCache(sID As String) As";
 //BA.debugLineNum = 67;BA.debugLine="Dim Cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 68;BA.debugLine="Cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 70;BA.debugLine="If File.Exists(DirCache,\"cache_category2\") Then";
if ([[self.__c File] Exists:self._dircache :@"cache_category2"]) { 
 //BA.debugLineNum = 71;BA.debugLine="Cache = File.ReadMap(DirCache,\"cache_category2\")";
_cache = [[self.__c File] ReadMap:self._dircache :@"cache_category2"];
 }else {
 //BA.debugLineNum = 73;BA.debugLine="Return Null";
if (true) return (B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([self.__c Null])];
 };
 //BA.debugLineNum = 76;BA.debugLine="If Cache.ContainsKey(sID) Then";
if ([_cache ContainsKey:(NSObject*)(_sid)]) { 
 //BA.debugLineNum = 77;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 78;BA.debugLine="js.Initialize(Cache.Get(sID))";
[_js Initialize:[self.bi ObjectToString:[_cache Get:(NSObject*)(_sid)]]];
 //BA.debugLineNum = 79;BA.debugLine="Return js.NextArray";
if (true) return [_js NextArray];
 }else {
 //BA.debugLineNum = 81;BA.debugLine="Return Null";
if (true) return (B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([self.__c Null])];
 };
 //BA.debugLineNum = 84;BA.debugLine="End Sub";
return nil;
}
- (B4IMap*)  _getmapfromcache:(NSString*) _sid{
B4IMap* _cache = nil;
B4IJSONParser* _js = nil;
 //BA.debugLineNum = 151;BA.debugLine="Public Sub GetMapFromCache(sID As String) As Map";
 //BA.debugLineNum = 153;BA.debugLine="Dim cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 154;BA.debugLine="cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 156;BA.debugLine="If File.Exists(DirCache,\"cache_string_files\") The";
if ([[self.__c File] Exists:self._dircache :@"cache_string_files"]) { 
 //BA.debugLineNum = 157;BA.debugLine="cache = File.ReadMap(DirCache,\"cache_string_file";
_cache = [[self.__c File] ReadMap:self._dircache :@"cache_string_files"];
 }else {
 //BA.debugLineNum = 159;BA.debugLine="Return Null";
if (true) return (B4IMap*)([self.__c Null]);
 };
 //BA.debugLineNum = 162;BA.debugLine="If cache.ContainsKey(sID) = False Then";
if ([_cache ContainsKey:(NSObject*)(_sid)]==[self.__c False]) { 
 //BA.debugLineNum = 163;BA.debugLine="Return Null";
if (true) return (B4IMap*)([self.__c Null]);
 }else {
 //BA.debugLineNum = 165;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 166;BA.debugLine="js.Initialize(cache.Get(sID))";
[_js Initialize:[self.bi ObjectToString:[_cache Get:(NSObject*)(_sid)]]];
 //BA.debugLineNum = 167;BA.debugLine="Return js.NextObject";
if (true) return [_js NextObject];
 };
 //BA.debugLineNum = 170;BA.debugLine="End Sub";
return nil;
}
- (B4IMap*)  _getproductdescriptionfromcache:(NSString*) _sid{
B4IMap* _cache = nil;
B4IJSONParser* _js = nil;
 //BA.debugLineNum = 25;BA.debugLine="Public Sub GetProductDescriptionFromCache(sID As S";
 //BA.debugLineNum = 27;BA.debugLine="Dim Cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 28;BA.debugLine="Cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 30;BA.debugLine="If File.Exists(DirCache,\"caches\") Then";
if ([[self.__c File] Exists:self._dircache :@"caches"]) { 
 //BA.debugLineNum = 31;BA.debugLine="Cache = File.ReadMap(DirCache,\"caches\")";
_cache = [[self.__c File] ReadMap:self._dircache :@"caches"];
 }else {
 //BA.debugLineNum = 33;BA.debugLine="Return Null";
if (true) return (B4IMap*)([self.__c Null]);
 };
 //BA.debugLineNum = 36;BA.debugLine="If Cache.ContainsKey(sID) Then";
if ([_cache ContainsKey:(NSObject*)(_sid)]) { 
 //BA.debugLineNum = 37;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 38;BA.debugLine="js.Initialize(Cache.Get(sID))";
[_js Initialize:[self.bi ObjectToString:[_cache Get:(NSObject*)(_sid)]]];
 //BA.debugLineNum = 39;BA.debugLine="Return js.NextObject";
if (true) return [_js NextObject];
 }else {
 //BA.debugLineNum = 41;BA.debugLine="Return Null";
if (true) return (B4IMap*)([self.__c Null]);
 };
 //BA.debugLineNum = 44;BA.debugLine="End Sub";
return nil;
}
- (B4IList*)  _getproductsfromcache:(NSString*) _sid{
B4IMap* _cache = nil;
B4IJSONParser* _js = nil;
 //BA.debugLineNum = 107;BA.debugLine="Public Sub GetProductsFromCache(sID As String) As";
 //BA.debugLineNum = 109;BA.debugLine="Dim cache As Map";
_cache = [B4IMap new];
 //BA.debugLineNum = 110;BA.debugLine="cache.Initialize";
[_cache Initialize];
 //BA.debugLineNum = 111;BA.debugLine="Log(File.Exists(DirCache,\"cache_category_product2";
[self.__c Log:[self.bi BooleanToString:[[self.__c File] Exists:self._dircache :@"cache_category_product2"]]];
 //BA.debugLineNum = 112;BA.debugLine="If File.Exists(DirCache,\"cache_category_product2\"";
if ([[self.__c File] Exists:self._dircache :@"cache_category_product2"]) { 
 //BA.debugLineNum = 113;BA.debugLine="cache = File.ReadMap(DirCache,\"cache_category_pr";
_cache = [[self.__c File] ReadMap:self._dircache :@"cache_category_product2"];
 }else {
 //BA.debugLineNum = 115;BA.debugLine="Return Null";
if (true) return (B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([self.__c Null])];
 };
 //BA.debugLineNum = 118;BA.debugLine="If cache.ContainsKey(sID) = False Then";
if ([_cache ContainsKey:(NSObject*)(_sid)]==[self.__c False]) { 
 //BA.debugLineNum = 119;BA.debugLine="Return Null";
if (true) return (B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)([self.__c Null])];
 }else {
 //BA.debugLineNum = 121;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 122;BA.debugLine="js.Initialize(cache.Get(sID))";
[_js Initialize:[self.bi ObjectToString:[_cache Get:(NSObject*)(_sid)]]];
 //BA.debugLineNum = 123;BA.debugLine="Return js.NextArray";
if (true) return [_js NextArray];
 };
 //BA.debugLineNum = 126;BA.debugLine="End Sub";
return nil;
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
self._dateutils=[b4i_dateutils new];
self._bookmark=[b4i_bookmark new];
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Public DirCache As String = File.DirTemp";
self._dircache = [[self.__c File] DirTemp];
 //BA.debugLineNum = 4;BA.debugLine="End Sub";
return @"";
}
@end
