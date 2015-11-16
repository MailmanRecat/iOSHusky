//
//  UIView+MOREStackLayoutView.h
//  more check
//
//  Created by caine on 11/11/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSLayoutConstraint+SpectacledBearEdgeConstraint.h"

typedef NS_ENUM(NSInteger, autolayoutStackOrientation){
    autolayoutStackOrientationHorizontal = 0,
    autolayoutStackOrientationVertical
};

@interface UIView (MOREStackLayoutView)

- (void)autolayoutSubviews:(NSArray *)subviews
                edgeInsets:(UIEdgeInsets)insets
                multiplier:(CGFloat)multiplier
                 constants:(CGFloat)constant
          stackOrientation:(autolayoutStackOrientation)orientation;

- (void)autolayoutPushSubviews:(NSArray *)subviews
                edgeInsets:(UIEdgeInsets)insets
                multiplier:(CGFloat)multiplier
                 constants:(CGFloat)constant
          stackOrientation:(autolayoutStackOrientation)orientation;

@end
