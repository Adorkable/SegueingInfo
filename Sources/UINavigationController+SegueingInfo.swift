//
//  UINavigationController+SegueingInfo.swift
//  SegueingInfo
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 *  Extension selectors for UINavigationController
 */
public extension UINavigationController
{
    /**
     *  Pop the top View Controller and pass the next View Controller information
     *
     *  @param animated Animate the pop
     *  @param withInfo     The information being passed
     *
     *  @return The popped View Controller
     */
    public func popViewControllerAnimated(_ animated : Bool, withInfo info : SegueingInfoInfoClass) -> SegueingInfoViewControllerClass? {
        if self.viewControllers.count > 1 {
            let topViewController = self.viewControllers[self.viewControllers.count - 2]
            topViewController.treatAsDestinationViewController(nil, withInfo: info)
        }
        
        return self.popViewController(animated: animated)
    }
    
    /**
     *  Pop to a specified View Controller and pass it the information
     *
     *  @param viewController The View Controller to pop to
     *  @param animated       Animate the pop
     *  @param withInfo           The information being passed
     *
     *  @return The popped controllers
     */
    public func popToViewController(_ viewController : SegueingInfoViewControllerClass, animated : Bool, withInfo info : SegueingInfoInfoClass) -> [SegueingInfoViewControllerClass]? {
        
        viewController.treatAsDestinationViewController(nil, withInfo: info)
        return self.popToViewController(viewController, animated: animated)
    }
    
    /**
     *  Pop to the root View Controller and pass it the information
     *
     *  @param animated Animate the pop
     *  @param withInfo     The information being passed
     *
     *  @return The popped controllers
     */
    public func popToRootViewController(_ animated : Bool, withInfo info : SegueingInfoInfoClass) -> [SegueingInfoViewControllerClass]? {
        
        if self.viewControllers.count > 0,
            let rootViewController = self.viewControllers.first {
                
                rootViewController.treatAsDestinationViewController(nil, withInfo: info)
        }
        
        return self.popToRootViewController(animated: animated)
    }
}
#endif
