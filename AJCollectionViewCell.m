//
//  AJCollectionViewCell.m
//  AJCollectionView
//
//  Created by zhundao on 2017/6/16.
//  Copyright © 2017年 zhundao. All rights reserved.
//

#import "AJCollectionViewCell.h"

@implementation AJCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame
{
  self =   [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.topLabel];
        [self.contentView addSubview:self.bottomLabel];
        
        
    }
    return self;
    
}
- (void)layoutSubviews
{
    
    _topLabel.frame = CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width/2 -60, [UIScreen mainScreen].bounds.size.width/2 -60);
    _bottomLabel.frame = CGRectMake(20, CGRectGetMaxY(_topLabel.frame), _topLabel.frame.size.width, 20);
}
- (UILabel *)topLabel
{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _topLabel.font = [UIFont systemFontOfSize:17];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.backgroundColor = [UIColor cyanColor];
    }
    return _topLabel;
}
- (UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _bottomLabel.font = [UIFont systemFontOfSize:14];
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.backgroundColor = [UIColor greenColor];
    }
    return _bottomLabel;
}
- (void)setTopLabelWithStr :(NSString *)topStr bottomLabelWithStr:(NSString *)bottomStr
{
    self.topLabel.text = topStr;
    self.bottomLabel.text = bottomStr;
}
@end
