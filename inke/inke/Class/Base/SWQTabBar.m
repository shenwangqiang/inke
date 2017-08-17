//
//  SWQTabBar.m
//
//
//  Created by 沈王强 on 2017/8/14.
//
//

#import "SWQTabBar.h"

@interface SWQTabBar ()

@property (nonatomic,strong) UIImageView * tabbgView;

@property (nonatomic,strong) NSArray * datalist;

@property (nonatomic,strong) UIButton * lastBtn;

@property (nonatomic,strong) UIButton * cameraBtn;

@end

@implementation SWQTabBar
- (UIButton *)cameraBtn{
    if(!_cameraBtn){
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        _cameraBtn.tag =SWQItemTypeLaunch;
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}
//
//- (UIButton *)cameraBtn {
//    
//    if (!_cameraBtn) {
//        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
//        [_cameraBtn sizeToFit];
//        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
//        _cameraBtn.tag =SWQItemTypeLaunch;
//    }
//    return _cameraBtn;
//}

- (NSArray *) datalist{
    if(!_datalist){
        _datalist = @[@"tab_live",@"tab_me"];
    }
    return _datalist;
}

- (UIImageView *)tabbgView{
    if(!_tabbgView){
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 装载背景
        [self addSubview:self.tabbgView];
        // 装载item
        for (NSInteger i=0; i<self.datalist.count; i++) {
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom] ;
            
            // 不让图片在高亮下改变
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = SWQItemTypeLive+i;
            
            if(i==0){
                item.selected = YES;
                self.lastBtn = item;
            }
            [self addSubview:item];
        }
        
        // 添加直播按钮
        [self addSubview:self.cameraBtn];
    }
    return self;
}

-(void) layoutSubviews{
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width/self.datalist.count;
    
    for (NSInteger i=0; i< [self subviews].count; i++) {
        UIView* btn = [self subviews][i];
        if([btn isKindOfClass:[UIButton class]]){
            btn.frame = CGRectMake((btn.tag-SWQItemTypeLive)*width, 0, width, self.frame.size.height);
        }
    }
    
    [_cameraBtn sizeToFit];
    self.cameraBtn.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2-25);
}

- (void) clickItem:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]){
        [self.delegate tabbar:self clickButton:btn.tag];
    }
    //   !self.block?:self.block(self.btn.tag); // 简写
    if(self.block){
        self.block(self,btn.tag);
    }
    
    if(btn.tag == SWQItemTypeLaunch){
        return;
    }
    
    self.lastBtn.selected = NO;
    self.lastBtn = btn;
    btn.selected = YES;
    
    // 设置动画
    [UIView animateWithDuration:0.2 animations:^{
        // 将btn扩大1.2倍
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            // 恢复原始状态
            btn.transform = CGAffineTransformIdentity;
            
        }];
    }];
}
@end
