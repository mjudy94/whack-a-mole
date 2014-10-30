//
//  GameplayScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/6/14.
//
//

#import "GameplayScene.h"

@implementation GameplayScene

@synthesize gameMode;
@synthesize gameDifficulty;
@synthesize grid;
@synthesize userScore;
@synthesize userScoreNode;
@synthesize countDown;
@synthesize countDownNode;

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        self.contentCreated = YES;
    }
}

-(id)initWithSize:(CGSize)size withDifficultyLevel:(NSInteger)difficultyLevel {
    
    if (self = [super initWithSize:size]) {
        [self setGameDifficulty:difficultyLevel];
        self.userScore = 0;
        [self setGameBegun:false];
        
        [self setupHUD];
        
        //Initializes the atlas (collection of pictures)
        SKTextureAtlas *moleAnimatedAtlas = [SKTextureAtlas atlasNamed:@"MoleAnimation"];
        self.moleTexture = [moleAnimatedAtlas textureNamed:@"mole_1.png"];
        //makes temp array to hold the textures from the atlas
        NSMutableArray *moleFrames = [NSMutableArray array];
        //makes the pictures from the atlas into texture objects
        SKTexture *frame1 = [moleAnimatedAtlas textureNamed:@"mole_1"];
        SKTexture *frame2 = [moleAnimatedAtlas textureNamed:@"mole_thump1"];
        SKTexture *frame3 = [moleAnimatedAtlas textureNamed:@"mole_thump2"];
        SKTexture *frame4 = [moleAnimatedAtlas textureNamed:@"mole_thump3"];
        SKTexture *frame5 = [moleAnimatedAtlas textureNamed:@"mole_thump4"];
        //adds the textures to the moleFrame array in order to pass to the static NSArray
        [moleFrames addObject:frame1];
        [moleFrames addObject:frame2];
        [moleFrames addObject:frame3];
        [moleFrames addObject:frame4];
        [moleFrames addObject:frame5];
        //Made a temp texture so the mole node starts off with the first picture in the array
        //SKTexture *temp = _moleFramesArray[0];
        //_mole = [SKSpriteNode spriteNodeWithTexture:temp];
        //position of the mole, will change once we add more
        //_mole.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        
        [self drawGameLayerForDifficultyLevel];
        [self configureForGameDifficulty:[self gameDifficulty]];
    }
    return self;
}

//This method adds nodes to display the userScore, the gameTimer and also sets up the background image
-(void)setupHUD
{
    SKLabelNode *scoreNode = [[SKLabelNode alloc] initWithFontNamed:@"papyrus"];
    scoreNode.position = CGPointMake(self.frame.size.width *-0.3, self.frame.size.height *.4);
    scoreNode.text = [NSString stringWithFormat:@"%li", (long)self.userScore];
    scoreNode.name = @"userScoreNode";
    scoreNode.fontSize = 42;
    scoreNode.zPosition = 4;
    [self setUserScoreNode:scoreNode];
    [self addChild:self.userScoreNode];
    
    SKLabelNode *gameTimer = [[SKLabelNode alloc] initWithFontNamed:@"papyrus"];
    gameTimer.position = CGPointMake(0, self.frame.size.height *.4);
    gameTimer.name = @"gameTimerNode";
    gameTimer.fontSize = 42;
    gameTimer.zPosition = 4;
    [self setCountDownNode:gameTimer];
    [self addChild:self.countDownNode];
    
    
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.bgLayer = [SKNode node];
    [self addChild:self.bgLayer];
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bgColor.png"];
    [bg setScale:1.2];
    [bg setZPosition:0];
    [self.bgLayer addChild:bg];
}

-(void)drawGameLayerForDifficultyLevel
{
    [self setNumColumns:3];
    if (self.gameDifficulty == 0)
    {
        [self setNumRows:3];
    } else
    {
        [self setNumRows:4];
    }
    
    self.grid = [[Grid alloc] init];
    [self setMoles:[self.grid addInitialMolesWithRows:[self numRows]]];
    
    for (int i = 0; i < [self numRows]; i++)
    {
        SKSpriteNode *bgUpper = [SKSpriteNode spriteNodeWithImageNamed:@"bgUpper.png"];
        bgUpper.anchorPoint = CGPointMake(0.5, -1.0); //calculate based on iteration through loop
        bgUpper.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height*(0.15-(i * 0.2)));//calculate based on iteration through loop
        bgUpper.zPosition = 0;
        [self.bgLayer addChild:bgUpper];
        
        SKSpriteNode *bgLower = [SKSpriteNode spriteNodeWithImageNamed:@"bgLower.png"];
        bgLower.anchorPoint = CGPointMake(0.5, -1.0);
        bgLower.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height*(0.07-(i * 0.2)));//some method based on iteration through a loop
        bgLower.zPosition = 2;
        [self.bgLayer addChild:bgLower];
    }
    [self addSpritesForMoles];
}

