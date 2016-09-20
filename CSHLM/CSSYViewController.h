//
//  CSSYViewController.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"
#import "SYModel.h"
#import "SYView.h"

@interface CSSYViewController : UIViewController<UIScrollViewDelegate>
{
    UIImageView *_leftImageView ;
    UIImageView *_rightImageView;
    UIImageView *_centerImageView;
    NSInteger _currentImageIndex;
    UIPageControl *_pageControl ;
    NSTimer *_timer;
    UIView * _toTopVC;
    UIView * _fenToTop;
    UIButton *_buttonToTop;
    
    UILabel *_toTopLabel;
}
/**
 *  轮播图片
 */
@property (nonatomic , strong)NSMutableArray *imagesArray;

@property (nonatomic , weak)UIScrollView *scrollView;
@property (nonatomic , weak)UIScrollView *LBScrollView;
@property (nonatomic , strong)NSMutableArray *dataArray;

@property (nonatomic ,strong)UITextField *textField;
@end
