//
//  CusProgressView.m
//  YCusProgressBar
//
//  Created by jw on 13-4-12.
//  Copyright (c) 2013年 jw. All rights reserved.
//

#import "CusProgressView.h"

@implementation CusProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
        self.animated           = YES;
    return self;
}

-(void)awakeFromNib
{
    NSLog(@"%@",self.subviews);
    
    for(UIView *SubView in self.subviews){
        [SubView removeFromSuperview];
    }
    
        self.animated           = YES;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{

   // [super drawRect:rect];
    AOffsetInteger++;
    if (AOffsetInteger>14) {
        AOffsetInteger=0;
    }
    
    
    
    CGRect AInnerRect=CGRectMake(0, 0, self.progress*rect.size.width, rect.size.height);
    [self DrawProgressBarWithRect:AInnerRect];
    [self DRawStripesWithRect:AInnerRect];//启用条纹效果
    // Drawing code
}

//动画效果
- (void)setAnimated:(BOOL)_animated
{
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/30
                                     target:self
                                   selector:@selector(setNeedsDisplay)
                                   userInfo:nil
                                    repeats:YES];
}


-(void)DrawProgressBarWithRect:(CGRect)ARect
{
    CGContextRef AContextRef=UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(AContextRef, 1.0, 1.0, 0.0, 1.0);
        
    UIBezierPath *AInnerBezierPath=[UIBezierPath bezierPathWithRoundedRect:ARect cornerRadius:ARect.size.height/2];
    CGContextAddPath(AContextRef, [AInnerBezierPath CGPath]);
    CGContextClip(AContextRef);
    CGContextFillRect(AContextRef, ARect);

}


//绘制条纹
-(void)DRawStripesWithRect:(CGRect)ARect;
{
    CGContextRef AContextRef=UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(AContextRef, 0, 1.0, 0, 1.0);

    //对条纹进行裁剪，提出超出边界的部分
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:ARect cornerRadius:ARect.size.height/2];
    CGContextAddPath(AContextRef, [clipPath CGPath]);
    CGContextClip(AContextRef);
    
    float AStripesFloat=ARect.size.width/(2*5);
            UIBezierPath *AStripesBezerPath=[UIBezierPath bezierPath];
    for (int i=0; i<1+AStripesFloat; i++) {
        float AOriginFloat=i*2*5+AOffsetInteger;//每个条纹的起点X坐标
        [AStripesBezerPath moveToPoint:CGPointMake(AOriginFloat, 0)];
        [AStripesBezerPath addLineToPoint:CGPointMake(AOriginFloat-5, 0)];
        [AStripesBezerPath addLineToPoint:CGPointMake(AOriginFloat-5+3, ARect.size.height)];
        [AStripesBezerPath addLineToPoint:CGPointMake(AOriginFloat+3, ARect.size.height)];
    }
    
    [AStripesBezerPath closePath];
    CGContextAddPath(AContextRef, [AStripesBezerPath CGPath]);
    CGContextClip(AContextRef);
    CGContextFillRect(AContextRef, ARect);
}
@end
