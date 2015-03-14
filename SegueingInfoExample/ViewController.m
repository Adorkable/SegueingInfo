//
//  ViewController.m
//  SegueingInfoExample
//
//  Created by Ian on 8/17/14.
//  Copyright (c) 2014 Adorkable. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (IBAction)tellNextViewController:(id)sender
{
#if TARGET_OS_IPHONE
    [self performSegueWithIdentifier:@"Next" sender:self.tell.text];
#else
    [self performSegueWithIdentifier:@"Next" sender:[self.tell stringValue] ];
#endif
}

@end
