//
//  CameraViewController.h
//  Whack-A-Mole
//
//  Created by Dan Saganome on 11/5/14.
//
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *ImageView;

- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)Done:(UIButton *)sender;

@end

