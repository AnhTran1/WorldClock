//
//  WorldClockTableViewController.h
//  WorldClock
//
//  Created by DungLT on 6/25/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockObject.h"
#import "CityTableViewController.h"

@interface WorldClockTableViewController : UITableViewController
@property NSMutableArray *listOfCities;
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
@property ClockObject *clockObject;
@end
