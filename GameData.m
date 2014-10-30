//
//  GameData.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/30/14.
//
//

#import "GameData.h"

@implementation GameData

+(instancetype)sharedGameData
{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    
    return sharedInstance;
}

-(void)reset
{
    self.userScore = 0;
    self.gameDifficulty = -1;
    self.gameMode = -1;
    self.lengthOfGame = 0;
    self.molesHit = 0;
}

@end
