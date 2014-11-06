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

-(UIImage*)getImage{
    NSLog(@"getImage called");
    if( _molePicture == NULL)
        NSLog(@"pic is nuLLLLLLL");
    return _molePicture;
}

- (void)viewDidLoad {
    // UIImagePickerControllerOriginalImage *imagePicker = [[UIImagePickerController alloc] init];
    NSLog(@"ViewDidLoad Loaded");
    
    MainMenuScene* main = [[MainMenuScene alloc] initWithSize:CGSizeMake(768, 1024)];
    // main.molePicture = _molePicture;
    if(main.molePicture == NULL){
        NSLog(@"This is fuking Null");
    }
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: main];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

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
    //_molePicture = [MYUtil imageWithImage:_molePicture scaledToSize:CGSizeMake(20, 20)];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)viewWillAppear:(BOOL)animated
{

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
