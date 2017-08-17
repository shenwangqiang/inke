//
//  SWQLiveHandler.m
//  inke
//
//  Created by 沈王强 on 2017/8/17.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import "SWQLiveHandler.h"
#import "SWQLive.h"
#import "HttpTool.h"
#import "MJExtension.h"

@implementation SWQLiveHandler


+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum
                              success:(SuccessBlock)success
                               failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_LIVEGETTOP params:nil success:^(id json) {
        
        NSInteger error = [json[@"error"] integerValue];
        if (!error) {
            
            NSArray * lives = [SWQLive mj_objectArrayWithKeyValuesArray:json[@"data"]];
            success(lives);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];
    
}

//+ (void)executeNearLiveTaskWithSuccess:(SuccessBlock)success
//                                failed:(FailedBlock)failed {
//    
//    NSDictionary * params = @{@"uid":@"85149891",
//                              @"latitude":@"40.090562",
//                              @"longitude":@"116.413353"
//                              };
//    
//    [HttpTool getWithPath:API_NearLocation params:params success:^(id json) {
//        
//        NSInteger error = [json[@"dm_error"] integerValue];
//        
//        if (!error) {
//            
//            NSArray * lives = [SWQLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
//            
//            success(lives);
//            
//        } else {
//            
//            failed(json);
//            
//        }
//    } failure:^(NSError *error) {
//        
//        failed(error);
//    }];
//}

@end
