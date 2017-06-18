//
//  AJHeaderViewCollectionReusableView.m
//  AJCollectionView
//
//  Created by zhundao on 2017/6/16.
//  Copyright © 2017年 zhundao. All rights reserved.
//

#import "AJHeaderViewCollectionReusableView.h"
@interface AJHeaderViewCollectionReusableView()
{
    UILabel *label;
}
@end
@implementation AJHeaderViewCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self =  [super initWithFrame:frame] ) {
        [self createLabel];
        [self setGradientLayer];
    }
    return self;
}
- (void)createLabel //创建label
{
    label = [[UILabel alloc]initWithFrame:CGRectZero];
//    label.backgroundColor = [UIColor colorWithRed:15.0/ 255.0f  green:20.0f/ 255.0f  blue:103.0f / 255.0f alpha:1];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
}
- (void)setTitle:(NSString *)title
{
    label.text = title;
}
- (void)setGradientLayer
{
    CAGradientLayer *layer = [CAGradientLayer layer];  //创建一个渐变图层
    
    layer.frame = self.frame;  //图层大小为label的大小
    
    layer.colors =@[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];  //渐变范围为 数组颜色之间
    
    [self.layer addSublayer:layer];  // 添加图层到父视图
    
    [layer setStartPoint:CGPointMake(0, 0)];   // 设置渐变点 由y = 0 -> y=1   上下渐变
    
    [layer setEndPoint:CGPointMake(1, 1)];
    
    layer.locations = @[@(0.0f),@(0.5f), @(1.0f)];
    layer.mask = label.layer ;  // mask 属性 会将label上不透明的部分会盖上 layer的图层,label上透明的图层将会被绘制成白色 ,在这里 label上只有字体时不透明的 ，所以设置遮罩后除了字都变成白色，字为遮罩渐变色

}


- (void)layoutSubviews
{
    label.frame = self.frame;
}

@end
