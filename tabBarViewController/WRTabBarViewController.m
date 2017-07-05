//
//  WRTabBarViewController.m
//  WRTabBarViewController
//
//  Created by xianghui on 2017/7/4.
//  Copyright © 2017年 xianghui. All rights reserved.
//

#import "WRTabBar.h"
#import "WRTabBarViewController.h"

@interface WRTabBarViewController () <WRTabBarDelegate>

@property (strong, nonatomic) NSArray <WRTabBarItem *> *itemsArray; // 条目数组

@end

@implementation WRTabBarViewController

- (instancetype)initWithItems:(NSArray <WRTabBarItem *> *)itemsArray {
    // tabbarviewcontroller 会在[super init]时调用view 的load方法，导致先走viewDidLoad方法。
    if (self = [super init]) {
        self.itemsArray = itemsArray;
        
        _normalTitleColor = [UIColor colorWithWhite:0.7 alpha:1];
        _titleFont = [UIFont systemFontOfSize:12];
        _selectedTitleColor = [UIColor blueColor];

        [self setupTitleTextAttributes];
        [self setupChildControllers];

        WRTabBar *tabbar = [[WRTabBar alloc] initWithItems:itemsArray];
        tabbar.customDelegate = self;
        //kvc实质是修改了系统的_tabBar
        [self setValue:tabbar forKeyPath:@"tabBar"];
        
        self.tabBarHeight = self.tabBar.frame.size.height;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillLayoutSubviews{
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = self.tabBarHeight;
    tabFrame.origin.y = self.view.frame.size.height - self.tabBarHeight;
    self.tabBar.frame = tabFrame;
}
#pragma mark - private
- (void)setupTitleTextAttributes {
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self.class]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = self.normalTitleColor;
    dictNormal[NSFontAttributeName] = self.titleFont;
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = self.selectedTitleColor;
    dictSelected[NSFontAttributeName] = self.titleFont;
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
}
- (void)setupChildControllers {
    for (NSInteger i = 0; i < self.itemsArray.count; i++) {
        WRTabBarItem *item = self.itemsArray[i];
        UIViewController *childViewController = [self childViewControllerWithItem:item];
       
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childViewController];
        nav.view.backgroundColor = [UIColor blueColor];

        if (item.iconImageName != nil) {
            UIImage *image = [UIImage imageNamed:item.iconImageName];
            // 始终绘制图片原始状态，不使用Tint Color
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            childViewController.tabBarItem.image = image;
        }
        if (item.iconSelectedImageName != nil) {
            UIImage *selectedImage = [UIImage imageNamed:item.iconSelectedImageName];
            selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            childViewController.tabBarItem.selectedImage = selectedImage;

        }
        if (item.title != nil) {
            childViewController.tabBarItem.title = item.title;
            childViewController.navigationItem.title = item.title;
        }
        childViewController.navigationController.navigationBarHidden = item.navigationBarHidden;
        [self addChildViewController:nav];
    }
}
- (UIViewController *)childViewControllerWithItem:(WRTabBarItem *)item {
    Class class = NSClassFromString(item.className);
    id object = [[class alloc] init];
    NSAssert([object isKindOfClass:[UIViewController class]], @"必须传入UIViewController的子类");
    UIViewController *viewController = object;
    return viewController;
}
#pragma mark - config
- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    _normalTitleColor = normalTitleColor;
    [self setupTitleTextAttributes];
}
- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    _selectedTitleColor = selectedTitleColor;
    [self setupTitleTextAttributes];
}
- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    [self setupTitleTextAttributes];
}
@end
