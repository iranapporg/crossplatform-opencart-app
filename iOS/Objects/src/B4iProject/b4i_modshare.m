
#import "b4i_modshare.h"
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


@implementation b4i_modshare 


+ (instancetype)new {
    static b4i_modshare* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _activity_completed:(BOOL) _status :(NSString*) _t{
 //BA.debugLineNum = 91;BA.debugLine="Sub activity_completed(status As Boolean, T As Str";
 //BA.debugLineNum = 101;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _process_globals{
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
 //BA.debugLineNum = 1;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private myPage As Page 'ignore";
self._mypage = [B4IPage new];
 //BA.debugLineNum = 5;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _sharetosocialmedia:(B4IPage*) _p :(NSString*) _txt :(NSString*) _theurl :(B4IViewWrapper*) _sharebutton{
B4IViewWrapper* _v = nil;
B4INativeObject* _nativeme = nil;
B4INativeObject* _nativeme2 = nil;
B4INativeObject* _nativeme3 = nil;
NSObject* _nb = nil;
 //BA.debugLineNum = 103;BA.debugLine="Sub ShareToSocialMedia(p As Page, txt As String, t";
 //BA.debugLineNum = 105;BA.debugLine="Dim v As View = shareButton";
_v = [B4IViewWrapper new];
_v = _sharebutton;
 //BA.debugLineNum = 107;BA.debugLine="myPage = p";
self._mypage = _p;
 //BA.debugLineNum = 108;BA.debugLine="Dim NativeMe As NativeObject = Me";
_nativeme = [B4INativeObject new];
_nativeme.object = (NSObject*)(self);
 //BA.debugLineNum = 109;BA.debugLine="Dim NativeMe2 As NativeObject = Library.NavContro";
_nativeme2 = [B4INativeObject new];
_nativeme2.object = (NSObject*)((self._library._navcontrol).object);
 //BA.debugLineNum = 110;BA.debugLine="Dim NativeMe3 As NativeObject = NativeMe2.GetFiel";
_nativeme3 = [B4INativeObject new];
_nativeme3 = [_nativeme2 GetField:@"navigationBar"];
 //BA.debugLineNum = 111;BA.debugLine="Dim nb As Object = NativeMe3";
_nb = (NSObject*)((_nativeme3).object);
 //BA.debugLineNum = 113;BA.debugLine="If Library.NavControl.NavigationBarVisible Then";
if ([self._library._navcontrol NavigationBarVisible]) { 
 //BA.debugLineNum = 114;BA.debugLine="NativeMe.RunMethod(\"share2SocialMedia:::::\", Arr";
[_nativeme RunMethod:@"share2SocialMedia:::::" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(_txt)],[B4I nilToNSNull:(NSObject*)(_theurl)],[B4I nilToNSNull:(NSObject*)([@[[[self.__c File] DirAssets],@"/logo.png"] componentsJoinedByString:@""])],[B4I nilToNSNull:(NSObject*)((_v).object)],[B4I nilToNSNull:_nb]]]];
 }else {
 //BA.debugLineNum = 116;BA.debugLine="NativeMe.RunMethod(\"share2SocialMedia:::::\", Arr";
[_nativeme RunMethod:@"share2SocialMedia:::::" :[[B4IArray alloc]initObjectsWithData:@[[B4I nilToNSNull:(NSObject*)(_txt)],[B4I nilToNSNull:(NSObject*)(_theurl)],[B4I nilToNSNull:(NSObject*)([@[[[self.__c File] DirAssets],@"/logo.png"] componentsJoinedByString:@""])],[B4I nilToNSNull:(NSObject*)((_v).object)],[B4I nilToNSNull:[self.__c Null]]]]];
 };
 //BA.debugLineNum = 119;BA.debugLine="End Sub";
return @"";
}

//- (void)share2SocialMedia:(NSString *)txt :(NSString *)theurl :(NSString *)theimg :(UIView *)SBview :(float)nbHeight
- (void)share2SocialMedia:(NSString *)txt :(NSString *)theurl :(NSString *)theimg :(UIView *)SBview :(UINavigationBar *)nb
{

   CGFloat STATUS_BAR_HEIGHT = (
       [UIApplication sharedApplication].statusBarHidden ? 0 : (
         [UIApplication sharedApplication].statusBarFrame.size.height > 100 ?
         [UIApplication sharedApplication].statusBarFrame.size.width :
         [UIApplication sharedApplication].statusBarFrame.size.height
       )
   );

     //NSString *text = @"How to add Facebook and Twitter sharing to an iOS app";
     NSString *text = txt;
     //NSURL *url = [NSURL URLWithString:@"http://roadfiresoftware.com/2014/02/how-to-add-facebook-and-twitter-sharing-to-an-ios-app/"];
     NSURL *url = [NSURL URLWithString:theurl];
     //UIImage *image = [UIImage imageNamed:@"roadfire-icon-square-200"];
     UIImage *image;

     if([theimg hasPrefix:@"http://"] || [theimg hasPrefix:@"https://"] ) {
       image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:theimg]]];
     } else {
     if (theimg != nil && [theimg length] > 0) {
         image = [UIImage imageNamed:theimg];
       } else {
       image = nil;
     }
   }

     UIActivityViewController *controller =
     [[UIActivityViewController alloc]
     initWithActivityItems:@[text, url, image]
     applicationActivities:nil];

     controller.excludedActivityTypes = @[UIActivityTypePostToWeibo,
     UIActivityTypePrint,
     UIActivityTypeAssignToContact,
     UIActivityTypeSaveToCameraRoll,
     UIActivityTypeAddToReadingList,
     UIActivityTypePostToFlickr,
     UIActivityTypePostToVimeo,
     UIActivityTypePostToTencentWeibo];

     [controller setCompletionHandler:^(NSString*activityType, BOOL completed) {

       // Raise the event for B4i
       if (completed) {
       [self.bi raiseEvent:nil event:@"activity_completed::" params:@[@((BOOL)completed),(activityType)]];
       } else {

         NSString *activity = @"";
       [self.bi raiseEvent:nil event:@"activity_completed::" params:@[@((BOOL)completed),(activity)]];
       }
     }];

     //if iPhone
     if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
     [(self._mypage).object presentViewController:controller animated:YES completion:nil];
   } else { //if iPad

       UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:controller];
     UIWindow *window = [[UIApplication sharedApplication] keyWindow];
     UIView *topView = window.rootViewController.view;
     CGFloat extra = 0;
   
     if (nb != nil) {
       extra += nb.frame.size.height;
     }
   
     if ([UIApplication sharedApplication].statusBarHidden == NO)
     {
       extra += STATUS_BAR_HEIGHT;
     }
 
     //[popup presentPopoverFromRect:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/4, 0, 0)inView:topView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
     //[popup presentPopoverFromRect:CGRectMake(SBview.Left + SBview.Width/2, SBview.Top+SBview.Height,0,SBview.Height)inView:topView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
       [popup presentPopoverFromRect:CGRectMake(SBview.Left + SBview.Width/2, SBview.Top+SBview.Height+extra, 0, 0)inView:topView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
     }
}

@end
