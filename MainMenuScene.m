//
//  MainMenuScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/5/14.
//
//

#import "MainMenuScene.h"
#import "DifficultySelectorScene.h"
#import "GameOverScene.h"
#import "ViewController.h"

@interface MainMenuScene ()

@property BOOL contentCreated;

@end

@implementation MainMenuScene

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self setupBackground];
        self.contentCreated = YES;
    }
}

- (void)setupBackground
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    //Add title label
    SKLabelNode *menuNode = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    menuNode.name = @"menuNode";
    menuNode.text = @"Whack-A-Mole";
    menuNode.fontSize = 42;
    menuNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.9);
    [self addChild: menuNode];
    
    [self createMainMenu];
}

- (void)createMainMenu
{
    [self runAction:[SKAction playSoundFileNamed:@"GOT.mp3" waitForCompletion:NO]];
    //adding classic mode button
    SKLabelNode *classicButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    classicButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.4);
    classicButton.name = @"classicButton";
    classicButton.text = @"Classic";
    [self addChild:classicButton];
    
    //adding continuous mode button
    SKLabelNode *continuousButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    continuousButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.3);
    continuousButton.name = @"continuousButton";
    continuousButton.text = @"Continuous";
    [self addChild:continuousButton];
    
    //adding continuous mode button
    SKLabelNode *cameraButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    cameraButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.2);
    cameraButton.name = @"cameraButton";
    cameraButton.text = @"Camera!";
    [self addChild:cameraButton];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if([node.name isEqualToString:@"classicButton"]){
        //go to chooseDifficulty scene, passs a 0 as the parameter for game mode
        [self chooseDifficultyScene:0];
    }
    
    if([node.name isEqualToString:@"continuousButton"]){
        //go to chooseDifficulty scene, passs a 1 as the parameter for game mode
        [self chooseDifficultyScene:1];
    }
    if([node.name isEqualToString:@"cameraButton"]){
        [(ViewController *)self.view.window.rootViewController switchToCamera];
        //[(ViewController *)self.view.window.rootViewController switchToCamera];
    }
    
}

//possible make it just chooseNextScene with params of the next scene name
- (void)chooseDifficultyScene:(NSInteger)mode
{
    DifficultySelectorScene *difficultySelectorScene = [[DifficultySelectorScene alloc] initWithSize:self.size];
    SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.25];
    [difficultySelectorScene setMolePicture:self.molePicture];
    [difficultySelectorScene setGameplayMode:mode];
    [self.view presentScene:difficultySelectorScene transition:doors];
}


@end
