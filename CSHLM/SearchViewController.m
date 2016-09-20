//
//  SearchViewController.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/9/13.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"%@",[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchController.searchBar.text]);
    
//    [self.searchDataSource removeAllObjects];
//    
//    //得到搜索结果的数据数组
//    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchController.searchBar.text];
//    self.searchDataSource = [[self.dataSource filteredArrayUsingPredicate:searchPredicate] mutableCopy];
//    //刷新
//    [self.tableView reloadData];
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
