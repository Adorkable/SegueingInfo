//
//  ViewController.h
//  SegueingInfoExample
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"


@interface ViewController : SegueingInfoViewController

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
@property (weak, nonatomic) IBOutlet UITextField *tell;
#else
@property (weak, nonatomic) IBOutlet NSTextField *tell;
#endif

@end

