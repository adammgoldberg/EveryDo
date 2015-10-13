//
//  ToDo.m
//  EveryDo
//
//  Created by Adam Goldberg on 2015-10-13.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo


- (instancetype)initWithTitle:(NSString*)title description:(NSString*)description priority:(NSInteger)priority;
{
    self = [super init];
    if (self) {
        self.itemTitle = title;
        self.itemDescription = description;
        self.priorityNumber = priority;
        self.completedIndicator = NO;
    }
    return self;
}

@end
