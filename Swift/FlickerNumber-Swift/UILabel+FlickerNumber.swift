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
    public func fn_setNumber(_ number: NSNumber, attributes: Any?) {
        self.fn_setNumber(number, duration: 1.0, attributes: attributes)
    }
    
    /**
      Flicker a number with number-formatter style & attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(_ number: NSNumber, formatter: NumberFormatter?, attributes: Any?) {
        self.fn_setNumber(number, duration: 1.0, formatter: formatter, attributes: attributes)
    }
    
    /**
     Flicker a number with string-format String & attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter format:     The string-format String.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries). You can attributed(s) the number or string-format String.
     */
    public func fn_setNumber(_ number: NSNumber, format: String?, attributes: Any?) {
        self.fn_setNumber(number, duration: 1.0, format: format, attributes: nil)
    }
    
    /**
     Flicker a number in default during time(1.0s) with all effects.
     
     - parameter number:     The number for flicker animation.
     - parameter format:     The string-format String.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries).You can attributed(s) the number or string-format String.
     */
    public func fn_setNumber(_ number: NSNumber, format: String?, formatter: NumberFormatter?, attributes: Any?) {
        self.fn_setNumber(number, duration: 1.0, format: format, numberFomatter: formatter ?? fn_defaultNumberFormatter(), attributes: attributes)
    }
    
    /**
     Flicker a number in during time with string-format String.
     
     - parameter nubmer:   The number for flicker animation.
     - parameter duration: The flicker animation during time.
     - parameter format:   The number-formatter style.
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, format: String?) {
        self.fn_setNumber(number, duration: duration, format: format, numberFomatter: nil, attributes: nil)
    }
    
    /**
     Flicker a number in during time with string-format String & number-formatter style.
     
     - parameter nubmer:    The number for flicker animation.
     - parameter duration:  The flicker animation during time.
     - parameter format:    The string-format String.
     - parameter formatter: The number-formatter style.
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, format: String?, formatter: NumberFormatter?) {
        self.fn_setNumber(number, duration: duration, format: format, numberFomatter: formatter ?? fn_defaultNumberFormatter(), attributes: nil)
    }
    
    /**
     Flicker a number in during time with attributed(s) property.
     
     - parameter number:     The number for flicker animation.
     - parameter duration:   The flicker animation during time.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, attributes: Any?) {
        self.fn_setNumber(number, duration: duration, format: nil, attributes: attributes)
    }
    
    /**
     Flicker a number in during time with attributed(s) property of number & number-formatter style.
     
     - parameter number:     The number for flicker animation.
     - parameter duration:   The flicker animation during time.
     - parameter formatter:  The number-formatter style.
     - parameter attributes: The attributed number set(a dictionary OR array of dictionaries).
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, formatter: NumberFormatter?, attributes: Any?) {
        self.fn_setNumber(number, duration: duration, format: nil, numberFomatter: formatter ?? fn_defaultNumberFormatter(), attributes: attributes)
    }
    
    /**
     Flicker a number in during time with effects except number-formatter style.
     
     - parameter number:     The number for flicker animation.
     - parameter duration:   The flicker animation during time.
     - parameter format:     The string-format String.
     - parameter attributes: The attributed string set(a dictionary OR array of dictionaries). You can set string-format String OR number attributes both.
     */
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, format: String?, attributes: Any?) {
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
    public func fn_setNumber(_ number: NSNumber, duration: TimeInterval, format: String?, numberFomatter: NumberFormatter?, attributes: Any?) {
        // check the number type
        assert(number.isKind(of: NSNumber.self), "Number Type is not matched, exit")
        if !number.isKind(of: NSNumber.self) {
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
        var endNumber = number.int64Value
        
        //get multiple if number is float & double type
        let multiple = self.getTheMultipleFromNumber(number, formatString: format)
        
        if multiple > 0 {
            endNumber = Int64(number.doubleValue * Double(multiple))
        }
        //check the number if out of bounds the unsigned int length
        if endNumber >= INT64_MAX {
            self.text = String(format:"%@", number)
            return
        }
        
        userDict.setValue(multiple, forKey: multipleName)
        userDict.setValue(NSNumber(value: endNumber), forKey: endNumberName)
        
        if (Double(endNumber) * frequency)/durationTime < 1.0 {
            durationTime = durationTime * 0.3
        }
        let rangeNumber = (Double(endNumber) * frequency)/durationTime
        userDict.setValue(NSNumber(value: rangeNumber), forKey: rangeIntegerName)
        
        if attributes != nil {
            userDict.setValue(attributes, forKey: attributeName)
        }
        
        fn_setFormatter(numberFomatter)
        
        let timer = Timer.scheduledTimer(timeInterval: frequency,
                                         target: self,
                                         selector: #selector(UILabel.flickerAnimation(_:)),
                                         userInfo: userDict,
                                         repeats: true)
        fn_setTimer(timer)
        
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    //Flicker animation method implementation.
    @objc public func flickerAnimation(_ timer: Timer) -> Void {
        let userInfo = timer.userInfo as! [String: Any]
        let rangeIntegerNumber = userInfo[rangeIntegerName] as! NSNumber
        var fnNumber: NSNumber = self.fn_number!
        if rangeIntegerNumber.floatValue >= 1.0 {
            let resultInteger = fnNumber.int64Value + rangeIntegerNumber.int64Value
            fnNumber = NSNumber(value: resultInteger)
        } else {
            let resultInteger = fnNumber.floatValue + rangeIntegerNumber.floatValue
            fnNumber = NSNumber(value: resultInteger)
        }
        set_fnNumber(fnNumber)
        
        let multiple = (userInfo[multipleName] as! NSNumber).int32Value
        
        if multiple > 0 {
            self.fn_finalNumberDoubleType(timer, multiple: Int(multiple))
        } else {
            let formatter = self.fn_formatter
            var formatStr = userInfo[formatName] as? String ?? ""
            if formatStr.isEmpty {
                if formatter != nil {
                    formatStr = "%@"
                } else {
                    formatStr = "%.0f"
                }
            }
            self.text = self.fn_finalNumber(fnNumber, format:formatStr, numberFormatter: formatter)
            
            if let attributes = userInfo[attributeName] {
                self.drawAttributes(attributes)
            }
            
            let endNumber = userInfo[endNumberName] as! NSNumber
            
            if fnNumber.int64Value >= endNumber.int64Value {
                let resultNumber = userInfo[resultNumberName] as! NSNumber
                self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: formatter)
                
                if let attributes = userInfo[attributeName] {
                    self.drawAttributes(attributes)
                }
                self.fn_timer?.invalidate()
            }
        }
    }
    
    //Get the default number-formatter style.
    fileprivate func fn_defaultNumberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.formatterBehavior = .default
        return numberFormatter
    }
    
    //Show the animation when the number is double type.
    fileprivate func fn_finalNumberDoubleType(_ timer: Timer, multiple: Int) {
        let userInfo = timer.userInfo as! [String: Any]
        let formatter = self.fn_formatter
        var formatStr: String = userInfo[formatName] as? String ?? ""
        if formatStr.isEmpty {
            if formatter != nil {
                formatStr = "%@"
            } else {
                formatStr = String(format: "%%.%df", Int(log10(Float(multiple))))
            }
        }
        let fnNumber = self.fn_number!
        let flickerNumber = fnNumber.doubleValue / Double(multiple)
        
        self.text = self.fn_finalNumber(NSNumber(value:flickerNumber), format:formatStr, numberFormatter: formatter)
        
        if let attributes = userInfo[attributeName] {
            self.drawAttributes(attributes)
        }
        
        let endNumber = userInfo[endNumberName] as! NSNumber
        
        if fnNumber.int64Value >= endNumber.int64Value {
            let resultNumber = userInfo[resultNumberName] as! NSNumber
            
            self.text = self.fn_finalNumber(resultNumber, format:formatStr, numberFormatter: formatter)
            
            if let attributes = userInfo[attributeName] {
                self.drawAttributes(attributes)
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
        if let numberFormatter = numberFormatter {
            finalString = String(format: format, self.fn_stringFromNumber(number, numberFormatter: numberFormatter)!)
        } else {
            assert(format.range(of: "%@") == nil, "string format type is not matched, please check your format type.")
            if format.range(of: "%d") != nil {
                finalString = String(format: format, number.int64Value)
            } else {
                finalString = String(format: format, number.doubleValue)
            }
        }
        return finalString
    }
    
    //Add the attributes into the mutable attributed string.
    fileprivate func drawAttributes(_ attributes: Any) -> Void {
        if let attributes = attributes as? [String: Any] {
            let range = (attributes[fnRangeName] as! NSValue).rangeValue
            let attri = attributes[fnAttributeName] as! [NSAttributedStringKey : Any]
            self.addAttributes(attri, range : range)
        } else if let attributes = attributes as? [[String: Any]] {
            for attribute in attributes {
                self.drawAttributes(attribute)
            }
        }
    }
    
    fileprivate func addAttributes(_ attributes: [NSAttributedStringKey : Any], range: NSRange) -> Void {
        let attributedStr = NSMutableAttributedString(attributedString : self.attributedText!)
        if range.location + range.length < attributedStr.length  {
            attributedStr.addAttributes(attributes, range: range)
        }
        self.attributedText = attributedStr
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
        if let formatString = formatString, formatString.range(of: "%@") == nil {
            
            if formatString.range(of: "%d") != nil {
                return 0
            }
            
            let fStr = self.regexNumberFormat(formatString)
            let formatNumberStr = String(format: fStr, number.floatValue)
            if let idx = formatNumberStr.index(of: point)
            {
                let subStrCount = formatNumberStr.distance(from: idx, to: formatNumberStr.endIndex)
                let length = Swift.min(subStrCount, 6)
                let padding = log10f(Float(length))
                newNumber = NSNumber(value:(formatNumberStr as NSString).floatValue + padding)
            }
        }
        
        let resultStr = String(format: "%@", newNumber)
        if let idx = resultStr.index(of: point)
        {
            let subStrCount = resultStr.distance(from: idx, to: resultStr.endIndex)
            // Max Multiple is 6
            let length = Swift.min(subStrCount, 6)
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
        let patternStr = "^%((\\d+.\\d+)|(\\d+).|(.\\d+))f$"
        do {
            let regex : NSRegularExpression = try NSRegularExpression(pattern: patternStr, options: .caseInsensitive)
            let fRange = NSRange(location: 0, length: format.count)
            if let match = regex.firstMatch(in: format, options: .reportProgress, range: fRange) {
                let result = (format as NSString).substring(with: match.range)
                return result
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
    public static func fn_dictionary(_ attribute: [NSAttributedStringKey : Any], range: NSRange) -> [String : Any] {
        return [fnAttributeName: attribute, fnRangeName: NSValue(range: range)]
    }
}





