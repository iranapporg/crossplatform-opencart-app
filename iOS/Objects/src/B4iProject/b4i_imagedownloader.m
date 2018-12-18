
#import "b4i_imagedownloader.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
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
#import "b4i_peroperties.h"


@implementation b4i_imagedownloader 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_imagedownloader) instance released.");
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
 //BA.debugLineNum = 3;BA.debugLine="Private tasks As Map";
self._tasks = [B4IMap new];
 //BA.debugLineNum = 4;BA.debugLine="Private ongoingTasks As Map";
self._ongoingtasks = [B4IMap new];
 //BA.debugLineNum = 5;BA.debugLine="Private setting As Settings";
self._setting = [B4ISettings new];
 //BA.debugLineNum = 6;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _download:(B4IMap*) _imageviewsmap{
B4IImageViewWrapper* _iv = nil;
NSString* _link = @"";
b4i_httpjob* _j = nil;
 //BA.debugLineNum = 14;BA.debugLine="Public Sub Download (ImageViewsMap As Map)";
 //BA.debugLineNum = 15;BA.debugLine="For Each iv As ImageView In ImageViewsMap.Keys";
_iv = [B4IImageViewWrapper new];
{
const id<B4IIterable> group1 = [_imageviewsmap Keys];
const int groupLen1 = group1.Size
;int index1 = 0;
;
for (; index1 < groupLen1;index1++){
_iv.object = (UIImageView*)([group1 Get:index1]);
 //BA.debugLineNum = 16;BA.debugLine="Dim link As String = ImageViewsMap.Get(iv)";
_link = [self.bi ObjectToString:[_imageviewsmap Get:(NSObject*)((_iv).object)]];
 //BA.debugLineNum = 17;BA.debugLine="tasks.Put(iv, link)";
[self._tasks Put:(NSObject*)((_iv).object) :(NSObject*)(_link)];
 //BA.debugLineNum = 18;BA.debugLine="If ongoingTasks.ContainsKey(link) = False Then";
if ([self._ongoingtasks ContainsKey:(NSObject*)(_link)]==[self.__c False]) { 
 //BA.debugLineNum = 20;BA.debugLine="If File.Exists(File.DirLibrary,Library.GetFilen";
if ([[self.__c File] Exists:[[self.__c File] DirLibrary] :[self._library _getfilename:_link]]) { 
 //BA.debugLineNum = 21;BA.debugLine="iv.Bitmap = ResizeBitmap(LoadBitmap(File.DirLi";
[_iv setBitmap:[self _resizebitmap:[self.__c LoadBitmap:[[self.__c File] DirLibrary] :[self._library _getfilename:_link]] :(float) (1.5)]];
 }else {
 //BA.debugLineNum = 23;BA.debugLine="ongoingTasks.Put(link, \"\")";
[self._ongoingtasks Put:(NSObject*)(_link) :(NSObject*)(@"")];
 //BA.debugLineNum = 24;BA.debugLine="Dim j As HttpJob";
_j = [b4i_httpjob new];
 //BA.debugLineNum = 25;BA.debugLine="j.Initialize(link, Me)";
[_j _initialize:self.bi :_link :self];
 //BA.debugLineNum = 26;BA.debugLine="j.Download(link.Replace(\" \",\"%20\"))";
[_j _download:[_link Replace:@" " :@"%20"]];
 };
 };
 }
};
 //BA.debugLineNum = 31;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getfileext:(NSString*) _fullpath{
 //BA.debugLineNum = 67;BA.debugLine="Sub GetFileExt(FullPath As String) As String";
 //BA.debugLineNum = 68;BA.debugLine="Return FullPath.SubString(FullPath.LastIndexOf(\"";
if (true) return [_fullpath SubString:(int) ([_fullpath LastIndexOf:@"."]+1)];
 //BA.debugLineNum = 69;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba{
[self initializeClassModule];
 //BA.debugLineNum = 8;BA.debugLine="Public Sub Initialize";
 //BA.debugLineNum = 9;BA.debugLine="tasks.Initialize";
[self._tasks Initialize];
 //BA.debugLineNum = 10;BA.debugLine="setting.Initialize";
[self._setting Initialize];
 //BA.debugLineNum = 11;BA.debugLine="ongoingTasks.Initialize";
[self._ongoingtasks Initialize];
 //BA.debugLineNum = 12;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _jobdone:(b4i_httpjob*) _job{
B4IBitmap* _bmp = nil;
B4IImageViewWrapper* _iv = nil;
NSString* _link = @"";
 //BA.debugLineNum = 33;BA.debugLine="Private Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 35;BA.debugLine="ongoingTasks.Remove(Job.JobName)";
[self._ongoingtasks Remove:(NSObject*)(_job._jobname)];
 //BA.debugLineNum = 37;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 38;BA.debugLine="Dim bmp As Bitmap = Job.GetBitmap";
