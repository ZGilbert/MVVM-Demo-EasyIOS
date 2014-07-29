//
//  GoodsArray.m
//  NewEasy
//
//  Created by 朱潮 on 14-7-22.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "GoodsArray.h"
#import "GoodsEntity.h"
@implementation GoodsArray

+ (Class)goodsList_class {
    return [GoodsEntity class];
}
@end
