//
//  ROGestureControlView.m
//  ROPhotoEditor
//
//  Created by Hans on 4/10/13.
//  Copyright (c) 2013 RO-ENTERTAINMENT. All rights reserved.
//

#import "ROGestureControlView.h"


@implementation ROGestureControlView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(void)setup{
    myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 166, 37)];
    myLabel.backgroundColor=[UIColor blackColor];
    myLabel.textColor = [UIColor whiteColor];
    myLabel.textAlignment=UITextAlignmentCenter;
    [self addSubview:myLabel];
    [myLabel alignTo:UIViewAlignmentCenter|UIViewAlignmentTop margins:UIEdgeInsetsMake(20, 0, 0, 0)];
    self.hidden =YES;
    self.multipleTouchEnabled = NO;
    changeTolerance = 0.05;
    scale = 5.;
}

-(void)activateWithlabelName:(NSString*)labelName maxValue:(CGFloat)m minValue:(CGFloat)mi default:(CGFloat)df{
    df = df*scale;
    value = df;
    myLabel.text = [NSString stringWithFormat:@"%@ : %.0f",labelName,df/scale];
    max = m*scale;
    min = mi*scale;
    labelText = labelName;
    self.hidden = NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    lastPoint = [touch locationInView:self];
}

-(void)dismiss{
    [UIView animateWithDuration:0.3 animations:^{
        myLabel.alpha=0;
    }completion:^(BOOL fin){
        [self removeFromSuperview];
    }];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    CGFloat changed = p.x-lastPoint.x;
    lastPoint = p;
    value = value+changed;
    if (value>max) {
        value=max;
    }else if(value<min){
        value=min;
    }
    if (fabs(changed)>changeTolerance) {
        [self.delegate valueChanaged:value/scale];
        myLabel.text = [NSString stringWithFormat:@"%@ : %.0f",labelText,value/scale];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
