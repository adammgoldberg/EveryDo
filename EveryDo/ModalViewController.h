//
//  ModalViewController.h
//  EveryDo
//
//  Created by Adam Goldberg on 2015-10-13.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDo;

@protocol ModalDelegate <NSObject>

-(void)addNewToDoItem:(ToDo*)addedItem;

@end

@interface ModalViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <ModalDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *myToDoTitle;

@property (strong, nonatomic) IBOutlet UITextField *myToDoDescrip;

@property (strong, nonatomic) IBOutlet UITextField *myToDoPriorityNum;


-(BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
