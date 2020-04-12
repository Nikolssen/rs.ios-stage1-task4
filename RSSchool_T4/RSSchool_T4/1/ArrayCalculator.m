#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {

    NSMutableArray *filterArray = [array mutableCopy];

    for (int i=0; i<[filterArray count]; i++)
    {
        if (![[filterArray objectAtIndex:i] isKindOfClass:[NSNumber class]])
        {
            [filterArray removeObjectAtIndex:i];
            i--;
        }
    }
    if ([filterArray count] == 0) return 0;
    
    if ([filterArray count] <= numberOfItems) {
        int result = 1;
        for (NSNumber *number in filterArray) {
            result*= [number intValue];
        }
        return result;
    }
    
   array = [filterArray sortedArrayUsingSelector:@selector(compare:)];
    int border = 0;
    for (int i = 0; i< [array count]; i++)
    {
        if ([[array objectAtIndex:i] intValue]<0) continue;
        else
        {   border = i;
            break;
        }
    }
    if (border == 0)
    {
        int result = 1;
        for (int i = ([array count] -1); numberOfItems > 0; i--)
        {
            result*=[[array objectAtIndex:i] intValue];
            numberOfItems --;
        }
        return result;
    }
    else
    {
        int result =1;
        int i = 0;
        int k = border % 2 -1;
        while (i<=k && ((border+k)< [array count]-1)) {
             if ( [[array objectAtIndex:i] intValue]*[[array objectAtIndex:(i+1)]intValue] > [[array objectAtIndex:border+i] intValue]*[[array objectAtIndex:(border+1+i)]intValue])
             {result*= [[array objectAtIndex:0] intValue]*[[array objectAtIndex:1]intValue];
                 numberOfItems -=2;}
            i++;
        }

        
            
        
            for (int i = ([array count] -1); numberOfItems > 0; i--)
        {
            result*=[[array objectAtIndex:i] intValue];
            numberOfItems --;
        }
        return result;
    }
    
    return -1;
}
@end
