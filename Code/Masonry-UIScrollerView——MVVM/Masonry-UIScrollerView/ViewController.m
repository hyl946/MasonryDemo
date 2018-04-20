//
//  ViewController.m
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/19.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <ReactiveCocoa.h>
#import "RootViewController.h"

#define RandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]

@interface ViewController ()
@property (nonatomic, strong)UIScrollView * scrollerView;
@property (nonatomic, strong)UIView * contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ViewController";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStyleDone target:self action:@selector(rightClick:)];
    

    CGFloat navHeight = [UIApplication sharedApplication].statusBarFrame.size.height + 44;
    CGFloat height = self.view.frame.size.height-navHeight;
    CGFloat width = self.view.frame.size.width ;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollerView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
    
    if (@available(iOS 11.0, *)) {
        self.scrollerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.view addSubview:self.scrollerView];
    
    //这个要放在添加子视图之前
    [self.scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(navHeight, 0, 0, 0));
    }];
    
    [self.scrollerView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollerView);
        make.width.mas_offset(width);
    }];
    
    UIView * tv;
    for (int i = 0; i<10; i++) {
        UIView * v = [[UIView alloc] initWithFrame:CGRectZero];
        v.backgroundColor = RandomColor;
        [self.contentView addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            if (tv) {
                make.top.mas_equalTo(tv.mas_bottom);
            }
            else {
                make.top.mas_offset(0);
            }
            make.left.mas_offset(0);
            make.width.mas_offset(width);
            make.height.mas_offset(height);
        }];
        tv = v;
    }
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(tv.mas_bottom);
    }];
    
}

- (void)rightClick:(id)sender{
    RootViewController * rootVc = [[RootViewController alloc] init];
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:rootVc];
    [self.navigationController pushViewController:rootVc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
