
#import "b4i_imagezoom.h"
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
#import "b4i_peroperties.h"
#import <QuartzCore/QuartzCore.h>


@implementation b4i_imagezoom 


+ (B4I*)createBI {
    return [B4I alloc];
}

- (void)dealloc {
    if (self.bi != nil)
        NSLog(@"Class (b4i_imagezoom) instance released.");
}
- (NSString*)  _addtoview:(B4IPanelWrapper*) _panel :(int) _left :(int) _top :(float) _width :(float) _height{
float _f = 0.0f;
 //BA.debugLineNum = 29;BA.debugLine="Public Sub AddToView(Panel As Panel,Left As Int, T";
 //BA.debugLineNum = 30;BA.debugLine="Panel.AddView(sc,Left,Top,Width,Height)";
[_panel AddView:(UIView*)((self._sc).object) :(float) (_left) :(float) (_top) :_width :_height];
 //BA.debugLineNum = 31;BA.debugLine="If iv.Bitmap.IsInitialized=False Then";
if ([[self._iv Bitmap] IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 32;BA.debugLine="sc.ContentHeight=Height";
[self._sc setContentHeight:(int) (_height)];
 //BA.debugLineNum = 33;BA.debugLine="sc.ContentWidth=Width";
[self._sc setContentWidth:(int) (_width)];
 //BA.debugLineNum = 34;BA.debugLine="sc.Panel.AddView(iv,0,0,sc.ContentWidth,sc.Content";
[[self._sc Panel] AddView:(UIView*)((self._iv).object) :(float) (0) :(float) (0) :(float) ([self._sc ContentWidth]) :(float) ([self._sc ContentHeight])];
 }else {
 //BA.debugLineNum = 36;BA.debugLine="sc.ContentHeight=iv.Bitmap.Height";
[self._sc setContentHeight:(int) ([[self._iv Bitmap] Height])];
 //BA.debugLineNum = 37;BA.debugLine="sc.ContentWidth=iv.Bitmap.Width";
[self._sc setContentWidth:(int) ([[self._iv Bitmap] Width])];
 //BA.debugLineNum = 38;BA.debugLine="sc.Panel.AddView(iv,0,0,sc.ContentWidth,sc.Content";
[[self._sc Panel] AddView:(UIView*)((self._iv).object) :(float) (0) :(float) (0) :(float) ([self._sc ContentWidth]) :(float) ([self._sc ContentHeight])];
 //BA.debugLineNum = 39;BA.debugLine="Dim f As Float=Max(sc.Width/iv.Bitmap.Width,sc.Hei";
_f = (float) ([self.__c Max:[self._sc Width]/(double)[[self._iv Bitmap] Width] :[self._sc Height]/(double)[[self._iv Bitmap] Height]]);
 //BA.debugLineNum = 40;BA.debugLine="If f>1 Then f=1";
if (_f>1) { 
_f = (float) (1);};
 //BA.debugLineNum = 41;BA.debugLine="EnableZoom(sc,f,1)";
[self _enablezoom:self._sc :_f :(float) (1)];
 };
 //BA.debugLineNum = 43;BA.debugLine="End Sub";
return @"";
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
 //BA.debugLineNum = 3;BA.debugLine="Private sc As ScrollView";
self._sc = [B4IScrollView new];
 //BA.debugLineNum = 4;BA.debugLine="Private iv As ImageView";
self._iv = [B4IImageViewWrapper new];
 //BA.debugLineNum = 5;BA.debugLine="Private nome As NativeObject=Me";
self._nome = [B4INativeObject new];
self._nome.object = (NSObject*)(self);
 //BA.debugLineNum = 6;BA.debugLine="Private mnScale As Float";
self._mnscale = 0.0f;
 //BA.debugLineNum = 7;BA.debugLine="Private mxScale As Float=1";
self._mxscale = (float) (1);
 //BA.debugLineNum = 8;BA.debugLine="Private zScale As Float";
self._zscale = 0.0f;
 //BA.debugLineNum = 9;BA.debugLine="Private noSC As NativeObject";
self._nosc = [B4INativeObject new];
 //BA.debugLineNum = 10;BA.debugLine="Private mUnzoomDT=True";
self._munzoomdt = [self.bi BooleanToString:[self.__c True]];
 //BA.debugLineNum = 11;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _enablezoom:(B4IScrollView*) _scview :(float) _minscale :(float) _maxscale{
 //BA.debugLineNum = 73;BA.debugLine="Private Sub EnableZoom(scview As ScrollView,minSca";
 //BA.debugLineNum = 74;BA.debugLine="nome.RunMethod(\"EnableScroll::::\",Array(sc,minSca";
[self._nome RunMethod:@"EnableScroll::::" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)((self._sc).object)],[B4I nilToNSNull:(NSObject*)(@(_minscale))],[B4I nilToNSNull:(NSObject*)(@(_maxscale))],[B4I nilToNSNull:(NSObject*)((self._iv).object)]]]];
 //BA.debugLineNum = 75;BA.debugLine="noSC.RunMethod(\"setZoomScale:animated:\",Array(min";
