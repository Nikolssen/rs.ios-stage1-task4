#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSDictionary *numberDict = @{
        @1: @[@2, @4],
        @2: @[@1, @3, @5],
        @3: @[@2, @6],
        @4: @[@1, @5, @7],
        @5: @[@2, @4, @6, @8],
        @6: @[@3, @5, @9],
        @7: @[@4, @8],
        @8: @[@5, @7, @9, @0],
        @9: @[@6, @8],
        @0: @[@8]
    };
    if ([number rangeOfCharacterFromSet: [[NSCharacterSet decimalDigitCharacterSet]invertedSet]].location != NSNotFound) return nil;
    NSMutableSet <NSString *> *resultSet = [[NSMutableSet alloc] init];
    NSRange range = NSMakeRange(0, 1);
    for (int i=0; i<[number length]; i++) {
        range.location = i;
        
        NSNumber *numberInDict = [[NSNumber alloc] initWithInt:[[number substringWithRange: range] intValue]];
        
        for (NSNumber *num in numberDict[numberInDict]) {
            NSMutableString *tempString = [number mutableCopy];
            NSMutableString *curNumber = [[NSMutableString alloc] initWithFormat:@"%d",[num intValue]];
            [tempString replaceCharactersInRange:range withString:curNumber];
            [resultSet addObject:tempString];
        }
    }
    NSMutableArray <NSString *> *resultArray = [[NSMutableArray alloc] initWithArray:[resultSet allObjects]];
    return resultArray;
}
@end
