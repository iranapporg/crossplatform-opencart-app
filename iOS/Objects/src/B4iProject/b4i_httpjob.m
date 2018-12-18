
#import "b4i_httpjob.h"
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

@implementation _multipartfiledata
-(void)Initialize{
self.IsInitialized = true;
self.Dir = @"";
self.FileName = @"";
self.KeyName = @"";
self.ContentType = @"";
}
- (NSString*)description {
return [B4I TypeToString:self :false];}
@end

@implementation b4i_httpjob 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_httpjob) instance released.");
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
 //BA.debugLineNum = 3;BA.debugLine="Sub Class_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Public JobName As String";
self._jobname = @"";
 //BA.debugLineNum = 5;BA.debugLine="Public Success As Boolean";
self._success = false;
 //BA.debugLineNum = 6;BA.debugLine="Public Username, Password As String";
self._username = @"";
self._password = @"";
 //BA.debugLineNum = 7;BA.debugLine="Public ErrorMessage As String";
self._errormessage = @"";
 //BA.debugLineNum = 8;BA.debugLine="Private target As Object";
self._target = [NSObject new];
 //BA.debugLineNum = 9;BA.debugLine="Private req As HttpRequest";
self._req = [B4IHttpRequest new];
 //BA.debugLineNum = 10;BA.debugLine="Public Tag As Object";
self._tag = [NSObject new];
 //BA.debugLineNum = 11;BA.debugLine="Private res As HttpResponse";
self._res = [B4IHttpResponse new];
 //BA.debugLineNum = 12;BA.debugLine="Type MultipartFileData (Dir As String, FileName A";
;
 //BA.debugLineNum = 13;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _complete:(B4IHttpResponse*) _res1{
 //BA.debugLineNum = 117;BA.debugLine="Public Sub Complete (res1 As HttpResponse)";
 //BA.debugLineNum = 118;BA.debugLine="res = res1";
self._res = _res1;
 //BA.debugLineNum = 119;BA.debugLine="CallSub2(target, \"JobDone\", Me)";
[self.__c CallSub2:self.bi :self._target :@"JobDone" :self];
 //BA.debugLineNum = 120;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _download:(NSString*) _link{
 //BA.debugLineNum = 87;BA.debugLine="Public Sub Download(Link As String)";
 //BA.debugLineNum = 88;BA.debugLine="req.InitializeGet(Link)";
[self._req InitializeGet:_link];
 //BA.debugLineNum = 89;BA.debugLine="CallSubDelayed2(HttpUtils2Service, \"SubmitJob\", M";
[self.__c CallSubDelayed2:self.bi :(NSObject*)((self._httputils2service).object) :@"SubmitJob" :self];
 //BA.debugLineNum = 90;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _download2:(NSString*) _link :(B4IArray*) _parameters{
B4IStringBuilder* _sb = nil;
iStringUtils* _su = nil;
int _i = 0;
 //BA.debugLineNum = 96;BA.debugLine="Public Sub Download2(Link As String, Parameters()";
 //BA.debugLineNum = 97;BA.debugLine="Dim sb As StringBuilder";
_sb = [B4IStringBuilder new];
 //BA.debugLineNum = 98;BA.debugLine="sb.Initialize";
[_sb Initialize];
 //BA.debugLineNum = 99;BA.debugLine="sb.Append(Link)";
[_sb Append:_link];
 //BA.debugLineNum = 100;BA.debugLine="If Parameters.Length > 0 Then sb.Append(\"?\")";
if (_parameters.Length>0) { 
[_sb Append:@"?"];};
 //BA.debugLineNum = 101;BA.debugLine="Dim su As StringUtils";
