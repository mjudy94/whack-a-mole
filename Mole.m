//
//  Mole.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/7/14.
//
//

#import "Mole.h"

@implementation Mole

@synthesize column;
@synthesize row;
@synthesize isVisible;
@synthesize duration;
@synthesize name;
@synthesize sprite;

- (id)initAtColumn:(NSInteger)colNum atRow:(NSInteger)rowNum withSprite:(SKSpriteNode *)moleSprite
{
    [self setColumn:colNum];
    [self setRow:rowNum];
    [self setIsVisible:false];
    [self setName:@"mole"];
    [self setSprite:moleSprite];
    return self;
}

@end
