//
//  MyView.h
//  Task3CameraPicker
//
//  Created by iuser on 26.02.16.
//  Copyright © 2016 iuser. All rights reserved.
//
#import "MyCollectionViewCell.h"
#import <UIKit/UIKit.h>
@protocol MyCameraProtocol
-(void)takePhoto;
-(void)changeCamera;
-(void)useFlash;
@end

@interface MyView : UIView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic) NSInteger numberOfItemsInCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) id <MyCameraProtocol> delegate;
-(void)addImageToCollection:(UIImage *)image;
@end


