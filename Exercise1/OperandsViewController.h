//
//  OperandsViewController.h
//  Exercise1
//
//  Created by Mike on 3/2/15.
//  Copyright (c) 2015 Mike Moss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperandsViewController : UIViewController
@property (nonatomic, strong) void (^completion)(NSString *);

@end