//
//  CSTMViewController.h
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"
#import "CSScrollNav.h"
#import "XSTMModel.h"
#import "XSTM_PAGEModel.h"
#import "XSTM_PAGECell.h"
@interface CSTMViewController : UIViewController<NavDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)NSMutableArray *navDataArray;
@property (nonatomic , strong)NSMutableArray *dataArray;
@property (nonatomic , strong)UITableView *tableView;
@end
