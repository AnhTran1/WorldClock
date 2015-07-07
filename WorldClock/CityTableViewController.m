//
//  CityTableViewController.m
//  WorldClock
//
//  Created by DungLT on 6/30/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import "CityTableViewController.h"
#import "ClockObject.h"
#import "WorldClockTableViewController.h"

@interface CityTableViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property NSDictionary *dictionary;
@property NSArray *namecity;
@property NSString *timeAbbreviation;
@property NSDictionary *timename;
@end

@implementation CityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"timezones" ofType:@"plist"]];
    self.namecity = self.dictionary.allKeys;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.namecity count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *cityname = [self.namecity objectAtIndex:indexPath.row];
    cell.textLabel.text = cityname;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexOfCity = [[self.tableView indexPathForSelectedRow]row];
    NSLog(@"%ld",(long)self.indexOfCity);
}



#pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if (sender != self.addButton) return;
         self.clockObject = [[ClockObject alloc]init];
         self.clockObject.nameOfCity = [self.namecity objectAtIndex:self.indexOfCity];
         NSLog(@"%@", self.clockObject.nameOfCity);
         self.timename = [self.dictionary objectForKey:[self.namecity objectAtIndex:self.indexOfCity]];
         self.timeAbbreviation = [self.timename objectForKey:@"timezone_abbreviation"];
         self.clockObject.timeAbbreviation = self.timeAbbreviation;
         NSLog(@"%@",self.timeAbbreviation);
     }

@end
