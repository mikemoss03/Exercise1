//
//  NumberPadViewController.h
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPadViewController : UIViewController
@property (nonatomic, strong) void (^numberTap)(NSNumber *);
@property (nonatomic, strong) void (^clear)();
@end