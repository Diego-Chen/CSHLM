//
//  SYView.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/31.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "SYView.h"

@implementation SYView

-(void)setLeftAndRightAndImage:(SYModel *)model
{
   
    
    
    UIImageView *imageView = [[UIImageView alloc]init ];
   // imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.advert_pic] placeholderImage:nil];
    [self addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(10);
        make.right.equalTo(self.right).offset(-10);
        make.height.equalTo(166.5);
    }];
    

    

    NSString *titleString = [NSString stringWithFormat:@"%@%@%@",model.tips,@"  ",model.contents];
    
    
    UILabel *labelLeft = [[UILabel alloc]init ];
    labelLeft.textAlignment = NSTextAlignmentLeft;
    NSInteger location = [titleString rangeOfString:@"  "].location;
    

    
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:titleString ];
    
    [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [titleString length])];
    
    [attributed addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(0, location)];
    
    labelLeft.attributedText = attributed;
    
    
    
    [self addSubview:labelLeft];
    [labelLeft makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(imageView.bottom);
        make.left.equalTo(imageView.left);
        make.right.equalTo(imageView.right);
        make.bottom.equalTo(self.bottom).offset(-1);
    }];
    
    
    UILabel *lab = [[UILabel alloc]init];
    lab.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    lab.frame = CGRectMake(10, self.frame.size.height - 1 , self.frame.size.width - 20, 1);
    [self addSubview:lab];
    
    
}

@end
