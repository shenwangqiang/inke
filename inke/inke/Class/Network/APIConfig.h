//
//  APIConfig.h
//  inke
//
//  Created by 沈王强 on 2017/8/17.
//  Copyright © 2017年 沈王强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

// 信息服务器地址
#define SERVER_HOST @"http://open.douyucdn.cn"
// 图片服务器地址
#define IMAGE_HOST @"http://img.meelive.cn/"

//首页数据
//#define API_LiveGetTop @"api/live/gettop"
#define API_LIVEGETTOP @"/api/RoomApi/live/lol"

//广告地址
#define API_Advertise @"advertise/get"

//热门话题
#define API_TopicIndex @"api/live/topicindex"

//附近的人
#define API_NearLocation @"api/live/near_recommend"//?uid=85149891&latitude=40.090562&longitude=116.413353

//欢哥直播地址
#define Live_Dahuan @"rtmp://live.hkstv.hk.lxdns.com:1935/live/dahuan"



@end
