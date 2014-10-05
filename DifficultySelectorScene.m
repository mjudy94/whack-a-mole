//
//  DifficultySelectorScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/5/14.
//
//

#import "DifficultySelectorScene.h"

@interface DifficultySelectorScene ()

@property BOOL contentCreated;

@end

@implementation DifficultySelectorScene

- (void)didMoveToView:(SKView *)view
{
    if(!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    
}



@end
