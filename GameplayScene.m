//
//  GameplayScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/6/14.
//
//

#import "GameplayScene.h"
#import "Hole.h"

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

@end
