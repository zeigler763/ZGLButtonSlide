//
//  YUCollectionViewCell.m
//  切牌布局
//
//  Created by 于世民 on 16/3/18.
//  Copyright © 2016年 yushimin. All rights reserved.
//

#import "YUCollectionViewCell.h"

@interface YUCollectionViewCell ()

@property (nonatomic,strong) UIButton *textBtn;

@end

@implementation YUCollectionViewCell

- (UIButton *)textBtn{
    if (_textBtn == nil) {
        _textBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        _textBtn.layer.cornerRadius = 40;
        _textBtn.backgroundColor = [UIColor yellowColor];
        [_textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_textBtn addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _textBtn;
}

- (void)sendMessage:(UIButton *)textBtn{
    if (self.btnBlock) {
        self.btnBlock(textBtn.titleLabel.text);
    }
}

- (void)setTitle:(NSString *)title{
    _title = title;
    [self.textBtn setTitle:title forState:UIControlStateNormal];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.textBtn.center = self.contentView.center;
    [self.contentView addSubview:self.textBtn];
}
@end
