#import "FullBinaryTrees.h"

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    if (count % 2 == 0) return @"[]";
    if (count == 1) return @"[[0]]";
    return 0;
}
@end
