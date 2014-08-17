//
//  SecondViewController.h
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SegueingInfo.h"

@interface SecondViewController : UIViewController<SegueingInfoViewController>

@property (weak, nonatomic) IBOutlet UILabel *iWasTold;

@end
