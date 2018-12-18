
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
#import "b4i_peroperties.h"


@implementation b4i_main 


+ (instancetype)new {
    static b4i_main* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _application_active{
 //BA.debugLineNum = 268;BA.debugLine="Sub Application_Active";
 //BA.debugLineNum = 270;BA.debugLine="If Library.MenuPage.IsInitialized Then";
if ([self._library._menupage IsInitialized]) { 
 //BA.debugLineNum = 271;BA.debugLine="If (Library.currLang.ToLowerCase <> set.GetStrin";
if (([[self._library._currlang ToLowerCase] isEqual:[[self._set GetString:@"lang"] ToLowerCase]] == false) || ([[self._library._currcurrency ToLowerCase] isEqual:[[self._set GetString:@"curr"] ToLowerCase]] == false)) { 
 //BA.debugLineNum = 273;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if ([self._library._logindetails IsInitialized]) { 
 //BA.debugLineNum = 274;BA.debugLine="Library.loginDetails.Put(\"login\",False)";
[self._library._logindetails Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c False]))];
 };
 //BA.debugLineNum = 277;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_category2";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_category2"];
 //BA.debugLineNum = 278;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_category_";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_category_product2"];
 //BA.debugLineNum = 279;BA.debugLine="File.Delete(CacheData.DirCache,\"cache_string_fi";
[[self.__c File] Delete:self._cachedata._dircache :@"cache_string_file"];
 //BA.debugLineNum = 280;BA.debugLine="CacheData.DeleteCache";
[self._cachedata _deletecache];
 //BA.debugLineNum = 282;BA.debugLine="StartActivity";
[self _startactivity];
 //BA.debugLineNum = 284;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 289;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _application_background{
 //BA.debugLineNum = 193;BA.debugLine="Private Sub Application_Background";
 //BA.debugLineNum = 195;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _application_receivelocalnotification:(B4INotificationWrapper*) _ln{
 //BA.debugLineNum = 291;BA.debugLine="Sub Application_ReceiveLocalNotification (LN As No";
 //BA.debugLineNum = 293;BA.debugLine="If File.Exists(File.DirLibrary,\"push\") Then";
if ([[self.__c File] Exists:[[self.__c File] DirLibrary] :@"push"]) { 
 //BA.debugLineNum = 294;BA.debugLine="Try";
@try { //BA.debugLineNum = 295;BA.debugLine="actPush.body = File.ReadString(File.DirLibrary,";
self._actpush._body = [[self.__c File] ReadString:[[self.__c File] DirLibrary] :@"push"];
 //BA.debugLineNum = 296;BA.debugLine="File.Delete(File.DirLibrary,\"push\")";
[[self.__c File] Delete:[[self.__c File] DirLibrary] :@"push"];
 //BA.debugLineNum = 297;BA.debugLine="actPush.StartActivity";
[self._actpush _startactivity];
 } 
       @catch (NSException* e7) {
			[B4I SetException:e7]; };
 };
 //BA.debugLineNum = 302;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _application_start:(B4INavigationControllerWrapper*) _nav{
[self initializeStaticModules];
 //BA.debugLineNum = 46;BA.debugLine="Private Sub Application_Start (Nav As NavigationCo";
 //BA.debugLineNum = 48;BA.debugLine="Library.NavControl = Nav";
self._library._navcontrol = _nav;
 //BA.debugLineNum = 50;BA.debugLine="actMenu.topSV = 0";
self._actmenu._topsv = (int) (0);
 //BA.debugLineNum = 52;BA.debugLine="If actMenu.svH.IsInitialized Then actMenu.svH.Pan";
if ([self._actmenu._svh IsInitialized]) { 
[[self._actmenu._svh Panel] RemoveAllViews];};
 //BA.debugLineNum = 53;BA.debugLine="If File.Exists(File.DirTemp,\"logo.png\") = False T";
if ([[self.__c File] Exists:[[self.__c File] DirTemp] :@"logo.png"]==[self.__c False]) { 
[[self.__c File] Copy:[[self.__c File] DirAssets] :@"logo.png" :[[self.__c File] DirTemp] :@"logo.png"];};
 //BA.debugLineNum = 55;BA.debugLine="StartActivity";
