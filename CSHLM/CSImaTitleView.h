//
//  CSImaTitleView.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSImaTitleView : UIView

@property (nonatomic , copy)NSString *titleStr;
@property (nonatomic , copy)NSString *imageStr;
@property (nonatomic , assign)int index;
@property (nonatomic , weak)UIImageView *imageView;

@end
