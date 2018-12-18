
#import "iCore.h"
@interface LS_frmwelcome2app:NSObject
@end

@implementation LS_frmwelcome2app

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[views get:@"panel2"].Left = (int)((50 / 100.0 * width) - ([views get:@"panel2"].Width / 2));
[views get:@"panel2"].Top = (int)((50 / 100.0 * height) - ([views get:@"panel2"].Height / 2));

}
@end