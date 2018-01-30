//
//  KERippleButton.h
//  KERippleEffectedView
//
//  Created by Kaan Esin on 30.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KERippleButton : UIButton

@property (nonatomic) BOOL isRippleContinues;

-(void)showRippleEffect:(id)sender isRounded:(BOOL)isRounded rippleColor:(UIColor*)rippleColor;
-(void)showRippleEffect:(id)sender isRounded:(BOOL)isRounded rippleColor:(UIColor*)rippleColor hasLoop:(BOOL)hasLoop;

@end
