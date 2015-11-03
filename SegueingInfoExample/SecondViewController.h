//
//  SecondViewController.h
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

/// Example View Controller
#if TARGET_OS_IPHONE
@interface SecondViewController : UIViewController<SegueingInfoProtocol>
#else
@interface SecondViewController : NSViewController<SegueingInfoProtocol>
#endif

/**
 *  Display info passed to this view controller
 */
#if TARGET_OS_IPHONE
@property (strong, nonatomic) IBOutlet UILabel *iWasTold;
#else
@property (strong, nonatomic) IBOutlet NSTextField *iWasTold;
#endif

@end
