//
//  SWQTabBarController.m
//  inke
//
//  Created by 沈王强 on 2017/8/14.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import "SWQTabBarController.h"
#import "SWQTabBar.h"
#import "SWQBaseNavigationController.h"
#import "SWQLaunchViewController.h"

@interface SWQTabBarController ()<SWQTabBarDelegate>

@property (nonatomic,strong) SWQTabBar * swqTabBar;

@end

@implementation SWQTabBarController

-(SWQTabBar *)swqTabBar{
    if(!_swqTabBar){
        _swqTabBar = [[SWQTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _swqTabBar.delegate  = self;
    }
    return _swqTabBar;
}

- (void) tabbar:(SWQTabBar *)tabbar clickButton:(NSUInteger)idx{
    
    if(idx == SWQItemTypeLaunch){
        [self presentViewController:[[SWQLaunchViewController alloc] init] animated:YES completion:nil];
    } else {
        self.selectedIndex = idx-SWQItemTypeLive;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 加载控制器
    [self configViewControllers];
    // 加载tabbar
    
    [self.tabBar addSubview:self.swqTabBar];
    
    // 删除tabbar的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
}

- (void) configViewControllers{
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"SWQMainViewController",@"SWQMeViewController"]];
    for (int i=0; i<array.count; i++) {
        NSString * vcName = array[i];
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        
        SWQBaseNavigationController * nav = [[SWQBaseNavigationController alloc]initWithRootViewController:vc];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
