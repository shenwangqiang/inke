//
//  SWQTopView.m
//  inke
//
//  Created by 沈王强 on 2017/8/17.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import "SWQTopView.h"

@interface SWQTopView ()

@property (nonatomic, strong) UIView * lineView;

//@property (nonatomic, copy) TopBlock block;

@property (nonatomic, strong) NSMutableArray * buttons;

@end

@implementation SWQTopView

- (NSMutableArray *)buttons {
    
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


- (instancetype) initWithFrame:(CGRect)frame titleNames:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if(self){
        CGFloat btnW = self.width/titles.count;
        CGFloat btnH = self.height;
        for (NSInteger i=0; i<titles.count; i++) {
            UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            titleBtn.frame  = CGRectMake(i*btnW, 0, btnW, btnH);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            titleBtn.tag = i;
            [self.buttons addObject:titleBtn];
            [self addSubview:titleBtn];
            
            if (i == 1) {
                // 添加下划线
                // 下划线宽度 = 按钮文字宽度
                // 下划线中心点x = 按钮中心点x
                
                CGFloat h = 2;
                CGFloat y = 35 ;
                
                // 先计算文字尺寸,在给label去赋值
                [titleBtn.titleLabel sizeToFit];
                
                UIView * lineView =[[UIView alloc] init];
                // 位置和尺寸
                lineView.height = h;
                lineView.width = titleBtn.titleLabel.width;
                lineView.centerX = titleBtn.centerX;
                lineView.top = y;
                lineView.backgroundColor = [UIColor whiteColor];
                
                self.lineView = lineView;
                
                [self addSubview:self.lineView];
                
            }

        }
    }
    return self;
}

- (void)scrolling:(NSInteger)tag {
    
    UIButton * button = self.buttons[tag];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineView.centerX = button.centerX;
    }];
}

-(void) titleClick:(UIButton *) btn{
    self.block(btn.tag);
    
    [self scrolling:btn.tag];
}
@end
