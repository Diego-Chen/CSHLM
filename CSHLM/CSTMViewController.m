//
//  CSTMViewController.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSTMViewController.h"



@implementation CSTMViewController

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0 green:240/255.0 blue:230/255.0 alpha:1.0];   
    self.title = @"限时特卖";

     [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}] ;
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    

    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_share@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(shareClick)];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [UIColor whiteColor],NSForegroundColorAttributeName,
                          [UIFont systemFontOfSize:15],NSFontAttributeName,nil];
    [button setTitleTextAttributes:dict forState:UIControlStateNormal];
     self.navigationItem.rightBarButtonItem = button;
    
    
    
    
    [self dataAndView];
    
}


-(void)dataAndView
{

    
    NSDictionary *dictPara = [parameters returnParameters:nil Auth_sign:@"39de5c991a45e443374ac4d270ca33a3" Page_id:nil URLString:XSTMURL ];
    
    [[CSNetManager manager]  POST:XSTMURL Paramaters:dictPara Success:^(CSNetManager *request)
    {
        NSArray *arr = request.dictionary[@"results"];
        
        
      
        
        for (NSDictionary *dic in arr)
        {
            XSTMModel *model = [[XSTMModel alloc]init ];
            
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.navDataArray addObject:model ];
        }
        
        
        [self  setNavDisplay];
        
        
    } Failure:^(NSError *error)
    {
        NSLog(@"数据返回错误%@",error);
    } ];
        
    
    
    
    
    
}

-(void)setNavDisplay
{
    
    CSScrollNav *slv = [[CSScrollNav alloc] initWithFrame:CGRectMake(0, 64, WIDTH, 40)];
    
    slv.backgroundColor = [UIColor clearColor];
    slv.delegate = self;
    slv.titleArray = [NSArray arrayWithArray:self.navDataArray];
    [self.view addSubview:slv];
    
    
    
}

-(void)trafficIndex:(int)index
{
    
    NSLog(@"hahahahahahah");
    
    NSString *auth_sign = nil;
    NSString *cat_id = nil;
    switch (index)
    {
        case 0:
        {
            auth_sign = @"34c2eea447dd63a61526bfbb8a4860d8";
            cat_id = @"0";
        }
            break;
            
        case 1:
        {
            auth_sign = @"2807ad0bad766a70d2b17d2ff9eb3611";
            cat_id = @"5";
        }
            break ;
        case 2:
        {
            auth_sign = @"41e3d70c4bdf1743c045d44f114ff46e";
            cat_id = @"2";
        }
            break;
        case 3:
        {
            auth_sign = @"a6bdbeb3d0c1aebcf6ae6de0ab661fc8";
            
            cat_id = @"1";
        }
            break;
        case 4:
        {
            auth_sign = @"2bbc2073462f39af47a0e64bcb576e7d";
            cat_id = @"3";
        }
            break;
        case 5:
        {
            auth_sign = @"b5b43f5674901ca3397d423d3cf1a77a";
            cat_id = @"4";
        }
            break;
            
        default:
            break;
    }
    
    
    NSDictionary *dictPara = [parameters returnParameters:cat_id Auth_sign:auth_sign Page_id:nil URLString:XSTM_PAGE ];
    
    [[CSNetManager manager]  POST:XSTM_PAGE Paramaters:dictPara Success:^(CSNetManager *request)
     {
 
         
         [self.dataArray removeAllObjects ];
         
         
         NSArray *arr = request.dictionary[@"results"][@"results"];
         
         

         
         for (NSDictionary *dict in arr)
         {
             
             XSTM_PAGEModel *model = [[XSTM_PAGEModel alloc]init ];
             
             
             [model setValuesForKeysWithDictionary:dict];
             
             [self.dataArray addObject:model ];
         }
         
         

         self.tableView.backgroundColor = [UIColor lightGrayColor];
         [self.tableView reloadData];
         
         
     } Failure:^(NSError *error)
     {
         
           NSLog(@"数据返回错误%@",error);
         
     } ];

}


#pragma mark - DataSourceDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    /*
     *每组多少行
     */
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     *返回cell
     */
     XSTM_PAGECell *cell = [tableView dequeueReusableCellWithIdentifier:@"XSTMCELL"];
    
     cell.modic = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    /*
     多少组
     */
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180.0;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width , self.view.frame.size.height- 104)];
        tableView.dataSource = self;
        tableView.delegate = self;
        
        tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        
        /*
         *在此注册
         */

        
        
        [tableView registerClass:[XSTM_PAGECell class] forCellReuseIdentifier:@"XSTMCELL"];
        _tableView = tableView;
    }
    return _tableView;
}


-(void)shareClick
{
    
}


-(NSMutableArray *)navDataArray
{
    if (!_navDataArray)
    {
        _navDataArray = [[NSMutableArray alloc]init];
        
    }
    return _navDataArray;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [[NSMutableArray alloc]init ];
        
    }
    return _dataArray;
}

@end
