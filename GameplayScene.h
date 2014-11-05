//
//  GameplayScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/6/14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "Mole.h"
#import "Grid.h"
#import "GameOverScene.h"
#import "ViewController.h"

@interface GameplayScene : SKScene

@property (nonatomic, assign)NSInteger gameMode; //Classic Mode: 0, Continuous Mode: 1
@property (nonatomic, assign)NSInteger gameDifficulty; //Easy: 0, Medium: 1, Hard: 2
@property (nonatomic, assign)NSInteger numColumns; //always 3
@property (nonatomic, assign)NSInteger numRows; //3 rows if easy, else 4 rows

@property (nonatomic, assign)CFTimeInterval lastMolePopTime; //used to keep track of mole popping frequency and to help cut down on moles popping too frequently
@property (nonatomic, assign)CFTimeInterval startTime; //for timer
@property (nonatomic, assign)CFTimeInterval countDown;
@property (nonatomic, assign)CFTimeInterval timeOfLastUpdate;
@property (nonatomic, assign)CFTimeInterval lengthOfGame;
@property (nonatomic, assign)SKLabelNode *countDownNode;

@property (nonatomic, assign)int userScore;
@property (nonatomic, assign)SKLabelNode *userScoreNode;
@property (nonatomic, assign)NSInteger currMoles;
@property (nonatomic, assign)NSInteger maxMoles;
@property (nonatomic, assign)NSInteger moleRate;
@property (nonatomic, assign)NSInteger moleTimeVisible; //dependent on game difficulty


@property (nonatomic, assign)BOOL gameBegun;

@property(strong, nonatomic) SKNode *bgLayer;
@property (strong, nonatomic) SKTexture *moleTexture;
@property (strong, nonatomic) NSSet *moles;
@property (strong, nonatomic) Grid *grid;

@property (nonatomic, assign)UIImage* molePicture;


@property BOOL contentCreated;


-(id)initWithSize:(CGSize)size withDifficultyLevel:(NSInteger)difficultyLevel;
-(void)addSpritesForMoles;
-(void)configureForGameDifficulty:(NSInteger)difficulty;
-(void)updateUserScore:(BOOL)moleHit;
@end
