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
@synthesize lengthOfGame;

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self setupGameOver];
        self.contentCreated = YES;
    }
}

-(id)initWithSize:(CGSize)size withUserScore:(int)score withGameMode:(int)mode withDifficulty:(int)difficulty withGameLength:(CFTimeInterval)length
{
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [SKColor blueColor];
        self.scaleMode = SKSceneScaleModeAspectFit;
        [self setUserScore:score];
        [self setGameMode:mode];
        [self setGameDifficulty:difficulty];
        [self setLengthOfGame:length];
        
        [self setupGameOver];
        [self addReturnToMainMenuNode];
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
    
}

-(void)addReturnToMainMenuNode
{
    SKLabelNode *mainMenuNode = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    mainMenuNode.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.15);
    mainMenuNode.fontSize = 36;
    mainMenuNode.name = @"mainMenu";
    mainMenuNode.text = @"Return to Main Menu";
    [self addChild:mainMenuNode];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if ([node.name  isEqual: @"mainMenu"])
    {
        MainMenuScene *mainMenu = [[MainMenuScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.25];
        [self.view presentScene:mainMenu transition:doors];
    }
}


@end
