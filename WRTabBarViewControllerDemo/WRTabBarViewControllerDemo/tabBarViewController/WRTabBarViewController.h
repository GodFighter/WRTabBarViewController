//
//  WRTabBarViewController.h
//  WRTabBarViewController
//
//  Created by xianghui on 2017/7/4.
//  Copyright © 2017年 xianghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRTabBarItem.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * 选项卡视图控制器
 */
@interface WRTabBarViewController : UITabBarController
/**
 * @brief 自定义tabBar高度
 */
@property (assign, nonatomic) CGFloat tabBarHeight;
/**
 * @brief 正常颜色
 */
@property (strong, nonatomic) UIColor *normalTitleColor;
/**
 * @brief 选中颜色
 */
@property (strong, nonatomic) UIColor *selectedTitleColor;
/**
 * @brief 标题字体
 */
@property (strong, nonatomic) UIFont *titleFont;
/**
 * @brief 初始化
 *
 * @param itemsArray 条目数组
 */
- (instancetype)initWithItems:(NSArray <WRTabBarItem *> *)itemsArray;
/** 更新items */
- (void)updateItems:(NSArray <WRTabBarItem *> *)itemsArray;

@end

NS_ASSUME_NONNULL_END
