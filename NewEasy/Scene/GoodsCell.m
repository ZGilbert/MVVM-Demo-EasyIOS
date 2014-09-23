//
//  GoodsCell.m
//  leway
//
//  Created by 朱潮 on 14-6-9.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "GoodsCell.h"
#import "Easy.h"
@implementation GoodsCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = YES;
        _imageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_imageView];
        
        UIView *priceView = [[UIView alloc]initWithFrame:CGRectMake(0, _imageView.height-20, 150, 20)];
        priceView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
        [_imageView addSubview:priceView];
        
        _webSiteLabel = [[EzUILabel alloc]initWithFrame:CGRectMake(5, 0, 50, 20)];
        _webSiteLabel.font = [UIFont systemFontOfSize:12.0f];
        _webSiteLabel.textColor = [UIColor colorWithString:@"#484848"];
        _webSiteLabel.text = @"EasyIOS";
        [priceView addSubview:_webSiteLabel];
        
        _nameLabel = [[EzUILabel alloc] initWithFrame:CGRectMake(5, _imageView.bottom,_imageView.width - 10, 31.0f)];
        _nameLabel.numberOfLines = 3;//设置自动行数与字符换行
        _nameLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:12.0f];
        _nameLabel.textColor = [UIColor colorWithString:@"#484848"];
        [self addSubview:_nameLabel];
        
        _priceLabel = [[RTLabel alloc]initWithFrame:CGRectMake(5, _nameLabel.bottom, 70, 20)];
        _priceLabel.text = @"<font size=10 color='#EB3F3F'>￥</font><font size=17 color='#EB3F3F'>0</font>";
        [self addSubview:_priceLabel];
        
        _oldPriceLabel = [[RTLabel alloc]initWithFrame:CGRectMake(_imageView.width - 70, _priceLabel.top+4, 40, 15)];
        _oldPriceLabel.text = @"<font size=12>￥0</font>";
        _oldPriceLabel.textColor = [UIColor colorWithString:@"#707070"];
        [_oldPriceLabel setTextAlignment:RTTextAlignmentCenter];
        _oldPriceLabel.hidden = YES;
        [self addSubview:_oldPriceLabel];
    }
    return self;
}

-(void)reload:(GoodsCellDisplay *)display{
    [_imageView sd_setImageWithURL:display.imageUrl];
    _priceLabel.text = display.price;
    _oldPriceLabel.text = display.oldPrice;
    _oldPriceLabel.hidden = display.isOldPriceHidden;
    _nameLabel.text  = display.name;
}

@end
