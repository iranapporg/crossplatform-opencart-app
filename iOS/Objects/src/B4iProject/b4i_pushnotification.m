
#import "b4i_pushnotification.h"
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


@implementation b4i_pushnotification 


+ (instancetype)new {
    static b4i_pushnotification* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _checknewpushnotification:(NSString*) _data{
B4IJSONParser* _js = nil;
B4IMap* _temp = nil;
 //BA.debugLineNum = 7;BA.debugLine="Sub CheckNewPushNotification(Data As String)";
 //BA.debugLineNum = 9;BA.debugLine="Dim js As JSONParser";
_js = [B4IJSONParser new];
 //BA.debugLineNum = 11;BA.debugLine="Try";
@try { //BA.debugLineNum = 12;BA.debugLine="js.Initialize(Data)";
[_js Initialize:_data];
 //BA.debugLineNum = 14;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 15;BA.debugLine="temp = js.NextObject";
_temp = [_js NextObject];
 //BA.debugLineNum = 17;BA.debugLine="If File.Exists(File.DirLibrary,\"push3_\" & temp.G";
if ([[self.__c File] Exists:[[self.__c File] DirLibrary] :[@[@"push3_",[self.bi ObjectToString:[_temp Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""]]==[self.__c False]) { 
 //BA.debugLineNum = 18;BA.debugLine="File.WriteString(File.DirLibrary,\"push3_\" & tem";
[[self.__c File] WriteString:[[self.__c File] DirLibrary] :[@[@"push3_",[self.bi ObjectToString:[_temp Get:(NSObject*)(@"id")]]] componentsJoinedByString:@""] :@""];
 //BA.debugLineNum = 19;BA.debugLine="ShowPushNotification(temp.Get(\"body\"))";
[self _showpushnotification:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"body")]]];
 }else {
 //BA.debugLineNum = 21;BA.debugLine="Return";
if (true) return @"";
 };
 } 
       @catch (NSException* e13) {
			[B4I SetException:e13]; //BA.debugLineNum = 25;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 28;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 5;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _showpushnotification:(NSString*) _body{
B4INotificationWrapper* _ln = nil;
 //BA.debugLineNum = 30;BA.debugLine="Sub ShowPushNotification(Body As String)";
 //BA.debugLineNum = 32;BA.debugLine="Dim ln As Notification";
_ln = [B4INotificationWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="ln.Initialize(DateTime.Now + 1 * DateTime.TicksPe";
[_ln Initialize:(long long) ([[self.__c DateTime] Now]+1*[[self.__c DateTime] TicksPerSecond])];
 //BA.debugLineNum = 34;BA.debugLine="ln.IconBadgeNumber = 0";
[_ln setIconBadgeNumber:(int) (0)];
 //BA.debugLineNum = 35;BA.debugLine="ln.AlertBody = Library.GetStringResourse(\"push_su";
[_ln setAlertBody:[self._library _getstringresourse:@"push_subscribe"]];
 //BA.debugLineNum = 36;BA.debugLine="File.WriteString(File.DirLibrary,\"push\",Body)";
[[self.__c File] WriteString:[[self.__c File] DirLibrary] :@"push" :_body];
 //BA.debugLineNum = 37;BA.debugLine="ln.PlaySound = True";
[_ln setPlaySound:[self.__c True]];
 //BA.debugLineNum = 38;BA.debugLine="ln.Register";
[_ln Register];
 //BA.debugLineNum = 40;BA.debugLine="End Sub";
return @"";
}
@end
