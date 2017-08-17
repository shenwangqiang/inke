//
//  SWQMainViewController.m
//  inke
//
//  Created by 沈王强 on 2017/8/14.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import "SWQMainViewController.h"

@interface SWQMainViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic,strong) NSArray * datalist;
@end

@implementation SWQMainViewController

- (NSArray *) datalist{
    if(!_datalist){
        _datalist = @[@"关注",@"热门",@"附近"];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
}

- (void) initUI{
    // 添加左右按钮
    [self setupNav];
    // 添加自视图控制器
    [self setupChildViewControllers];
    
}

- (void) setupNav{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)setupChildViewControllers {
    
    NSArray * vcNames = @[@"SWQFocuseViewController",@"SWQHotViewController",@"SWQNearViewController"];
    
    for (NSInteger i = 0 ; i < vcNames.count; i ++) {
        
        UIViewController * liveVC = [[NSClassFromString(vcNames[i]) alloc] init];
        liveVC.title = self.datalist[i];
        // 当执行这句话addChildViewController时，不会执行viewdidload
        [self addChildViewController:liveVC];
    }
    // 将子控制器的view，加到MainVc的scrollview
    
    // 设置scrollview的content
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.datalist.count, 0);
    
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    // 进入主控制器加载第一个页面
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 减速结束时调用加载子控制器view的方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    //contentScrollView的width
    CGFloat width = SCREEN_WIDTH;
    
    CGFloat height = SCREEN_HEIGHT;
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //获取索引
    NSInteger index = offsetX / width;
    
    //标题线
//    [self.topView scrolling:index];
    
    UIViewController * childVC = self.childViewControllers[index];
    
    //判断视图控制器是否加载过
    if ([childVC isViewLoaded]) return;
    
    // 设置字控制器view的大小
    childVC.view.frame = CGRectMake(offsetX, 0, scrollView.frame.size.width, height);
    //
    [scrollView addSubview:childVC.view];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}

//- (SXTMainTopView *)topView {
//    
//    if (!_topView) {
//        
//        _topView = [[SXTMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 40) titles:self.titleNames tapView:^(NSInteger tag) {
//            
//            CGPoint point = CGPointMake(tag * SCREEN_WIDTH ,self.contentScrollView.contentOffset.y);
//            
//            [self.contentScrollView setContentOffset:point animated:YES];
//            
//        }];
//    }
//    return _topView;
//}



@end