[self _startactivity];
 //BA.debugLineNum = 57;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _firstlogin{
 //BA.debugLineNum = 165;BA.debugLine="Sub FirstLogin";
 //BA.debugLineNum = 167;BA.debugLine="Library.Manager.Initialize";
[self._library._manager _initialize:self.bi];
 //BA.debugLineNum = 169;BA.debugLine="If Library.manager.GetBoolean(\"firsts\") = False T";
if ([self._library._manager _getboolean:@"firsts"]==[self.__c False]) { 
 //BA.debugLineNum = 171;BA.debugLine="Library.FirstRun = True";
self._library._firstrun = [self.__c True];
 //BA.debugLineNum = 173;BA.debugLine="If Library.GetStringResourse(\"default_language\")";
if ([[self._library _getstringresourse:@"default_language"] isEqual:@"fa"]) { 
 //BA.debugLineNum = 174;BA.debugLine="set.Put(\"lang\",\"فارسی\")";
[self._set Put:@"lang" :(NSObject*)(@"فارسی")];
 //BA.debugLineNum = 175;BA.debugLine="set.Put(\"curr\",\"RLS\")";
[self._set Put:@"curr" :(NSObject*)(@"RLS")];
 }else if([[self._library _getstringresourse:@"default_language"] isEqual:@"en"]) { 
 //BA.debugLineNum = 178;BA.debugLine="set.Put(\"lang\",\"English\")";
[self._set Put:@"lang" :(NSObject*)(@"English")];
 //BA.debugLineNum = 179;BA.debugLine="set.Put(\"curr\",\"USD\")";
[self._set Put:@"curr" :(NSObject*)(@"USD")];
 };
 //BA.debugLineNum = 182;BA.debugLine="Library.manager.SetBoolean(\"cache\",False)";
[self._library._manager _setboolean:@"cache" :[self.__c False]];
 //BA.debugLineNum = 183;BA.debugLine="Library.manager.SetBoolean(\"firsts\",True)";
[self._library._manager _setboolean:@"firsts" :[self.__c True]];
 };
 //BA.debugLineNum = 187;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getchecksum_receive{
 //BA.debugLineNum = 209;BA.debugLine="Sub GetChecksum_receive";
 //BA.debugLineNum = 211;BA.debugLine="Library.NewProduct.Initialize";
[self._library._newproduct Initialize];
 //BA.debugLineNum = 212;BA.debugLine="Library.NewProduct = CacheData.GetProductsFromCac";
self._library._newproduct = [self._cachedata _getproductsfromcache:@"new"];
 //BA.debugLineNum = 214;BA.debugLine="Library.FeatureProduct.Initialize";
[self._library._featureproduct Initialize];
 //BA.debugLineNum = 215;BA.debugLine="Library.FeatureProduct = CacheData.GetProductsFro";
self._library._featureproduct = [self._cachedata _getproductsfromcache:@"feature"];
 //BA.debugLineNum = 217;BA.debugLine="Library.BestProduct.Initialize";
[self._library._bestproduct Initialize];
 //BA.debugLineNum = 218;BA.debugLine="Library.BestProduct = CacheData.GetProductsFromCa";
self._library._bestproduct = [self._cachedata _getproductsfromcache:@"best"];
 //BA.debugLineNum = 220;BA.debugLine="Library.listManufacturers.Initialize";
[self._library._listmanufacturers Initialize];
 //BA.debugLineNum = 221;BA.debugLine="Library.listManufacturers = CacheData.GetProducts";
self._library._listmanufacturers = [self._cachedata _getproductsfromcache:@"manufacturers"];
 //BA.debugLineNum = 223;BA.debugLine="Library.listSlideshow.Initialize";
[self._library._listslideshow Initialize];
 //BA.debugLineNum = 224;BA.debugLine="Library.imagesSlideshow.Initialize";
[self._library._imagesslideshow Initialize];
 //BA.debugLineNum = 225;BA.debugLine="Library.listSlideshow = CacheData.GetProductsFrom";
self._library._listslideshow = [self._cachedata _getproductsfromcache:@"slideshow"];
 //BA.debugLineNum = 227;BA.debugLine="Library.listInformation.Initialize";
[self._library._listinformation Initialize];
 //BA.debugLineNum = 228;BA.debugLine="Library.listInformation = CacheData.GetProductsFr";
self._library._listinformation = [self._cachedata _getproductsfromcache:@"informations"];
 //BA.debugLineNum = 230;BA.debugLine="If File.Exists(CacheData.DirCache,\"language\") = F";
