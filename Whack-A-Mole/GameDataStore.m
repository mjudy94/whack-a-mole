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

+ (instancetype)sharedStore
{
    static GameDataStore *sharedStore;
    
    if (!sharedStore) {
        NSLog(@"initializing sharedStore");
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (void)updateHighScore:(NSMutableArray *)updatedScores forIndex:(int)index
{
    GameData *scores = [[GameData alloc] init];
    [self.highScores setObject:scores atIndexedSubscript:index];
}

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
            GameData *easyClassic = [[GameData alloc] initWithName:@"easyClassic"];
            GameData *easyContinuous = [[GameData alloc] initWithName:@"easyContinuous"];
            GameData *mediumClassic = [[GameData alloc] initWithName:@"mediumClassic"];
            GameData *mediumContinuous = [[GameData alloc] initWithName:@"mediumContinuous"];
            GameData *hardClassic = [[GameData alloc] initWithName:@"hardClassic"];
            GameData *hardContinuous = [[GameData alloc] initWithName:@"hardContinuous"];
            
            self.highScores = [[NSMutableArray alloc]initWithObjects:easyClassic, easyContinuous, mediumClassic, mediumContinuous, hardClassic, hardContinuous, nil];
        }
    }
    
    return self;
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"highScores.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:self.highScores toFile:path];
}

- (NSMutableArray *)allItems
{
    return [self.highScores copy];
}

@end
