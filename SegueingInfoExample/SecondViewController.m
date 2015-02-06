//
//  SecondViewController.m
//  SegueingInfo
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (strong, readwrite) NSString *iWasToldText;

@end

@implementation SecondViewController

- (void)destinationPrepareForSegue:(StoryboardSegueClass *)segue info:(id)info
{
    self.iWasToldText = [NSString stringWithFormat:@"%@", info];
}

#if defined __IPHONE_OS_VERSION_MAX_ALLOWED

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.iWasTold.text = self.iWasToldText;
}

#else

- (void)viewWillAppear
{
    [super viewWillAppear];

    [self.iWasTold setStringValue:self.iWasToldText];
}

#endif

@end