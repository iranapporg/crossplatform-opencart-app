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
@interface b4i_actorderdetails : B4IStaticModule
- (NSString*)  _btncancelreturn_click;
- (NSString*)  _btnclose_click;
- (NSString*)  _btnprint_click;
- (NSString*)  _btnreturn_click;
- (NSString*)  _btnreturn_product_click;
- (NSString*)  _getreturnreason2spinner;
- (NSString*)  _jobdone:(b4i_httpjob*) _job;
- (NSString*)  _loadattribute:(B4IList*) _attr;
- (NSString*)  _print;
- (NSString*)  _process_globals;
@property (nonatomic)B4IDocumentInteractionWrapper* _di;
@property (nonatomic)B4IPage* _pg;
@property (nonatomic)B4IMap* _details;
@property (nonatomic)B4IMap* _user_details;
@property (nonatomic)B4IMap* _shopinformation;
@property (nonatomic)B4ILabelWrapper* _lbltitle;
@property (nonatomic)B4IPanelWrapper* _pnlheader;
@property (nonatomic)B4IScrollView* _sv1;
@property (nonatomic)B4ILabelWrapper* _lblorder_payment_type_title;
@property (nonatomic)B4ILabelWrapper* _lblorderaddress1;
@property (nonatomic)B4ILabelWrapper* _lblorderaddress2;
@property (nonatomic)B4ILabelWrapper* _lblordercity1;
@property (nonatomic)B4ILabelWrapper* _lblordercity2;
@property (nonatomic)B4ILabelWrapper* _lblordercountry1;
@property (nonatomic)B4ILabelWrapper* _lblordercountry2;
@property (nonatomic)B4ILabelWrapper* _lblorderpayment_ship_type;
@property (nonatomic)B4ILabelWrapper* _lblorderpayment_type;
@property (nonatomic)B4ILabelWrapper* _lblorderphone;
@property (nonatomic)B4ILabelWrapper* _lblorderphone2;
@property (nonatomic)B4ILabelWrapper* _lblorderpostal1;
@property (nonatomic)B4ILabelWrapper* _lblorderpostal2;
@property (nonatomic)B4ILabelWrapper* _lblorderreceiver_name1;
@property (nonatomic)B4ILabelWrapper* _lblorderreceiver_name2;
@property (nonatomic)B4ILabelWrapper* _lblordership_type;
@property (nonatomic)B4ILabelWrapper* _lblordershop_name;
@property (nonatomic)B4IImageViewWrapper* _imgicon;
@property (nonatomic)B4IPanelWrapper* _pnl_item_product;
@property (nonatomic)B4ILabelWrapper* _lblprice_quantity;
@property (nonatomic)B4ILabelWrapper* _lblname_product;
@property (nonatomic)B4ILabelWrapper* _lblproducts;
@property (nonatomic)int _top;
@property (nonatomic)B4IButtonWrapper* _btnreturn;
@property (nonatomic)B4IPanelWrapper* _pnlreturn;
@property (nonatomic)B4ILabelWrapper* _lblcomment;
@property (nonatomic)B4ILabelWrapper* _lblopened;
@property (nonatomic)B4ILabelWrapper* _lblreason;
@property (nonatomic)B4ISwitchWrapper* _rbyes;
@property (nonatomic)B4IPickerWrapper* _spreason;
@property (nonatomic)B4ITextFieldWrapper* _txtcomment;
@property (nonatomic)B4IButtonWrapper* _btncancel;
@property (nonatomic)B4IButtonWrapper* _btncancelreturn;
@property (nonatomic)B4IButtonWrapper* _btnreturn_product;
@property (nonatomic)b4i_mytoastmessageshow* _toast;
@property (nonatomic)B4IPanelWrapper* _pnlloading;
@property (nonatomic)B4ILabelWrapper* _lblpb;
@property (nonatomic)B4IList* _reason_id;
@property (nonatomic)B4IButtonWrapper* _btnprint;
@property (nonatomic)B4IButtonWrapper* _btnclose;
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
- (NSString*)  _return_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _startactivity;
- (NSString*)  _storedetails_receive:(B4IMap*) _res :(NSString*) _cat;
@end