-(void)configureForGameDifficulty:(NSInteger)difficulty
{
    switch (gameDifficulty) {
        case 0:
            [self setMoleRate:150];
            [self setMaxMoles:3];
            [self setMoleTimeVisible:2.25];
            break;
            
        case 1:
            [self setMoleRate:140];
            [self setMaxMoles:4];
            [self setMoleTimeVisible:2];
            break;
            
        case 2:
            [self setMoleRate:120];
            [self setMaxMoles:5];
            [self setMoleTimeVisible:1.8];
            break;
            
        default:
            break;
            
    }
}

-(void)addSpritesForMoles
{
    for (Mole *mole in self.moles)
    {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:self.moleTexture];
        int moleOffset;
        if (mole.column % 3 == 0)
        {
            moleOffset = 220;
        }
        else if (mole.column % 3 == 1)
        {
            moleOffset = 0;
        }
        else
        {
            moleOffset = -220;
        }
        sprite.position = CGPointMake(CGRectGetMidX(self.frame)+ moleOffset, self.frame.size.height*(0.23-(mole.row * 0.2)));
        sprite.zPosition = 1;
        sprite.name = @"mole";
        //Assigns the mole object to the sprites userData attribute
        sprite.userData = [[NSMutableDictionary alloc] init];
        [sprite.userData setObject:mole forKey:@"mole"];
        [self.bgLayer addChild:sprite];
        mole.sprite = sprite;
    }
}

-(void)updateUserScore:(BOOL)moleHit
{
    if (moleHit)
    {
        self.userScore +=10;
        self.userScoreNode.text = [NSString stringWithFormat:@"%li", (long)self.userScore];
    } else
    {
        self.userScore -=5;
        self.userScoreNode.text = [NSString stringWithFormat:@"%li", (long)self.userScore];
    }
    
    //checks if the game mode is continuous mode, then calls the updateTimerForContinuousMode with a parameter that says whether or not a mole was hit
    if (self.gameMode == 1)
    {
        [self updateTimerForContinuousMode:moleHit];
    }
}

