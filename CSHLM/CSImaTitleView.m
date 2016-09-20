//
//  CSImaTitleView.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSImaTitleView.h"
#import "Header.h"
@implementation CSImaTitleView


-(UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView  = [[UIImageView alloc]init ];
        
        imageView.frame = CGRectMake( (self.frame.size.width - self.frame.size.height + 4) / 2.0, 2, self.frame.size.height - 4, self.frame.size.height - 4);
        
          [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

-(void)setImageStr:(NSString *)imageStr
{
    _imageStr = imageStr;
    
 
   
    
    self.imageView.image = [UIImage imageNamed:imageStr];
    
   
}

@end