[self._nosc RunMethod:@"setZoomScale:animated:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@(_minscale))],[B4I nilToNSNull:(NSObject*)(@([self.__c False]))]]]];
 //BA.debugLineNum = 76;BA.debugLine="mnScale=minScale";
self._mnscale = _minscale;
 //BA.debugLineNum = 77;BA.debugLine="zScale=1/noSC.GetField(\"zoomScale\").AsNumber";
self._zscale = (float) (1/(double)[self.bi ObjectToNumber:[[self._nosc GetField:@"zoomScale"] AsNumber]].doubleValue);
 //BA.debugLineNum = 78;BA.debugLine="End Sub";
return @"";
}
- (B4IScrollView*)  _getasview{
 //BA.debugLineNum = 124;BA.debugLine="Public Sub getAsView As ScrollView";
 //BA.debugLineNum = 125;BA.debugLine="Return sc";
if (true) return self._sc;
 //BA.debugLineNum = 126;BA.debugLine="End Sub";
return nil;
}
- (B4IBitmap*)  _getbitmap{
 //BA.debugLineNum = 146;BA.debugLine="Public Sub getBitmap As Bitmap";
 //BA.debugLineNum = 147;BA.debugLine="Return iv.Bitmap";
if (true) return [self._iv Bitmap];
 //BA.debugLineNum = 148;BA.debugLine="End Sub";
return nil;
}
- (float)  _getmaxscale{
float _f = 0.0f;
 //BA.debugLineNum = 103;BA.debugLine="Public Sub getMaxScale As Float";
 //BA.debugLineNum = 104;BA.debugLine="Dim f As Float=noSC.GetField(\"maximumZoomScale\").A";
_f = [self.bi ObjectToNumber:[[self._nosc GetField:@"maximumZoomScale"] AsNumber]].floatValue;
 //BA.debugLineNum = 105;BA.debugLine="Return f";
if (true) return _f;
 //BA.debugLineNum = 106;BA.debugLine="End Sub";
return 0.0f;
}
- (float)  _getminscale{
float _f = 0.0f;
 //BA.debugLineNum = 111;BA.debugLine="Public Sub getMinScale As Float";
 //BA.debugLineNum = 112;BA.debugLine="Dim f As Float=noSC.GetField(\"minimumZoomScale\").A";
_f = [self.bi ObjectToNumber:[[self._nosc GetField:@"minimumZoomScale"] AsNumber]].floatValue;
 //BA.debugLineNum = 113;BA.debugLine="Return f";
if (true) return _f;
 //BA.debugLineNum = 114;BA.debugLine="End Sub";
return 0.0f;
}
- (float)  _getscale{
 //BA.debugLineNum = 95;BA.debugLine="Public Sub getScale As Float";
 //BA.debugLineNum = 96;BA.debugLine="Return 1/zScale";
if (true) return (float) (1/(double)self._zscale);
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
return 0.0f;
}
- (B4IBitmap*)  _imageinrect:(B4IBitmap*) _img :(NSObject*) _r{
B4IBitmap* _b = nil;
 //BA.debugLineNum = 150;BA.debugLine="Private Sub ImageInRect(img As Bitmap,r As Object)";
 //BA.debugLineNum = 151;BA.debugLine="Dim b As Bitmap";
_b = [B4IBitmap new];
 //BA.debugLineNum = 152;BA.debugLine="b=nome.RunMethod(\"ImageInRect::\",Array(img,r))";
_b.object = (UIImage*)(([self._nome RunMethod:@"ImageInRect::" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)((_img).object)],[B4I nilToNSNull:_r]]]]).object);
 //BA.debugLineNum = 153;BA.debugLine="Return b";
