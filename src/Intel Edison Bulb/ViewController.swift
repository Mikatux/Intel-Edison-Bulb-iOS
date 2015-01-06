//
//  ViewController.swift
//  Intel Edison Bulb
//
//  Created by Alexis Soto on 16/11/2014.
//  Copyright (c) 2014 Alexis Soto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ipField: UITextField!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var outputColor: UIView!
    @IBOutlet weak var modes: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputColor.layer.masksToBounds = true
        outputColor.layer.cornerRadius = 64
        
        let r = CGFloat(redSlider.value/255)
        let g = CGFloat(greenSlider.value/255)
        let b = CGFloat(blueSlider.value/255)
        
        outputColor.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func redUp(sender: AnyObject) {
        let r = CGFloat(redSlider.value/255)
        let g = CGFloat(greenSlider.value/255)
        let b = CGFloat(blueSlider.value/255)
        
        outputColor.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        let url = NSURL(string: "http://\(ipField.text):8080/change?red=\(redSlider.value)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()

        print("RedUp\n")
    }
    
    @IBAction func greenUp(sender: AnyObject) {
        let r = CGFloat(redSlider.value/255)
        let g = CGFloat(greenSlider.value/255)
        let b = CGFloat(blueSlider.value/255)
        
        outputColor.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        let url = NSURL(string: "http://\(ipField.text):8080/change?green=\(greenSlider.value)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
        print("GreenUp\n")
    }
    
    @IBAction func blueUp(sender: AnyObject) {
        let r = CGFloat(redSlider.value/255)
        let g = CGFloat(greenSlider.value/255)
        let b = CGFloat(blueSlider.value/255)
        
        outputColor.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        let url = NSURL(string: "http://\(ipField.text):8080/change?blue=\(blueSlider.value)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        print("BlueUp\n")
    }
    
    func send() {
        if (ipField.text == nil) {
            print("No IP valid")
            return
        }
        else {
            let r = CGFloat(redSlider.value/255)
            let g = CGFloat(greenSlider.value/255)
            let b = CGFloat(blueSlider.value/255)
            
            outputColor.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
            let url = NSURL(string: "http://\(ipField.text):8080/change?red=\(redSlider.value)&green=\(greenSlider.value)&blue=\(blueSlider.value)")
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
                (data, response, error) in
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
            }
            
            task.resume()
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}

