//
//  PassBaseViewController.swift
//  SegueingInfo
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

class PassBaseViewController : SegueingInfoViewControllerClass {
    
    @IBOutlet weak var passField : UITextField?
    func ensurePassField() -> UITextField {
        
        guard let passField = self.passField else {
            assertionFailure("passField Outlet must be attached")
            return self.passField!
        }
        
        return passField
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = self.ensurePassField()
    }
}

extension PassBaseViewController {
    
    @IBAction func pass(_ sender : AnyObject?) {
        
        self.performSegue(withIdentifier: "pass", sender: self.ensurePassField().text)
    }
}
