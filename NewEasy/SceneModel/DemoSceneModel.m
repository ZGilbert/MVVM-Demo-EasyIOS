
//
//  DemoSceneModel.m
//  NewEasy
//
//  Created by 朱潮 on 14-7-22.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "DemoSceneModel.h"

@implementation DemoSceneModel

-(void)loadSceneModel{
    [super loadSceneModel];
    _goodsArray = nil;
    _goodsListRequest = [GoodsListRequest Request];
    [self.action useCache];  //开启缓存
    
    //self.goodsListRequest.page 有修改就调用SEND_NO_CACHE_ACTION加载数据
    @weakify(self);
    [[RACObserve(self.goodsListRequest,page)
      filter:^BOOL(NSNumber *newPage) {
          return [newPage integerValue] > 0;
      }]
     subscribeNext:^(NSNumber *newPage) {
         @strongify(self);
         [self SEND_NO_CACHE_ACTION:_goodsListRequest];
     }];
    
    
    [[RACObserve(self.goodsListRequest, state) //监控 网络请求的状态
     filter:^BOOL(NSNumber *state) {
         @strongify(self);
         return self.goodsListRequest.succeed;
     }]
     subscribeNext:^(NSNumber *state) {
        @strongify(self);
        [self.action saveCache]; //保存缓存到文件
        self.goodsArray = [GoodsArray objectFromDictionary:[self.goodsListRequest.output objectForKey:@"data"]]; //Model的ORM操作，dictionary to object
    }];
}

@end
