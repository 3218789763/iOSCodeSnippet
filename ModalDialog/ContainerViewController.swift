//
//  ContainerViewController.swift
//  ModalDialog
//
//  Created by zhuanglingfeng on 8/1/16.
//  Copyright © 2016 TopCoder. All rights reserved.
//

import Foundation
import UIKit

class ContainerViewController:UIViewController{
    
    @IBAction func segmentedControlTouchUpInside(sender: AnyObject) {
    alert(segmentControl1.titleForSegmentAtIndex(segmentControl1.selectedSegmentIndex)!);
    }
    
    @IBAction func buttonTouches(sender: AnyObject) {
        alert("TTTT");
    }
    @IBAction func segmentValueChanged(sender: AnyObject) {
        alert1(segmentControl1.titleForSegmentAtIndex(segmentControl1.selectedSegmentIndex)!);
    }
    @IBOutlet weak var segmentControl1: UISegmentedControl!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button1: UIButton!
}