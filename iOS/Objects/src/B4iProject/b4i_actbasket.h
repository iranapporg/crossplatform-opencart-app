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
@interface b4i_actbasket : B4IStaticModule
- (NSString*)  _addcoupon_receive:(BOOL) _state;
- (NSString*)  _addvoucher_receive:(BOOL) _state;
- (NSString*)  _btnclear_click;
- (NSString*)  _btnclose_click;
- (NSString*)  _btnclose_me_click;
- (NSString*)  _btncoupon_click;
- (NSString*)  _btnpayment_click;
- (NSString*)  _btnvoucher_click;
- (NSString*)  _carts_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _clearcart_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _deleteitem_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _getcart;
- (NSString*)  _lblremove_product_click;
- (NSString*)  _pagebasket_keyboardstatechanged:(float) _height;
- (NSString*)  _process_globals;
@property (nonatomic)B4IPanelWrapper* _pnlheader;
@property (nonatomic)B4ILabelWrapper* _lbltitle;
@property (nonatomic)B4ILabelWrapper* _lblpb;
@property (nonatomic)B4IPanelWrapper* _pnlloading;
@property (nonatomic)B4IButtonWrapper* _btnpayment;
@property (nonatomic)B4IButtonWrapper* _btnclear;
@property (nonatomic)B4ILabelWrapper* _lbltotal;
@property (nonatomic)B4ILabelWrapper* _lblsabadtitle;
@property (nonatomic)b4i_opencart* _op1;
@property (nonatomic)B4ITextFieldWrapper* _txtcartcount;
@property (nonatomic)B4ILabelWrapper* _lblcprice;
@property (nonatomic)B4ILabelWrapper* _lblctitle;
@property (nonatomic)B4IImageViewWrapper* _imgicon;
@property (nonatomic)B4IPanelWrapper* _pnlitemcart;
@property (nonatomic)B4IScrollView* _sv1;
@property (nonatomic)int _top;
@property (nonatomic)B4ILabelWrapper* _lblcount;
@property (nonatomic)B4IButtonWrapper* _btncoupon;
@property (nonatomic)B4ILabelWrapper* _lblremove_product;
@property (nonatomic)B4ITextFieldWrapper* _txtcoupon_id;
@property (nonatomic)B4ITextFieldWrapper* _txtvoucher_id;
@property (nonatomic)B4IButtonWrapper* _btnvoucher;
@property (nonatomic)BOOL _biggersv;
@property (nonatomic)BOOL _doanimatesv;
@property (nonatomic)int _defaulttopsv;
@property (nonatomic)int _defaultheightsv;
@property (nonatomic)b4i_mytoastmessageshow* _mytoastmessageshow1;
@property (nonatomic)B4ITimer* _timeranimation;
@property (nonatomic)B4IButtonWrapper* _btnclose;
@property (nonatomic)B4IPickerWrapper* _txtcount_pk;
@property (nonatomic)B4IPanelWrapper* _pnlcount;
@property (nonatomic)NSString* _currentkey;
@property (nonatomic)B4IButtonWrapper* _btnclose_me;
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
- (NSString*)  _startactivity;
- (NSString*)  _sv1_scrollchanged:(int) _offsetx :(int) _offsety;
- (NSString*)  _tmranimation_tick;
- (NSString*)  _txtcartcount_beginedit;
- (NSString*)  _txtcartcount_itemselected:(int) _column :(int) _row;
- (NSString*)  _txtcount_pk_itemselected:(int) _column :(int) _row;
- (NSString*)  _updateproduct_receive:(B4IMap*) _res :(NSString*) _cat;
@end
