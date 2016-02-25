//
//  MainViewController.m
//  Task3CameraPicker
//
//  Created by iuser on 24.02.16.
//  Copyright © 2016 iuser. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic) IBOutlet UIView *overlayView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *takePictureButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *startStopButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *delayedPhotoButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) UIImagePickerController *imagePickerController;
@property (weak, nonatomic) IBOutlet UIViewController *myViewController;
@property (nonatomic) NSMutableArray *capturedImages;
@end

@implementation MainViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.capturedImages = [[NSMutableArray alloc] init];
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

    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        imagePickerController.showsCameraControls = YES;
        imagePickerController.navigationBarHidden = YES;
        imagePickerController.toolbarHidden = YES;
        
    
    }
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
    
    
    
#pragma mark Load From Nib 
    
//    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//    
//    imagePickerController.sourceType= UIImagePickerControllerSourceTypeCamera;
//    imagePickerController.delegate= self;
//    imagePickerController.showsCameraControls= NO;
//    NSArray* nibViews= [[NSBundle mainBundle] loadNibNamed:@"MyView" owner:imagePickerController options:nil];
//    UIView* uiView= [nibViews objectAtIndex:0];
//    uiView.opaque= NO;
//    uiView.backgroundColor= [UIColor clearColor];
//    imagePickerController.cameraOverlayView= uiView;
//    
//    self.myViewController = imagePickerController;
//    
//    _myViewController.view.frame = [UIScreen mainScreen].applicationFrame;


}


- (IBAction)takePhoto:(id)sender
{
    [self.imagePickerController takePicture];
}

- (void)finishAndUpdate
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            // Camera took a single picture.
            [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
        }
        else
        {
            // Camera took multiple pictures; use the list of images for animation.
            self.imageView.animationImages = self.capturedImages;
            self.imageView.animationDuration = 5.0;    // Show each captured photo for 5 seconds.
            self.imageView.animationRepeatCount = 0;   // Animate forever (show all photos).
            [self.imageView startAnimating];
        }
        
        [self.capturedImages removeAllObjects];
    }
    
    self.imagePickerController = nil;
}

//chosen from the library
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
    
    [self finishAndUpdate];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
