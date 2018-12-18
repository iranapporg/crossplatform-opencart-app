
#import "iCore.h"
@interface LS_frmteplate_slideshow:NSObject
@end

@implementation LS_frmteplate_slideshow

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[views get:@"imgads"].Height = (int)(([views get:@"pnlads"].Height));
[views get:@"imgads"].Width = (int)(([views get:@"pnlads"].Width));
[views get:@"panel1"].Left = (int)(([views get:@"pnlads"].Width)/2.0 - ([views get:@"panel1"].Width / 2));
[views get:@"panel1"].Top = (int)(([views get:@"pnlads"].Height)-([views get:@"panel1"].Height));
[views get:@"pbslideshow"].Left = (int)(([views get:@"pnlads"].Width)/2.0 - ([views get:@"pbslideshow"].Width / 2));
[views get:@"pbslideshow"].Top = (int)(([views get:@"pnlads"].Height)/2.0 - ([views get:@"pbslideshow"].Height / 2));

}
@end