
#import "iCore.h"
@interface LS_frmtime:NSObject
@end

@implementation LS_frmtime

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[views get:@"pnldate_time"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnldate_time"].Width / 2));
[views get:@"pnldate_time"].Top = (int)((50 / 100.0 * height) - ([views get:@"pnldate_time"].Height / 2));

}
@end