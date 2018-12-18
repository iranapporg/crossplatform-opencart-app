
#import "iCore.h"
@interface LS_frmerronet:NSObject
@end

@implementation LS_frmerronet

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[views get:@"lblalert"].Left = (int)(([views get:@"pnlmain"].Width)/2.0 - ([views get:@"lblalert"].Width / 2));
[views get:@"btnsetting"].Left = (int)(([views get:@"pnlmain"].Width)/2.0 - ([views get:@"btnsetting"].Width / 2));
[views get:@"btnretry"].Left = (int)(([views get:@"pnlmain"].Width)/2.0 - ([views get:@"btnretry"].Width / 2));
//BA.debugLineNum = 6;BA.debugLine="pnlmain.HorizontalCenter = 50%x"[frmerronet/General script]
[views get:@"pnlmain"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnlmain"].Width / 2));
//BA.debugLineNum = 7;BA.debugLine="pnlmain.VerticalCenter = 53%y"[frmerronet/General script]
[views get:@"pnlmain"].Top = (int)((53 / 100.0 * height) - ([views get:@"pnlmain"].Height / 2));

}
@end