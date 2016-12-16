//
//  ContentTableViewCell.m
//  PureLayoutDemo
//
//  Created by caochao on 16/12/5.
//  Copyright © 2016年 snailCC. All rights reserved.
//

#import "ContentTableViewCell.h"

@interface ContentTableViewCell()

@property (nonatomic,retain) UILabel *title;
@property (nonatomic,retain) UILabel *content;

@end


@implementation ContentTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.content.preferredMaxLayoutWidth = CGRectGetWidth(self.content.frame);
}
#pragma mark - Setup

- (void)setupSubViews{
    
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.content];
}
#pragma mark - subviews

- (UILabel *)title{
    
    if (!_title) {
        _title = [UILabel newAutoLayoutView];
        _title.font = [UIFont systemFontOfSize:26];
        _title.numberOfLines = 1;
        
        [_title setLineBreakMode:NSLineBreakByTruncatingTail];
        [_title setTextAlignment:NSTextAlignmentLeft];
        [_title setTextColor:[UIColor blackColor]];
        _title.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1];
    }
    return _title;
}
- (UILabel *)content{
    
    if (!_content) {
        _content = [UILabel newAutoLayoutView];
        _content.font = [UIFont systemFontOfSize:16];
        _content.numberOfLines = 0;
        [_content setLineBreakMode:NSLineBreakByTruncatingTail];
        [_content setTextAlignment:NSTextAlignmentLeft];
        [_content setTextColor:[UIColor darkGrayColor]];
        _content.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
    }
    return _content;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {

        [self.title autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
        
        [self.content autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.title withOffset:2 relation:NSLayoutRelationGreaterThanOrEqual];
        
        [self.content autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [self.content autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        [self.content autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    }
    [super updateConstraints];
    
}


- (void)setInfo:(NSDictionary *)info{

    if (info !=nil) {

        self.title.text = [info valueForKey:@"title"];
        self.content.text =[info valueForKey:@"content"];
        [super setInfo:info];
    }

}


@end
