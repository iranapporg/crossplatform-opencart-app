
#import "b4i_bookmark.h"
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
#import "b4i_actabout.h"
#import "b4i_actshow.h"
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_bookmark 


+ (instancetype)new {
    static b4i_bookmark* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (int)  _bookmarkcount{
B4IMap* _map1 = nil;
 //BA.debugLineNum = 74;BA.debugLine="Sub BookmarkCount As Int";
 //BA.debugLineNum = 76;BA.debugLine="If ExistsFile Then";
if ([self _existsfile]) { 
 //BA.debugLineNum = 77;BA.debugLine="Dim map1 As Map";
_map1 = [B4IMap new];
 //BA.debugLineNum = 78;BA.debugLine="map1.Initialize";
[_map1 Initialize];
 //BA.debugLineNum = 79;BA.debugLine="map1 = File.ReadMap(File.DirLibrary,\"bookmarks\")";
_map1 = [[self.__c File] ReadMap:[[self.__c File] DirLibrary] :@"bookmarks"];
 //BA.debugLineNum = 80;BA.debugLine="Return map1.Size";
if (true) return [_map1 Size];
 }else {
 //BA.debugLineNum = 82;BA.debugLine="Return 0";
if (true) return (int) (0);
 };
 //BA.debugLineNum = 85;BA.debugLine="End Sub";
return 0;
}
- (BOOL)  _bookmarks:(B4IMap*) _product{
B4IMap* _m1 = nil;
B4IJSONGenerator* _js = nil;
 //BA.debugLineNum = 6;BA.debugLine="Public Sub Bookmarks(Product As Map) As Boolean";
 //BA.debugLineNum = 8;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 9;BA.debugLine="m1.Initialize";
[_m1 Initialize];
 //BA.debugLineNum = 11;BA.debugLine="If ExistsFile Then";
if ([self _existsfile]) { 
 //BA.debugLineNum = 12;BA.debugLine="m1 = File.ReadMap(File.DirLibrary,\"bookmarks\")";
_m1 = [[self.__c File] ReadMap:[[self.__c File] DirLibrary] :@"bookmarks"];
 };
 //BA.debugLineNum = 15;BA.debugLine="If m1.ContainsKey(Product.Get(\"id\")) = False Then";
if ([_m1 ContainsKey:[_product Get:(NSObject*)(@"id")]]==[self.__c False]) { 
 //BA.debugLineNum = 16;BA.debugLine="Dim js As JSONGenerator";
_js = [B4IJSONGenerator new];
 //BA.debugLineNum = 17;BA.debugLine="js.Initialize(Product)";
[_js Initialize:_product];
 //BA.debugLineNum = 19;BA.debugLine="m1.Put(Product.Get(\"id\"),js.ToString)";
[_m1 Put:[_product Get:(NSObject*)(@"id")] :(NSObject*)([_js ToString])];
 //BA.debugLineNum = 20;BA.debugLine="File.WriteMap(File.DirLibrary,\"bookmarks\",m1)";
[[self.__c File] WriteMap:[[self.__c File] DirLibrary] :@"bookmarks" :_m1];
 //BA.debugLineNum = 22;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 24;BA.debugLine="m1.Remove(Product.Get(\"id\"))";
[_m1 Remove:[_product Get:(NSObject*)(@"id")]];
 //BA.debugLineNum = 25;BA.debugLine="File.WriteMap(File.DirLibrary,\"bookmarks\",m1)";
[[self.__c File] WriteMap:[[self.__c File] DirLibrary] :@"bookmarks" :_m1];
 //BA.debugLineNum = 26;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 29;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _checkid:(NSString*) _sid{
B4IMap* _m1 = nil;
 //BA.debugLineNum = 31;BA.debugLine="Public Sub CheckID(sID As String) As Boolean";
 //BA.debugLineNum = 33;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 34;BA.debugLine="m1.Initialize";
[_m1 Initialize];
 //BA.debugLineNum = 36;BA.debugLine="If ExistsFile Then";
if ([self _existsfile]) { 
 //BA.debugLineNum = 37;BA.debugLine="m1 = File.ReadMap(File.DirLibrary,\"bookmarks\")";
_m1 = [[self.__c File] ReadMap:[[self.__c File] DirLibrary] :@"bookmarks"];
 };
 //BA.debugLineNum = 40;BA.debugLine="If m1.ContainsKey(sID) = True Then";
if ([_m1 ContainsKey:(NSObject*)(_sid)]==[self.__c True]) { 
 //BA.debugLineNum = 41;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 43;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 46;BA.debugLine="End Sub";
return false;
}
- (BOOL)  _existsfile{
 //BA.debugLineNum = 87;BA.debugLine="Sub ExistsFile As Boolean";
 //BA.debugLineNum = 88;BA.debugLine="Return File.Exists(File.DirLibrary,\"bookmarks\")";
if (true) return [[self.__c File] Exists:[[self.__c File] DirLibrary] :@"bookmarks"];
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return false;
}
- (B4IList*)  _getbookmarks{
B4IList* _l1 = nil;
B4IMap* _m1 = nil;
NSString* _v1 = @"";
B4IMap* _te = nil;
B4IJSONParser* _j = nil;
 //BA.debugLineNum = 48;BA.debugLine="Public Sub GetBookmarks As List";
 //BA.debugLineNum = 50;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 51;BA.debugLine="l1.Initialize";
[_l1 Initialize];
 //BA.debugLineNum = 53;BA.debugLine="If ExistsFile Then";
if ([self _existsfile]) { 
 //BA.debugLineNum = 54;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 55;BA.debugLine="m1.Initialize";
[_m1 Initialize];
 //BA.debugLineNum = 56;BA.debugLine="m1 = File.ReadMap(File.DirLibrary,\"bookmarks\")";
_m1 = [[self.__c File] ReadMap:[[self.__c File] DirLibrary] :@"bookmarks"];
 //BA.debugLineNum = 58;BA.debugLine="If m1.Size > 0 Then";
if ([_m1 Size]>0) { 
 //BA.debugLineNum = 59;BA.debugLine="For Each v1 As String In m1.Values";
{
const id<B4IIterable> group8 = [_m1 Values];
const int groupLen8 = group8.Size
;int index8 = 0;
;
for (; index8 < groupLen8;index8++){
_v1 = [self.bi ObjectToString:[group8 Get:index8]];
 //BA.debugLineNum = 60;BA.debugLine="Dim te As Map";
_te = [B4IMap new];
 //BA.debugLineNum = 61;BA.debugLine="Dim j As JSONParser";
_j = [B4IJSONParser new];
 //BA.debugLineNum = 62;BA.debugLine="j.Initialize(v1)";
[_j Initialize:_v1];
 //BA.debugLineNum = 63;BA.debugLine="te = j.NextObject";
_te = [_j NextObject];
 //BA.debugLineNum = 64;BA.debugLine="l1.Add(te)";
[_l1 Add:(NSObject*)(_te)];
 }
};
 //BA.debugLineNum = 66;BA.debugLine="Return l1";
if (true) return _l1;
 };
 };
 //BA.debugLineNum = 70;BA.debugLine="Return l1";
if (true) return _l1;
 //BA.debugLineNum = 72;BA.debugLine="End Sub";
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
self._cachedata=[b4i_cachedata new];
self._dateutils=[b4i_dateutils new];
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="End Sub";
return @"";
}
@end
