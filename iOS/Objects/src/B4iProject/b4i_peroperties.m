
#import "b4i_peroperties.h"
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
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"


@implementation b4i_peroperties 


+ (instancetype)new {
    static b4i_peroperties* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _getappname{
B4INativeObject* _no = nil;
NSObject* _name = nil;
 //BA.debugLineNum = 49;BA.debugLine="Sub GetAppName As String";
 //BA.debugLineNum = 51;BA.debugLine="Dim no As NativeObject";
_no = [B4INativeObject new];
 //BA.debugLineNum = 52;BA.debugLine="no = no.Initialize(\"NSBundle\").RunMethod(\"mainB";
_no = [[_no Initialize:@"NSBundle"] RunMethod:@"mainBundle" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 53;BA.debugLine="Dim name As Object = no.RunMethod(\"objectForInf";
_name = (NSObject*)(([_no RunMethod:@"objectForInfoDictionaryKey:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@"CFBundleDisplayName")]]]]).object);
 //BA.debugLineNum = 54;BA.debugLine="Return name";
if (true) return [self.bi ObjectToString:_name];
 //BA.debugLineNum = 55;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getdevicemodel{
B4INativeObject* _device = nil;
NSObject* _name = nil;
 //BA.debugLineNum = 17;BA.debugLine="Sub GetDeviceModel As String";
 //BA.debugLineNum = 19;BA.debugLine="Dim device As NativeObject";
_device = [B4INativeObject new];
 //BA.debugLineNum = 20;BA.debugLine="device = device.Initialize(\"UIDevice\").RunMeth";
_device = [[_device Initialize:@"UIDevice"] RunMethod:@"currentDevice" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 21;BA.debugLine="Dim name As Object = device.GetField(\"model\").";
_name = (NSObject*)([[_device GetField:@"model"] AsString]);
 //BA.debugLineNum = 22;BA.debugLine="Return name";
if (true) return [self.bi ObjectToString:_name];
 //BA.debugLineNum = 23;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getdevicename{
B4INativeObject* _device = nil;
NSObject* _name = nil;
 //BA.debugLineNum = 25;BA.debugLine="Sub GetDeviceName As String";
 //BA.debugLineNum = 27;BA.debugLine="Dim device As NativeObject";
_device = [B4INativeObject new];
 //BA.debugLineNum = 28;BA.debugLine="device = device.Initialize(\"UIDevice\").RunMeth";
_device = [[_device Initialize:@"UIDevice"] RunMethod:@"currentDevice" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 29;BA.debugLine="Dim name As Object = device.GetField(\"name\").A";
_name = (NSObject*)([[_device GetField:@"name"] AsString]);
 //BA.debugLineNum = 30;BA.debugLine="Return name";
if (true) return [self.bi ObjectToString:_name];
 //BA.debugLineNum = 31;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getdevicesystemname{
B4INativeObject* _device = nil;
NSObject* _name = nil;
 //BA.debugLineNum = 9;BA.debugLine="Sub GetDeviceSystemName As String";
 //BA.debugLineNum = 11;BA.debugLine="Dim device As NativeObject";
_device = [B4INativeObject new];
 //BA.debugLineNum = 12;BA.debugLine="device = device.Initialize(\"UIDevice\").RunMeth";
_device = [[_device Initialize:@"UIDevice"] RunMethod:@"currentDevice" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 13;BA.debugLine="Dim name As Object = device.GetField(\"systemNa";
_name = (NSObject*)([[_device GetField:@"systemName"] AsString]);
 //BA.debugLineNum = 14;BA.debugLine="Return name";
if (true) return [self.bi ObjectToString:_name];
 //BA.debugLineNum = 15;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getimei{
B4INativeObject* _device = nil;
NSString* _name = @"";
 //BA.debugLineNum = 33;BA.debugLine="Sub GetIMEI As String";
 //BA.debugLineNum = 35;BA.debugLine="Dim device As NativeObject";
_device = [B4INativeObject new];
 //BA.debugLineNum = 36;BA.debugLine="device = device.Initialize(\"UIDevice\").RunMeth";
_device = [[_device Initialize:@"UIDevice"] RunMethod:@"currentDevice" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 37;BA.debugLine="Dim name As String = device.GetField(\"identifi";
_name = [[_device GetField:@"identifierForVendor"] AsString];
 //BA.debugLineNum = 38;BA.debugLine="Return name";
if (true) return _name;
 //BA.debugLineNum = 39;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getpackagename{
B4INativeObject* _no = nil;
NSObject* _name = nil;
 //BA.debugLineNum = 41;BA.debugLine="Sub GetPackageName As String";
 //BA.debugLineNum = 43;BA.debugLine="Dim no As NativeObject";
_no = [B4INativeObject new];
 //BA.debugLineNum = 44;BA.debugLine="no = no.Initialize(\"NSBundle\").RunMethod(\"mainB";
_no = [[_no Initialize:@"NSBundle"] RunMethod:@"mainBundle" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 45;BA.debugLine="Dim name As Object = no.RunMethod(\"objectForInf";
_name = (NSObject*)(([_no RunMethod:@"objectForInfoDictionaryKey:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@"CFBundleIdentifier")]]]]).object);
 //BA.debugLineNum = 46;BA.debugLine="Return name";
if (true) return [self.bi ObjectToString:_name];
 //BA.debugLineNum = 47;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getvendoridentifier{
B4INativeObject* _no = nil;
NSObject* _id = nil;
 //BA.debugLineNum = 64;BA.debugLine="Sub GetVendorIdentifier As String";
 //BA.debugLineNum = 65;BA.debugLine="Dim no As NativeObject";
_no = [B4INativeObject new];
 //BA.debugLineNum = 66;BA.debugLine="no = no.Initialize(\"UIDevice\").RunMethod(\"curre";
_no = [[_no Initialize:@"UIDevice"] RunMethod:@"currentDevice" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 67;BA.debugLine="Dim id As Object = no.GetField(\"identifierForVe";
_id = (NSObject*)(([[_no GetField:@"identifierForVendor"] GetField:@"UUIDString"]).object);
 //BA.debugLineNum = 68;BA.debugLine="Return id";
if (true) return [self.bi ObjectToString:_id];
 //BA.debugLineNum = 69;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getversion{
B4INativeObject* _no = nil;
NSObject* _name = nil;
 //BA.debugLineNum = 57;BA.debugLine="Sub GetVersion As String";
 //BA.debugLineNum = 58;BA.debugLine="Dim no As NativeObject";
_no = [B4INativeObject new];
 //BA.debugLineNum = 59;BA.debugLine="no = no.Initialize(\"NSBundle\").RunMethod(\"mainB";
_no = [[_no Initialize:@"NSBundle"] RunMethod:@"mainBundle" :(B4IArray*)([self.__c Null])];
 //BA.debugLineNum = 60;BA.debugLine="Dim name As Object = no.RunMethod(\"objectForInf";
_name = (NSObject*)(([_no RunMethod:@"objectForInfoDictionaryKey:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@"CFBundleShortVersionString")]]]]).object);
 //BA.debugLineNum = 61;BA.debugLine="Return name";
if (true) return [self.bi ObjectToString:_name];
 //BA.debugLineNum = 62;BA.debugLine="End Sub";
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
self._actreview=[b4i_actreview new];
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="End Sub";
return @"";
}
@end
