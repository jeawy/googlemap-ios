//
//  DCTestPluginProxy.m
//  DCTestUniPlugin
//
//  Created by XHY on 2020/5/19.
//  Copyright © 2020 DCloud. All rights reserved.
//

#import "TestPluginProxy.h"
@import GoogleMaps;
#import <GooglePlaces/GooglePlaces.h>
@implementation TestPluginProxy

- (void)onCreateUniPlugin {
    NSLog(@"UniPluginProtocol Func: %@,%s",self,__func__);
}

- (BOOL)application:(UIApplication *_Nullable)application didFinishLaunchingWithOptions:(NSDictionary *_Nullable)launchOptions {
    NSLog(@"UniPluginProtocol Func: %@,%s",self,__func__);
    //https://nativesupport.dcloud.net.cn/NativePlugin/course/package?id=parameters-1
    NSDictionary *infoPlistDict = [[NSBundle mainBundle] infoDictionary];
    NSDictionary *googlemap = infoPlistDict[@"googlemap"];
    [GMSServices provideAPIKey:googlemap[@"key"]];
    [GMSPlacesClient provideAPIKey:googlemap[@"key"]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication * _Nullable)application {
    NSLog(@"UniPluginProtocol Func: %@,%s",self,__func__);
}

- (void)applicationDidBecomeActive:(UIApplication *_Nullable)application {
    NSLog(@"UniPluginProtocol Func: %@,%s",self,__func__);
}

- (void)applicationDidEnterBackground:(UIApplication *_Nullable)application {
    NSLog(@"UniPluginProtocol Func: %@,%s",self,__func__);
}

- (void)applicationWillEnterForeground:(UIApplication *_Nullable)application {
    NSLog(@"UniPluginProtocol Func: %@,%s",self,__func__);
}

- (void)applicationWillTerminate:(UIApplication *_Nullable)application {
    NSLog(@"UniPluginProtocol Func: %@,%s",self,__func__);
}

@end
