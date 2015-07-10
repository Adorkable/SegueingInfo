//
//  SegueingInfo.m
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SegueingInfo.h"

#if USE_SWIZZLING
#import <RSSwizzle/RSSwizzle.h>
#endif

#if TARGET_OS_IPHONE
@implementation UIViewController (SegueingInfo)
#else
@implementation NSViewController (SegueingInfo)
#endif

#if USE_SWIZZLING
+ (void)load
{
    static const void *key = &key;
    
    SEL selector = @selector(prepareForSegue:sender:);
    
#if TARGET_OS_IPHONE
    RSSwizzleInstanceMethod(self,
                            selector,
                            RSSWReturnType(void),
                            RSSWArguments(UIStoryboardSegue *segue, id sender),
                            RSSWReplacement(
    {
        RSSWCallOriginal(segue, sender);
        
        [UIViewController prepareDestinationViewControllerForSegue:segue withInfo:sender];

    }), RSSwizzleModeOncePerClass, key);
#else
    RSSwizzleInstanceMethod(self,
                            selector,
                            RSSWReturnType(void),
                            RSSWArguments(NSStoryboardSegue *segue, id sender),
                            RSSWReplacement(
    {
        RSSWCallOriginal(segue, sender);
        
        [NSViewController prepareDestinationViewControllerForSegue:segue withInfo:sender];
        
    }), RSSwizzleModeOncePerClass, key);
#endif
}
#endif

- (void)prepareAsDestinationViewControllerForSegue:(StoryboardSegueClass *)segue withInfo:(id)info
{
    if ( [self conformsToProtocol:@protocol(SegueingInfoProtocol) ] )
    {
        id<SegueingInfoProtocol> selfAsProtocol = (id<SegueingInfoProtocol>)self;
        if ( [selfAsProtocol respondsToSelector:@selector(destinationPrepareForSegue:info:) ] )
        {
            [selfAsProtocol destinationPrepareForSegue:segue info:info];
        }
    }
}

+ (void)prepareDestinationViewControllerForSegue:(StoryboardSegueClass *)segue withInfo:(id)info
{
    id destination = nil;
#if TARGET_OS_IPHONE
    destination = segue.destinationViewController;
#else
    destination = segue.destinationController;
#endif
    
    if ( [destination respondsToSelector:@selector(prepareAsDestinationViewControllerForSegue:withInfo:) ] )
    {
        [destination prepareAsDestinationViewControllerForSegue:segue withInfo:info];
    }
}

@end

#if USE_SWIZZLING != 1

@implementation SegueingInfoViewController

- (void)prepareForSegue:(StoryboardSegueClass *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    
    [UIViewController prepareDestinationViewControllerForSegue:segue withInfo:sender];
}

@end

#endif

#if TARGET_OS_IPHONE
@implementation UINavigationController (SegueingInfo)

- (UIViewController *)popViewControllerAnimated:(BOOL)animated info:(id)info
{
    if (self.viewControllers.count > 1 && [self.viewControllers[self.viewControllers.count - 2] isKindOfClass:[UIViewController class] ] )
    {
        UIViewController *topViewController = (UIViewController *)self.viewControllers[self.viewControllers.count - 2];
        [topViewController prepareAsDestinationViewControllerForSegue:nil withInfo:info];
    }
    return [self popViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated info:(id)info
{
    [viewController prepareAsDestinationViewControllerForSegue:nil withInfo:info];
    return [self popToViewController:viewController animated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated info:(id)info
{
    if (self.viewControllers.count > 0 && [self.viewControllers.firstObject isKindOfClass:[UIViewController class] ] )
    {
        UIViewController *rootViewController = (UIViewController *)self.viewControllers.firstObject;
        [rootViewController prepareAsDestinationViewControllerForSegue:nil withInfo:info];
    }
    return [self popToRootViewControllerAnimated:animated];
}

@end
#endif