//
//  SWQTabBar.h
//  
//
//  Created by 沈王强 on 2017/8/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SWQItemType){
    SWQItemTypeLive = 100,//展示直播
    SWQItemTypeMe = 101,//我的
    SWQItemTypeIndex,
    SWQItemTypeLaunch
    
};

@class SWQTabBar;
typedef void(^TabBlock)(SWQTabBar * tabbar,SWQItemType idx);

@protocol SWQTabBarDelegate <NSObject>

- (void) tabbar:(SWQTabBar *)tabbar clickButton:(NSUInteger) idx;

@end

@interface SWQTabBar : UIView
@property (nonatomic,weak) id<SWQTabBarDelegate> delegate;

@property (nonatomic,copy) TabBlock block;
@end
