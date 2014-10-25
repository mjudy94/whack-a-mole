//
//  GameOverScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/15/14.
//
//

#import "GameOverScene.h"

@implementation GameOverScene

@synthesize gameMode;
@synthesize gameDifficulty;
@synthesize userScore;

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self drawGameOver];
        self.contentCreated = YES;
    }
}

- (void)drawGameOver
{
    
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    //adding Game Over Label
    SKLabelNode *gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    gameOverLabel.position = CGPointMake(0, self.frame.size.height * 0.4);
    gameOverLabel.fontSize = 42;
    gameOverLabel.text = @"Game Over";
    [self addChild:gameOverLabel];
    
    //Displaying last user score
    SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    score.position = CGPointMake(0, self.frame.size.height * 0.25);
    score.text = [NSString stringWithFormat:@"%ld", (long)[self userScore]];
    [self addChild:score];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


@end
