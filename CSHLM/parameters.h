//
//  parameters.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/1.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface parameters : NSObject

+(NSDictionary *)returnParameters:(NSString *)cat_id Auth_sign:(NSString *)auth_sign Page_id:(NSString *)page URLString:(NSString *)urlStr;

@end
