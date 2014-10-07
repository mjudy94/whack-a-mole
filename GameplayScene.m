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
    
}

@end
