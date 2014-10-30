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
        [self setupGameOver];
        self.contentCreated = YES;
    }
}

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        NSLog(@"In GameOver scene");
        
        self.backgroundColor = [SKColor blueColor];
        self.scaleMode = SKSceneScaleModeAspectFit;
        
        [self setupGameOver];
    }
    
    return self;
}

- (void)setupGameOver
{
    
    //adding Game Over Label
    SKLabelNode *gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    gameOverLabel.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.95);
    gameOverLabel.fontSize = 42;
    gameOverLabel.text = @"Game Over";
    [self addChild:gameOverLabel];
    
    //Displaying last user score
    SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    score.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.85);
    score.text = [NSString stringWithFormat:@"%d", (int)[self userScore]];
    [self addChild:score];
    NSLog(@"%d", (int)[self userScore]);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


@end