if (true) return _b;
 //BA.debugLineNum = 154;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _initialize:(B4I*) _ba :(B4IBitmap*) _image{
[self initializeClassModule];
 //BA.debugLineNum = 14;BA.debugLine="Public Sub Initialize(Image As Bitmap)";
 //BA.debugLineNum = 15;BA.debugLine="sc.Initialize(\"sc\",100,100)";
[self._sc Initialize:self.bi :@"sc" :(int) (100) :(int) (100)];
 //BA.debugLineNum = 16;BA.debugLine="iv.Initialize(\"iv\")";
[self._iv Initialize:self.bi :@"iv"];
 //BA.debugLineNum = 17;BA.debugLine="noSC=sc";
self._nosc.object = (NSObject*)((self._sc).object);
 //BA.debugLineNum = 20;BA.debugLine="If Image.IsInitialized=False Then";
if ([_image IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 21;BA.debugLine="iv.Bitmap=Null";
[self._iv setBitmap:(B4IBitmap*) [B4IObjectWrapper createWrapper:[B4IBitmap new] object:(UIImage*)([self.__c Null])]];
 }else {
 //BA.debugLineNum = 23;BA.debugLine="iv.Bitmap=Image";
[self._iv setBitmap:_image];
 //BA.debugLineNum = 24;BA.debugLine="sc.ScrollEnabled=True";
[self._sc setScrollEnabled:[self.__c True]];
 };
 //BA.debugLineNum = 27;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _scview_doubletap{
 //BA.debugLineNum = 89;BA.debugLine="Private Sub scview_doubletap";
 //BA.debugLineNum = 90;BA.debugLine="If mUnzoomDT=True Then";
if ([self._munzoomdt isEqual:[self.bi BooleanToString:[self.__c True]]]) { 
 //BA.debugLineNum = 91;BA.debugLine="UnZOOM(True)";
[self _unzoom:[self.__c True]];
 };
 //BA.debugLineNum = 93;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _scview_zoom{
 //BA.debugLineNum = 85;BA.debugLine="Private Sub scview_zoom";
 //BA.debugLineNum = 87;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setbitmap:(B4IBitmap*) _image{
float _f = 0.0f;
 //BA.debugLineNum = 128;BA.debugLine="Public Sub setBitmap (Image As Bitmap)";
 //BA.debugLineNum = 130;BA.debugLine="iv.Bitmap=Image";
[self._iv setBitmap:_image];
 //BA.debugLineNum = 131;BA.debugLine="sc.ContentHeight=Image.Height";
[self._sc setContentHeight:(int) ([_image Height])];
 //BA.debugLineNum = 132;BA.debugLine="sc.ContentWidth=Image.Width";
[self._sc setContentWidth:(int) ([_image Width])];
 //BA.debugLineNum = 133;BA.debugLine="iv.Height=Image.Height";
[self._iv setHeight:[_image Height]];
 //BA.debugLineNum = 134;BA.debugLine="iv.Width=Image.Width";
[self._iv setWidth:[_image Width]];
 //BA.debugLineNum = 136;BA.debugLine="Dim f As Float=Max(sc.Width/iv.Bitmap.Width,sc.Hei";
_f = (float) ([self.__c Max:[self._sc Width]/(double)[[self._iv Bitmap] Width] :[self._sc Height]/(double)[[self._iv Bitmap] Height]]);
 //BA.debugLineNum = 137;BA.debugLine="If f>1 Then f=1";
if (_f>1) { 
_f = (float) (1);};
 //BA.debugLineNum = 139;BA.debugLine="If mnScale=0 Then";
if (self._mnscale==0) { 
 //BA.debugLineNum = 140;BA.debugLine="EnableZoom(sc,f,1)";
[self _enablezoom:self._sc :_f :(float) (1)];
 }else {
 //BA.debugLineNum = 142;BA.debugLine="EnableZoom(sc,mnScale,mxScale)";
[self _enablezoom:self._sc :self._mnscale :self._mxscale];
 };
 //BA.debugLineNum = 144;BA.debugLine="UnZOOM(False)";
[self _unzoom:[self.__c False]];
 //BA.debugLineNum = 145;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setmaxscale:(float) _scale{
 //BA.debugLineNum = 107;BA.debugLine="Public Sub setMaxScale (Scale As Float)";
 //BA.debugLineNum = 108;BA.debugLine="noSC.SetField(\"maximumZoomScale\",Scale)";
[self._nosc SetField:@"maximumZoomScale" :(NSObject*)(@(_scale))];
 //BA.debugLineNum = 109;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setminscale:(float) _scale{
 //BA.debugLineNum = 115;BA.debugLine="Public Sub setMinScale (Scale As Float)";
 //BA.debugLineNum = 116;BA.debugLine="noSC.SetField(\"minimumZoomScale\",Scale)";
[self._nosc SetField:@"minimumZoomScale" :(NSObject*)(@(_scale))];
 //BA.debugLineNum = 117;BA.debugLine="mnScale=Scale";
self._mnscale = _scale;
 //BA.debugLineNum = 118;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setscale:(float) _scale{
 //BA.debugLineNum = 98;BA.debugLine="Public Sub setScale (Scale As Float)";
 //BA.debugLineNum = 99;BA.debugLine="zScale=Scale";
self._zscale = _scale;
 //BA.debugLineNum = 100;BA.debugLine="noSC.RunMethod(\"setZoomScale:animated:\",Array(Scal";
[self._nosc RunMethod:@"setZoomScale:animated:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@(_scale))],[B4I nilToNSNull:(NSObject*)(@([self.__c False]))]]]];
 //BA.debugLineNum = 101;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setunzoomondoubletap:(BOOL) _value{
 //BA.debugLineNum = 120;BA.debugLine="Public Sub setUnZOOMonDoubleTap (Value As Boolean)";
 //BA.debugLineNum = 121;BA.debugLine="mUnzoomDT =Value";
self._munzoomdt = [self.bi BooleanToString:_value];
 //BA.debugLineNum = 122;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _unzoom:(BOOL) _annimated{
 //BA.debugLineNum = 61;BA.debugLine="Public Sub UnZOOM(annimated As Boolean)";
 //BA.debugLineNum = 63;BA.debugLine="noSC.RunMethod(\"setZoomScale:animated:\",Array(mnSc";
[self._nosc RunMethod:@"setZoomScale:animated:" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(@(self._mnscale))],[B4I nilToNSNull:(NSObject*)(@(_annimated))]]]];
 //BA.debugLineNum = 65;BA.debugLine="If sc.ContentWidth>sc.Width Then";
