//
//  AddAlarmTableViewController.m
//  WorldClock
//
//  Created by DungLT on 6/26/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import "AddAlarmTableViewController.h"
#import "AlarmObject.h"
#import "AlarmTableViewController.h"

@interface AddAlarmTableViewController ()
//- (IBAction)saveAlarm:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *timeToSetOff;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) IBOutlet UITextField *label;

@end

@implementation AddAlarmTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (self.editing) {
        self.navigationItem.title = @"Edit Alarm";
        AlarmObject *oldAlarmObject = [self.listOfAlarm objectAtIndex:self.indexOfAlarmToEdit];
        self.timeToSetOff.date = oldAlarmObject.timeToSetOff;
        self.label.text = oldAlarmObject.label;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (IBAction)saveAlarm:(id)sender{
//    AlarmObject * newAlarmObject;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSData *alarmListData = [defaults objectForKey:@"AlarmListData"];
//    NSMutableArray *alarmList = [NSKeyedUnarchiver unarchiveObjectWithData:alarmListData];
//    
//    if(!alarmList)
//    {
//        alarmList = [[NSMutableArray alloc]init];
//    }
//
//    newAlarmObject = [[AlarmObject alloc]init];
//    newAlarmObject.timeToSetOff = self.timeToSetOff.date;
//    [self performSegueWithIdentifier:@"AlarmListSegue" sender:self];
//    NSLog(@"%@" , newAlarmObject.timeToSetOff);
//
//    
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender != self.saveButton) return;
    if (self.editing) {
        self.alarmObject = [self.listOfAlarm objectAtIndex:self.indexOfAlarmToEdit];
    }else{
        self.alarmObject = [[AlarmObject alloc]init];
    }
    self.alarmObject.timeToSetOff = self.timeToSetOff.date;
    self.alarmObject.label = self.label.text;
    NSLog(@"%@",self.alarmObject);


}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
