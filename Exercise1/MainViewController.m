//
//  ViewController.m
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import "MainViewController.h"
#import "NumberPadViewController.h"
#import "OperandsViewController.h"

@interface MainViewController ()
@property (nonatomic, weak) IBOutlet UIButton *firstNumberButton;
@property (nonatomic, weak) IBOutlet UIButton *secondNumberButton;
@property (nonatomic, weak) IBOutlet UIButton *operandButton;
@property (nonatomic, weak) IBOutlet UILabel *resultsLabel;
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSNumberFormatter *)numberFormatter
{
    if(!_numberFormatter)
    {
        _numberFormatter = [[NSNumberFormatter alloc] init];
        _numberFormatter.minimumFractionDigits = 0;
        _numberFormatter.maximumFractionDigits = 10;
        _numberFormatter.minimumIntegerDigits = 1;
    }
    return _numberFormatter;
}

-(IBAction)performCalculation:(id)sender
{
    NSInteger firstNumber = [[self.numberFormatter numberFromString:[self.firstNumberButton titleForState:UIControlStateNormal]] integerValue];
    NSInteger secondNumber = [[self.numberFormatter numberFromString:[self.secondNumberButton titleForState:UIControlStateNormal]] integerValue];
    NSString *operand = [self.operandButton titleForState:UIControlStateNormal];
    NSNumber *result = [self performOperand:operand onNumber:firstNumber andNumber:secondNumber];
    
    if(result)
        self.resultsLabel.text = [self.numberFormatter stringFromNumber:result];
    else
        self.resultsLabel.text = @"Error";
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"numberPopover"])
    {
        UIButton *button = (UIButton *)sender;
        [button setTitle:@"0" forState:UIControlStateNormal];
        NumberPadViewController *numberPopver = segue.destinationViewController;
        
        numberPopver.numberTap = ^(NSNumber *number){
            NSString *existingNumberString = [button titleForState:UIControlStateNormal];
            if([existingNumberString isEqualToString:@"0"])
                existingNumberString = @"";
            NSString *newNumberString = [self.numberFormatter stringFromNumber:number];
            existingNumberString = [existingNumberString stringByAppendingString:newNumberString];
            [button setTitle:existingNumberString forState:UIControlStateNormal];
        };
        
        numberPopver.clear = ^{
            [((UIButton *)sender) setTitle:@"0" forState:UIControlStateNormal];
        };
    }
    if([segue.identifier isEqualToString:@"operandPopover"])
    {
        OperandsViewController *operandPopver = segue.destinationViewController;
        operandPopver.completion = ^(NSString *operand){
            [((UIButton *)sender) setTitle:operand forState:UIControlStateNormal];
        };
    }
}

-(NSNumber *)performOperand:(NSString *)operand onNumber:(NSInteger)firstNumber andNumber:(NSInteger)secondNumber
{
    NSNumber *result;
    
    if([operand isEqualToString:@"+"])
    {
        result = [NSNumber numberWithDouble:(firstNumber + secondNumber)];
    }
    if([operand isEqualToString:@"-"])
    {
        result = [NSNumber numberWithDouble:(firstNumber - secondNumber)];
    }
    if([operand isEqualToString:@"*"])
    {
        result = [NSNumber numberWithDouble:(firstNumber * secondNumber)];
    }
    if([operand isEqualToString:@"/"])
    {
        if(secondNumber != 0)
            result = [NSNumber numberWithDouble:((double)firstNumber / secondNumber)];
    }
    
    return result;
}

@end
