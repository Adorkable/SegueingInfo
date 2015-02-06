//
//  SegueingInfo.h
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED

#import <UIKit/UIKit.h>

typedef UIViewController ViewControllerClass;
typedef UIStoryboardSegue StoryboardSegueClass;

#else

#import <Cocoa/Cocoa.h>

typedef NSViewController ViewControllerSuperclass;
typedef NSStoryboardSegue StoryboardSegueClass;

#endif

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
@interface UIViewController (SegueingInfo)
#else
@interface NSViewController (SegueingInfo)
#endif

+ (void)prepareDestinationViewControllerForSegue:(StoryboardSegueClass *)segue withInfo:(id)info;

@end

@protocol SegueingInfoViewController <NSObject>

@required
- (void)destinationPrepareForSegue:(StoryboardSegueClass *)segue info:(id)info;

@end

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
@interface SegueingInfoViewController : UIViewController
#else
@interface SegueingInfoViewController : NSViewController
#endif

@end