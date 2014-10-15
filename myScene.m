//
//  MyScene.m
//  WAMProto
//
//  Created by Dan Saganome on 10/14/14.
//  Copyright (c) 2014 Dan Saganome. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene{
    SKSpriteNode *mole;//havent used yet
    SKAction *moleAnimation;//the mole animation action called in the touchesBegan method
    SKSpriteNode *_mole;//The mole sprite that, might need to add more or make an array of these in the future
    NSArray *_moleFramesArray;//An array of textures to run the animation
}

//I basically run most of the code from here but Im going to to devide the code into different methods
-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        //I use a background png file set it to that
        self.backgroundColor = [SKColor whiteColor];
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"grass.png"];
        [bgImage setScale:0.6];
        bgImage.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:bgImage];
        
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

-(void)moleAnimate
{
    //This is our general runAction method to make our mole animatiom.
    [_mole runAction:[SKAction animateWithTextures:_moleFramesArray
                timePerFrame:0.1f resize:YES restore:YES] withKey:@"walkingInPlaceBear"];
    

    return;
}

-(void)addMole
{
    
   // [self addChild:mole];
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
