//
//  UILabel+FlickerNumber.m
//  FlickerNumber
//
//  Created by Diaoshu on 15-2-1.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "UILabel+FlickerNumber.h"
#import <objc/runtime.h>

#define RangeIntegerKey @"RangeKey"
#define MultipleKey @"MultipleKey"
#define BeginNumberKey @"BeginNumberKey"
#define EndNumberKey @"EndNumberKey"
#define ResultNumberKey @"ResultNumberKey"

#define AttributeKey @"AttributeKey"
#define FormatKey @"FormatStringKey"

#define Frequency 1.0/30.0f

#define DictArrtributeKey @"attribute"
#define DictRangeKey @"range"


@interface UILabel ()

@property (nonatomic, strong) NSNumber *flickerNumber;
@property (nonatomic, strong) NSNumberFormatter *flickerNumberFormatter;
@property (nonatomic, strong) NSTimer *currentTimer;

@end

@implementation UILabel (FlickerNumber)

#pragma mark - runtime methods
- (void)setFlickerNumber:(NSNumber *)flickerNumber{
    objc_setAssociatedObject(self, @selector(flickerNumber), flickerNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)flickerNumber{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFlickerNumberFormatter:(NSNumberFormatter *)flickerNumberFormatter{
    objc_setAssociatedObject(self, @selector(flickerNumberFormatter), flickerNumberFormatter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumberFormatter *)flickerNumberFormatter{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCurrentTimer:(NSTimer *)currentTimer{
    objc_setAssociatedObject(self, @selector(currentTimer), currentTimer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimer *)currentTimer{
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - flicker methods(public)

- (void)dd_setNumber:(NSNumber *)number{
    [self dd_setNumber:number duration:1.0 format:nil attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number formatter:(NSNumberFormatter *)formatter{
    if(!formatter)
        formatter = [self defaultFormatter];
    [self dd_setNumber:number duration:1.0 format:nil numberFormatter:formatter attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number format:(NSString *)formatStr{
    [self dd_setNumber:number duration:1.0 format:formatStr attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number format:(NSString *)formatStr formatter:(NSNumberFormatter *)formatter{
    if(!formatter)
        formatter = [self defaultFormatter];
    [self dd_setNumber:number duration:1.0 format:formatStr numberFormatter:formatter attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number attributes:(id)attrs{
    [self dd_setNumber:number duration:1.0 format:nil attributes:attrs];
}


- (void)dd_setNumber:(NSNumber *)number formatter:(NSNumberFormatter *)formatter attributes:(id)attrs{
    if(!formatter)
        formatter = [self defaultFormatter];
    [self dd_setNumber:number duration:1.0 format:nil numberFormatter:formatter attributes:attrs];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr{
    [self dd_setNumber:number duration:duration format:formatStr attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr numberFormatter:(NSNumberFormatter *)formatter{
    if(!formatter)
        formatter = [self defaultFormatter];
    [self dd_setNumber:number duration:duration format:formatStr numberFormatter:formatter attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration{
    [self dd_setNumber:number duration:duration format:nil attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration formatter:(NSNumberFormatter *)formatter{
    if(!formatter)
        formatter = [self defaultFormatter];
    [self dd_setNumber:number duration:duration format:nil numberFormatter:formatter attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration attributes:(id)attrs{
    [self dd_setNumber:number duration:duration format:nil attributes:attrs];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr formatter:(NSNumberFormatter *)formatter{
    if(!formatter)
        formatter = [self defaultFormatter];
    [self dd_setNumber:number duration:duration format:formatStr formatter:formatter];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration formatter:(NSNumberFormatter *)formatter attributes:(id)attrs{
    if(!formatter)
        formatter = [self defaultFormatter];
    [self dd_setNumber:number duration:duration format:nil numberFormatter:formatter attributes:attrs];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr attributes:(id)attrs{
    [self dd_setNumber:number duration:duration format:formatStr numberFormatter:nil attributes:attrs];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr numberFormatter:(NSNumberFormatter *)formatter attributes:(id)attrs{
    /**
     *  check the number type
     */
    NSAssert([number isKindOfClass:[NSNumber class]], @"Number Type is not matched , exit");
    if(![number isKindOfClass:[NSNumber class]]){
        self.text = [NSString stringWithFormat:@"%@",number];
        return;
    }
    
    //limit duration is postive number and it is large than 0.3
    duration = fabs(duration) < 0.3 ? 0.3 : fabs(duration);
    
    [self.currentTimer invalidate];
    self.currentTimer = nil;
    
    //initialize useinfo dict
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithCapacity:0];
    
    if(formatStr)
        [userInfo setObject:formatStr forKey:FormatKey];
    
    [userInfo setObject:number forKey:ResultNumberKey];
    
    //initialize variables
    long long beginNumber = 0;
    [userInfo setObject:@(beginNumber) forKey:BeginNumberKey];
    self.flickerNumber = @(0);
    long long endNumber = 0;
    
    //get multiple if number is float & double type
    int multiple = [self multipleForNumber:number formatString:formatStr];
    endNumber = multiple > 0 ? [number doubleValue] * multiple : [number longLongValue];
    
    //check the number if out of bounds the unsigned int length
    if(endNumber >= INT64_MAX){
        self.text = [NSString stringWithFormat:@"%@",number];
        return;
    }
    
    [userInfo setObject:@(multiple) forKey:MultipleKey];
    [userInfo setObject:@(endNumber) forKey:EndNumberKey];
    if((endNumber * Frequency)/duration < 1){
        duration = duration * 0.3;
    }
    [userInfo setObject:@((endNumber * Frequency)/duration) forKey:RangeIntegerKey];
    
    if(attrs)
        [userInfo setObject:attrs forKey:AttributeKey];
    
    self.flickerNumberFormatter = nil;
    if(formatter)
        self.flickerNumberFormatter = formatter;

    self.currentTimer = [NSTimer scheduledTimerWithTimeInterval:Frequency target:self selector:@selector(flickerAnimation:) userInfo:userInfo repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.currentTimer forMode:NSRunLoopCommonModes];
}


#pragma mark - private methods
/**
 *  flicker number animation
 *
 *  @param timer schedule timer
 */
- (void)flickerAnimation:(NSTimer *)timer{
    long long rangeInteger = [timer.userInfo[RangeIntegerKey] doubleValue];
    self.flickerNumber = @([self.flickerNumber doubleValue] + rangeInteger);
    
    int multiple = [timer.userInfo[MultipleKey] intValue];
    if(multiple > 0){
        [self floatNumberHandler:timer andMultiple:multiple];
        return;
    }
    
    NSString *formatStr = timer.userInfo[FormatKey]?:(self.flickerNumberFormatter?@"%@":@"%.0f");
    self.text = [self finalString:@([self.flickerNumber doubleValue]) stringFormat:formatStr andFormatter:self.flickerNumberFormatter];
    
    NSLog(@"text = %@ flicker number = %@", self.text, self.flickerNumber);

    if(timer.userInfo[AttributeKey]){
        [self attributedHandler:timer.userInfo[AttributeKey]];
    }
    
    if([self.flickerNumber doubleValue] >= [timer.userInfo[EndNumberKey] doubleValue]){
        self.text = [self finalString:timer.userInfo[ResultNumberKey] stringFormat:formatStr andFormatter:self.flickerNumberFormatter];
        NSLog(@"final text = %@ flicker number = %@", self.text, self.flickerNumber);
        if(timer.userInfo[AttributeKey]){
            [self attributedHandler:timer.userInfo[AttributeKey]];
        }
        [timer invalidate];
    }
}

/**
 *  float number handler
 *
 *  @param timer    timer
 *  @param multiple multiple
 */
- (void)floatNumberHandler:(NSTimer *)timer andMultiple:(int)multiple{
    NSString *formatStr = timer.userInfo[FormatKey]?:(self.flickerNumberFormatter?@"%@":[NSString stringWithFormat:@"%%.%df",(int)log10(multiple)]);
    self.text = [self finalString:@([self.flickerNumber doubleValue]/multiple) stringFormat:formatStr andFormatter:self.flickerNumberFormatter];
    NSLog(@"text = %@ flicker number = %@", self.text, @([self.flickerNumber doubleValue]/multiple));
    if(timer.userInfo[AttributeKey]){
        [self attributedHandler:timer.userInfo[AttributeKey]];
    }
    if([self.flickerNumber doubleValue] >= [timer.userInfo[EndNumberKey] doubleValue]){
        self.text = [self finalString:timer.userInfo[ResultNumberKey] stringFormat:formatStr andFormatter:self.flickerNumberFormatter];
        NSLog(@"final text = %@ flicker number = %@", self.text, self.flickerNumber);
        if(timer.userInfo[AttributeKey]){
            [self attributedHandler:timer.userInfo[AttributeKey]];
        }
        [timer invalidate];
    }
}

/**
 *  attributes string handle methods
 *
 *  @param attributes attributes variable
 */
- (void)attributedHandler:(id)attributes{
    if([attributes isKindOfClass:[NSDictionary class]]){
        NSRange range = [attributes[DictRangeKey] rangeValue];
        [self addAttributes:attributes[DictArrtributeKey] range:range];
    }else if([attributes isKindOfClass:[NSArray class]]){
        for (NSDictionary *attribute in attributes) {
            NSRange range = [attribute[DictRangeKey] rangeValue];
            [self addAttributes:attribute[DictArrtributeKey] range:range];
        }
    }
}

/**
 *  attributes string result methods
 *
 *  @param attri attribute
 *  @param range range
 */
- (void)addAttributes:(NSDictionary *)attri range:(NSRange)range{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    // handler the out range exception
    if(range.location+range.length <= str.length){
        [str addAttributes:attri range:range];
    }
    self.attributedText = str;
}

/**
 *  get muliple from number
 *
 *  @param number past number
 *
 *  @return mulitple
 */
- (int)multipleForNumber:(NSNumber *)number formatString:(NSString *)formatStr{
    if([formatStr rangeOfString:@"%@"].location == NSNotFound){
        formatStr = [self regexNumberFormat:formatStr];
        NSString *formatNumberString = [NSString stringWithFormat:formatStr,[number floatValue]];
        if([formatNumberString rangeOfString:@"."].location != NSNotFound){
            NSUInteger length = [[formatNumberString substringFromIndex:[formatNumberString rangeOfString:@"."].location +1] length];
            float padding = log10f(length<6? length:6);
            number = @([formatNumberString floatValue] + padding);
        }
    }
    
    NSString *str = [NSString stringWithFormat:@"%@",number];
    if([str rangeOfString:@"."].location != NSNotFound){
        NSUInteger length = [[str substringFromIndex:[str rangeOfString:@"."].location +1] length];
        // Max Multiple is 6
        return  length >= 6 ? pow(10, 6): pow(10, (int)length);
    }
    return 0;
}

- (NSString *)stringFromNumber:(NSNumber *)number numberFormatter:(NSNumberFormatter *)formattor{
    if(!formattor){
        formattor = [[NSNumberFormatter alloc] init];
        formattor.formatterBehavior = NSNumberFormatterBehavior10_4;
        formattor.numberStyle = NSNumberFormatterDecimalStyle;
    }
    return [formattor stringFromNumber:number];
}

- (NSString *)finalString:(NSNumber *)number stringFormat:(NSString *)formatStr andFormatter:(NSNumberFormatter *)formatter{
    NSString *finalString = nil;
    if(formatter){
        finalString = [NSString stringWithFormat:formatStr,[self stringFromNumber:number numberFormatter:formatter]];
    }else{
        NSAssert([formatStr rangeOfString:@"%@"].location == NSNotFound, @"string format type is not matched,please check your format type");
        finalString = [NSString stringWithFormat:formatStr,[number doubleValue]];
    }
    return finalString;
}

- (NSNumberFormatter *)defaultFormatter{
    NSNumberFormatter *formattor = [[NSNumberFormatter alloc] init];
    formattor.formatterBehavior = NSNumberFormatterBehavior10_4;
    formattor.numberStyle = NSNumberFormatterDecimalStyle;
    return formattor;
}

- (NSString *)regexNumberFormat:(NSString *)formatString{
    NSError *regexError = nil;
    NSRegularExpression *regex =
    [NSRegularExpression regularExpressionWithPattern:@"^%((\\d+.\\d+)|(\\d+).|(.\\d+))f$"
                                              options:NSRegularExpressionCaseInsensitive
                                                error:&regexError];
    if (!regexError) {
        NSTextCheckingResult *match = [regex firstMatchInString:formatString
                                                        options:0
                                                          range:NSMakeRange(0, [formatString length])];
        if (match) {
            NSString *result = [formatString substringWithRange:match.range];
            return result;
        }
    } else {
        NSLog(@"error - %@", regexError);
    }
    return @"%f";
}

@end

@implementation NSDictionary(FlickerNumber)

+ (instancetype)dictionaryWithAttribute:(NSDictionary *)attribute andRange:(NSRange)range{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setObject:attribute forKey:DictArrtributeKey];
    [dict setObject:[NSValue valueWithRange:range] forKey:DictRangeKey];
    return dict;
}

@end
