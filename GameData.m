#import "GameData.h"

@implementation GameData

-(id)initWithName:(NSString *)dataName
{
    self.name = dataName;
    self.highScores = [[NSMutableArray alloc] initWithObjects:@0, @0, @0, @0, @0, nil];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.easyClassicHighScores forKey:@"easyClassic"];
    [encoder encodeObject:self.easyContinuousHighScores forKey:@"easyContinuous"];
    
    [encoder encodeObject:self.mediumClassicHighScores forKey:@"mediumClassic"];
    [encoder encodeObject:self.mediumContinuousHighScores forKey:@"mediumContinuous"];
    
    [encoder encodeObject:self.hardClassicHighScores forKey:@"hardClassic"];
    [encoder encodeObject:self.hardContinuousHighScores forKey:@"hardContinous"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _easyClassicHighScores = [decoder decodeObjectForKey: @"easyClassic"];
        _easyContinuousHighScores = [decoder decodeObjectForKey:@"easyContinuous"];
        
        _mediumClassicHighScores = [decoder decodeObjectForKey:@"mediumClassic"];
        _mediumContinuousHighScores = [decoder decodeObjectForKey:@"mediumContinuous"];
        
        _hardClassicHighScores = [decoder decodeObjectForKey:@"hardClassic"];
        _hardContinuousHighScores = [decoder decodeObjectForKey:@"hardContinuous"];
    }
    return self;
}

@end