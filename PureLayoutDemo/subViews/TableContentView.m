//
//  TableContentView.m
//  PureLayoutDemo
//
//  Created by caochao on 16/12/5.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "TableContentView.h"
#import "ContentTableViewCell.h"

@interface TableContentView(){

    NSArray *_dataSource;
    NSArray *_identifiers;
}

@property (nonatomic,retain) UITableView *tableView;

@end

@implementation TableContentView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setupSubViews];
        _dataSource = @[@{@"title":@"cell_0",@"content":@"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"},
                        @{@"title":@"cell_1",@"content":@"****************"}];
        _identifiers=@[@"contentCell_0",@"contentCell_0"];
    }
    
    return self;
}
#pragma mark - Setup

- (void)setupSubViews{
    
    [super setupSubViews];
    [self addSubview:self.tableView];
}
#pragma mark - subviews
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [UITableView newAutoLayoutView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    }
    return _tableView;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        
        [self.tableView autoPinEdgesToSuperviewEdges];
    }
    [super updateConstraints];
    
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = _identifiers[indexPath.row];
    ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ContentTableViewCell alloc]init];
        [tableView registerClass:[cell class] forCellReuseIdentifier:identifier];
        
    }
    cell.info = _dataSource[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSString *identifier = _identifiers[indexPath.row];
    CGFloat height = 0;
    if ([identifier isEqualToString:@"contentCell_0"]) {
        ContentTableViewCell *cell = [[ContentTableViewCell alloc]init];
        cell.info = _dataSource[indexPath.row];
        height = [cell getRealHeight:CGRectGetWidth(tableView.bounds)];
    }

    return height;
}
@end
