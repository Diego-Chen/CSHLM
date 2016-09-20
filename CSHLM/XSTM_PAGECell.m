//
//  XSTM_PAGECell.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/12.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "XSTM_PAGECell.h"

@implementation XSTM_PAGECell

-(void)setModic:(XSTM_PAGEModel *)modic
{
    _modic = modic;
    
    
    
    
    self.backgroundColor = [UIColor clearColor];
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(10);
        make.right.equalTo(self.right).offset(-10);
        make.bottom.equalTo(self.bottom);
    }];
    
    
 
    
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_modic.image_index] placeholderImage:nil];
    [view addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.top).offset(5);
        make.left.equalTo(view.left).offset(5);
        make.right.equalTo(view.right).offset(-5);
        make.bottom.equalTo(view.bottom).offset(-30);
    }];
    
    UILabel *label = [UILabel new];
    

    label.textAlignment = NSTextAlignmentLeft;
    NSString *titleString = [NSString stringWithFormat:@"%@  %@",modic.discount,modic.title];
    NSInteger location = [titleString rangeOfString:@"  "].location;
    
    
    
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:titleString ];
    
    [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [titleString length])];
    
    [attributed addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, location)];
    
    label.attributedText = attributed;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.bottom).offset(4);
        make.bottom.equalTo(self.bottom).offset(-4);
        make.left.equalTo(imageView.left);
        make.width.equalTo(WIDTH/3.0 * 2.0);
    }];
    
    
    UILabel *label1 = [UILabel new];
    label1.textAlignment = NSTextAlignmentRight;
    label1.text = [NSString stringWithFormat:@"%@-%@",[self returnTimeString:modic.start_time] , [self returnTimeString:modic.end_time]];
   
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor colorWithRed:176%255/255.0 green:224%255/255.0 blue:230%255/255.0 alpha:1.0];
    [view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.bottom).offset(4);
        make.bottom.equalTo(self.bottom).offset(-4);
        make.left.equalTo(label.right);
        make.right.equalTo(imageView.right);
    }];
    
}

-(NSString *)returnTimeString:(NSString *)str
{
    NSMutableString *s = [[NSMutableString alloc]initWithString:str ];
    
    NSArray *array = [s componentsSeparatedByString:@" "];
   
    
    NSArray *arr = [array[0] componentsSeparatedByString:@"-"];
        
  
    NSMutableString *string = [[NSMutableString alloc] initWithFormat:@"%@/%@",arr[1],arr[2]];
    
    return string;
    
}


@end
