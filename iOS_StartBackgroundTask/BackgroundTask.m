//
//  BackgroundTask.m
//  iOS_StartBackgroundTask
//
//  Created by pengjiaxin on 2018/11/14.
//  Copyright © 2018年 pengjiaxin. All rights reserved.
//

#import "BackgroundTask.h"

@interface BackgroundTask()

@property (nonatomic, assign) UIBackgroundTaskIdentifier task;

@end

@implementation BackgroundTask

static BackgroundTask *instance =nil;

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [BackgroundTask new];
    });
    return instance;
}

/**
 开启后台任务
 */
- (void)startBackgroundTask{
    
    //启动后台任务
    UIApplication *application = [UIApplication sharedApplication];
    //在black内修改了bgTask的值，所以要加上__block修饰符
    __block UIBackgroundTaskIdentifier bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
        //主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid) {
                //结束任务
                [application endBackgroundTask:bgTask];
                //置为空
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    
    

        //子线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //做其他需要操作的任务
//        while (true) {
//
//            int remainingTime = application.backgroundTimeRemaining;
//            if (remainingTime <=5) {
//                break;
//            }
//            NSLog(@"remaining background time %d",remainingTime);
//            [NSThread sleepForTimeInterval:1];
//        }
        
        
        
        //在主线程结束任务
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid) {
                [application endBackgroundTask:bgTask];
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    });
}


-(void)endBackgroundTask{
    
}

@end
