//
//  CSTBCTL.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSTBCTL.h"
#import "Header.h"
@interface CSTBCTL ()

@end

@implementation CSTBCTL
{
    int  _currentIndex;
}
/**
 *  创建底栏视图
 *
 *  @return 返回底栏对象
 */
-(CSTabbarView *)tabbarView
{
    if (!_tabbarView)
    {
        
        CSTabbarView *tv = [CSTabbarView  returnCSTabbarViewInstall: CGRectMake(0, WINDOWHEIGHT-TABBARHEIGHT, WINDOWWIDTH, TABBARHEIGHT) ];
       
        [tv  setReturnIndexCurrentController:^(int index)
         {
             [self setCurrentViewController:index];
             
             
         }];
        
        [self.view addSubview:tv];
        
        _tabbarView = tv;
    }
    return  _tabbarView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    self.tabbarView.backgroundColor = [UIColor whiteColor];
   
}

-(void)setCurrentViewController:(int)index
{
  
    
    
    UINavigationController *vc = self.controllers[index];
    UINavigationController *vc1 = self.controllers[_currentIndex];
    
    
  
    
    
    
    
    if ([NSStringFromClass([vc.viewControllers[0] class])  isEqualToString:NSStringFromClass([vc1.viewControllers[0]  class])])
    {
        [self.view bringSubviewToFront:vc.view];
        
        return;
    }else
    {
    
    
    
    
        vc.view.frame = CGRectMake(0, 0, WINDOWWIDTH, WINDOWHEIGHT - TABBARHEIGHT);
        [self addChildViewController:vc ];
        [self.view addSubview: vc.view ];
    
    }
    
      _currentIndex = index;
    
}


-(void)setHidden:(BOOL)hidden animated:(BOOL)animated
{
    
}

-(void)setControllers:(NSArray *)controllers
{
    _controllers = controllers;
    
//    for (int i = (int)controllers - 1  ; i>=0 ;     i ++)
//    {
    
        
            UIViewController *v = (UIViewController *)controllers[0] ;
            v.view.frame = CGRectMake(0, 0, WINDOWWIDTH, WINDOWHEIGHT  - 49);
            [self addChildViewController:v ];
            [self.view addSubview:v.view];
        
//    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
