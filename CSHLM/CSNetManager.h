//
//  CSNetManager.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/31.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"  //主要用于网络请求方法
#import "UIKit+AFNetworking.h"  //主要用于文件下载






@interface CSNetManager : NSObject


typedef void(^successblock)(CSNetManager *request);
typedef void(^failureblock)(NSError *error);


@property (nonatomic , strong)NSData *data;
@property (nonatomic , strong)NSDictionary *dictionary;

+(instancetype)manager;

-(void)GET:(NSString *)urlString Paramaters:(id)paramters Success:(successblock)succes Failure:(failureblock)failure;


-(void)POST:(NSString *)urlString Paramaters:(id)paramters Success:(successblock)succes Failure:(failureblock)failure;

@end
