//
//  SceneDelegate.m
//  ArbitraryDoorsApp
//
//  Created by 林楚婷 on 2020/5/31.
//  Copyright © 2020 Chutiiing. All rights reserved.
//

#import "SceneDelegate.h"
#import "DengLuViewController.h"
#import "mainViewController.h"
#import "WelcomeViewController.h"

@interface SceneDelegate ()



@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc]initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    self.window.backgroundColor = [UIColor clearColor];
    
    mainViewController *main =[[mainViewController alloc]init];
    DengLuViewController *denglu =[[DengLuViewController alloc]init];


    //判断程序是不是第一次启动
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];

        self.issignin=0;
        [[NSUserDefaults standardUserDefaults]setInteger:self.issignin forKey:@"issignin"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
        self.issignin=[[NSUserDefaults standardUserDefaults]integerForKey:@"issignin"];
    }

    //如果是第一次启动
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        //自己创建的引导页控制器
        WelcomeViewController *vc=[[WelcomeViewController alloc]init];
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        self.window.rootViewController = nc;

        //滑到最后一页的回调
        vc.callBack = ^{
            //未登录
            if(self.issignin==0){
            UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:denglu];
            self.window.rootViewController = nc;
            }
            //已登录
            if(self.issignin==1){
                UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:main];
                self.window.rootViewController = nc;
            }

        };
    }
    else{
        //未登录
        if(self.issignin==0){
            UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:denglu];
            self.window.rootViewController = nc;
        }
        //已登录
        if(self.issignin==1){
            UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:main];
            self.window.rootViewController = nc;
        }
    }
    
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
