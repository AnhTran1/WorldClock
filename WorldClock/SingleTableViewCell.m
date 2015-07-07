//
//  SingleTableViewCell.m
//  WorldClock
//
//  Created by DungLT on 7/3/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import "SingleTableViewCell.h"

@implementation SingleTableViewCell
@synthesize labelTitle;
@synthesize labelSubtitle;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView *subview in self.subviews) {
        for(UIView *subview2 in subview.subviews){
            if ([NSStringFromClass([subview2 class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]) {
                ((UIView*)[subview2.subviews firstObject]).backgroundColor = [UIColor blueColor];
                //YOU FOUND THE VIEW, DO WHATEVER YOU WANT, I JUST RECOLOURED IT
            }
        }
    }
}
- (void)hiddenButtons{
    self.deleteButton.hidden = YES;
}
- (void)showButtons{
    self.deleteButton.hidden = NO;
}

@end
