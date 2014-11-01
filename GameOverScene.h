//
//  GameOverScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/15/14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "MainMenuScene.h"


@interface GameOverScene : SKScene

@property (assign, nonatomic)int totalMolesHit;
@property (assign, nonatomic)NSMutableArray *highScores;

@property (nonatomic, assign)NSInteger gameMode; //Classic Mode: 0, Continuous Mode: 1
@property (nonatomic, assign)NSInteger gameDifficulty; //Easy: 0, Medium: 1, Hard: 2
@property (nonatomic, assign)NSInteger userScore;
@property (nonatomic, assign)CFTimeInterval lengthOfGame;
@property BOOL contentCreated;

-(id)initWithSize:(CGSize)size withUserScore:(int)score withGameMode:(int)mode withDifficulty:(int)difficulty withGameLength:(CFTimeInterval)length;
-(void)updateHighScores:(NSString *)highScores;
@end
