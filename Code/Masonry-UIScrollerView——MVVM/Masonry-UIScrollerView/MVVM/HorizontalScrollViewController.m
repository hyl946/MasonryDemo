//
//  HorizontalScrollViewController.m
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/20.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import "HorizontalScrollViewController.h"
#import <Masonry.h>

#define RandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]

@interface HorizontalScrollViewController ()

@property (nonatomic, strong) UIScrollView * horizontalScrollerView;//水平
@property (nonatomic, strong) UIView * horizontalContentView;

@end

@implementation HorizontalScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat navHeight = [UIApplication sharedApplication].statusBarFrame.size.height + 44;
    CGFloat height = self.view.frame.size.height-navHeight;
    
    self.horizontalScrollerView = [[UIScrollView alloc] init];
    if (@available(iOS 11.0, *)) {
        self.horizontalScrollerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    [self.view addSubview:self.horizontalScrollerView];
    [self.horizontalScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(navHeight, 0, 0, 0));
    }];
    
    self.horizontalContentView = [[UIView alloc] init];
    [self.horizontalScrollerView addSubview:self.horizontalContentView];
    [self.horizontalContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.horizontalScrollerView);
        make.left.mas_offset(0);
        make.height.equalTo(self.horizontalScrollerView.mas_height);
    }];
    
    UIView * tv;
    for (int i = 0; i<10; i++) {
        UILabel * label = [[UILabel alloc] init];
        label.textColor = RandomColor;
        label.font = [UIFont systemFontOfSize:20];
        label.backgroundColor = RandomColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"当前第%d个label",i];
        [self.horizontalContentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            if (tv) {
                make.left.equalTo(tv.mas_right);
            }
            else {
                make.left.mas_offset(0);
            }
            make.top.equalTo(self.horizontalContentView.mas_top);
            make.width.equalTo(self.horizontalScrollerView.mas_width);
            make.height.equalTo(self.horizontalScrollerView.mas_height);
        }];
        tv = label;
    }
    [self.horizontalContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(tv.mas_right);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
