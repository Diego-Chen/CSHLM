//
//  CSTabbarView.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

typedef void(^returnCurrentViewControllerIndex)(int index);
@interface CSTabbarView : UIView

/**
 *  返回tabbar实例
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */

@property (nonatomic ,assign)int index;


+(instancetype)returnCSTabbarViewInstall:(CGRect)frame;


-(void)generateTheView:(NSArray *)titles Images:(NSArray *)imageNames SelectImageNames:(NSArray *)selectImageNames;

/**
 *  底栏按钮的点击回调
 *
 *  @param index <#index description#>
 */
-(void)setReturnIndexCurrentController:(returnCurrentViewControllerIndex)block;


@end
