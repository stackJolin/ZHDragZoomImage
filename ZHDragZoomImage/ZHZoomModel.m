//
//  ZHZoomModel.m
//  ZHDragZoomImage
//
//  Created by user on 14/12/2.
//  Copyright © 2014年 luochengdong. All rights reserved.
//

#import "ZHZoomModel.h"

@interface ZHZoomModel()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;

@end


@implementation ZHZoomModel

- (instancetype)initWithItem:(UITableView *)tableView andWithItemHeader:(UIView *)headerView{
    self.tableView = tableView;
    self.headerView = headerView;
    [self insertHeaderViewInTableView];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld context:nil];
    return self;
}

- (void)insertHeaderViewInTableView{
    [self.tableView insertSubview:(self.headerView) atIndex:0];
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    tableHeaderView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = tableHeaderView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (![keyPath isEqualToString:@"contentOffset"]){
        return;
    }
    if (self.tableView.contentOffset.y > 0){
        return;
    }
    CGFloat oldoffsetY = [change[@"old"] CGPointValue].y;
    CGFloat offsetY = self.tableView.contentOffset.y - oldoffsetY;
    self.headerView.frame = CGRectInset(self.headerView.frame, offsetY, offsetY);
}
- (void)dealloc{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}
@end
