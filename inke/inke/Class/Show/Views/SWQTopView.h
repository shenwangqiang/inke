//
//  SWQTopView.h
//  inke
//
//  Created by 沈王强 on 2017/8/17.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TopBlock)(NSInteger tag);

@interface SWQTopView : UIView

- (instancetype) initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

- (void)scrolling:(NSInteger)tag;

@property (nonatomic, copy) TopBlock block;

@end
