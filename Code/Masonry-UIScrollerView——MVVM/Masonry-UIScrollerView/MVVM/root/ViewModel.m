//
//  ViewModel.m
//  Masonry-UIScrollerView
//
//  Created by Loren on 2018/4/19.
//  Copyright © 2018年 Loren. All rights reserved.
//

#import "ViewModel.h"
#import "ModelTableViewCell.h"

@interface ViewModel()

@property (nonatomic, copy) ViewModelSuccessHandler successBlock;
@property (nonatomic, copy) ViewModelFaileHandler faileBlock;
@property (nonatomic, copy) ViewModelTableViewDidSelectorHandler tableViewDidSelectorHandler;
@property (nonatomic, copy) NSArray * dataSource;

@end

@implementation ViewModel

- (void)_reloadDataFromViewModelWithSuccess:(ViewModelSuccessHandler)success faile:(ViewModelFaileHandler)faile{
    self.successBlock = success;
    self.faileBlock = faile;
}
- (void)_tableViewCellDidSelectWithHandler:(ViewModelTableViewDidSelectorHandler)tableViewDidSelectorHandler{
    self.tableViewDidSelectorHandler = tableViewDidSelectorHandler;
}
- (void)_loadData{
    Model * model1 = [[Model alloc] init];
    model1.title = @"横向";
    
    Model * model2 = [[Model alloc] init];
    model2.title = @"竖向";
    
    self.dataSource = @[model1,model2];
    self.successBlock(self.dataSource);
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ModelTableViewCell * cell = [[ModelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.tableViewDidSelectorHandler) {
        self.tableViewDidSelectorHandler(tableView, indexPath,self.dataSource[indexPath.row]);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

@end
