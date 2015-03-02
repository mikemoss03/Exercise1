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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        _numberFormatter.minimumIntegerDigits = 1;
    }
    return _numberFormatter;
}

-(IBAction)numberTapped:(UIButton *)sender
{
    if(self.numberTap)
    {
        NSNumber *number = [self.numberFormatter numberFromString:[sender titleForState:UIControlStateNormal]];
        self.numberTap(number);
    }
    
//    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)clear:(id)sender
{
    self.clear();
}

-(IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
