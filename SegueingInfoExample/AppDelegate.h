//
//  AppDelegate.h
//  SegueingInfoExample
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

#if TARGET_OS_IPHONE

typedef UIResponder ResponderClass;
typedef UIWindow WindowClass;
typedef UIApplication ApplicationClass;

/**
 *  App delegate
 */
@interface AppDelegate : UIResponder <UIApplicationDelegate>

#else

/**
 *  App delegate
 */
@interface AppDelegate : NSResponder <NSApplicationDelegate>

typedef NSResponder ResponderClass;
typedef NSWindow WindowClass;
typedef NSApplication ApplicationClass;

#endif

/**
 *  Main Window
 */
@property (strong, nonatomic) WindowClass *window;

@end

