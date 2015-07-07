//
//  ClockObject.h
//  WorldClock
//
//  Created by DungLT on 6/30/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClockObject : NSObject
@property (nonatomic,strong) NSString *nameOfCity;
@property (nonatomic,strong) NSDate *time;
@property (nonatomic,strong) NSString *timeAbbreviation;
@end
