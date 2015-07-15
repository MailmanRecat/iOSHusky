//
//  FerryBoat.h
//  12306
//
//  Created by caine on 7/13/15.
//  Copyright (c) 2015 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuskyButton.h"
#import "NSLayoutConstraint+SpectacledBearEdgeConstraint.h"
#import "coconut.h"

@interface FerryBoat : UIView

@property( nonatomic, strong ) HuskyButton *leftSide;
@property( nonatomic, strong ) HuskyButton *river;
@property( nonatomic, strong ) HuskyButton *rightSide;
@property( nonatomic, strong ) coconut     *coconut;
@property( nonatomic, strong ) UILabel     *dateLabel;

- (void)sunset;
- (void)sunrise;

@end
