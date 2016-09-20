//
//  CSGWCViewController.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSGWCViewController.h"

@interface  CSGWCViewController ()

@end

@implementation CSGWCViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    /*限时特卖*/
    self.title = @"限时特卖";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}] ;
    
        self.view.backgroundColor = [UIColor whiteColor];
}


@end
