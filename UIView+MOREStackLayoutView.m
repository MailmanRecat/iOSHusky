//
//  UIView+MOREStackLayoutView.m
//  more check
//
//  Created by caine on 11/11/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import "UIView+MOREStackLayoutView.h"

@implementation UIView (MOREStackLayoutView)

- (void)autolayoutSubviews:(NSArray *)subviews
                edgeInsets:(UIEdgeInsets)insets
                multiplier:(CGFloat)multiplier
                 constants:(CGFloat)constant
          stackOrientation:(autolayoutStackOrientation)orientation{
    
    for( UIView *view in subviews ){
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
    }
    
    if( [subviews count] == 1 ){
        
        UIView *view = (UIView *)subviews[0];
        
        [self basiclayoutViews:view
                    edgeInsets:insets
                    multiplier:multiplier
                     constants:constant
              stackOrientation:orientation];
        
        return;
    }
    
    if( orientation == autolayoutStackOrientationHorizontal )
        [self autolayoutHorizontalSubviews:subviews
                                edgeInsets:insets
                                multiplier:multiplier
                                  constant:constant
                                  zeroEdge:YES];
    else
        [self autolayoutVerticalSubviews:subviews
                              edgeInsets:insets
                              multiplier:multiplier
                                constant:constant
                                zeroEdge:YES];
}

- (void)basiclayoutViews:(UIView *)view
                 edgeInsets:(UIEdgeInsets)insets
                 multiplier:(CGFloat)multiplier
                  constants:(CGFloat)constant
           stackOrientation:(autolayoutStackOrientation)orientation{
        
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:view to:self type:EdgeCenterXY]];
        
        if( orientation == autolayoutStackOrientationHorizontal ){
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:multiplier
                                                              constant:constant]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant: -(insets.top + insets.bottom)]];
        }else if( orientation == autolayoutStackOrientationVertical ){
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant: -( insets.left + insets.right )]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:multiplier
                                                              constant:constant]];
        }
}

- (void)autolayoutVerticalSubviews:(NSArray *)subviews
                        edgeInsets:(UIEdgeInsets)insets
                        multiplier:(CGFloat)multiplier
                          constant:(CGFloat)constant
                          zeroEdge:(BOOL)zeroEdge{
    
    [subviews enumerateObjectsUsingBlock:^( id obj, NSUInteger index, BOOL *stop ){
        
        if( index == 0 ){
            
            [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeTopZero constant:insets.top]];
            
        }else if( index == [subviews count] - 1 ){
            
            if( zeroEdge )
                [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeBottomZero constant:insets.bottom]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:subviews[ index - 1 ]
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:insets.top]];
            
        }else{
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:subviews[ index - 1 ]
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1.0
                                                              constant:insets.top]];
            
        }
        
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeLeftZero constant:insets.left]];
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeRightZero constant:insets.right]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant: -( insets.left + insets.right )]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:multiplier
                                                          constant:constant]];
        
    }];
}

- (void)autolayoutHorizontalSubviews:(NSArray *)subviews
                          edgeInsets:(UIEdgeInsets)insets
                          multiplier:(CGFloat)multiplier
                            constant:(CGFloat)constant
                            zeroEdge:(BOOL)zeroEdge{
    
    [subviews enumerateObjectsUsingBlock:^( id obj, NSUInteger index, BOOL *stop ){
        
        if( index == 0 ){
            
            [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeLeftZero constant:insets.left]];
            
        }else if( index == [subviews count] - 1 ){
            
            if( zeroEdge )
                [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeRightZero constant:insets.right]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:subviews[ index - 1 ]
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:insets.left]];
            
        }else{
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:subviews[ index - 1 ]
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0
                                                              constant:insets.left]];
            
        }
        
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeTopZero constant:insets.top]];
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:obj to:self type:EdgeBottomZero constant:insets.bottom]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:multiplier
                                                          constant:constant]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:obj
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1.0
                                                          constant: -(insets.top + insets.bottom)]];
    }];
}

- (void)autolayoutPushSubviews:(NSArray *)subviews edgeInsets:(UIEdgeInsets)insets multiplier:(CGFloat)multiplier constants:(CGFloat)constant stackOrientation:(autolayoutStackOrientation)orientation{
    
    for( UIView *view in subviews ){
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
    }
    
    if( [subviews count] == 1 ){
        
        UIView *view = (UIView *)subviews[0];
        
        [self basiclayoutViews:view
                    edgeInsets:insets
                    multiplier:multiplier
                     constants:constant
              stackOrientation:orientation];
        
        return;
    }
    
    if( orientation == autolayoutStackOrientationHorizontal )
        [self autolayoutHorizontalSubviews:subviews
                                edgeInsets:insets
                                multiplier:multiplier
                                  constant:constant
                                  zeroEdge:NO];
    else
        [self autolayoutVerticalSubviews:subviews
                              edgeInsets:insets
                              multiplier:multiplier
                                constant:constant
                                zeroEdge:NO];
    
}

@end
