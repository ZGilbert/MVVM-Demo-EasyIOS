//
//  GoodsCellDisplay.m
//  NewEasy
//
//  Created by zhuchao on 14-9-23.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "GoodsCellDisplay.h"

@implementation GoodsCellDisplay
-(instancetype)init{
    self =  [super init];
    if(self){
        _isOldPriceHidden = YES;
        _imageUrl = nil;
        _price = @"0";
        _oldPrice = @"0";
        _name = @"";
    }
    return self;
}

-(id)loadModel:(GoodsEntity *)model{
    _imageUrl = [NSURL URLWithString:model.image.img];
    _price = [NSString stringWithFormat:@"<font size=10 color='#EB3F3F'>￥</font><font size=17 color='#EB3F3F'>%@</font>",model.price];
    if(model.priceOriginal !=nil && [model.priceOriginal floatValue] !=0){
        _oldPrice = [NSString stringWithFormat:@"<font size=12 >￥%@</font>",model.priceOriginal];
        _isOldPriceHidden = NO;
    }
    _name  = model.name;
    return self;
}
@end
