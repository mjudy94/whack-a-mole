//
//  GameplayScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/6/14.
//
//

#import "GameplayScene.h"

@implementation GameplayScene

@synthesize gameMode;
@synthesize gameDifficulty;


- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self drawGame];
        self.contentCreated = YES;
    }
}

- (void)drawGame
{
    NSLog(@"The game mode is: %i", [self gameMode]);
    NSLog(@"The game difficulty is: %i", [self gameDifficulty]);
    
    self.backgroundColor = [SKColor colorWithRed:0.0 green:0.6 blue:0.0 alpha:1.0];
    
    
    
}

- (Hole *)setupHoles
{
    Hole *_holeLayer = [[Hole alloc] init];
    if(gameDifficulty == 0)
    {
        [_holeLayer setNumColumns:3];
        [_holeLayer setNumRows:3];
    }
    else
    {
        [_holeLayer setNumColumns:4];
        [_holeLayer setNumRows:4];
    }
    
    return _holeLayer;
}

- (NSSet *)setupMoles
{
    
}

@end
