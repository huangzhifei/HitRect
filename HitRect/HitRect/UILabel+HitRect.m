//
//  UILabel+HitRect.m
//  HitRect
//
//  Created by eric on 2017/10/28.
//  Copyright © 2017年 huangzhifei. All rights reserved.
//

#import "UILabel+HitRect.h"
#import <objc/runtime.h>

static const char *hit_kHitEdgeInsets = "hitEdgeInsets";
static const char *hit_kHitScale = "hitScale";
static const char *hit_kHitWidthScale = "hitWidthScale";
static const char *hit_kHitHeightScale = "hitHeightScale";

@implementation UILabel (HitRect)

#pragma mark - setter

- (void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets {
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, hit_kHitEdgeInsets, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHitScale:(CGFloat)hitScale {
    CGFloat width = self.bounds.size.width * hitScale;
    CGFloat height = self.bounds.size.height * hitScale;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width, -height, -width);
    objc_setAssociatedObject(self, hit_kHitScale, @(hitScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHitWidthScale:(CGFloat)hitWidthScale {
    CGFloat width = self.bounds.size.width * hitWidthScale;
    CGFloat height = self.bounds.size.height;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width, -height, -width);
    objc_setAssociatedObject(self, hit_kHitWidthScale, @(hitWidthScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHitHeightScale:(CGFloat)hitHeightScale {
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height * hitHeightScale;
    self.hitEdgeInsets = UIEdgeInsetsMake(-height, -width, -height, -width);
    objc_setAssociatedObject(self, hit_kHitHeightScale, @(hitHeightScale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - getter

- (UIEdgeInsets)hitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, hit_kHitEdgeInsets);
    UIEdgeInsets edgeInsets;
    [value getValue:&edgeInsets];
    return value ? edgeInsets : UIEdgeInsetsZero;
}

- (CGFloat)hitScale {
    return [objc_getAssociatedObject(self, hit_kHitScale) floatValue];
}

- (CGFloat)hitWidthScale {
    return [objc_getAssociatedObject(self, hit_kHitWidthScale) floatValue];
}

- (CGFloat)hitHeightScale {
    return [objc_getAssociatedObject(self, hit_kHitHeightScale) floatValue];
}

#pragma mark - override super method

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //如果 label 边界值无变化、失效、隐藏、或者透明直接返回
    if (UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden || self.alpha == 0) {
        return [super pointInside:point withEvent:event];
    } else {
        CGRect relativeFrame = self.bounds;
        CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets);
        return CGRectContainsPoint(hitFrame, point);
    }
}

@end
