//
//  CSScrollNav.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/31.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSTMModel.h"
@class CSScrollNav;

@protocol NavDelegate <NSObject>

-(void)trafficIndex:(int)index;

@end


@interface CSScrollNav : UIView<UIScrollViewDelegate>




@property (nonatomic , strong)NSArray *titleArray;

@property (nonatomic , assign)id<NavDelegate>delegate;

@end
