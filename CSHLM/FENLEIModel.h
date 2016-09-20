//
//  FENLEIModel.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/14.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FENLEITOPModel.h"
#import "FENLEICOLLECTModel.h"


@interface FENLEIModel : NSObject


@property (nonatomic , copy)NSString *virtual_name;
@property (nonatomic , strong)NSMutableArray  *brand_category;
@property (nonatomic , strong)NSMutableArray  *second;



@end
