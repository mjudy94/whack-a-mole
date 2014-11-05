//  MainMenuScene.h
//  Whack-A-Mole
//
//  Created by Matthew Judy on 10/5/14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "CameraViewController.h"

@interface MainMenuScene : SKScene <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) id <SKSceneDelegate> delegate;
@property (nonatomic) UIImage *molePicture;
@end

@protocol sceneDelegate <NSObject>
-(void)showShareScreen;
@end