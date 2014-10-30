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

- (id)initWithNumRows:(NSInteger)row;
-(NSSet *)addInitialMolesWithRows:(NSInteger)numRows;
- (Mole *)moleAtRow:(NSInteger)rowNum column:(NSInteger)colNum;

@end
