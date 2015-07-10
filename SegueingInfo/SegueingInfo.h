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

/**
 *  Utility selector that handles passing information to a waiting and able destination View Controller. Usually called from prepareForSegue:sender:
 *
 *  @param segue The segue being performed
 *  @param info  The information being passed to the destination of the segue
 */
+ (void)prepareDestinationViewControllerForSegue:(StoryboardSegueClass *)segue withInfo:(id)info;

@end

/**
 *  Protocol for receiving passed information
 */
@protocol SegueingInfoProtocol <NSObject>
// TODO: Protocol name should include "Destination" somewhere probs

@required
/**
 *  Selector of destination View Controller that recieves formationed passed from source View Controller
 *
 *  @param segue The segue being performed
 *  @param info  The information being passed from the source of the segue
 */
- (void)destinationPrepareForSegue:(StoryboardSegueClass *)segue info:(id)info;

@end

#if USE_SWIZZLING != 1

#if TARGET_OS_IPHONE

/**
 *  View Controller class that provides automatic passing from source View Controller to destination View Controller
 */
@interface SegueingInfoViewController : UIViewController
#else
@interface SegueingInfoViewController : NSViewController
#endif

@end

#endif

#if TARGET_OS_IPHONE
@interface UINavigationController (SegueingInfo)

/**
 *  Pop the top View Controller and pass the next View Controller information
 *
 *  @param animated Animate the pop
 *  @param info     The information being passed
 *
 *  @return The popped View Controller
 */
- (UIViewController *)popViewControllerAnimated:(BOOL)animated info:(id)info;

/**
 *  Pop to a specified View Controller and pass it the information
 *
 *  @param viewController The View Controller to pop to
 *  @param animated       Animate the pop
 *  @param info           The information being passed
 *
 *  @return The popped controllers
 */
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated info:(id)info;

/**
 *  Pop to the root View Controller and pass it the information
 *
 *  @param animated Animate the pop
 *  @param info     The information being passed
 *
 *  @return The popped controllers
 */
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated info:(id)info;

@end
#endif
