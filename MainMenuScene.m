//
//  MainMenuScene.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/5/14.
//
//

#import "MainMenuScene.h"
#import "DifficultySelectorScene.h"

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
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if([node.name isEqualToString:@"classicButton"]){
        [self chooseDifficultyScene];
    }
    
    if([node.name isEqualToString:@"continuousButton"]){
        [self chooseDifficultyScene];
    }
    
}

//possible make it just chooseNextScene with params of the next scene name
- (void)chooseDifficultyScene
{
    SKScene *difficultyScene = [[DifficultySelectorScene alloc] initWithSize:self.size];
    SKTransition *doors = [SKTransition doorsOpenHorizontalWithDuration:0.25];
    [self.view presentScene:difficultyScene transition:doors];
}


@end
