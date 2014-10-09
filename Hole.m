//
//  Hole.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/7/14.
//
//

#import "Hole.h"

@implementation Hole

+ (Hole *)initWithNumColumns:(NSInteger)numColumns row:(NSInteger)numRows
{
    Hole *_holes = [[Hole alloc]init];
    [_holes setNumColumns:numColumns];
    [_holes setNumRows:numRows];
    
    return _holes;
}

+ (Mole *)moleAtColumn:(NSInteger)column row:(NSInteger)row
{
    
    
    
}



@end
