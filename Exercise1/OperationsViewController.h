//
//  OperationsViewController.h
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OperationsViewController;

@protocol OperationsPopoverDelegate <NSObject>
@optional
-(void)operationPopover:(OperationsViewController *)operationPopover didTapOperation:(NSString *)operation sender:(id)sender;
@end

@interface OperationsViewController : UIViewController
@property (nonatomic, weak) id<OperationsPopoverDelegate> delegate;
@property (nonatomic, weak) id sender;

@end
