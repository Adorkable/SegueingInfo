//
//  FirstNavContainedViewController.swift
//  SegueingInfo
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

import UIKit

import SegueingInfo

class FirstNavContainedViewController: SegueingInfoViewController {

    @IBOutlet weak var passField : UITextField?
    func ensurePassField() -> UITextField {
        
        guard let passField = self.passField else {
            assertionFailure("passField Outlet must be attached")
            return self.passField!
        }
        
        return passField
    }
    func ensurePassFieldText() -> String {
        
        let passField = self.ensurePassField()
        
        guard let text = passField.text else {
            assertionFailure("passField.text is nil")
            return ""
        }
        
        return text
    }
    
    fileprivate var received : SegueingInfoInfoClass?
    @IBOutlet weak var receivedView : UIView?
    func ensureReceivedView() -> UIView {
        
        guard let receivedView = self.receivedView else {
            assertionFailure("receivedView Outlet must be attached")
            return self.receivedView!
        }
        
        return receivedView
    }
    @IBOutlet weak var receivedLabel : UILabel?
    func ensureReceivedLabel() -> UILabel {
        
        guard let receivedLabel = self.receivedLabel else {
            assertionFailure("receivedLabel Outlet must be attached")
            return self.receivedLabel!
        }
        
        return receivedLabel
    }
    func ensureReceivedLabelText() -> String {
        
        let receivedLabel = self.ensureReceivedLabel()
        
        guard let text = receivedLabel.text else {
            assertionFailure("receivedLabel.text is nil")
            return ""
        }
        
        return text
    }
    
    @IBInspectable var add : String?
    func guaranteeAdd() -> String {
        
        guard let add = self.add else {
            return "😘"
        }
        
        return add
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let receivedView = self.ensureReceivedView()
        let passField = self.ensurePassField()
        
        if let received = self.received {
            self.received = nil
            
            receivedView.isHidden = false
            
            let receivedLabel = self.ensureReceivedLabel()
            receivedLabel.text = "\(received)"
            passField.text = "\(received)"
        } else {
            
            receivedView.isHidden = true
        }
    }
}

extension FirstNavContainedViewController {

    @IBAction func pass(_ sender : AnyObject?) {
        
        // TODO: tell user they need to set the value
        self.performSegue(withIdentifier: "pass", sender: "\(self.ensurePassFieldText()) \(self.guaranteeAdd())")
    }
}

extension FirstNavContainedViewController : SegueingInfoDestination {
    
    func destinationPrepareForSegue(_ segue: SegueingInfoStoryboardSegueClass?, withInfo info: SegueingInfoInfoClass) {
        
        if let receivedView = self.receivedView,
            let receivedLabel = self.receivedLabel,
            let passField = self.passField {
                
                receivedView.isHidden = false
                receivedLabel.text = "\(info)"
                passField.text = "\(info)"
        } else {
            self.received = info
        }
    }
}
