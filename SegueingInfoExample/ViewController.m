//
//  ViewController.m
//  SegueingInfoExample
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

#if TARGET_OS_IPHONE
/**
 *  Value received from PrepereForSegue
 */
@property (strong, readwrite) NSString *iWasToldText;
#endif

@end

@implementation ViewController

#if TARGET_OS_IPHONE
/**
 *  SegueingInfo Protocol selector for receiving information
 *
 *  @param segue Segue
 *  @param info  Info to pass
 */
- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info
{
    self.iWasToldText = [NSString stringWithFormat:@"%@", info];
}

/**
 *  Set view to passed info 
 *
 *  @param animated Animated or not
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.iWasToldText != nil)
    {
        self.tell.text = self.iWasToldText;
    }
}
#endif

/**
 *  Common action to segue to next Controller while passing Tell value
 *
 *  @param sender Sender
 */
- (IBAction)tellNextViewController:(id)sender
{
#if TARGET_OS_IPHONE
    [self performSegueWithIdentifier:@"Next" sender:self.tell.text];
#else
    [self performSegueWithIdentifier:@"Next" sender:[self.tell stringValue] ];
#endif
}

@end
