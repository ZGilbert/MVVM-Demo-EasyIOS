//
//  GoodsListRequest.m
//  NewEasy
//
//  Created by 朱潮 on 14-7-24.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "GoodsListRequest.h"

@implementation GoodsListRequest

/**
 *  初始化 GoodsListRequest 的参数
 */
-(void)loadRequest{
    [super loadRequest];
    self.SCHEME = @"http";
    self.HOST = @"test-leway.zjseek.com.cn:8000"; //不设置host 就采用宏定义的全局host
    self.PATH = @"/api/goods/goodsList";
    self.type = @"1";
    self.categoryId = @"-1";
    self.areaName = @"浙江";
    self.pageSize = @10;
}

@end

