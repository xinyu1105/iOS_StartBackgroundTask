//
//  BackgroundTask.h
//  iOS_StartBackgroundTask
//
//  Created by pengjiaxin on 2018/11/14.
//  Copyright © 2018年 pengjiaxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BackgroundTask : NSObject

+ (instancetype)shareInstance;

/**
 开启后台任务
 */
- (void)startBackgroundTask;


@end
