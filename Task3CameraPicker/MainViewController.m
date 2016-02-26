//
//  MainViewController.m
//  Task3CameraPicker
//
//  Created by iuser on 24.02.16.
//  Copyright © 2016 iuser. All rights reserved.
//

#import "MainViewController.h"
#import "MyView.h"
#import "MyCollectionViewCell.h"

@interface MainViewController () <MyCameraProtocol>
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (strong,nonatomic) MyView *overlay;
@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];    
 
}

- (IBAction)showImagePickerForCamera:(id)sender
{
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)showImagePickerForPhotoPicker:(id)sender
{
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}


- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
    
    _overlay = [[[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil]firstObject];
    _overlay.delegate = self;
    _overlay.frame =CGRectMake(0, 0,375, 667);
        
        
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePickerController.showsCameraControls = NO;
    _imagePickerController.navigationBarHidden = YES;
    _imagePickerController.toolbarHidden = YES;
        _imagePickerController.allowsEditing = NO;
    _imagePickerController.cameraOverlayView = _overlay;
        _imagePickerController.delegate = self;

    [self presentViewController:_imagePickerController animated:YES completion:NULL];
    }
}

-(void)takePhoto{
    [_imagePickerController takePicture];
}

-(void)changeCamera{
    if (self.imagePickerController.cameraDevice == UIImagePickerControllerCameraDeviceRear) {
        
        self.imagePickerController.cameraDevice == UIImagePickerControllerCameraDeviceFront;
    }
    else
    {
        self.imagePickerController.cameraDevice == UIImagePickerControllerCameraDeviceRear;
    }

}
-(void)useFlash
{
    if (self.imagePickerController.cameraFlashMode == UIImagePickerControllerCameraFlashModeOn) {
    
        self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
    }
    else if (self.imagePickerController.cameraFlashMode == UIImagePickerControllerCameraFlashModeOff)
    {
    self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeOn;
    }
//    else if (self.imagePickerController.cameraFlashMode == UIImagePickerControllerCameraFlashModeOff)
//    {
//        
//       self.imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
//    }
  
}


//chosen from the library
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [_overlay addImageToCollection:image];

}


//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}

//- (void)finishAndUpdate
//{
//    [self dismissViewControllerAnimated:YES completion:NULL];
//    
//    if ([self.capturedImages count] > 0)
//    {
//        if ([self.capturedImages count] == 1)
//        {
//            // Camera took a single picture.
//            [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
//        }
//        else
//        {
//            // Camera took multiple pictures; use the list of images for animation.
//            self.imageView.animationImages = self.capturedImages;
//            self.imageView.animationDuration = 5.0;    // Show each captured photo for 5 seconds.
//            self.imageView.animationRepeatCount = 0;   // Animate forever (show all photos).
//            [self.imageView startAnimating];
//        }
//        
//        // To be ready to start again, clear the captured images array.
//        [self.capturedImages removeAllObjects];
//    }
//    
//    self.imagePickerController = nil;
//}

@end
