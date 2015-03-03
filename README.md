# FlickerNumber
flicker number like alipay use UILabel category

##Effects
<img src="http://ipa-download.qiniudn.com/flicke a format number.gif" width="276"/>
<img src="http://ipa-download.qiniudn.com/flicker a attribute number.gif" width="276"/>
<img src="http://ipa-download.qiniudn.com/flicker a float number.gif" width="276"/>
<img src="http://ipa-download.qiniudn.com/flicker a integer number.gif" width="276"/>

##Installation

[![Version](http://cocoapod-badges.herokuapp.com/v/FlickerNumber/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/0.1/) [![Platform](http://cocoapod-badges.herokuapp.com/p/FlickerNumber/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/0.1)   
FlickerNumber is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "FlickerNumber"
Alternatively, you can just drag the files from `FlickerNumber / Classes` into your own project. 

## Usage

To run the example project; clone the repo, and run `pod install` from the Project directory first.

import `UILabel+FlickerNumber.h` in your project    

then you can use the category methods in any initilized UILabel to implement the effect of flicker number.

## Methods

`- (void)dd_setNumber:(NSNumber *)number; `  simple method

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration;` control flicker number duration time

`- (void)dd_setNumber:(NSNumber *)number  format:(NSString *)formatStr; ` flicker number with string format


/**
 *  flicker number with attributes
 *
 *  @param number flicker number
 *  @param attrs  text attributes
 */
- (void)dd_setNumber:(NSNumber *)number
          attributes:(id)attrs;

/**
 *  flicker number with format in duration
 *
 *  @param number    flicker number
 *  @param duration  duration time
 *  @param formatStr format string
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(NSString *)formatStr;
/**
 *  flicker number with attribute in duration
 *
 *  @param number   flicker number
 *  @param duration duration time
 *  @param attrs    text attributes
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
          attributes:(id)attrs;

/**
 *  flicker number method
 *
 *  @param number   flicker number
 *  @param duration duration time
 *  @param format   format string
 *  @param attri    text attribute
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(NSString *)formatStr
          attributes:(id)attrs;


LICENSE(软件许可)
====

Copyright (c) 2015 FlickerNumber <dongjia_9251@126.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
