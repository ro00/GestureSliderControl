//
//  ROGestureControlView.h
//  ROPhotoEditor
//
//  Created by Hans on 4/10/13.
//  Copyright (c) 2013 RO-ENTERTAINMENT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ROGestureControlViewDelegate <NSObject>

-(void)valueChanaged:(CGFloat)pointValue;

@end

@interface ROGestureControlView : UIView{
    NSString *labelText;
    UILabel* myLabel;
    CGFloat value;
    CGFloat max;
    CGFloat min;
    CGPoint lastPoint;
    CGFloat changeTolerance;
    
    CGFloat scale;
}

@property (nonatomic,weak) id<ROGestureControlViewDelegate> delegate;

-(void)activateWithlabelName:(NSString*)labelName maxValue:(CGFloat)m minValue:(CGFloat)mi default:(CGFloat)df;
-(void)dismiss;

@end
