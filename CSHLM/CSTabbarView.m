//
//  CSTabbarView.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSTabbarView.h"
#import "CSImaTitleView.h"

@implementation CSTabbarView
{
    NSArray *array;
    NSArray *arraySelect ;
    
    
    returnCurrentViewControllerIndex newBlock;
    
}
/**
 *  重写父类的初始化方法
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
+(instancetype)returnCSTabbarViewInstall:(CGRect)frame
{
    return [[self alloc]initWithFrame:frame ];
}

/**
 *  设置图标，标题
 *
 *  @param titles          标题
 *  @param imageNames      图标
 *  @param selectImageName 选中时图标
 */
-(void)generateTheView:(NSArray *)titles Images:(NSArray *)imageNames SelectImageNames:(NSArray *)selectImageName
{
    //此处判断三个数组是否元素数量等同，否则按最长补空
    
    
    array =  [NSArray arrayWithArray:imageNames];
    arraySelect = [NSArray arrayWithArray:selectImageName];
    
    //图片与标题（标题在图片里面已经有了的问题？）
    if ( (imageNames.count == selectImageName.count)  && !titles)
    {
    
        float width = TABBARWIDTH / imageNames.count;
        self.backgroundColor = [UIColor blackColor];
        
        self.index = 0;
     
        
        for (int i = 0 ;  i < imageNames.count; i ++)
        {
           
            
            
            CSImaTitleView *v = [[CSImaTitleView alloc]initWithFrame:CGRectMake(width*i , 0, width, TABBARHEIGHT)];
            if (i == self.index)
            {
                v.imageStr = selectImageName[i];
            }else
            {
                v.imageStr = imageNames[i];
            }
            v.tag = i + 1;
           
            UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:) ];
            [v addGestureRecognizer:pan ];
            
            v.titleStr = @"";
          
            [self addSubview:v];
            
        }
        
        
        
    }
    
    
    
    
    
}
-(void)setReturnIndexCurrentController:(returnCurrentViewControllerIndex)block
{
    

    newBlock = block;
    
  
}

-(void)click:(UITapGestureRecognizer *)tap
{
   
    
   //数组排序从0开始  ， 视图排序从1开始
   
  
    if ((self.index + 1) == tap.view.tag)
    {
        return;
    }
    
    
    CSImaTitleView *vc = (CSImaTitleView *)tap.view;
 
 
    CSImaTitleView *vcOld = (CSImaTitleView *)[self viewWithTag:self.index + 1];
 
    

    
    

    

    
    
       vc.imageStr = arraySelect[tap.view.tag  -1];
       vcOld.imageStr = array[self.index ];
    
    
    if (newBlock)
    {
        newBlock((int)tap.view.tag - 1);
    }
    
   
    self.index = (int)tap.view.tag - 1;
  
}



@end
