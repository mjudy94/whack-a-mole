//
//  ViewController.h
//  WAMProto
//

//  Copyright (c) 2014 Dan Saganome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface ViewController : UIViewController

-(void)switchToCamera;
-(void)setImage:(UIImage *) picture;
-(UIImage*)getImage;
@property (strong, nonatomic) UIImage *molePicture;

@end
