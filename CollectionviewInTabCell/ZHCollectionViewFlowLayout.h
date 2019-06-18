//
//  ZHCollectionViewFlowLayoutZH.h
//  CollectionViewAdaptiveWinth
//
//  Created by chaoxing-dev on 17/3/16.
//  Copyright © 2017年 chaoxing-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHCollectionViewFlowLayout;
@protocol ZHCollectionViewFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

- (CGFloat)collectionView:(UICollectionView *)collectionView Customlayout:(ZHCollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UIView *)collectionViewHeader:(UICollectionView *)collectionView layout:(ZHCollectionViewFlowLayout *)collectionViewLayout Section:(NSInteger)section;

@end

@interface ZHCollectionViewFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, weak)  id<ZHCollectionViewFlowLayoutDelegate> delegate;
@end
