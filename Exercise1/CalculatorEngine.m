//
//  CalculatorEngine.m
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import "CalculatorEngine.h"

@implementation CalculatorEngine

//Perform Operations
//  - Returns an NSNumber in order to make error checking easier. Any error in calculation will return nil
//  - If nil is returned from this method it is usually because the user attempted to divide by zero.
+(NSNumber *)performOperation:(NSString *)operation onNumber:(NSInteger)firstNumber andNumber:(NSInteger)secondNumber
{
    NSNumber *result;
    
    if([operation isEqualToString:@"+"])
    {
        result = [NSNumber numberWithDouble:(firstNumber + secondNumber)];
    }
    if([operation isEqualToString:@"-"])
    {
        result = [NSNumber numberWithDouble:(firstNumber - secondNumber)];
    }
    if([operation isEqualToString:@"*"])
    {
        result = [NSNumber numberWithDouble:(firstNumber * secondNumber)];
    }
    if([operation isEqualToString:@"/"])
    {
        if(secondNumber != 0)
            result = [NSNumber numberWithDouble:((double)firstNumber / secondNumber)];
    }
    
    return result;
}

@end
