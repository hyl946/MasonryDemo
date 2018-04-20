//
//  ViewController.m
//  MasonryDemo
//
//  Created by Loren on 2018/4/18.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

#define RandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]
@interface ViewController ()

@property (strong, nonatomic) UIView *v1;
@property (strong, nonatomic) UIView *v2;
@property (strong, nonatomic) UIView *v3;
@property (strong, nonatomic) UIView *v4;
@property (strong, nonatomic) UIView *v5;
@property (strong, nonatomic) UIView *v6;
@property (strong, nonatomic) UIView *v7;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat padding = 50;
    CGFloat height = 100;
    
    self.v1 = [[UIView alloc] initWithFrame:CGRectZero];
    self.v2 = [[UIView alloc] initWithFrame:CGRectZero];
    self.v3 = [[UIView alloc] initWithFrame:CGRectZero];
    self.v4 = [[UIView alloc] initWithFrame:CGRectZero];
    self.v5 = [[UIView alloc] initWithFrame:CGRectZero];
    self.v6 = [[UIView alloc] initWithFrame:CGRectZero];
    self.v7 = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.v1];
    [self.view addSubview:self.v2];
    [self.view addSubview:self.v3];
    [self.view addSubview:self.v4];
    [self.view addSubview:self.v5];
    [self.view addSubview:self.v6];
    [self.v6 addSubview:self.v7];
    
    self.v1.backgroundColor = RandomColor;
    self.v2.backgroundColor = RandomColor;
    self.v3.backgroundColor = RandomColor;
    self.v4.backgroundColor = RandomColor;
    self.v5.backgroundColor = RandomColor;
    self.v6.backgroundColor = RandomColor;
    self.v7.backgroundColor = RandomColor;

    [self.v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(padding);
        make.left.equalTo(self.view).offset(padding);
        make.right.equalTo(self.v2.mas_left).offset(-padding);
        make.width.equalTo(self.v2);
        make.height.offset(height);
    }];
    self.v1.backgroundColor = [UIColor redColor];
    [self.v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-padding);
        make.top.equalTo(self.v1);
        make.height.equalTo(self.v1);
        make.width.equalTo(self.v1);
    }];
    
    
    [self.v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(padding);
        make.top.equalTo(self.v1.mas_bottom).mas_offset(padding);
        make.right.equalTo(self.v4.mas_left).mas_offset(-padding);
        make.height.mas_offset(height);
    }];
    [self.v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.v3.mas_right).mas_offset(padding);
        make.right.equalTo(self.v5.mas_left).mas_offset(-padding);
        make.top.equalTo(self.v3);
        make.height.equalTo(self.v3);
    }];
    [self.v5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.v4.mas_right).mas_offset(padding);
        make.top.equalTo(self.v4);
        make.height.equalTo(self.v4);
        make.right.equalTo(self.view.mas_right).mas_offset(-padding);
        make.width.equalTo(@[self.v3,self.v4]);
    }];

    [self.v6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.v5.mas_bottom).mas_offset(padding);
        make.width.mas_offset(height);
        make.height.mas_offset(height);
        make.bottom.equalTo(self.v5.mas_bottom).mas_offset(padding+height);
        make.centerX.equalTo(self.view.mas_centerX);
    }];

    UIEdgeInsets edg = UIEdgeInsetsMake(5, 5, 5, 5);
    [self.v7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.v6).insets(edg);
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
