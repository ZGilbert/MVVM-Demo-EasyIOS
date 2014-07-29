//
//  DemoSceneModel.h
//  NewEasy
//
//  Created by 朱潮 on 14-7-22.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "SceneModel.h"
#import "GoodsArray.h"
#import "GoodsListRequest.h"
@interface DemoSceneModel : SceneModel
@property(nonatomic,retain)GoodsArray *goodsArray;
@property(nonatomic,retain)GoodsListRequest *goodsListRequest;
@end
