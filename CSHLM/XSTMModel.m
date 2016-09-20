//
//  XSTMModel.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/1.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "XSTMModel.h"

@implementation XSTMModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //未定义的key 属性进入这里
    
    //如果服务返回的字符串有系统默认不能使用的属性（例如：id ，description等可以进行转换）
    
    
    if ([key isEqualToString:@"id"]) {
        self.id1 = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.description1 = value;
    }
}


@end
