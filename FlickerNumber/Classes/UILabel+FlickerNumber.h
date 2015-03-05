//
//  UILabel+FlickerNumber.h
//  FlickerNumber
//
//  Created by Diaoshu on 15-2-1.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Format,
    Mutiable
} FlickerNumberAttributeType;

@interface UILabel (FlickerNumber)

/**
 *  flicker number only a number variable
 *
 *  @param number flicker number
 */
- (void)dd_setNumber:(NSNumber *)number;

/**
 *  flicker number with numberformatter style
 *
 *  @param number    flicker number
 *  @param formatter formatter style
 */
- (void)dd_setNumber:(NSNumber *)number
           formatter:(NSNumberFormatter *)formatter;

/**
 *  flicker number in duration
 *
 *  @param number   flicker number
 *  @param duration duration time
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration;

/**
 *  flicker number in duartion with numberformatter style
 *
 *  @param number   flicker number
 *  @param duration duration time
 *  @param formatter formatter style
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
           formatter:(NSNumberFormatter *)formatter;

/**
 *  flicker number with format
 *
 *  @param number    flicker number
 *  @param formatStr format string
 */
- (void)dd_setNumber:(NSNumber *)number
              format:(NSString *)formatStr;

/**
 *  <#Description#>
 *
 *  @param number    <#number description#>
 *  @param formatStr <#formatStr description#>
 *  @param formatter <#formatter description#>
 */
- (void)dd_setNumber:(NSNumber *)number
              format:(NSString *)formatStr
           formatter:(NSNumberFormatter *)formatter;


/**
 *  flicker number with attributes
 *
 *  @param number flicker number
 *  @param attrs  text attributes
 */
- (void)dd_setNumber:(NSNumber *)number
          attributes:(id)attrs;

/**
 *  <#Description#>
 *
 *  @param number    <#number description#>
 *  @param formatter <#formatter description#>
 *  @param attrs     <#attrs description#>
 */
- (void)dd_setNumber:(NSNumber *)number
           formatter:(NSNumberFormatter *)formatter
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
 *  <#Description#>
 *
 *  @param number    <#number description#>
 *  @param duration  <#duration description#>
 *  @param formatStr <#formatStr description#>
 *  @param formatter <#formatter description#>
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(NSString *)formatStr
           formatter:(NSNumberFormatter *)formatter;
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
 *  <#Description#>
 *
 *  @param number    <#number description#>
 *  @param duration  <#duration description#>
 *  @param formatter <#formatter description#>
 *  @param attrs     <#attrs description#>
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
           formatter:(NSNumberFormatter *)formatter
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

/**
 *  flicker number method
 *
 *  @param number    flicker number
 *  @param duration  duration time
 *  @param formatStr format string
 *  @param formatter number formatter
 *  @param attrs     text attribute
 */
- (void)dd_setNumber:(NSNumber *)number
            duration:(NSTimeInterval)duration
              format:(NSString *)formatStr
     numberFormatter:(NSNumberFormatter *)formatter
          attributes:(id)attrs;

@end

@interface NSDictionary(FlickerNumber)

+ (instancetype)dictionaryWithAttribute:(NSDictionary *)attribute andRange:(NSRange)range;

@end
