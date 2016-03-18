//
//  YUCollectionViewCell.h
//  切牌布局
//
//  Created by 于世民 on 16/3/18.
//  Copyright © 2016年 yushimin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonBlock)(NSString *);

@interface YUCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) buttonBlock btnBlock;

@end
