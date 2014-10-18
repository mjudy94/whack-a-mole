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


SKSpriteNode *mole;//havent used yet
SKAction *moleAnimation;//the mole animation action called in the touchesBegan method
SKSpriteNode *_mole;//The mole sprite that, might need to add more or make an array of these in the future
NSArray *_moleFramesArray;//An array of textures to run the animation

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
        
        [self setGameDifficulty:difficultyLevel];
        
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.bgLayer = [SKNode node];
        [self addChild:self.bgLayer];
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bgColor.png"];
        [bg setScale:1.2];
        [bg setZPosition:0];
        [self.bgLayer addChild:bg];
        
        //initializes array of mole objects
        if(self.gameDifficulty == 0)
        {
            NSMutableArray *moles = [Hole initWithNumColumns:3 row:3];
        }
        else //not easy, must be medium or hard
        {
            NSMutableArray *moles = [Hole initWithNumColumns:3 row:4];
        }
        
        NSLog(@"about to draw game layer for difficulty level");
        [self drawGameLayerForDifficultyLevel];
        
        //Initializes the atlas (collection of pictures)
        SKTextureAtlas *moleAnimatedAtlas = [SKTextureAtlas atlasNamed:@"MoleAnimation"];
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
        //adds all the textures to the NSArray
        _moleFramesArray = moleFrames;
        //Made a temp texture so the mole node starts off with the first picture in the array
        SKTexture *temp = _moleFramesArray[0];
        _mole = [SKSpriteNode spriteNodeWithTexture:temp];
        //position of the mole, will change once we add more
        _mole.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:_mole];
        // [self addMole];
    }
    return self;
}

-(void)drawGameLayerForDifficultyLevel
{
    NSLog(@"%ld", (long)self.gameDifficulty);
    int numRows;
    
    if (self.gameDifficulty == 0)
    {
        numRows = 3;
    } else
    {
        numRows = 4;
    }
    NSLog(@"%ld", (long)numRows);
    for (int i = 0; i < numRows; i++)
    {
        SKSpriteNode *bgUpper = [SKSpriteNode spriteNodeWithImageNamed:@"bgUpper.png"];
        bgUpper.anchorPoint = CGPointMake(0.5, 0.0); //calculate based on iteration through loop
        bgUpper.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height * 0.2 * i+1);//calculate based on iteration through loop
        bgUpper.zPosition = 0;
        [self addChild:bgUpper];
        
        SKSpriteNode *bgLower = [SKSpriteNode spriteNodeWithImageNamed:@"bgLower.png"];
        bgLower.anchorPoint = CGPointMake(0.5, 0.95);
        bgLower.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height * -0.2 * i); //some method based on iteration through a loop
        bgLower.zPosition = 2;
        [self addChild:bgLower];
    }
}

-(void)moleAnimate
{
    //This is our general runAction method to make our mole animatiom.
    [_mole runAction:[SKAction animateWithTextures:_moleFramesArray
                                      timePerFrame:0.1f resize:YES restore:YES] withKey:@"walkingInPlaceBear"];
    return;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //Called when a touch begins
    [self moleAnimate];
    //plays noise when touched
    [self runAction:[SKAction playSoundFileNamed:@"OUCH.mp3" waitForCompletion:NO]];
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