if ([self._sc ContentWidth]>[self._sc Width]) { 
 //BA.debugLineNum = 66;BA.debugLine="sc.ScrollOffsetX=(sc.ContentWidth-sc.Width)/2";
[self._sc setScrollOffsetX:(int) (([self._sc ContentWidth]-[self._sc Width])/(double)2)];
 }else if([self._sc ContentHeight]>[self._sc Height]) { 
 //BA.debugLineNum = 68;BA.debugLine="sc.ScrollOffsetY=(sc.ContentHeight-sc.Height)/2";
[self._sc setScrollOffsetY:(int) (([self._sc ContentHeight]-[self._sc Height])/(double)2)];
 };
 //BA.debugLineNum = 71;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _zoom_end:(float) _scale{
 //BA.debugLineNum = 81;BA.debugLine="Private Sub zoom_End(Scale As Float)";
 //BA.debugLineNum = 82;BA.debugLine="zScale=1/noSC.GetField(\"zoomScale\").AsNumber";
self._zscale = (float) (1/(double)[self.bi ObjectToNumber:[[self._nosc GetField:@"zoomScale"] AsNumber]].doubleValue);
 //BA.debugLineNum = 83;BA.debugLine="End Sub";
return @"";
}
- (B4IBitmap*)  _zoomedimage{
B4IBitmap* _b = nil;
float _scale = 0.0f;
float _l = 0.0f;
float _t = 0.0f;
float _w = 0.0f;
float _h = 0.0f;
NSObject* _r = nil;
 //BA.debugLineNum = 45;BA.debugLine="Sub ZoomedImage As Bitmap";
 //BA.debugLineNum = 47;BA.debugLine="Dim b As Bitmap";
_b = [B4IBitmap new];
 //BA.debugLineNum = 48;BA.debugLine="Dim Scale As Float=1/noSC.GetField(\"zoomScale\").As";
_scale = (float) (1/(double)[self.bi ObjectToNumber:[[self._nosc GetField:@"zoomScale"] AsNumber]].doubleValue);
 //BA.debugLineNum = 49;BA.debugLine="Dim l,t,w,h As Float";
_l = 0.0f;
_t = 0.0f;
_w = 0.0f;
_h = 0.0f;
 //BA.debugLineNum = 50;BA.debugLine="l=sc.ScrollOffsetX*Scale";
_l = (float) ([self._sc ScrollOffsetX]*_scale);
 //BA.debugLineNum = 51;BA.debugLine="t=sc.ScrollOffsety*Scale";
_t = (float) ([self._sc ScrollOffsetY]*_scale);
 //BA.debugLineNum = 52;BA.debugLine="w=sc.width*Scale";
_w = (float) ([self._sc Width]*_scale);
 //BA.debugLineNum = 53;BA.debugLine="h=sc.width*Scale";
_h = (float) ([self._sc Width]*_scale);
 //BA.debugLineNum = 54;BA.debugLine="Dim r As Object=nome.MakeRect(l,t,w,h)";
_r = (NSObject*)([self._nome MakeRect:_l :_t :_w :_h]);
 //BA.debugLineNum = 55;BA.debugLine="b=ImageInRect(iv.Bitmap,r)";
_b = [self _imageinrect:[self._iv Bitmap] :_r];
 //BA.debugLineNum = 56;BA.debugLine="Return b";
if (true) return _b;
 //BA.debugLineNum = 58;BA.debugLine="End Sub";
return nil;
}


