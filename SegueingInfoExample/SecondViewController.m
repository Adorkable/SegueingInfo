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

- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info
{
    self.iWasToldText = [NSString stringWithFormat:@"%@", info];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.iWasTold.text = self.iWasToldText;
}

@end