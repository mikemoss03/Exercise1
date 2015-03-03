//
//  ViewController.m
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import "MainViewController.h"
#import "NumberPadViewController.h"
#import "OperationsViewController.h"
#import "CalculatorEngine.h"

@interface MainViewController ()
@property (nonatomic, weak) IBOutlet UIButton *firstNumberButton;
@property (nonatomic, weak) IBOutlet UIButton *secondNumberButton;
@property (nonatomic, weak) IBOutlet UIButton *operationButton;
@property (nonatomic, weak) IBOutlet UILabel *resultsLabel;
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@end

@implementation MainViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Getters / Setters
//Number Formatter used to format the results of a calculation performed for output to the user
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

#pragma mark - Actions
-(IBAction)performCalculation:(id)sender
{
    NSInteger firstNumber = [[self.numberFormatter numberFromString:[self.firstNumberButton titleForState:UIControlStateNormal]] integerValue];
    NSInteger secondNumber = [[self.numberFormatter numberFromString:[self.secondNumberButton titleForState:UIControlStateNormal]] integerValue];
    NSString *operation = [self.operationButton titleForState:UIControlStateNormal];
    NSNumber *result = [CalculatorEngine performOperation:operation onNumber:firstNumber andNumber:secondNumber];
    
    if(result)
        self.resultsLabel.text = [self.numberFormatter stringFromNumber:result];
    else
        self.resultsLabel.text = @"Error";
}

#pragma mark - Operations Popover Delegate
-(void)operationPopover:(OperationsViewController *)operationPopover didTapOperation:(NSString *)operation sender:(id)sender
{
    if([sender isKindOfClass:[UIButton class]])
        [((UIButton *)sender) setTitle:operation forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:nil];
};

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //This application shows examples of how to communicate action from a popover view controller both in the form of blocks and delegate call backs. Normally only one method or the other would be used. They are different in this case to demonstrate an understanding of both types of logic.
    
    //Used to adjust the popover style when used on phones
    UIPopoverPresentationController *popoverPresentationController = ((UIViewController *)segue.destinationViewController).popoverPresentationController;
    popoverPresentationController.delegate = self;
    
    // -- This segue is an example of using blocks to perform the operations needed in a popover window.
    if([segue.identifier isEqualToString:@"numberPopoverFirst"]
       ||[segue.identifier isEqualToString:@"numberPopoverSecond"])
    {
        UIButton *button = (UIButton *)sender;
        [button setTitle:@"0" forState:UIControlStateNormal];
        NumberPadViewController *numberPopverVC = segue.destinationViewController;

        numberPopverVC.numberTapBlock = ^(NSNumber *number){
            NSString *existingNumberString = [button titleForState:UIControlStateNormal];
            if([existingNumberString isEqualToString:@"0"])
                existingNumberString = @"";
            NSString *newNumberString = [self.numberFormatter stringFromNumber:number];
            existingNumberString = [existingNumberString stringByAppendingString:newNumberString];
            [button setTitle:existingNumberString forState:UIControlStateNormal];
        };
        
        numberPopverVC.clearBlock = ^{
            [((UIButton *)sender) setTitle:@"0" forState:UIControlStateNormal];
        };
        
        numberPopverVC.doneBlock = ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        };
    }
    
    // -- This segue is an example of using delegates to perform the operations needed in a popover window.
    if([segue.identifier isEqualToString:@"operationPopover"])
    {
        OperationsViewController *operationPopverVC = segue.destinationViewController;
        operationPopverVC.delegate = self;
        operationPopverVC.sender = sender;
    }
}

// Used to for the view controller to always be shown as a popover (even on phones)
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}


@end
