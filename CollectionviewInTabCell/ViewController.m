//
//  ViewController.m
//  CollectionviewInTabCell
//
//  Created by ctvit on 2019/6/12.
//  Copyright © 2019 CCTV. All rights reserved.
//

#import "ViewController.h"
#import "DTableViewCell.h"
#import "Masonry/Masonry.h"
@interface ViewController () <UITableViewDelegate , UITableViewDataSource ,DTableViewCellDelegate>

@property (nonatomic , strong)  UITableView *tableview;
@property (nonatomic , assign)  CGFloat cellHeight;
@property (nonatomic , strong)  UICollectionView *collectionview;
@property (nonatomic , strong) NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.dataArr =  @[@"君不见",@"黄河之水天水天水天水天上来水",@"岑夫",@"生",@"将进酒",@"君不见",@"黄河之水天上来",@"奔流到海不复回"];
    

    
    _cellHeight = 0;
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableview.estimatedRowHeight = 300;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuser"];
    [self.tableview registerClass:[DTableViewCell class] forCellReuseIdentifier:@"table"];
    [self.view addSubview:self.tableview];

    [self.tableview setNeedsLayout];
    [self.tableview layoutIfNeeded];
//
    
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        DTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"table"];
        if (!cell) {
            cell = [[DTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"table"];
        }
        cell.delegate = self;
        [cell setCellWithArr:_dataArr];
        return cell;
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"reuser" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuser"];
    }
    cell.textLabel.text = @"你好";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        return _cellHeight;
    }
    else{
        return UITableViewAutomaticDimension;
    }
}


- (void)changeCellHeight:(CGFloat)height cell:(nonnull UITableViewCell *)cell{
    _cellHeight = height;
//    [self.tableview reloadData];
//    NSIndexPath * index = [self.tableview indexPathForCell:cell];
//    [self.tableview reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
//    [self.tableview reloadData];
//    NSIndexPath *indexPath = [self.tableview indexPathForCell:cell];
//    [self.tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
}

@end
