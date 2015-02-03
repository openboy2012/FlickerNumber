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

@end

static char flickerNumberKey;

@implementation UILabel (FlickerNumber)

#pragma mark - runtime methods
- (void)setFlickerNumber:(NSNumber *)flickerNumber{
    objc_setAssociatedObject(self, &flickerNumberKey, flickerNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)flickerNumber{
    return objc_getAssociatedObject(self, &flickerNumberKey);
}

#pragma mark - flicker methods

- (void)dd_setNumber:(NSNumber *)number{
    [self dd_setNumber:number duration:1.0 format:nil attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number attributes:(id)attrs{
    [self dd_setNumber:number duration:1.0 format:nil attributes:attrs];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration{
    [self dd_setNumber:number duration:duration format:nil attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number format:(NSString *)formatStr{
    [self dd_setNumber:number duration:1.0 format:formatStr attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration attributes:(id)attrs{
    [self dd_setNumber:number duration:duration format:nil attributes:attrs];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr{
    [self dd_setNumber:number duration:duration format:formatStr attributes:nil];
}

- (void)dd_setNumber:(NSNumber *)number duration:(NSTimeInterval)duration format:(NSString *)formatStr attributes:(id)attrs{
    
    if(![number isKindOfClass:[NSNumber class]]){
        NSAssert(![number isKindOfClass:[NSNumber class]], @"number type is woring, exit");
        return;
    }
    
    //initialize useinfo dict
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithCapacity:0];
    [userInfo setObject:number forKey:ResultNumberKey];
    
    //initialize variables
    int beginNumber = 0;
    [userInfo setObject:@(beginNumber) forKey:BeginNumberKey];
    self.flickerNumber = @(0);
    int endNumber = 0;
    
    //get multiple if number is float & double type
    int multiple = [self multipleForNumber:number];
    endNumber = multiple > 0 ? [number floatValue] * multiple : [number intValue];
    [userInfo setObject:@(multiple) forKey:MultipleKey];
    [userInfo setObject:@(endNumber) forKey:EndNumberKey];
    [userInfo setObject:@((endNumber * Frequency)/duration) forKey:RangeIntegerKey];
    
    if(attrs)
       [userInfo setObject:attrs forKey:AttributeKey];
    
    if(formatStr)
       [userInfo setObject:formatStr forKey:FormatKey];

    [NSTimer scheduledTimerWithTimeInterval:Frequency target:self selector:@selector(flickerAnimation:) userInfo:userInfo repeats:YES];
}


#pragma mark - private methods
/**
 *  flicker number animation
 *
 *  @param timer schedule timer
 */
- (void)flickerAnimation:(NSTimer *)timer{
    float rangeInteger = [timer.userInfo[RangeIntegerKey] floatValue];
    self.flickerNumber = @([self.flickerNumber floatValue] + rangeInteger);
    
    int multiple = [timer.userInfo[MultipleKey] intValue];
    if(multiple > 0){
        [self floatNumberHandler:timer andMultiple:multiple];
        return;
    }
    
    NSString *formatStr = timer.userInfo[FormatKey]?:@"%.0f";
    self.text = [NSString stringWithFormat:formatStr,[self.flickerNumber floatValue]];
    
    if(timer.userInfo[AttributeKey]){
        [self attributedHandler:timer.userInfo[AttributeKey]];
    }
    
    if([self.flickerNumber intValue] >= [timer.userInfo[EndNumberKey] intValue]){
        self.text = [NSString stringWithFormat:formatStr,[timer.userInfo[ResultNumberKey] floatValue]];
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
    NSString *formatStr = timer.userInfo[FormatKey]?:[NSString stringWithFormat:@"%%.%df",(int)log10(multiple)];
    self.text = [NSString stringWithFormat:formatStr,[self.flickerNumber floatValue]/multiple];
    if(timer.userInfo[AttributeKey]){
        [self attributedHandler:timer.userInfo[AttributeKey]];
    }
    if([self.flickerNumber intValue] >= [timer.userInfo[EndNumberKey] intValue]){
        self.text = [NSString stringWithFormat:formatStr,[timer.userInfo[ResultNumberKey] floatValue]];
        if(timer.userInfo[AttributeKey]){
            [self attributedHandler:timer.userInfo[AttributeKey]];
        }
        [timer invalidate];
    }
}

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
- (int)multipleForNumber:(NSNumber *)number{
    NSString *str = [NSString stringWithFormat:@"%@",number];
    if([str rangeOfString:@"."].location != NSNotFound){
        NSUInteger length = [[str substringFromIndex:[str rangeOfString:@"."].location +1] length];
        // Max Multiple is 6
        return  length >= 6 ? pow(10, 6): pow(10, (int)length) ;
    }
    return 0;
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
