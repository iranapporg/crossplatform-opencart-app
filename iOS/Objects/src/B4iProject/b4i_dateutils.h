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
@class b4i_main;
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
@interface b4i_dateutils : B4IStaticModule
- (long long)  _addperiod:(long long) _ticks :(_period*) _per;
- (NSString*)  _format:(int) _value :(int) _length;
- (NSString*)  _getdayofweekname:(long long) _ticks;
- (B4IList*)  _getdaysnames;
- (NSString*)  _getera:(BOOL) _negative;
- (NSString*)  _getmonthname:(long long) _ticks;
- (B4IList*)  _getmonthsnames;
- (BOOL)  _issameday:(long long) _ticks1 :(long long) _ticks2;
- (int)  _numberofdaysinmonth:(int) _month :(int) _year;
- (_period*)  _periodbetween:(long long) _start :(long long) _endtime;
- (_period*)  _periodbetweenhelper:(long long) _start :(long long) _endtime :(BOOL) _startwithdays;
- (_period*)  _periodbetweenindays:(long long) _start :(long long) _endtime;
- (NSString*)  _process_globals;
@property (nonatomic)B4IList* _dayslist;
@property (nonatomic)B4IList* _monthslist;
@property (nonatomic)NSString* _ad;
@property (nonatomic)NSString* _bc;
@property (nonatomic)b4i_main* _main;
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
@property (nonatomic)b4i_bookmark* _bookmark;
@property (nonatomic)b4i_actabout* _actabout;
@property (nonatomic)b4i_actshow* _actshow;
@property (nonatomic)b4i_actweb* _actweb;
@property (nonatomic)b4i_actsetting* _actsetting;
@property (nonatomic)b4i_actreview* _actreview;
@property (nonatomic)b4i_peroperties* _peroperties;
- (long long)  _setdate:(int) _years :(int) _months :(int) _days;
- (long long)  _setdateandtime:(int) _years :(int) _months :(int) _days :(int) _hours :(int) _minutes :(int) _seconds;
- (long long)  _setdateandtime2:(int) _years :(int) _months :(int) _days :(int) _hours :(int) _minutes :(int) _seconds :(double) _timezone;
- (NSString*)  _tickstostring:(long long) _ticks;
- (long long)  _tickstounixtime:(long long) _ticks;
- (long long)  _unixtimetoticks:(long long) _unixtime;
@end
@interface _period:NSObject
@property (nonatomic)BOOL IsInitialized;
@property (nonatomic)int Years;
@property (nonatomic)int Months;
@property (nonatomic)int Days;
@property (nonatomic)int Hours;
@property (nonatomic)int Minutes;
@property (nonatomic)int Seconds;
-(void)Initialize;
@end
