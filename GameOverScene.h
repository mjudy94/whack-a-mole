//
//  GameOverScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/15/14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "HighScoreScene.h"
#import "MainMenuScene.h"


@interface GameOverScene : SKScene

@property (nonatomic, assign)NSInteger gameMode; //Classic Mode: 0, Continuous Mode: 1
@property (nonatomic, assign)NSInteger gameDifficulty; //Easy: 0, Medium: 1, Hard: 2
@property (nonatomic, assign)NSInteger userScore;
@property BOOL contentCreated;

@end
