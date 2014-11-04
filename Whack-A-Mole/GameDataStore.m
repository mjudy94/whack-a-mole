//
//  GameDataStore.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 11/3/14.
//
//

#import "GameDataStore.h"
#import "GameData.h"

@interface GameDataStore()

@property (nonatomic)NSMutableArray *highScores;

@end

@implementation GameDataStore

// a public instance of GameDataStore for GameOverScene to access
+ (instancetype)sharedStore
{
    static GameDataStore *sharedStore;
    
    if (!sharedStore) {
        NSLog(@"initializing sharedStore");
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

//update the highScores array for a GameData object in GameDataStore
- (void)updateHighScore:(NSMutableArray *)updatedScores forIndex:(int)index
{
    GameData *scores = [[GameData alloc] initWithScores:updatedScores];
    [self.highScores setObject:scores atIndexedSubscript:index];
}

//initialize a GameDataStore object
- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        NSString *path = [self itemArchivePath];
        _highScores = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"%@", _highScores);
        if(!_highScores)
        {
            NSLog(@"initializing all high scores");
            GameData *easyClassic = [[GameData alloc] init];
            GameData *easyContinuous = [[GameData alloc] init];
            GameData *mediumClassic = [[GameData alloc] init];
            GameData *mediumContinuous = [[GameData alloc] init];
            GameData *hardClassic = [[GameData alloc] init];
            GameData *hardContinuous = [[GameData alloc] init];
            
            self.highScores = [[NSMutableArray alloc]initWithObjects:easyClassic, easyContinuous, mediumClassic, mediumContinuous, hardClassic, hardContinuous, nil];
        }
    }
    
    return self;
}

//retrieve the archive location of the GameDataStore object
- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"highScores.archive"];
}

//save the GameDataStore object at the specified path
- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:self.highScores toFile:path];
}

//return a copy of the highScores array of GameData highScores
- (NSMutableArray *)allItems
{
    return [self.highScores copy];
}

@end
