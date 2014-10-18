//
//  DifficultySelectorScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/5/14.
//
//

#import "DifficultySelectorScene.h"
#import "GameplayScene.h"

@implementation DifficultySelectorScene

@synthesize gameplayMode;

+ (void)setGameplayMode:(NSInteger)gameplayMode
{
    self.gameplayMode = gameplayMode;
}


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
    [self addChild:[self newEasyNode]];
    [self addChild:[self newMediumNode]];
    [self addChild:[self newHardNode]];
}

- (SKLabelNode *)newEasyNode
{
    SKLabelNode *easyButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    easyButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.4);
    easyButton.name = @"easyButton";
    easyButton.text = @"Easy";
    
    return easyButton;
}

- (SKLabelNode *)newMediumNode
{
    SKLabelNode *mediumButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    mediumButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.3);
    mediumButton.name = @"mediumButton";
    mediumButton.text = @"Medium";
    
    return mediumButton;
}

- (SKLabelNode *)newHardNode
{
    SKLabelNode *hardButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    hardButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.2);
    hardButton.name = @"hardButton";
    hardButton.text = @"Hard";
    
    return hardButton;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if([node.name isEqualToString:@"easyButton"])
    {
        [self setUpGameplay:[self gameplayMode] difficultyLevel:0];
    }
    
    if([node.name isEqualToString:@"mediumButton"])
    {
        [self setUpGameplay:[self gameplayMode] difficultyLevel:1];
    }
    
    if([node.name isEqualToString:@"hardButton"])
    {
        [self setUpGameplay:[self gameplayMode] difficultyLevel:2];
    }
    
}

- (void)setUpGameplay:(NSInteger)gameMode difficultyLevel:(NSInteger)difficultyLevel
{
    NSLog(@"%ld", (long)difficultyLevel);
    GameplayScene *gameScene = [[GameplayScene alloc] initWithSize:self.size withDifficultyLevel:difficultyLevel];
    SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.25];
    [gameScene setGameMode:gameMode];
    [gameScene setGameDifficulty:difficultyLevel];
    [self.view presentScene:gameScene transition:doors];
    
}


@end
