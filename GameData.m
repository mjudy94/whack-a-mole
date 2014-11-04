#import "GameData.h"

@implementation GameData

-(id)initWithName:(NSString *)dataName
{
    self.name = dataName;
    self.highScores = [[NSMutableArray alloc] initWithCapacity:5];
    NSInteger zero = 0;
    for (int i = 0; i < 5; i++)
    {
        [self.highScores addObject:[NSNumber numberWithInteger:zero]];
    }
    
    return self;
}

-(id)initWithScores:(NSMutableArray *)scores
{
    self.highScores = scores;
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.highScores forKey:@"highScores"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
       _highScores = [decoder decodeObjectForKey: @"highScores"];
    }
    return self;
}

@end