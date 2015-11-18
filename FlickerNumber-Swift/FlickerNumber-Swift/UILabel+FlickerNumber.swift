//
//  UILabel+FlickerNumber.swift
//  FlickerNumber
//
//  Created by DeJohn Dong on 15/10/23.
//  Copyright © 2015年 DDKit. All rights reserved.
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
     /**
     Flicker a number without other effects.
     
     - parameter number: The number for flicker animation, can't be `nil`.
     */
    public func fn_setNumber(number: NSNumber) {
        self.fn_setNumber(number, format: nil)
    }
    
     /**
     Flicker a number with number-formatter style. You can use the `NSNumberFormatterCurrencyStyle` number-formatter style, the number will flicker animation as `$1,023.12`.
     
     - parameter number:    The number for flicker animation.
     - parameter formatter: The number-formatter style. If this parameter is `nil`, the method should use the default number-formatter style -- `NSNumberFormatterDecimalStyle`, so `1000000` will be '1,000,000'.
     */
    public func fn_setNumber(number: NSNumber, formatter: NSNumberFormatter?) {
        self.fn_setNumber(number, formatter:formatter, attributes: nil)
    }
    
     /**
     Flicker a number in during time.
     
     - parameter number:   The number for flicker animation.
     - parameter duration: The flicker animation during time, can't be a minus.
     */
    public func fn_setNumber(number: NSNumber, duration: NSTimeInterval) {
        self.fn_setNumber(number, duration: duration, format: nil)
    }

     /**
     Flicker a number in during time with number-formatter style.
     
     - parameter number:    The number for flicker animation.
     - parameter duration:  The flicker animation during time.
     - parameter formatter: The number-formatter style.
     */
    public func fn_setNumber(number: NSNumber, duration: NSTimeInterval, formatter: NSNumberFormatter?) {
        self.fn_setNumber(number, duration: duration, formatter: formatter, attributes: nil)
    }
    
    /**
     Flicker a number with string-format style. like this: `Today's income: $200.00`.
     
     - parameter number: The number for flicker animation.
     - parameter format: The string-format String. If you set this parameter is `nil`, the method is same to `fn_setNumber:`.
     */
    public func fn_setNumber(number: NSNumber, format: String?) {
        self.fn_setNumber(number, format: format, attributes: nil)
    }
    
    /**
     Flicker a number with string-format String & number-formatter style.
     
     - parameter number:    The number for flicker animation.
     - parameter format:    The string-format String.
     - parameter formatter: The number-formatter style.
     */
    public func fn_setNumber(number: NSNumber, format: String?, formatter: NSNumberFormatter?) {
        self.fn_setNumber(number, format: format, formatter: formatter, attributes: nil)
    }
    
    /**
     Flicker a number with attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries), character attributes for text. Only can attributed the number because there are no string-format String. Use this parameter the number text can be colorful and wonderful. If you set this parameter is `nil`, the same to method `fn_setNumber:`.
     */
    public func fn_setNumber(number: NSNumber, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: 1.0, attributes: attributes)
    }
    
    /**
      Flicker a number with number-formatter style & attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(number: NSNumber, formatter: NSNumberFormatter?, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: 1.0, formatter: formatter, attributes: attributes)
    }
    
    /**
     Flicker a number with string-format String & attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter format:     The string-format String.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries). You can attributed(s) the number or string-format String.
     */
    public func fn_setNumber(number: NSNumber, format: String?, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: 1.0, format: format, attributes: nil)
    }
    
    /**
     Flicker a number in dafault during time(1.0s) with all effects.
     
     - parameter number:     The number for flicker animation.
     - parameter format:     The string-format String.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries).You can attributed(s) the number or string-format String.
     */
    public func fn_setNumber(number: NSNumber, format: String?, formatter: NSNumberFormatter?, attributes: AnyObject?) {
        if formatter == nil {
            self.fn_setNumber(number, duration: 1.0, format: format, numberFomatter: fn_defaultNumberFormatter(), attributes: attributes)
        } else {
            self.fn_setNumber(number, duration: 1.0, format: format, numberFomatter: formatter, attributes: attributes)
        }
    }
    
    /**
     Flicker a number in during time with string-format String.
     
     - parameter nubmer:   The number for flicker animation.
     - parameter duration: The flicker animation during time.
     - parameter format:   The number-formatter style.
     */
    public func fn_setNumber(nubmer: NSNumber, duration: NSTimeInterval, format: String?) {
        self.fn_setNumber(nubmer, duration: duration, format: format, numberFomatter: nil, attributes: nil)
    }
    
    /**
     Flicker a number in during time with string-format String & number-formatter style.
     
     - parameter nubmer:    The number for flicker animation.
     - parameter duration:  The flicker animation during time.
     - parameter format:    The string-format String.
     - parameter formatter: The number-formatter style.
     */
    public func fn_setNumber(nubmer: NSNumber, duration: NSTimeInterval, format: String?, formatter: NSNumberFormatter?) {
        if formatter == nil {
            self.fn_setNumber(nubmer, duration: duration, format: format, numberFomatter: fn_defaultNumberFormatter(), attributes: nil)
        } else {
            self.fn_setNumber(nubmer, duration: duration, format: format, numberFomatter: formatter, attributes: nil)
        }
    }
    
    /**
     Flicker a number in during time with attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter duration:   The flicker animation during time.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(number: NSNumber, duration: NSTimeInterval, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: duration, format: nil, attributes: attributes);
    }
    
    /**
     Flicker a number in during time with attributed(s) property of number & number-formatter style.
     
     - parameter number:     The number for flicker animation.
     - parameter duration:   The flicker animation during time.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(number: NSNumber, duration: NSTimeInterval, formatter: NSNumberFormatter?, attributes: AnyObject?) {
        if formatter == nil {
            self.fn_setNumber(number, duration: duration, format: nil, numberFomatter: fn_defaultNumberFormatter(), attributes: attributes)
        } else {
            self.fn_setNumber(number, duration: duration, format: nil, numberFomatter: formatter, attributes: attributes)
        }
    }

    /**
     Flicker a number in during time with effects except number-formatter style.
     
     - parameter number:     The number for flicker animation.
     - parameter duration:   The flicker animation during time.
     - parameter format:     The string-format String.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries). You can set string-format String OR number attributes both.
     */
    public func fn_setNumber(number: NSNumber, duration: NSTimeInterval, format: String?, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: duration, format: format, numberFomatter: nil, attributes: attributes)
    }
    
    /**
     Flicker a number in during time with all the effects. You can attributed(s) the number or string-format String. You also can set the number number-fomatter style.
     
     - parameter number:         The number for flicker animation.
     - parameter duration:       The flicker animation during time.
     - parameter format:         The string-format String.
     - parameter numberFomatter: The number-formatter style.
     - parameter attributes:     The attributed string set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(number: NSNumber, duration: NSTimeInterval, format: String?, numberFomatter: NSNumberFormatter?, attributes: AnyObject? ) {
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
        let userDict: NSMutableDictionary = NSMutableDictionary()
        
        if format != nil {
            userDict.setValue(format, forKey:formatName)
        }
        
        userDict.setValue(number, forKey: resultNumberName)
        
        //initialize variables
        let beginNumber : NSNumber = 0
        userDict.setValue(beginNumber, forKey: beginNumberName)
        
        set_fnNumber(0)
        var endNumber: Int64 = number.longLongValue;

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
        
        fn_setFormatter(nil)
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
    
    //Flicker animation method implemetation.
    public func flickerAnimation(timer: NSTimer) -> Void {
        if timer.userInfo?.valueForKey(rangeIntegerName)?.floatValue >= 1.0 {
            let rangeInteger = timer.userInfo?.valueForKey(rangeIntegerName)?.longLongValue;
            let resultInteger = (self.fn_number?.longLongValue)! + rangeInteger!;
            set_fnNumber(NSNumber(longLong: resultInteger))
        } else {
            let rangeInteger = timer.userInfo?.valueForKey(rangeIntegerName)?.floatValue;
            let resultInteger = (self.fn_number?.floatValue)! + rangeInteger!;
            set_fnNumber(NSNumber(float: resultInteger))
        }
        
        let multiple = timer.userInfo?.valueForKey(multipleName)?.intValue
        
        if multiple > 0 {
            self.fn_finalNumberDoubleType(timer, multiple: Int(multiple!))
        } else {
            var formatStr: String = String()
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
                let resultNumber: NSNumber = timer.userInfo?.valueForKey(resultNumberName) as! NSNumber
                self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: self.fn_formatter)
                
                let attributes = timer.userInfo?.valueForKey(attributeName)
                
                if attributes != nil {
                    self.drawAttributes(attributes!)
                }
                self.fn_timer?.invalidate()
            }
        }
    }
    
    //Get the default number-formatter style.
    private func fn_defaultNumberFormatter() -> NSNumberFormatter {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.formatterBehavior = NSNumberFormatterBehavior.BehaviorDefault
        return numberFormatter;
    }
    
    //Show the animation when the number is double type.
    private func fn_finalNumberDoubleType(timer: NSTimer, multiple: Int) {
        var formatStr: String = String()
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
        
        let endNumber: NSNumber = timer.userInfo?.valueForKey(endNumberName) as! NSNumber
        
        if self.fn_number?.longLongValue >= endNumber.longLongValue {
            let resultNumber: NSNumber = timer.userInfo?.valueForKey(resultNumberName) as! NSNumber
            
            self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: self.fn_formatter)
            
            let attributes = timer.userInfo?.valueForKey(attributeName)
            
            if attributes != nil {
                self.drawAttributes(attributes!)
            }
            self.fn_timer?.invalidate()
        }
    }
    
    //Get the string from number with number-formatter style.
    private func fn_stringFromNumber(number: NSNumber, numberFormatter: NSNumberFormatter) -> String? {
           return numberFormatter.stringFromNumber(number)
    }
    
    //Get the result string to do animation.
    private func fn_finalNumber(number : NSNumber, format: String, numberFormatter: NSNumberFormatter?) -> String? {
        var finalString = String()
        if numberFormatter != nil {
            finalString = String(format: format, self.fn_stringFromNumber(number, numberFormatter: numberFormatter!)!)
        } else {
            assert(format.rangeOfString("%@") == nil, "string format type is not matched, please check your format type.")
            if format.rangeOfString("%d") != nil {
                finalString = String(format: format, number.longLongValue)
            } else {
                finalString = String(format: format, number.doubleValue)
            }
        }
        return finalString;
    }
    
    //Add the attributes into the mutable attributed string.
    private func drawAttributes(attributes: AnyObject) -> Void {
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
    
    private func addAttributes(attributes: AnyObject, range: NSRange) -> Void {
        let attributedStr = NSMutableAttributedString(attributedString : self.attributedText!)
        if range.location + range.length < attributedStr.length  {
            attributedStr.addAttributes(attributes as! [String : AnyObject], range: range)
        }
        self.attributedText = attributedStr;
    }
    
    /**
     Get the multiple form the number.
     
     - parameter number:       The origin number.
     - parameter formatString: The string-format String.
     
     - returns: The multiple of the number.
     */
    private func multipleForNumber(number: NSNumber, formatString: String?) -> Int {
        var newNumber = number;
        if formatString != nil && formatString!.rangeOfString("%@") == nil {
            
            if formatString!.rangeOfString("%d") != nil {
                return 0;
            }
            
            let fStr: String = self.regexNumberFormat(formatString!)
            let formatNumberStr: String = String(fStr, number.floatValue)
            if formatNumberStr.rangeOfString(".") != nil {
                let fn_range = formatNumberStr.rangeOfString(".")
                let index = fn_range?.startIndex.advancedBy(1)
                let subStr: String = formatNumberStr.substringFromIndex(index!)
                let length: Int = subStr.characters.count < 6 ? subStr.characters.count : 6
                let padding = log10f(Float(length))
                newNumber = (formatNumberStr as NSString).floatValue + padding
            }
        }
        
        let resultStr = String(format: "%@", newNumber)
        if resultStr.rangeOfString(".") != nil {
            let re_range = resultStr.rangeOfString(".")
            let index = re_range?.startIndex.advancedBy(1)
            let subStr: String = resultStr.substringFromIndex(index!)
            // Max Multiple is 6
            let length : Int = subStr.characters.count >= 6 ? 6 : subStr.characters.count
            return Int(powf(10, Float(length)))
        }
        return 0
    }
    
    /**
     Get new the string-format String.
     
     - parameter format: The origin string-format String.
     
     - returns: The new string-format String.
     */
    private func regexNumberFormat(format: String) -> String {
        let patternStr : String = "^%((\\d+.\\d+)|(\\d+).|(.\\d+))f$"
        do {
            let regex : NSRegularExpression =  try NSRegularExpression(pattern: patternStr, options: NSRegularExpressionOptions.CaseInsensitive)
            let fRange = NSMakeRange(0, format.characters.count)
            let match = regex.firstMatchInString(format, options: NSMatchingOptions.ReportProgress, range: fRange)
            if (match != nil) {
                let result: NSString = (format as NSString).substringWithRange(match!.range);
                return result as String;
            }
        } catch {
            print("Exception")
        }
        return "%f"
    }
}

