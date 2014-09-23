//
//  DemoSceneModel.h
//  NewEasy
//
//  Created by 朱潮 on 14-7-22.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "SceneModel.h"
#import "GoodsListRequest.h"
#import "GoodsDisplay.h"
@interface DemoSceneModel : SceneModel

@property(nonatomic,retain)GoodsDisplay *goodsDisplay; //提供给view访问的展示数据层
@property(nonatomic,retain)GoodsListRequest *goodsListRequest;
@end
