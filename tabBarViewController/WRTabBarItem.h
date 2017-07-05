//
//  WRTabBarItem.h
//  WRTabBarViewController
//
//  Created by xianghui on 2017/7/5.
//  Copyright © 2017年 xianghui. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
/**
 * @brief 选项卡条目
 */
@interface WRTabBarItem : NSObject
/**
 * @brief 类名
 */
@property (copy ,nonatomic, readonly) NSString *className;
/**
 * @brief icon图片名
 */
@property (copy ,nonatomic, readonly) NSString *iconImageName;
/**
 * @brief icon选中图片名
 */
@property (copy ,nonatomic, readonly) NSString *iconSelectedImageName;
/**
 * @brief 标题
 */
@property (copy ,nonatomic, readonly) NSString *title;
/**
 * @brief 是否为凸起item
 */
@property (assign, nonatomic, readonly) BOOL isRaisedItem;
/**
 * @brief 隐藏导航条
 */
@property (assign, nonatomic, readonly) BOOL navigationBarHidden;
/**
 * @brief 初始化item
 *
 * @param className 类名 必须为UIViewController的子类
 * @param iconImageName 图片名，必备
 * @param iconSelectedImageName 选中图片名
 * @param title 标题
 * @param isRaisedItem 是否为凸起item
 * @param navigationBarHidden 是否隐藏导航条
*/
+ (instancetype)createItemWithClassName:(NSString *)className
                          iconImageName:(NSString *)iconImageName
                  iconSelectedImageName:(nullable NSString *)iconSelectedImageName
                                  title:(nullable NSString *)title
                           isRaisedItem:(BOOL)isRaisedItem
                    navigationBarHidden:(BOOL)navigationBarHidden;

@end

NS_ASSUME_NONNULL_END