private var flickerNumberKey : Void?
private var flickerNumberFormatterKey : Void?
private var flickerTimerKey : Void?

public extension UILabel {
    /// The intermediate number, it's private variable. Extend property use the runtime feature.
    public var fn_number: NSNumber? {
        get {
            return objc_getAssociatedObject(self, &flickerNumberKey) as? NSNumber
        }
    }
    
    private func set_fnNumber(number: NSNumber) {
        objc_setAssociatedObject(self, &flickerNumberKey, number, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /// The number-formatter style, it's private varibale. Extend property use the runtime feature.
    public var fn_formatter: NSNumberFormatter? {
        get {
            return objc_getAssociatedObject(self, &flickerNumberFormatterKey) as? NSNumberFormatter
        }
    }
    
    private func fn_setFormatter(formatter: NSNumberFormatter?) {
        objc_setAssociatedObject(self, &flickerNumberFormatterKey, formatter, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /// The flicker animation time count Timer.
    public var fn_timer: NSTimer? {
        get {
            return objc_getAssociatedObject(self, &flickerTimerKey) as? NSTimer
        }
    }
    
    private func fn_setTimer(timer: NSTimer) {
        objc_setAssociatedObject(self, &flickerTimerKey, timer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

public let fnAttributeName = "attributeKey"
public let fnRangeName = "rangeKey"

public extension NSDictionary {
    /**
     Create an attribute texts dictionary, like the NSAttributedString.
     
     - parameter attribute: The attributed text of the dictionary.
     - parameter range:     The range of the attributed text.
     
     - returns: Dictionary of attributed text.
     */
    public static func fn_dictionary(attribute: NSDictionary, range: NSRange) -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setObject(attribute , forKey: fnAttributeName)
        let rangeValue = NSValue(range: range)
        dictionary.setObject(rangeValue, forKey: fnRangeName)
        return dictionary
    }
}





