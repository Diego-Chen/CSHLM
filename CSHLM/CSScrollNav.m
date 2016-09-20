//
//  CSScrollNav.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/31.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSScrollNav.h"

@implementation CSScrollNav
{
    UILabel *_label;
    UIButton *_button;
    UIScrollView *scrollView;

}


-(void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;

  
    CGFloat BW = WIDTH / 4.0;
    
    
    scrollView = [[UIScrollView alloc]init ];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(BW*_titleArray.count, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [self addSubview:scrollView];
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.bottom.equalTo(self.bottom);
        
    }];
    
    for (int i = 0  ; i < _titleArray.count ; i ++)
    {
        XSTMModel *model = _titleArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [button setTitle:model.name forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.frame = CGRectMake(i*BW, 0, BW, self.bounds.size.height - 1);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i + BASETAGXSTM;
        
        
        [scrollView addSubview:button];
      
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*BW, self.bounds.size.height - 1, BW, 1)];
        label.tag =( BASETAGXSTM + i ) + 10 ;
        [scrollView addSubview:label];
        if (i==0)
            
        {   label.backgroundColor = [UIColor orangeColor];
           
                [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
                
                _label = label;
                _button = button;
            
        }else
        {
            
                [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
                label.backgroundColor = [UIColor lightGrayColor];
        }
        
       
        
        
        
    }
   
    
    [self.delegate trafficIndex:0];
    
}

-(void)buttonClick:(UIButton *)button
{
    UIButton *button1 = (UIButton *)[self viewWithTag:button.tag];
    UILabel *label = (UILabel *)[self viewWithTag:button.tag + 10];
    _label.backgroundColor = [UIColor lightGrayColor];
    [_button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor  orangeColor] forState:UIControlStateNormal ];
    label.backgroundColor = [UIColor orangeColor];
    _label = label;
    _button = button1;
    
    
    
    int index = (int)button.tag - BASETAGXSTM;
    if ((index * WIDTH/4.0 + WIDTH / 8.0 > WIDTH / 2.0) )
    {
        
        
        if ( (scrollView.contentSize.width - (index * WIDTH/4.0 + WIDTH / 8.0) )<= WIDTH/8.0)
        {
            
            
            
        }else if  ((scrollView.contentSize.width - (index * WIDTH/4.0 + WIDTH / 8.0) )< WIDTH/2.0  && (scrollView.contentSize.width - (index * WIDTH/4.0 + WIDTH / 8.0) )> WIDTH/8.0)
        {
            
            [scrollView setContentOffset:CGPointMake( (index * WIDTH/4.0 + WIDTH / 8.0 - WIDTH  +  WIDTH / 4.0 + WIDTH/8.0  ), 0) animated:YES ];
            
        }
        else
        {
            
            [scrollView setContentOffset:CGPointMake( (index * WIDTH/4.0 + WIDTH / 8.0 - WIDTH / 2.0), 0) animated:YES ];
            
        }
    }
    NSLog(@"嘿 boy%d",index);
    
    [self.delegate trafficIndex:index];
    
}
@end
