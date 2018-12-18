
#import "b4i_html.h"
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


@implementation b4i_html 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_html) instance released.");
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
 //BA.debugLineNum = 2;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 4;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _fromhtml:(NSString*) _text{
NSString* _s = @"";
 //BA.debugLineNum = 11;BA.debugLine="Sub FromHtml(Text As String) As String";
 //BA.debugLineNum = 13;BA.debugLine="Try";
@try { //BA.debugLineNum = 14;BA.debugLine="Dim s As String";
_s = @"";
 //BA.debugLineNum = 15;BA.debugLine="s = Regex.Replace(\"<.*?>\",Text,\"\")";
_s = [[self.__c Regex] Replace:@"<.*?>" :_text :@""];
 //BA.debugLineNum = 16;BA.debugLine="s = s.Replace(\"&nbsp;\",\" \").Replace(\"&amp;\",\"&\")";
_s = [[_s Replace:@"&nbsp;" :@" "] Replace:@"&amp;" :@"&"];
 //BA.debugLineNum = 17;BA.debugLine="Return s";
if (true) return _s;
 } 
       @catch (NSException* e7) {
			[B4I SetException:e7]; //BA.debugLineNum = 19;BA.debugLine="Return Text";
if (true) return _text;
 };
 //BA.debugLineNum = 22;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba{
[self initializeClassModule];
 //BA.debugLineNum = 7;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return @"";
}
@end
