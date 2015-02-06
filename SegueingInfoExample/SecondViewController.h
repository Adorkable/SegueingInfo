//
//  SecondViewController.h
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
@interface SecondViewController : UIViewController<SegueingInfoViewController>
#else
@interface SecondViewController : NSViewController<SegueingInfoViewController>
#endif

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
@property (strong, nonatomic) IBOutlet UILabel *iWasTold;
#else
@property (strong, nonatomic) IBOutlet NSTextField *iWasTold;
#endif

@end