_su = [iStringUtils new];
 //BA.debugLineNum = 102;BA.debugLine="For i = 0 To Parameters.Length - 1 Step 2";
{
const int step6 = (int) (2);
const int limit6 = (int) (_parameters.Length-1);
_i = (int) (0) ;
for (;(step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6) ;_i = ((int)(0 + _i + step6))  ) {
 //BA.debugLineNum = 103;BA.debugLine="If i > 0 Then sb.Append(\"&\")";
if (_i>0) { 
[_sb Append:@"&"];};
 //BA.debugLineNum = 104;BA.debugLine="sb.Append(su.EncodeUrl(Parameters(i), \"UTF8\")).A";
[[_sb Append:[_su EncodeUrl:((NSString*)[_parameters getObjectFast:_i]) :@"UTF8"]] Append:@"="];
 //BA.debugLineNum = 105;BA.debugLine="sb.Append(su.EncodeUrl(Parameters(i + 1), \"UTF8\"";
[_sb Append:[_su EncodeUrl:((NSString*)[_parameters getObjectFast:(int) (_i+1)]) :@"UTF8"]];
 }
};
 //BA.debugLineNum = 107;BA.debugLine="req.InitializeGet(sb.ToString)";
[self._req InitializeGet:[_sb ToString]];
 //BA.debugLineNum = 108;BA.debugLine="CallSubDelayed2(HttpUtils2Service, \"SubmitJob\", M";
[self.__c CallSubDelayed2:self.bi :(NSObject*)((self._httputils2service).object) :@"SubmitJob" :self];
 //BA.debugLineNum = 109;BA.debugLine="End Sub";
