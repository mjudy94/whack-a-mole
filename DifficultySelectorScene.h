//
//  DifficultySelectorScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/5/14.
//
//

#import <SpriteKit/SpriteKit.h>
@interface DifficultySelectorScene : SKScene

@property BOOL contentCreated;
@property (nonatomic)NSInteger gameplayMode; //Classic Mode: 0, Continuous Mode: 1
@property (nonatomic)UIImage *molePicture;

- (void)setUpGameplay:(NSInteger)gameMode difficultyLevel:(NSInteger)difficultyLevel;

@end
