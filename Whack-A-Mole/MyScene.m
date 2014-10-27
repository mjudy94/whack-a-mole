//
// MyScene.m
// WAMProto
//
// Created by Dan Saganome on 10/14/14.
// Copyright (c) 2014 Dan Saganome. All rights reserved.
//
#import "MyScene.h"
#import "MainMenuScene.h"
#import "DifficultySelectorScene.h"
#import "GameplayScene.h"
#import "GameOverScene.h"

@implementation MyScene{
    SKSpriteNode *mole;//havent used yet
    SKAction *moleAnimation;//the mole animation action called in the touchesBegan method
    SKSpriteNode *_mole;//The mole sprite that, might need to add more or make an array of these in the future
    NSArray *_moleFramesArray;//An array of textures to run the animation
}
//I basically run most of the code from here but Im going to to devide the code into different methods
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
    }
    return self;
}

-(void)addMole
{
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}
@end