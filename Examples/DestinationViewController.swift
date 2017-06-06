//
//  DestinationViewController.swift
//  SegueingInfo
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

import UIKit

import SegueingInfo

class DestinationViewController: SegueingInfoViewControllerClass {
    
    fileprivate var received : SegueingInfoInfoClass?
    @IBOutlet weak var receivedLabel : UILabel?
    func ensureReceivedLabel() -> UILabel {
        
        guard let receivedLabel = self.receivedLabel else {
            assertionFailure("receivedLabel Outlet must be attached")
            return self.receivedLabel!
        }
        
        return receivedLabel
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

extension DestinationViewController : SegueingInfoDestination {

    func destinationPrepareForSegue(_ segue: SegueingInfoStoryboardSegueClass?, withInfo info: SegueingInfoInfoClass) {
     
        // We cannot guarantee whether this will be called before, during or after viewDidLoad
        if let receivedLabel = self.receivedLabel {
            receivedLabel.text = "\(info)"
        } else {
            self.received = info
        }
    }
}