if ([[self.__c File] Exists:self._cachedata._dircache :@"language"]==[self.__c False]) { 
 //BA.debugLineNum = 231;BA.debugLine="GetProductClass";
[self _getproductclass];
 }else {
 //BA.debugLineNum = 233;BA.debugLine="pnlprogress.Visible = False";
[self._pnlprogress setVisible:[self.__c False]];
 //BA.debugLineNum = 234;BA.debugLine="actMenu.StartActivity";
[self._actmenu _startactivity];
 };
 //BA.debugLineNum = 237;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getdataconnecttype{
B4IServerSocketWrapper* _so = nil;
 //BA.debugLineNum = 337;BA.debugLine="Sub GetDataConnectType As String";
 //BA.debugLineNum = 339;BA.debugLine="Dim so As ServerSocket";
_so = [B4IServerSocketWrapper new];
 //BA.debugLineNum = 340;BA.debugLine="so.Initialize(0,\"so\")";
[_so Initialize:self.bi :(int) (0) :@"so"];
 //BA.debugLineNum = 341;BA.debugLine="If so.GetMyWifiIp = \"127.0.0.1\" Then Return \"GPRS";
if ([[_so GetMyWifiIp] isEqual:@"127.0.0.1"]) { 
if (true) return @"GPRS";}
else {
if (true) return @"WIFI";};
 //BA.debugLineNum = 343;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getlanguages{
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 254;BA.debugLine="Sub GetLanguages";
 //BA.debugLineNum = 256;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 257;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 258;BA.debugLine="op1.GetLanguages(Me,\"languages_receive\")";
[_op1 _getlanguages:self :@"languages_receive"];
 //BA.debugLineNum = 260;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getproductclass{
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 239;BA.debugLine="Sub GetProductClass";
 //BA.debugLineNum = 241;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 242;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 243;BA.debugLine="op1.GetProductClass(Me,\"productclass_receive\")";
[_op1 _getproductclass:self :@"productclass_receive"];
 //BA.debugLineNum = 245;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _gettoken{
 //BA.debugLineNum = 197;BA.debugLine="Sub GetToken";
 //BA.debugLineNum = 198;BA.debugLine="OpenCart1.GetToken(Me,\"Token_Receive\")";
[self._opencart1 _gettoken:self :@"Token_Receive"];
 //BA.debugLineNum = 199;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _jobdone:(b4i_httpjob*) _job{
 //BA.debugLineNum = 325;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 327;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 328;BA.debugLine="Library.manager.SetBoolean(\"register\",True)";
[self._library._manager _setboolean:@"register" :[self.__c True]];
 //BA.debugLineNum = 329;BA.debugLine="Log(\"OK REG\")";
[self.__c Log:@"OK REG"];
 //BA.debugLineNum = 330;BA.debugLine="Log(Job.GetString)";
[self.__c Log:[_job _getstring]];
 }else {
 //BA.debugLineNum = 332;BA.debugLine="Log(Job.ErrorMessage)";
[self.__c Log:_job._errormessage];
 };
 //BA.debugLineNum = 335;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _languages_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 262;BA.debugLine="Sub languages_receive(res As Map,cat As String)";
 //BA.debugLineNum = 264;BA.debugLine="actMenu.StartActivity";
[self._actmenu _startactivity];
 //BA.debugLineNum = 266;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _page1_resize:(int) _width :(int) _height{
 //BA.debugLineNum = 189;BA.debugLine="Private Sub Page1_Resize(Width As Int, Height As I";
 //BA.debugLineNum = 191;BA.debugLine="End Sub";
return @"";
}

