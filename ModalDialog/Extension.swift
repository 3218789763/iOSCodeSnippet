//
//  Extension.swift
//  ModalDialog
//
//  Created by zhuanglingfeng on 7/31/16.
//  Copyright © 2016 TopCoder. All rights reserved.
//

import Foundation

extension NSObject{
    func printSelf(){
        print("\(self)");
    }
    
    func getTypeString() -> String{
        return String(self.dynamicType);
    }
    
    func getTypeString(object:AnyObject) -> String{
        return String(object.dynamicType);
    }
    
    func NSData2(data:NSData) throws -> NSDictionary?{
        let jsonToDictionary:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSDictionary;
        return jsonToDictionary;
    }
    
    func NSData2DictionaryWithoutThrows(data:NSData) -> NSDictionary?{
        do{
            return try NSData2(data);
        }
        catch {
            return nil;
        }
    }
    
    func SubstringString(index:Int, length:Int, string:String)->String{
        return (string as NSString).substringWithRange(NSMakeRange(index,length));
    }
    
    func SubstringNSString(index:Int, length:Int, string:NSString)->NSString{
        return string.substringWithRange(NSMakeRange(index,length));
    }
    
    func doURLAsync(url:String , completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void){
        let url = NSURL(string: url)!
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
                
                completionHandler(data, response, error);
            }
        };
        
        task.resume();
    }
    
    func doURLSync(url:String) -> NSURLResponse?{
        let dataSemaphore = dispatch_semaphore_create(0)
        
        let url = NSURL(string: url)!
        let request = NSMutableURLRequest(URL: url)
        var responseForRet:NSURLResponse? = nil;
        
        request.addValue("SplashCRM b422138c82bfc49a36c88611fe4368d87d5f6226", forHTTPHeaderField: "AUTHORIZATION1");
        
        print("\(request)");
        print("\(request.allHTTPHeaderFields)");
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let response = response, data = data {
                responseForRet = response;
                
                var httpResponse = response as! NSHTTPURLResponse;
                print("self = \(String(httpResponse.dynamicType))")
                print("description = \(httpResponse.description)")
                print("statusCode = \(httpResponse.statusCode)")
                
                //                completionHandler(data, response, error);
                dispatch_semaphore_signal(dataSemaphore);
            }
        };
        
        task.resume();
        
        dispatch_semaphore_wait(dataSemaphore, DISPATCH_TIME_FOREVER)
        print("SYNC")
        
        return responseForRet;
    }
    
    
    
    func doJSONURLSync(url:String) -> NSURLResponse?{
        let dataSemaphore = dispatch_semaphore_create(0)
        
        let url = NSURL(string: url)!
        let request = NSMutableURLRequest(URL: url)
        var responseForRet:NSURLResponse? = nil;
        
        request.addValue("SplashCRM b422138c82bfc49a36c88611fe4368d87d5f6226", forHTTPHeaderField: "AUTHORIZATION1");
        
        print("\(request)");
        print("\(request.allHTTPHeaderFields)");
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let response = response, data = data {
                responseForRet = response;
                
                var httpResponse = response as! NSHTTPURLResponse;
                print("self = \(String(httpResponse.dynamicType))")
                print("description = \(httpResponse.description)")
                print("statusCode = \(httpResponse.statusCode)")
                
                //                completionHandler(data, response, error);
                dispatch_semaphore_signal(dataSemaphore);
            }
        };
        
        task.resume();
        
        dispatch_semaphore_wait(dataSemaphore, DISPATCH_TIME_FOREVER)
        print("SYNC")
        
        return responseForRet;
    }
}
