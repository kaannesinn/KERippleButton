//
//  KERippleButton.m
//  KERippleEffectedView
//
//  Created by Kaan Esin on 30.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import "KERippleButton.h"

@implementation KERippleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)showRippleEffect:(id)sender isRounded:(BOOL)isRounded rippleColor:(UIColor*)rippleColor{
    [self showRippleEffect:sender isRounded:isRounded rippleColor:rippleColor hasLoop:NO];
}
-(void)showRippleEffect:(id)sender isRounded:(BOOL)isRounded rippleColor:(UIColor*)rippleColor hasLoop:(BOOL)hasLoop{
    UIButton *buttonWillBeRippled = (UIButton*)sender;
    
    UIButton *btnRippleBackground = [UIButton buttonWithType:UIButtonTypeSystem];
    btnRippleBackground.frame = CGRectMake(buttonWillBeRippled.frame.origin.x,
                                           buttonWillBeRippled.frame.origin.y,
                                           buttonWillBeRippled.frame.size.width,
                                           buttonWillBeRippled.frame.size.height);
    
    btnRippleBackground.backgroundColor = rippleColor;
    
    btnRippleBackground.layer.cornerRadius = buttonWillBeRippled.layer.cornerRadius;
    btnRippleBackground.layer.masksToBounds = YES;
    
    btnRippleBackground.alpha = 0.0;
    
    [buttonWillBeRippled.superview addSubview:btnRippleBackground];
    [buttonWillBeRippled.superview bringSubviewToFront:buttonWillBeRippled];
    
    CGFloat offset = 10.0;
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        btnRippleBackground.frame = CGRectMake(btnRippleBackground.frame.origin.x - offset,
                                               btnRippleBackground.frame.origin.y - offset,
                                               btnRippleBackground.frame.size.width + offset*2,
                                               btnRippleBackground.frame.size.height + offset*2);
        btnRippleBackground.alpha = 0.3;
        
        if (isRounded) {
            btnRippleBackground.layer.cornerRadius = btnRippleBackground.frame.size.width / 2;
        }
        
        btnRippleBackground.backgroundColor = rippleColor;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                btnRippleBackground.frame = CGRectMake(btnRippleBackground.frame.origin.x - offset,
                                                       btnRippleBackground.frame.origin.y - offset,
                                                       btnRippleBackground.frame.size.width + offset*2,
                                                       btnRippleBackground.frame.size.height + offset*2);
                btnRippleBackground.alpha = 0.0;
                
                if (isRounded) {
                    btnRippleBackground.layer.cornerRadius = btnRippleBackground.frame.size.width / 2;
                }
                
                btnRippleBackground.backgroundColor = rippleColor;
            } completion:^(BOOL finished) {
                [btnRippleBackground removeFromSuperview];
                
                if (hasLoop) {
                    self.isRippleContinues = YES;
                    [self showRippleEffect:sender isRounded:isRounded rippleColor:rippleColor hasLoop:hasLoop];
                }
            }];
        }
    }];
}

@end
