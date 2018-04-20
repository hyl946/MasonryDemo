//
//  RootViewController.m
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/19.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import "RootViewController.h"
#import "ViewModel.h"
#import <Masonry.h>
#import <objc/runtime.h>

@interface RootViewController ()
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) ViewModel * viewModel;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[ViewModel alloc] init];
    
    self.title = @"root";
    __weak __typeof(self) weakSelf = self ; //会循环引用
    [self.viewModel _reloadDataFromViewModelWithSuccess:^(id data) {
        [weakSelf.tableView reloadData];
    } faile:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
    }];
    
    [self.viewModel _tableViewCellDidSelectWithHandler:^(UITableView *tableView, NSIndexPath *indexPath ,Model * model) {

        [self nextControllerWithClass:NSClassFromString((indexPath.row)?@"VerticalScrollerViewController":@"HorizontalScrollViewController")];
        NSLog(@"点击了点击了点击了点击了点击了点击了点击了点击了%@",model.title);
    }];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self.viewModel;
    self.tableView.dataSource = self.viewModel;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.top.equalTo(self.view);
    }];
    
    [self.viewModel _loadData];
    [self.tableView reloadData];
    
}
- (void)nextControllerWithClass:(Class )className{
    UIViewController * vc = [[className alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)dealloc {
    NSLog(@"dealloc");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
