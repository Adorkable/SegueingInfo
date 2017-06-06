//
//  StaticCallViewController.swift
//  SegueingInfoExamples
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

import SegueingInfo

class StaticCallViewController: PassBaseViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension StaticCallViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let info = sender {
            UIViewController.prepareDestinationViewControllerForSegue(segue, withInfo: info as SegueingInfoInfoClass)
        }
    }
}

