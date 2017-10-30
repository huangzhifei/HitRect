//
//  UIImageView+HitRect.h
//  HitRect
//
//  Created by eric on 2017/10/28.
//  Copyright © 2017年 huangzhifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HitRect)

/**
 自定义响应边界 UIEdgeInsetsMake(-3, -4, -5, -6). 表示扩大
 */
@property (nonatomic, assign) UIEdgeInsets hitEdgeInsets;

/**
 自定义响应边界 自定义的边界的范围 范围扩大3.0
 */
@property (nonatomic, assign) CGFloat hitScale;

/*
 自定义响应边界 自定义的宽度的范围 范围扩大3.0
 */
@property (nonatomic, assign) CGFloat hitWidthScale;

/*
 自定义响应边界 自定义的高度的范围 范围扩大3.0
 */
@property(nonatomic, assign) CGFloat hitHeightScale;

@end
