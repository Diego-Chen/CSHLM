//
//  CSFLViewcontroller.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSFLViewcontroller.h"


@interface CSFLViewcontroller ()

@end


@implementation CSFLViewcontroller


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor ];

    view.frame = CGRectMake(20, 6, WIDTH-40, 32);
    
    self.navigationItem.titleView = view;
    
    
    
    
    SearchViewController *seachVc = [[SearchViewController alloc]init];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:seachVc];
    
    self.searchController.view.backgroundColor = [UIColor blueColor];
    
    
    self.searchController.searchResultsUpdater = seachVc;
    
    [self.searchController.searchBar sizeToFit];
    
   // self.searchController.searchBar.tintColor = [UIColor orangeColor];
    //外框颜色
    self.searchController.searchBar.barTintColor = [UIColor clearColor];
    
    self.searchController.searchBar.placeholder = @"请输入关键词";
    
    //输入框背景颜色
    UIView *searchTextField = [[[self.searchController.searchBar.subviews firstObject]subviews]lastObject];
    searchTextField.backgroundColor = [UIColor colorWithRed:176%255/255.0 green:226%255/255.0 blue:230%255/255.0 alpha:1.0];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"micro_small_for_searchbar_ios5@2x.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(speackCleck) forControlEvents:UIControlEventTouchUpInside];
    button.imageEdgeInsets = UIEdgeInsetsMake(5, 20, 5, -5);
    [searchTextField addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(searchTextField.top);
        make.right.equalTo(searchTextField.right);
        make.bottom.equalTo(searchTextField.bottom);
        make.width.equalTo(50);
    }];
    
    
    
    
    
    [view addSubview:self.searchController.searchBar];
    [self.searchController.searchBar makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(view.top);
        make.bottom.equalTo(view.bottom);
        make.left.equalTo(view.left);
        make.right.equalTo(view.right);
    }];
    
    self.definesPresentationContext = NO;
    
    

    [self requestData];
    
}
-(void)requestData
{
    [[CSNetManager manager] GET:FENLEIURL Paramaters:nil Success:^(CSNetManager *request) {
        
        NSLog(@"分类数据%@",request.dictionary);
        
        NSArray *array = request.dictionary[@"results"];
        
        for (NSDictionary *dic in array)
        {
             FENLEIModel *model = [[FENLEIModel   alloc] init];
            
            [model setValuesForKeysWithDictionary:dic ];
            
            [self.leftDataArray addObject:model];
             
        }
        
       
        [self layoutView];
        
        
        
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


-(void)layoutView
{
    FENLEIModel *m = self.leftDataArray[0];
    FENLEICOLLECTModel *mo = m.second[0];
    FENLEIELASTModel *mod = mo.third[0];

    NSLog(@"%@",mod.virtual_icon);
    
}

-(void)speackCleck
{
    
    
    
}

-(NSMutableArray *)leftDataArray
{
    if (!_leftDataArray) {
        _leftDataArray = [[NSMutableArray alloc]init ];
    }
    return _leftDataArray;
}


-(UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        
        
         UIScrollView *scvc  = [[UIScrollView alloc] init];
        
        
        _scrollView = scvc;
    }
    return _scrollView;
}




@end
