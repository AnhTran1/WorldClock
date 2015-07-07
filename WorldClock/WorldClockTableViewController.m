//
//  WorldClockTableViewController.m
//  WorldClock
//
//  Created by DungLT on 6/25/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import "WorldClockTableViewController.h"
#import "ClockObject.h"
#import "CityTableViewController.h"
#import "SingleTableViewCell.h"

@interface WorldClockTableViewController ()
@property NSDictionary *dictionary;
@property NSArray *namecity;
- (IBAction)editButton:(id)sender;
@property NSDate *timeTitle;
@property NSTimer *timer;

@end

@implementation WorldClockTableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    CityTableViewController *source = [segue sourceViewController];
    ClockObject *item = source.clockObject;
    NSLog(@"%@",item.nameOfCity);

    [self.listOfCities addObject:item];
    NSLog(@"%@",self.listOfCities);
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listOfCities = [[NSMutableArray alloc]init];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self updateClockLabel];
    NSLog(@"%@", self.timeTitle);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateClockLabel) userInfo:nil repeats:YES];
    NSLog(@"%@", self.timeTitle);
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateClockLabel{
    self.timeTitle = [NSDate date];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listOfCities count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SingleTableViewCell"];
    SingleTableViewCell *cell = (SingleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SingleTableViewCell"];
    if (cell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SingleTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    ClockObject *clockObject = [self.listOfCities objectAtIndex:indexPath.row];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:clockObject.timeAbbreviation]];
    dateFormatter.dateFormat = @"hh:mm:ss";
    [self updateClockLabel];
    NSString *timeW = [dateFormatter stringFromDate:self.timeTitle];
    cell.labelTitle.text = timeW;
    cell.labelSubtitle.text = clockObject.nameOfCity;
    if ([self.tableView isEditing]) {
        [cell.contentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    }
//    [cell layoutSubviews];
  
    [self reloadInputViews];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editButton:(id)sender {
    [self setEditing: !self.editing animated:YES];
    if ([self.tableView isEditing]) {
        self.editButtonItem.title = @"Done";
    }else{
        self.editButtonItem.title = @"Edit";
    }
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.isEditing) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.listOfCities removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView reloadData];
    }
}
- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
