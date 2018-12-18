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
@interface b4i_actproduct : B4IStaticModule
- (NSString*)  _add2cart_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _add2cart2_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _addbullet:(int) _size;
- (int)  _addheader:(NSString*) _title :(NSString*) _tag :(int) _tops;
- (NSString*)  _addproduct2panel:(B4IScrollView*) _scrollview1 :(int) _left :(B4IArray*) _dimension :(B4IMap*) _temp;
- (NSString*)  _bookmark_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _btnadd_2_cart_click;
- (NSString*)  _btnback_click;
- (NSString*)  _btnback_options_click;
- (NSString*)  _btnbackattr_click;
- (NSString*)  _btnbackreviews_click;
- (NSString*)  _btnbasket_click;
- (NSString*)  _btnbookmark_click;
- (NSString*)  _btncancel_date_click;
- (NSString*)  _btncancel_time_click;
- (NSString*)  _btncategory_click;
- (NSString*)  _btnclose_wb_click;
- (NSString*)  _btnmore_click;
- (NSString*)  _btnok_date_click;
- (NSString*)  _btnok_time_click;
- (NSString*)  _btnoptions_click;
- (NSString*)  _btnqr_click;
- (NSString*)  _btnreview_click;
- (NSString*)  _btnreviews_click;
- (NSString*)  _btnsearch_click;
- (NSString*)  _btnshare_click;
- (NSString*)  _carts_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _choosebullet:(int) _i;
- (NSString*)  _details_receive:(B4IMap*) _res :(NSString*) _cat;
- (NSString*)  _endtimerspecial;
- (NSString*)  _finishme;
- (NSString*)  _getcart;
- (B4IMap*)  _getcartoptions;
- (BOOL)  _getdiscount;
- (NSString*)  _imgads_click;
- (NSString*)  _lbladd2cart_click;
- (NSString*)  _lblattr_click;
- (NSString*)  _lblattributes_click;
- (NSString*)  _lbloptions_click;
- (NSString*)  _lblpayment_click;
- (NSString*)  _loadattribute;
- (NSString*)  _loaditem;
- (NSString*)  _loadoptions:(B4IList*) _attr;
- (int)  _loadproducthorizontalscroll:(B4IList*) _res :(B4IScrollView*) _scrollview1;
- (NSString*)  _loadreviews;
- (NSString*)  _makedatedialog:(NSString*) _year :(NSString*) _month :(NSString*) _day;
- (NSString*)  _maketimedialog:(NSString*) _hour :(NSString*) _minute :(NSString*) _second;
- (NSString*)  _pageproduct_appear;
- (NSString*)  _pageproduct_disappear;
- (NSString*)  _pageproduct_resize:(int) _width :(int) _height;
- (NSString*)  _pnlover_click;
- (NSString*)  _pnlqr_click;
- (NSString*)  _process_globals;
@property (nonatomic)B4ITimer* _tmrcicle;
@property (nonatomic)BOOL _isdatetime;
@property (nonatomic)B4IMap* _product;
@property (nonatomic)B4ITimer* _timerslideshow;
@property (nonatomic)BOOL _isopenproduct;
@property (nonatomic)B4IButtonWrapper* _btnqr;
@property (nonatomic)B4IPanelWrapper* _progress;
@property (nonatomic)B4IList* _bullet;
@property (nonatomic)B4ILabelWrapper* _lbltitle;
@property (nonatomic)B4ILabelWrapper* _lblprice;
@property (nonatomic)B4ILabelWrapper* _lbls1;
@property (nonatomic)B4ILabelWrapper* _lbls2;
@property (nonatomic)B4ILabelWrapper* _lbls3;
@property (nonatomic)B4ILabelWrapper* _lbls4;
@property (nonatomic)B4ILabelWrapper* _lbls5;
@property (nonatomic)B4ILabelWrapper* _lblstate;
@property (nonatomic)B4ILabelWrapper* _lblproducer;
@property (nonatomic)B4ILabelWrapper* _lbldate;
@property (nonatomic)B4ILabelWrapper* _lblmodel;
@property (nonatomic)B4ILabelWrapper* _lblvisit;
@property (nonatomic)B4IButtonWrapper* _btnreview;
@property (nonatomic)B4IPanelWrapper* _pnl2;
@property (nonatomic)B4IPanelWrapper* _pnl1;
@property (nonatomic)B4IList* _listslideshow;
@property (nonatomic)int _offsetslideshow;
@property (nonatomic)B4ILabelWrapper* _lblratetitle;
@property (nonatomic)B4ILabelWrapper* _lblstatetitle;
@property (nonatomic)B4ILabelWrapper* _lblproducertitle;
@property (nonatomic)B4ILabelWrapper* _lbldatetitle;
@property (nonatomic)B4ILabelWrapper* _lblmodeltitle;
@property (nonatomic)B4ILabelWrapper* _lblvisitcount;
@property (nonatomic)B4IScrollView* _sv1;
@property (nonatomic)B4ILabelWrapper* _lbldivider2;
@property (nonatomic)B4IWebViewWrapper* _lbldescription;
@property (nonatomic)b4i_opencart* _details;
@property (nonatomic)B4IButtonWrapper* _btnbookmark;
@property (nonatomic)B4ILabelWrapper* _lblbasket;
@property (nonatomic)B4ILabelWrapper* _lblauthor;
@property (nonatomic)B4ILabelWrapper* _lbldate_comment;
@property (nonatomic)B4ILabelWrapper* _lblcomment_review;
@property (nonatomic)B4IPanelWrapper* _pnlitem_comment;
@property (nonatomic)B4ILabelWrapper* _lblcommentstar1;
@property (nonatomic)B4ILabelWrapper* _lblcommentstar2;
@property (nonatomic)B4ILabelWrapper* _lblcommentstar3;
@property (nonatomic)B4ILabelWrapper* _lblcommentstar4;
@property (nonatomic)B4ILabelWrapper* _lblcommentstar5;
@property (nonatomic)B4IButtonWrapper* _btnreviews;
@property (nonatomic)int _topreview;
@property (nonatomic)int _topoptions;
@property (nonatomic)int _topattr;
@property (nonatomic)B4ILabelWrapper* _lblnumber;
@property (nonatomic)B4IPanelWrapper* _pnloverheader;
@property (nonatomic)B4ILabelWrapper* _lblheadername;
@property (nonatomic)B4IPanelWrapper* _pnlheadert;
@property (nonatomic)int _top;
@property (nonatomic)B4IPanelWrapper* _pnlheaderproduct;
@property (nonatomic)B4IPanelWrapper* _pnlads;
@property (nonatomic)B4IList* _listoptions;
@property (nonatomic)B4ILabelWrapper* _lblattr;
@property (nonatomic)B4ILabelWrapper* _lbloptions;
@property (nonatomic)b4i_slidemenu* _slidemenu1;
@property (nonatomic)B4ILabelWrapper* _lbladd2cart;
@property (nonatomic)B4IPanelWrapper* _pnlheader;
@property (nonatomic)B4IList* _listbanner;
@property (nonatomic)B4IImageViewWrapper* _imgspecial;
@property (nonatomic)B4ITextFieldWrapper* _txtfocus;
@property (nonatomic)b4i_mytoastmessageshow* _mytoastmessageshow1;
@property (nonatomic)BOOL _fixpanelheader;
@property (nonatomic)B4IPanelWrapper* _pnlreviews;
@property (nonatomic)B4IPanelWrapper* _pnlattribute;
@property (nonatomic)B4IPanelWrapper* _pnlbasket;
@property (nonatomic)B4IPanelWrapper* _pnloptions;
@property (nonatomic)B4IScrollView* _svreviews;
@property (nonatomic)B4IScrollView* _svattribute;
@property (nonatomic)B4IScrollView* _svoptions;
@property (nonatomic)B4IButtonWrapper* _btnattributes;
@property (nonatomic)B4ILabelWrapper* _lblfloat_basket;
@property (nonatomic)NSString* _tiptag;
@property (nonatomic)NSString* _titlehelp;
@property (nonatomic)B4IButtonWrapper* _btnshare;
@property (nonatomic)B4IButtonWrapper* _btnbasket;
@property (nonatomic)B4IButtonWrapper* _btnsearch;
@property (nonatomic)B4IButtonWrapper* _btnback;
@property (nonatomic)B4IPanelWrapper* _pnlcircle;
@property (nonatomic)B4ILabelWrapper* _lblpre_price;
@property (nonatomic)B4IPanelWrapper* _pnltimer;
@property (nonatomic)B4ILabelWrapper* _lblnum1;
@property (nonatomic)B4ILabelWrapper* _lblnum2;
@property (nonatomic)B4ILabelWrapper* _lblnum3;
@property (nonatomic)B4IPanelWrapper* _pnlprice;
@property (nonatomic)B4ITimer* _timerspecial;
@property (nonatomic)_period* _specialdateinformation;
@property (nonatomic)int _currenttimerspecialwidth;
@property (nonatomic)B4ILabelWrapper* _lblline2;
@property (nonatomic)B4ILabelWrapper* _lblline1;
@property (nonatomic)B4ILabelWrapper* _lblwonderfull;
@property (nonatomic)B4ILabelWrapper* _lblnum4;
@property (nonatomic)B4IPanelWrapper* _pnllistnumb;
@property (nonatomic)B4IPanelWrapper* _pnlqr;
@property (nonatomic)B4IScrollView* _slidepanel1;
@property (nonatomic)B4ILabelWrapper* _lblnext;
@property (nonatomic)B4IPanelWrapper* _pnlcustomdialog;
@property (nonatomic)B4ILabelWrapper* _lblmonth;
@property (nonatomic)B4ILabelWrapper* _lblday;
@property (nonatomic)B4ILabelWrapper* _lblyear;
@property (nonatomic)B4IButtonWrapper* _btnok_date;
@property (nonatomic)B4IButtonWrapper* _btncancel_date;
@property (nonatomic)B4IPickerWrapper* _txtyear;
@property (nonatomic)B4IPickerWrapper* _txtmonth;
@property (nonatomic)B4IPickerWrapper* _txtday;
@property (nonatomic)B4ITextFieldWrapper* _currenttextfield;
@property (nonatomic)B4ILabelWrapper* _lblhour;
@property (nonatomic)B4ILabelWrapper* _lblminute;
@property (nonatomic)B4ILabelWrapper* _lblsecond;
@property (nonatomic)B4IPanelWrapper* _pnldate_time;
@property (nonatomic)B4IPanelWrapper* _pnldatetime;
@property (nonatomic)B4IPickerWrapper* _txthour;
@property (nonatomic)B4IPickerWrapper* _txtminute;
@property (nonatomic)B4IPickerWrapper* _txtsecond;
@property (nonatomic)B4IButtonWrapper* _btncancel_time;
@property (nonatomic)B4IButtonWrapper* _btnok_time;
@property (nonatomic)B4IButtonWrapper* _btnoptions;
@property (nonatomic)B4IButtonWrapper* _btnmore;
@property (nonatomic)B4IWebViewWrapper* _wballdesc;
@property (nonatomic)B4IButtonWrapper* _btnclose_wb;
@property (nonatomic)B4IPanelWrapper* _pnlwb;
@property (nonatomic)b4i_main* _main;
@property (nonatomic)b4i_actmenu* _actmenu;
@property (nonatomic)b4i_library* _library;
@property (nonatomic)b4i_actsearch* _actsearch;
@property (nonatomic)b4i_actregister* _actregister;
@property (nonatomic)b4i_actaccount* _actaccount;
@property (nonatomic)b4i_actcontact* _actcontact;
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
- (NSString*)  _relatedproduct_receive:(B4IList*) _res :(NSString*) _cat;
- (NSString*)  _showoptionspanel;
- (NSString*)  _startactivity;
- (NSString*)  _sv1_scrollchanged:(int) _offsetx :(int) _offsety;
- (NSString*)  _timerspecial_tick;
- (NSString*)  _tmrcircles_tick;
- (NSString*)  _tmrslideshow_tick;
- (NSString*)  _txtoption_beginedit;
@end
