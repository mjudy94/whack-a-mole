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

//@synthesize moles;
@synthesize numRows;
@synthesize numColumns;
@synthesize moleTexture;

- (id)initWithNumRows:(NSInteger)row
{
    
    self = [super init];
    return self;
}

-(NSSet *)addInitialMolesWithRows:(NSInteger)rows
{
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    NSLog(@"%ld", (long)rows);
    for (NSInteger row = 0; row < rows; row++)
    {
        for(NSInteger column = 0; column < 3; column++)
        {
            //Mole *mole = [self addMoleAtColumn:column atRow:row];
            Mole *mole = [[Mole alloc] init];
            mole.column = column;
            mole.row = row;
            mole.isVisible = false;
            _moles[row][column] = mole;
            [set addObject:mole];
        }
        NSLog(@"%lu", [set count]);
    }
    return set;
}

- (Mole *)addMoleAtColumn:(NSInteger)colNum atRow:(NSInteger)rowNum
{
    Mole *mole = [[Mole alloc] init];
    mole.column = colNum;
    mole.row = rowNum;
    mole.isVisible = false;
    _moles[rowNum][colNum] = mole;
    return mole;
}

- (Mole *)moleAtRow:(NSInteger)rowNum column:(NSInteger)colNum
{
    return _moles[rowNum][colNum];
}

- (Mole *)findSprite:(SKNode *)node
{
    //NSLog(@"before for loop for findSprite");
    NSLog(@"%ld", (long)self.numColumns);
    NSLog(@"%ld", (long)self.numRows);
    for (int i = 0; i < self.numColumns; i++)
    {
        //NSLog(@"Inside first for loop");
        for(int j = 0; j < self.numRows; j++)
        {
            NSLog(@"In find sprite");
            Mole *mole = [self moleAtRow:numRows column:numColumns];
            if([mole.sprite isEqual:(SKSpriteNode *)node])
            {
                return mole;
                NSLog(@"I'm hit!");
            }
        }
    }
    return NULL;
}

@end
