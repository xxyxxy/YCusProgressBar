//
//  CusProgressView.h
//  YCusProgressBar
//
//  Created by jw on 13-4-12.
//  Copyright (c) 2013年 jw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CusProgressView : UIProgressView
{
    NSInteger AOffsetInteger;//动画偏移量
}
@property (nonatomic, getter = isAnimated) BOOL animated;
@end
