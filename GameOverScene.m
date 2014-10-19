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
    //adding Game Over Label
    SKLabelNode *gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    gameOverLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.9);
    gameOverLabel.text = @"Game Over";
    [self addChild:gameOverLabel];
    
    //Displaying last user score
    SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    score.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.75);
    score.text = [NSString stringWithFormat:@"%ld", (long)[self userScore]];
    [self addChild:score];
    
    HighScoreScene *highScore = [[HighScoreScene alloc] initWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height*.5)];
    if (gameMode == 0)
    {
        [self addChild:[highScore drawClassicHighScore]];
    } else if (gameMode == 1)
    {
        [self addChild:[highScore drawContinuousHighScore]];
    }
}


@end
