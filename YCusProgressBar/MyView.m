//
//  MyView.m
//  YCusProgressBar
//
//  Created by jw on 13-4-12.
//  Copyright (c) 2013年 jw. All rights reserved.
//

#import "MyView.h"
#define Radius 20
@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    UIImageView *AImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Mario.png"]];
    AImageView.tag=101;
    AImageView.frame=CGRectMake(-20,  self.frame.size.height/2, 40, 40);
    [self addSubview:AImageView];
    [AImageView release];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
   // CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *clipPath =[UIBezierPath bezierPath];
    for (int i=0; i<8; i++) {
        BOOL ABOOL=YES;
        if (i%2==0) {
            ABOOL=NO;
        }
        UIBezierPath *AclipPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(Radius+i*Radius*2, self.frame.size.height/2) radius:20 startAngle:M_PI endAngle:0 clockwise:ABOOL];
        [clipPath stroke];
        [clipPath appendPath:AclipPath];
    }
    
    UIImageView *AImageView=(UIImageView *)[self viewWithTag:101];
    CAKeyframeAnimation *jumpAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    jumpAnimation.autoreverses = YES;
    jumpAnimation.path = clipPath.CGPath;
    AImageView.layer.position=CGPointMake(300, self.frame.size.height/2);
    jumpAnimation.duration = 3.;
    jumpAnimation.delegate=self;
     jumpAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [AImageView.layer removeAnimationForKey:@"marioJump"];
    [AImageView.layer addAnimation:jumpAnimation forKey:@"marioJump"];
  
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)finished {
    [self setNeedsDisplay];
}

@end
