//
//  GoodsCell.h
//  leway
//
//  Created by 朱潮 on 14-6-9.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsCellDisplay.h"
#import "RTLabel.h"
@interface GoodsCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *webSiteLabel;
@property(nonatomic,strong)RTLabel *priceLabel;
@property(nonatomic,strong)RTLabel *oldPriceLabel;
@property(nonatomic,strong)UILabel *saleAmountLabel;
@property(nonatomic,strong)UILabel *commentCountLabel;
@property(nonatomic,strong)UILabel *nameLabel;

-(void)reload:(GoodsCellDisplay *)display;
@end
