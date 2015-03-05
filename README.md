# FlickerNumber
flicker number like alipay use UILabel category

##Effects
<img src="http://ipa-download.qiniudn.com/flicker a format number.gif" width="276"/>
<img src="http://ipa-download.qiniudn.com/flicker an attribute number.gif" width="276"/>
<img src="http://ipa-download.qiniudn.com/flicker a float number.gif" width="276"/>
<img src="http://ipa-download.qiniudn.com/flicker an integer number.gif" width="276"/>
<img src="http://ipa-download.qiniudn.com/flicker number.gif" width="276"/>

##Installation

[![Version](http://cocoapod-badges.herokuapp.com/v/FlickerNumber/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/) [![Platform](http://cocoapod-badges.herokuapp.com/p/FlickerNumber/badge.png)](http://cocoadocs.org/docsets/FlickerNumber/)   
FlickerNumber is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "FlickerNumber"
Alternatively, you can just drag the files from `FlickerNumber / Classes` into your own project. 

## Usage

To run the example project; clone the repo, and run `pod install` from the Project directory first.

import `UILabel+FlickerNumber.h` in your project    

then you can use the category methods in any initilized UILabel to implement the effect of flicker number.

for example:
```
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
                                                     andRange:NSMakeRange(0, 1)];
        [self.lblFlicker dd_setNumber:@(123.45) attributes:attributes];
    }else{
        id attributes = @[[NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                       andRange:NSMakeRange(0, 1)],
                          [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                       andRange:NSMakeRange(1, 3)]];
        [self.lblFlicker dd_setNumber:@(123.45) duration:1.0f format:@"￥%.2f" attributes:attributes];
    }
}

```

## Methods

`- (void)dd_setNumber:(NSNumber *)number; `  simple method

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration;` control flicker number duration time

`- (void)dd_setNumber:(NSNumber *)number  format:(NSString *)formatStr; ` flicker number with string format

`- (void)dd_setNumber:(NSNumber *)number attributes:(id)attrs;` flicker number with attributes

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr;`

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration attributes:(id)attrs; `

`- (void)dd_setNumber:(NSNumber *)number formatter:(NSNumberFormatter *)formatter; `  simple method

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration formatter:(NSNumberFormatter *)formatter;` 

`- (void)dd_setNumber:(NSNumber *)number format:(NSString *)formatStr formatter:(NSNumberFormatter *)formatter;` 

`- (void)dd_setNumber:(NSNumber *)number formatter:(NSNumberFormatter *)formatter attributes:(id)attrs;` 

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr formatter:(NSNumberFormatter *)formatter;`

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration formatter:(NSNumberFormatter *)formatter attributes:(id)attrs; `

`- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr formatter:(NSNumberFormatter *)formatter attributes:(id)attrs;`

## Updates
- [0.2] add the NSNumberFormatter function.
- [0.1] add the flicker number kit.

## Requirements

- Xcode 6
- iOS 6.0

## Author

DeJohn Dong, dongjia_9251@126.com

## License

FlickerNumber is available under the MIT license. See the LICENSE file for more info.

