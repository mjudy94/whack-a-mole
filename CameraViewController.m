//
//  ViewController.m
//  CameraWithXIB
//
//  Created by Dan Saganome on 11/4/14.
//  Copyright (c) 2014 Dan Saganome. All rights reserved.
//

#import "CameraViewController.h"
#import "ViewController.h"
#import "MainMenuScene.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

-(IBAction)Done:(UIButton *)sender{
    
    [(ViewController *)self.view.window.rootViewController setImage:(_ImageView.image)];
    [self dismissViewControllerAnimated:YES completion:NULL];
   // MainMenuScene* mainMenu = [[MainMenuScene alloc] initWithSize:CGSizeMake(768, 1024)];
   // mainMenu.molePicture = _ImageView.image;
   // [self.view presentScene: mainMenu];

}
- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.ImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)viewDidLoad {
    // UIImagePickerControllerOriginalImage *imagePicker = [[UIImagePickerController alloc] init];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"message:@"Device has no camera"
                                                             delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [myAlertView show];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
