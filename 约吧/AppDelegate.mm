//
//  AppDelegate.m
//  约吧
//
//  Created by 云菲 on 3/16/16.
//  Copyright © 2016 云菲. All rights reserved.
//

//发现问题一定要记得Pull Request

#import "AppDelegate.h"
#import "QYAccount.h"
#import <AVOSCloud.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>
#import <Bugtags/Bugtags.h>
//如果使用了实时通信模块，请添加下列导入语句到头部：
#import <AVOSCloudIM.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Bugtags
    [Bugtags startWithAppKey:@"e827b69f5adfec0463738ac7521f7824" invocationEvent:BTGInvocationEventBubble];
    
    //AVOSCloud
    [AVOSCloud setApplicationId:@"B7wqGimTT20zaEdIavRzNWa0-gzGzoHsz"
                      clientKey:@"dpt10aYiTbW4K1r3lznYWcrr"];
    
    //百度地图
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"FxGSxiUYA7RkVCvywWhX6k47EpGgTAfV"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    //判断用户是否已登录
    BOOL isLogin = [[QYAccount currentAccount] isLogin];
    if (!isLogin) {
        [self setRootViewControllerToEntrance];
    }
    
    return YES;
}

-(void)setRootViewControllerToHome{
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:kHomeStoryboard bundle:nil];
    UIViewController *revealVC = [homeStoryboard instantiateViewControllerWithIdentifier:kRevealVCIdentifier];
    self.window.rootViewController = revealVC;
}

-(void)setRootViewControllerToEntrance{
    UIStoryboard *entranceStoryboard = [UIStoryboard storyboardWithName:kEntranceStoryboard bundle:nil];
    UIViewController *entranceVC = [entranceStoryboard instantiateViewControllerWithIdentifier:kEntranceVCIdentifier];
    _window.rootViewController = entranceVC;
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
