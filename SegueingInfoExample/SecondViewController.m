//
//  SecondViewController.m
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

/**
 *  Value received from PrepereForSegue
 */
@property (strong, readwrite) NSString *iWasToldText;

@end

@implementation SecondViewController

/**
 *  SegueingInfo protocol requirement
 *
 *  @param segue Segue
 *  @param info  Info to pass
 */
- (void)destinationPrepareForSegue:(StoryboardSegueClass *)segue info:(id)info
{
    self.iWasToldText = [NSString stringWithFormat:@"%@", info];
}

#if TARGET_OS_IPHONE

/**
 *  Assign received data over
 *
 *  @param animated Animated or not
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.iWasTold.text = self.iWasToldText;
}

/**
 *  Pop the current View Controller
 *
 *  @param sender Sender
 */
- (IBAction)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES info:@"Tell my lover that I popped!"];
}

#else

/**
 *  Set recieved value in View Will Appear
 */
- (void)viewWillAppear
{
    [super viewWillAppear];

    [self.iWasTold setStringValue:self.iWasToldText];
}

#endif

@end