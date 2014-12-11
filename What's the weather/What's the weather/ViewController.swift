//
//  ViewController.swift
//  What's the weather
//
//  Created by Talha Qamar on 12/10/14.
//  Copyright (c) 2014 Talha Qamar. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    var str: String = ""
    @IBOutlet var input: UITextField!
   
    @IBOutlet var label: UILabel!
    
    @IBAction func button(sender: AnyObject) {
    
        self.view.endEditing(true)
        var urlString = "http://www.weather-forecast.com/locations/" +
        input.text.stringByReplacingOccurrencesOfString(" ", withString: "") +
        "/forecasts/latest"
  //  println(urlString)
    
        
        var url = NSURL(string: urlString)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
            {
                (data, response, error) in
                
                
                var urlcontent = NSString(data: data, encoding: NSUTF8StringEncoding)
                var stringvar = self.input.text + " 1 &ndash; 3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                if (urlcontent!.containsString(stringvar as NSString))
              {
                var contentArray = urlcontent?.componentsSeparatedByString(self.input.text + " 1 &ndash; 3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
               
                var newcontentArray = contentArray?[1].componentsSeparatedByString("</span>");
                
                  //println(newcontentArray[0])
                
               
               self.str = newcontentArray![0] as String
               self.label.text = String(self.str.stringByReplacingOccurrencesOfString("&deg;", withString: "º"))
                
                }
              else  {
                self.label.text = "City not found. Try again"
                }
                //    println(newcontentArray![0] as String)
                
        }
        task.resume()
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     label.text = ""
   
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

