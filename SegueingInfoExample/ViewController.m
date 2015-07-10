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
@property (strong, readwrite) NSString *iWasToldText;
#endif

@end

@implementation ViewController

#if TARGET_OS_IPHONE
- (void)destinationPrepareForSegue:(UIStoryboardSegue *)segue info:(id)info
{
    self.iWasToldText = [NSString stringWithFormat:@"%@", info];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.iWasToldText != nil)
    {
        self.tell.text = self.iWasToldText;
    }
}
#endif

- (IBAction)tellNextViewController:(id)sender
{
#if TARGET_OS_IPHONE
    [self performSegueWithIdentifier:@"Next" sender:self.tell.text];
#else
    [self performSegueWithIdentifier:@"Next" sender:[self.tell stringValue] ];
#endif
}

@end
