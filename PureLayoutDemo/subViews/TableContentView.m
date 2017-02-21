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

    NSMutableArray *_dataSource;
    NSString *_identifier;
}

@property (nonatomic,retain) UITableView *tableView;

@end

@implementation TableContentView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setupSubViews];
        _dataSource = [NSMutableArray new];
        NSInteger count = 20;
        for (int i= 0; i<count; i++) {
            NSMutableDictionary *cellInfo = [NSMutableDictionary new];
            [cellInfo setObject:[NSString stringWithFormat:@"cell_%d",i] forKey:@"title"];
            [cellInfo setObject:[self randomLorumIpsum] forKey:@"content"];
            [_dataSource addObject:cellInfo];
        }

        _identifier=@"ContentTableViewCell";
    }
    
    return self;
}
- (NSString *)randomLorumIpsum {
    
    NSString *lorumIpsum = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non quam ac massa viverra semper. Maecenas mattis justo ac augue volutpat congue. Maecenas laoreet, nulla eu faucibus gravida, felis orci dictum risus, sed sodales sem eros eget risus. Morbi imperdiet sed diam et sodales. Vestibulum ut est id mauris ultrices gravida. Nulla malesuada metus ut erat malesuada, vitae ornare neque semper. Aenean a commodo justo, vel placerat odio. Curabitur vitae consequat tortor. Aenean eu magna ante. Integer tristique elit ac augue laoreet, eget pulvinar lacus dictum. Cras eleifend lacus eget pharetra elementum. Etiam fermentum eu felis eu tristique. Integer eu purus vitae turpis blandit consectetur. Nulla facilisi. Praesent bibendum massa eu metus pulvinar, quis tristique nunc commodo. Ut varius aliquam elit, a tincidunt elit aliquam non. Nunc ac leo purus. Proin condimentum placerat ligula, at tristique neque scelerisque ut. Suspendisse ut congue enim. Integer id sem nisl. Nam dignissim, lectus et dictum sollicitudin, libero augue ullamcorper justo, nec consectetur dolor arcu sed justo. Proin rutrum pharetra lectus, vel gravida ante venenatis sed. Mauris lacinia urna vehicula felis aliquet venenatis. Suspendisse non pretium sapien. Proin id dolor ultricies, dictum augue non, euismod ante. Vivamus et luctus augue, a luctus mi. Maecenas sit amet felis in magna vestibulum viverra vel ut est. Suspendisse potenti. Morbi nec odio pretium lacus laoreet volutpat sit amet at ipsum. Etiam pretium purus vitae tortor auctor, quis cursus metus vehicula. Integer ultricies facilisis arcu, non congue orci pharetra quis. Vivamus pulvinar ligula neque, et vehicula ipsum euismod quis.";
    
    // Split lorum ipsum words into an array
    //
    NSArray *lorumIpsumArray = [lorumIpsum componentsSeparatedByString:@" "];
    
    // Randomly choose words for variable length
    //
    int r = arc4random() % [lorumIpsumArray count];
    r = MAX(3, r); // no less than 3 words
    NSArray *lorumIpsumRandom = [lorumIpsumArray objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, r)]];
    
    // Array to string. Adding '!!!' to end of string to ensure all text is visible.
    //
    return [NSString stringWithFormat:@"%@!!!", [lorumIpsumRandom componentsJoinedByString:@" "]];
    
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
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        
    }
    return _tableView;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
        [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
        [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    }
    [super updateConstraints];
    
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return [_dataSource count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    if (cell == nil) {
        cell = [[ContentTableViewCell alloc]init];
        [tableView registerClass:[ContentTableViewCell class] forCellReuseIdentifier:_identifier];
    }
    cell.info = _dataSource[indexPath.row];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat height = 0;
    ContentTableViewCell *cell =[[ContentTableViewCell alloc]init];
    cell.info = _dataSource[indexPath.row];
    height = [cell realCellHeight:CGRectGetWidth(tableView.bounds)];
//              CGSizeMake(CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds))];
    
    return height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ContentTableViewCell *cell = (ContentTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell.info);
}
@end
