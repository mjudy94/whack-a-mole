//
//  Hole.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/7/14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "Mole.h"

@interface Hole : NSObject

@property (assign, nonatomic) NSInteger numRows;
@property (assign, nonatomic) NSInteger numColumns;


+ (Hole *)initWithNumColumns:(NSInteger)column row:(NSInteger)row;
+ (Mole *)moleAtColumn:(NSInteger)column row:(NSInteger)row; //needs to return mole because may need to remove mole object if it's been tapped


@end
