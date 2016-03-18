//
//  ViewController.m
//  切牌布局
//
//  Created by 于世民 on 15/12/9.
//  Copyright © 2015年 yushimin. All rights reserved.
//

#import "ViewController.h"
#import "YUCutUPLayout.h"
#import "YUCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NSArray *tempArray;

@end

static NSString * ID = @"yu";
@implementation ViewController

- (NSArray *)tempArray{
    if (_tempArray == nil) {
        _tempArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    }
    return _tempArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    YUCutUPLayout * cutLayout = [[YUCutUPLayout alloc]init];
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) collectionViewLayout:cutLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
   [collectionView registerClass:[YUCollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    collectionView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_01"]];
}

//实现一个item 一个item的滑动
- (CGPoint)nearestTargetOffsetForOffset:(CGPoint)offset
{
    CGFloat pageSize = [UIScreen mainScreen].bounds.size.width/3;
    NSInteger page = roundf(offset.x / pageSize);
    CGFloat targetX = pageSize * page;
    return CGPointMake(targetX, offset.y);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGPoint targetOffset = [self nearestTargetOffsetForOffset:*targetContentOffset];
    targetContentOffset->x = targetOffset.x;
    targetContentOffset->y = targetOffset.y;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.tempArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YUCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.title = self.tempArray[indexPath.item];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
