//
//  GoogleInboxLoadingView.h
//  dome12715
//
//  Created by caine on 8/8/15.
//  Copyright (c) 2015 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSLayoutConstraint+SpectacledBearEdgeConstraint.h"

@interface GoogleInboxLoadingView : UIView

@property( nonatomic, assign ) NSTimeInterval  duration;
@property( nonatomic, strong ) NSArray        *colors;
//@property( nonatomic, strong ) UIColor        *defaultColor;

- (void)defaultColor:(UIColor *)color;

- (void)ON;
- (void)OFF;
- (void)Toggle;
- (void)Once;

@end
