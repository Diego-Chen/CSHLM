//
//  FENLEIModel.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/14.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "FENLEIModel.h"

@implementation FENLEIModel
-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    self.virtual_name = keyedValues[@"virtual_name"];
    NSArray *array = keyedValues[@"brand_category"];
    for (NSDictionary *d  in array)
    {
        FENLEITOPModel *toPmodel = [[FENLEITOPModel alloc] init];
        [toPmodel setValuesForKeysWithDictionary:d];
        
        [self.brand_category addObject:toPmodel ];
    }
    
    NSArray *arr = keyedValues[@"second"];
    for (NSDictionary *d in arr)
    {
        FENLEICOLLECTModel *collection = [[FENLEICOLLECTModel alloc] init];
        [collection setValuesForKeysWithDictionary:d];
        
        [self.second addObject:collection];
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


-(NSMutableArray *)brand_category
{
    if (!_brand_category)
    {
        _brand_category = [[NSMutableArray alloc] init];
    }
    return _brand_category;
}


-(NSMutableArray *)second
{
    if (!_second)
    {
        _second = [[NSMutableArray alloc] init];
    }
    return  _second;
}

@end
