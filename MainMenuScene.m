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
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    [self addChild: [self newTitleNode]];
    [self addChild: [self newClassicButtonNode]];
    [self addChild: [self newContinuousButtonNode]];
    
}

- (SKLabelNode *)newClassicButtonNode
{
    SKLabelNode *classicButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    classicButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.4);
    classicButton.name = @"classicButton";
    classicButton.text = @"Classic";
    return classicButton;
}

- (SKLabelNode *)newContinuousButtonNode
{
    SKLabelNode *continuousButton = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    continuousButton.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.3);
    continuousButton.name = @"continuousButton";
    continuousButton.text = @"Continuous";
    return continuousButton;
}

- (SKLabelNode *)newTitleNode
{
    SKLabelNode *menuNode = [SKLabelNode labelNodeWithFontNamed:@"Papyrus"];
    
    menuNode.name = @"menuNode";
    menuNode.text = @"Whack-A-Mole";
    menuNode.fontSize = 42;
    menuNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.9);
    
    return menuNode;
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
