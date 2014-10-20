//
//  Grid.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/19/14.
//
//

#import <Foundation/Foundation.h>
#import "Mole.h"

@interface Grid : NSObject

@property (strong, nonatomic)NSMutableArray *moles;
@property (assign, nonatomic)NSInteger numRows;
@property (assign, nonatomic)NSInteger numColumns;
@property (strong, nonatomic) SKTexture *moleTexture;

- (id)initWithNumRows:(NSInteger)row;
- (Mole *)addMoleAtColumn:(NSInteger)colNum atRow:(NSInteger)rowNum;
- (void)setSprite:(SKSpriteNode *)node forMoleInRow:(NSInteger)row inColumn:(NSInteger)column;
- (Mole *)moleAtRow:(NSInteger)rowNum column:(NSInteger)colNum;
- (Mole *)findSprite:(SKNode *)node;

@end
