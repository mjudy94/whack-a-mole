//
//  GameplayScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/6/14.
//
//

#import "GameplayScene.h"

@interface GameplayScene ()

@property BOOL contentCreated;

@end

@implementation GameplayScene

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
