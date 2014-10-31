//
//  GameOverScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/15/14.
//
//

#import "GameOverScene.h"
#import "GameData.h"

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
        [self retrieveHighScoresForGame];
        [self setUpHighScoreTable];
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

-(void)retrieveHighScoresForGame
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    switch (self.gameDifficulty) {
        case 0:
            if (self.gameMode == 0)
            {
                self.highScores = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"easyClassicHighScores"]];
                [self updateHighScores];
                [defaults setObject:self.highScores forKey:@"easyClassicHighScores"];
            }
            else if (self.gameMode == 1)
            {
                self.highScores = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"easyContinuousHighScores"]];
                [self updateHighScores];
                [defaults setObject:self.highScores forKey:@"easyContinuousHighScores"];
            }
            break;
        case 1:
            if (self.gameMode == 0)
            {
                self.highScores = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"mediumClassicHighScores"]];
                [self updateHighScores];
                [defaults setObject:self.highScores forKey:@"mediumClassicHighScores"];
            }
            else if (self.gameMode == 1)
            {
                self.highScores = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"mediumContinuousHighScores"]];
                [self updateHighScores];
                [defaults setObject:self.highScores forKey:@"mediumContinuousHighScores"];
            }
            break;
        
        case 2:
            if (self.gameMode == 0)
            {
                self.highScores = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"easyClassicHighScores"]];
                [self updateHighScores];
                [defaults setObject:self.highScores forKey:@"hardClassicHighScores"];
            }
            else if (self.gameMode == 1)
            {
                self.highScores = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"easyContinuousHighScores"]];
                [self updateHighScores];
                [defaults setObject:self.highScores forKey:@"hardContinuousHighScores"];
            }
            break;
            
        default:
            break;
    }
    
    //saves defaults
    [defaults synchronize];
}

-(void)updateHighScores
{
    if (!self.highScores)
    {
        self.highScores = [NSMutableArray arrayWithCapacity:5];
    }
    for (int i = 0; i < 5; i++)
    {
        if(self.userScore > (int)[self highScores][i])
        {
            [self.highScores insertObject:[NSNumber numberWithInt:(int)self.userScore] atIndex:i];
            [self.highScores removeLastObject];
        }
    }
    
}

-(void)setUpHighScoreTable
{
    SKLabelNode *highScore1 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore1.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.75);
    highScore1.text = [NSString stringWithFormat:@"%d", (int)[self.highScores objectAtIndex:0]];
    [self addChild:highScore1];
    
    SKLabelNode *highScore2 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore2.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.65);
    highScore2.text = [NSString stringWithFormat:@"%d", (int)[self.highScores objectAtIndex:1]];
    [self addChild:highScore2];
    
    SKLabelNode *highScore3 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore3.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.55);
    highScore3.text = [NSString stringWithFormat:@"%d", (int)[self.highScores objectAtIndex:2]];
    [self addChild:highScore3];
    
    SKLabelNode *highScore4 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore4.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.45);
    highScore4.text = [NSString stringWithFormat:@"%d", (int)[self.highScores objectAtIndex:3]];
    [self addChild:highScore4];
    
    SKLabelNode *highScore5 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore5.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.35);
    highScore5.text = [NSString stringWithFormat:@"%d", (int)[self.highScores objectAtIndex:4]];
    [self addChild:highScore5];
    
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
