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



+(instancetype)sharedGameData;
-(void)reset;

@end
