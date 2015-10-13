//
//  ToDoCell.h
//  EveryDo
//
//  Created by Adam Goldberg on 2015-10-13.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDoCell;

@protocol ToDoCellDelegate <NSObject>

-(void)cellSwipedAway:(ToDoCell *)theCell;

@end


@interface ToDoCell : UITableViewCell

@property (nonatomic, weak) id <ToDoCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *priority;

@property (strong, nonatomic) IBOutlet UILabel *preview;

@property (strong, nonatomic) IBOutlet UILabel *toDoTitle;




@end
