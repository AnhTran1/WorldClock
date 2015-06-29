//
//  AlarmTableViewController.m
//  WorldClock
//
//  Created by DungLT on 6/25/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import "AlarmTableViewController.h"
#import "AlarmObject.h"
#import "AddAlarmTableViewController.h"

@interface AlarmTableViewController ()

- (IBAction)editButton:(id)sender;
@property NSMutableArray *listOfAlarms;

@end

@implementation AlarmTableViewController
- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    AddAlarmTableViewController *source = [segue sourceViewController];
    AlarmObject *item = source.alarmObject;
    if (item != nil) {
        [self.listOfAlarms addObject:item];
        [self.tableView reloadData];
    }
}

- (void)loadInitialData {
    AlarmObject *item1 = [[AlarmObject alloc] init];
    item1.label = @"wakeup";
    item1.timeToSetOff = [NSDate date];
    [self.listOfAlarms addObject:item1];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.listOfAlarms = [[NSMutableArray alloc]init];
//    [self loadInitialData];
//    NSLog(@"%@",self.listOfAlarms);
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editButton:(id)sender{
    [self setEditing: !self.editing animated:YES];
    if ([self.tableView isEditing]) {
        self.editButtonItem.title = @"Done";
    }else {
        self.editButtonItem.title = @"Edit";
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listOfAlarms count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSDateFormatter *dateReader = [[NSDateFormatter alloc]init];
    [dateReader setDateFormat:@"hh:mm a"];
    AlarmObject *alarmObject = [self.listOfAlarms objectAtIndex:indexPath.row];
    NSString *date = [dateReader stringFromDate:alarmObject.timeToSetOff];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    cell.textLabel.text = date;
    cell.detailTextLabel.text = alarmObject.label;
  
    
    return cell;
}
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if ([self.tableView isEditing]) {
        self.editButtonItem.title = @"Done";
    }else {
        self.editButtonItem.title = @"Edit";
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.listOfAlarms removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:YES];
        [tableView reloadData];
    }
}
#pragma mark - UITableView Delegate
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"EditSergue" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"EditSergue"]) {
        AddAlarmTableViewController *controller = (AddAlarmTableViewController *)segue.destinationViewController;
        controller.indexOfAlarmToEdit = [[self.tableView indexPathForSelectedRow]row];
        controller.listOfAlarm = self.listOfAlarms;
        controller.editing = YES;
    }
}
/*

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
