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

`- (void)dd_setNumber:(NSNumber *)number attributes:(id)attrs;` flicker number with attributes

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr;`

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration attributes:(id)attrs; `

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr attributes:(id)attrs;`

## Requirements

- Xcode 6
- iOS 5.1.1

## Author

DeJohn Dong, dongjia_9251@126.com

## License

FlickerNumber is available under the MIT license. See the LICENSE file for more info.

