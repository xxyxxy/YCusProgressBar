//
//  ViewController.h
//  YCusProgressBar
//
//  Created by jw on 13-4-12.
//  Copyright (c) 2013年 jw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CusProgressView.h"

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *FProgressValueLabel;
@property (retain, nonatomic) IBOutlet CusProgressView *FCusProgressView;

@property (retain, nonatomic) IBOutlet UIImageView *FImageView;
-(IBAction)Select:(id)sender;
@end
