//
//  GameplayScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/6/14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "Mole.h"
#import "GameOverScene.h"

static const CGFloat HoleWidth = 0;
static const CGFloat HoleHeight = 0;

@interface GameplayScene : SKScene

@property (nonatomic, assign)NSInteger gameMode; //Classic Mode: 0, Continuous Mode: 1
@property (nonatomic, assign)NSInteger gameDifficulty; //Easy: 0, Medium: 1, Hard: 2
@property (nonatomic, assign)NSInteger userScore;
@property (nonatomic, assign)BOOL gameOver;

@property(strong, nonatomic) SKNode *bgLayer;
@property (strong, nonatomic) SKTexture *moleTexture;
@property (strong, nonatomic) NSMutableArray *moles;

@property BOOL contentCreated;


-(id)initWithSize:(CGSize)size withDifficultyLevel:(NSInteger)difficultyLevel;

@end
