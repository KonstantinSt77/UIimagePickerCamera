//
//  MyView.m
//  Task3CameraPicker
//
//  Created by iuser on 26.02.16.
//  Copyright © 2016 iuser. All rights reserved.
//

#import "MyView.h"

@interface MyView()

@property (strong,nonatomic) NSMutableArray *myArray;

@end

@implementation MyView

- (IBAction)takePhotoPressed:(id)sender {
    [_delegate takePhoto];
}
-(IBAction)changeCamera{
    [_delegate changeCamera];
}
-(IBAction)useFlash{
    [_delegate useFlash];
}

-(void)addImageToCollection:(UIImage *)image
{
    [self.myArray addObject:image];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    [self.collectionView reloadData];
}

-(void)awakeFromNib {
    self.myArray = [NSMutableArray new];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    //self.collectionView.backgroundView.alpha = 0.0;
    [self.collectionView setCollectionViewLayout:flowLayout];

}
#pragma mark : Collection View Datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.myArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.myImage.image = [self.myArray objectAtIndex:indexPath.row];
    return cell;
}



@end
