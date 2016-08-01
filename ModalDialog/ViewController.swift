//
//  ViewController.swift
//  ModalDialog
//
//  Created by zhuanglingfeng on 7/29/16.
//  Copyright © 2016 TopCoder. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let nav = self.navigationController{
            var leftButton = UIBarButtonItem.init(title: "left", style: .Bordered, target: nil, action: nil)
            self.navigationItem.leftBarButtonItem = leftButton;
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addview2stackviewTouch(sender: AnyObject) {
        for view in stackViewControl.subviews
        {
            //            stackViewControl.removeArrangedSubview(view)
        }
        
        //        var button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        let button = UIButton(type: .InfoLight)
        button.setTitle("BUTT", forState: .Normal);
        //        stackViewControl.addArrangedSubview(button)
        
        //        initViewControllerFromStoryboardThenPresent("subViewFirstSecond", isPopup: true)
        let controller = initViewControllerFromStoryboard("subViewFirstSecond")!;
        controller.printSelf()
        print("\(controller.getTypeString())")
        
        let view = (controller.view)!;
        //        view.sizeToFit();
        view.userInteractionEnabled=true;
        view.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.frame = CGRectMake(40, 50, view.bounds.width, view.bounds.height)
        view.backgroundColor = UIColor.redColor()
        //        view
        print("\(view.getTypeString())")
        
        self.addChildViewController(controller)
        self.view.addSubview(view)
        
        //        stackViewControl.addArrangedSubview(view)
        //        stackViewControl.layoutIfNeeded();
    }
    
    @IBOutlet weak var stackViewControl: UIStackView!
    
    @IBAction func buttonTouchPopup(sender: AnyObject) {
        let popup : UIViewController! =  self.storyboard?.instantiateViewControllerWithIdentifier("ViewControllerPopup")
        //        popup.view.frame = CGRect(x: 0,y: 0,width: 200,height: 200);
        popup.preferredContentSize = CGSize(width: 600,height: 300);
        popup.modalPresentationStyle = .FormSheet;
        
        self.presentViewController(popup, animated: true, completion: nil);
    }
    
    // https://dev.splashthat.com/api/v2/crm/events?page=1&per_page=20&updated_since=2015-01-10+22%3A03%3A56&event_types=false&event_tags=false&user_info=false&program=false
    
    @IBOutlet weak var buttonPopup: UIButton!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTouch(sender: AnyObject)
    {
        let url = NSURL(string: "https://dev.splashthat.com/api/v2/crm/events?page=1&per_page=20&updated_since=2015-01-10+22%3A03%3A56&event_types=false&event_tags=false&user_info=false&program=false")!
        
        //        self.doURLSync(url.absoluteString)?.printSelf();
        //        return;
        
        let request = NSMutableURLRequest(URL: url)
        
        request.addValue("SplashCRM b422138c82bfc49a36c88611fe4368d87d5f6226", forHTTPHeaderField: "AUTHORIZATION1");
        
        print("\(request)");
        print("\(request.allHTTPHeaderFields)");
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let response = response, data = data {
                var httpResponse = response as! NSHTTPURLResponse;
                print("self = \(String(httpResponse.dynamicType))")
                print("description = \(httpResponse.description)")
                print("statusCode = \(httpResponse.statusCode)")
                
                do
                {
                    let jsonToDictionary:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSDictionary;
                    
                    let statusObject = jsonToDictionary.valueForKey("status");
                    let messageObject = jsonToDictionary.valueForKey("message");
                    
                    let statusString = String(statusObject!);
                    let messageString = String(messageObject!);
                    
                    print("statusObject = \(statusObject)")
                    print("messageObject = \(messageObject)")
                    
                    print("statusString = \(statusString)")
                    print("messageString = \(messageString)")
                    
                    print("statusString.type = \(self.getTypeString(statusObject!))")
                    print("messageString.type = \(self.getTypeString(messageObject!))")
                    print("jsonToDictionary.type = \(self.getTypeString(jsonToDictionary))")
                    
                    print("statusObject.type = \(String(statusObject.dynamicType))")
                    print("messageObject.type = \(String(messageObject.dynamicType))")
                    
                    print("statusObject!.type = \(String(statusObject!.dynamicType))")
                    print("messageObject!.type = \(String(messageObject!.dynamicType))")
                    
                    print(jsonToDictionary)
                }
                catch {
                }
                print(response)
                print(String(data: data, encoding: NSUTF8StringEncoding))
            } else {
                print(error)
            }
        }
        
        task.resume()
        
        return;
        
        let alertUI: UIAlertView = UIAlertView.init();
        alertUI.delegate = self;
        alertUI.addButtonWithTitle("OK");
        alertUI.addButtonWithTitle("NOT OK");
        alertUI.show();
    }
    
    internal func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int)
    {
        print("\(buttonIndex) clicked");
    }
}

class Utility{
    class func classNameAsString(obj: Any) -> String {
        return String(obj.dynamicType).componentsSeparatedByString("__").last!
    }
}