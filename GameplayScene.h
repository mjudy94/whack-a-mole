//
//  GameplayScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/6/14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "Hole.h"
#import "Mole.h"

@interface GameplayScene : SKScene

@property (nonatomic, assign)NSInteger gameMode; //Classic Mode: 0, Continuous Mode: 1
@property (nonatomic, assign)NSInteger gameDifficulty; //Easy: 0, Medium: 1, Hard: 2
@property (nonatomic, assign)NSInteger userScore;
@property BOOL contentCreated;

-(Hole *)setupHoles;
-(NSSet *)setupMoles; //show and hide mole methods are in Mole class

@end
