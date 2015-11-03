//
//  ViewController.h
//  SegueingInfoExample
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

/**
 *  Example View Controller
 */
@interface ViewController : SegueingInfoViewController
#if TARGET_OS_IPHONE
<SegueingInfoProtocol>
#endif

/// Value to tell to next View
#if TARGET_OS_IPHONE
@property (weak, nonatomic) IBOutlet UITextField *tell;
#else
@property (weak, nonatomic) IBOutlet NSTextField *tell;
#endif

@end

