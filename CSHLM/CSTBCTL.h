//
//  CSTBCTL.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSTabbarView.h"
#import "Header.h"

@interface CSTBCTL : UIViewController


/**
 *  底栏视图
 */
@property (nonatomic ,weak)CSTabbarView *tabbarView;

/**
 *  底栏显示隐藏
 *
 *  @param hidden   是否隐藏
 *  @param animated 是否带有动画
 */
-(void)setHidden:(BOOL)hidden animated:(BOOL)animated;


/**
 *  控制器数组
 */
@property (nonatomic ,strong)NSArray *controllers;
@end
