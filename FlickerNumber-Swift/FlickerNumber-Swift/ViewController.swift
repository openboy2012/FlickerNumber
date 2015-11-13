//
//  ViewController.swift
//  FlickerNumber
//
//  Created by DeJohn Dong on 15/10/23.
//  Copyright © 2015年 DDKit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label : UILabel?
    @IBOutlet weak var fnSwitch : UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        label?.fn_setNumber(1234.1234);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.valueChanged(self.fnSwitch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func valueChanged(sender : AnyObject?) {
        if (!(sender as! UISwitch).on) {
            if self.title == "Flicker An Integer Number" {
                label?.fn_setNumber(1235566321)
            } else if self.title == "Flicker A Float Number" {
                label?.fn_setNumber(123456789.123456)
            } else if self.title == "Flicker A Format Number" {
                label?.fn_setNumber(91, format:"$%.2f")
            } else if self.title == "Flicker An Attribute Number" {
                let colorDict = NSDictionary.init(object: UIColor.redColor(), forKey: NSForegroundColorAttributeName)
                let range = NSMakeRange(2, 2)
                let attribute = NSDictionary.fn_dictionary(colorDict , range: range);
                label?.fn_setNumber(48273.38, attributes: attribute)
            } else {
                let colorDict = NSDictionary.init(object: UIColor.redColor(), forKey: NSForegroundColorAttributeName)
                let colorRange = NSMakeRange(1, 2)
                let colorAttribute = NSDictionary.fn_dictionary(colorDict , range: colorRange)
                let fontDict = NSDictionary.init(object: UIFont.systemFontOfSize(12), forKey: NSFontAttributeName)
                let fontRange = NSMakeRange(3, 4)
                let fontAttribute = NSDictionary.fn_dictionary(fontDict, range: fontRange)
                let attributes = NSArray.init(objects: colorAttribute, fontAttribute)
                label?.fn_setNumber(987654.321, format:"￥%.3f", attributes: attributes)
            }
        } else {
            if self.title == "Flicker An Integer Number" {
                label?.fn_setNumber(1234442218, formatter: nil)
            } else if self.title == "Flicker A Float Number" {
                label?.fn_setNumber(123456789.123456, formatter: nil)
            } else if self.title == "Flicker A Format Number" {
                label?.fn_setNumber(1234512, format:"$%@", formatter: nil)
            } else if self.title == "Flicker An Attribute Number" {
                let colorDict = NSDictionary.init(object: UIColor.redColor(), forKey: NSForegroundColorAttributeName)
                let range = NSMakeRange(2, 2)
                let attribute = NSDictionary.fn_dictionary(colorDict , range: range);
                label?.fn_setNumber(12345.212, formatter: nil, attributes: attribute)
            } else {
                let colorDict = NSDictionary.init(object: UIColor.redColor(), forKey: NSForegroundColorAttributeName)
                let colorRange = NSMakeRange(1, 2)
                let colorAttribute = NSDictionary.fn_dictionary(colorDict , range: colorRange)
                let fontDict = NSDictionary.init(object: UIFont.systemFontOfSize(12), forKey: NSFontAttributeName)
                let fontRange = NSMakeRange(3, 4)
                let fontAttribute = NSDictionary.fn_dictionary(fontDict, range: fontRange)
                let attributes = NSArray.init(objects: colorAttribute, fontAttribute)
                let numberFormatter = NSNumberFormatter()
                numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
                numberFormatter.formatterBehavior = NSNumberFormatterBehavior.Behavior10_4
                label?.fn_setNumber(123456.789, format:"%@", formatter:numberFormatter, attributes: attributes)
            }
        }
    }
}

