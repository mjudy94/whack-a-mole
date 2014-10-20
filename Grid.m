//
//  Grid.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/19/14.
//
//

#import "Grid.h"

@implementation Grid

@synthesize moles;
@synthesize numRows;
@synthesize numColumns;
@synthesize moleTexture;

- (id)initWithNumRows:(NSInteger)row
{
    self.moles = [[NSMutableArray alloc]initWithCapacity:3];
    
    for (int i = 0; i < 3; i++)
    {
        NSMutableArray *moleColumn = [[NSMutableArray alloc] initWithCapacity:row];
        [self.moles insertObject:moleColumn atIndex:i];
    }
    
    return self;
}

- (Mole *)addMoleAtColumn:(NSInteger)colNum atRow:(NSInteger)rowNum
{
    SKSpriteNode *moleSprite = [[SKSpriteNode alloc] initWithTexture:self.moleTexture];
    Mole *mole = [[Mole alloc] initAtColumn:colNum atRow:rowNum withSprite:moleSprite];
    self.moles[rowNum][colNum] = mole;
    return mole;
}

- (void)setSprite:(SKSpriteNode *)node forMoleInRow:(NSInteger)row inColumn:(NSInteger)column
{
    Mole *mole = self.moles[row][column];
    [mole setSprite:node];
}

- (Mole *)moleAtRow:(NSInteger)rowNum column:(NSInteger)colNum
{
    return self.moles[rowNum][colNum];
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
            Mole *mole = self.moles[i][j];
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
