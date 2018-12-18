
#import "iCore.h"
@interface LS_frmsplash:NSObject
@end

@implementation LS_frmsplash

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[views get:@"pnlheader"].Height = (int)((33 / 100.0 * height));
[views get:@"pnlprogress"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnlprogress"].Width / 2));
[views get:@"pnlprogress"].Top = (int)((83 / 100.0 * height) - ([views get:@"pnlprogress"].Height / 2));
[views get:@"pb1"].Left = (int)(([views get:@"pnlprogress"].Width)/2.0 - ([views get:@"pb1"].Width / 2));
[views get:@"pnllogo"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnllogo"].Width / 2));
[views get:@"pnllogo"].Top = (int)((38 / 100.0 * height) - ([views get:@"pnllogo"].Height / 2));

}
@end