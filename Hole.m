//
//  Hole.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/7/14.
//
//

#import "Hole.h"

@implementation Hole



@synthesize numColumns;
@synthesize numRows;

+ (NSMutableArray *)initWithNumColumns:(NSInteger)numColumns row:(NSInteger)numRows
{
    NSMutableArray *moles = [[NSMutableArray alloc]initWithCapacity:numColumns];
    for (int i = 0; i < numColumns; i++)
    {
        NSMutableArray *temp = [self createMolesAtColumn:i row:numRows];
        [moles insertObject:temp atIndex:i];
    }
    return moles;
}

+ (NSMutableArray *)createMolesAtColumn:(NSInteger)column row:(NSInteger)row
{
    NSMutableArray *moles = [[NSMutableArray alloc] initWithCapacity:row];
    for (int i = 0; i < row; i++)
    {
        Mole *mole = [[Mole alloc] init];
        mole.column = column;
        mole.row = row;
        [moles insertObject:mole atIndex:i];
    }
    
    return moles;
}





@end
