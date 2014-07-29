//
//  GoodsListRequest.h
//  NewEasy
//
//  Created by 朱潮 on 14-7-24.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "Request.h"
@interface GoodsListRequest : Request
@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) NSNumber *page;
@property(nonatomic,retain) NSNumber *pageSize;
@property(nonatomic,retain) NSString *categoryId;
@property(nonatomic,retain) NSString *areaName;
@end
