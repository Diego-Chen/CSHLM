//
//  CSNetManager.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/31.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSNetManager.h"

@implementation CSNetManager






+(instancetype)manager
{
    return [[self alloc] init];
}


-(void)GET:(NSString *)urlString Paramaters:(id)paramters Success:(successblock)succes Failure:(failureblock)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *url = urlString;
    id paraId = nil;
    if (paramters)
    {
        paraId = paramters;
    }
    
    
    [manager GET:url parameters:paraId progress:^(NSProgress * _Nonnull downloadProgress)
    {
         //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
         //
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        self.data = responseObject;
        self.dictionary = dic;
        succes(self);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        failure(error);
    }];

}


-(void)POST:(NSString *)urlString Paramaters:(id)paramters Success:(successblock)succes Failure:(failureblock)failure
{
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *url = urlString;
    
    NSLog(@"%@----%@",url , paramters);
    
    
    
    [manager POST:url parameters:paramters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
    {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
      
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        
        
        self.data = responseObject;
        self.dictionary = dic;
        succes(self);
        
          
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
                    failure(error);
    }];
}
@end
