//
//  ToDoCell.m
//  EveryDo
//
//  Created by Adam Goldberg on 2015-10-13.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "ToDoCell.h"


@implementation ToDoCell

- (void)awakeFromNib {
    UISwipeGestureRecognizer *swipeCell = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAwayToDo:)];
    [self addGestureRecognizer:swipeCell];
}

-(void)swipeAwayToDo:(UISwipeGestureRecognizer*)swiped {
    [self.delegate cellSwipedAway:self];
}




@end
