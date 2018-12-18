
#import "iCore.h"
@interface LS_frmabout:NSObject
@end

@implementation LS_frmabout

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
//BA.debugLineNum = 2;BA.debugLine="AutoScaleAll"[frmabout/General script]
[B4ILayoutBuilder scaleAll:views :width :height];
//BA.debugLineNum = 3;BA.debugLine="AutoScaleRate(0)"[frmabout/General script]
[B4ILayoutBuilder setScaleRate:0.0];
//BA.debugLineNum = 4;BA.debugLine="pnlloading1.HorizontalCenter = 50%x"[frmabout/General script]
[views get:@"pnlloading1"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnlloading1"].Width / 2));
//BA.debugLineNum = 5;BA.debugLine="pnlloading1.VerticalCenter = 38%y"[frmabout/General script]
[views get:@"pnlloading1"].Top = (int)((38 / 100.0 * height) - ([views get:@"pnlloading1"].Height / 2));

}
@end