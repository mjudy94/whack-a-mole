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
@synthesize gameOver;

SKAction *moleAnimation;//the mole animation action called in the touchesBegan method
NSArray *_moleFramesArray;//An array of textures to run the animation
SKSpriteNode *_mole;

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        self.contentCreated = YES;
    }
}

//I basically run most of the code from here but Im going to to devide the code into different methods
-(id)initWithSize:(CGSize)size withDifficultyLevel:(NSInteger)difficultyLevel {
    
    if (self = [super initWithSize:size]) {
        [self setGameOver:false];
        [self setGameDifficulty:difficultyLevel];
        [self setUserScore:0];
        
        
        NSLog (@"%li", self.userScore);
        SKLabelNode *node = [[SKLabelNode alloc] initWithFontNamed:@"papyrus"];
        node.position = CGPointMake(0, self.frame.size.height *.4);
        node.text = [NSString stringWithFormat:@"%li", (long)self.userScore];
        node.name = @"userScoreNode";
        node.fontSize = 42;
        node.zPosition = 4;
        [self setUserScoreNode:node];
        [self addChild:self.userScoreNode];
        
        
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.bgLayer = [SKNode node];
        [self addChild:self.bgLayer];
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bgColor.png"];
        [bg setScale:1.2];
        [bg setZPosition:0];
        [self.bgLayer addChild:bg];
        
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
        [self configureForGameMode:[self gameMode] andDifficulty:[self gameDifficulty]];
    }
    return self;
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

-(void)configureForGameMode:(NSInteger)mode andDifficulty:(NSInteger)difficulty
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
    
    switch (gameMode) {
        case 0:
            
            break;
            
        case 1:
            
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

-(void)animateMole:(Mole *)mole
{
    //This is our general runAction method to make our mole animatiom.
    [_mole runAction:[SKAction animateWithTextures:_moleFramesArray
                                      timePerFrame:0.1f resize:YES restore:YES] withKey:@"walkingInPlaceBear"];
    return;
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
    [self updateUserScore:true];
    [self runAction:[SKAction playSoundFileNamed:@"OUCH.mp3" waitForCompletion:NO]];
}

-(void)update:(CFTimeInterval)currentTime {
    
    if ([self currMoles] >= [self maxMoles])
    {
        return;
    }
    
    for (int i = 0; i < [self numColumns]; i++)
    {
        for (int j = 0; j < [self numRows]; j++)
        {
            if(arc4random() % [self moleRate] == 0)
            {
                Mole *mole = [self.grid moleAtRow:i column:j];
                SKSpriteNode *moleSprite = mole.sprite;
                if (!moleSprite.hasActions)
                {
                    if([self currMoles] < [self maxMoles])
                    {
                        [self popMole:moleSprite forMole:mole];
                    }
                }
            }
        }
    }
}

- (void)popMole:(SKSpriteNode *)moleSprite forMole:(Mole *)mole
{
    SKAction *popUp = [SKAction moveToY:moleSprite.position.y + moleSprite.size.height duration:0.2f]; //pop the mole but do it over a span of .2 seconds
    popUp.timingMode = SKActionTimingEaseInEaseOut; //makes the animation smoother
    
    SKAction *hideMole = [SKAction moveToY:moleSprite.position.y duration:0.2f];
    hideMole.timingMode = SKActionTimingEaseInEaseOut;
    
    SKAction *pause = [SKAction waitForDuration:[self moleTimeVisible]];
    SKAction *setIsVisibleTrue = [SKAction runBlock:^{
        [mole setIsVisible:true];
        self.currMoles += 1;
        NSLog(@"%li", (long)self.currMoles);
    }];
    SKAction *setIsVisibleFalse = [SKAction runBlock:^{
        [mole setIsVisible:false];
        self.currMoles -= 1;
        NSLog(@"%li", (long)self.currMoles);
    }];
    //Creates the sequence of actions to create mole antics where the mole pops up then goes back into his hole
    SKAction *moleAntics = [SKAction sequence:@[popUp, setIsVisibleTrue, pause, setIsVisibleFalse, hideMole]];
    [moleSprite runAction:moleAntics];
}

@end
