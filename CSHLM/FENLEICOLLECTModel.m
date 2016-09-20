//
//  FENLEICOLLECTModel.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/14.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "FENLEICOLLECTModel.h"

@implementation FENLEICOLLECTModel


-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    self.virtual_name = keyedValues[@"virtual_name"];
    NSArray *array = keyedValues[@"third"];
    for (NSDictionary *d  in array)
    {
        FENLEIELASTModel *model = [[FENLEIELASTModel alloc] init ];
        [model setValuesForKeysWithDictionary:d];
        
        [self.third addObject:model];
        
        
    }
    
  
    
    
    
    
    
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //未定义的key 属性进入这里
    
    //如果服务返回的字符串有系统默认不能使用的属性（例如：id ，description等可以进行转换）
    
    
    if ([key isEqualToString:@"id"])
    {
        
    }
    
}

-(NSMutableArray *)third
{
    if (!_third)
    {
        _third = [[NSMutableArray alloc] init];
    }
    return  _third;
}


@end