-(UIImage*)ImageInRect: (UIImage*)image :(CGRect)rect
{


UIImage * LandscapeImage = image;
UIImage * PortraitImage = [[UIImage alloc] initWithCGImage: LandscapeImage.CGImage
                                                     scale: 1.0
                                               orientation: UIImageOrientationLeft];
CGImageRef imageRef = CGImageCreateWithImageInRect([PortraitImage CGImage], rect);

UIImage *img = [UIImage imageWithCGImage:imageRef]; 


CGImageRelease(imageRef);

return img;
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return (self._iv).object;
}


- (void)EnableScroll: (UIScrollView*)scr :(float)minS :(float)maxS :(UIImageView*)img
{

UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];

[doubleTap setNumberOfTapsRequired:2];

[scr addGestureRecognizer:doubleTap];




    scr.clipsToBounds = YES;
	
	scr.decelerationRate = UIScrollViewDecelerationRateFast;
    scr.minimumZoomScale=minS;
    scr.maximumZoomScale=maxS;
    scr.delegate=self;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{

[self.bi raiseEvent:nil event:@"zoom_end:" params:@[@((float)scale)]];
}

-(void)scrollViewDidScroll:(UIScrollView*)scrollView{
double cc=scrollView.contentOffset.x;
double cy=scrollView.contentOffset.y;

//[self.bi raiseEvent:nil event:@"scview_scrollchanged::" params:@[@((int)cc),@((int)cy)]];


}



- (void)scrollViewDidZoom:(UIScrollView *)sv
{


   [self.bi raiseUIEvent:nil event:@"scview_zoom" params:@[]];
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {  

    [self.bi raiseEvent:nil event:@"scview_doubletap" params:@[]];

  }  





@end
