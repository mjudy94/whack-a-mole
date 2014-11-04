//
//  Grid.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/19/14.
//
//

#import "Grid.h"

@implementation Grid

Mole *_moles[3][4];

- (id)initWithNumRows:(NSInteger)row
{
    
    self = [super init];
    return self;
}

//add moles to the grid
-(NSSet *)addInitialMolesWithRows:(NSInteger)rows
{
    NSMutableSet *set = [[NSMutableSet alloc] init];
    for (NSInteger row = 0; row < rows; row++)
    {
        for(NSInteger column = 0; column < 3; column++)
        {
            Mole *mole = [[Mole alloc] initAtColumn:column atRow:row];
            _moles[column][row] = mole;
            NSLog(@"Displaying mole row when adding initial moles");
            NSLog(@"%lu", row);
            [set addObject:mole];
        }
    }
    return set;
}

//return the mole object at the specified index
- (Mole *)moleAtRow:(NSInteger)rowNum column:(NSInteger)colNum
{
    return _moles[rowNum][colNum];
}

@end
