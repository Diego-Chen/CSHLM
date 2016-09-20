//
//  CSFLViewcontroller.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"
#import "FENLEIModel.h"
#import "FENLEITOPModel.h"
#import "FENLEICOLLECTModel.h"
#import "FENLEIELASTModel.h"
@interface CSFLViewcontroller : UIViewController<UIScrollViewDelegate>

@property(nonatomic , strong)UISearchController *searchController;

@property(nonatomic , strong)NSMutableArray *leftDataArray;


@property(nonatomic , weak)UIScrollView *scrollView;



@end