//if a mole was hit, increase the timer by 1, otherwise decrease it by 2
-(void)updateTimerForContinuousMode:(BOOL)moleHit
{
    NSLog(@"Updating timer for continuous mode");
    if (moleHit)
    {
        self.countDown +=1;
        self.countDownNode.text = [NSString stringWithFormat:@"%i",(int)(self.countDown)];
    }
    else
    {
        self.countDown -=3;
        self.countDownNode.text = [NSString stringWithFormat:@"%i", (int)(self.countDown)];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //Called when a touch begins
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if ([node.name rangeOfString:@"mole"].location != NSNotFound)
    {
        SKSpriteNode *hitMole = (SKSpriteNode *)node;
        Mole *mole = [hitMole.userData objectForKey:@"mole"];
        if(mole.isVisible)
        {
            [self moleHit:hitMole forMole:mole];
            [self updateUserScore:true];
        }
        else{
            [self updateUserScore:false];
        }
    } else
    {
        [self updateUserScore:false]; //decrements user score for hitting something that isn't a mole
    }
    
}

- (void)moleHit:(SKSpriteNode *)moleSprite forMole:(Mole *)mole
{
    [mole.sprite removeAllActions];
    mole.isVisible = false;
    SKAction *hideMole = [SKAction moveToY:mole.sprite.position.y-mole.sprite.size.height duration:0.2f];//
    hideMole.timingMode = SKActionTimingEaseInEaseOut;
    hideMole.speed = 0.5;
    SKAction *sequence = [SKAction sequence:@[hideMole]];
    [mole.sprite runAction:sequence];
    
    self.currMoles -= 1;
    NSLog(@"I'm hit! %ld %ld", (long)mole.row, (long)mole.column);
    [self runAction:[SKAction playSoundFileNamed:@"OUCH.mp3" waitForCompletion:NO]];
}

//assess penalty for a missed mole based on the game mode
-(void)missedMolePenalty
{
    switch (self.gameMode) {
        case 0:
            self.userScore -= 5;
            self.userScoreNode.text = [NSString stringWithFormat:@"%li", (long)self.userScore];
            break;
        
        case 1:
            self.userScore -= 5;
            self.userScoreNode.text = [NSString stringWithFormat:@"%li", (long)self.userScore];
            self.countDown -= 2;
            self.countDownNode.text = [NSString stringWithFormat:@"%i", (int)self.countDown];
            
        default:
            break;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    //checks if the game has started, if not, then initialize the start time to the value of current time to begin the timer count down
    if (self.gameBegun == false)
    {
        self.startTime = currentTime;
        self.timeOfLastUpdate = currentTime;
        self.countDown = 31;
        self.gameBegun = true;
    }
    
    //checks if the timer has reached 0, if so then call the gameOver method, else refresh the timer on screen
    if (self.countDown <= 0)
    {
        self.lengthOfGame = (currentTime - self.startTime);
        [self gameOver];
        
    }
    else
    {
        self.countDown -= (currentTime - self.timeOfLastUpdate);
        self.countDownNode.text = [NSString stringWithFormat:@"%i",(int)(self.countDown)];
        self.timeOfLastUpdate = currentTime;
    }
    
    //checks the time elapsed since the last mole pop. If it has been less than 0.15 seconds then return. This is to help mitigate the problem of too many moles popping at a time due to the screen refreshing too fast to accurately keep track of the number of popped moles
    if (currentTime - self.lastMolePopTime < 0.15)
    {
        return;
    }
    
    //iterate through each mole object, perform a mod operation on a random number to determine if the current mole should be popped. The mole rate that the mod operation uses is set in the configureForGameDifficulty method and controls the likelihood of a mole being popped.
    for (int i = 0; i < [self numColumns]; i++)
    {
        for (int j = 0; j < [self numRows]; j++)
        {
            if(arc4random() % [self moleRate] == 0)
            {
                Mole *mole = [self.grid moleAtRow:i column:j];
                SKSpriteNode *moleSprite = mole.sprite;
                //check if the mole is currently popped or performing other actions
                if (!moleSprite.hasActions)
                {
                    //check if the number of current moles is less than the max mole limit, if so then pop the mole
                    if([self currMoles] < [self maxMoles])
                    {
                        [self popMole:moleSprite forMole:mole];
                        self.lastMolePopTime = currentTime;
                    }
                }
            }
        }
    }
}

- (void)popMole:(SKSpriteNode *)moleSprite forMole:(Mole *)mole
{
    if ([self currMoles] >= [self maxMoles])
    {
        return;
    }
    SKAction *popUp = [SKAction moveToY:moleSprite.position.y + moleSprite.size.height duration:0.2f]; //pop the mole but do it over a span of .2 seconds
    popUp.timingMode = SKActionTimingEaseInEaseOut; //makes the animation smoother
    
    SKAction *hideMole = [SKAction moveToY:moleSprite.position.y duration:0.2f];
    hideMole.timingMode = SKActionTimingEaseInEaseOut;
    
    SKAction *pause = [SKAction waitForDuration:[self moleTimeVisible]];
    SKAction *setIsVisibleTrue = [SKAction runBlock:^{
        [mole setIsVisible:true];
        self.currMoles += 1;
        //NSLog(@"%li", (long)self.currMoles);
    }];
    SKAction *setIsVisibleFalse = [SKAction runBlock:^{
        [mole setIsVisible:false];
        self.currMoles -= 1;
        [self missedMolePenalty];
        //NSLog(@"%li", (long)self.currMoles);
    }];
    //Creates the sequence of actions to create mole antics where the mole pops up then goes back into his hole
    SKAction *moleAntics = [SKAction sequence:@[popUp, setIsVisibleTrue, pause, setIsVisibleFalse, hideMole]];
    [moleSprite runAction:moleAntics];
}

-(void)gameOver
{
    SKAction *gameOverAction = [SKAction runBlock:^{
        GameOverScene *gameOver = [[GameOverScene alloc] initWithSize:self.size withUserScore:self.userScore withGameMode:(int)[self gameMode] withDifficulty:(int)[self gameDifficulty] withGameLength:[self lengthOfGame]];
        SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.25];
        [self.view presentScene:gameOver transition:doors];
    }];
    [self runAction:gameOverAction];
    
}

@end
