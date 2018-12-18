
#import "iCore.h"
@interface LS_frmsms:NSObject
@end

@implementation LS_frmsms

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[B4ILayoutBuilder setScaleRate:0.0];
[views get:@"btnproduts"].Width = (int)((50 / 100.0 * width));
[views get:@"btnsend"].Width = (int)((50 / 100.0 * width));
[views get:@"btnsend"].Left = (int)((50 / 100.0 * width));

}
@end