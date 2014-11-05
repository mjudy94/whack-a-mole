//
//  ViewController.m
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/5/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CameraViewController.h"
#import "MainMenuScene.h"
#import <SpriteKit/Spritekit.h>
#import "AppDelegate.h"


@implementation ViewController

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    //[self.navigationController pushViewController:_detailViewController animated:YES];
    
}
-(void)switchToCamera{
    NSLog(@"SwitchView");
    CameraViewController *camView = [[CameraViewController alloc] initWithNibName:(@"CameraViewController") bundle:nil];
    [self presentViewController:camView animated:YES completion:nil];
}

-(void)setImage:(UIImage *) picture{

    _molePicture = picture;
}

-(UIImage*)getImage{
    if( _molePicture == NULL)
        NSLog(@"pic is nuLLLLLLL");
    return _molePicture;
}


- (void)viewDidLoad {
    // UIImagePickerControllerOriginalImage *imagePicker = [[UIImagePickerController alloc] init];
    NSLog(@"Hello");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Hello");
    
    MainMenuScene* main = [[MainMenuScene alloc] initWithSize:CGSizeMake(768, 1024)];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: main];
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
