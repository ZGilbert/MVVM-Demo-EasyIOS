//
//  GoodsCellDisplay.h
//  NewEasy
//
//  Created by zhuchao on 14-9-23.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsEntity.h"
@interface GoodsCellDisplay : NSObject
@property(nonatomic,retain)NSURL *imageUrl;
@property(nonatomic,retain)NSString *price;
@property(nonatomic,retain)NSString *oldPrice;
@property(nonatomic,assign)BOOL isOldPriceHidden;
@property(nonatomic,retain)NSString *name;
-(id)loadModel:(GoodsEntity *)model;
@end
