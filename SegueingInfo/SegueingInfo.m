//
//  SegueingInfo.m
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
@implementation UIViewController (SegueingInfo)
#else
@implementation NSViewController (SegueingInfo)
#endif

+ (void)prepareDestinationViewControllerForSegue:(StoryboardSegueClass *)segue withInfo:(id)info
{
#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
    if ( [segue.destinationViewController conformsToProtocol:@protocol(SegueingInfoViewController) ] )
#else
    if ( [segue.destinationController conformsToProtocol:@protocol(SegueingInfoViewController) ] )
#endif
    {
#if defined __IPHONE_OS_VERSION_MAX_ALLOWED
        id<SegueingInfoViewController> segueingViewController = segue.destinationViewController;
#else
        id<SegueingInfoViewController> segueingViewController = segue.destinationController;
#endif
        if ( [segueingViewController respondsToSelector:@selector(destinationPrepareForSegue:info:) ] )
        {
            [segueingViewController destinationPrepareForSegue:segue info:info];
        }
    }
}

@end

@implementation SegueingInfoViewController

- (void)prepareForSegue:(StoryboardSegueClass *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    [SegueingInfoViewController prepareDestinationViewControllerForSegue:segue withInfo:sender];
}

@end