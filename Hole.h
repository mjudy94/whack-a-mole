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


+ (NSMutableArray *)initWithNumColumns:(NSInteger)column row:(NSInteger)row;
+ (NSMutableArray *)createMolesAtColumn:(NSInteger)column row:(NSInteger)row;


@end
