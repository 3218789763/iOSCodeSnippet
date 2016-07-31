//
//  File.swift
//  ModalDialog
//
//  Created by zhuanglingfeng on 7/29/16.
//  Copyright © 2016 TopCoder. All rights reserved.
//

import UIKit
import Foundation

class ViewControllerPopup: UIViewController,UIAlertViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnReturnTouched(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
