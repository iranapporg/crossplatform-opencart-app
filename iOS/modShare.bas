Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
Sub Process_Globals

  Private myPage As Page 'ignore
 
End Sub

#IF OBJC

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

#End If

Sub activity_completed(status As Boolean, T As String)

 'If Main.DEBUG Then
 '    Utils.Log_("onSharingDone: Status = " & status & " - Type: " & T & " - Will look for callback: ShareModule_SharingCompleted in " & myPage.Title)
 'End If

  'If SubExists(myPage, "ShareModule_SharingCompleted", 2) = True Then
   '  CallSub3(myPage, "ShareModule_SharingCompleted", status, T)
  'End If

End Sub

Sub ShareToSocialMedia(p As Page, txt As String, theURL As String, shareButton As View)

	Dim v As View = shareButton

	myPage = p
	Dim NativeMe As NativeObject = Me
	Dim NativeMe2 As NativeObject = Library.NavControl
	Dim NativeMe3 As NativeObject = NativeMe2.GetField("navigationBar")
	Dim nb As Object = NativeMe3

	If Library.NavControl.NavigationBarVisible Then
		NativeMe.RunMethod("share2SocialMedia:::::", Array As Object(txt, theURL, File.DirAssets & "/logo.png", v, nb)) 
	Else
		NativeMe.RunMethod("share2SocialMedia:::::", Array As Object(txt, theURL, File.DirAssets & "/logo.png", v, Null))
	End If

End Sub