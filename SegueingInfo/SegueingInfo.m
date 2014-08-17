//
//  SegueingInfo.m
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

@implementation UIViewController (SegueingInfo)

+ (void)prepareDestinationViewControllerForSegue:(UIStoryboardSegue *)segue withInfo:(id)info
{
    if ( [segue.destinationViewController conformsToProtocol:@protocol(SegueingInfoViewController) ] )
    {
        id<SegueingInfoViewController> segueingViewController = segue.destinationViewController;
        if ( [segueingViewController respondsToSelector:@selector(destinationPrepareForSegue:info:) ] )
        {
            [segueingViewController destinationPrepareForSegue:segue info:info];
        }
    }
}

@end

@implementation SegueingInfoViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    [SegueingInfoViewController prepareDestinationViewControllerForSegue:segue withInfo:sender];
}

@end