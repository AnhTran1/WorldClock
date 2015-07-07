//
//  CityTableViewController.h
//  WorldClock
//
//  Created by DungLT on 6/30/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockObject.h"
@interface CityTableViewController : UITableViewController
@property NSMutableArray *listOfClock;
@property (nonatomic, assign) NSInteger indexOfCity;
@property ClockObject *clockObject;
@end
