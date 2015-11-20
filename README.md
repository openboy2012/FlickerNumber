# FlickerNumber
Flicker a number like alipay use UILabel category. It can be wonderful when use the advanced method.

## Swift Compatibility
Now, Version 1.0 is coding by Objective-C and Version 2.0 is coding by Swift.

##Effects
<img src="http://7fvget.com1.z0.glb.clouddn.com/flicker a format number.gif" width="276"/>
<img src="http://7fvget.com1.z0.glb.clouddn.com/flicker an attribute number.gif" width="276"/>
<img src="http://7fvget.com1.z0.glb.clouddn.com/flicker a float number.gif" width="276"/>
<img src="http://7fvget.com1.z0.glb.clouddn.com/flicker an integer number.gif" width="276"/>
<img src="http://7fvget.com1.z0.glb.clouddn.com/flicker number.gif" width="276"/>

##Installation

[![Build Status](https://travis-ci.org/openboy2012/FlickerNumber.svg?branch=master)](https://travis-ci.org/openboy2012/FlickerNumber)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/ibireme/YYText/master/LICENSE)&nbsp;   
###Code for Objective-C
[![Version](http://cocoapod-badges.herokuapp.com/v/FlickerNumber/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/)&nbsp; [![Platform](http://cocoapod-badges.herokuapp.com/p/FlickerNumber/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/)&nbsp;[![Support](https://img.shields.io/badge/support-iOS%205.1.1%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)   
###Code for Swift
[![Version](http://cocoapod-badges.herokuapp.com/v/FlickerNumber-Swift/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/)&nbsp; [![Platform](http://cocoapod-badges.herokuapp.com/p/FlickerNumber-Swift/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/)&nbsp;[![Support](https://img.shields.io/badge/support-iOS%208.0%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;   
   
FlickerNumber is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "FlickerNumber"
Alternatively, you can just drag the files from `FlickerNumber / Classes` into your own project. 

## Usage

To run the example project; clone the repo, and run `pod install` from the Project directory first.

import `UILabel+FlickerNumber.h` in your project    

then you can use the category methods in any initilized UILabel to implement the effect of flicker number.

for example:
```objective-c
@property (nonatomic, weak) IBOutlet UILabel *lblFlicker; //for a xib label

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if([self.title isEqualToString:@"Flicker A Integer Number"]){
        [self.lblFlicker dd_setNumber:@(7654321)];
    }else if([self.title isEqualToString:@"Flicker A Float Number"]){
        [self.lblFlicker dd_setNumber:@(123.982)];
    }else if([self.title isEqualToString:@"Flicker A Format Number"]){
        [self.lblFlicker dd_setNumber:@(75.212) format:@"￥%.2f"];
    }else if([self.title isEqualToString:@"Flicker A Attribute Number"]){
        id attributes = [NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                     range:NSMakeRange(0, 1)];
        [self.lblFlicker dd_setNumber:@(123.45) attributes:attributes];
    }else{
        id attributes = @[[NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                       range:NSMakeRange(0, 1)],
                          [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                       range:NSMakeRange(1, 3)]];
        [self.lblFlicker dd_setNumber:@(123.45) duration:1.0f format:@"￥%.2f" attributes:attributes];
    }
}

```

## Methods
```objective-c
/**
 *  Flicker a number without other effects.
 *
 *  @param number    The number for flicker animation, can't be `nil`.
 */
- (void)fn_setNumber:(NSNumber *)number;

/**
 *  Flicker a number with number-formatter style. You can use the `NSNumberFormatterCurrencyStyle` number-formatter style, the number will flicker animation as `$1,023.12`.
 *
 *  @param number    The number for flicker animation.
 *  @param formatter The number-formatter style. If this parameter is `nil`, the method should use the default number-formatter style -- `NSNumberFormatterDecimalStyle`, so `1000000` will be '1,000,000'.
 */
- (void)fn_setNumber:(NSNumber *)number
           formatter:(nullable NSNumberFormatter *)formatter;

/**
 *  Flicker a number in during time.
 *
 *  @param number    The number for flicker animation.
 *  @param duration  The flicker animation during time, can't be a minus.
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration;

/**
 *  Flicker a number in during time with number-formatter style.
 *
 *  @param number    The number for flicker animation.
 *  @param duration  The flicker animation during time.
 *  @param formatter The number-formatter style.
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
           formatter:(nullable NSNumberFormatter *)formatter;

/**
 *  Flicker a number with string-format style. like this: `Today's income: $200.00`.
 *
 *  @param number    The number for flicker animation.
 *  @param formatStr The string-format String. If you set this parameter is `nil`, the method is same to `fn_setNumber:`.
 */
- (void)fn_setNumber:(NSNumber *)number
              format:(nullable NSString *)formatStr;

/**
 *  Flicker a number with string-format String & number-formatter style.
 *
 *  @param number    The number for flicker animation.
 *  @param formatStr The string-format String.
 *  @param formatter The number-formatter style.
 */
- (void)fn_setNumber:(NSNumber *)number
              format:(nullable NSString *)formatStr
           formatter:(nullable NSNumberFormatter *)formatter;


/**
 *  Flicker a number with attributed(s) property.
 *
 *  @param number The number for flicker animation.
 *  @param attrs  The attributed number set(a dictionary OR array of dictionaries), character attributes for text. Only can attributed the number because there are no string-format String. Use this parameter the number text can be colorful and wonderful. If you set this parameter is `nil`, the same to method `fn_setNumber:`.
 */
- (void)fn_setNumber:(NSNumber *)number
          attributes:(nullable id)attrs;

/**
 *  Flicker a number with number-formatter style & attributed(s) property.
 *
 *  @param number    The number for flicker animation.
 *  @param formatter The number-formatter style.
 *  @param attrs     The attributed number set(a dictionary OR array of dictionaries).
 */
- (void)fn_setNumber:(NSNumber *)number
           formatter:(nullable NSNumberFormatter *)formatter
          attributes:(nullable id)attrs;

/**
 *  Flicker a number with string-format String & attributed(s) property.
 *
 *  @param number    The number for flicker animation.
 *  @param formatStr The string-format String.
 *  @param attrs     The attributed string set(a dictionary OR array of dictionaries). You can attributed(s) the number or string-format String.
 */
- (void)fn_setNumber:(NSNumber *)number
              format:(nullable NSString *)formatStr
          attributes:(nullable id)attrs;

/**
 *  Flicker a number in dafault during time(1.0s) with all effects.
 *
 *  @param number    The number for flicker animation.
 *  @param formatStr The string-format String.
 *  @param formatter The number-formatter style.
 *  @param attrs     The attributed string set(a dictionary OR array of dictionaries).You can attributed(s) the number or string-format String.
 */
- (void)fn_setNumber:(NSNumber *)number
              format:(nullable NSString *)formatStr
           formatter:(nullable NSNumberFormatter *)formatter
          attributes:(nullable id)attrs;

/**
 *  Flicker a number in during time with string-format String.
 *
 *  @param number    The number for flicker animation.
 *  @param duration  The flicker animation during time.
 *  @param formatStr The string-format String.
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(nullable NSString *)formatStr;

/**
 *  Flicker a number in during time with string-format String & number-formatter style.
 *
 *  @param number    The number for flicker animation.
 *  @param duration  The flicker animation during time.
 *  @param formatStr The string-format String.
 *  @param formatter The number-formatter style.
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(nullable NSString *)formatStr
           formatter:(nullable NSNumberFormatter *)formatter;

/**
 *  Flicker a number in during time with attributed(s) property.
 *
 *  @param number   The number for flicker animation.
 *  @param duration The flicker animation during time.
 *  @param attrs    The attributed number set(a dictionary OR array of dictionaries).
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
          attributes:(nullable id)attrs;

/**
 *  Flicker a number in during time with attributed(s) property of number & number-formatter style.
 *
 *  @param number    The number for flicker animation.
 *  @param duration  The flicker animation during time.
 *  @param formatter The number-formatter style.
 *  @param attrs     The attributed number set(a dictionary OR array of dictionaries).
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
           formatter:(nullable NSNumberFormatter *)formatter
          attributes:(nullable id)attrs;

/**
 *  Flicker a number in during time with effects except number-formatter style.
 *
 *  @param number    The number for flicker animation.
 *  @param duration  The flicker animation during time.
 *  @param formatStr The string-format String.
 *  @param attrs     The attributed string set(a dictionary OR array of dictionaries). You can set string-format String OR number attributes both.
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(nullable NSString *)formatStr
          attributes:(nullable id)attrs;

/**
 *  Flicker a number in during time with all the effects. You can attributed(s) the number or string-format String. You also can set the number number-fomatter style.
 *
 *  @param number    The number for flicker animation.
 *  @param duration  The flicker animation during time.
 *  @param formatStr The string-format String.
 *  @param formatter The number-formatter style.
 *  @param attrs     The attributed string set(a dictionary OR array of dictionaries).
 */
- (void)fn_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(nullable NSString *)formatStr
     numberFormatter:(nullable NSNumberFormatter *)formatter
          attributes:(nullable id)attrs;

```

## Updates
- [2.0] the flicker number for swift.
- [1.1] rename the method then they are more memorise.
- [1.0] add the long long type integer or double number flicker function.
- [0.2] add the NSNumberFormatter function.
- [0.1] add the flicker number kit.

## Requirements

- Xcode 7
- iOS 5.1.1

## Author

DeJohn Dong, dongjia_9251@126.com

## License

FlickerNumber is available under the MIT license. See the LICENSE file for more info.

