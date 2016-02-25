//
//  ViewController.m
//  Task3CameraPicker
//
//  Created by iuser on 24.02.16.
//  Copyright © 2016 iuser. All rights reserved.
//

#import "ViewController.h"
#import "MyOverlayView.h"
@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Get the camera
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = NO;
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
    self.imagePicker.showsCameraControls = NO;
    
    
    
    //set our custom overlay view
    ControlsViewController *overlayViewController = [[ControlsViewController alloc] initWithNibName:@"MyView" bundle:nil];
    [self addChildViewController:overlayViewController];
    self.imagePicker.cameraOverlayView = overlayViewController.view;
    
    [self presentViewController:self.imagePicker animated:NO completion:NULL];
    
}




@end
