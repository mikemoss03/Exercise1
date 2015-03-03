//
//  OperantionsViewController.m
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import "OperationsViewController.h"

@interface OperationsViewController ()

@end

@implementation OperationsViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions
-(IBAction)operationTapped:(UIButton *)sender
{
    if([self.delegate respondsToSelector:@selector(operationPopover:didTapOperation:sender:)])
    {
        NSString *string = [sender titleForState:UIControlStateNormal];
        [self.delegate operationPopover:self didTapOperation:string sender:self.sender];
    }
}

@end
