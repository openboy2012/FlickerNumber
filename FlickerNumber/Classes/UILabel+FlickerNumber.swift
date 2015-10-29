//
//  UILabel+FlickerNumber.swift
//  FlickerNumber
//
//  Created by DeJohn Dong on 15/10/23.
//  Copyright © 2015年 ddkit. All rights reserved.
//

import Foundation
import UIKit

private let rangeIntegerName = "rangeInteger"
private let multipleName = "multiple"
private let beginNumberName = "beginNumber"
private let endNumberName = "endNumber"
private let resultNumberName = "resultNumber"
private let attributeName = "attribute"
private let formatName = "format"
private let frequency = 1.0/30.0

public extension UILabel {
    public func dd_setNumber(number : NSNumber) {
        self.dd_setNumber(number, duration: 1.0, format: nil, numberFomatter: nil, attributes: nil)
    }
    
    public func dd_setNumber(number : NSNumber, duration : NSTimeInterval, format : String?, numberFomatter : NSNumberFormatter?, attributes : AnyObject? ) {
        // check the number type
        assert(number.isKindOfClass(NSNumber), "Number Type is not matched, exit")
        if(!number.isKindOfClass(NSNumber)) {
            text = String(number)
            return
        }
        
        //limit duration is postive number and it is large than 0.3
        var durationTime : NSTimeInterval = fabs(duration) < 0.3 ? 0.3 : fabs(duration)
        
        self.fn_timer?.invalidate()

        //initialize useinfo dict
        let userDict : NSMutableDictionary = NSMutableDictionary()
        
        if format != nil {
            userDict.setValue(format, forKey:formatName)
        }
        
        userDict.setValue(number, forKey: resultNumberName)
        
        //initialize variables
        let beginNumber : NSNumber = 0
        userDict.setValue(beginNumber, forKey: beginNumberName)
        
        fn_setNumber(0)
        var endNumber : Int64 = number.longLongValue;

        //get multiple if number is float & double type
        let multiple = self.multipleForNumber(number, formatString: format)
        
        if multiple > 0 {
            endNumber = Int64(number.doubleValue * Double(multiple))
        }
        //check the number if out of bounds the unsigned int length
        if endNumber >= INT64_MAX {
            self.text = String(format:"%@", number);
            return;
        }
        
        userDict.setValue(multiple, forKey: multipleName)
        userDict.setValue(NSNumber(longLong: endNumber), forKey: endNumberName)
        
        if (Double(endNumber) * frequency)/durationTime < 1.0 {
            durationTime = durationTime * 0.3
        }
        let rangeNumber = (Double(endNumber) * frequency)/durationTime
        userDict.setValue(NSNumber(double: rangeNumber), forKey: rangeIntegerName)
        
        if attributes != nil {
            userDict.setValue(attributes, forKey: attributeName)
        }
        
        if numberFomatter != nil {
            fn_setFormatter(numberFomatter!)
        }
        
        fn_setTimer(NSTimer.scheduledTimerWithTimeInterval(frequency,
            target: self,
            selector: "flickerAnimation:",
            userInfo: userDict,
            repeats: true))
        
        NSRunLoop.currentRunLoop().addTimer(self.fn_timer!, forMode: NSRunLoopCommonModes)
    }
    
