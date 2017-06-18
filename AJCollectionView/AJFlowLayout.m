//
//  AJFlowLayout.m
//  AJCollectionView
//
//  Created by zhundao on 2017/6/16.
//  Copyright © 2017年 zhundao. All rights reserved.
//

#import "AJFlowLayout.h"

@implementation AJFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        self.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
        self.minimumLineSpacing  =20 ;//最小行间距
        self.minimumInteritemSpacing  = 20 ; //垂直间距
        self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/2-30, [UIScreen mainScreen].bounds.size.width/2-10);  //设置 每个item的大小
        self.scrollDirection = UICollectionViewScrollDirectionVertical; //设置滑动方向
        self.sectionInset = UIEdgeInsetsMake(0, 20, 20, 20);
    }
    
    return self;
}


@end
