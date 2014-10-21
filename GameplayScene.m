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
    }
    return self;
}

-(void)drawGameLayerForDifficultyLevel
{
    int numRows;
    
    if (self.gameDifficulty == 0)
    {
        numRows = 3;
    } else
    {
        numRows = 4;
    }
    
    self.grid = [[Grid alloc] init];
    [self setMoles:[self.grid addInitialMolesWithRows:numRows]];
    [self.grid setNumRows:numRows];
    [self.grid setNumColumns:3];
    
    for (int i = 0; i < numRows; i++)
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

-(void)addSpritesForMoles
{
    NSLog(@"In add sprites for moles");
    for (Mole *mole in self.moles)
    {
        NSLog(@"Adding a mole sprite");
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
        sprite.name = [NSString stringWithFormat:@"mole%ld%ld", (long)mole.row, (long)mole.column];
        NSLog(@"%ld", (long)mole.row);
        NSLog(@"%ld", (long)mole.column);
        NSLog(@"%hu", [sprite.name characterAtIndex:4]);
        NSLog(@"%hu", [sprite.name characterAtIndex:5]);
        NSLog(@"%@", sprite.name);
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //Called when a touch begins
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if ([node.name rangeOfString:@"mole"].location != NSNotFound)
    {
        NSInteger row = [node.name characterAtIndex:4];
        NSInteger column = [node.name characterAtIndex:5];
        NSLog(@"%ld", row);
        NSLog(@"%ld", column);
        Mole *mole = [self.grid moleAtRow:row column:column];
        
        if(mole.isVisible)
        {
            NSLog(@"inside if statement for touchesBegan");
            SKSpriteNode *hitMole = (SKSpriteNode *)node;
            SKAction *hideMole = [SKAction moveToY:hitMole.position.y-hitMole.size.height duration:0.2f];//
            hideMole.timingMode = SKActionTimingEaseInEaseOut;
            hideMole.speed = 0.5;
            SKAction *sequence = [SKAction sequence:@[hideMole]];
            [hitMole runAction:sequence];
            [self runAction:[SKAction playSoundFileNamed:@"OUCH.mp3" waitForCompletion:NO]];
        }
    }
    
}
-(void)update:(CFTimeInterval)currentTime {
    
    for (int i = 0; i < self.grid.numColumns; i++)
    {
        for (int j = 0; j < self.grid.numRows; j++)
        {
            if(arc4random() % 16 == 0)
            {
                Mole *mole = [self.grid moleAtRow:i column:j];
                SKSpriteNode *moleSprite = mole.sprite;
                if (!moleSprite.hasActions)
                {
                    [self moleActions:moleSprite];
                }
            }
        }
    }
}

- (void)moleActions:(SKSpriteNode *)moleSprite
{
    SKAction *popUp = [SKAction moveToY:moleSprite.position.y + moleSprite.size.height duration:0.2f]; //pop the mole but do it over a span of .2 seconds
    popUp.timingMode = SKActionTimingEaseInEaseOut; //makes the animation smoother
    SKAction *hideMole = [SKAction moveToY:moleSprite.position.y duration:0.2f];//
    hideMole.timingMode = SKActionTimingEaseInEaseOut;
    SKAction *pause = [SKAction waitForDuration:1.0f];
    
    //Creates the sequence of actions to create mole antics where the mole pops up then goes back into his hole
    SKAction *moleAntics = [SKAction sequence:@[popUp, pause, hideMole]];
    [moleSprite runAction:moleAntics];
}

@end
