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
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}
- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setupSubViews];
    }
    
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
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
        _title.numberOfLines = 0;
    }
    return _title;
}
- (UILabel *)content{
    
    if (!_content) {
        _content = [UILabel newAutoLayoutView];
        _content.font = [UIFont systemFontOfSize:16];
        _content.numberOfLines = 0;
    }
    return _content;
}
#pragma mark - Update auto layout constraints

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.title autoSetDimension:ALDimensionHeight toSize:30];
        
        [self.content autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.title];
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.content autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.content autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.content autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
    
}
- (CGFloat)getRealHeight:(CGFloat)tableviewWidth{

    self.bounds = CGRectMake(0.0f, 0.0f, tableviewWidth, CGRectGetHeight(self.bounds));
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize contentSize = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGFloat height = contentSize.height;
    NSLog(@"%f,%f,%f,%f",CGRectGetHeight(self.contentView.frame),CGRectGetHeight(self.title.frame),CGRectGetHeight(self.content.frame),height);
    return height+1;
}

- (void)setInfo:(NSDictionary *)info{

    if (info !=nil) {
        _info = info;
        self.title.text = [info valueForKey:@"title"];
        self.content.text =[info valueForKey:@"content"];
//        CGSize size = [self sizeWithText:self.content.text font:self.content.font maxSize:CGSizeMake(CGRectGetWidth(self.frame), MAXFLOAT)];
//        NSLog(@"%f,%f",size.width,size.height);
//        [self.content autoSetDimension:ALDimensionHeight toSize:size.height];
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize sizeFrame;
    
    if (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_7_0) {
        sizeFrame = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }else{
        // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
        NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
        NSStringDrawingUsesFontLeading;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByCharWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
        
        CGRect rect = [text boundingRectWithSize:maxSize
                                         options:opts
                                      attributes:attributes
                                         context:nil];
        sizeFrame = rect.size;
    }
    return sizeFrame;
}
@end
