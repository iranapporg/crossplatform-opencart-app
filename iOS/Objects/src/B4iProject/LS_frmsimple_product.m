
#import "iCore.h"
@interface LS_frmsimple_product:NSObject
@end

@implementation LS_frmsimple_product

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder scaleAll:views :width :height];

}
@end