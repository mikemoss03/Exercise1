//
//  CalculatorEngine.h
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorEngine : NSObject

+(NSNumber *)performOperation:(NSString *)operation onNumber:(NSInteger)firstNumber andNumber:(NSInteger)secondNumber;

@end
