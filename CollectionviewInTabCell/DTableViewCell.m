//
//  DTableViewCell.m
//  CollectionviewInTabCell
//
//  Created by ctvit on 2019/6/12.
//  Copyright © 2019 CCTV. All rights reserved.
//

#import "DTableViewCell.h"
#import "MyCollectionViewCell.h"
#import "Masonry/Masonry.h"
#import "myCollectionReusableView.h"
#import "ZHCollectionViewFlowLayout.h"
@interface DTableViewCell ()<UICollectionViewDelegate , UICollectionViewDataSource,ZHCollectionViewFlowLayoutDelegate>
@property (nonatomic , strong)  UICollectionView *collectionview;
@property (nonatomic , strong)  NSArray *dataArray;
@property (nonatomic , assign) float cellH;

@end
@implementation DTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.dataArray = [NSArray array];
        _cellH = 0;
        [self.contentView addSubview:self.collectionview];
       
        
        [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.top.equalTo(@0);
            make.height.mas_equalTo(@1).priorityLow();//设置一个高度，以便赋值后更新
        }];
      
    }
    return self;
}
- (void)setCellWithArr:(NSArray *)arr{
    _dataArray = arr;
    [self setNeedsLayout];
    [self layoutIfNeeded];
//    //获取collectionview高度
    [self.collectionview reloadData];
    CGFloat height = self.collectionview.collectionViewLayout.collectionViewContentSize.height;
    NSLog(@"height = %lf",height);
    //更新collectionView
    [self.collectionview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(height)).priorityLow();

    }];
//    if ([self.delegate respondsToSelector:@selector(changeCellHeight:cell:)]) {
//        [self.delegate changeCellHeight:height cell:self];
//    }
}
- (UICollectionView *)collectionview{
    if (!_collectionview) {
        ZHCollectionViewFlowLayout *flowLayout = [[ZHCollectionViewFlowLayout alloc]init];
        flowLayout.delegate = self;
        _collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
        _collectionview.backgroundColor = UIColor.blueColor;
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.scrollEnabled = NO;
        [_collectionview registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"col"];
        [_collectionview registerClass:[myCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    }
    return _collectionview;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"col" forIndexPath:indexPath];
    cell.label.text = _dataArray[indexPath.row];
    
    [cell.label sizeToFit];

    //获取collectionview高度
    CGFloat height = self.collectionview.collectionViewLayout.collectionViewContentSize.height;
    
    //更新collectionView
    [self.collectionview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(height)).priorityLow();
        
    }];
    if (indexPath.row == _dataArray.count-1) {
        if ([self.delegate respondsToSelector:@selector(changeCellHeight:cell:)]) {
            [self.delegate changeCellHeight:height cell:self];
        }
    }
    
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
//    NSString *str = self.dataArray[indexPath.row];
////    CGRect frame = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:nil size:14],NSFontAttributeName, nil] context:nil];
//
//    UILabel *label = [UILabel new];
//    label.text = str;
//    [label sizeToFit];
//    return CGSizeMake(label.frame.size.width+20, 30);
//}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    myCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    //获取collectionview高度
    CGFloat height = self.collectionview.collectionViewLayout.collectionViewContentSize.height;
//    NSLog(@"height = %lf,%lf",height,_cellH);
    
    //更新collectionView
    [self.collectionview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(height)).priorityLow();
        
    }];
    
    headerView.backgroundColor = UIColor.greenColor;
    return headerView;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView Customlayout:(ZHCollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString * string = self.dataArray[indexPath.row];
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0]} context:nil].size;
    UILabel *lab = [UILabel new];
    lab.text = string;
    [lab sizeToFit];
    return lab.frame.size.width;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(200, 30);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
