//
//  GoodsArray.h
//  NewEasy
//
//  Created by 朱潮 on 14-7-22.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "Model.h"
#import "GoodsEntity.h"

@protocol GoodsEntity <NSObject>

@end

@interface GoodsArray : Model
@property(nonatomic,retain)NSArray<GoodsEntity> *goodsList;
@property(nonatomic,retain)NSNumber *total;

@end
