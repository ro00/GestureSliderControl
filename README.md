Simple gesture control let you control the value by sliding in the blank view
Silde right to increase the number/left to decrease

How:

1.add it to your view and set the frame of the touchable area

2.
call 
-(void)activateWithlabelName:(NSString*)labelName maxValue:(CGFloat)m minValue:(CGFloat)mi default:(CGFloat)df;

3.if you want to clear the view,call -dismiss

4.implement -(void)valueChanaged:(CGFloat)pointValue to receive the call back
