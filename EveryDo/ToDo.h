//
//  ToDo.h
//  EveryDo
//
//  Created by Adam Goldberg on 2015-10-13.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *itemTitle;

@property (nonatomic, strong) NSString *itemDescription;

@property (nonatomic, assign) NSInteger priorityNumber;

@property (nonatomic, assign) BOOL completedIndicator;


- (instancetype)initWithTitle:(NSString*)title description:(NSString*)description priority:(NSInteger)priority;





@end
