//
//  ViewController.swift
//  FlickerNumber
//
//  Created by DeJohn Dong on 15/10/23.
//  Copyright © 2015年 DDKit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var fnSwitch : UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        label?.fn_setNumber(1234.1234)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.valueChanged(self.fnSwitch)
    }
    
    @IBAction func valueChanged(_ sender : UISwitch) {
        if sender.isOn {
            if self.title == "Flicker An Integer Number" {
                label?.fn_setNumber(1234442218, formatter: nil)
            } else if self.title == "Flicker A Float Number" {
                label?.fn_setNumber(123456789.123456, formatter: nil)
            } else if self.title == "Flicker A Format Number" {
                label?.fn_setNumber(1234512, format:"$%@", formatter: nil)
            } else if self.title == "Flicker An Attribute Number" {
                let colorDict = [NSAttributedStringKey.foregroundColor: UIColor.red]
                let range = NSRange(location: 2, length: 2)
                let attribute = NSDictionary.fn_dictionary(colorDict, range: range)
                label?.fn_setNumber(12345.212, formatter: nil, attributes: attribute)
            } else {
                let colorDict = [NSAttributedStringKey.foregroundColor: UIColor.red]
                let colorRange = NSRange(location: 1, length: 2)
                let colorAttribute = NSDictionary.fn_dictionary(colorDict, range: colorRange)
                let fontDict = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]
                let fontRange = NSRange(location: 3, length: 4)
                let fontAttribute = NSDictionary.fn_dictionary(fontDict, range: fontRange)
                let attributes = [colorAttribute, fontAttribute]
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .currency
                numberFormatter.formatterBehavior = .behavior10_4
                label?.fn_setNumber(123456.789, format:"%@", formatter:numberFormatter, attributes: attributes)
            }

        } else {
            if self.title == "Flicker An Integer Number" {
                label?.fn_setNumber(1235566321)
            } else if self.title == "Flicker A Float Number" {
                label?.fn_setNumber(123456789.123456)
            } else if self.title == "Flicker A Format Number" {
                label?.fn_setNumber(91, format:"$%.2f")
            } else if self.title == "Flicker An Attribute Number" {
                let colorDict = [NSAttributedStringKey.foregroundColor: UIColor.red]
                let range = NSRange(location: 2, length: 2)
                let attribute = NSDictionary.fn_dictionary(colorDict, range: range)
                label?.fn_setNumber(48273.38, attributes: attribute)
            } else {
                let colorDict = [NSAttributedStringKey.foregroundColor: UIColor.red]
                let colorRange = NSRange(location: 1, length: 2)
                let colorAttribute = NSDictionary.fn_dictionary(colorDict, range: colorRange)
                let fontDict = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]
                let fontRange = NSRange(location: 3, length: 4)
                let fontAttribute = NSDictionary.fn_dictionary(fontDict, range: fontRange)
                let attributes = [colorAttribute, fontAttribute]
                label?.fn_setNumber(987654.321, format:"￥%.3f", attributes: attributes)
            }
        }
    }
}

