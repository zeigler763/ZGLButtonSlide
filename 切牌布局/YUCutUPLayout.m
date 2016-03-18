//
//  YUCutUPLayout.m
//  切牌布局
//
//  Created by 于世民 on 15/12/9.
//  Copyright © 2015年 yushimin. All rights reserved.
//

#define ACTIVE_DISTANCE 100
#define ZOOM_FACTOR 0.5

#import "YUCutUPLayout.h"

@interface YUCutUPLayout ()

@end

@implementation YUCutUPLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}

- (void)prepareLayout{
    [super prepareLayout];
    
    self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3,200);
    
    self.minimumLineSpacing = 0;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    
    visibleRect.origin = self.collectionView.contentOffset;
    
    visibleRect.size = self.collectionView.frame.size;
    
    for (UICollectionViewLayoutAttributes * attribute in attributes) {
        
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            
            CGFloat distance = CGRectGetMidX(visibleRect) - attribute.center.x;
            
            if (ABS(distance) < ACTIVE_DISTANCE) {
                
                CGFloat zoom = ZOOM_FACTOR * (1 - ABS(distance/ACTIVE_DISTANCE)) + 1;
                
                attribute.transform3D = CATransform3DMakeScale(zoom, zoom, 1);
                
                attribute.zIndex = 1;
            }
        }
    }
    
    return attributes;
}



@end
