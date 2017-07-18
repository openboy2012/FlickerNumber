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
    public func fn_setNumber(_ number: NSNumber) {
        self.fn_setNumber(number, format: nil)
    }
    
     /**
     Flicker a number with number-formatter style. You can use the `NSNumberFormatterCurrencyStyle` number-formatter style, the number will flicker animation as `$1,023.12`.
     
     - parameter number:    The number for flicker animation.
     - parameter formatter: The number-formatter style. If this parameter is `nil`, the method should use the default number-formatter style -- `NSNumberFormatterDecimalStyle`, so `1000000` will be '1,000,000'.
     */
    public func fn_setNumber(_ number: NSNumber, formatter: NumberFormatter?) {
        self.fn_setNumber(number, formatter:formatter, attributes: nil)
    }
    
     /**
     Flicker a number in during time.
     
     - parameter number:   The number for flicker animation.
     - parameter duration: The flicker animation during time, can't be a minus.
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval) {
        self.fn_setNumber(number, duration: duration, format: nil)
    }

     /**
     Flicker a number in during time with number-formatter style.
     
     - parameter number:    The number for flicker animation.
     - parameter duration:  The flicker animation during time.
     - parameter formatter: The number-formatter style.
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, formatter: NumberFormatter?) {
        self.fn_setNumber(number, duration: duration, formatter: formatter, attributes: nil)
    }
    
    /**
     Flicker a number with string-format style. like this: `Today's income: $200.00`.
     
     - parameter number: The number for flicker animation.
     - parameter format: The string-format String. If you set this parameter is `nil`, the method is same to `fn_setNumber:`.
     */
    public func fn_setNumber(_ number: NSNumber, format: String?) {
        self.fn_setNumber(number, format: format, attributes: nil)
    }
    
    /**
     Flicker a number with string-format String & number-formatter style.
     
     - parameter number:    The number for flicker animation.
     - parameter format:    The string-format String.
     - parameter formatter: The number-formatter style.
     */
    public func fn_setNumber(_ number: NSNumber, format: String?, formatter: NumberFormatter?) {
        self.fn_setNumber(number, format: format, formatter: formatter, attributes: nil)
    }
    
    /**
     Flicker a number with attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries), character attributes for text. Only can attributed the number because there are no string-format String. Use this parameter the number text can be colorful and wonderful. If you set this parameter is `nil`, the same to method `fn_setNumber:`.
     */
    public func fn_setNumber(_ number: NSNumber, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: 1.0, attributes: attributes)
    }
    
    /**
      Flicker a number with number-formatter style & attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(_ number: NSNumber, formatter: NumberFormatter?, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: 1.0, formatter: formatter, attributes: attributes)
    }
    
    /**
     Flicker a number with string-format String & attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter format:     The string-format String.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries). You can attributed(s) the number or string-format String.
     */
    public func fn_setNumber(_ number: NSNumber, format: String?, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: 1.0, format: format, attributes: nil)
    }
    
    /**
     Flicker a number in dafault during time(1.0s) with all effects.
     
     - parameter number:     The number for flicker animation.
     - parameter format:     The string-format String.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries).You can attributed(s) the number or string-format String.
     */
    public func fn_setNumber(_ number: NSNumber, format: String?, formatter: NumberFormatter?, attributes: AnyObject?) {
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
    public func fn_setNumber(_ nubmer: NSNumber, duration: TimeInterval, format: String?) {
        self.fn_setNumber(nubmer, duration: duration, format: format, numberFomatter: nil, attributes: nil)
    }
    
    /**
     Flicker a number in during time with string-format String & number-formatter style.
     
     - parameter nubmer:    The number for flicker animation.
     - parameter duration:  The flicker animation during time.
     - parameter format:    The string-format String.
     - parameter formatter: The number-formatter style.
     */
    public func fn_setNumber(_ nubmer: NSNumber, duration: TimeInterval, format: String?, formatter: NumberFormatter?) {
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
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, attributes: AnyObject?) {
        self.fn_setNumber(number, duration: duration, format: nil, attributes: attributes);
    }
    
    /**
     Flicker a number in during time with attributed(s) property of number & number-formatter style.
     
     - parameter number:     The number for flicker animation.
     - parameter duration:   The flicker animation during time.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, formatter: NumberFormatter?, attributes: AnyObject?) {
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
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, format: String?, attributes: AnyObject?) {
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
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, format: String?, numberFomatter: NumberFormatter?, attributes: AnyObject? ) {
        // check the number type
        assert(number.isKind(of: NSNumber.self), "Number Type is not matched, exit")
        if(!number.isKind(of: NSNumber.self)) {
            text = String(describing: number)
            return
        }
        
        //limit duration is postive number and it is large than 0.3
        var durationTime : TimeInterval = fabs(duration) < 0.3 ? 0.3 : fabs(duration)
        
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
        var endNumber: Int64 = number.int64Value;

        //get multiple if number is float & double type
        let multiple = self.getTheMultipleFromNumber(number, formatString: format)
        
        if multiple > 0 {
            endNumber = Int64(number.doubleValue * Double(multiple))
        }
        //check the number if out of bounds the unsigned int length
        if endNumber >= INT64_MAX {
            self.text = String(format:"%@", number);
            return;
        }
        
        userDict.setValue(multiple, forKey: multipleName)
        userDict.setValue(NSNumber(value: endNumber as Int64), forKey: endNumberName)
        
        if (Double(endNumber) * frequency)/durationTime < 1.0 {
            durationTime = durationTime * 0.3
        }
        let rangeNumber = (Double(endNumber) * frequency)/durationTime
        userDict.setValue(NSNumber(value: rangeNumber as Double), forKey: rangeIntegerName)
        
        if attributes != nil {
            userDict.setValue(attributes, forKey: attributeName)
        }
        
        fn_setFormatter(nil)
        if numberFomatter != nil {
            fn_setFormatter(numberFomatter!)
        }
        
        fn_setTimer(Timer.scheduledTimer(timeInterval: frequency,
            target: self,
            selector: #selector(UILabel.flickerAnimation(_:)),
            userInfo: userDict,
            repeats: true))
        
        RunLoop.current.add(self.fn_timer!, forMode: RunLoopMode.commonModes)
    }
    
    //Flicker animation method implemetation.
    public func flickerAnimation(_ timer: Timer) -> Void {
        if ((timer.userInfo as AnyObject).value(forKey: rangeIntegerName) as AnyObject).floatValue >= 1.0 {
            let rangeInteger = ((timer.userInfo as AnyObject).value(forKey: rangeIntegerName) as AnyObject).int64Value;
            let resultInteger = (self.fn_number?.int64Value)! + rangeInteger!;
            set_fnNumber(NSNumber(value: resultInteger as Int64))
        } else {
            let rangeInteger = ((timer.userInfo as AnyObject).value(forKey: rangeIntegerName) as AnyObject).floatValue;
            let resultInteger = (self.fn_number?.floatValue)! + rangeInteger!;
            set_fnNumber(NSNumber(value: resultInteger as Float))
        }
        
        let multiple = ((timer.userInfo as AnyObject).value(forKey: multipleName) as AnyObject).int32Value
        
        if multiple! > 0 {
            self.fn_finalNumberDoubleType(timer, multiple: Int(multiple!))
        } else {
            var formatStr: String = String()
            if (timer.userInfo as AnyObject).value(forKey: formatName) != nil {
                formatStr = (timer.userInfo as AnyObject).value(forKey: formatName) as! String
            }
            if formatStr.isEmpty {
                if self.fn_formatter != nil {
                    formatStr = "%@"
                } else {
                    formatStr = "%.0f"
                }
            }
            self.text = self.fn_finalNumber(self.fn_number!, format:formatStr, numberFormatter: self.fn_formatter)
            
            let attributes = (timer.userInfo as AnyObject).value(forKey: attributeName)
            
            if attributes != nil {
                self.drawAttributes(attributes! as AnyObject)
            }
            
            let endNumber : NSNumber = (timer.userInfo as AnyObject).value(forKey: endNumberName) as! NSNumber
            
            if (self.fn_number?.int64Value)! >= endNumber.int64Value {
                let resultNumber: NSNumber = (timer.userInfo as AnyObject).value(forKey: resultNumberName) as! NSNumber
                self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: self.fn_formatter)
                
                let attributes = (timer.userInfo as AnyObject).value(forKey: attributeName)
                
                if attributes != nil {
                    self.drawAttributes(attributes! as AnyObject)
                }
                self.fn_timer?.invalidate()
            }
        }
    }
    
    //Get the default number-formatter style.
    fileprivate func fn_defaultNumberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.formatterBehavior = NumberFormatter.Behavior.default
        return numberFormatter;
    }
    
    //Show the animation when the number is double type.
    fileprivate func fn_finalNumberDoubleType(_ timer: Timer, multiple: Int) {
        var formatStr: String = String()
        if (timer.userInfo as AnyObject).value(forKey: formatName) != nil {
            formatStr = (timer.userInfo as AnyObject).value(forKey: formatName) as! String
        }
        if formatStr.isEmpty {
            if self.fn_formatter != nil {
                formatStr = "%@"
            } else {
                formatStr = String(format: "%%.%df", Int(log10(Float(multiple))))
            }
        }
        let flickerNumber = (self.fn_number?.doubleValue)! / Double(multiple)
        
        self.text = self.fn_finalNumber(NSNumber(value:flickerNumber as Double), format:formatStr, numberFormatter: self.fn_formatter)
        
        let attributes = (timer.userInfo as AnyObject).value(forKey: attributeName)
        
        if attributes != nil {
            self.drawAttributes(attributes! as AnyObject)
        }
        
        let endNumber: NSNumber = (timer.userInfo as AnyObject).value(forKey: endNumberName) as! NSNumber
        
        if (self.fn_number?.int64Value)! >= endNumber.int64Value {
            let resultNumber: NSNumber = (timer.userInfo as AnyObject).value(forKey: resultNumberName) as! NSNumber
            
            self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: self.fn_formatter)
            
            let attributes = (timer.userInfo as AnyObject).value(forKey: attributeName)
            
            if attributes != nil {
                self.drawAttributes(attributes! as AnyObject)
            }
            self.fn_timer?.invalidate()
        }
    }
    
    //Get the string from number with number-formatter style.
    fileprivate func fn_stringFromNumber(_ number: NSNumber, numberFormatter: NumberFormatter) -> String? {
           return numberFormatter.string(from: number)
    }
    
    //Get the result string to do animation.
    fileprivate func fn_finalNumber(_ number : NSNumber, format: String, numberFormatter: NumberFormatter?) -> String? {
        var finalString = String()
        if numberFormatter != nil {
            finalString = String(format: format, self.fn_stringFromNumber(number, numberFormatter: numberFormatter!)!)
        } else {
            assert(format.range(of: "%@") == nil, "string format type is not matched, please check your format type.")
            if format.range(of: "%d") != nil {
                finalString = String(format: format, number.int64Value)
            } else {
                finalString = String(format: format, number.doubleValue)
            }
        }
        return finalString;
    }
    
    //Add the attributes into the mutable attributed string.
    fileprivate func drawAttributes(_ attributes: AnyObject) -> Void {
        if attributes.isKind(of: NSDictionary.self) {
            let range = (attributes.value(forKey: fnRangeName) as AnyObject).rangeValue
            let attribute = attributes.value(forKey: fnAttributeName)
            self.addAttributes(attribute! as AnyObject, range : range!)
        } else if attributes.isKind(of: NSArray.self) {
            for attribute in attributes as! NSArray {
                let range = ((attribute as AnyObject).value(forKey: fnRangeName) as AnyObject).rangeValue
                let attri = (attribute as AnyObject).value(forKey: fnAttributeName)
                self.addAttributes(attri! as AnyObject, range : range!)
            }
        }
    }
    
    fileprivate func addAttributes(_ attributes: AnyObject, range: NSRange) -> Void {
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
    fileprivate func getTheMultipleFromNumber(_ number: NSNumber, formatString: String?) -> Int {
        var newNumber = number
        let point:Character = "."
        if formatString != nil && formatString!.range(of: "%@") == nil {
            
            if formatString!.range(of: "%d") != nil {
                return 0;
            }
            
            let fStr: String = self.regexNumberFormat(formatString!)
            let formatNumberStr: String = String.init(format: fStr, number.floatValue)
            if (formatNumberStr.characters.index(of: point)) != nil
            {
                let idx = formatNumberStr.characters.index(of: point);
                let subStr: String = formatNumberStr.substring(from: idx!)
                let length: Int = subStr.characters.count < 6 ? subStr.characters.count : 6
                let padding = log10f(Float(length))
                newNumber = NSNumber(value:(formatNumberStr as NSString).floatValue + padding as Float)
            }
        }
        
        let resultStr = String(format: "%@", newNumber)
        if (resultStr.characters.index(of: point)) != nil
        {
            let idx = resultStr.characters.index(of: point);
            let subStr: String = resultStr.substring(from: idx!)
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
    fileprivate func regexNumberFormat(_ format: String) -> String {
        let patternStr : String = "^%((\\d+.\\d+)|(\\d+).|(.\\d+))f$"
        do {
            let regex : NSRegularExpression =  try NSRegularExpression(pattern: patternStr, options: NSRegularExpression.Options.caseInsensitive)
            let fRange = NSMakeRange(0, format.characters.count)
            let match = regex.firstMatch(in: format, options: NSRegularExpression.MatchingOptions.reportProgress, range: fRange)
            if (match != nil) {
                let result: NSString = (format as NSString).substring(with: match!.range) as NSString;
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
    
    fileprivate func set_fnNumber(_ number: NSNumber) {
        objc_setAssociatedObject(self, &flickerNumberKey, number, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /// The number-formatter style, it's private varibale. Extend property use the runtime feature.
    public var fn_formatter: NumberFormatter? {
        get {
            return objc_getAssociatedObject(self, &flickerNumberFormatterKey) as? NumberFormatter
        }
    }
    
    fileprivate func fn_setFormatter(_ formatter: NumberFormatter?) {
        objc_setAssociatedObject(self, &flickerNumberFormatterKey, formatter, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /// The flicker animation time count Timer.
    public var fn_timer: Timer? {
        get {
            return objc_getAssociatedObject(self, &flickerTimerKey) as? Timer
        }
    }
    
    fileprivate func fn_setTimer(_ timer: Timer) {
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
    public static func fn_dictionary(_ attribute: NSDictionary, range: NSRange) -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setObject(attribute , forKey: fnAttributeName as NSCopying)
        let rangeValue = NSValue(range: range)
        dictionary.setObject(rangeValue, forKey: fnRangeName as NSCopying)
        return dictionary
    }
}





