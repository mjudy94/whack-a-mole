//
//  GameData.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/30/14.
//
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>

@property (assign, nonatomic)int userScore;
@property (assign, nonatomic)CFTimeInterval lengthOfGame;
@property (assign, nonatomic)int gameMode;
@property (assign, nonatomic)int gameDifficulty;
@property (assign, nonatomic)int molesHit;

@property (assign ,nonatomic)NSString *name;
@property (nonatomic)NSMutableArray *highScores;

@property (assign, nonatomic)NSMutableArray *easyClassicHighScores;
@property (assign, nonatomic)NSMutableArray *easyContinuousHighScores;

@property (assign, nonatomic)NSMutableArray *mediumClassicHighScores;
@property (assign, nonatomic)NSMutableArray *mediumContinuousHighScores;

@property (assign, nonatomic)NSMutableArray *hardClassicHighScores;
@property (assign, nonatomic)NSMutableArray *hardContinuousHighScores;

-(id)initWithName:(NSString *)dataName;

@end
