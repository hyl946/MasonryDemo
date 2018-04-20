//
//  ModelTableViewCell.h
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/19.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ModelTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel * m_titleLabel;
@property (nonatomic, strong)Model * model;
@end
