//
//  coconut.h
//  12306
//
//  Created by caine on 7/14/15.
//  Copyright (c) 2015 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuskyButton.h"
#import "coconutButton.h"

@interface coconut : UIView

- (instancetype)initWithFrame:(CGRect)frame offsetMonth:(NSInteger)offset;

- (NSUInteger)coconutDay;
- (NSUInteger)coconutMonth;
- (NSUInteger)coconutYear;

@end