- (void)initializeStaticModules {
    [[b4i_main new]initializeModule];
[[b4i_actmenu new]initializeModule];
[[b4i_library new]initializeModule];
[[b4i_actsearch new]initializeModule];
[[b4i_actregister new]initializeModule];
[[b4i_actaccount new]initializeModule];
[[b4i_actcontact new]initializeModule];
[[b4i_actproduct new]initializeModule];
[[b4i_actpicture new]initializeModule];
[[b4i_actdoorder new]initializeModule];
[[b4i_actcategory new]initializeModule];
[[b4i_actpayment new]initializeModule];
[[b4i_actpush new]initializeModule];
[[b4i_pushnotification new]initializeModule];
[[b4i_actlogin new]initializeModule];
[[b4i_actbasket new]initializeModule];
[[b4i_actproducts new]initializeModule];
[[b4i_actsms new]initializeModule];
[[b4i_actorderdetails new]initializeModule];
[[b4i_modshare new]initializeModule];
[[b4i_acterrorinternet new]initializeModule];
[[b4i_httputils2service new]initializeModule];
[[b4i_cachedata new]initializeModule];
[[b4i_dateutils new]initializeModule];
[[b4i_bookmark new]initializeModule];
[[b4i_actabout new]initializeModule];
[[b4i_actshow new]initializeModule];
[[b4i_actweb new]initializeModule];
[[b4i_actsetting new]initializeModule];
[[b4i_actreview new]initializeModule];
[[b4i_peroperties new]initializeModule];

}
- (NSString*)  _process_globals{
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
 //BA.debugLineNum = 29;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 30;BA.debugLine="Public App As Application";
self._app = [B4IApplicationWrapper new];
 //BA.debugLineNum = 31;BA.debugLine="Private timer1 As Timer";
self._timer1 = [B4ITimer new];
 //BA.debugLineNum = 32;BA.debugLine="Public First As Boolean";
self._first = false;
 //BA.debugLineNum = 33;BA.debugLine="Private pb1 As ProgressView";
self._pb1 = [B4IProgressWrapper new];
 //BA.debugLineNum = 34;BA.debugLine="Private lbldetails As Label";
self._lbldetails = [B4ILabelWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 36;BA.debugLine="Private pnllogo As Panel";
self._pnllogo = [B4IPanelWrapper new];
 //BA.debugLineNum = 37;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 38;BA.debugLine="Private pnlprogress As Panel";
self._pnlprogress = [B4IPanelWrapper new];
 //BA.debugLineNum = 39;BA.debugLine="Private OpenCart1 As OpenCart";
self._opencart1 = [b4i_opencart new];
 //BA.debugLineNum = 40;BA.debugLine="Private imglogo As ImageView";
self._imglogo = [B4IImageViewWrapper new];
 //BA.debugLineNum = 41;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 42;BA.debugLine="Private pnlfooter As Panel";
self._pnlfooter = [B4IPanelWrapper new];
 //BA.debugLineNum = 43;BA.debugLine="Dim set As Settings";
self._set = [B4ISettings new];
 //BA.debugLineNum = 44;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _productclass_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 247;BA.debugLine="Sub productclass_receive(res As Map,cat As String)";
 //BA.debugLineNum = 249;BA.debugLine="pnlprogress.Visible = False";
[self._pnlprogress setVisible:[self.__c False]];
 //BA.debugLineNum = 250;BA.debugLine="GetLanguages";
[self _getlanguages];
 //BA.debugLineNum = 252;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _reguser{
b4i_httpjob* _htreg = nil;
NSString* _id = @"";
NSString* _sim = @"";
NSString* _connection = @"";
NSString* _os = @"";
NSString* _devicename = @"";
NSString* _url = @"";
NSString* _param = @"";
NSString* _hash = @"";
 //BA.debugLineNum = 304;BA.debugLine="Sub RegUser";
 //BA.debugLineNum = 306;BA.debugLine="Dim htReg As HttpJob";
_htreg = [b4i_httpjob new];
 //BA.debugLineNum = 307;BA.debugLine="htReg.Initialize(\"reg\",Me)";
[_htreg _initialize:self.bi :@"reg" :self];
 //BA.debugLineNum = 309;BA.debugLine="Dim ID,SIM,Connection,OS,DeviceName,URL,Param,Has";
_id = @"";
_sim = @"";
_connection = @"";
_os = @"";
_devicename = @"";
_url = @"";
_param = @"";
_hash = @"";
 //BA.debugLineNum = 311;BA.debugLine="ID			= Peroperties.GetVendorIdentifier";
_id = [self._peroperties _getvendoridentifier];
 //BA.debugLineNum = 312;BA.debugLine="SIM			= \"none\"";
_sim = @"none";
 //BA.debugLineNum = 313;BA.debugLine="Connection	= GetDataConnectType";
_connection = [self _getdataconnecttype];
 //BA.debugLineNum = 314;BA.debugLine="DeviceName	= Peroperties.GetDeviceName";
_devicename = [self._peroperties _getdevicename];
 //BA.debugLineNum = 315;BA.debugLine="OS			= \"ios\"";
_os = @"ios";
 //BA.debugLineNum = 316;BA.debugLine="Hash		= Library.KEY_APP";
_hash = self._library._key_app;
 //BA.debugLineNum = 318;BA.debugLine="URL = Library.GetStringResourse(\"url\") & \"/app/st";
_url = [@[[self._library _getstringresourse:@"url"],@"/app/statistic/index.php"] componentsJoinedByString:@""];
 //BA.debugLineNum = 319;BA.debugLine="Param = $\"id=${ID}&connection=${Connection}&os=${";
_param = ([@[@"id=",[self.__c SmartStringFormatter:@"" :(NSObject*)(_id)],@"&connection=",[self.__c SmartStringFormatter:@"" :(NSObject*)(_connection)],@"&os=",[self.__c SmartStringFormatter:@"" :(NSObject*)(_os)],@"&device_name=",[self.__c SmartStringFormatter:@"" :(NSObject*)(_devicename)],@"&sim=",[self.__c SmartStringFormatter:@"" :(NSObject*)(_sim)],@"&sign=",[self.__c SmartStringFormatter:@"" :(NSObject*)(_hash)],@""] componentsJoinedByString:@""]);
 //BA.debugLineNum = 321;BA.debugLine="htReg.PostString(URL,Param)";
[_htreg _poststring:_url :_param];
 //BA.debugLineNum = 323;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _so_newconnection:(BOOL) _successful :(B4ISocketWrapper*) _newsocket{
 //BA.debugLineNum = 345;BA.debugLine="Sub so_NewConnection (Successful As Boolean, NewSo";
 //BA.debugLineNum = 347;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 59;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 61;BA.debugLine="set.Initialize";
[self._set Initialize];
 //BA.debugLineNum = 62;BA.debugLine="Library.setting.Initialize";
[self._library._setting Initialize];
 //BA.debugLineNum = 65;BA.debugLine="Library.StringResourse = File.ReadString(File.Dir";
self._library._stringresourse = [[self.__c File] ReadString:[[self.__c File] DirAssets] :@"string.xml"];
 //BA.debugLineNum = 67;BA.debugLine="Library.token.Initialize";
[self._library._token Initialize];
 //BA.debugLineNum = 68;BA.debugLine="App.RegisterUserNotifications(True, True, True) '";
[self._app RegisterUserNotifications:[self.__c True] :[self.__c True] :[self.__c True]];
 //BA.debugLineNum = 69;BA.debugLine="App.ApplicationIconBadgeNumber = 0";
[self._app setApplicationIconBadgeNumber:(int) (0)];
 //BA.debugLineNum = 71;BA.debugLine="Library.MainPage.Initialize(\"Page1\")";
[self._library._mainpage Initialize:self.bi :@"Page1"];
 //BA.debugLineNum = 72;BA.debugLine="Library.NavControl.NavigationBarVisible = False";
[self._library._navcontrol setNavigationBarVisible:[self.__c False]];
 //BA.debugLineNum = 73;BA.debugLine="Library.NavControl.ToolBarVisible = False";
[self._library._navcontrol setToolBarVisible:[self.__c False]];
 //BA.debugLineNum = 74;BA.debugLine="Library.MainPage.RootPanel.LoadLayout(\"frmsplash\"";
[[self._library._mainpage RootPanel] LoadLayout:@"frmsplash" :self.bi];
 //BA.debugLineNum = 75;BA.debugLine="Library.NavControl.ShowPage(Library.MainPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._mainpage).object)];
 //BA.debugLineNum = 77;BA.debugLine="FirstLogin";
[self _firstlogin];
 //BA.debugLineNum = 79;BA.debugLine="Library.wishlist = \"\"";
self._library._wishlist = @"";
 //BA.debugLineNum = 80;BA.debugLine="Library.currCurrency = set.GetString(\"curr\")";
self._library._currcurrency = [self._set GetString:@"curr"];
 //BA.debugLineNum = 82;BA.debugLine="If File.Exists(File.DirLibrary,\"base_config2\") =";
if ([[self.__c File] Exists:[[self.__c File] DirLibrary] :@"base_config2"]==[self.__c False]) { 
 //BA.debugLineNum = 83;BA.debugLine="If Library.GetStringResourse(\"default_language\")";
if ([[self._library _getstringresourse:@"default_language"] isEqual:@"fa"]) { 
 //BA.debugLineNum = 84;BA.debugLine="set.Put(\"lang\",\"فارسی\")";
[self._set Put:@"lang" :(NSObject*)(@"فارسی")];
 //BA.debugLineNum = 85;BA.debugLine="set.Put(\"curr\",\"RLS\")";
[self._set Put:@"curr" :(NSObject*)(@"RLS")];
 //BA.debugLineNum = 86;BA.debugLine="Library.manager.SetString(\"curr\",\"RLS\")";
[self._library._manager _setstring:@"curr" :@"RLS"];
 }else {
 //BA.debugLineNum = 88;BA.debugLine="set.Put(\"lang\",\"english\")";
[self._set Put:@"lang" :(NSObject*)(@"english")];
 //BA.debugLineNum = 89;BA.debugLine="set.Put(\"curr\",\"USD\")";
[self._set Put:@"curr" :(NSObject*)(@"USD")];
 //BA.debugLineNum = 90;BA.debugLine="Library.manager.SetString(\"curr\",\"USD\")";
[self._library._manager _setstring:@"curr" :@"USD"];
 };
 //BA.debugLineNum = 92;BA.debugLine="File.WriteString(File.DirLibrary,\"base_config2\",";
[[self.__c File] WriteString:[[self.__c File] DirLibrary] :@"base_config2" :@""];
 };
 //BA.debugLineNum = 95;BA.debugLine="Library.currLang = set.GetString(\"lang\")";
self._library._currlang = [self._set GetString:@"lang"];
 //BA.debugLineNum = 96;BA.debugLine="Library.manager.SetString(\"lang\",set.GetString(\"l";
[self._library._manager _setstring:@"lang" :[self._set GetString:@"lang"]];
 //BA.debugLineNum = 98;BA.debugLine="If Library.currLang = \"فارسی\" Then";
if ([self._library._currlang isEqual:@"فارسی"]) { 
 //BA.debugLineNum = 99;BA.debugLine="Library.LoadLanguage(\"fa\")";
[self._library _loadlanguage:@"fa"];
 }else {
 //BA.debugLineNum = 101;BA.debugLine="Library.LoadLanguage(\"en\")";
[self._library _loadlanguage:@"en"];
 };
 //BA.debugLineNum = 104;BA.debugLine="imglogo.Bitmap = LoadBitmap(File.DirAssets,\"logo.";
[self._imglogo setBitmap:[self.__c LoadBitmap:[[self.__c File] DirAssets] :@"logo.png"]];
 //BA.debugLineNum = 106;BA.debugLine="Library.LoadTheme";
[self._library _loadtheme];
 //BA.debugLineNum = 107;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 108;BA.debugLine="pnlfooter.Color = Library.Theme_Footer";
[self._pnlfooter setColor:self._library._theme_footer];
 //BA.debugLineNum = 109;BA.debugLine="Library.MainPage.RootPanel.Color  = Library.Theme";
[[self._library._mainpage RootPanel] setColor:self._library._theme_background];
 //BA.debugLineNum = 111;BA.debugLine="Library.wishlist = Library.GetStringResourse2(\"bo";
self._library._wishlist = [self._library _getstringresourse2:@"bookmark"];
 //BA.debugLineNum = 112;BA.debugLine="Library.Coupons.Initialize";
[self._library._coupons Initialize];
 //BA.debugLineNum = 114;BA.debugLine="pnllogo.Alpha = 0";
[self._pnllogo setAlpha:(float) (0)];
 //BA.debugLineNum = 115;BA.debugLine="pnllogo.SetAlphaAnimated(500,1)";
[self._pnllogo SetAlphaAnimated:(int) (500) :(float) (1)];
 //BA.debugLineNum = 117;BA.debugLine="If Library.InternetState = True Then";
if ([self._library _internetstate]==[self.__c True]) { 
 //BA.debugLineNum = 118;BA.debugLine="timer1.Initialize(\"tmr1\",1100)";
[self._timer1 Initialize:self.bi :@"tmr1" :(long long) (1100)];
 }else {
 //BA.debugLineNum = 120;BA.debugLine="timer1.Initialize(\"tmr1\",800)";
[self._timer1 Initialize:self.bi :@"tmr1" :(long long) (800)];
 };
 //BA.debugLineNum = 123;BA.debugLine="timer1.Enabled = True";
[self._timer1 setEnabled:[self.__c True]];
 //BA.debugLineNum = 125;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"app_ti";
[self._lbltitle setText:[self._library _getstringresourse:@"app_title"]];
 //BA.debugLineNum = 126;BA.debugLine="Library.SetFont(lbltitle,\"\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lbltitle).object)] :@"" :(int) (14)];
 //BA.debugLineNum = 128;BA.debugLine="lbldetails.Text = Library.GetStringResourse(\"shop";
[self._lbldetails setText:[self._library _getstringresourse:@"shop_details"]];
 //BA.debugLineNum = 129;BA.debugLine="Library.SetFont(lbldetails,\"\",8)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lbldetails).object)] :@"" :(int) (8)];
 //BA.debugLineNum = 131;BA.debugLine="lblpb.Text = Library.GetStringResourse2(\"loading\"";
[self._lblpb setText:[self._library _getstringresourse2:@"loading"]];
 //BA.debugLineNum = 133;BA.debugLine="Library.SetFont(lblpb,\"\",8)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblpb).object)] :@"" :(int) (8)];
 //BA.debugLineNum = 135;BA.debugLine="If Library.manager.GetBoolean(\"register\") = False";
if ([self._library._manager _getboolean:@"register"]==[self.__c False]) { 
 //BA.debugLineNum = 136;BA.debugLine="RegUser";
[self _reguser];
 };
 //BA.debugLineNum = 139;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmr1_tick{
 //BA.debugLineNum = 141;BA.debugLine="Sub tmr1_Tick";
 //BA.debugLineNum = 143;BA.debugLine="timer1.Enabled = False";
[self._timer1 setEnabled:[self.__c False]];
 //BA.debugLineNum = 145;BA.debugLine="If Library.InternetState = False And CacheData.Ex";
if ([self._library _internetstate]==[self.__c False] && [self._cachedata _existcacheproducts]==[self.__c False]) { 
 //BA.debugLineNum = 146;BA.debugLine="First = True";
self._first = [self.__c True];
 //BA.debugLineNum = 147;BA.debugLine="actErrorInternet.module = Me";
self._acterrorinternet._module = self;
 //BA.debugLineNum = 148;BA.debugLine="actErrorInternet.StartActivity";
[self._acterrorinternet _startactivity];
 }else if([self._cachedata _existcacheproducts]==[self.__c True] && [self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 151;BA.debugLine="OpenCart1.Initialize";
[self._opencart1 _initialize:self.bi];
 //BA.debugLineNum = 152;BA.debugLine="Library.token.Initialize";
[self._library._token Initialize];
 //BA.debugLineNum = 153;BA.debugLine="Library.token.Put(\"token_type\",\"\")";
[self._library._token Put:(NSObject*)(@"token_type") :(NSObject*)(@"")];
 //BA.debugLineNum = 154;BA.debugLine="Library.token.Put(\"access_token\",\"\")";
[self._library._token Put:(NSObject*)(@"access_token") :(NSObject*)(@"")];
 //BA.debugLineNum = 155;BA.debugLine="GetChecksum_receive";
[self _getchecksum_receive];
 }else {
 //BA.debugLineNum = 158;BA.debugLine="OpenCart1.Initialize";
[self._opencart1 _initialize:self.bi];
 //BA.debugLineNum = 159;BA.debugLine="GetToken";
[self _gettoken];
 };
 //BA.debugLineNum = 163;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _token_receive:(B4IMap*) _data{
b4i_opencart* _checksum = nil;
 //BA.debugLineNum = 201;BA.debugLine="Sub Token_Receive(data As Map)";
 //BA.debugLineNum = 203;BA.debugLine="Dim checksum As OpenCart";
_checksum = [b4i_opencart new];
 //BA.debugLineNum = 204;BA.debugLine="checksum.Initialize";
[_checksum _initialize:self.bi];
 //BA.debugLineNum = 205;BA.debugLine="checksum.CheckSumOnline(Me,\"GetChecksum_receive\")";
[_checksum _checksumonline:self :@"GetChecksum_receive"];
 //BA.debugLineNum = 207;BA.debugLine="End Sub";
return @"";
}
@end
