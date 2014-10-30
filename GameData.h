//
//  GameData.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/30/14.
//
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject

@property (assign, nonatomic)int userScore;
@property (assign, nonatomic)CFTimeInterval lengthOfGame;
@property (assign, nonatomic)int gameMode;
@property (assign, nonatomic)int gameDifficulty;
@property (assign, nonatomic)int molesHit;

@property (assign, nonatomic)int totalMolesHit;
@property (assign, nonatomic)NSArray *highScores;
@property (assign, nonatomic)NSArray *easyClassicHighScores;
@property (assign, nonatomic)NSArray *mediumClassicHighScores;
@property (assign, nonatomic)NSArray *hardClassicHighScores;
@property (assign, nonatomic)NSArray *easyContinuousHighScores;
@property (assign, nonatomic)NSArray *mediumContinuousHighScores;
@property (assign, nonatomic)NSArray *hardContinuousHighScores;

+(instancetype)sharedGameData;
-(void)reset;

@end
