//
//  GameDataStore.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 11/3/14.
//
//

#import <Foundation/Foundation.h>

@interface GameDataStore : NSObject

+(instancetype)sharedStore;
-(BOOL)saveChanges;
-(NSMutableArray *)allItems;
- (NSString *)itemArchivePath;
- (void)updateHighScore:(NSMutableArray *)updatedScores forIndex:(int)index;
@end
