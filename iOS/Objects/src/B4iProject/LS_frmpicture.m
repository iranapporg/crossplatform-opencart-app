
#import "iCore.h"
@interface LS_frmpicture:NSObject
@end

@implementation LS_frmpicture

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];
[B4ILayoutBuilder setScaleRate:0.0];

}
@end