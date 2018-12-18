
#import "iCore.h"
@interface LS_frmlogin:NSObject
@end

@implementation LS_frmlogin

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[B4ILayoutBuilder setScaleRate:0.0];
[views get:@"pnlloading1"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnlloading1"].Width / 2));
[views get:@"lblforgot"].Width = (int)(([views get:@"btnlogin"].Width));
[views get:@"lblforgot"].Left = (int)((50 / 100.0 * width) - ([views get:@"lblforgot"].Width / 2));
//BA.debugLineNum = 8;BA.debugLine="btnguest.HorizontalCenter = 50%x"[frmlogin/General script]
[views get:@"btnguest"].Left = (int)((50 / 100.0 * width) - ([views get:@"btnguest"].Width / 2));
//BA.debugLineNum = 9;BA.debugLine="btnlogin.HorizontalCenter = 50%x"[frmlogin/General script]
[views get:@"btnlogin"].Left = (int)((50 / 100.0 * width) - ([views get:@"btnlogin"].Width / 2));
//BA.debugLineNum = 10;BA.debugLine="pnlloading1.VerticalCenter = 38%y"[frmlogin/General script]
[views get:@"pnlloading1"].Top = (int)((38 / 100.0 * height) - ([views get:@"pnlloading1"].Height / 2));

}
@end