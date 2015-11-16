//
//  MORECoconutTree.h
//  12306
//
//  Created by caine on 11/13/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MORECoconutTreeOption){
    MORECoconutTreeOptionNone = 0,
    MORECoconutTreeOptionsShowWeekdays
};

@protocol MORECoconutTreeDelegate <NSObject>

@required

- (UIView *)MORECoconutTreeCell;
- (void)MORECoconutTreeSetCellTextWithView:(UIView *)view date:(NSDateComponents *)date;

@end

@interface MORECoconutTree : UIView

@property( nonatomic, weak ) id<MORECoconutTreeDelegate> dataSource;

@property( nonatomic, assign, readonly ) NSUInteger coconutTreeYear;
@property( nonatomic, assign, readonly ) NSUInteger coconutTreeMonth;
@property( nonatomic, assign, readonly ) NSUInteger cocunutTreeFirstWeekday;
@property( nonatomic, assign, readonly ) NSUInteger cocunutTreeDaysOfMonth;

- (instancetype)initWithOffsetMonth:(NSInteger)offset option:(MORECoconutTreeOption)option dataSource:(id)dataSource;
- (void)updateOffset:(CGFloat)offset;

@end
