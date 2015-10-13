//
//  MasterViewController.m
//  EveryDo
//
//  Created by Adam Goldberg on 2015-10-13.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoCell.h"
#import "ModalViewController.h"

@interface MasterViewController () <ModalDelegate, ToDoCellDelegate>

@property NSMutableArray *objects;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ToDo *firstItem = [[ToDo alloc] initWithTitle:@"Walk the Dog" description:@"When walking the dog, make sure to walk for at least 3km and to stop at the park" priority:1];
    
    ToDo *secondItem = [[ToDo alloc] initWithTitle:@"Go shopping" description:@"Don't forget to buy milk, eggs, and fruit" priority:3];
    
    ToDo *thirdItem = [[ToDo alloc] initWithTitle:@"Clean the house" description:@"People are coming over on the weekend. The house needs to be clean." priority:4];
    
    ToDo *fourthItem = [[ToDo alloc] initWithTitle:@"Return clothes" description:@"The shirt doesn't fit well. Go to the store to return it." priority:5];
    
    ToDo *fifthItem = [[ToDo alloc] initWithTitle:@"Fix the sink" description:@"The sink is leaky and needs to be fixed. Go get tools from the neighbour" priority:2];
    
    
    
    self.objects = [@[firstItem, secondItem, thirdItem, fourthItem, fifthItem] mutableCopy];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

-(void)addNewToDoItem:(ToDo *)addedItem {
    [self.objects insertObject:addedItem atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


-(void)cellSwipedAway:(ToDoCell *)theCell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:theCell];
    ToDo *selectedToDo = self.objects[indexPath.row];
    selectedToDo.completedIndicator = !selectedToDo.completedIndicator;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        ToDo *selectedToDo = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:selectedToDo];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    } else if ([[segue identifier] isEqualToString:@"showModal"]) {
        ModalViewController *modcontroller = (ModalViewController *)[segue destinationViewController];
        modcontroller.delegate = self;
    }
}

#pragma mark - Table View







- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoCell *toDoCell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    toDoCell.delegate = self;
    ToDo *item = self.objects[indexPath.row];
    
    if (item.completedIndicator == YES) {
        
        NSAttributedString *strikethroughTitle = [[NSAttributedString alloc] initWithString:item.itemTitle attributes:@{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)}];
        
        NSAttributedString *strikethroughDescription = [[NSAttributedString alloc] initWithString:item.itemDescription attributes:@{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)}];
        
        NSString *priorityString = [NSString stringWithFormat:@"%ld", item.priorityNumber];
        
        NSAttributedString *strikethroughPriority = [[NSAttributedString alloc] initWithString:priorityString attributes:@{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle)}];
        
        toDoCell.toDoTitle.attributedText = strikethroughTitle;
        toDoCell.preview.attributedText = strikethroughDescription;
        toDoCell.priority.attributedText = strikethroughPriority;
        
    } else {
        toDoCell.preview.text = item.itemDescription;
        toDoCell.toDoTitle.text = item.itemTitle;
        toDoCell.priority.text = [NSString stringWithFormat:@"%ld", item.priorityNumber];
    }

    return toDoCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
