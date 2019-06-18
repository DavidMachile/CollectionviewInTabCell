//
//  myCollectionReusableView.m
//  CollectionviewInTabCell
//
//  Created by ctvit on 2019/6/12.
//  Copyright © 2019 CCTV. All rights reserved.
//

#import "myCollectionReusableView.h"

@implementation myCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, self.bounds.size.height)];
        _titleLabel.textColor = [UIColor orangeColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text= @"aaaabbbbcccc";
        [self addSubview:_titleLabel];
    }
    return self;
}
@end
