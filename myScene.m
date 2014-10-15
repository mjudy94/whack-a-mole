//
//  MyScene.m
//  WAMProto
//
//  Created by Dan Saganome on 10/14/14.
//  Copyright (c) 2014 Dan Saganome. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene{
    SKSpriteNode *mole;
    SKAction *moleAnimation;
    SKSpriteNode *_mole;
    NSArray *_moleFramesArray;

    
}


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"grass.png"];
        [bgImage setScale:0.6];
        bgImage.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:bgImage];
        
        NSMutableArray *moleFrames = [NSMutableArray array];
        SKTextureAtlas *moleAnimatedAtlas = [SKTextureAtlas atlasNamed:@"MoleAnimation"];
        
        SKTexture *frame1 = [moleAnimatedAtlas textureNamed:@"mole_1"];
        SKTexture *frame2 = [moleAnimatedAtlas textureNamed:@"mole_thump1"];
        SKTexture *frame3 = [moleAnimatedAtlas textureNamed:@"mole_thump2"];
        SKTexture *frame4 = [moleAnimatedAtlas textureNamed:@"mole_thump3"];
        SKTexture *frame5 = [moleAnimatedAtlas textureNamed:@"mole_thump4"];

        
        
        [moleFrames addObject:frame1];
        [moleFrames addObject:frame2];
        [moleFrames addObject:frame3];
        [moleFrames addObject:frame4];
        [moleFrames addObject:frame5];

        _moleFramesArray = moleFrames;
        
        
        SKTexture *temp = _moleFramesArray[0];
        _mole = [SKSpriteNode spriteNodeWithTexture:temp];
        _mole.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:_mole];
        

        
       // [self addMole];
    }
    return self;
}

-(void)moleAnimate
{
    //This is our general runAction method to make our bear walk.
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
    [self runAction:[SKAction playSoundFileNamed:@"OUCH.mp3" waitForCompletion:NO]];

    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


@end
