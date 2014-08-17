//
//  SegueingInfo.h
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SegueingInfo)

+ (void)prepareDestinationViewControllerForSegue:(UIStoryboardSegue *)segue withInfo:(id)info;

@end

@protocol SegueingInfoViewController <NSObject>

@required
- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info;

@end

@interface SegueingInfoViewController : UIViewController

@end