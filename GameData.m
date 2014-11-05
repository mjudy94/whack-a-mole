#import "GameData.h"

@implementation GameData


//initialize a GameData object with a high score array of 5 0's
-(id)init
{
    self.highScores = [[NSMutableArray alloc] initWithCapacity:5];
    NSInteger zero = 0;
    for (int i = 0; i < 5; i++)
    {
        [self.highScores addObject:[NSNumber numberWithInteger:zero]];
    }
    
    return self;
}

//initialize a GameData object with a high score array
-(id)initWithScores:(NSMutableArray *)scores
{
    self.highScores = scores;
    return self;
}

//encode the highScores array for the GameData object
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.highScores forKey:@"highScores"];
}

//decode the highscores array for the GameData object
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
       _highScores = [decoder decodeObjectForKey: @"highScores"];
    }
    return self;
}

@end