_bmp = [B4IBitmap new];
_bmp = [_job _getbitmap];
 //BA.debugLineNum = 39;BA.debugLine="If tasks.IsInitialized Then";
if ([self._tasks IsInitialized]) { 
 //BA.debugLineNum = 40;BA.debugLine="For Each iv As ImageView In tasks.Keys";
_iv = [B4IImageViewWrapper new];
{
const id<B4IIterable> group5 = [self._tasks Keys];
const int groupLen5 = group5.Size
;int index5 = 0;
;
for (; index5 < groupLen5;index5++){
_iv.object = (UIImageView*)([group5 Get:index5]);
 //BA.debugLineNum = 41;BA.debugLine="Dim link As String = tasks.Get(iv)";
_link = [self.bi ObjectToString:[self._tasks Get:(NSObject*)((_iv).object)]];
 //BA.debugLineNum = 42;BA.debugLine="If link = Job.JobName Then";
if ([_link isEqual:_job._jobname]) { 
 //BA.debugLineNum = 43;BA.debugLine="tasks.Remove(iv)";
[self._tasks Remove:(NSObject*)((_iv).object)];
 //BA.debugLineNum = 44;BA.debugLine="iv.Bitmap = bmp";
[_iv setBitmap:_bmp];
 //BA.debugLineNum = 45;BA.debugLine="If setting.GetBoolean(\"cache\") = False Then";
if ([self._setting GetBoolean:@"cache"]==[self.__c False]) { 
 //BA.debugLineNum = 46;BA.debugLine="SavePicture(bmp,Library.GetFilename(Job.JobN";
[self _savepicture:_bmp :[self._library _getfilename:_job._jobname]];
 };
 };
 }
};
 };
 }else {
 //BA.debugLineNum = 52;BA.debugLine="Log(\"Error downloading image: \" & Job.JobName &";
[self.__c Log:[@[@"Error downloading image: ",_job._jobname,[self.__c CRLF],_job._errormessage] componentsJoinedByString:@""]];
 };
 //BA.debugLineNum = 55;BA.debugLine="Job.Release";
[_job _release];
 //BA.debugLineNum = 57;BA.debugLine="End Sub";
return @"";
}
- (B4IBitmap*)  _resizebitmap:(B4IBitmap*) _bmp :(float) _scale{
B4IImageViewWrapper* _img = nil;
B4ICanvas* _cvs = nil;
B4IBitmap* _res = nil;
 //BA.debugLineNum = 71;BA.debugLine="Sub ResizeBitmap(bmp As Bitmap, scale As Float) As";
 //BA.debugLineNum = 72;BA.debugLine="Dim img As ImageView";
_img = [B4IImageViewWrapper new];
 //BA.debugLineNum = 73;BA.debugLine="img.Initialize(\"\")";
[_img Initialize:self.bi :@""];
 //BA.debugLineNum = 74;BA.debugLine="img.Width = bmp.Width * scale";
[_img setWidth:(float) ([_bmp Width]*_scale)];
 //BA.debugLineNum = 75;BA.debugLine="img.Height = bmp.Height * scale";
[_img setHeight:(float) ([_bmp Height]*_scale)];
 //BA.debugLineNum = 76;BA.debugLine="Dim cvs As Canvas";
_cvs = [B4ICanvas new];
 //BA.debugLineNum = 77;BA.debugLine="cvs.Initialize(img)";
[_cvs Initialize:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_img).object)]];
 //BA.debugLineNum = 78;BA.debugLine="cvs.DrawBitmap(bmp, cvs.TargetRect)";
[_cvs DrawBitmap:_bmp :[_cvs TargetRect]];
 //BA.debugLineNum = 79;BA.debugLine="Dim res As Bitmap = cvs.CreateBitmap";
_res = [B4IBitmap new];
_res = [_cvs CreateBitmap];
 //BA.debugLineNum = 80;BA.debugLine="cvs.Release";
[_cvs Release];
 //BA.debugLineNum = 81;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 82;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _savepicture:(B4IBitmap*) _b1 :(NSString*) _filename{
B4IOutputStream* _out = nil;
 //BA.debugLineNum = 59;BA.debugLine="Sub SavePicture(b1 As Bitmap,filename As String)";
 //BA.debugLineNum = 60;BA.debugLine="Dim out As OutputStream";
_out = [B4IOutputStream new];
 //BA.debugLineNum = 61;BA.debugLine="out = File.OpenOutput(File.DirLibrary,filename,Fa";
_out = [[self.__c File] OpenOutput:[[self.__c File] DirLibrary] :_filename :[self.__c False]];
 //BA.debugLineNum = 62;BA.debugLine="b1.WriteToStream(out,100,\"PNG\")";
[_b1 WriteToStream:_out :(int) (100) :@"PNG"];
 //BA.debugLineNum = 63;BA.debugLine="out.Close";
[_out Close];
 //BA.debugLineNum = 64;BA.debugLine="End Sub";
return @"";
}
@end
