
#import "iCore.h"
@interface LS_frmaccounts:NSObject
@end

@implementation LS_frmaccounts

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[B4ILayoutBuilder setScaleRate:0.0];
[views get:@"pnlloading1"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnlloading1"].Width / 2));
//BA.debugLineNum = 5;BA.debugLine="pnlloading1.VerticalCenter = 50%y"[frmaccounts/General script]
[views get:@"pnlloading1"].Top = (int)((50 / 100.0 * height) - ([views get:@"pnlloading1"].Height / 2));
//BA.debugLineNum = 6;BA.debugLine="pnlaction_address.HorizontalCenter = 50%x"[frmaccounts/General script]
[views get:@"pnlaction_address"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnlaction_address"].Width / 2));

}
@end