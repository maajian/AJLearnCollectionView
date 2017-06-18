//
//  AJCollectionViewCell.h
//  AJCollectionView
//
//  Created by zhundao on 2017/6/16.
//  Copyright © 2017年 zhundao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *topLabel;
@property(nonatomic,strong)UILabel *bottomLabel;

- (void)setTopLabelWithStr :(NSString *)topStr bottomLabelWithStr:(NSString *)bottomStr;
@end
