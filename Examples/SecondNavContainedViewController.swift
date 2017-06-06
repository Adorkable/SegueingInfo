//
//  SecondNavContainedViewController.swift
//  SegueingInfo
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

import UIKit

import SegueingInfo

class SecondNavContainedViewController: SegueingInfoViewController {

    fileprivate var received : SegueingInfoInfoClass?
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
        
        if let received = self.received {
            self.received = nil

            let receivedLabel = self.ensureReceivedLabel()
            receivedLabel.text = "\(received)"
        }
    }
}

extension SecondNavContainedViewController {
    
    @IBAction func pass(_ sender : AnyObject?) {
        
        // TODO: tell user they need to set the value
        self.performSegue(withIdentifier: "pass", sender: "\(self.ensureReceivedLabelText()) \(self.guaranteeAdd())")
    }
    
    @IBAction func popViewController(_ sender : AnyObject?) {
        
        self.navigationController?.popViewControllerAnimated(true, withInfo: "\(self.ensureReceivedLabelText()) \(self.guaranteeAdd())" as SegueingInfoInfoClass)
    }
    
    @IBAction func popToViewController(_ sender : AnyObject?) {
        
        guard let popDestination = self.navigationController?.viewControllers.first else {
            assertionFailure("No first View Controller in Navigation Controller")
            return
        }
        self.navigationController?.popToViewController(popDestination, animated: true, withInfo: "\(self.ensureReceivedLabelText()) \(self.guaranteeAdd())" as SegueingInfoInfoClass)
    }
    
    @IBAction func popToRootViewController(_ sender : AnyObject?) {
        
        self.navigationController?.popToRootViewController(true, withInfo: "\(self.ensureReceivedLabelText()) \(self.guaranteeAdd())" as SegueingInfoInfoClass)
    }
}

extension SecondNavContainedViewController : SegueingInfoDestination {
    
    func destinationPrepareForSegue(_ segue: SegueingInfoStoryboardSegueClass?, withInfo info: SegueingInfoInfoClass) {
        
        if let receivedLabel = self.receivedLabel {
                
            receivedLabel.text = "\(info)"
        } else {
            self.received = info
        }
    }
}
