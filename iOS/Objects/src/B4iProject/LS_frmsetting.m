
#import "iCore.h"
@interface LS_frmsetting:NSObject
@end

@implementation LS_frmsetting

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[B4ILayoutBuilder setScaleRate:0.0];

}
@end