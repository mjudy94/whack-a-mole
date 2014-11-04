//
//  GameOverScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/15/14.
//
//

#import "GameOverScene.h"
#import "GameData.h"
#import "GameDataStore.h"

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

//initialize the GameOverScene and set it's instance variables
-(id)initWithSize:(CGSize)size withUserScore:(int)score withGameMode:(int)mode withDifficulty:(int)difficulty withGameLength:(CFTimeInterval)length
{
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [SKColor blueColor];
        self.scaleMode = SKSceneScaleModeAspectFit;
        
        //set instance varaibles
        [self setUserScore:score];
        [self setGameMode:mode];
        [self setGameDifficulty:difficulty];
        [self setLengthOfGame:length];
        
        //set up the data to be displayed
        [self setupGameOver];
        [self retrieveHighScoresForGame];
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
    
    //add a label to say "Score: "
    SKLabelNode *userScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    gameOverLabel.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.9);
    gameOverLabel.fontSize = 42;
    gameOverLabel.text = @"Score: ";
    [self addChild:userScoreLabel];
    
    //Displaying last user score
    SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    score.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.85);
    score.text = [NSString stringWithFormat:@"%d", (int)[self userScore]];
    [self addChild:score];
    
    //Add a label node that will return the user to the main menu scene
    SKLabelNode *mainMenuNode = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    mainMenuNode.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.15);
    mainMenuNode.fontSize = 36;
    mainMenuNode.name = @"mainMenu";
    mainMenuNode.text = @"Return to Main Menu";
    [self addChild:mainMenuNode];
    
}

-(void)retrieveHighScoresForGame
{
    //retrieve the appropriate highScores array from sharedStore then update the array based on the current userScore
    NSMutableArray *allHighScores = [GameDataStore sharedStore].allItems;
    switch (self.gameDifficulty) {
        case 0:
            if (self.gameMode == 0)
            {
                self.highScores = [[allHighScores objectAtIndex:0] highScores];
                [self updateHighScores:@"easyClassicHighScores"];
                [[GameDataStore sharedStore] updateHighScore:self.highScores forIndex:0];
            }
            else if (self.gameMode == 1)
            {
                self.highScores = [[allHighScores objectAtIndex:1] highScores];
                [self updateHighScores:@"easyContinuousHighScores"];
                [[GameDataStore sharedStore] updateHighScore:self.highScores forIndex:1];
            }
            break;
        case 1:
            if (self.gameMode == 0)
            {
                self.highScores = [[allHighScores objectAtIndex:2] highScores];
                [self updateHighScores:@"mediumClassicHighScores"];
                [[GameDataStore sharedStore] updateHighScore:self.highScores forIndex:2];
            }
            else if (self.gameMode == 1)
            {
                self.highScores = [[allHighScores objectAtIndex:3] highScores];
                [self updateHighScores:@"mediumContinuousHighScores"];
                [[GameDataStore sharedStore] updateHighScore:self.highScores forIndex:3];
            }
            break;
        
        case 2:
            if (self.gameMode == 0)
            {
                self.highScores = [[allHighScores objectAtIndex:4] highScores];
                [self updateHighScores:@"easyClassicHighScores"];
                [[GameDataStore sharedStore] updateHighScore:self.highScores forIndex:4];
            }
            else if (self.gameMode == 1)
            {
                self.highScores = [[allHighScores objectAtIndex:5] highScores];
                [self updateHighScores:@"easyContinuousHighScores"];
                [[GameDataStore sharedStore] updateHighScore:self.highScores forIndex:5];
            }
            break;
            
        default:
            break;
    }
    
    //Save the updated sharedStore
    BOOL saved = [[GameDataStore sharedStore] saveChanges];
    if(saved)
    {
        NSLog(@"It saved!!!");
    }
    
}

//update the highScores array with the current user score then display the top 5 high scores below the userScore
-(void)updateHighScores:(NSString *)arrayKey
{
    for (int i = 0; i < 5; i++)
    {
        NSNumber *newVal = [NSNumber numberWithInt:(int)self.userScore];
        if(self.userScore > [[self.highScores objectAtIndex:i] intValue])
        {
            //NSLog(@"user score is greater than a high score");
            //NSLog(@"%d", (int)self.userScore);
            
            [[self highScores] insertObject:newVal atIndex:i];
            [[self highScores] removeLastObject];
            break;
        }
    }

    
    SKLabelNode *highScoreDisplay = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScoreDisplay.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.8);
    highScoreDisplay.text = @"High Scores:";
    highScoreDisplay.fontSize = 38;
    [self addChild:highScoreDisplay];
    
    SKLabelNode *highScore1 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore1.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.75);
    highScore1.text = [NSString stringWithFormat:@"%d", [[self.highScores objectAtIndex:0] intValue]];
    [self addChild:highScore1];
    
    SKLabelNode *highScore2 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore2.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.65);
    highScore2.text = [NSString stringWithFormat:@"%d", [[self.highScores objectAtIndex:1] intValue]];
    [self addChild:highScore2];
    
    SKLabelNode *highScore3 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore3.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.55);
    highScore3.text = [NSString stringWithFormat:@"%d", [[self.highScores objectAtIndex:2] intValue]];
    [self addChild:highScore3];
    
    SKLabelNode *highScore4 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore4.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.45);
    highScore4.text = [NSString stringWithFormat:@"%d", [[self.highScores objectAtIndex:3] intValue]];
    [self addChild:highScore4];
    
    SKLabelNode *highScore5 = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    highScore5.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height * 0.35);
    highScore5.text = [NSString stringWithFormat:@"%d", [[self.highScores objectAtIndex:4] intValue]];
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
