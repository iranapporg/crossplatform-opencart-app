
#import "b4i_clspreferencemanager.h"
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


@implementation b4i_clspreferencemanager 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_clspreferencemanager) instance released.");
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
 //BA.debugLineNum = 8;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 9;BA.debugLine="Private sql1 As SQL";
self._sql1 = [B4ISQL new];
 //BA.debugLineNum = 10;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _close{
 //BA.debugLineNum = 115;BA.debugLine="Public Sub Close";
 //BA.debugLineNum = 116;BA.debugLine="sql1.Close";
[self._sql1 Close];
 //BA.debugLineNum = 117;BA.debugLine="End Sub";
return @"";
}
- (BOOL)  _complete:(BOOL) _success{
 //BA.debugLineNum = 104;BA.debugLine="Private Sub complete(success As Boolean) As Boolea";
 //BA.debugLineNum = 105;BA.debugLine="If success Then";
if (_success) { 
 //BA.debugLineNum = 106;BA.debugLine="sql1.TransactionSuccessful";
[self._sql1 TransactionSuccessful];
 }else {
 //BA.debugLineNum = 108;BA.debugLine="Log(\"Error saving object: \" & LastException)";
[self.__c Log:[@[@"Error saving object: ",[self.bi ObjectToString:[self.__c LastException]]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 109;BA.debugLine="sql1.Rollback";
[self._sql1 Rollback];
 };
 //BA.debugLineNum = 111;BA.debugLine="Return success";
if (true) return _success;
 //BA.debugLineNum = 112;BA.debugLine="End Sub";
return false;
}
- (NSString*)  _createtable{
 //BA.debugLineNum = 46;BA.debugLine="Private Sub CreateTable";
 //BA.debugLineNum = 47;BA.debugLine="sql1.ExecNonQuery(\"CREATE TABLE IF NOT EXISTS mai";
[self._sql1 ExecNonQuery:@"CREATE TABLE IF NOT EXISTS main(key TEXT PRIMARY KEY, value NONE)"];
 //BA.debugLineNum = 48;BA.debugLine="End Sub";
return @"";
}
- (B4IMap*)  _getall{
B4IResultSet* _c = nil;
B4IMap* _res = nil;
 //BA.debugLineNum = 35;BA.debugLine="Public Sub GetAll As Map";
 //BA.debugLineNum = 36;BA.debugLine="Dim c As ResultSet= sql1.ExecQuery(\"SELECT * FROM";
_c = [self._sql1 ExecQuery:@"SELECT * FROM main"];
 //BA.debugLineNum = 37;BA.debugLine="Dim res As Map";
_res = [B4IMap new];
 //BA.debugLineNum = 38;BA.debugLine="res.Initialize";
[_res Initialize];
 //BA.debugLineNum = 39;BA.debugLine="Do While c.NextRow";
while ([_c NextRow]) {
 //BA.debugLineNum = 40;BA.debugLine="res.put(c.GetString2(0),c.GetString2(1))";
[_res Put:(NSObject*)([_c GetString2:(int) (0)]) :(NSObject*)([_c GetString2:(int) (1)])];
 }
;
 //BA.debugLineNum = 42;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 43;BA.debugLine="End Sub";
return nil;
}
- (BOOL)  _getboolean:(NSString*) _key{
 //BA.debugLineNum = 23;BA.debugLine="Public Sub GetBoolean(key As String) As Boolean";
 //BA.debugLineNum = 24;BA.debugLine="Return GetSimpleBoolean(key)";
if (true) return [self _getsimpleboolean:_key];
 //BA.debugLineNum = 25;BA.debugLine="End Sub";
return false;
}
- (B4IResultSet*)  _getcursor:(NSString*) _key{
 //BA.debugLineNum = 50;BA.debugLine="Private Sub getCursor(Key As String) As ResultSet";
 //BA.debugLineNum = 51;BA.debugLine="Return sql1.ExecQuery2(\"SELECT value FROM main WH";
if (true) return [self._sql1 ExecQuery2:@"SELECT value FROM main WHERE key = ?" :[self.bi ArrayToList:[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:_key]]]]];
 //BA.debugLineNum = 52;BA.debugLine="End Sub";
return nil;
}
- (BOOL)  _getsimpleboolean:(NSString*) _key{
B4IResultSet* _c = nil;
NSString* _res = @"";
 //BA.debugLineNum = 68;BA.debugLine="Private Sub GetSimpleBoolean(Key As String) As Boo";
 //BA.debugLineNum = 69;BA.debugLine="Dim c As ResultSet = getCursor(Key)";
_c = [self _getcursor:_key];
 //BA.debugLineNum = 70;BA.debugLine="If c.NextRow = False Then";
if ([_c NextRow]==[self.__c False]) { 
 //BA.debugLineNum = 71;BA.debugLine="c.Close";
[_c Close];
 //BA.debugLineNum = 72;BA.debugLine="Return \"\"";
if (true) return [self.bi ObjectToBoolean:@""];
 };
 //BA.debugLineNum = 74;BA.debugLine="Dim res As String = c.GetString2(0)";
_res = [_c GetString2:(int) (0)];
 //BA.debugLineNum = 75;BA.debugLine="c.Close";
[_c Close];
 //BA.debugLineNum = 76;BA.debugLine="If res = 1 Then";
if ([_res isEqual:[self.bi NumberToString:@(1)]]) { 
 //BA.debugLineNum = 77;BA.debugLine="Return True";
if (true) return [self.__c True];
 }else {
 //BA.debugLineNum = 79;BA.debugLine="Return False";
if (true) return [self.__c False];
 };
 //BA.debugLineNum = 81;BA.debugLine="End Sub";
return false;
}
- (NSString*)  _getsimplestring:(NSString*) _key{
B4IResultSet* _c = nil;
NSString* _res = @"";
 //BA.debugLineNum = 55;BA.debugLine="Private Sub GetSimpleString(Key As String) As Stri";
 //BA.debugLineNum = 56;BA.debugLine="Dim c As ResultSet = getCursor(Key)";
_c = [self _getcursor:_key];
 //BA.debugLineNum = 57;BA.debugLine="If c.NextRow = False Then";
if ([_c NextRow]==[self.__c False]) { 
 //BA.debugLineNum = 58;BA.debugLine="c.Close";
[_c Close];
 //BA.debugLineNum = 59;BA.debugLine="Return \"\"";
if (true) return @"";
 };
 //BA.debugLineNum = 61;BA.debugLine="Dim res As String = c.GetString2(0)";
_res = [_c GetString2:(int) (0)];
 //BA.debugLineNum = 63;BA.debugLine="c.Close";
[_c Close];
 //BA.debugLineNum = 64;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 65;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getstring:(NSString*) _key{
 //BA.debugLineNum = 31;BA.debugLine="Public Sub GetString(key As String) As String";
 //BA.debugLineNum = 32;BA.debugLine="Return GetSimpleString(key)";
if (true) return [self _getsimplestring:_key];
 //BA.debugLineNum = 33;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba{
[self initializeClassModule];
 //BA.debugLineNum = 13;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 14;BA.debugLine="If sql1.IsInitialized Then sql1.Close";
if ([self._sql1 IsInitialized]) { 
[self._sql1 Close];};
 //BA.debugLineNum = 15;BA.debugLine="sql1.Initialize(File.DirLibrary, \"pm.dat\", True)";
[self._sql1 Initialize:[[self.__c File] DirLibrary] :@"pm.dat" :[self.__c True]];
 //BA.debugLineNum = 16;BA.debugLine="CreateTable";
[self _createtable];
 //BA.debugLineNum = 17;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _insertquery:(NSString*) _key :(NSObject*) _value{
 //BA.debugLineNum = 100;BA.debugLine="Private Sub insertQuery(Key As String, Value As Ob";
 //BA.debugLineNum = 101;BA.debugLine="sql1.ExecNonQuery2(\"INSERT INTO main VALUES(?, ?)";
[self._sql1 ExecNonQuery2:@"INSERT INTO main VALUES(?, ?)" :[self.bi ArrayToList:[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(_key)],[B4I nilToNSNull:_value]]]]];
 //BA.debugLineNum = 102;BA.debugLine="End Sub";
