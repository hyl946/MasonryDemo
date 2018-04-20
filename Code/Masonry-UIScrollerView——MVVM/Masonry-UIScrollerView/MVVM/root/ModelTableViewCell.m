//
//  ModelTableViewCell.m
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/19.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import "ModelTableViewCell.h"
#import <Masonry.h>

@implementation ModelTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self masonryUI];
    }
    return self;
}
- (void)masonryUI{
    self.m_titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.m_titleLabel.textColor = [UIColor redColor];
    self.m_titleLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.m_titleLabel];
    [self.m_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(30);
        make.top.mas_offset(10);
        make.bottom.mas_offset(0);
        make.right.equalTo(self.contentView).mas_offset(0);
    }];
}

- (void)setModel:(Model *)model{
    _model = model;
    self.m_titleLabel.text = model.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
