//
//  WRTabBar.m
//  WRTabBarViewController
//
//  Created by xianghui on 2017/7/4.
//  Copyright © 2017年 xianghui. All rights reserved.
//

#import "WRTabBar.h"

@interface WRTabBar ()

@property (weak, nonatomic) UIButton *raisedButton; // 凸起按钮
@property (strong, nonatomic) NSArray *itemsArray;

@end

@implementation WRTabBar

- (instancetype)initWithItems:(NSArray <WRTabBarItem *> *)itemsArray {
    if (self = [super init]) {
        _itemsArray = itemsArray;
        self.backgroundColor = [UIColor colorWithRed:((float)((0xf5f5f5 & 0xFF0000) >> 16))/255.0 green:((float)((0xf5f5f5 & 0xFF00) >> 8))/255.0 blue:((float)(0xf5f5f5 & 0xFF))/255.0 alpha:1.0];
        
        self.layer.borderWidth = .5;
        self.layer.borderColor = [UIColor colorWithRed:((float)((0xb4b4b4 & 0xFF0000) >> 16))/255.0 green:((float)((0xb4b4b4 & 0xFF00) >> 8))/255.0 blue:((float)(0xb4b4b4 & 0xFF))/255.0 alpha:1.0].CGColor;
        
        NSInteger i = 0;
        for (WRTabBarItem *item in itemsArray) {
            if (item.isRaisedItem == YES) {
                i++;
                NSAssert(i <= 1, @"最多只能有一个凸起item");
                
                UIButton *raisedButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [raisedButton setBackgroundImage:[UIImage imageNamed:item.iconImageName] forState:UIControlStateNormal];
                [raisedButton setBackgroundImage:[UIImage imageNamed:item.iconSelectedImageName != nil ? item.iconSelectedImageName : item.iconImageName] forState:UIControlStateHighlighted];
                [raisedButton addTarget:self action:@selector(plusButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:raisedButton];
                self.raisedButton = raisedButton;
            }
        }
    }
    return self;
}
- (void)layoutSubviews  {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width / self.itemsArray.count;
    int btnIndex = 0;
    
    for (UIView *button in self.subviews) {
        if ([button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGFloat x = width * btnIndex;
            if (self.raisedButton != nil && btnIndex == self.itemsArray.count / 2) {
                button.hidden = YES;
            }
            btnIndex++;
            button.frame = CGRectMake(x, button.frame.origin.y, width, button.frame.size.height);
        } else if ([button isEqual:self.raisedButton]) {
            self.raisedButton.frame = CGRectMake((self.frame.size.width - self.raisedButton.currentBackgroundImage.size.width) / 2,
                                                 self.frame.size.height - self.raisedButton.currentBackgroundImage.size.height,
                                                 self.raisedButton.currentBackgroundImage.size.width,
                                                 self.raisedButton.currentBackgroundImage.size.height);
        } else {
            button.hidden = YES;
        }
    }
}
#pragma mark - private
- (void)plusButtonDidClick {
    if ([self.delegate respondsToSelector:@selector(tabBarPlusButtonnClick:)]) {
        [self.customDelegate tabBarPlusButtonnClick:self];
    }
}
//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newPoint = [self convertPoint:point toView:self.raisedButton];
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.raisedButton pointInside:newPoint withEvent:event]) {
            return self.raisedButton;
        } else {
            //如果点不在发布按钮身上，直接让系统处理就可以了
            return [super hitTest:point withEvent:event];
        }
    } else {
        //tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}

@end

