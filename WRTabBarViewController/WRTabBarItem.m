//
//  WRTabBarItem.m
//  WRTabBarViewController
//
//  Created by xianghui on 2017/7/5.
//  Copyright © 2017年 xianghui. All rights reserved.
//

#import "WRTabBarItem.h"

@interface WRTabBarItem ()

@property (copy ,nonatomic, readwrite) NSString *className;
@property (copy ,nonatomic, readwrite) NSString *iconImageName;
@property (copy ,nonatomic, readwrite) NSString *iconSelectedImageName;
@property (copy ,nonatomic, readwrite) NSString *title;
@property (assign, nonatomic, readwrite) BOOL isRaisedItem;
@property (assign, nonatomic, readwrite) BOOL navigationBarHidden;

@end

@implementation WRTabBarItem

+ (instancetype)createItemWithClassName:(NSString *)className
                          iconImageName:(NSString *)iconImageName
                  iconSelectedImageName:(nullable NSString *)iconSelectedImageName
                                  title:(nullable NSString *)title
                           isRaisedItem:(BOOL)isRaisedItem
                    navigationBarHidden:(BOOL)navigationBarHidden {
    WRTabBarItem *tabBarItem = [[self alloc] init];
    tabBarItem.className = className;
    tabBarItem.iconImageName = iconImageName;
    tabBarItem.iconSelectedImageName = iconSelectedImageName;
    tabBarItem.title = title;
    tabBarItem.isRaisedItem = isRaisedItem;
    tabBarItem.navigationBarHidden = navigationBarHidden;
    return tabBarItem;
};

@end
