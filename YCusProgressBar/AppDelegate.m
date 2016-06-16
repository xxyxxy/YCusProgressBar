//
//  AppDelegate.m
//  YCusProgressBar
//
//  Created by jw on 13-4-12.
//  Copyright (c) 2013年 jw. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "APService.h"
@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                   UIRemoteNotificationTypeSound |
                                                   UIRemoteNotificationTypeAlert)];
    [APService setupWithOption:launchOptions];

    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [APService registerDeviceToken:deviceToken];
    
    UIAlertView *APromptAlertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                              message:[NSString stringWithFormat:@"%@",@"注册成功"]
                                                             delegate:self
                                                    cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    [APromptAlertView show];
    
    [APromptAlertView release];
}


- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif {
	// Handle the notificaton when the app is running
//	NSLog(@"Recieved Notification。。。。 %@",notif);
//    UIAlertView *AAlertView=[[UIAlertView alloc] initWithTitle:@"通知" message:@"自定义园" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [AAlertView show];
//    [AAlertView release];
}




- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    
    if([UIApplication sharedApplication].applicationState ==UIApplicationStateActive){
        NSLog(@"程序在前台运行");
    }
    else
    {
        NSLog(@"程序在后台台运行");
    }
    
    
    [APService handleRemoteNotification:userInfo];
    
    UIAlertView *APromptAlertView = [[UIAlertView alloc]initWithTitle:@"推送消息"
                                                              message:[NSString stringWithFormat:@"%@",userInfo]
                                                             delegate:Nil
                                                    cancelButtonTitle:@"确定"
                                                    otherButtonTitles:nil];
    
    [APromptAlertView show];
    
    [APromptAlertView release];
}



- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    UIAlertView *APromptAlertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                              message:[NSString stringWithFormat:@"%@",error]
                                                             delegate:self
                                                    cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    [APromptAlertView show];
    
    [APromptAlertView release];
}




- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    
    
    
    
    
    NSLog(@"badge:%d",application.applicationIconBadgeNumber);
    
    [APService handleRemoteNotification:userInfo];
    UIAlertView *APromptAlertView = [[UIAlertView alloc]initWithTitle:@"推送消息"
                                                              message:[NSString stringWithFormat:@"%@",userInfo]
                                                             delegate:Nil
                                                    cancelButtonTitle:@"确定"
                                                    otherButtonTitles:nil];
    
    [APromptAlertView show];
    
    [APromptAlertView release];
    
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{

    NSString *AUrlString=url.description;
    
    UIAlertView *AAlertView=[[UIAlertView alloc] initWithTitle:@"通知" message:AUrlString delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [AAlertView show];
    [AAlertView release];
    
    return  YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
      
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
