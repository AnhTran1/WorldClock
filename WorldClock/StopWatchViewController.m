//
//  StopWatchViewController.m
//  WorldClock
//
//  Created by DungLT on 7/7/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import "StopWatchViewController.h"

@interface StopWatchViewController ()
@property (strong, nonatomic) IBOutlet UILabel *time;
- (IBAction)startCount:(id)sender;
@property bool running;
@property NSTimeInterval startTime;

@end

@implementation StopWatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTimer {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startCount:(id)sender {
    if (self.running == false) {
        self.running = true;
        self.startTime = [NSDate timeIntervalSinceReferenceDate];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [self updateTime];
    }else{
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        self.running = false;
    }
}

- (void)updateTime{
    if (self.running == false) return;
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsed = currentTime - self.startTime;
    int mins = (int) (elapsed / 60.0);
    elapsed -= mins * 60;
    int secs = (int) (elapsed);
    elapsed -= secs;
    int fraction = elapsed * 10.0;
    self.time.text = [NSString stringWithFormat:@"%u:%02u.%u",mins,secs,fraction];
    [self performSelector:@selector(updateTime) withObject:self afterDelay:0.1];

}
@end
