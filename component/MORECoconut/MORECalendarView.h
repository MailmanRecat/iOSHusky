//
//  MORECalendarView.h
//  12306
//
//  Created by caine on 11/14/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MORECoconutTree.h"

@interface MORECalendarView : UIView

@property( nonatomic, strong ) MORECoconutTree *coconutTree;

- (instancetype)initWithMonthOffset:(NSInteger)offset;
- (void)updateMonthOffset:(NSInteger)offset;

@end
