//
//  SegueingInfo.h
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

typedef UIViewController ViewControllerClass;
typedef UIStoryboardSegue StoryboardSegueClass;

#else

#import <Cocoa/Cocoa.h>

typedef NSViewController ViewControllerSuperclass;
typedef NSStoryboardSegue StoryboardSegueClass;

#endif

#if TARGET_OS_IPHONE
@interface UIViewController (SegueingInfo)
#else
@interface NSViewController (SegueingInfo)
#endif

+ (void)prepareDestinationViewControllerForSegue:(StoryboardSegueClass *)segue withInfo:(id)info;

@end

@protocol SegueingInfoProtocol <NSObject>

@required
- (void)destinationPrepareForSegue:(StoryboardSegueClass *)segue info:(id)info;

@end

#if TARGET_OS_IPHONE
@interface SegueingInfoViewController : UIViewController
#else
@interface SegueingInfoViewController : NSViewController
#endif

@end