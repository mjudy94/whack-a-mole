//
//  HighScoreScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/15/14.
//
//

#import <SpriteKit/SpriteKit.h>

@interface HighScoreScene : SKScene

@property BOOL contentCreated;

- (SKNode *)drawClassicHighScore;
- (SKNode *)drawContinuousHighScore;

@end
