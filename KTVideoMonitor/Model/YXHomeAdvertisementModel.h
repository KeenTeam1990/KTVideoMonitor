//
//  YXHomeAdvertisementModel.h
//  Tribe
//
//  Created by kt on 17/4/21.
//  Copyright © 2017年 keenteam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXHomeAdvertisementModel : NSObject

@property(nonatomic, copy)NSString* advertisementImg;//图片

/**
 *广告轮播器id
 */
@property(nonatomic, copy)NSString* advertisementType;

/**
 *时间
 */
@property(nonatomic, copy)NSString* carouselTime;

/**
 *路径
 */
@property (nonatomic, copy)NSString* advertisementLink;

/**
 *名
 */
@property (nonatomic, copy)NSString* advertisementNm;

@end
