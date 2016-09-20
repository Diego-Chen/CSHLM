//
//  AppDelegate.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "AppDelegate.h"
#import "CSTBCTL.h"
#import "CSSYViewController.h"
#import "CSTMViewController.h"
#import "CSFLViewcontroller.h"
#import "CSGWCViewController.h"
#import "CSYFViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]init ];
    self.window.backgroundColor = [UIColor whiteColor];
    
     [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
   
    NSArray *arrayimg =     @[  @"tab_bar_icon_0.png",
                                @"tab_bar_icon_1.png",
                                @"tab_bar_icon_2.png",
                                @"tab_bar_icon_3.png",
                                @"tab_bar_icon_4.png"
                             ];
    
    NSArray *selectImages = @[
                              @"tab_bar_icon_selected_0.png",
                              @"tab_bar_icon_selected_1.png",
                              @"tab_bar_icon_selected_2.png",
                              @"tab_bar_icon_selected_3.png",
                              @"tab_bar_icon_selected_4.png"
                              ];
    
    
    CSTBCTL *tbctl = [[CSTBCTL alloc]init ];
    [tbctl.tabbarView   generateTheView:nil Images:arrayimg SelectImageNames:selectImages ];
    
    NSArray *vcArray = @[NSStringFromClass([CSSYViewController class]),
                         NSStringFromClass([CSTMViewController class]),
                         NSStringFromClass([CSFLViewcontroller class]),
                         NSStringFromClass([CSGWCViewController class]),
                         NSStringFromClass([CSYFViewController class] )
         
                         
                         ];
//    NSMutableArray *nvcs = [[NSMutableArray alloc]init ];
    NSMutableArray *vcs = [[NSMutableArray alloc]init];
    
    
    for (int i = 0; i < vcArray.count; i++)
    {
        //把控制器添加到数组里面
        [vcs addObject:[self viewControllerWithControllerName:vcArray[i]]];
        
//        [vcs addObject:[self controllerWithName:vcArray[i]]];
        
    }
    
    
    tbctl.controllers = vcs;
    
  
    
    
    
    
    
    
    self.window.rootViewController = tbctl;
    [self.window makeKeyWindow];
    
    
    return YES;
}

- (UINavigationController *)viewControllerWithControllerName:(NSString *)viewControllerName
{
    
    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(viewControllerName) alloc] init]];
    nav.navigationBar.barTintColor = [UIColor blackColor];
    return nav;
}

-(UIViewController *)controllerWithName:(NSString *)viewName
{
    UIViewController *vc = [[NSClassFromString(viewName) alloc]init];
    return vc;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
