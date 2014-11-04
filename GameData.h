//
//  GameData.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/30/14.
//
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>

@property (assign ,nonatomic)NSString *name;
@property (nonatomic)NSMutableArray *highScores;

-(id)initWithName:(NSString *)dataName;
-(id)initWithScores:(NSMutableArray *)scores;

@end
