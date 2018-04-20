//
//  ViewModel.h
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/19.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Model.h"

typedef void(^ViewModelSuccessHandler)(id data);
typedef void(^ViewModelFaileHandler)(NSError * error);
typedef void(^ViewModelTableViewDidSelectorHandler)(UITableView * tableView,NSIndexPath * indexPath ,Model * model);

@interface ViewModel : NSObject<UITableViewDelegate,UITableViewDataSource>
- (void)_reloadDataFromViewModelWithSuccess:(ViewModelSuccessHandler)success faile:(ViewModelFaileHandler)faile;
- (void)_tableViewCellDidSelectWithHandler:(ViewModelTableViewDidSelectorHandler)tableViewDidSelectorHandler;
- (void)_loadData;
@end
