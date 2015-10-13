//
//  ModalViewController.m
//  EveryDo
//
//  Created by Adam Goldberg on 2015-10-13.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "ModalViewController.h"
#import "ToDo.h"



@implementation ModalViewController

- (IBAction)dismiss:(id)sender {
    ToDo *addedToDo = [[ToDo alloc] initWithTitle:self.myToDoTitle.text description:self.myToDoDescrip.text priority:[self.myToDoPriorityNum.text integerValue]];
    [self.delegate addNewToDoItem:addedToDo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidLoad
{ [super viewDidLoad];
    self.myToDoTitle.delegate = self;
    self.myToDoDescrip.delegate = self;
    self.myToDoPriorityNum.delegate = self;
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}


@end
