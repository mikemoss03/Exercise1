//
//  NumberPadViewController.m
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import "NumberPadViewController.h"

@interface NumberPadViewController ()
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@end

@implementation NumberPadViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Getters / Setters
-(NSNumberFormatter *)numberFormatter
{
    if(!_numberFormatter)
    {
        _numberFormatter = [[NSNumberFormatter alloc] init];
        _numberFormatter.minimumFractionDigits = 0;
        _numberFormatter.minimumIntegerDigits = 1;
    }
    return _numberFormatter;
}

#pragma mark - Actions
-(IBAction)numberTapped:(UIButton *)sender
{
    if(self.numberTapBlock)
    {
        NSNumber *number = [self.numberFormatter numberFromString:[sender titleForState:UIControlStateNormal]];
        self.numberTapBlock(number);
    }
}

-(IBAction)clear:(id)sender
{
    if(self.clearBlock)
    {
        self.clearBlock();
    }
}

-(IBAction)done:(id)sender
{
    if(self.doneBlock)
    {
        self.doneBlock();
    }
}

@end