    public func flickerAnimation(timer : NSTimer) -> Void {
        let rangeInteger = timer.userInfo?.valueForKey(rangeIntegerName)?.longLongValue;
        let resultInteger = (self.fn_number?.longLongValue)! + rangeInteger!;
        fn_setNumber(NSNumber(longLong: resultInteger))
        
        let multiple = timer.userInfo?.valueForKey(multipleName)?.intValue
        
        if multiple > 0 {
            self.fn_finalNumberDoubleType(timer, multiple: Int(multiple!))
        } else {
            var formatStr : String = String()
            if timer.userInfo?.valueForKey(formatName) != nil {
                formatStr = timer.userInfo?.valueForKey(formatName) as! String
            }
            if formatStr.isEmpty {
                if self.fn_formatter != nil {
                    formatStr = "%@"
                } else {
                    formatStr = "%.0f"
                }
            }
            self.text = self.fn_finalNumber(self.fn_number!, format:formatStr, numberFormatter: self.fn_formatter)
            
            let attributes = timer.userInfo?.valueForKey(attributeName)
            
            if attributes != nil {
                self.drawAttributes(attributes!)
            }
            
            let endNumber : NSNumber = timer.userInfo?.valueForKey(endNumberName) as! NSNumber
            
            if self.fn_number?.longLongValue >= endNumber.longLongValue {
                let resultNumber : NSNumber = timer.userInfo?.valueForKey(resultNumberName) as! NSNumber
                self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: self.fn_formatter)
                
                let attributes = timer.userInfo?.valueForKey(attributeName)
                
                if attributes != nil {
                    self.drawAttributes(attributes!)
                }
                self.fn_timer?.invalidate()
            }
        }
    }
    
    private func fn_finalNumberDoubleType(timer : NSTimer, multiple: Int) {
        var formatStr : String = String()
        if timer.userInfo?.valueForKey(formatName) != nil {
            formatStr = timer.userInfo?.valueForKey(formatName) as! String
        }
        if formatStr.isEmpty {
            if self.fn_formatter != nil {
                formatStr = "%@"
            } else {
                formatStr = String(format: "%%.%df", Int(log10(Float(multiple))))
            }
        }
        let flickerNumber = (self.fn_number?.doubleValue)! / Double(multiple)
        
        self.text = self.fn_finalNumber(flickerNumber, format:formatStr, numberFormatter: self.fn_formatter)
        
        let attributes = timer.userInfo?.valueForKey(attributeName)
        
        if attributes != nil {
            self.drawAttributes(attributes!)
        }
        
        let endNumber : NSNumber = timer.userInfo?.valueForKey(endNumberName) as! NSNumber
        
        if self.fn_number?.longLongValue >= endNumber.longLongValue {
            let resultNumber : NSNumber = timer.userInfo?.valueForKey(resultNumberName) as! NSNumber
            
            self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: self.fn_formatter)
            
            let attributes = timer.userInfo?.valueForKey(attributeName)
            
            if attributes != nil {
                self.drawAttributes(attributes!)
            }
            self.fn_timer?.invalidate()
        }
    }
    
    private func fn_stringFromNumber(number : NSNumber, numberFormatter: NSNumberFormatter) -> String? {
           return numberFormatter.stringFromNumber(number)
    }
    
    private func fn_finalNumber(number : NSNumber, format: String, numberFormatter: NSNumberFormatter?) -> String? {
        var finalString = String()
        if numberFormatter != nil {
            finalString = String(format: format, self.fn_stringFromNumber(number, numberFormatter: numberFormatter!)!)
        } else {
            assert(format.rangeOfString("%@") == nil, "string format type is not matched, please check your format type.")
            finalString = String(format: format, number.doubleValue)
        }
        return finalString;
    }
    
    private func drawAttributes(attributes : AnyObject) -> Void {
        if attributes.isKindOfClass(NSDictionary) {
            let range = attributes.valueForKey(fnRangeName)?.rangeValue
            let attribute = attributes.valueForKey(fnAttributeName)
            self.addAttributes(attribute!, range : range!)
        } else if attributes.isKindOfClass(NSArray) {
            for attribute in attributes as! NSArray {
                let range = attribute.valueForKey(fnRangeName)?.rangeValue
                let attri = attribute.valueForKey(fnAttributeName)
                self.addAttributes(attri!, range : range!)
            }
        }
    }
    
    private func addAttributes(attributes : AnyObject, range : NSRange) -> Void {
        let attributedStr = NSMutableAttributedString(attributedString : self.attributedText!)
        if range.location + range.length < attributedStr.length  {
            attributedStr.addAttributes(attributes as! [String : AnyObject], range: range)
        }
        self.attributedText = attributedStr;
    }
    
    private func multipleForNumber(number : NSNumber, formatString : String?) -> Int {
        var newNumber = number;
        if formatString != nil && formatString!.rangeOfString("%@") == nil {
            let fStr : String = self.regexNumberFormat(formatString!)
            let formatNumberStr : String = String(fStr, number.floatValue)
            if formatNumberStr.rangeOfString(".") != nil {
                let fn_range = formatNumberStr.rangeOfString(".")
                let index = fn_range?.startIndex.advancedBy(1)
                let subStr : String = formatNumberStr.substringFromIndex(index!)
                let length : Int = subStr.characters.count < 6 ? subStr.characters.count : 6
                let padding = log10f(Float(length))
                newNumber = (formatNumberStr as NSString).floatValue + padding
            }
        }
        
        let resultStr = String(format: "%@", newNumber)
        if resultStr.rangeOfString(".") != nil {
            let re_range = resultStr.rangeOfString(".")
            let index = re_range?.startIndex.advancedBy(1)
            let subStr : String = resultStr.substringFromIndex(index!)
            // Max Multiple is 6
            let length : Int = subStr.characters.count >= 6 ? 6 : subStr.characters.count
            return Int(powf(10, Float(length)))
        }
        return 0
    }
    
    private func regexNumberFormat(format : String) -> String {
        let patternStr : String = "^%((\\d+.\\d+)|(\\d+).|(.\\d+))f$"
        do {
            let regex : NSRegularExpression =  try NSRegularExpression(pattern: patternStr, options: NSRegularExpressionOptions.CaseInsensitive)
            let fRange = NSMakeRange(0, format.characters.count)
            let match : NSTextCheckingResult = regex.firstMatchInString(format, options: NSMatchingOptions.ReportProgress, range: fRange)!
            let result : NSString = (format as NSString).substringWithRange(match.range);
            return result as String;
        } catch {
        }
        return "%f"
    }
}

private var flickerNumberKey : Void?
private var flickerNumberFormatterKey : Void?
private var flickerTimerKey : Void?

public extension UILabel {
    public var fn_number : NSNumber? {
        get {
            return objc_getAssociatedObject(self, &flickerNumberKey) as? NSNumber
        }
    }
    
    private func fn_setNumber(number : NSNumber) {
        objc_setAssociatedObject(self, &flickerNumberKey, number, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    public var fn_formatter : NSNumberFormatter? {
        get {
            return objc_getAssociatedObject(self, &flickerNumberFormatterKey) as? NSNumberFormatter
        }
    }
    
    private func fn_setFormatter(formatter : NSNumberFormatter) {
        objc_setAssociatedObject(self, &flickerNumberFormatterKey, formatter, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    public var fn_timer : NSTimer? {
        get {
            return objc_getAssociatedObject(self, &flickerTimerKey) as? NSTimer
        }
    }
    
    private func fn_setTimer(timer : NSTimer) {
        objc_setAssociatedObject(self, &flickerTimerKey, timer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

public let fnAttributeName = "attributeKey"
public let fnRangeName = "rangeKey"

public extension NSDictionary {
    public static func fn_dictionary(attribute : NSDictionary, range : NSRange) -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setObject(attribute , forKey: fnAttributeName)
        let rangeValue = NSValue(range: range)
        dictionary.setObject(rangeValue, forKey: fnRangeName)
        return dictionary
    }
}





