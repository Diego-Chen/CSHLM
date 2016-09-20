//
//  SYModel.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/30.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYModel : NSObject

/*
 {
 "advert_id" = 10301;
 "advert_pic" = "http://i.okaybuy.cn/images/multipic/new/201608/4d/4df791b686f5c23cde2070c5a4b3b5e8.jpg";
 contents = "\U65b0\U4eba\U7528\U52b5\U63a8\U8350\U6b3e";
 "event_content" =             
 {
 id = 7240;
 };
 "event_id" = 3;
 "is_click" = 1;
 "location_id" = 2;
 "page_id" = 4;
 "show_id" = 3;
 tips = "20\U5143\U65b0\U4eba\U52b5";
 },

 */


@property (nonatomic , copy)NSString * tips;
@property (nonatomic , copy)NSString * contents;
@property (nonatomic , copy)NSString * advert_pic;


@property (nonatomic , copy)NSString *id1 ;
@property (nonatomic , copy)NSString *description1;

@end
