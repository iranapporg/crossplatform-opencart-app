
#import "iCore.h"
@interface LS_frmupdate:NSObject
@end

@implementation LS_frmupdate

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[views get:@"panel1"].Left = (int)((50 / 100.0 * width) - ([views get:@"panel1"].Width / 2));
[views get:@"panel1"].Top = (int)((36 / 100.0 * height) - ([views get:@"panel1"].Height / 2));
[views get:@"imageview1"].Left = (int)(([views get:@"panel1"].Width)/2.0 - ([views get:@"imageview1"].Width / 2));

}
@end