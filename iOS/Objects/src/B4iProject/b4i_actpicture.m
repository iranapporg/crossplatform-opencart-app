
#import "b4i_actpicture.h"
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


@implementation b4i_actpicture 


+ (instancetype)new {
    static b4i_actpicture* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 84;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 85;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 86;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _imgclick_click{
B4IImageViewWrapper* _im = nil;
 //BA.debugLineNum = 75;BA.debugLine="Sub imgclick_Click";
 //BA.debugLineNum = 77;BA.debugLine="Dim im As ImageView";
_im = [B4IImageViewWrapper new];
 //BA.debugLineNum = 78;BA.debugLine="im = Sender";
_im.object = (UIImageView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 80;BA.debugLine="wb1.LoadHtml($\"<img width=\"100%\" src=\"${File.Comb";
[self._wb1 LoadHtml:([@[@"<img width=\"100%\" src=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)([[self.__c File] Combine:[[self.__c File] DirLibrary] :[self.bi ObjectToString:[_im Tag]]])],@"\" />"] componentsJoinedByString:@""])];
 //BA.debugLineNum = 82;BA.debugLine="End Sub";
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
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Private svH As ScrollView";
self._svh = [B4IScrollView new];
 //BA.debugLineNum = 5;BA.debugLine="Private svV As ScrollView";
self._svv = [B4IScrollView new];
 //BA.debugLineNum = 6;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Public link As String";
self._link = @"";
 //BA.debugLineNum = 8;BA.debugLine="Public images As List";
self._images = [B4IList new];
 //BA.debugLineNum = 9;BA.debugLine="Private wb1 As WebView";
self._wb1 = [B4IWebViewWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IPage* _pg = nil;
int _left = 0;
int _top = 0;
B4IMap* _images_1 = nil;
int _i = 0;
B4IImageViewWrapper* _img = nil;
NSString* _filename = @"";
b4i_imagedownloader* _download = nil;
 //BA.debugLineNum = 12;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 14;BA.debugLine="Dim pg As Page";
_pg = [B4IPage new];
 //BA.debugLineNum = 15;BA.debugLine="pg.Initialize(\"\")";
[_pg Initialize:self.bi :@""];
 //BA.debugLineNum = 16;BA.debugLine="pg.RootPanel.LoadLayout(\"frmpicture\")";
[[_pg RootPanel] LoadLayout:@"frmpicture" :self.bi];
 //BA.debugLineNum = 17;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((_pg).object)];
 //BA.debugLineNum = 19;BA.debugLine="pg.RootPanel.Color = Colors.White";
[[_pg RootPanel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 20;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 22;BA.debugLine="svH.BringToFront";
[self._svh BringToFront];
 //BA.debugLineNum = 23;BA.debugLine="btnclose.BringToFront";
[self._btnclose BringToFront];
 //BA.debugLineNum = 24;BA.debugLine="svV.BringToFront";
[self._svv BringToFront];
 //BA.debugLineNum = 26;BA.debugLine="Dim left,top As Int = 10";
_left = 0;
_top = (int) (10);
 //BA.debugLineNum = 27;BA.debugLine="left = 20";
_left = (int) (20);
 //BA.debugLineNum = 29;BA.debugLine="svH.Panel.Color = Colors.Transparent";
[[self._svh Panel] setColor:[[self.__c Colors] Transparent]];
 //BA.debugLineNum = 31;BA.debugLine="Dim images_1 As Map";
_images_1 = [B4IMap new];
 //BA.debugLineNum = 32;BA.debugLine="images_1.Initialize";
[_images_1 Initialize];
 //BA.debugLineNum = 34;BA.debugLine="For i = 0 To images.Size - 1";
{
const int step15 = 1;
const int limit15 = (int) ([self._images Size]-1);
_i = (int) (0) ;
for (;(step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15) ;_i = ((int)(0 + _i + step15))  ) {
 //BA.debugLineNum = 36;BA.debugLine="Dim link As String";
self._link = @"";
 //BA.debugLineNum = 37;BA.debugLine="link = images.Get(i)";
self._link = [self.bi ObjectToString:[self._images Get:_i]];
 //BA.debugLineNum = 39;BA.debugLine="Dim img As ImageView";
_img = [B4IImageViewWrapper new];
 //BA.debugLineNum = 40;BA.debugLine="img.Initialize(\"imgclick\")";
[_img Initialize:self.bi :@"imgclick"];
 //BA.debugLineNum = 42;BA.debugLine="If Library.getHeight > Library.GetWidth Then";
if ([self._library _getheight]>[self._library _getwidth]) { 
 //BA.debugLineNum = 43;BA.debugLine="svH.Panel.AddView(img,left,0,svH.Height-10,svH.";
[[self._svh Panel] AddView:(UIView*)((_img).object) :(float) (_left) :(float) (0) :(float) ([self._svh Height]-10) :(float) ([self._svh Height]-10)];
 //BA.debugLineNum = 44;BA.debugLine="left = left + svH.Height + 4dip";
_left = (int) (_left+[self._svh Height]+[self.__c DipToCurrent:(int) (4)]);
 }else {
 //BA.debugLineNum = 46;BA.debugLine="svV.Panel.AddView(img,0,top,svV.Width-10,svV.Wi";
[[self._svv Panel] AddView:(UIView*)((_img).object) :(float) (0) :(float) (_top) :(float) ([self._svv Width]-10) :(float) ([self._svv Width]-10)];
 //BA.debugLineNum = 47;BA.debugLine="top = top + svV.Width + 4dip";
_top = (int) (_top+[self._svv Width]+[self.__c DipToCurrent:(int) (4)]);
 };
 //BA.debugLineNum = 50;BA.debugLine="Dim filename As String";
_filename = @"";
 //BA.debugLineNum = 51;BA.debugLine="filename = Library.GetFilename(link)";
_filename = [self._library _getfilename:self._link];
 //BA.debugLineNum = 53;BA.debugLine="images_1.Put(img,link)";
[_images_1 Put:(NSObject*)((_img).object) :(NSObject*)(self._link)];
 //BA.debugLineNum = 55;BA.debugLine="img.Tag = filename";
[_img setTag:(NSObject*)(_filename)];
 //BA.debugLineNum = 57;BA.debugLine="If i = 0 Then";
if (_i==0) { 
 //BA.debugLineNum = 58;BA.debugLine="wb1.LoadHtml($\"<img width=\"100%\" src=\"${File.Co";
[self._wb1 LoadHtml:([@[@"<img width=\"100%\" src=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)([[self.__c File] Combine:[[self.__c File] DirLibrary] :_filename])],@"\" />"] componentsJoinedByString:@""])];
 };
 }
};
 //BA.debugLineNum = 63;BA.debugLine="Dim download As ImageDownloader";
_download = [b4i_imagedownloader new];
 //BA.debugLineNum = 64;BA.debugLine="download.Initialize";
[_download _initialize:self.bi];
 //BA.debugLineNum = 65;BA.debugLine="download.Download(images_1)";
[_download _download:_images_1];
 //BA.debugLineNum = 67;BA.debugLine="svH.Panel.Width = left";
[[self._svh Panel] setWidth:(float) (_left)];
 //BA.debugLineNum = 68;BA.debugLine="svH.ContentWidth = left";
[self._svh setContentWidth:_left];
 //BA.debugLineNum = 69;BA.debugLine="svH.ContentHeight = svH.Height";
[self._svh setContentHeight:(int) ([self._svh Height])];
 //BA.debugLineNum = 70;BA.debugLine="svV.Panel.Height = top";
[[self._svv Panel] setHeight:(float) (_top)];
 //BA.debugLineNum = 71;BA.debugLine="svV.ContentHeight = top";
[self._svv setContentHeight:_top];
 //BA.debugLineNum = 73;BA.debugLine="End Sub";
return @"";
}
@end
