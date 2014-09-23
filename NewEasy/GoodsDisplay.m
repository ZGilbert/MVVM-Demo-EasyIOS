//
//  GoodsDisplay.m
//  NewEasy
//
//  Created by zhuchao on 14-9-23.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "GoodsDisplay.h"

@implementation GoodsDisplay

-(instancetype)init{
    self =  [super init];
    if(self){
        _list = [NSMutableArray array];
        _total = @0;
    }
    return self;
}

//基于model生成展示数据
-(id)loadModel:(GoodsArray *)model{
    _total = model.total;
    for (GoodsEntity *entity in model.goodsList) {
        GoodsCellDisplay *cellDisplay = [[[GoodsCellDisplay alloc]init] loadModel:entity];
        [_list addObject:cellDisplay];
    }
    return self;
}
@end
