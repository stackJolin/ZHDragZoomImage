//
//  ZHUITableViewController.m
//  ZHDragZoomImage
//
//  Created by user on 14/11/28.
//  Copyright © 2014年 luochengdong. All rights reserved.
//


#import "ZHUITableViewController.h"
#import "ZHZoomModel.h"
#define kScreentWidth [UIScreen mainScreen].bounds.size.width

@interface ZHUITableViewController()
@property (nonatomic, strong) ZHZoomModel *model;
@property (nonatomic, strong) UIImageView *headerImageView;
@end

@implementation ZHUITableViewController

- (UIImageView *)headerImageView{
    if (_headerImageView == nil){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luochengduo"]];
        imageView.frame = CGRectMake(0, 0, kScreentWidth, 200);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        return imageView;
    }
    else{
        return _headerImageView;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    self.model = [[ZHZoomModel alloc] initWithItem:self.tableView andWithItemHeader:self.headerImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.text = @"哈哈哈";
    return cell;
}
@end
