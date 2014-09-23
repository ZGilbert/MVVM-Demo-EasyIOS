//
//  GoodsDisplay.h
//  NewEasy
//
//  Created by zhuchao on 14-9-23.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsCellDisplay.h"
#import "GoodsArray.h"
@interface GoodsDisplay : NSObject
@property(nonatomic,retain)NSMutableArray *list;
@property(nonatomic,retain)NSNumber *total;
-(id)loadModel:(GoodsArray *)model;
@end
