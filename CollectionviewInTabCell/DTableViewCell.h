//
//  DTableViewCell.h
//  CollectionviewInTabCell
//
//  Created by ctvit on 2019/6/12.
//  Copyright © 2019 CCTV. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DTableViewCellDelegate <NSObject>

- (void)changeCellHeight:(CGFloat)height cell:(UITableViewCell *)cell;

@end

@interface DTableViewCell : UITableViewCell
- (void)setCellWithArr:(NSArray *)arr;
@property (nonatomic , weak) id <DTableViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
