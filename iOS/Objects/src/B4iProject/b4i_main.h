#import "iCore.h"
#import "iHttp.h"
#import "iStringUtils.h"
#import "iSQL.h"
#import "iPhone.h"
#import "iJSON.h"
#import "iHUD.h"
#import "iNetwork.h"
#import "iEncryption.h"
#import "iRandomAccessFile.h"
#import "iSideMenu.h"
#import "iReleaseLogger.h"
@class b4i_actmenu;
@class b4i_library;
@class b4i_actsearch;
@class b4i_actregister;
@class b4i_actaccount;
@class b4i_actcontact;
@class b4i_actproduct;
@class b4i_actpicture;
@class b4i_actdoorder;
@class b4i_actcategory;
@class b4i_actpayment;
@class b4i_actpush;
@class b4i_pushnotification;
@class b4i_actlogin;
@class b4i_actbasket;
@class b4i_actproducts;
@class b4i_actsms;
@class b4i_actorderdetails;
@class b4i_modshare;
@class b4i_acterrorinternet;
@class b4i_httputils2service;
@class b4i_cachedata;
@class b4i_dateutils;
@class b4i_bookmark;
@class b4i_actabout;
@class b4i_actshow;
@class b4i_actweb;
@class b4i_actsetting;
@class b4i_actreview;
@class b4i_peroperties;
@class _responseadditem;
@class b4i_imagedownloader;
@class b4i_opencart;
@class _multipartfiledata;
@class b4i_httpjob;
@class b4i_clspreferencemanager;
@class b4i_slidemenu;
@class b4i_richstring;
@class b4i_html;
@class b4i_mytoastmessageshow;
@class b4i_customlistview;
@class _period;
@class b4i_imagezoom;
@interface b4i_main : B4IStaticModule
- (NSString*)  _application_active;
- (NSString*)  _application_background;
- (NSString*)  _application_receivelocalnotification:(B4INotificationWrapper*) _ln;
- (NSString*)  _application_start:(B4INavigationControllerWrapper*) _nav;
- (NSString*)  _firstlogin;
- (NSString*)  _getchecksum_receive;
- (NSString*)  _getdataconnecttype;
- (NSString*)  _getlanguages;
- (NSString*)  _getproductclass;
- (NSString*)  _gettoken;
- (NSString*)  _jobdone:(b4i_httpjob*) _job;
- (NSString*)  _languages_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _page1_resize:(int) _width :(int) _height;
- (NSString*)  _process_globals;
@property (nonatomic)B4IApplicationWrapper* _app;
@property (nonatomic)B4ITimer* _timer1;
@property (nonatomic)BOOL _first;
@property (nonatomic)B4IProgressWrapper* _pb1;
@property (nonatomic)B4ILabelWrapper* _lbldetails;
@property (nonatomic)B4ILabelWrapper* _lbltitle;
@property (nonatomic)B4IPanelWrapper* _pnllogo;
@property (nonatomic)B4ILabelWrapper* _lblpb;
@property (nonatomic)B4IPanelWrapper* _pnlprogress;
@property (nonatomic)b4i_opencart* _opencart1;
@property (nonatomic)B4IImageViewWrapper* _imglogo;
@property (nonatomic)B4IPanelWrapper* _pnlheader;
@property (nonatomic)B4IPanelWrapper* _pnlfooter;
@property (nonatomic)B4ISettings* _set;
@property (nonatomic)b4i_actmenu* _actmenu;
@property (nonatomic)b4i_library* _library;
@property (nonatomic)b4i_actsearch* _actsearch;
@property (nonatomic)b4i_actregister* _actregister;
@property (nonatomic)b4i_actaccount* _actaccount;
@property (nonatomic)b4i_actcontact* _actcontact;
@property (nonatomic)b4i_actproduct* _actproduct;
@property (nonatomic)b4i_actpicture* _actpicture;
@property (nonatomic)b4i_actdoorder* _actdoorder;
@property (nonatomic)b4i_actcategory* _actcategory;
@property (nonatomic)b4i_actpayment* _actpayment;
@property (nonatomic)b4i_actpush* _actpush;
@property (nonatomic)b4i_pushnotification* _pushnotification;
@property (nonatomic)b4i_actlogin* _actlogin;
@property (nonatomic)b4i_actbasket* _actbasket;
@property (nonatomic)b4i_actproducts* _actproducts;
@property (nonatomic)b4i_actsms* _actsms;
@property (nonatomic)b4i_actorderdetails* _actorderdetails;
@property (nonatomic)b4i_modshare* _modshare;
@property (nonatomic)b4i_acterrorinternet* _acterrorinternet;
@property (nonatomic)b4i_httputils2service* _httputils2service;
@property (nonatomic)b4i_cachedata* _cachedata;
@property (nonatomic)b4i_dateutils* _dateutils;
@property (nonatomic)b4i_bookmark* _bookmark;
@property (nonatomic)b4i_actabout* _actabout;
@property (nonatomic)b4i_actshow* _actshow;
@property (nonatomic)b4i_actweb* _actweb;
@property (nonatomic)b4i_actsetting* _actsetting;
@property (nonatomic)b4i_actreview* _actreview;
@property (nonatomic)b4i_peroperties* _peroperties;
- (NSString*)  _productclass_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _reguser;
- (NSString*)  _so_newconnection:(BOOL) _successful :(B4ISocketWrapper*) _newsocket;
- (NSString*)  _startactivity;
- (NSString*)  _tmr1_tick;
- (NSString*)  _token_receive:(B4IMap*) _data;
@end
