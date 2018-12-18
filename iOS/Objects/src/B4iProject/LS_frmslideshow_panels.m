
#import "iCore.h"
@interface LS_frmslideshow_panels:NSObject
@end

@implementation LS_frmslideshow_panels

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[views get:@"panel1"].Left = (int)(([views get:@"pnlads"].Width)/2.0 - ([views get:@"panel1"].Width / 2));
[views get:@"pbslideshow"].Left = (int)(([views get:@"pnlads"].Width)/2.0 - ([views get:@"pbslideshow"].Width / 2));
[views get:@"pbslideshow"].Top = (int)(([views get:@"pnlads"].Height)/2.0 - ([views get:@"pbslideshow"].Height / 2));
[views get:@"pnlcircle"].Top = (int)(([views get:@"pnlads"].Top)+([views get:@"pnlads"].Height));

}
@end