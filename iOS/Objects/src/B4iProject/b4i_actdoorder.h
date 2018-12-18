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
@interface b4i_actdoorder : B4IStaticModule
- (NSString*)  _addaddress_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _addaddressship_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _btnclose_click;
- (NSString*)  _btncontinue_click;
- (NSString*)  _btnpayment_click;
- (NSString*)  _confirmorder_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _getways_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _listaddress_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _loaddata;
- (NSString*)  _lsaddr_itemclick:(int) _index :(NSObject*) _value;
- (NSString*)  _lsaddr_itemselected:(int) _column :(int) _row;
- (NSString*)  _payment_itemselected:(int) _column :(int) _row;
- (NSString*)  _process_globals;
@property (nonatomic)B4IList* _lsships;
@property (nonatomic)B4IList* _lspayment;
@property (nonatomic)B4IList* _lsaddressids;
@property (nonatomic)B4ILabelWrapper* _lblship;
@property (nonatomic)B4ILabelWrapper* _lblpayment;
@property (nonatomic)B4IButtonWrapper* _btnpayment;
@property (nonatomic)B4IPanelWrapper* _pnlheader;
@property (nonatomic)B4IPanelWrapper* _pnlloading;
@property (nonatomic)B4ILabelWrapper* _lblpb;
@property (nonatomic)B4ILabelWrapper* _lbltitle;
@property (nonatomic)NSString* _currentpaymentcode;
@property (nonatomic)B4IScrollView* _sv1;
@property (nonatomic)int _topsv;
@property (nonatomic)B4IScrollView* _svpreview;
@property (nonatomic)B4IButtonWrapper* _btncontinue;
@property (nonatomic)B4IPanelWrapper* _pnlpreview;
@property (nonatomic)B4ILabelWrapper* _lblname_product;
@property (nonatomic)B4ILabelWrapper* _lblprice_quantity;
@property (nonatomic)B4IPanelWrapper* _pnl_item_product;
@property (nonatomic)NSString* _order_id;
@property (nonatomic)b4i_mytoastmessageshow* _mytoastmessageshow1;
@property (nonatomic)B4IButtonWrapper* _btnreturn;
@property (nonatomic)B4ITimer* _timerscroll;
@property (nonatomic)B4IButtonWrapper* _btnclose;
@property (nonatomic)B4IPickerWrapper* _pickergetway;
@property (nonatomic)B4IPickerWrapper* _pickership;
@property (nonatomic)B4ILabelWrapper* _lbladdr;
@property (nonatomic)b4i_customlistview* _lsaddr;
@property (nonatomic)B4IPanelWrapper* _pnladdr;
@property (nonatomic)B4ILabelWrapper* _lblcomment;
@property (nonatomic)B4ITextFieldWrapper* _txtcomment;
@property (nonatomic)B4IPanelWrapper* _pnlinaddress;
@property (nonatomic)b4i_main* _main;
@property (nonatomic)b4i_actmenu* _actmenu;
@property (nonatomic)b4i_library* _library;
@property (nonatomic)b4i_actsearch* _actsearch;
@property (nonatomic)b4i_actregister* _actregister;
@property (nonatomic)b4i_actaccount* _actaccount;
@property (nonatomic)b4i_actcontact* _actcontact;
@property (nonatomic)b4i_actproduct* _actproduct;
@property (nonatomic)b4i_actpicture* _actpicture;
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
- (NSString*)  _saveorder_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _setpaymentmethod_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _setshipmethod_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _ship_itemselected:(int) _column :(int) _row;
- (NSString*)  _ship_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _startactivity;
- (NSString*)  _tmrscroll_tick;
@end
