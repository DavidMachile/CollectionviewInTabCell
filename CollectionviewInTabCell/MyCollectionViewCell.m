//
//  MyCollectionViewCell.m
//  CollectionviewInTabCell
//
//  Created by ctvit on 2019/6/12.
//  Copyright © 2019 CCTV. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "Masonry/Masonry.h"
@implementation MyCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
        
        
    }
    return self;
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:self.contentView.frame];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = UIColor.redColor;
    }
    return _label;
}


//#pragma mark — 实现自适应文字宽度的关键步骤:item的layoutAttributes
//- (UICollectionViewLayoutAttributes*)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes {
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
//    CGSize size = [self.contentView systemLayoutSizeFittingSize: layoutAttributes.size];
//    CGRect cellFrame = layoutAttributes.frame;
//    cellFrame.size.height= size.height;
//    layoutAttributes.frame= cellFrame;
//    return layoutAttributes;
//}

@end
