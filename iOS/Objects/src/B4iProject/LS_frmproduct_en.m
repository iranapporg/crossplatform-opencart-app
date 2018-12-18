
#import "iCore.h"
@interface LS_frmproduct_en:NSObject
@end

@implementation LS_frmproduct_en

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[views get:@"btnreviews"].Width = (int)((100 / 100.0 * width)/2.0);
[views get:@"btnattributes"].Width = (int)((100 / 100.0 * width)/2.0);
[views get:@"btnattributes"].Left = (int)(([views get:@"btnreviews"].Width)+1.0);
[views get:@"lblreview"].Left = (int)(([views get:@"btnreviews"].Width)-([views get:@"lblreview"].Width)-6.0);
[views get:@"pnllistnumb"].Left = (int)((50 / 100.0 * width) - ([views get:@"pnllistnumb"].Width / 2));

}
@end