return @"";
}
- (B4IBitmap*)  _getbitmap{
B4IBitmap* _b = nil;
 //BA.debugLineNum = 138;BA.debugLine="Public Sub GetBitmap As Bitmap";
 //BA.debugLineNum = 139;BA.debugLine="Dim b As Bitmap";
_b = [B4IBitmap new];
 //BA.debugLineNum = 140;BA.debugLine="b.Initialize2(res.GetInputStream)";
[_b Initialize2:[self._res GetInputStream]];
 //BA.debugLineNum = 141;BA.debugLine="Return b";
if (true) return _b;
 //BA.debugLineNum = 142;BA.debugLine="End Sub";
return nil;
}
- (B4IInputStream*)  _getinputstream{
 //BA.debugLineNum = 144;BA.debugLine="Public Sub GetInputStream As InputStream";
 //BA.debugLineNum = 145;BA.debugLine="Return res.GetInputStream";
if (true) return [self._res GetInputStream];
 //BA.debugLineNum = 146;BA.debugLine="End Sub";
return nil;
}
- (B4IHttpRequest*)  _getrequest{
 //BA.debugLineNum = 112;BA.debugLine="Public Sub GetRequest As HttpRequest";
 //BA.debugLineNum = 113;BA.debugLine="Return req";
if (true) return self._req;
 //BA.debugLineNum = 114;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _getstring{
 //BA.debugLineNum = 128;BA.debugLine="Public Sub GetString As String";
 //BA.debugLineNum = 129;BA.debugLine="Return GetString2(\"UTF8\")";
if (true) return [self _getstring2:@"UTF8"];
 //BA.debugLineNum = 130;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getstring2:(NSString*) _encoding{
 //BA.debugLineNum = 133;BA.debugLine="Public Sub GetString2(Encoding As String) As Strin";
 //BA.debugLineNum = 134;BA.debugLine="Return res.GetString2(Encoding)";
if (true) return [self._res GetString2:_encoding];
 //BA.debugLineNum = 135;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize:(B4I*) _ba :(NSString*) _name :(NSObject*) _targetmodule{
[self initializeClassModule];
 //BA.debugLineNum = 18;BA.debugLine="Public Sub Initialize (Name As String, TargetModul";
 //BA.debugLineNum = 19;BA.debugLine="JobName = Name";
self._jobname = _name;
 //BA.debugLineNum = 20;BA.debugLine="target = TargetModule";
self._target = _targetmodule;
 //BA.debugLineNum = 21;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _postbytes:(NSString*) _link :(B4IArray*) _data{
 //BA.debugLineNum = 28;BA.debugLine="Public Sub PostBytes(Link As String, Data() As Byt";
 //BA.debugLineNum = 29;BA.debugLine="req.InitializePost2(Link, Data)";
[self._req InitializePost2:_link :_data];
 //BA.debugLineNum = 30;BA.debugLine="CallSubDelayed2(HttpUtils2Service, \"SubmitJob\", M";
[self.__c CallSubDelayed2:self.bi :(NSObject*)((self._httputils2service).object) :@"SubmitJob" :self];
 //BA.debugLineNum = 31;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _postfile:(NSString*) _link :(NSString*) _dir :(NSString*) _filename{
 //BA.debugLineNum = 81;BA.debugLine="Public Sub PostFile(Link As String, Dir As String,";
 //BA.debugLineNum = 82;BA.debugLine="req.InitializePost(Link, Dir, FileName)";
[self._req InitializePost:_link :_dir :_filename];
 //BA.debugLineNum = 83;BA.debugLine="CallSubDelayed2(HttpUtils2Service, \"SubmitJob\", M";
[self.__c CallSubDelayed2:self.bi :(NSObject*)((self._httputils2service).object) :@"SubmitJob" :self];
 //BA.debugLineNum = 84;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _postmultipart:(NSString*) _link :(B4IMap*) _namevalues :(B4IList*) _files{
NSString* _boundary = @"";
B4IOutputStream* _stream = nil;
B4IArray* _b = nil;
NSString* _eol = @"";
NSString* _key = @"";
NSString* _value = @"";
NSString* _s = @"";
_multipartfiledata* _fd = nil;
B4IInputStream* _in = nil;
 //BA.debugLineNum = 35;BA.debugLine="public Sub PostMultipart(Link As String, NameValue";
 //BA.debugLineNum = 36;BA.debugLine="Dim boundary As String = \"-----------------------";
_boundary = @"---------------------------1461124740692";
 //BA.debugLineNum = 37;BA.debugLine="Dim stream As OutputStream";
_stream = [B4IOutputStream new];
 //BA.debugLineNum = 38;BA.debugLine="stream.InitializeToBytesArray(0)";
[_stream InitializeToBytesArray:(int) (0)];
 //BA.debugLineNum = 39;BA.debugLine="Dim b() As Byte";
_b = [[B4IArray alloc]initBytes:@[@((int) (0))]];
 //BA.debugLineNum = 40;BA.debugLine="Dim eol As String = Chr(13) & Chr(10)";
_eol = [@[[self.bi CharToString:[self.__c Chr:(int) (13)]],[self.bi CharToString:[self.__c Chr:(int) (10)]]] componentsJoinedByString:@""];
 //BA.debugLineNum = 41;BA.debugLine="If NameValues <> Null And NameValues.IsInitialize";
if (_namevalues!= nil && [_namevalues IsInitialized]) { 
 //BA.debugLineNum = 42;BA.debugLine="For Each key As String In NameValues.Keys";
{
const id<B4IIterable> group7 = [_namevalues Keys];
const int groupLen7 = group7.Size
;int index7 = 0;
;
for (; index7 < groupLen7;index7++){
_key = [self.bi ObjectToString:[group7 Get:index7]];
 //BA.debugLineNum = 43;BA.debugLine="Dim value As String = NameValues.Get(key)";
_value = [self.bi ObjectToString:[_namevalues Get:(NSObject*)(_key)]];
 //BA.debugLineNum = 44;BA.debugLine="Dim s As String = _ $\"--${boundary} Content-Dis";
_s = ([@[@"--",[self.__c SmartStringFormatter:@"" :(NSObject*)(_boundary)],@"\n",@"Content-Disposition: form-data; name=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)(_key)],@"\"\n",@"\n",@"",[self.__c SmartStringFormatter:@"" :(NSObject*)(_value)],@"\n",@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 50;BA.debugLine="b = s.Replace(CRLF, eol).GetBytes(\"UTF8\")";
_b = [[_s Replace:[self.__c CRLF] :_eol] GetBytes:@"UTF8"];
 //BA.debugLineNum = 51;BA.debugLine="stream.WriteBytes(b, 0, b.Length)";
[_stream WriteBytes:_b :(int) (0) :_b.Length];
 }
};
 };
 //BA.debugLineNum = 54;BA.debugLine="If Files <> Null And Files.IsInitialized Then";
if (_files!= nil && [_files IsInitialized]) { 
 //BA.debugLineNum = 55;BA.debugLine="For Each fd As MultipartFileData In Files";
{
const id<B4IIterable> group15 = _files;
const int groupLen15 = group15.Size
;int index15 = 0;
;
for (; index15 < groupLen15;index15++){
_fd = (_multipartfiledata*)([group15 Get:index15]);
 //BA.debugLineNum = 56;BA.debugLine="Dim s As String = _ $\"--${boundary} Content-Dis";
_s = ([@[@"--",[self.__c SmartStringFormatter:@"" :(NSObject*)(_boundary)],@"\n",@"Content-Disposition: form-data; name=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)(_fd.KeyName)],@"\"; filename=\"",[self.__c SmartStringFormatter:@"" :(NSObject*)(_fd.FileName)],@"\"\n",@"Content-Type: ",[self.__c SmartStringFormatter:@"" :(NSObject*)(_fd.ContentType)],@"\n",@"\n",@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 62;BA.debugLine="b = s.Replace(CRLF, eol).GetBytes(\"UTF8\")";
_b = [[_s Replace:[self.__c CRLF] :_eol] GetBytes:@"UTF8"];
 //BA.debugLineNum = 63;BA.debugLine="stream.WriteBytes(b, 0, b.Length)";
[_stream WriteBytes:_b :(int) (0) :_b.Length];
 //BA.debugLineNum = 64;BA.debugLine="Dim in As InputStream = File.OpenInput(fd.Dir,";
_in = [B4IInputStream new];
_in = [[self.__c File] OpenInput:_fd.Dir :_fd.FileName];
 //BA.debugLineNum = 65;BA.debugLine="File.Copy2(in, stream)";
[[self.__c File] Copy2:_in :_stream];
 //BA.debugLineNum = 66;BA.debugLine="stream.WriteBytes(eol.GetBytes(\"utf8\"), 0, 2)";
[_stream WriteBytes:[_eol GetBytes:@"utf8"] :(int) (0) :(int) (2)];
 }
};
 };
 //BA.debugLineNum = 69;BA.debugLine="s = _ $\" --${boundary}-- \"$";
_s = ([@[@"\n",@"--",[self.__c SmartStringFormatter:@"" :(NSObject*)(_boundary)],@"--\n",@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 73;BA.debugLine="b = s.Replace(CRLF, eol).GetBytes(\"UTF8\")";
_b = [[_s Replace:[self.__c CRLF] :_eol] GetBytes:@"UTF8"];
 //BA.debugLineNum = 74;BA.debugLine="stream.WriteBytes(b, 0, b.Length)";
[_stream WriteBytes:_b :(int) (0) :_b.Length];
 //BA.debugLineNum = 75;BA.debugLine="PostBytes(Link, stream.ToBytesArray)";
[self _postbytes:_link :[_stream ToBytesArray]];
 //BA.debugLineNum = 76;BA.debugLine="req.SetContentType(\"multipart/form-data; boundary";
[self._req SetContentType:[@[@"multipart/form-data; boundary=",_boundary] componentsJoinedByString:@""]];
 //BA.debugLineNum = 77;BA.debugLine="req.SetContentEncoding(\"UTF8\")";
[self._req SetContentEncoding:@"UTF8"];
 //BA.debugLineNum = 78;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _poststring:(NSString*) _link :(NSString*) _text{
 //BA.debugLineNum = 23;BA.debugLine="Public Sub PostString(Link As String, Text As Stri";
 //BA.debugLineNum = 24;BA.debugLine="PostBytes(Link, Text.GetBytes(\"UTF8\"))";
[self _postbytes:_link :[_text GetBytes:@"UTF8"]];
 //BA.debugLineNum = 25;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _release{
 //BA.debugLineNum = 123;BA.debugLine="Public Sub Release";
 //BA.debugLineNum = 125;BA.debugLine="End Sub";
return @"";
}
@end