return @"";
}
- (BOOL)  _putsimple:(NSString*) _key :(NSObject*) _value{
 //BA.debugLineNum = 85;BA.debugLine="Private Sub PutSimple(Key As String, Value As Obje";
 //BA.debugLineNum = 86;BA.debugLine="Try";
@try { //BA.debugLineNum = 87;BA.debugLine="start(Key)";
[self _start:_key];
 //BA.debugLineNum = 88;BA.debugLine="insertQuery(Key, Value)";
[self _insertquery:_key :_value];
 //BA.debugLineNum = 89;BA.debugLine="Return complete(True)";
if (true) return [self _complete:[self.__c True]];
 } 
       @catch (NSException* e6) {
			[B4I SetException:e6]; //BA.debugLineNum = 91;BA.debugLine="Return complete(False)";
if (true) return [self _complete:[self.__c False]];
 };
 //BA.debugLineNum = 93;BA.debugLine="End Sub";
return false;
}
- (NSString*)  _setboolean:(NSString*) _key :(BOOL) _value{
 //BA.debugLineNum = 19;BA.debugLine="Public Sub SetBoolean(key As String, value As Bool";
 //BA.debugLineNum = 20;BA.debugLine="PutSimple(key, value)";
[self _putsimple:_key :(NSObject*)(@(_value))];
 //BA.debugLineNum = 21;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setstring:(NSString*) _key :(NSString*) _value{
 //BA.debugLineNum = 27;BA.debugLine="Public Sub SetString(key As String, value As Strin";
 //BA.debugLineNum = 28;BA.debugLine="PutSimple(key, value)";
[self _putsimple:_key :(NSObject*)(_value)];
 //BA.debugLineNum = 29;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _start:(NSString*) _key{
 //BA.debugLineNum = 95;BA.debugLine="Private Sub start (Key As String)";
 //BA.debugLineNum = 96;BA.debugLine="sql1.BeginTransaction";
[self._sql1 BeginTransaction];
 //BA.debugLineNum = 97;BA.debugLine="sql1.ExecNonQuery2(\"DELETE FROM main WHERE key =";
[self._sql1 ExecNonQuery2:@"DELETE FROM main WHERE key = ?" :[self.bi ArrayToList:[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(_key)]]]]];
 //BA.debugLineNum = 98;BA.debugLine="End Sub";
return @"";
}
@end
