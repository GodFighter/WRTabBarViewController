//
//  WRTabBar.h
//  WRTabBarViewController
//
//  Created by xianghui on 2017/7/4.
//  Copyright © 2017年 xianghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRTabBarItem.h"

@class WRTabBar;
/**
 * @brief WRTabBarDelegate委托
 */
@protocol WRTabBarDelegate <NSObject>

@optional
/**
 * @brief 添加按钮的点击委托方法
 *
 * @param tabBar 选项卡控件
 */
- (void)tabBarPlusButtonnClick:(WRTabBar *)tabBar;

@end
/**
 * @brief WRTabBar 自定义TabBar控件
 */
@interface WRTabBar : UITabBar
/**
 * @brief 自定义委托
 */
@property (nonatomic, weak) id<WRTabBarDelegate> customDelegate;
/**
 * @brief 初始化
 *
 * @param itemsArray 条目数组
 */
- (instancetype)initWithItems:(NSArray <WRTabBarItem *> *)itemsArray;

@end
