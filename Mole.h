//
//  Mole.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/7/14.
//
//

#import <SpriteKit/SpriteKit.h>

@interface Mole : NSObject

@property (assign, nonatomic) NSInteger column;
@property (assign, nonatomic) NSInteger row;
@property (assign, nonatomic) BOOL isVisible;
@property (assign, nonatomic) NSTimeInterval duration; //length of time that mole will be present
@property (assign, nonatomic) NSString *name;
@property (assign, nonatomic) SKSpriteNode *sprite;

- (id)initAtColumn:(NSInteger)colNum atRow:(NSInteger)rowNum withSprite:(SKSpriteNode *)moleSprite;

@end
