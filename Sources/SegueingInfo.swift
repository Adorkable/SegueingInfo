//
//  SegueingInfo.swift
//  SegueingInfo
//
//  Created by Ian Grossberg on 11/30/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

#if os(OSX)
    public typealias SegueingInfoViewControllerClass = NSViewController
    public typealias SegueingInfoStoryboardSegueClass = NSStoryboardSegue
#elseif os(iOS)
    public typealias SegueingInfoViewControllerClass = UIViewController
    public typealias SegueingInfoStoryboardSegueClass = UIStoryboardSegue
#endif

public typealias SegueingInfoInfoClass = AnyObject

public extension SegueingInfoViewControllerClass {

    /**
    *  Static Utility selector that handles passing information to a waiting and able destination View Controller. Usually called from prepareForSegue:sender:
    *
    *  @param segue The segue being performed
    *  @param withInfo  The information being passed to the destination of the segue
    */
    public class func prepareDestinationViewControllerForSegue(_ segue : SegueingInfoStoryboardSegueClass, withInfo info : SegueingInfoInfoClass) {
        
        #if os(OSX)
            segue.destinationController.treatAsDestinationViewController(segue, withInfo: info)
        #elseif os(iOS)
            segue.destination.treatAsDestinationViewController(segue, withInfo: info)
        #endif
    }
    
    /**
     *  Utility selector that handles passing information to a waiting and able destination View Controller. Usually called from prepareForSegue:sender:
     *
     *  @param segue The segue being performed
     *  @param withInfo  The information being passed to the destination of the segue
     */
    public func prepareDestinationViewControllerForSegue(_ segue : SegueingInfoStoryboardSegueClass, withInfo info : SegueingInfoInfoClass) {
        type(of: self).prepareDestinationViewControllerForSegue(segue, withInfo: info)
    }
}

public extension SegueingInfoViewControllerClass {
    /**
     *  Prepare compatible self as destination
     *
     *  @param segue Segue
     *  @param withInfo  Info to pass
     */
    internal func treatAsDestinationViewController(_ segue : SegueingInfoStoryboardSegueClass?, withInfo info : SegueingInfoInfoClass) {

        // Note: We aren't extending UINavigationController or UITabBarController, this way functionality is more explicitly controlled by clients of the library
        // By default we'll seek through a NavigationControllerClass to it's root or UITabBarController to it's first VC
        // But if the client explicity conforms to SegueingInfoDestination he/she can decide what do to and potentially implement more complicated behavior
        if let destination = self as? SegueingInfoDestination {
            destination.destinationPrepareForSegue(segue, withInfo: info)
        } else {
            #if os(iOS)
                if let navigationController = self as? UINavigationController,
                    let firstViewController = navigationController.viewControllers.first {
                        firstViewController.treatAsDestinationViewController(segue, withInfo: info)
                } else
                {
                    if let tabBarController = self as? UITabBarController {
                        if let selectedViewController = tabBarController.selectedViewController {
                            
                            selectedViewController.treatAsDestinationViewController(segue, withInfo: info)
                            
                        } else if let viewControllers = tabBarController.viewControllers {
                            if viewControllers.count > 0 {
                                viewControllers[0].treatAsDestinationViewController(segue, withInfo: info)
                            }
                        }
                    }
                }
            #endif
        }
    }
}

/**
 *  Protocol for receiving passed information
 */
public protocol SegueingInfoDestination : NSObjectProtocol {
    
    /**
     *  Destination View Controller that receives information passed from source View Controller
     *
     *  @param segue The segue being performed
     *  @param withInfo  The information being passed from the source of the segue
     */
    func destinationPrepareForSegue(_ segue : SegueingInfoStoryboardSegueClass?, withInfo info : SegueingInfoInfoClass)
}

/// Backwards compatability with < 2.0.0 versions of Framework
public typealias SegueingInfoProtocol = SegueingInfoDestination

open class SegueingInfoViewController : SegueingInfoViewControllerClass {
    
    override open func prepare(for segue: SegueingInfoStoryboardSegueClass, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let info = sender {
            self.prepareDestinationViewControllerForSegue(segue, withInfo: info as SegueingInfoInfoClass)
        }
    }
}

