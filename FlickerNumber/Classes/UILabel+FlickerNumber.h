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
 *  flicker number with numberformatter style & format string
 *
 *  @param number    flicker number
 *  @param formatStr format string
 *  @param formatter formatter style
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
 *  flicker number with attributes & formatter style
 *
 *  @param number    flicker number
 *  @param formatter formatter style
 *  @param attrs     text attributes
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
 *  flicker number with format string & formatter style in duration
 *
 *  @param number    flicker number
 *  @param duration  duration time
 *  @param formatStr format string
 *  @param formatter formatter style
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
 *  flicker number with attribute & formatter style in duration
 *
 *  @param number    flicker number
 *  @param duration  duration time
 *  @param formatter formatter style
 *  @param attrs     text attributes
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
