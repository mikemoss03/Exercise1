//
//  NumberPadViewController.h
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPadViewController : UIViewController
//Action Blocks
@property (nonatomic, strong) void (^numberTapBlock)(NSNumber *);
@property (nonatomic, strong) void (^clearBlock)();
@property (nonatomic, strong) void (^doneBlock)();

@end
