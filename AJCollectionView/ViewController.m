//
//  ViewController.m
//  AJCollectionView
//
//  Created by zhundao on 2017/6/16.
//  Copyright © 2017年 zhundao. All rights reserved.
//

#import "ViewController.h"
#import "AJFlowLayout.h"
#import "AJCollectionViewCell.h"
#import "AJHeaderViewCollectionReusableView.h"
static NSString  *cellID = @"ajID";
static NSString *viewID = @"viewID";
#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectView];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma 懒加载视图
- (UICollectionView *)collectView
{
    if (!_collectView) {
        AJFlowLayout *flowLayout = [[AJFlowLayout alloc]init];
        _collectView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout]; //设置flowlayout和尺寸
        _collectView.backgroundColor = [UIColor whiteColor];  // 设置背景颜色
        
        _collectView.dataSource =self;  //UICollectionViewDataSource
        
        _collectView.delegate =self; //UICollectionViewDelegate
        
        _collectView.pagingEnabled = NO; //是否开启分页
        
        _collectView.bounces = NO;  //是否开启弹簧效果
        
        _collectView.showsVerticalScrollIndicator = YES;  // 垂直
        
        _collectView.showsHorizontalScrollIndicator = YES;  //水平
        
        [_collectView registerClass:[AJCollectionViewCell class] forCellWithReuseIdentifier:cellID];  //注册单元格 没有xib用这个
        
//        [_collectView registerNib:[UINib nibWithNibName:@"AJCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ajID" ];    注册单元格 有xib用这个
        
        [_collectView registerClass:NSClassFromString(@"AJHeaderViewCollectionReusableView") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:viewID]; //注册头视图 没有xib
        
//        [_collectView registerNib:[UINib nibWithNibName:NSStringFromClass([UICollectionReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:viewID];  //注册头视图 没有xib 
    }
    
    return _collectView;
}


#pragma UICollectionViewDataSource      @required  必须完成的代理

//  返回多少个项目在section中
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//返回cell中的内容
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AJCollectionViewCell  *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (!Cell) {
        Cell = [[AJCollectionViewCell alloc]init];
    }
    [Cell setTopLabelWithStr:[NSString stringWithFormat:@"第%li个表情",indexPath.row] bottomLabelWithStr:[NSString stringWithFormat:@"%li-%li",indexPath.section,indexPath.row]];
    return Cell;
}

#pragma UICollectionViewDataSource      @@optional  选择完成的代理

//返回总共有多少个组 和tableview一样
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

//返回头尾视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{

//    header.backgroundColor = rgb(23.0f, 129.0f, 210.0f);
    if(kind == UICollectionElementKindSectionHeader){
         AJHeaderViewCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:viewID forIndexPath:indexPath];
        //header.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5f];
        header.title = [NSString stringWithFormat:@"第%li个组",indexPath.section];
        return header;
    }
    return nil;
}

// 是否可以移动
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0)

{
    return NO;
}

//  移动item的代理 怎么移动
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath NS_AVAILABLE_IOS(9_0)
{
    
}

//collection 点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了第%li组第%li列",indexPath.section,indexPath.row);
}
#pragma UICollectionViewDelegate 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
