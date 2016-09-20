//
//  XSTM_PAGEModel.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/12.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSTM_PAGEModel : NSObject
@property(nonatomic , copy)NSString *id1;
@property(nonatomic , copy)NSString *title;
@property(nonatomic , copy)NSString *image_index;
@property (nonatomic ,assign)NSInteger *is_image_list;
@property(nonatomic ,copy)NSString *image_list;
@property(nonatomic,copy)NSString *discount;
@property(nonatomic,copy)NSString *start_time;
@property(nonatomic ,copy)NSString *end_time;
@property(nonatomic,copy)NSString *subscribe;
@property(nonatomic,copy)NSString *is_begin;

@end
