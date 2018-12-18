
#import "iCore.h"
@interface LS_frmslidemenu:NSObject
@end

@implementation LS_frmslidemenu

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];

}
@end