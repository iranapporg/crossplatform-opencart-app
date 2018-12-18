
#import "iCore.h"
@interface LS_frmorder_details:NSObject
@end

@implementation LS_frmorder_details

- (void)LS_general:(B4ILayoutData*)views :(int)width :(int)height{
[B4ILayoutBuilder setScaleRate:0.3];
[B4ILayoutBuilder setScaleRate:0.0];
[B4ILayoutBuilder scaleAll:views :width :height];

}
@end