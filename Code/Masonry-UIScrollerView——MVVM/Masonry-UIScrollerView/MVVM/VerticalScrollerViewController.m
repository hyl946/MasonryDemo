//
//  VerticalScrollerViewController.m
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/20.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import "VerticalScrollerViewController.h"
#import <Masonry.h>

#define RandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]

@interface VerticalScrollerViewController ()
@property (nonatomic, strong) UIScrollView * verticalScrollerView;//垂直
@property (nonatomic, strong) UIView * verticalContentView;
@end

@implementation VerticalScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat navHeight = [UIApplication sharedApplication].statusBarFrame.size.height + 44;
    CGFloat height = self.view.frame.size.height-navHeight;
    
    self.verticalScrollerView = [[UIScrollView alloc] init];
    if (@available(iOS 11.0, *)) {
        self.verticalScrollerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    [self.view addSubview:self.verticalScrollerView];
    [self.verticalScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(navHeight, 0, 0, 0));
    }];
    
    self.verticalContentView = [[UIView alloc] init];
    [self.verticalScrollerView addSubview:self.verticalContentView];
    [self.verticalContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.verticalScrollerView);
        make.left.mas_offset(0);
        make.width.equalTo(self.view.mas_width);
    }];
    
    UIView * tv;
    for (int i = 0; i<10; i++) {
        UILabel * label = [[UILabel alloc] init];
        label.textColor = RandomColor;
        label.font = [UIFont systemFontOfSize:20];
        label.backgroundColor = RandomColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"当前第%d个label",i];
        [self.verticalContentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            if (tv) {
                make.top.equalTo(tv.mas_bottom);
            }
            else {
                make.top.mas_offset(0);
            }
            make.width.equalTo(self.verticalScrollerView.mas_width);
            make.height.equalTo(self.verticalScrollerView.mas_height);
        }];
        tv = label;
    }
    [self.verticalContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(tv.mas_bottom);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
