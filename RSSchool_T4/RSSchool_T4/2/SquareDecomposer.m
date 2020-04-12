#import "SquareDecomposer.h"


@implementation SquareDecomposer

- (NSMutableArray *) searchSquare: (NSNumber*) number withRest: (NSNumber*) rest {
    NSMutableArray *result = [NSMutableArray new];
    
    if ([rest longLongValue] == 0){
        [result addObject:number];
        return result;
    }
  
    for (long long i= [number longLongValue] -1; i>0; i--) {
                
        if ([rest longLongValue] - i * i >= 0) {
            NSNumber *restNumber = [NSNumber numberWithLongLong: ([rest longLongValue] - i * i)];
            NSNumber *lastNumber = [NSNumber numberWithLongLong:i];
            result = [self searchSquare:lastNumber withRest:restNumber];
            if (result)
            {   [result addObject:number];
                return result;
            }
            
        }
    }
    return nil;

}

- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {

    if ([number intValue]<=2)
        return nil;
    
    long long sqrInt = [number longLongValue]*[number longLongValue];
    NSNumber *sqrNumber = [NSNumber numberWithUnsignedLong: sqrInt];
    NSMutableArray *input = [self searchSquare:number withRest:sqrNumber];
    if ([input lastObject])
        [input removeLastObject];
        return input;
    }
@end
