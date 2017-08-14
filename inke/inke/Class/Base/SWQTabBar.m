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

@end

@implementation SWQTabBar

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
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = SWQItemTypeLive+i;
            [self addSubview:item];
        }
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
    
}

- (void) clickItem:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]){
        [self.delegate tabbar:self clickButton:btn.tag];
    }
    //   !self.block?:self.block(self.btn.tag); // 简写
    if(self.block){
        self.block(self,btn.tag);
    }
}
@end
