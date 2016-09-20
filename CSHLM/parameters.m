//
//  parameters.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/1.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "parameters.h"

@implementation parameters

+(NSDictionary *)returnParameters:(NSString *)cat_id Auth_sign:(NSString *)auth_sign Page_id:(NSString *)page URLString:(NSString *)urlStr
{
    
    NSDictionary *mdic = nil;
 

    
    if ([urlStr rangeOfString:@"outletsTabList?"].length > 0)
    {
        //限时特卖滚动栏数据
  
        
       mdic  = [ NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1034],@"app_id",
                              auth_sign,@"auth_sign",
                              
                              @"iPhone 6 Plus (A1522/A1524)",@"device_model",
                              @"414*736",@"device_resolution",
                              @"ios",@"os",
                              
                              @"F337F588-CE68-4787-9C56-AA7F8481958A",@"session_id",
                              [NSNumber numberWithInt:6],@"site_mask",
                              @"4.5.2",@"version",
                              nil];
        
    }else if([urlStr rangeOfString:@"outlets/list/3/10/1"].length > 0)
    {
        NSLog(@"cat_id=%@",cat_id);
        mdic  = [ NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1034],@"app_id",
                 auth_sign,@"auth_sign",
                 cat_id,@"cat_id",
                 @"iPhone 6 Plus (A1522/A1524)",@"device_model",
                 @"414*736",@"device_resolution",
                 @"ios",@"os",
                 
                 @"F337F588-CE68-4787-9C56-AA7F8481958A",@"session_id",
                 [NSNumber numberWithInt:6],@"site_mask",
                 @"4.5.2",@"version",
                 nil];
      

 
    }
   
    
    
  
    
    
    return mdic;
}


@end
