//
//  
//  AutomaticCoder
//
//  Created by 张玺自动代码生成器   http://zhangxi.me
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//


#import "WebSiteEntity.h"
#import "ImageEntity.h"

@interface GoodsEntity : Model<NSCoding>

@property (nonatomic,strong) NSString *goodsDesc;
@property (nonatomic,strong) NSString *areaId;
@property (nonatomic,strong) WebSiteEntity *webSite;
@property (nonatomic,strong) NSNumber *saleAmount;
@property (nonatomic,strong) NSString *link;
@property (nonatomic,strong) NSNumber *goodsRecommend;
@property (nonatomic,strong) NSNumber *priceOriginal;
@property (nonatomic,strong) NSNumber *price;
@property (nonatomic,strong) NSString *summary;
@property (nonatomic,strong) ImageEntity *image;
@property (nonatomic,strong) NSNumber *commentCount;
@property (nonatomic,strong) NSString *goodsId;
@property (nonatomic,strong) NSString *name;

@end
