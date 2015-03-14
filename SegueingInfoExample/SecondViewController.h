//
//  SecondViewController.h
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

#if TARGET_OS_IPHONE
@interface SecondViewController : UIViewController<SegueingInfoViewController>
#else
@interface SecondViewController : NSViewController<SegueingInfoViewController>
#endif

#if TARGET_OS_IPHONE
@property (strong, nonatomic) IBOutlet UILabel *iWasTold;
#else
@property (strong, nonatomic) IBOutlet NSTextField *iWasTold;
#endif

@end
